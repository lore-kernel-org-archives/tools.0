Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2A92C99
	for <tools@linux.kernel.org>; Wed,  1 Dec 2021 00:11:30 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id k4so11480749pgb.8
        for <tools@linux.kernel.org>; Tue, 30 Nov 2021 16:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TQB4EdQwLW0dEuvfGy3zcM1aNhpWIPrjQOaB8Ydmn1w=;
        b=YwEWOS5bFYL8XlF2paLSl5Rh/Xe9YoRNltcuujAu/CyXfPSSV+S4OHxRdTb8JTZnF2
         0hpWBMkm9VcqEoaLOj10TaUFGsXt2+i8BMhNBBaySEc19Ws9ozWAsCVGnNYJGm7VbZlS
         RrfAKHrtZDwaVF3Co1aWKHE6yodxJcQnpz1nw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TQB4EdQwLW0dEuvfGy3zcM1aNhpWIPrjQOaB8Ydmn1w=;
        b=UeJ4NWXr3UkKccvE0igTPtX3onB7HsAzga9fHIgfbE7hG5D+1J24tR06eLLLcQ8G5M
         u8GTyriAvUA/F2jVwUoTSlpax+W6qJ9i6GCM4WeC3YpxzXttmS4eQcxsoMXJ9iN4tSFV
         l6fkx1P8hf8vCCqm60ePxT/ioAp0vPL2YKIy2WOSEDbt4CxAIcIig8Xw3QUR7Myy98OA
         QG+9ZbHSxdDk4JUGf6wYs8edhHPQYfFlK80mjS5yaTTRl81Ry+TGSoVToi1zg3RJWwf/
         hGaG1Yv2nkRwOFDfqO2Kxh3aqnwbWSWIIjbgVxV6+5/4sKtl592nk1lJY87fFQ0d7QTt
         yNrw==
X-Gm-Message-State: AOAM532X9LkNfYF6iW/w1KX//e8d5lguISRnSK01p7x3LHt5pG6Jn+YL
	wTJ+237Cyyy7G8QcAU1cHqSvdg==
X-Google-Smtp-Source: ABdhPJzAxitikgZ/FDyQOweW9wIu+KM5pmkxMRA5Qreihp6qD6eCpppJdco284CPyDEpnZGnhZJskA==
X-Received: by 2002:a05:6a00:1349:b0:4a0:2f9:e3ab with SMTP id k9-20020a056a00134900b004a002f9e3abmr2361753pfu.80.1638317490081;
        Tue, 30 Nov 2021 16:11:30 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id d3sm21976994pfv.57.2021.11.30.16.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Nov 2021 16:11:29 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Kees Cook <keescook@chromium.org>,
	tools@linux.kernel.org
Subject: [PATCH 5/5] patchwork-bot: Allow initial database to skip recent commits
Date: Tue, 30 Nov 2021 16:11:26 -0800
Message-Id: <20211201001126.4106635-6-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211201001126.4106635-1-keescook@chromium.org>
References: <20211201001126.4106635-1-keescook@chromium.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2201; h=from:subject; bh=1RAuWS5nDZVb4yoZ+KhnC3fNNEabyAthcdHbBgRHj5o=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhpr2tE/IOrk+JZjIGbkZ+HdS/3PzVKoVHksKK4HxZ rCNq0TaJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYaa9rQAKCRCJcvTf3G3AJmN1D/ 9tVeBeG29wJP47uA/Hj0pHzdehqSrewlwr82F1kUe+pRfnXULHepnxxppBeMGmKxvDtN1Kj//hCOb/ TSi9qulQ+f6KRKc3wj1GJWltfOvHFNWMNkXv4MwHsplc1XyTzXVm0B7YhlxKonXT5qy23bG35Jwrig 9WwzRM1AlduTwxfmCfGu2dcTCCLkp10of05vZ3nJ5sZ8R1jbNG8bhuYwUnK/al32OAhyH4VErR4nAN u5aX8epSl4FDFMIHsnSTVXmTR2njVU9mCRamdfGzdYLS61zE0pdZYxgifQa6PYWE+Ms296wCQYUw31 xZnkW8aCCnTITTrvCsvJOxvRq12+qUBQhjFO9PttC4z1rkjn7xI46YfLYBnYWYn3eQPJAoRI1sjpVO Ve5AXDjK2+HTERbd5XTpeXey3SSC86jiC3ms398reFSrTD30VlZTE1I6CgpDYBvRL6QQ0y9Ymn9sjW EFbS6oi+f4kw+JQIKvplHnurkqmk+hI4houb+0e6bTYJf7gLbSwOCjLUpaddbfG11KhK1lvFNK7fBg IqnGKr25JMZ3skutrLJp+52lnf4OoPoforwN20HMl21RagUkaHdDun7qYZDUQ6vbpoJVs/QnR4S6uA TULvJnTHGCWN9Mi6KH7SdIEcE7DcEaYcv/o5NLnpx4evHygCJx9/Xqp/Y5nw==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

To test patchwork-bot, it is helpful to create the initial database
without a certain number of the latest commits, so that on the next
execution, the "missing" commits will appear new, and will be used for
processing state changes. Add the --ancestors argument (defaulting to
0, the existing behavior), to provide this ability.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 git-patchwork-bot.py | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/git-patchwork-bot.py b/git-patchwork-bot.py
index 9be945d92a8a..2ebe5b4e88e4 100755
--- a/git-patchwork-bot.py
+++ b/git-patchwork-bot.py
@@ -409,13 +409,17 @@ def git_run_command(gitdir, args, stdin=None):
     return output
 
 
-def git_get_repo_heads(gitdir, branch):
+def git_get_repo_heads(gitdir, branch, ancestry=None):
     refs = list()
     lines = git_get_command_lines(gitdir, ['show-ref', branch])
+    if ancestry == None:
+        ancestry = ''
+    else:
+        ancestry = f'~{ancestry}'
     if lines is not None:
         for line in lines:
             (commit_id, refname) = line.split()
-            refs.append((refname, commit_id))
+            refs.append((refname, commit_id + ancestry))
     return refs
 
 
@@ -1082,7 +1086,9 @@ def pwrun(repo, rsettings):
 
     if not db_exists:
         db_init_pw_sqlite_db(c)
-        db_save_repo_heads(c, git_heads)
+        initial_git_heads = git_get_repo_heads(repo, branch=rsettings.get('branch', '--heads'),
+                                               ancestry=cmdargs.ancestors)
+        db_save_repo_heads(c, initial_git_heads)
         # Exit early
         dbconn.commit()
         return
@@ -1353,6 +1359,8 @@ if __name__ == '__main__':
                         help='Cache directory to use instead of ~/.cache/git-patchwork-bot')
     parser.add_argument('--domain', default=None,
                         help='Domain to use when creating message-ids')
+    parser.add_argument('--ancestors', default=None,
+                        help='During initial database creation, consider this many ancestor commits as fresh')
 
     cmdargs = parser.parse_args()
 
-- 
2.30.2

