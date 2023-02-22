Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52D01360
	for <tools@linux.kernel.org>; Wed, 22 Feb 2023 01:29:50 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id ay9so6359562qtb.9
        for <tools@linux.kernel.org>; Tue, 21 Feb 2023 17:29:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ME8B5jJjjihoht2MiOzPx2MGyBQSZZlq0ec3/VJlphk=;
        b=QTuBOgSgDSIWyhMu9NO2XatefONxZxcPORdWZvgv1az1xdXwIBbhlPokPlZdnJzFVg
         FVXzyLPkgyTbNb6vBiMTNCFRtqIPBGpr9z3fXAw3wRTckHac3IS/mb5A37VUq1Un4jtb
         cJ48pqeIf/s9KuEXVqS9FB+SiGz3tcoMJInoqqC2/mm0oJaQVHl7TmklUbrLbHKL/w3O
         gtvBxeo7Rf+y/fltlpvb0h2lcX6ajnagDY1/+zViz4amXqzlwe7Zm0qhWi7Qce19bnPa
         hGfQ5/o90CthGvO/XBVaTKN4luccLiOQjv4S9sPljzKCTUPSnb7WZhNYVJrHWDCOzYIY
         27Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ME8B5jJjjihoht2MiOzPx2MGyBQSZZlq0ec3/VJlphk=;
        b=Lrg1eiFWxrWn0At0ljoGmFHV9/5CT3s6d2Fxr9Alu1FpRzPUoVzE59tTsxv1WOwFk9
         c6j7/sXTrc8Lmd+lxc4tO+Lk4TsdeZdfpflAU5+4tlz/tp6Q5IZUyytXyuiYeYVzyMiU
         fton9qRKpOMEHvzEHPmsEx8kL7blPMAr0+eIKB2mAxWZ/RUvefsRrYGbGoXg+QvpP1MA
         QZuW9SW19H33fiUsYxdwczeSbp8KPdg53NsuxBp6dz7rJM/NEjuAMlPPwxs6QxTtevrj
         35g5lA4j9gkNc2DxU9V9VDb/QOevcLYPXJqHYM18fPPGs+161xL5WVUruWFeV+GDbjDK
         f10g==
X-Gm-Message-State: AO0yUKWZdm0pclO3vqKMOojDrHHbaioerkpRN82rlkXQgHFgM6YIxPJK
	7RQQmamLEaqpNULrggFz5faV2FeYKww=
X-Google-Smtp-Source: AK7set+IdnPmtV2RjgG5tbVVSnF4OBx1pw1PJ4jkVJqLO8HRyFN6EGI00zkmf+k8OgzR5OKMSNuBFQ==
X-Received: by 2002:ac8:57d2:0:b0:3b6:93fe:443c with SMTP id w18-20020ac857d2000000b003b693fe443cmr28087890qta.32.1677029389818;
        Tue, 21 Feb 2023 17:29:49 -0800 (PST)
Received: from WQUEN758573.ncr.int.ec.gc.ca (ecodor135.cmc.ec.gc.ca. [205.211.133.135])
        by smtp.gmail.com with ESMTPSA id o190-20020a375ac7000000b0073b45004754sm11872357qkb.34.2023.02.21.17.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 17:29:48 -0800 (PST)
From: Philippe Blain <levraiphilippeblain@gmail.com>
Date: Tue, 21 Feb 2023 20:29:19 -0500
Subject: [PATCH b4 3/3] ez: add 'b4.send-same-thread' config for 'b4 send
 --same-thread'
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230219-send-iterations-in-same-thread-v1-3-59b802382eb5@gmail.com>
References: <20230219-send-iterations-in-same-thread-v1-0-59b802382eb5@gmail.com>
In-Reply-To: <20230219-send-iterations-in-same-thread-v1-0-59b802382eb5@gmail.com>
To: "Kernel.org Tools" <tools@linux.kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.13-dev-696ff

Allow the default for the '--same-thread' option of 'b4 send' to be set
in b4's config by adding a 'b4.send-same-thread' configuration option.

Signed-off-by: Philippe Blain <levraiphilippeblain@gmail.com>
---
 b4/ez.py        | 5 ++++-
 docs/config.rst | 4 ++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/b4/ez.py b/b4/ez.py
index 4013f29..f0861ed 100644
--- a/b4/ez.py
+++ b/b4/ez.py
@@ -1295,7 +1295,10 @@ def cmd_send(cmdargs: argparse.Namespace) -> None:
             sys.exit(1)
 
         try:
-            todests, ccdests, tag_msg, patches = get_prep_branch_as_patches(samethread=cmdargs.same_thread)
+            samethread = config.get('send-same-thread', '').lower() in {'yes', 'true', 'y'}
+            if cmdargs.same_thread or samethread:
+                samethread = True
+            todests, ccdests, tag_msg, patches = get_prep_branch_as_patches(samethread=samethread)
         except RuntimeError as ex:
             logger.critical('CRITICAL: Failed to convert range to patches: %s', ex)
             sys.exit(1)
diff --git a/docs/config.rst b/docs/config.rst
index b3ab5ca..0fd68c5 100644
--- a/docs/config.rst
+++ b/docs/config.rst
@@ -351,6 +351,10 @@ Contributor-oriented settings
 
   Default:: ``scripts/get_maintainer.pl --nogit --nogit-fallback --nogit-chief-penguins --norolestats --nom``
 
+``b4.send-same-thread`` (v0.13+)
+  Send all versions of a patch series as part of the same thread.
+
+  Default: ``no``
 
 ``b4.prep-cover-strategy`` (v0.10+)
   Alternative cover letter storage strategy to use (see :ref:`prep_cover_strategies`).

-- 
2.34.1

