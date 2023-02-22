Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A30D71107
	for <tools@linux.kernel.org>; Wed, 22 Feb 2023 01:07:59 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id k20so3145305qtj.5
        for <tools@linux.kernel.org>; Tue, 21 Feb 2023 17:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HTWcAHrZxEPC2mq7vZOGEqZXrWS96JBrG69+IX6mxVg=;
        b=qGHwtwRyxLiqcotbVpYKFUHYw8eDnByYWz1Yy7oK5BJXlMlW81JtjrKFi4UMGRFXGG
         RK532LQ+r8MfhZWRrSvnD7GaZFsl6r4r7Af/4UexBPTmb73sin1NldMlkti/mY/R3hZm
         v92WLuDUkAJwWG3/t1SQzUYsGxYbnhpjF9jD8sIkDNFm0hLVtfpyFac8wZhong1Av68K
         m+ZLsjg35s5qeSwYmMmAHagMpJe2gEJ6YKXTCmyPqEA/ZvIvEN8eXImzv9ckuKftgcCO
         At7neYkAbX7hKts3sP+1M5Mps8Rys9pm5ELSpoNWMhVvgdwBt1RK6yory8sFcWTFTlcC
         +Ldg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HTWcAHrZxEPC2mq7vZOGEqZXrWS96JBrG69+IX6mxVg=;
        b=NRCM6J7qSrHcUDBFLF7dVT7H4ZjPIMHuGDVfGNE3aESoFoWxJhJOU7GxSd28JUK0NF
         tU7gBwzWkhKvYmQY576iUo47Xd/JnbF6ozd1k97Ed7RcLgqtjK/rhbXAgoUCbq84V4w+
         eMIjIGP2eEpfZOVHY3Hj2XHzhGcVmcYVnh4v/8b5JwHD0MNFaokBtJLSK6WlxItK2Qq8
         HF637mnTj5DvMIbbZQ2kdmo+pVzbjcIsm9aPMOK4aphXmQaYzoakIqQjQDdWq3KDqKsX
         VjqNTrtZUxOGoQlGlB+MmYSWyh54z+Ch2NZDoWZY22kVVtzeopTgceMtW9+5lDGQ/KLH
         O9Tg==
X-Gm-Message-State: AO0yUKVW7cdEel4T1nfda8+kiamm8lEVxToSjXP+XRTMc2c8EYSI5FE8
	PJLaMT2SZNNvPXkj3Rxs+us=
X-Google-Smtp-Source: AK7set+SU/uff0YMXgF6UnlCZJkhmL/ZuQNOiFK73D2o5SbyajMHQyS6DnRJqcBgLoeQzQaHpf4C1A==
X-Received: by 2002:ac8:5c02:0:b0:3b8:4cba:e26e with SMTP id i2-20020ac85c02000000b003b84cbae26emr24587163qti.51.1677028078569;
        Tue, 21 Feb 2023 17:07:58 -0800 (PST)
Received: from WQUEN758573.ncr.int.ec.gc.ca (ecodor135.cmc.ec.gc.ca. [205.211.133.135])
        by smtp.gmail.com with ESMTPSA id m3-20020ac807c3000000b003b8558eabd0sm1395160qth.23.2023.02.21.17.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 17:07:57 -0800 (PST)
From: Philippe Blain <levraiphilippeblain@gmail.com>
Date: Tue, 21 Feb 2023 20:07:46 -0500
Subject: [PATCH b4] ez: get_series_details: correctly compute 'base_commit'
 for all strategies
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230221-fix-base-commit-for-non-commit-strategies-v1-1-0e31f1333d76@gmail.com>
X-B4-Tracking: v=1; b=H4sIAOFq9WMC/zWOQQrDIBBFrxJm3aHGplJ6ldLFRMfEhRpGUwohd
 68JdPng/cffoLAELvDsNhD+hBJyatBfOrAzpYkxuMaglb4prXv04YsjFUabYwwVfRZMOf2xVKH
 KU0siKWfYD+buHgZa71yNQsnOR3FdmssUr5FKZTmMRbjlzzcvGAd47/sP/ZURFKEAAAA=
To: "Kernel.org Tools" <tools@linux.kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Philippe Blain <levraiphilippeblain@gmail.com>
X-Mailer: b4 0.13-dev-ccd90

In f0fad6e (ez: refactor based on initial feedback, 2022-07-20), support
was added for the 'branch-description' strategy, but
'get_series_details' was not changed to account for the fact that if the
cover letter is stored in the branch description, base_commit and
start_commit should be the same commit.

This was also missed when 9e95d52 (ez: implement tip-commit strategy,
2022-07-27) added support for the 'tip-commit' strategy and changed
get_series_details to adjust the end commit of the series.

Fix that by setting 'base_commit' to 'start_commit's parent only for the
'commit' strategy, and to 'start_commit' for other strategies.

Signed-off-by: Philippe Blain <levraiphilippeblain@gmail.com>
---
 b4/ez.py | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/b4/ez.py b/b4/ez.py
index 74afddc..5f4d744 100644
--- a/b4/ez.py
+++ b/b4/ez.py
@@ -940,10 +940,13 @@ def get_addresses_from_cmd(cmdargs: List[str], msgbytes: bytes) -> List[Tuple[st
 def get_series_details(start_commit: Optional[str] = None) -> Tuple[str, str, str, List[str], str, str]:
     if not start_commit:
         start_commit = get_series_start()
-    gitargs = ['rev-parse', f'{start_commit}~1']
-    lines = b4.git_get_command_lines(None, gitargs)
-    base_commit = lines[0]
     strategy = get_cover_strategy()
+    if strategy == 'commit':
+        gitargs = ['rev-parse', f'{start_commit}~1']
+        lines = b4.git_get_command_lines(None, gitargs)
+        base_commit = lines[0]
+    else:
+        base_commit = start_commit
     if strategy == 'tip-commit':
         cover_commit = find_cover_commit()
         endrange = b4.git_revparse_obj(f'{cover_commit}~1')

---
base-commit: ada3021c64dd484e53219eb3af55da6c8f25d0ec
change-id: 20230221-fix-base-commit-for-non-commit-strategies-a0d6ef465d86
--
b4 

