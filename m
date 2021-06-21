Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0732E71
	for <tools@linux.kernel.org>; Mon, 21 Jun 2021 20:43:38 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id f3-20020a0568301c23b029044ce5da4794so12485308ote.11
        for <tools@linux.kernel.org>; Mon, 21 Jun 2021 13:43:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Fme1p6C4MhlGUUEgRYGug9s33rXC7EHR0+lxO7Ms9SE=;
        b=WTYB5ib276pHriB7ztRpzBEXNuMbVd/d6/CR+rr4xYzyEd67bmcau6+4AaiIU0iJJ0
         Za/5eaQmAV1uYQo+sySY5VNKlpxD7xUduPYYSojfbYyEdvM7jdSCxnD3FIfwGh/iltQ1
         AcYzTaB9bu2vA35zR71/Tf2T73tuI+YxYW0u2CzJRMhDqxPsNWPrkLdYc2yTJoVcCABi
         OKV+pSiw6hhJk9fOdrUWWt0BYd7wVQnDMPhslkUEyFuXrbMYNQ3wk46Vfh42FecleLYk
         fD0Qd7F//Vvi4H9iZiyNQCxYcEYmVb8Vhc+Uf1+g16XpHDam4O38IyppYvAnvo4mHLzs
         tbhQ==
X-Gm-Message-State: AOAM532BmJJ+9C3k96SyxnyuzaJikdTPdSLCr2092aYtd1TbcOgLU5tT
	/ehnafdkw+dPZ3GlNIKk+Q==
X-Google-Smtp-Source: ABdhPJz3h/RzPzL+EyRVJ/at7AoDkM+uYtjL5B4p56Fi427WN5tALMpDmau2C/QmjPaU8ut53cNe+w==
X-Received: by 2002:a9d:2034:: with SMTP id n49mr297403ota.231.1624308218285;
        Mon, 21 Jun 2021 13:43:38 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.248])
        by smtp.googlemail.com with ESMTPSA id k13sm1510195otl.50.2021.06.21.13.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 13:43:37 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: [PATCH] Allow '.git' to be a file for worktrees
Date: Mon, 21 Jun 2021 14:43:35 -0600
Message-Id: <20210621204335.1627303-1-robh@kernel.org>
X-Mailer: git-send-email 2.27.0
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With multiple git worktrees, '.git' can be a file pointing to the real
'.git' directory, so the current check for a directory is too strict.

Signed-off-by: Rob Herring <robh@kernel.org>
---
Turns out I had 2 issues and didn't notice you fixed the first one when 
I rebased. With the first one fixed, it's the same issue with worktrees 
I recently fixed in the kernel.

 b4/__init__.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/b4/__init__.py b/b4/__init__.py
index 53eaf2757e2a..2bb789e2eaf9 100644
--- a/b4/__init__.py
+++ b/b4/__init__.py
@@ -1834,7 +1834,7 @@ def git_run_command(gitdir: Optional[str], args: List[str], stdin: Optional[byte
                     logstderr: bool = False) -> Tuple[int, str]:
     cmdargs = ['git', '--no-pager']
     if gitdir:
-        if os.path.isdir(os.path.join(gitdir, '.git')):
+        if os.path.exists(os.path.join(gitdir, '.git')):
             gitdir = os.path.join(gitdir, '.git')
         cmdargs += ['--git-dir', gitdir]
     cmdargs += args
-- 
2.27.0

