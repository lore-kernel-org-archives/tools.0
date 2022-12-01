Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 883586FD7
	for <tools@linux.kernel.org>; Thu,  1 Dec 2022 15:29:19 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id 140so2182316pfz.6
        for <tools@linux.kernel.org>; Thu, 01 Dec 2022 07:29:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hUrId2UsNZLW8gd48hoMWzfsITsybdi4tsMEs4Sqrqw=;
        b=JMfoU8aY0seNjCMbwrpXugCAPjGzpVNOYvDTF2xwwEFNfuR5VPjlubaSGpNctiI4NL
         geqQV8ZMhWzpFeHYMFJ+IWaxV/EWrXr1wUW8F5vVwcN3ScDt/eExDsFAglvcyAbG5Ixc
         wvP1h48oavmDfgEMSzRhzmPkiYwbUmC7jIp4U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hUrId2UsNZLW8gd48hoMWzfsITsybdi4tsMEs4Sqrqw=;
        b=pmB0NHOsagF59F9x4F/kGfxJiAN6qRIoNRi0LsCKcoy4uqaC11u7OxIDhNyakDSTRK
         VCEdQdw8uddkw4oQLTB4A6KFvZmMkfj7FCq6sppaenlZchX6KsLxQSPwlnHQhJq02w3G
         hXA17caKgRYI3x/RCdaHpcYYBkd7B3OKa/U6MENLYBUb8H+ZxrrbU1MsVxtdYiUjA2KY
         1WQAJitssI45F5YYjCrWa8vb4MI1qRxmJdP+40HORQkOZirGVMjvTdIXhWjgYkiI9woN
         C6cVa4YhIWT12P+Ew4kYBaqFFp+V5sCvgYqUbXZK9rgSYWUUDt+5raGGT6QM0A3z8xRO
         5nMg==
X-Gm-Message-State: ANoB5pkj8H9QNYzfFZPk8YIFVGxX9SapIQ/wFmz/qdNTVD4pu7S0u2YS
	qIxIcxygUa60spzFY3b7wupcH1G6QetN/p8B
X-Google-Smtp-Source: AA0mqf5HEhh5Cr149Tvqd1H3+RWylAey65v+D+N8gXnVkZc5BVWaaQhwgagSFIm30M+0xuCqivBRvQ==
X-Received: by 2002:a05:6a00:24c1:b0:56e:a001:8cb0 with SMTP id d1-20020a056a0024c100b0056ea0018cb0mr48747480pfv.60.1669908553824;
        Thu, 01 Dec 2022 07:29:13 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:b903:efe9:e81f:dafa])
        by smtp.gmail.com with ESMTPSA id h15-20020a170902680f00b00186cd4a8aedsm3725226plk.252.2022.12.01.07.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 07:29:03 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: tools@linux.kernel.org,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Kees Cook <keescook@chromium.org>,
	Douglas Anderson <dianders@chromium.org>
Subject: [PATCH] b4: patatt: Update patatt from 0.6.0 => 0.6.2
Date: Thu,  1 Dec 2022 07:28:14 -0800
Message-Id: <20221201152814.1381855-1-dianders@chromium.org>
X-Mailer: git-send-email 2.39.0.rc0.267.gcb52ba06e7-goog
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As of commit 3847a92a365a ("validate: Use patatt's configured keyring
as fallback"), you can see that we call patatt.get_config_from_git()
in some cases. The patatt module doesn't have get_config_from_git() as
of 0.6.0. Update to 0.6.2, the newest version.

Fixes: 3847a92a365a ("validate: Use patatt's configured keyring as fallback")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 patatt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/patatt b/patatt
index 8a3da6965836..a13a3ac2050e 160000
--- a/patatt
+++ b/patatt
@@ -1 +1 @@
-Subproject commit 8a3da6965836d46509a0f5eab9808cdb9542deed
+Subproject commit a13a3ac2050ebef4eabb2e46fd316a9a5bf96b04
-- 
2.39.0.rc0.267.gcb52ba06e7-goog

