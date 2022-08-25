Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19263D68;
	Thu, 25 Aug 2022 18:25:21 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id o15-20020a9d718f000000b00638c1348012so14505117otj.2;
        Thu, 25 Aug 2022 11:25:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=IiSPUW4V7ovPoKD3+Vi6AGJ363Hr0kV0N+m+ZPRHE/4=;
        b=eD3NBSapGALK8QhcdqTzP8c8bhGQi6wxJqozVsqZ0o5YmKdxoyxIdK6ROqObisQiII
         Iirzd0gMyCTwPxBHnJAlaJvGlXa1bKgrd81XmZdC5iDJda2qV0Xey51Am5AP4zf6L/3s
         xNzY5OZ+35VOO+251JH0GrrUhe1XPZiNNQXOt48YiVYS7exfWIEIfum3fYN1FUXAX1n1
         1CNoH5OrW3SBg9U3o5ax0TGSKOrQQ9cbPa7i/ciX4ZOHqw/wSsW5KYJftWPthPayEtki
         swiG0BpPt/Z90v43nruBrF4YnCWWbNQM9QcsYzYQ7iEJtjL7fdNZy/uXyh6JfaOkTV0K
         RDiw==
X-Gm-Message-State: ACgBeo2ZYLbppK4zPwxQr/GgbVOS4jgYuZ7gyh1MeP7u2a9OHCFCzkFX
	u8t55F+RI44z8rI5wlwLAcMtrsPs3w==
X-Google-Smtp-Source: AA6agR4o9tb/QQpc27Wbj6pP7+UVWbVkYI6h0WlMH2dnVAqED0tizM+bV13WvL8hMqDXjZ5v22F4eg==
X-Received: by 2002:a9d:3b8:0:b0:638:df67:781d with SMTP id f53-20020a9d03b8000000b00638df67781dmr145638otf.21.1661451920656;
        Thu, 25 Aug 2022 11:25:20 -0700 (PDT)
Received: from xps15.. (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.googlemail.com with ESMTPSA id u21-20020a056870421500b0010830c24aaasm5880808oac.56.2022.08.25.11.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 11:25:20 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: tools@linux.kernel.org
Cc: users@linux.kernel.org
Subject: [PATCH] ez: Fix adding 'RESEND' to patch subject
Date: Thu, 25 Aug 2022 13:25:19 -0500
Message-Id: <20220825182519.1449744-1-robh@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If --resend option is given, the 'RESEND' prefix is not added to the patch
subject(s). This is because the original command line prefix list is
passed rather than the modified prefix list.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 b4/ez.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/b4/ez.py b/b4/ez.py
index 280eb0d4e969..d42a7b748d35 100644
--- a/b4/ez.py
+++ b/b4/ez.py
@@ -944,7 +944,7 @@ def cmd_send(cmdargs: argparse.Namespace) -> None:
         prefixes.append('RESEND')
 
     try:
-        patches = get_prep_branch_as_patches(prefixes=cmdargs.prefixes)
+        patches = get_prep_branch_as_patches(prefixes=prefixes)
     except RuntimeError as ex:
         logger.critical('CRITICAL: Failed to convert range to patches: %s', ex)
         sys.exit(1)
-- 
2.34.1

