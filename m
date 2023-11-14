Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7EF1B660
	for <tools@linux.kernel.org>; Tue, 14 Nov 2023 04:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aXF5y7mr"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-6ce2eaf7c2bso3205751a34.0
        for <tools@linux.kernel.org>; Mon, 13 Nov 2023 20:28:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699936129; x=1700540929; darn=linux.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5VglX0knGmCiNhsukOIPsPOPZeND1JJdOt1mxJTMODA=;
        b=aXF5y7mrOB+BhzqXI6/lJkU+SjBHNLuMkxJNcKuB/m4/6AGvlN811AVZzWOufuOCJq
         jNpFbzqsNBF5oyTisZ6woIA6iKAAWgP6rFwCvAQb4Bt96CuIThu818UgHoYpryPCbQTq
         w04CuX4vpt9aoV+PXEPpY7NFV82AUuViKYw5jtI1ofEUlbRGStSlBeGfh9DWrQIlm1rP
         irJbcRVYm3naZHsCbmkr7jfBrP98QHdLCblEY8ZbiKeVS2KodoIHuZCfseqZzFp+nX3h
         zy6BYBhSlAU0cSCTq6Y1vm2JPmAy1zvckBkSd6VB5ldYOa6GuKCF/oZyye0pfYessNwm
         wgrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699936129; x=1700540929;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5VglX0knGmCiNhsukOIPsPOPZeND1JJdOt1mxJTMODA=;
        b=VKyC6YnC4xQ3Y5LZ72leT71lOwebNmwmielf8912k8pEGcAyxDN7NGgIuesVdzH1cO
         yqSihjZntHPmLfmcnjWCiS1O1pf13JhrTcoE1U5MWWoCcxplJyOX6e7uZcZEWT7bjAEU
         Q9Y/QOE9lXwQQNoYV+oJOvr27170JAhtfkhLIy7tCCQHEVl6WW0bBELsWulqrydJ95br
         CSIgZ+8HsSbAA2f5ofEicECocvtvzH0XTAx51z4ipV6SzDYM2zzMAwLYLz19CbyLwn1e
         UCY8Z+m00OQ/Z6a/NQRed9D0OWTPH5iRyYs3dKA3jynmJo1qIB1IrkO5FGO/khdARqYH
         Nctg==
X-Gm-Message-State: AOJu0YyoEgQ84X1CeRZo+JztAwDsQ2aFG6sZg/73IuAsEA4ttwm2sK6F
	BGFYAvziv8P4LDwSzFEC0NnJHGtDdKbNdQ==
X-Google-Smtp-Source: AGHT+IHE0R5VLNapPFwOD9ntlTuy5RslCWIFWUgzwknIIiuVdQeu72Vkxd0OlvOJ9cfkRHLmMxlulQ==
X-Received: by 2002:a05:6830:601:b0:6bc:fb5f:7b06 with SMTP id w1-20020a056830060100b006bcfb5f7b06mr1415404oti.17.1699936129121;
        Mon, 13 Nov 2023 20:28:49 -0800 (PST)
Received: from localhost.localdomain ([2600:1700:70:f702::778])
        by smtp.gmail.com with ESMTPSA id w18-20020a056830281200b006d4760cc054sm110474otu.3.2023.11.13.20.28.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 20:28:48 -0800 (PST)
From: Mario Limonciello <superm1@gmail.com>
To: tools@linux.kernel.org
Cc: Mario Limonciello <superm1@gmail.com>,
	Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH] Fall back to non-annotated tags for pull requests
Date: Mon, 13 Nov 2023 22:28:35 -0600
Message-ID: <20231114042835.48432-1-superm1@gmail.com>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Not everyone uses an annotated tag, so fallback to a direct ref
tag if annotated tags fail.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 b4/pr.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/b4/pr.py b/b4/pr.py
index 6c01e2b..e62690b 100644
--- a/b4/pr.py
+++ b/b4/pr.py
@@ -71,7 +71,11 @@ def git_get_commit_id_from_repo_ref(repo, ref):
             lines = b4.git_get_command_lines(None, ['ls-remote', repo, 'refs/tags/%s^{}' % ref])
 
     elif ref.find('tags/') == 0:
+        #try as an annotated tag first
         lines = b4.git_get_command_lines(None, ['ls-remote', repo, 'refs/%s^{}' % ref])
+        if not lines:
+            # try it as a non-annotated tag, then
+            lines = b4.git_get_command_lines(None, ['ls-remote', repo, 'refs/%s' % ref])
 
     else:
         # Grab it as a head and hope for the best
-- 
2.41.0

