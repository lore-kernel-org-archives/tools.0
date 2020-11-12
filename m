Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com [209.85.219.65])
 by mx.groups.io with SMTP id smtpd.web10.5764.1605194500065343556
 for <tools@linux.kernel.org>;
 Thu, 12 Nov 2020 07:21:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=P0lH5QiW;
 spf=pass (domain: gmail.com, ip: 209.85.219.65, mailfrom: levraiphilippeblain@gmail.com)
Received: by mail-qv1-f65.google.com with SMTP id 63so2906946qva.7
        for <tools@linux.kernel.org>; Thu, 12 Nov 2020 07:21:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pI6LCrH1QYStu99GGCy/vho7Bcq7VJA/v96TMnPhDSo=;
        b=P0lH5QiWhIPDKb8bv1mDJ0uScBuurOyWHKjAxy01L0nj3YdRgR1iDveyOpi6359FnK
         WRKZXyikOB/xE037cKoaN6bCrndYqTnhKdUofTT5U7vmmWwZO2o66yHkF3Oxnw6YtFMv
         1Dine/YVW3BfHgbWP7xBk/SkUirBancd/k96En6bGkKulypxrvs/+Yed4pxV0KhXZKWN
         vf8t2YBj2rdXOb9bhPa8L4kbflHpkbCn223DbUpkbTWOXsqUx10Ob9ompy3TgQWSdF0x
         fuwXFT//jU8BSbd/+0PNwe6oqhCN+nyokQEj4wNV3EO7nP3e1Zl2bvqbr4B4jItoB0OO
         tBfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pI6LCrH1QYStu99GGCy/vho7Bcq7VJA/v96TMnPhDSo=;
        b=LsmirPx8XKIZB7A6quayiY9C1awEcDSf21OZPza7jkK/KPy+x0kQQifWJqwo2LpZTG
         7UIDNFsDYnJmwUlZYgu8SIPphykvxA7vn6QJ0VJNMs4FznarHtCn3D8goG9YuxPJB6CV
         i7I6SkXL+uNkfGuV4soYAOe7tt2cBMQs7+0cVRyXPghJqdOx+uBvCvgguVbuA3h/NjOk
         gn6EWYzzlZ8gu59Qvmz1Sy15Mh4YArmICiU9ku7uc30j3ez25nYhjgVvRgqC5XhAVfac
         8L+0wWDnwrC3huO8QkP3fzGJ9upLHk9LjtnkG9fN/6Z+pAkHGykxajhdTDam78dtEjEj
         17Aw==
X-Gm-Message-State: AOAM531AbEyxEMAe7zDPmaKvzMscFPAeTxRBHXeHtoEIpQ7CcoUnyG9o
	XR7NtR7wEJPBj3RVVz0QgT8tEkwyAQOZcg==
X-Google-Smtp-Source: ABdhPJwttN83+0/pDbu1wXzSOu4QnrjxMGUczF7oAnmAta7xIpf2i4uaHQikEsx8FWizj7K50kn+tg==
X-Received: by 2002:ad4:5691:: with SMTP id bc17mr21383110qvb.30.1605194498923;
        Thu, 12 Nov 2020 07:21:38 -0800 (PST)
Return-Path: <levraiphilippeblain@gmail.com>
Received: from localhost.localdomain ([192.222.216.4])
        by smtp.gmail.com with ESMTPSA id k70sm5230351qke.46.2020.11.12.07.21.37
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 Nov 2020 07:21:38 -0800 (PST)
From: Philippe Blain <levraiphilippeblain@gmail.com>
To: tools@linux.kernel.org
Cc: konstantin@linuxfoundation.org
Subject: [PATCH b4 2/4] Link to the README from PyPI
Date: Thu, 12 Nov 2020 10:21:32 -0500
Message-Id: <20201112152134.96498-3-levraiphilippeblain@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201112152134.96498-1-levraiphilippeblain@gmail.com>
References: <20201112152134.96498-1-levraiphilippeblain@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of linking to the default gitweb view ('summary'),
link to the README in the 'tree' view, so that users coming from
pypi.org can directly read it.

Signed-off-by: Philippe Blain <levraiphilippeblain@gmail.com>
---
 setup.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/setup.py b/setup.py
index ed24367..6ad18a3 100644
--- a/setup.py
+++ b/setup.py
@@ -26,7 +26,7 @@ NAME = 'b4'
 
 setup(
     version=find_version('b4/__init__.py'),
-    url='https://git.kernel.org/pub/scm/utils/b4/b4.git',
+    url='https://git.kernel.org/pub/scm/utils/b4/b4.git/tree/README.rst',
     name=NAME,
     description='A tool to work with public-inbox and patch archives',
     author='Konstantin Ryabitsev',
-- 
2.27.0

