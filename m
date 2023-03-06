Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D648566C
	for <tools@linux.kernel.org>; Mon,  6 Mar 2023 18:02:39 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id c18so11526614qte.5
        for <tools@linux.kernel.org>; Mon, 06 Mar 2023 10:02:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678125758;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rXu+MAsRRE9/p4gzb8HwkzuzB02SQex4yHqgduUiRyU=;
        b=Zvy4SOEKxixnA7nVW4QaEApU3FX4Npe+Zoc3kxLl77yMSqZIi132USDu1IHa/8NO5S
         SQP9O67O9u5nYh6gzUhjkxwXgM+BbJlPOOXCKGY/QOd0qrjMNtt58v7HlJJuviQeEMBp
         /F+X1mZMmse4Em4J35SNNEq2xkludN6wfGVnKInOVgpqq+TmOsvV8JfI3rI7uR7XZGU8
         JDw/N7DrPn5iGzisFgdbGwnvDuPqls2vBUH5Qiwqx41rZfnsAV0Bts2275+/8t36mTj+
         t2VObHHdGhSGdWoK0/GI7Plyk3qcrv/i3jRl+Hu5KkYWUqXn6d9G8PfMwnlABXmtXA08
         LNSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678125758;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rXu+MAsRRE9/p4gzb8HwkzuzB02SQex4yHqgduUiRyU=;
        b=2uYA91jxAnpqGKH5oF+MuJ82PRO/tbawHY8WqzZrfIPSzLUPk8wddKHnOMqNKMVlMA
         8p/23ZSHjqKEaJ9b+5cmfRfMrS4es0QD2aO3U15KzBSuX0e9l0T4grqnwvPOVm1QjEVy
         cakBoyQvcvz6Oikhpum0DRy1Zkj6wDrexUElTlvZqxQJ141K4JUZpTK33AKx7xz89+C8
         nvVH/52vT39em2tTxNSCDyy4Hxv/IkEqlLWoHd22UJGNMLHJSrzW4aTT4q6XcYHnMpaX
         /srY9BAKIKV4JfMeXupbFvCf5GW7YKS3Zzt9TI7+k0FjsOlA6Zip4Nsi8rhpNbpoyjXj
         jUiA==
X-Gm-Message-State: AO0yUKXP0TW1LCc7ZgsMyn2dsJCvcMG6itkmpDQrNlDHX733Rk5o48hf
	7drQ7MxsDDFSY3i4sOSiuA+LkAk9s8c=
X-Google-Smtp-Source: AK7set+DAyiapFzxQwkHnRIGDeAvx7/kF+4VOmlKZ84RNA9RgsrVFzwG/vZP67foBclkkBXsuSrhYQ==
X-Received: by 2002:a05:622a:34a:b0:3bf:d258:c151 with SMTP id r10-20020a05622a034a00b003bfd258c151mr21654670qtw.12.1678125758419;
        Mon, 06 Mar 2023 10:02:38 -0800 (PST)
Received: from WQUEN758573.ncr.int.ec.gc.ca (ecodor132.cmc.ec.gc.ca. [205.211.133.132])
        by smtp.gmail.com with ESMTPSA id d24-20020ac800d8000000b003bfaf01af24sm8050763qtg.46.2023.03.06.10.02.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 10:02:38 -0800 (PST)
From: Philippe Blain <levraiphilippeblain@gmail.com>
Date: Mon, 06 Mar 2023 13:02:10 -0500
Subject: [PATCH v2 2/4] ez: also check remote-tracking branches when
 ENROLL_BASE is not a branch
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230219-allow-remote-branches-as-base-v2-2-8db83bda1403@gmail.com>
References: <20230219-allow-remote-branches-as-base-v2-0-8db83bda1403@gmail.com>
In-Reply-To: <20230219-allow-remote-branches-as-base-v2-0-8db83bda1403@gmail.com>
To: "Kernel.org Tools" <tools@linux.kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.13-dev-10ee4

When invoking 'b4 prep --enroll ENROLL_BASE' with a revision ENROLL_BASE
that does not correspond to a branch, ez.py::start_new_series tries to
find branches where the commit corresponding to the given revision is
found. If there is only one such branch, it is used as the
'base-branch'.

The function 'git_branch_contains' used to find where the commit lives
invokes 'git branch --contains', so only local branches are checked.
This means that if the given revision corresponds to a remote-tracking
branch, git_branch_contains won't recognize it and we will hit:

    CRITICAL: No other branch contains %s: cannot use as fork base

Ensure that remote-tracking branches are also checked by adding an
optional 'checkall' argument to 'git_branch_contains', that in turns
adds a '--all' argument to the 'git branch' invocation, such that both
local and remote-tracking branches are checked. Add that argument to the
call in 'start_new_series'.

An alternative would be to unconditionnally invoke 'git branch' with
'--all' in 'git_branch_contains', but this function is also called in
pr.py::main and ty.py::auto_locate_pr to check if the tip commit of the
given pull requests already exists in a local branch, and it seems safer
to not change behaviour for these two functions.
---
 b4/__init__.py | 4 +++-
 b4/ez.py       | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/b4/__init__.py b/b4/__init__.py
index 3138f3c..78418c1 100644
--- a/b4/__init__.py
+++ b/b4/__init__.py
@@ -2986,8 +2986,10 @@ def git_revparse_tag(gitdir: Optional[str], tagname: str) -> Optional[str]:
     return out.strip()
 
 
-def git_branch_contains(gitdir: Optional[str], commit_id: str) -> List[str]:
+def git_branch_contains(gitdir: Optional[str], commit_id: str, checkall: bool = False) -> List[str]:
     gitargs = ['branch', '--format=%(refname:short)', '--contains', commit_id]
+    if checkall:
+        gitargs.append('--all')
     lines = git_get_command_lines(gitdir, gitargs)
     return lines
 
diff --git a/b4/ez.py b/b4/ez.py
index c3b0237..ce080f1 100644
--- a/b4/ez.py
+++ b/b4/ez.py
@@ -390,7 +390,7 @@ def start_new_series(cmdargs: argparse.Namespace) -> None:
                 raise RuntimeError('Object %s not found' % enroll_base)
             forkpoint = out.strip()
             # check branches where this object lives
-            heads = b4.git_branch_contains(None, forkpoint)
+            heads = b4.git_branch_contains(None, forkpoint, checkall=True)
             if mybranch not in heads:
                 logger.critical('CRITICAL: object %s does not exist on current branch', enroll_base)
                 sys.exit(1)

-- 
2.34.1

