Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C07121D5F
	for <tools@linux.kernel.org>; Thu,  3 Aug 2023 22:45:55 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-56cf9a86277so16007507b3.3
        for <tools@linux.kernel.org>; Thu, 03 Aug 2023 15:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691102755; x=1691707555;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SsSrNl5awzVOXuTd+kpQuo9hutGdzkx1rv5OofmQm6w=;
        b=flOp8bHhojl3CML9lpVbaLJQHOfK58XYUiedGZD9rwPFGQQVuXQ65GfRjxzHAJ8tGe
         IgE01HqXDhT/8Wc0eUtMPw/7/FsyFmyEtXyUGpnFZLF6SA6OMTkHrRhZBDSZO7RndLBO
         TZJQEZcsxVltWWO5m6DI2bRlD+hsU4hbPzx+rf/Kwsy0Nxd0D2hLDdpQKGObsqOA2Bte
         qMjaPSJKCfeEv6Z7W6Yz+wnMgMDyHqh/bZhvrih0KajmueF8Y4A5MQ/C0wj3/OBciJjN
         0TdIPjXDyidcnB3YUgyp0983PyRmKlApReeIGLFF7vruISr/Ic9fcht61KIZ5G/aGPaZ
         8nEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691102755; x=1691707555;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SsSrNl5awzVOXuTd+kpQuo9hutGdzkx1rv5OofmQm6w=;
        b=EjQ5wT4dW+G3H+e3gRB+VwKqyBRpERQzdkiuuIROIzUDuzHpaRoXbRuHSZ6kG0u3ZZ
         qps28uy1u06EdCtx/lrndze7mtxA/R/xIN7nvTizVUSkXpbuA8lDFWztz8gfx1WPYIPN
         5Y1Px9SidZw/RwzuZpR8Km2yPjLBYGbMdBlEQHv6oCzJpCTR5Y/SRSz17fe8xSb7R6ed
         GOOfTtoqAWBOBfp8Ss6MqPFZ/bsgN9xnNcqSuuP+PfA5U6FbDdP2KWuyODSdIHhoe470
         mBVwO7uJxTCB358Yh5DkAIt3BUqWLDKyoKE509ry0OtHD6fRbM8plFOtIDk+epPZw+GK
         rtEQ==
X-Gm-Message-State: ABy/qLYkovsDSSD+uootavwvwMK19XY/1XgYcGr4jkpfQ2v7Cjpr3coy
	b4rurYRAzD/aPo2viZbP/oHmbiqb0idpytVREwYj8U7rzhSeyyc1YwaKdmZnKzL3VOyQ2rhzEHj
	Bgkv/YJkMftIaMs+XgZAdctq19aXebi9yOYWmBAzEM3K9Jl9mam5FFCyD6LEX+f7JlNTp3/FmSC
	M=
X-Google-Smtp-Source: APBJJlGTTqMr4wNFWhECUOC9mjZ11fgFdTndyUNEK/y7QuZh4xEBFn5vERk6s6cIyV06q9MddVJgce3+OZerp0ymBg==
X-Received: from jstitt-linux1.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a05:690c:711:b0:583:591d:3d6c with
 SMTP id bs17-20020a05690c071100b00583591d3d6cmr212861ywb.0.1691102754713;
 Thu, 03 Aug 2023 15:45:54 -0700 (PDT)
Date: Thu, 03 Aug 2023 22:45:53 +0000
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIACAuzGQC/x3MTQqAIBBA4avIrBP8C6KrRAsdpxyCCo0IwrsnL
 b/Fey8UykwFRvFCppsLH3uD7gRg8vtKkmMzGGWsGpSVPkaJiXA7/YVJ6oDW926xIWho0Zlp4ec fThAczLV+8ZuJp2QAAAA=
X-Developer-Key: i=justinstitt@google.com; a=ed25519; pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691102754; l=3745;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=u9Ra+pkOVPYJF7bv+2H53yIfzIbZgP3Ysv+7uk6Ugys=; b=wVGn9r3z6dAdb3KfNK8WJSsTWIUgxzNQ2zdOw60WPn+IZrbofHbcqB4tnXGmuLrx1mlfzYy3Q
 5UD6JdmUH/aDP+3NaGnDG+yalZ6qyjmRg56Z/Ph4MY8kphm/wce2wJ1
X-Mailer: b4 0.12.3
Message-ID: <20230803-add-checkpatch-v1-1-2952aee9e2a8@google.com>
Subject: [PATCH b4] b4: add checkpatch via prep --check
From: Justin Stitt <justinstitt@google.com>
To: "Kernel.org Tools" <tools@linux.kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="utf-8"

This patch adds support for the following incantation:

`$ b4 prep --check`

Which will invoke `./scripts/checkpatch.pl` on your entire series. Fails
gracefully if not in a Linux source tree.

I am using `subprocess.run` to invoke `checkpatch`. I'm letting the
stdout go straight to the user without piping or capturing.

Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
To: "Kernel.org Tools" <tools@linux.kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
---
 b4/command.py |  6 ++++++
 b4/ez.py      | 32 +++++++++++++++++++++++++++++++-
 2 files changed, 37 insertions(+), 1 deletion(-)

diff --git a/b4/command.py b/b4/command.py
index 71c1abd..8aa84a2 100644
--- a/b4/command.py
+++ b/b4/command.py
@@ -283,6 +283,12 @@ def setup_parser() -> argparse.ArgumentParser:
                        help='Show series info in a format that can be passed to other commands.')
     spp_g.add_argument('--cleanup', metavar='BRANCHNAME', nargs='?', const='_show',
                        help='Archive and remove a prep-tracked branch and all its sent/ tags')
+    spp_g.add_argument(
+        "--check",
+        action="store_true",
+        default=False,
+        help="Run ./scripts/checkpatch.pl on your entire patch series",
+    )
 
     ag_prepn = sp_prep.add_argument_group('Create new branch', 'Create a new branch for working on patch series')
     ag_prepn.add_argument('-n', '--new', dest='new_series_name',
diff --git a/b4/ez.py b/b4/ez.py
index bbaa807..a9e0fc2 100644
--- a/b4/ez.py
+++ b/b4/ez.py
@@ -26,9 +26,10 @@ import gzip
 import io
 import tarfile
 
-from typing import Optional, Tuple, List, Union
 from email import utils
+from typing import Optional, Tuple, List, Union
 from string import Template
+from pathlib import Path
 
 try:
     import patatt
@@ -2157,6 +2158,30 @@ def set_prefixes(prefixes: list) -> None:
         logger.info('No changes to extra prefixes.')
 
 
+def checkpatch() -> int:
+    """
+    Invoke ./scripts/checkpatch.pl if it is available.
+    Only consider the current working directory.
+    Return True if patch is all good, False otherwise.
+    """
+    from subprocess import run
+
+    checkpath_pl_path = Path("./scripts/checkpatch.pl")
+    if not checkpath_pl_path.exists():
+        logger.critical(f'CRITICAL: no {checkpath_pl_path} found.')
+        logger.critical(f'          Navigate to Linux source tree.')
+        sys.exit(1)
+
+    start = get_series_start()
+    end = 'HEAD'
+    cover_commit = find_cover_commit()
+    patches = b4.git_range_to_patches(None, start, end, ignore_commits={cover_commit})
+    command = ['./scripts/checkpatch.pl', '--git'] + [x[0] for x in patches]
+
+    result = run(command)
+
+    return result.returncode
+
 def cmd_prep(cmdargs: argparse.Namespace) -> None:
     check_can_gfr()
     status = b4.git_get_repo_status()
@@ -2165,6 +2190,11 @@ def cmd_prep(cmdargs: argparse.Namespace) -> None:
         logger.critical('          Stash or commit them first.')
         sys.exit(1)
 
+    if cmdargs.check:
+        checkpatch_return_code = checkpatch()
+        logger.info(f"checkpatch return code: {checkpatch_return_code}")
+        return # nothing else needs to happen after a checkpatch call
+
     if cmdargs.reroll:
         msgid = cmdargs.reroll
         msgs = b4.get_pi_thread_by_msgid(msgid, onlymsgids={msgid}, nocache=True)

---
base-commit: 8382882b9fb6c50737b6e19198a259850527d2a6
change-id: 20230803-add-checkpatch-1bc3a54f3bb1

Best regards,
--
Justin Stitt <justinstitt@google.com>

