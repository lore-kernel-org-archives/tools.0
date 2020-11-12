Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web10.5765.1605194501087191763
 for <tools@linux.kernel.org>;
 Thu, 12 Nov 2020 07:21:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Fdt7Z6Uf;
 spf=pass (domain: gmail.com, ip: 209.85.160.169, mailfrom: levraiphilippeblain@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id t5so4205671qtp.2
        for <tools@linux.kernel.org>; Thu, 12 Nov 2020 07:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aSZmHwdpmFAzzLtub1zs+ncWtI+Rgk3Tw84+upktqdM=;
        b=Fdt7Z6Uf8FdCQi3k9jzjN1eB8PF64bh3+crhSwJ1YPdlvXGrJdoYNLyt1B4fuon1Qz
         FPch8AZ2Gc0M3RV7SIK/mnuYOUW7OkUPmNs1r7pA4mecy6PeTi5Zd7uImaSWdITfLfA2
         1KP7DaoS0sJML56Clstqt6m1RA5yMd7Azpj3hwDy2zm10D1+nxXwIQuMvzaqKAuISn2h
         r5ZTf0Uiz+cuFxNkzoI2qOd5QtdetInEtEX13cnK4uLUP3VcZ2g3NiSXsNHbkXxV87GE
         6lrW7N+2O8iBgClA56nI2QubXBjdmqEhf0TYuxemuEj/lLvlE7idiaXuWNp2ZHNVA5dV
         aDeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aSZmHwdpmFAzzLtub1zs+ncWtI+Rgk3Tw84+upktqdM=;
        b=t7AjmxImUncxsLHzdA+nEPGsZJ4iT8yDfg0C3t1TdjrBlEAjFbTS0fR2c3H9JgAw8S
         o126RzlkVG8JYe8DpWbVD70MHj1AZtHrNMP30fseDYbTVBrytl43o0QYh+PAT5sF9+Dg
         DYndUmXDqm7e8qO7ib2vJ60UurXYFnnxbqWiVqm0AJGX8kS3y1hNrqZoUx6sqG36YwHZ
         pqT6ImDb+3GQrxsQOUD0Yjo1d3djAsozEAdHRsuexiUrO8wmLL80NuboGNCV74XNZPms
         fjK+Z6ns8DE6cN6QRVCQQwzFI2+czj5K1iarlThGivNRwIvw0dZOfV2YETMwANEIt2QY
         rpkA==
X-Gm-Message-State: AOAM530jSiclNNgCkGScbyhCyV/0MaqHyi6s5sa9dPV9inyCq8FRszGa
	IyS0NyDUDEejUz28e5kcQ8R4rA5IcTQO+A==
X-Google-Smtp-Source: ABdhPJz3cQnVUaOf77QbJVel5Q2PWRJaMGKyK6xtl2+XCF8FjWPKtec6pHIfCSw5K4FLsgaDdx/9AA==
X-Received: by 2002:aed:22c5:: with SMTP id q5mr29312156qtc.234.1605194500007;
        Thu, 12 Nov 2020 07:21:40 -0800 (PST)
Return-Path: <levraiphilippeblain@gmail.com>
Received: from localhost.localdomain ([192.222.216.4])
        by smtp.gmail.com with ESMTPSA id k70sm5230351qke.46.2020.11.12.07.21.39
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 Nov 2020 07:21:39 -0800 (PST)
From: Philippe Blain <levraiphilippeblain@gmail.com>
To: tools@linux.kernel.org
Cc: konstantin@linuxfoundation.org
Subject: [PATCH b4 3/4] Add pointers to https://linux.kernel.org/g/tools
Date: Thu, 12 Nov 2020 10:21:33 -0500
Message-Id: <20201112152134.96498-4-levraiphilippeblain@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201112152134.96498-1-levraiphilippeblain@gmail.com>
References: <20201112152134.96498-1-levraiphilippeblain@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add links to the Groups.io instance at https://linux.kernel.org/g/tools
in the man page, the README and on PyPI.

Signed-off-by: Philippe Blain <levraiphilippeblain@gmail.com>
---
 README.rst   | 3 ++-
 man/b4.5     | 3 ++-
 man/b4.5.rst | 3 ++-
 setup.py     | 3 +++
 4 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/README.rst b/README.rst
index 99fa339..274cf0e 100644
--- a/README.rst
+++ b/README.rst
@@ -33,4 +33,5 @@ Setting up a symlink should also be possible.
 Support
 -------
 For support or with any other questions, please email
-tools@linux.kernel.org.
+tools@linux.kernel.org, or browse the list archive at
+https://linux.kernel.org/g/tools.
diff --git a/man/b4.5 b/man/b4.5
index cdbd1d0..cc8bddf 100644
--- a/man/b4.5
+++ b/man/b4.5
@@ -402,7 +402,8 @@ Default configuration, with explanations:
 .UNINDENT
 .SH SUPPORT
 .sp
-Please email \fI\%tools@linux.kernel.org\fP with support requests.
+Please email \fI\%tools@linux.kernel.org\fP with support requests,
+or browse the list archive at \fI\%https://linux.kernel.org/g/tools\fP\&.
 .SH AUTHOR
 mricon@kernel.org
 
diff --git a/man/b4.5.rst b/man/b4.5.rst
index 9e0d995..2e1f5b0 100644
--- a/man/b4.5.rst
+++ b/man/b4.5.rst
@@ -275,4 +275,5 @@ Default configuration, with explanations::
 
 SUPPORT
 -------
-Please email tools@linux.kernel.org with support requests.
+Please email tools@linux.kernel.org with support requests,
+or browse the list archive at https://linux.kernel.org/g/tools.
diff --git a/setup.py b/setup.py
index 6ad18a3..65ede59 100644
--- a/setup.py
+++ b/setup.py
@@ -27,6 +27,9 @@ NAME = 'b4'
 setup(
     version=find_version('b4/__init__.py'),
     url='https://git.kernel.org/pub/scm/utils/b4/b4.git/tree/README.rst',
+    project_urls={
+        'Community': 'https://linux.kernel.org/g/tools'
+    },
     name=NAME,
     description='A tool to work with public-inbox and patch archives',
     author='Konstantin Ryabitsev',
-- 
2.27.0

