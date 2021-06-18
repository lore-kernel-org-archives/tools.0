Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5F471
	for <tools@linux.kernel.org>; Fri, 18 Jun 2021 18:24:56 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id o17-20020a9d76510000b02903eabfc221a9so10634797otl.0
        for <tools@linux.kernel.org>; Fri, 18 Jun 2021 11:24:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CmYJ3MS8AyJMZMeRyo3Ki21S7VMt1n049FSkJBEv5Xs=;
        b=VdR9BafHyJ2ZZd57Ppm9XGrNWDhU9yRnQDlJO2hNStNSvypIWyIp9jNns18JLQk6qC
         dnX0HpvfzDdABi32ajX/twy5LspRezGFomty+BNb5Kd+isWAOwriPKkvc5E34QeKMnZy
         UmNmsnvtIRWonXPqSED0gaHNYTEUiYVQ66H42t3Y5lBEY5nHOA+UrT/tadJHBuf5i+tG
         2+23q3kdix218yZqvj85L+6xlQc6KSRrNMrtYalrfovlZ36pufnLTjkORcTkUkEwfXXS
         /+MXLRADxSwWRoy+7UcV5Rj6w6QDwWxzGwVEsN/xmnf/UmZbocrRVgmKaiNItPhaTCwe
         EeSA==
X-Gm-Message-State: AOAM531trDQgfIVsPk8OIXiReV7agnsF68kqJKQtDFK3H9hzTpyBOSBh
	QnFgy6XRpNTaxTzNySapzBFmhrYE7g==
X-Google-Smtp-Source: ABdhPJwX6kRyEyhLq+WwziAJgV8KaXp3hN5/F+hM/GCz0bqKtsgn1vQf2P43foZTcNVS1NJlx7/ihA==
X-Received: by 2002:a9d:e8f:: with SMTP id 15mr10345209otj.334.1624040695328;
        Fri, 18 Jun 2021 11:24:55 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.248])
        by smtp.googlemail.com with ESMTPSA id c12sm1953006oov.11.2021.06.18.11.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jun 2021 11:24:54 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: [PATCH 2/2] am: Allow specifying a base to check applying series
Date: Fri, 18 Jun 2021 12:24:52 -0600
Message-Id: <20210618182452.2577871-2-robh@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210618182452.2577871-1-robh@kernel.org>
References: <20210618182452.2577871-1-robh@kernel.org>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new option, '--check-base', to allow the user to specify a specific
base git ref to check applying a series to.

Signed-off-by: Rob Herring <robh@kernel.org>
---
I'm wondering if this should take a list (in order of preference) instead.
If so, then the 'Base: ...' message should be reworked to be easier to
parse which base was found.
---
 b4/command.py | 2 ++
 b4/mbox.py    | 4 ++--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/b4/command.py b/b4/command.py
index 2d6994dd5111..2d48dafa21f7 100644
--- a/b4/command.py
+++ b/b4/command.py
@@ -120,6 +120,8 @@ def cmd():
                             '"-P *globbing*" to match on commit subject)')
     sp_am.add_argument('-g', '--guess-base', dest='guessbase', action='store_true', default=False,
                        help='Try to guess the base of the series (if not specified)')
+    sp_am.add_argument('-b', '--check-base', dest='checkbase', default='HEAD',
+                       help='Check if series applies to specified ref base (HEAD if not specified)')
     sp_am.add_argument('-3', '--prep-3way', dest='threeway', action='store_true', default=False,
                        help='Prepare for a 3-way merge '
                             '(tries to ensure that all index blobs exist by making a fake commit range)')
diff --git a/b4/mbox.py b/b4/mbox.py
index e722d05a79aa..c660fb45fb36 100644
--- a/b4/mbox.py
+++ b/b4/mbox.py
@@ -234,9 +234,9 @@ def make_am(msgs, cmdargs, msgid):
     else:
         cleanmsg = ''
         if topdir is not None:
-            checked, mismatches = lser.check_applies_clean(topdir)
+            checked, mismatches = lser.check_applies_clean(topdir, cmdargs.checkbase)
             if mismatches == 0 and checked != mismatches:
-                cleanmsg = ' (applies clean to current tree)'
+                cleanmsg = ' (applies clean to %s)' % cmdargs.checkbase
             elif cmdargs.guessbase:
                 # Look at the last 10 tags and see if it applies cleanly to
                 # any of them. I'm not sure how useful this is, but I'm going
-- 
2.27.0

