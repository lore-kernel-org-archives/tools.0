Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6000D566C
	for <tools@linux.kernel.org>; Mon,  6 Mar 2023 18:02:41 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id c18so11526743qte.5
        for <tools@linux.kernel.org>; Mon, 06 Mar 2023 10:02:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678125760;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rN7uYZ4QcEqbO96RtJqrI1JQVu1umhoDI3zhbFefnAY=;
        b=FxkC2mhiqwtj7rdlSnNbOIFzjN65Z4fXvUbp1ny3MePdssD0BECZtlqGVmMhUOpnxJ
         DkEBw5kf6wN3ywyR+nbSIa7no5S5Mu2pGUUdaQb96W4lHqxxEwmKqg7jNCkd0P6MGSmK
         wHlsyRkBKPsjgv5QarAdt+6vIcA45ieIzQfXbO6k3sWfKiTsF6+7XYdbDny1+65hgmLj
         BQauFRBh+IXTLNC8IHKe6aw7AI3Hitc/aeDa8x+2N61/kG2MMqwfUJMCtvpJXPMP1u1v
         BxCN5Fmyg+CaksncnvkXktsPQc2OiULggrbaRgts2vJiQfuu8pK1/cO2cisNQO1PTQea
         p0Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678125760;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rN7uYZ4QcEqbO96RtJqrI1JQVu1umhoDI3zhbFefnAY=;
        b=IWCXINzmbKwXhz69FkNnWzM5wtBTnnLeB4CGAaNy7Jzyz4rmbZ11KZNH3PwGu2xfSM
         Lro5GE7ERbwhdyizRnolPbTe7IK5+anWwwnx+3LIQdDakWbPJXYM8wSfuLUoloJrFiH1
         tQMq/ZX04Z2sv1pwqlNFaIzpg2Hcina5BrC8EJzItS8GlomfmSYHWxzVAsMdk4f0HQFZ
         kb+1QJn0qZ9XY1RR8lwZX792zehnWp2W/M9AWulF08e+VtZyB660MSOj1Z+4qMfVaXMh
         318Kt3c6hy05hBYGoiaoZidU2pO6H9ygGZwu0UaN6Hd+TdtbacG+9R1HeFTrQCaNk07p
         QSeA==
X-Gm-Message-State: AO0yUKVPUVZNxNihVwaqGVeUkbPRCumTkJZswo3vkA3l3e5yz/EBnXuV
	N/gITa+0mCGu7qoT0TcBrxYyKKpFR2s=
X-Google-Smtp-Source: AK7set/ilv3eE/mo8m/SdZsxadkFZjSSc00yTTatp8ZdNCET7rJKmCJ5AD7cTgvc6XZG/0lgg++vGQ==
X-Received: by 2002:a05:622a:55:b0:3b8:6555:342c with SMTP id y21-20020a05622a005500b003b86555342cmr21432883qtw.11.1678125760355;
        Mon, 06 Mar 2023 10:02:40 -0800 (PST)
Received: from WQUEN758573.ncr.int.ec.gc.ca (ecodor132.cmc.ec.gc.ca. [205.211.133.132])
        by smtp.gmail.com with ESMTPSA id d24-20020ac800d8000000b003bfaf01af24sm8050763qtg.46.2023.03.06.10.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 10:02:40 -0800 (PST)
From: Philippe Blain <levraiphilippeblain@gmail.com>
Date: Mon, 06 Mar 2023 13:02:12 -0500
Subject: [PATCH v2 4/4] ez: let ENROLL_BASE default to '@{upstream}'
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230219-allow-remote-branches-as-base-v2-4-8db83bda1403@gmail.com>
References: <20230219-allow-remote-branches-as-base-v2-0-8db83bda1403@gmail.com>
In-Reply-To: <20230219-allow-remote-branches-as-base-v2-0-8db83bda1403@gmail.com>
To: "Kernel.org Tools" <tools@linux.kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.13-dev-10ee4

It is a common worflow to set 'branch.<name>.merge' and
'branch.<name>.remote' to the remote-tracking branch that corresponds to
the default branch of the canonical repository of the project (say
'upstream/master'), such that 'git rebase -i' automatically "does the
right thing" and rebases only the commits in your feature branch that
are not reachable from 'upstream/master'. The revision syntax
'@{upstream}' (short: '@{u}') can be used to denote the configured
upstream branch of the current branch.

Support that workflow better by allowing the 'ENROLL_BASE' argument to
'b4 prep --enroll' to be ommitted and default to @{upstream}.

To avoid a RuntimeError when enroll_base is @{upstream} (either from the
default or because it was given litterally on the command line) and the
current branch has no configured upstream, add some error-checking to
the 'git rev-parse --verify --abbrev-ref' invocation along with a clear
message. Let other error situations be handled by the second 'git
rev-parse --verify' invocation later on.
---
 b4/command.py | 4 ++--
 b4/ez.py      | 6 +++++-
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/b4/command.py b/b4/command.py
index e7656a5..1ae73d2 100644
--- a/b4/command.py
+++ b/b4/command.py
@@ -290,8 +290,8 @@ def setup_parser() -> argparse.ArgumentParser:
     ag_prepn.add_argument('-F', '--from-thread', metavar='MSGID', dest='msgid',
                           help='When creating a new branch, use this thread')
     ag_prepe = sp_prep.add_argument_group('Enroll existing branch', 'Enroll existing branch for prep work')
-    ag_prepe.add_argument('-e', '--enroll', dest='enroll_base',
-                          help='Enroll current branch, using the passed tag, branch, or commit as fork base')
+    ag_prepe.add_argument('-e', '--enroll', dest='enroll_base', nargs='?', const='@{upstream}',
+                          help='Enroll current branch, using its configured upstream branch as fork base, or the passed tag, branch, or commit')
     sp_prep.set_defaults(func=cmd_prep)
 
     # b4 trailers
diff --git a/b4/ez.py b/b4/ez.py
index 53a4b2f..0a2936a 100644
--- a/b4/ez.py
+++ b/b4/ez.py
@@ -373,7 +373,11 @@ def start_new_series(cmdargs: argparse.Namespace) -> None:
         # Convert @{upstream}, @{push} to an abbreviated ref
         gitargs = ['rev-parse', '--abbrev-ref', '--verify', enroll_base]
         ecode, out = b4.git_run_command(None, gitargs)
-        if out:
+        if ecode > 0:
+            if enroll_base == '@{upstream}' or enroll_base == '@{u}':
+                logger.critical('CRITICAL: current branch has no configured upstream')
+                sys.exit(1)
+        elif out:
             enroll_base = out.strip()
         # Is it a branch?
         gitargs = ['show-ref', f'refs/heads/{enroll_base}', f'refs/remotes/{enroll_base}']

-- 
2.34.1

