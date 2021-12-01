Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA8429CA
	for <tools@linux.kernel.org>; Wed,  1 Dec 2021 00:11:28 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id n85so22323564pfd.10
        for <tools@linux.kernel.org>; Tue, 30 Nov 2021 16:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5HNAI8vlYuB449JtweLE9tRLESJSwBrAfAkGgbwr53c=;
        b=Gquo8R/QbZj5Mg8ttXV6dbbwBwrjCGThZIJpXKcgq7WTBNVHf6qiLC1J7JNugeLFW7
         UYpLrBF2phpBX5I5UbI/F+5npN0tXa+zB8NXWIRKY5aGcaVUl5fpDYlVcQhdmv+yw9Nu
         SFIazn+bBzReg86PYEisKSUUBL284yCdAJ0Nk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5HNAI8vlYuB449JtweLE9tRLESJSwBrAfAkGgbwr53c=;
        b=fBe2HR0Nx6LkEoBTEniXCiUq/3kIpFqXjXudh9hQap2pxFQTtayB4sHkTgcJtHOI4K
         YfrrAZsjBSmviDTFGSybVk/Hb37U7v2BhuJR+LxIjrMkvdiKtdxHD7fEDvR1qu/4HUeN
         lsWf5l70eYbauzvSEq9otAyzkQeC7c6v7MpkzNwo2qFqi1WLsspBi103ujdP8mEwZdE0
         HvcGRuf3712h5hnIIDQ5nr4rqxE1W3BXHvieQ8LQdTZZ2HAPhfY3yRJ5hxkovzut3K1b
         WG9fZ8ciEuVV2Mws0jnQDqu/QyRkS7n0LVybE++cQCdjIBkTnMrBsTW1Lv+BzA+Yj7uU
         xONQ==
X-Gm-Message-State: AOAM5312yium6RupRaU2AFidgJPsDeoqN09811ZcyHGwIgFS1GEqlmd0
	tvoGeF5EQSgcpH8snynPm3W2xUriBkKrIg==
X-Google-Smtp-Source: ABdhPJzM7FJKDuACvAfcxLVLYMKiS3vr0CNgir1lHGY8+MY4c6WvCi0npfLr3layR/fkCPPU9ReD8A==
X-Received: by 2002:a05:6a00:8cf:b0:4a8:3ae:1a78 with SMTP id s15-20020a056a0008cf00b004a803ae1a78mr2341376pfu.7.1638317488386;
        Tue, 30 Nov 2021 16:11:28 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id 38sm943737pgl.73.2021.11.30.16.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Nov 2021 16:11:27 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Kees Cook <keescook@chromium.org>,
	tools@linux.kernel.org
Subject: [PATCH 4/5] patchwork-bot: Handle repo being a worktree
Date: Tue, 30 Nov 2021 16:11:25 -0800
Message-Id: <20211201001126.4106635-5-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211201001126.4106635-1-keescook@chromium.org>
References: <20211201001126.4106635-1-keescook@chromium.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3091; h=from:subject; bh=ZI+bdv5C4l5ULeF2KK5rA9tnNoMcnBAHJMRmVHeCsiE=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhpr2t40p33ROj5seEvkZzEOAPwy7Aw4aucrOXriG4 p7o9LqOJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYaa9rQAKCRCJcvTf3G3AJkiQD/ 4zbnc48tsUcY5b6VlGf93NMhNLwgN5w3SNE20aGdMb0/tUTB6OSX2cDjPr74BBp5jAgTDnWsh88Br/ q48XWx83CNvUKN7D9SCmmFHIoacFoW8E1Z9p/Ha8c7gC6A8tQxSo5Umc/NhNByZ6lnwzFsY3tW3l02 2ry9DNQ7VwmBEkeQtFBZMPPYVsOm0S4JFZtP2UTAPStoMvueS33CHPxVwlcZ8OHy7X9+XB2tXHymBC uo+L2rc0Ogb0fdMht1C9Qnzrl2XjBWntuMhnx+XdgFPEqvjqnGDsPBfgdO0eqw9tCPOJOFZPNYGSZf HLgl+4aKw310+HydyShJxh1tme2Q6wSBwoSgLNFM18QdH1N+gikYkvI0j2Hyj+SC2ib4eBsFTwTA9f uPvDMcvbRoNnYVplqLDTvLUcvtnKJVHYO3V63ADjLTDMkYF5h6mah3mcEtUGsTL0KC52uxv3qwHh8c Shpu1ppHgAD2okOLqoHUEbtr/DpQv7Macu23NugGZqRotD87WD2uF8l15vgTKr541oWpLNwGEB73s2 9O5xFhQCPYN56GVYjziW2F/VffyrMe/vvTgWaW7iPvS8+U1TLaIrO0hp/YixO2dlLwxy5I/nFIJhGx 8vzlh24/T1mw8s2vhD6BbuqjfnIr1iaYR6OQFieCHwZSgJmpzE6GKb2yVViA==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Locate the real git location when operating on a worktree, allowing
multiple pw.db files to be stored in a single top-level git repo.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 git-patchwork-bot.example.yaml |  1 +
 git-patchwork-bot.py           | 27 +++++++++++++++++++++++++--
 2 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/git-patchwork-bot.example.yaml b/git-patchwork-bot.example.yaml
index c3f6c1ea3133..94ab334f5043 100644
--- a/git-patchwork-bot.example.yaml
+++ b/git-patchwork-bot.example.yaml
@@ -53,6 +53,7 @@ repos:
     # For the notification emails
     treename: 'khilman/linux-amlogic.git'
     # Optional: limit checking to a single branch (instead of --heads)
+    # This becomes a required setting if the repo path is a worktree.
     #branch: 'origin/master'
     # For the notification emails, must include %s
     commitlink: 'https://git.kernel.org/khilman/linux-amlogic/c/%.12s'
diff --git a/git-patchwork-bot.py b/git-patchwork-bot.py
index fc4d9e384122..9be945d92a8a 100755
--- a/git-patchwork-bot.py
+++ b/git-patchwork-bot.py
@@ -1054,8 +1054,28 @@ def pwrun(repo, rsettings):
         logger.info('Could not get the latest ref in %s', repo)
         sys.exit(1)
 
+    dbpath = repo
+    # If we're aimed at a worktree, move up from the ".git" file to
+    # the worktree directory.
+    if not os.path.isdir(dbpath):
+        gitdir = open(dbpath).readline().strip()
+        if not gitdir.startswith('gitdir: '):
+            logger.info('Could not find git tree in %s', dbpath)
+            sys.exit(1)
+        gitdir = gitdir.split(' ', 1)[1]
+        gitdir, worktree = os.path.split(gitdir)
+        gitdir, category = os.path.split(gitdir)
+        if category != "worktrees":
+            logger.info('Could not find git worktree in %s', dbpath)
+            sys.exit(1)
+        # To store multiple pw.db files in a single .git directory,
+        # add a suffix based on the repo treename.
+        treename = rsettings.get('treename').replace('/', '_')
+        dbpath = os.path.join(gitdir, f'pw-{treename}.db')
+    else:
+        dbpath = os.path.join(dbpath, 'pw.db')
+
     # Do we have a pw.db there yet?
-    dbpath = os.path.join(repo, 'pw.db')
     db_exists = os.path.isfile(dbpath)
     dbconn = sqlite3.connect(dbpath, sqlite3.PARSE_DECLTYPES | sqlite3.PARSE_COLNAMES)
     c = dbconn.cursor()
@@ -1295,10 +1315,13 @@ def check_repos():
 
     for repo in CONFIG['repos']:
         fullpath = os.path.join(cmdargs.reposdir.rstrip('/'), repo.lstrip('/'))
-        if not os.path.isdir(fullpath):
+        if not os.path.exists(fullpath):
             logger.info('Repository not found: %s', repo)
             continue
         settings = CONFIG['repos'][repo]
+        if not os.path.isdir(fullpath) and settings.get('branch', None) == None:
+            logger.info('Worktree must specify "branch" setting: %s', repo)
+            continue
         logger.info('Processing: %s', repo)
         pwrun(fullpath, settings)
 
-- 
2.30.2

