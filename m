Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4C42C99
	for <tools@linux.kernel.org>; Wed,  1 Dec 2021 00:11:28 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id x7so16619340pjn.0
        for <tools@linux.kernel.org>; Tue, 30 Nov 2021 16:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NJj2Xrxr7kYghEILolKhl/zUkFd5bz28t2goqiNtZMU=;
        b=ATThWKApE/n0kpq0EApJTRmzA6PIfaD4h1H7qT6pnq7HBAPdvRR/4+P1LP6VEkzEol
         0PbZyJb0dH8Fob7+fMVSJEH5mG9U5L0GBgvC/YzQRDHHZXFaM14U9gwKBPFGquF6i2tn
         yZOhJVPQrc8tf6kHhV4/qa+WruFGd21yYZmcE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NJj2Xrxr7kYghEILolKhl/zUkFd5bz28t2goqiNtZMU=;
        b=vvd6b4tkrBi8ty0IKyjVjwYNLnSVZ8VkZy3/nQML/PB/s2kyQoO+lNtgQSnmIpaRcJ
         8LTmUYe1ioQQwkQbDK23lzJdHzuPlUxHdZvG0wctJvyQprh3AYXsYWa/v8z95R9VW/tO
         oAlzYlbug9OCnI2un90jb/cI5oh0vg8SckUrLYMUkSLzvhr53+kVHgJ3c41DWwaJvlR9
         bIfWFCbmxlDyvVKpNvUwH100gItqT2u506dWMSwou3Ym2lSVsK3pasG6F86sr7/fcS+b
         OBmYZNIp4FA+O8DBPbknQAf7JcTjrZmNj97ZejKwziVqWAl9tYhBtm99LcLiku7/Q8g4
         1ZYQ==
X-Gm-Message-State: AOAM530jQL8f2T3brthC0CY46aYEXr+8//Y/+PTz33Fhh/2d70/PtMaT
	iLZ/8GWLkMD33phK9CirSXSfOzOYeKuRaA==
X-Google-Smtp-Source: ABdhPJyOi+zFsETxLSlhm7Q5aLuESnvbqyBW2krz60sx2U9AAT0pjX+EPkhTp8kEUBty+FWUnYsTCA==
X-Received: by 2002:a17:90a:e00f:: with SMTP id u15mr2889394pjy.123.1638317488236;
        Tue, 30 Nov 2021 16:11:28 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id d1sm23536645pfv.194.2021.11.30.16.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Nov 2021 16:11:27 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Kees Cook <keescook@chromium.org>,
	tools@linux.kernel.org
Subject: [PATCH 3/5] patchwork-bot: Allow limiting heads to single branch
Date: Tue, 30 Nov 2021 16:11:24 -0800
Message-Id: <20211201001126.4106635-4-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211201001126.4106635-1-keescook@chromium.org>
References: <20211201001126.4106635-1-keescook@chromium.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2005; h=from:subject; bh=jFjmKeND7X144NlkWr3Bqrg1VW92lD8E7ZSLWq7llBY=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhpr2tGpwl4++YrccsAlupkC5RXVBTirabUIaIIQAJ XdU+N8qJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYaa9rQAKCRCJcvTf3G3AJhC4EA CA8MXUjqJ73U41d565OM8AHLhGkIdIG+sfEby8sviF6alV9FyZMxHwm25ZT8jpswXhXi9gjqNYzhtk eU6PrORQWvE5dH3PJFJpmiJvN7UdYbHYJo3a8fSeo35WiJOR168GyQgOnhIyRf/sj1vesERtGFuzoO I5wiz8DHeIscIAZZiZXS4w8t02Ro1S0ATPQJSdESi+xbWizzLJfMATb62PypDK9gcgUt9hTtWgCKFV aTIl5I6c0DOgNne0Rer+GwFvy3b7PccXi/uIFXkhMYOUA9BCTLUzb+YQZanRcZzm2nDo+x3NxtnmH/ zklzmuHZCXvuYhfYPKxsDBuEPp2JBJnrw9B1MRwFLqXwb/VxHGYuavL+AwgR37HM50DTgTem7VpQFl xGeSLERfE2L79P7oWpkx4f0XQ0ylBFopMh/iJTCFTnwFWRD43AoHNcjggQfvxf00vXANBAbAxruBtF 6Q41R8wTa3V+LivlDPNKBeuQauI3S5/eb2NY5K0T/HiGWd1II1VhYBiqftMvdg/xBoEVafWqWwwdaX so+ruzmywRUyVGmRW6KRmQAIvzy7I7DH2e9dJKzyv0AgZrAH+DICRcI9c9uEGesdwbRskz3fSfVtSa AuyBFS0d+Ux66NcEGiTr6HHVHzz6xBmgpPFbHkFlO1tg57/nmWtY/TkjxI0w==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

To sanely use a single git repository with multiple worktrees, it must
be possible to limit the commits by branch (otherwise all commits are
visible for all worktrees). Add an optional "branch" argument for this
limit.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 git-patchwork-bot.example.yaml | 2 ++
 git-patchwork-bot.py           | 6 +++---
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/git-patchwork-bot.example.yaml b/git-patchwork-bot.example.yaml
index d6140ed68e53..c3f6c1ea3133 100644
--- a/git-patchwork-bot.example.yaml
+++ b/git-patchwork-bot.example.yaml
@@ -52,6 +52,8 @@ repos:
   'pub/scm/linux/kernel/git/khilman/linux-amlogic.git':
     # For the notification emails
     treename: 'khilman/linux-amlogic.git'
+    # Optional: limit checking to a single branch (instead of --heads)
+    #branch: 'origin/master'
     # For the notification emails, must include %s
     commitlink: 'https://git.kernel.org/khilman/linux-amlogic/c/%.12s'
     # Only notify for commits where committer email exactly matches one
diff --git a/git-patchwork-bot.py b/git-patchwork-bot.py
index dc10fd0effa9..fc4d9e384122 100755
--- a/git-patchwork-bot.py
+++ b/git-patchwork-bot.py
@@ -409,9 +409,9 @@ def git_run_command(gitdir, args, stdin=None):
     return output
 
 
-def git_get_repo_heads(gitdir):
+def git_get_repo_heads(gitdir, branch):
     refs = list()
-    lines = git_get_command_lines(gitdir, ['show-ref', '--heads'])
+    lines = git_get_command_lines(gitdir, ['show-ref', branch])
     if lines is not None:
         for line in lines:
             (commit_id, refname) = line.split()
@@ -1049,7 +1049,7 @@ def housekeeping(pname):
 
 
 def pwrun(repo, rsettings):
-    git_heads = git_get_repo_heads(repo)
+    git_heads = git_get_repo_heads(repo, branch=rsettings.get('branch', '--heads'))
     if not git_heads:
         logger.info('Could not get the latest ref in %s', repo)
         sys.exit(1)
-- 
2.30.2

