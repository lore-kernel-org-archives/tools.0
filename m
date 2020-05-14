Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 by mx.groups.io with SMTP id smtpd.web10.7042.1589434413227623760
 for <tools@linux.kernel.org>;
 Wed, 13 May 2020 22:33:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ellerman.id.au header.s=201909 header.b=dxeGglFU;
 spf=pass (domain: ozlabs.org, ip: 203.11.71.1, mailfrom: michael@ozlabs.org)
Received: by ozlabs.org (Postfix, from userid 1034)
	id 49N0ZK2wMHz9sSd; Thu, 14 May 2020 15:33:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
	s=201909; t=1589434409;
	bh=EioDRGEcsE4RddKuTWWG8En/APiS9Ajh/RAqAU7sIt4=;
	h=From:To:Subject:Date:From;
	b=dxeGglFUm2wj2VZKvJXmFZO1efU8MIPigRpFLEy0G4Fr0JV2yiiTG1Qe7cCHpeRSD
	 zMYu9HY8qBAzp0xBT+6tcWB+5VGl48gewpUKfdmeMJAF8vN2/2dMe9Y839pCsOoYsr
	 ofSsYFRF/MEo7MDSjllYV6E9mjWu9qkKWGFqjav5Lo6A9L7BZgdbbdyQOP/jph1e5z
	 VRGB3GPUEkCVp80ottSPhu5mmrhq0VV5W+FXkbjqD1DKiZbwH8IQBcSmxmlgfcedID
	 V8LPGjYOxISnJzRHtb1ZlqFE/RFOL81QSH4p0XEPMt31RrjTQ7weXNOsNFTrp2fs6o
	 le/gqmUSwSohQ==
From: "Michael Ellerman" <mpe@ellerman.id.au>
To: tools@linux.kernel.org
Subject: [RFC PATCH] Add --dry-run (-n) option to b4 ty
Date: Thu, 14 May 2020 15:30:58 +1000
Message-Id: <20200514053058.3676830-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Currently `b4 ty -a` generates the thanks messages and also archives
the metadata for the associated commits (by renaming them to x.sent).

This means you can't run `b4 ty -a` just to see what it will do.

Although `b4 ty -l` exists, that only shows which series b4 knows
about, it doesn't show which commits b4 is able to match and generate
thanks for.

So add a --dry-run (-n) option that does everything except archive the
metadata, which allows a user to see what `b4 ty -a` can match and the
thanks that are generated without committing to sending.
---
 b4/command.py |  2 ++
 b4/ty.py      | 15 +++++++++------
 2 files changed, 11 insertions(+), 6 deletions(-)


This is RFC because I'm not sure if the plan is to eventually have b4 act=
ually
invoke git send email (optionally), etc, and if so how this would interac=
t with
that.

Another option would be to have `-a` behave like a dry run unless `-s` is=
 also
specified, but that would be a backward incompatible UI change.

cheers

diff --git a/b4/command.py b/b4/command.py
index 6d516a3..1e120bf 100644
--- a/b4/command.py
+++ b/b4/command.py
@@ -160,6 +160,8 @@ logger =3D b4.logger
                        help=3D'The branch to check against, instead of c=
urrent')
     sp_ty.add_argument('--since', default=3D'1.week',
                        help=3D'The --since option to use when auto-match=
ing patches (default=3D1.week)')
+    sp_ty.add_argument('-n', '--dry-run', action=3D'store_true', dest=3D=
'dry_run', default=3DFalse,
+                       help=3D"Dry run, don't actually send or update b4=
 state.")
     sp_ty.set_defaults(func=3Dcmd_ty)
=20
     cmdargs =3D parser.parse_args()
diff --git a/b4/ty.py b/b4/ty.py
index 44f4451..9c9c35e 100644
--- a/b4/ty.py
+++ b/b4/ty.py
@@ -381,11 +381,11 @@ BRANCH_INFO =3D None
         sys.exit(0)
=20
     logger.info('---')
-    send_messages(applied, cmdargs.gitdir, cmdargs.outdir, wantbranch, s=
ince=3Dcmdargs.since)
+    send_messages(applied, cmdargs.gitdir, cmdargs.outdir, wantbranch, c=
mdargs.dry_run, since=3Dcmdargs.since)
     sys.exit(0)
=20
=20
-def send_messages(listing, gitdir, outdir, branch, since=3D'1.week'):
+def send_messages(listing, gitdir, outdir, branch, dry_run, since=3D'1.w=
eek'):
     # Not really sending, but writing them out to be sent on your own
     # We'll probably gain ability to send these once the feature is
     # more mature and we're less likely to mess things up
@@ -434,9 +434,12 @@ BRANCH_INFO =3D None
         bout =3D msg.as_string(policy=3Db4.emlpolicy)
         with open(outfile, 'wb') as fh:
             fh.write(bout.encode('utf-8'))
-        logger.debug('Cleaning up: %s', jsondata['trackfile'])
-        fullpath =3D os.path.join(datadir, jsondata['trackfile'])
-        os.rename(fullpath, '%s.sent' % fullpath)
+
+        if not dry_run:
+            logger.debug('Cleaning up: %s', jsondata['trackfile'])
+            fullpath =3D os.path.join(datadir, jsondata['trackfile'])
+            os.rename(fullpath, '%s.sent' % fullpath)
+
     logger.info('---')
     if not outgoing:
         logger.info('No thanks necessary.')
@@ -505,7 +508,7 @@ BRANCH_INFO =3D None
         sys.exit(0)
=20
     wantbranch =3D get_wanted_branch(cmdargs)
-    send_messages(listing, cmdargs.gitdir, cmdargs.outdir, wantbranch, c=
mdargs.since)
+    send_messages(listing, cmdargs.gitdir, cmdargs.outdir, wantbranch, c=
mdargs.dry_run, cmdargs.since)
     sys.exit(0)
=20
=20
--=20
2.25.1

