Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 by mx.groups.io with SMTP id smtpd.web12.6166.1589428011906140908
 for <tools@linux.kernel.org>;
 Wed, 13 May 2020 20:46:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ellerman.id.au header.s=201909 header.b=oMTsAu+S;
 spf=pass (domain: ozlabs.org, ip: 203.11.71.1, mailfrom: michael@ozlabs.org)
Received: by ozlabs.org (Postfix, from userid 1034)
	id 49MyCC6yhhz9sSr; Thu, 14 May 2020 13:46:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
	s=201909; t=1589428007;
	bh=clcpraDrGFC0YV1X/U9iq4xdhx+9H4Xd7bSqXZ4R8+M=;
	h=From:To:Subject:Date:From;
	b=oMTsAu+SbEArRUUaS6VcLrgIl3uhZ84G9JRWMP3qRuXLLsHY4WRxKP/KJbTrErWBe
	 yjql5Lzv7Msv7qmRT/8gbPR0WhS/Twv+9YX0AmzhjfZJcuSbDbb4XGQ4iro1A6q2zi
	 1yZOHmwFyxXfU9WQnPhk3cqSrYu4nf0WiWOsQuqR//lYg4t5d+w/Q83e9Epw4CoXgI
	 MiTR4133f/63mtx/7o/eG2NAYX5xbgu86rCIkM3tFOU5SJcyaGIhAtrstCecD+Iau4
	 S+2xll7vL2NNjBeX2a6/hNOspcBoEIRKxlO+BP6F1JKK2bHrFJmxO14Dlg62G/25st
	 4eGO8DJPLGvAA==
From: "Michael Ellerman" <mpe@ellerman.id.au>
To: tools@linux.kernel.org
Subject: [PATCH] Allow a custom name/from when sending thanks
Date: Thu, 14 May 2020 13:46:40 +1000
Message-Id: <20200514034640.3666399-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Add config options "thanks-from-name" and "thanks-from-email" that
allow setting a custom name and/or from address when sending thanks.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 b4/ty.py     | 11 ++++++++---
 man/b4.5.rst |  4 ++++
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/b4/ty.py b/b4/ty.py
index 4271986..44f4451 100644
--- a/b4/ty.py
+++ b/b4/ty.py
@@ -396,13 +396,18 @@ BRANCH_INFO =3D None
         os.mkdir(outdir)
=20
     usercfg =3D b4.get_user_config()
+    config =3D b4.get_main_config()
+    user_name =3D config.get('thanks-from-name', usercfg['name'])
+    user_email =3D config.get('thanks-from-email', usercfg['email'])
+
     # Do we have a .signature file?
     sigfile =3D os.path.join(str(Path.home()), '.signature')
     if os.path.exists(sigfile):
         with open(sigfile, 'r', encoding=3D'utf-8') as fh:
             signature =3D fh.read()
     else:
-        signature =3D '%s <%s>' % (usercfg['name'], usercfg['email'])
+        signature =3D '%s <%s>' % (user_name, user_email)
+
=20
     outgoing =3D 0
     for jsondata in listing:
@@ -410,8 +415,8 @@ BRANCH_INFO =3D None
         slug_subj =3D re.sub(r'\W', '_', jsondata['subject'])
         slug =3D '%s_%s' % (slug_from.lower(), slug_subj.lower())
         slug =3D re.sub(r'_+', '_', slug)
-        jsondata['myname'] =3D usercfg['name']
-        jsondata['myemail'] =3D usercfg['email']
+        jsondata['myname'] =3D user_name
+        jsondata['myemail'] =3D user_email
         jsondata['signature'] =3D signature
         if 'pr_commit_id' in jsondata:
             # This is a pull request
diff --git a/man/b4.5.rst b/man/b4.5.rst
index b44dc96..d1972b9 100644
--- a/man/b4.5.rst
+++ b/man/b4.5.rst
@@ -236,6 +236,10 @@ either the toplevel $HOME/.gitconfig file, or in a p=
er-repository
       thanks-pr-template =3D None
       # See thanks-am-template.example. If not set, a default template w=
ill be used.
       thanks-am-template =3D None
+      # An optional custom from name for sending thanks
+      # thanks-from-name =3D Project Foo Thanks Bot
+      # An optional custom from email for sending thanks
+      # thanks-from-email =3D thanks-bot@foo.org
=20
=20
 SUPPORT
--=20
2.25.1

