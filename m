Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C26E7C
	for <tools@linux.kernel.org>; Thu, 31 Mar 2022 19:53:49 +0000 (UTC)
Received: by mail-oo1-f44.google.com with SMTP id z11-20020a4a9c8b000000b00328fdb15e4aso156221ooj.6
        for <tools@linux.kernel.org>; Thu, 31 Mar 2022 12:53:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Pgzn+i26lI8pKMzZ8eQEu4BVCSuT8CezBeIhQtpK7cg=;
        b=iMhG1+eyuTYiZW6j0dcs+UQ6zO/vjhWyGCYYkv+xWLvT2xQXKUa+imStyHyKUqBuVY
         Ef7MJ9CuD4nwqiABC1xCYCzhfm31QcO0TexDzi87OpFalUZP1VGj/FhF5OhIyG7Bfo0x
         ETLvk+7dDKH+uc3hg3XaH9ROCnjQinICJ/iOuNd9IrovmGbk/SfxJrcKqPNHDF+0+BKM
         jS8nsraSXlQ7CfK/TVhXKV0tR691BBVEme7kH2NxJqrlEWfXuqohGaBk6JQkTC7Lt4n3
         72NYGDa2OoZ8D4E00Ymj7lc8L05Ba4H6xhMfSfEHVGFULmp9KGEBjYQ+FOBRTfu2+1mi
         kPJQ==
X-Gm-Message-State: AOAM533ze+oP8FBZE/kjzxMYyjMixnOHU/cvFrxso9IdnHdhMa1lhE3B
	V8tEdw7HfpY4Gqt14Dyfq9GEeT3tuA==
X-Google-Smtp-Source: ABdhPJzQMc2FDpbIb1z/56Lg4EVX0p9c3TLsfFxhVTflb70BTm/ukT0vh2AfT3j5SITCCHelZ4fiZA==
X-Received: by 2002:a4a:d307:0:b0:324:b2d7:a5f with SMTP id g7-20020a4ad307000000b00324b2d70a5fmr5745465oos.33.1648756427889;
        Thu, 31 Mar 2022 12:53:47 -0700 (PDT)
Received: from xps15.. (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.googlemail.com with ESMTPSA id q11-20020a4a330b000000b003289cbe97c6sm218861ooq.13.2022.03.31.12.53.47
        for <tools@linux.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Mar 2022 12:53:47 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: tools@linux.kernel.org
Subject: [PATCH] am: Fix broken guessbranch handling
Date: Thu, 31 Mar 2022 14:53:46 -0500
Message-Id: <20220331195346.1384515-1-robh@kernel.org>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

b4's usage of git-log '--branches' option is broken. The option takes a
glob pattern *only* and must have an '=', but b4 ends up passing
'--branches <guessbranch>' to git-log. This will kind of work, but is
not checking only 'guessbranch'. For example, these 3 commands all do
something different:

git log -1 --branches=master

git log -1 --branches master

git log -1 --branches=*aster

A maintainer wanting to apply a patch or series likely has a small set of
known branches they apply patches to. Using a glob pattern is not a good
fit for that. Instead, allow --guess-branch to be repeated and to take
fixed refs.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 b4/__init__.py | 4 ++--
 b4/command.py  | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/b4/__init__.py b/b4/__init__.py
index ec1a6da44144..be934e53ca0d 100644
--- a/b4/__init__.py
+++ b/b4/__init__.py
@@ -643,7 +643,7 @@ class LoreSeries:
 
         return len(self.indexes), mismatches
 
-    def find_base(self, gitdir: str, branches: Optional[str] = None, maxdays: int = 30) -> Tuple[str, len, len]:
+    def find_base(self, gitdir: str, branches: Optional[list] = None, maxdays: int = 30) -> Tuple[str, len, len]:
         # Find the date of the first patch we have
         pdate = datetime.datetime.now()
         for lmsg in self.patches:
@@ -655,7 +655,7 @@ class LoreSeries:
         # Find latest commit on that date
         guntil = pdate.strftime('%Y-%m-%d')
         if branches:
-            where = ['--branches', branches]
+            where = branches
         else:
             where = ['--all']
 
diff --git a/b4/command.py b/b4/command.py
index 3a2d58f364e5..6d3c899480ec 100644
--- a/b4/command.py
+++ b/b4/command.py
@@ -133,7 +133,7 @@ def cmd():
                        help='Save patches in a quilt-ready folder')
     sp_am.add_argument('-g', '--guess-base', dest='guessbase', action='store_true', default=False,
                        help='Try to guess the base of the series (if not specified)')
-    sp_am.add_argument('-b', '--guess-branch', dest='guessbranch', default=None,
+    sp_am.add_argument('-b', '--guess-branch', dest='guessbranch', nargs='+', action='extend', type=str, default=None,
                        help='When guessing base, restrict to this branch (use with -g)')
     sp_am.add_argument('--guess-lookback', dest='guessdays', type=int, default=21,
                        help='When guessing base, go back this many days from the patch date (default: 2 weeks)')
-- 
2.32.0

