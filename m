Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F6571
	for <tools@linux.kernel.org>; Fri, 18 Jun 2021 18:24:54 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id m137so11508878oig.6
        for <tools@linux.kernel.org>; Fri, 18 Jun 2021 11:24:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Drhod4QBUp/rvIhOpOAGANA1DGraU1ivV3q1yVAQrjw=;
        b=sRYrop5whMRKxl6puDMDLofTxxVW3Q9r74D2L8P8CpaGGnxX5+q6p+7qVn99Jby5U+
         wmxzl/JQdv+hHKSaA7OcnxLNPLrpYxyNI7tVMFWF5KgOA2iisMDTY+FPVyuILHTB73MF
         4c8odEtIYfSsb1uK6av3yd/xkFK4tZ8LllvLg3TYjLpwAm4khdlKC0QyNH/3lKwV4l+k
         LY2TnsZ9fXmtbCxl0WyVD/4bhNyjYUR4QG6yBZ73HqrOPvD3Sp43WFVIl73QFjTl+hCl
         dK76j4SqXsnzxtvEEqGhMSVX0JkpCWhkUpSubGhDmkRajklKq5gcGMrDVFh5JyeMjEcR
         OorQ==
X-Gm-Message-State: AOAM531QtwDHnY/B0DlCG4GVwmRJqdZat2/mHx7H5PA+J6so/5+srQ2U
	+rR+Dm0f05Dbq8c6qYCPweiuI+1fVw==
X-Google-Smtp-Source: ABdhPJz4hN3uND8Hk9kpEbBaZGdnYw6xyCEnfBuXEh7xenJzOo51fli8xy08gdlJP4S0R8R9Jk0crA==
X-Received: by 2002:a54:4889:: with SMTP id r9mr1720674oic.101.1624040694066;
        Fri, 18 Jun 2021 11:24:54 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.248])
        by smtp.googlemail.com with ESMTPSA id c12sm1953006oov.11.2021.06.18.11.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jun 2021 11:24:53 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: [PATCH 1/2] check_applies_clean: Don't append '.git' repeatedly
Date: Fri, 18 Jun 2021 12:24:51 -0600
Message-Id: <20210618182452.2577871-1-robh@kernel.org>
X-Mailer: git-send-email 2.27.0
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In check_applies_clean, each iteration of the file loop in appends '.git'
to 'gitdir' again which is obviously wrong.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 b4/__init__.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/b4/__init__.py b/b4/__init__.py
index 8d8911d392b5..ddf38293dce2 100644
--- a/b4/__init__.py
+++ b/b4/__init__.py
@@ -655,7 +655,7 @@ class LoreSeries:
                     logger.debug('Checking hash on %s:%s', when, fn)
                     # XXX: We should probably pipe the two commands instead of reading into memory,
                     #      so something to consider for the future
-                    ecode, out = git_run_command(gitdir, ['show', f'{when}:{fn}'])
+                    ecode, out = git_run_command(os.path.join(gitdir, '.git'), ['show', f'{when}:{fn}'])
                     if ecode > 0:
                         # Couldn't get this file, continue
                         logger.debug('Could not look up %s:%s', when, fn)
-- 
2.27.0

