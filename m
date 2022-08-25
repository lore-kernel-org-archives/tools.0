Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31623C14;
	Thu, 25 Aug 2022 18:25:08 +0000 (UTC)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-11c896b879bso25942320fac.3;
        Thu, 25 Aug 2022 11:25:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=tEdL6aNs70GkfN982FtLQIs2X4kI0WzRvCsLmV0y2O0=;
        b=2DzoIkcVGBh91OfxN8XphHM3Oig12VkgnNrQVM1t/jDi15X3OAwhatKk5gJUhdjr0t
         xwjkGU4nIOWuj/LBELk4BDc9fkljpKDk+wRU5Fb9vE8mHGEXgemuFPBN8W+B3H/+JdqC
         H6xoq1nD+w3lNO50WqNMkQHSkIfvXG7KzbCKpKGLdDfuCsqV/wxl54U9o2iqOA3eQZ2X
         A4NEa6Z5yuDPo9a+wLsjCoRi5eR6ZtBQ5uD4uqtNtPt+v3WynMdoexNx1mPV03fB/XJ/
         mQZK9X54VlQ0xhB2gxhF9VxTOKoWzsIXTI99MR946IVd8JxYTH8rIizBNcTdnsRNsp6L
         Qccw==
X-Gm-Message-State: ACgBeo3fcoru+TAFfo3vjRk0AqPCvbwrGwgj361wmro1lz/tWlFJkZ2R
	878O9C5d+KRA4Js0uqEldZqVuj0X7w==
X-Google-Smtp-Source: AA6agR7PJzsQt0T0DTJFDIPrVHS+QyvxW/p99xtlyFTZ+0apdm8JzR3hEQYm0oFBO4I/dzQe/JYLLg==
X-Received: by 2002:a05:6870:608f:b0:fe:340d:df8e with SMTP id t15-20020a056870608f00b000fe340ddf8emr191724oae.15.1661451907482;
        Thu, 25 Aug 2022 11:25:07 -0700 (PDT)
Received: from xps15.. (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.googlemail.com with ESMTPSA id c8-20020a544e88000000b0034536748843sm28222oiy.3.2022.08.25.11.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 11:25:07 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: tools@linux.kernel.org
Cc: users@linux.kernel.org
Subject: [PATCH] send: Use only the default git 'sendemail' config when no identity is set
Date: Thu, 25 Aug 2022 13:25:06 -0500
Message-Id: <20220825182506.1449442-1-robh@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With no git sendemail 'identity' set, b4 send picks up all the identities
and uses the wrong settings.

Signed-off-by: Rob Herring <robh@kernel.org>
---
This only partially fixes the sendemail handling. If an identity is set,
we need to merge the identity's section with the default section as an
identity may not contain a complete configuration.
---
 b4/__init__.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/b4/__init__.py b/b4/__init__.py
index 4296b109d118..a8ddf8534eaf 100644
--- a/b4/__init__.py
+++ b/b4/__init__.py
@@ -2759,7 +2759,7 @@ def get_smtp(identity: Optional[str] = None,
         sconfig = get_config_from_git(rf'sendemail\.{identity}\..*')
         sectname = f'sendemail.{identity}'
     else:
-        sconfig = get_config_from_git(rf'sendemail\..*')
+        sconfig = get_config_from_git(rf'sendemail\.[^.]+$')
         sectname = 'sendemail'
     if not len(sconfig):
         raise smtplib.SMTPException('Unable to find %s settings in any applicable git config' % sectname)
-- 
2.34.1

