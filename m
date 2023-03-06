Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89DF65688
	for <tools@linux.kernel.org>; Mon,  6 Mar 2023 18:02:40 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id y10so11555324qtj.2
        for <tools@linux.kernel.org>; Mon, 06 Mar 2023 10:02:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678125759;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BNeuD7CgzJcQRuKPhk+GTp/R3+BoF07Vo2yOIrBMYFE=;
        b=c4MxINkbmhEySSbFRKFs3OSDyS222OehhN5Tuw2zyNONuuJcsB99wh4NKgWcFGcfik
         tmh5Xy66vaINHdtvk5lmbzB8fVM1DBFuiYn0f5wt51AR/4+CQ61JsuLeIzV/mv6KqxCv
         GdZ8CWVmTL1PnrMEg2XjQCeEQYOhZxjo1/DTYYLrkAJyDWGtQIsQYpvr8ZW1+0riqSbe
         gQskevZP4lAzXMntvsQ8Q5KS9gFsVE1kIN4kt83a8prWuA3eLaVLpLMFRNhPNLH1etn+
         syejStuOV0JCuUydj5utFs0h4xoMgbQW3Psn20lfmT//LpHlkq5v4lIWsygXjUjlTzqi
         xBsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678125759;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BNeuD7CgzJcQRuKPhk+GTp/R3+BoF07Vo2yOIrBMYFE=;
        b=4KT5xb4tTwl9kCbybBUuY26V4R8CYjVdRx+LbyvbCKvGIa3IxJ5SdP649vPcArwDqM
         eWgKNCBEsKE4rMVkTdKvghMMQduaC1WIirOAPakg9FmHdZl3SJpZzxaJjlc0Bn6t79/T
         2531pU4RaSGYfEBtuJwiM/VbscAvNq4IYyVNfpSZx5MgEYCHubB7xjMH/95ss7l8i9HJ
         FfOao5HL6vnHw5CBzgI1L5Smkgf9un4uoyJYCzT+LDQse5A/lpuJL9h1uF7qf9yjEAjD
         mwqDEHxXLK+7Rnrr8e5yhRpSTcBsRdC9K9hgnZrRu/Uy8BS+YIjzaDf8xAM/t8vyRtlz
         ZIsQ==
X-Gm-Message-State: AO0yUKXxMEU5gKfW7oC2kNSy2lqtt4XwSovOcOVVYt9tDiqsFPeVSECm
	nZkYh1c4SbwM9Gwwu3w1RXc=
X-Google-Smtp-Source: AK7set9tRZ/whvpUk1BLIK57gwW9yRC+gtbYoBjQ3gDGHjN8n2du19evcxYbqQTaXTY5p4t2F6y17g==
X-Received: by 2002:ac8:57c4:0:b0:3bd:1a07:2086 with SMTP id w4-20020ac857c4000000b003bd1a072086mr21531943qta.36.1678125759480;
        Mon, 06 Mar 2023 10:02:39 -0800 (PST)
Received: from WQUEN758573.ncr.int.ec.gc.ca (ecodor132.cmc.ec.gc.ca. [205.211.133.132])
        by smtp.gmail.com with ESMTPSA id d24-20020ac800d8000000b003bfaf01af24sm8050763qtg.46.2023.03.06.10.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 10:02:39 -0800 (PST)
From: Philippe Blain <levraiphilippeblain@gmail.com>
Date: Mon, 06 Mar 2023 13:02:11 -0500
Subject: [PATCH v2 3/4] ez: allow '@{upstream}' as ENROLL_BASE
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230219-allow-remote-branches-as-base-v2-3-8db83bda1403@gmail.com>
References: <20230219-allow-remote-branches-as-base-v2-0-8db83bda1403@gmail.com>
In-Reply-To: <20230219-allow-remote-branches-as-base-v2-0-8db83bda1403@gmail.com>
To: "Kernel.org Tools" <tools@linux.kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.13-dev-10ee4

Invoking 'b4 prep --enroll @{u}' (or @{upstream}) does not work reliably
with the current code. In 'start_new_series', we take the code path that
checks on which branch the object given as ENROLL_BASE lives using 'git
branch --all --contains', so if multiple local branches build on top of
the current branch's upstream branch, they are all listed by this
invocation of 'git branch' and so we error with 'CRITICAL: Multiple
branches contain object @{u}, please pass a branch name as base'.

Fix that by invoking 'git rev-parse --abbrev-ref --verify ENROLL_BASE'
before the 'git show-branch' invocation. That command will convert @{u},
@{upstream} and @{push} [1-2] to an abbreviated ref like
'upstream/master'. If the given revision exist but can't be directly
converted to an abbreviated ref, the command will succeed and not output
anything, so only change ENROLL_BASE when we actually get an output. We
avoid checking the error code as we already invoke 'git rev-parse
--verify' later on to check if the object exists. We could use
'git_get_command_lines' instead, but we will check the error code in a
subsequent commit, so it makes more sense to use 'git_run_command'.

While at it, fix a "CRITICAL" error message that was missing a value for
the '%s' string formatting operator.

[1] https://git-scm.com/docs/gitrevisions#Documentation/gitrevisions.txt-emltbranchnamegtupstreamemegemmasterupstreamememuem
[2] https://git-scm.com/docs/gitrevisions#Documentation/gitrevisions.txt-emltbranchnamegtpushemegemmasterpushemempushem
---
 b4/ez.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/b4/ez.py b/b4/ez.py
index ce080f1..53a4b2f 100644
--- a/b4/ez.py
+++ b/b4/ez.py
@@ -370,6 +370,11 @@ def start_new_series(cmdargs: argparse.Namespace) -> None:
         seriesname = branchname
         slug = re.sub(r'\W+', '-', branchname).strip('-').lower()
         enroll_base = cmdargs.enroll_base
+        # Convert @{upstream}, @{push} to an abbreviated ref
+        gitargs = ['rev-parse', '--abbrev-ref', '--verify', enroll_base]
+        ecode, out = b4.git_run_command(None, gitargs)
+        if out:
+            enroll_base = out.strip()
         # Is it a branch?
         gitargs = ['show-ref', f'refs/heads/{enroll_base}', f'refs/remotes/{enroll_base}']
         lines = b4.git_get_command_lines(None, gitargs)
@@ -377,7 +382,7 @@ def start_new_series(cmdargs: argparse.Namespace) -> None:
             try:
                 forkpoint = get_base_forkpoint(enroll_base, mybranch)
             except RuntimeError as ex:
-                logger.critical('CRITICAL: could not use %s as enrollment base:')
+                logger.critical('CRITICAL: could not use %s as enrollment base:', enroll_base)
                 logger.critical('          %s', ex)
                 sys.exit(1)
             basebranch = enroll_base

-- 
2.34.1

