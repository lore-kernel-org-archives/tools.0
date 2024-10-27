Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5A717C61
	for <tools@linux.kernel.org>; Sun, 27 Oct 2024 22:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730068508; cv=none; b=n0rw0SVgH/qy6InvVK1/5/eQBQRIxh6lhZnb9kycUckhtQWC1wz8MqlGoJbn3E84hDczJP7Hu98BopoWQQqzRwIYa1iCWzatcNA1imExSFRYCFwGhzvaLj9AB0TxYU5VQF+BFJ66BAln/Lq1gpOgElYi+uPhiC2JLyH/7zqz2Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730068508; c=relaxed/simple;
	bh=thCIny0xdSEb3Ln2jH1SbxowWtegy/WhlByPuh253ZY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HlNo8icHxqrOztrhbCwepRHHaBsKHecPYXJxFEHrhsfk4YrXN0fAqQA/0yUdXCcPsLgEdZRZvYc9HCyzKTfYWW5B527pGxrHVTRwpGtBFBafeNOqJ3+zOxgcjZN40WGM6AjZRcazINtOiGgYTqCae6GuZCsR9ryWGPyDdQWKOg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mn9w5ztu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mn9w5ztu"
Received: by smtp.kernel.org (Postfix)
	id 00CD4C4CEE4; Sun, 27 Oct 2024 22:35:08 +0000 (UTC)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1349DC4CEC3
	for <tools@kernel.org>; Sun, 27 Oct 2024 22:35:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1349DC4CEC3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-83ab00438acso104394239f.0
        for <tools@kernel.org>; Sun, 27 Oct 2024 15:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730068506; x=1730673306; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NqO48nwk3iU6ftYH6BC4N8HDnAY5f1TAntteR8wnKDY=;
        b=mn9w5ztudHkJzCwNPlaU+b5qh0rGCDBGnUF7X3Y26RQOEI/+mI/wuGE1bnQlsWgBtT
         pPgg3issYHVP7rbzdAETocD2Z7ljqiJzAMvo9pWfvt8DvHDckY27ValaWcmtkFQBq04F
         pl5xIE6AlQoaA85QWwoVK8IAZARBTtF6rI+Ba+1NENHxYO4ZYJ5qjPmSJ60AVa4V5qdB
         PpiaGgSnbI/ngC4H1nnCp0mb1c8MPxSTa7DUQ1LrnUFTY9gy5UQQ+7TNQrxIpTSPo4EJ
         4HQR5AnagQNjc8plrxaSD7AZFOYY84risYuorvM5pLFm9rSBQwTKzGuSUAc/av1e+mlD
         sDVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730068506; x=1730673306;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NqO48nwk3iU6ftYH6BC4N8HDnAY5f1TAntteR8wnKDY=;
        b=On11uIm1U9cIeak4s9bsY6NdT8yyhbA/kcKk8vEMWUif8kSKB8AhrIJa4NWCw/cysy
         0rOaKM/EWy9OAqgAmcs+bZ+NM6ha8xbVCEgBPLt2Cpqles1Q6WPBF2dhYEW1AVmBmCJP
         iUKIYt4hrF59wmDLioOE8MQhYFTuL8ZG8KI3HbSeRBjbv00zEdl2S6riUk+nRDami4hp
         MT8DiDSO1eSiMGQipOjvUxqvNTvT3be5s89hAYXiz4hzX9CrjPh3ayDf3LFmH9m9U7wO
         yUy1NDLbd793Z8s3aQLCaA0zCEvXPPXWJlVA1aUWXdjMhc7EUKzCSlPg+JY7sHq+0eZ/
         UUcw==
X-Gm-Message-State: AOJu0YyFdV4HPNiDQOmu9pjMjBCQuH11SqVn/A4QISV5W1zhnhTlsHKP
	+MFOv4ux/RHpcmmkx6cg68Ip2gR/Sa/t7EGyk7VkVSntWYgDJmF2NaDRijcs
X-Google-Smtp-Source: AGHT+IGkE6zq8I12kzS+ByrS2raPLhAfUJwhMHmNsElEAfR0eXbzjLQa1LiS3yq+/CKCg39vrPkZGg==
X-Received: by 2002:a05:6602:2754:b0:835:39a8:e201 with SMTP id ca18e2360f4ac-83b0406aeddmr850604339f.0.1730068506216;
        Sun, 27 Oct 2024 15:35:06 -0700 (PDT)
Received: from localhost (207-191-210-45.dhcp.imoncommunications.net. [207.191.210.45])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-83b137de1efsm124278939f.15.2024.10.27.15.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 15:35:05 -0700 (PDT)
From: Brandon Maier <brandon.maier@gmail.com>
Date: Sun, 27 Oct 2024 17:34:58 -0500
Subject: [PATCH b4 v2 5/6] b4: handle trailers with special characters
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241027-trailer-special-chars-v2-5-e963f78b3ef8@gmail.com>
References: <20241027-trailer-special-chars-v2-0-e963f78b3ef8@gmail.com>
In-Reply-To: <20241027-trailer-special-chars-v2-0-e963f78b3ef8@gmail.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Brandon Maier <brandon.maier@gmail.com>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.15-dev

Parsing an email trailer with special characters breaks the formatting.
For example this trailer.

> Reviewed-by: "Doe, Jane" <jane@example.com>

Will get parsed into this.

> Reviewed-by: Doe, Jane <jane@example.com>

This is because b4.LoreTrailer attempts to reformat the trailer using a
naive string format. Instead use the Python standard library formataddr
function which correctly handles special characters.

Signed-off-by: Brandon Maier <brandon.maier@gmail.com>
---
 src/b4/__init__.py                                                | 6 ++----
 src/tests/samples/trailers-followup-bare-address-ref-defaults.txt | 2 +-
 src/tests/samples/trailers-followup-name-parens-ref-defaults.txt  | 2 +-
 3 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index cf112e3bce2911c78cff18aac267608f796957ab..0785be8ffcef08fb5cd4c484a40e6fe856446cfe 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -1061,10 +1061,8 @@ def __init__(self, name: Optional[str] = None, value: Optional[str] = None, exti
                 self.type = 'person'
                 self.addr = email.utils.parseaddr(value)
                 # Normalize the value with parsed data
-                if self.addr[0]:
-                    self.value = f'{self.addr[0]} <{self.addr[1]}>'
-                elif self.addr[1]:
-                    self.value = self.addr[1]
+                if self.addr[0] or self.addr[1]:
+                    self.value = email.utils.formataddr(self.addr)
                 else:
                     self.type = 'unknown'
             else:
diff --git a/src/tests/samples/trailers-followup-bare-address-ref-defaults.txt b/src/tests/samples/trailers-followup-bare-address-ref-defaults.txt
index 7b1ebef3c9d9b9c60288dc07bcf7f82f066c6934..82e1576019bd9f4d69f9a2ed9b783340a5ea16b2 100644
--- a/src/tests/samples/trailers-followup-bare-address-ref-defaults.txt
+++ b/src/tests/samples/trailers-followup-bare-address-ref-defaults.txt
@@ -14,7 +14,7 @@ Cc: bare-address@example.org
 Reviewed-by: Original Reviewer <original-reviewer@example.com>
 Link: https://msgid.link/some@msgid.here
 Signed-off-by: Original Submitter <original-submitter@example.com>
-Reviewed-by: Followup Reviewer1 (corporate) <followup-reviewer1@example.com>
+Reviewed-by: "Followup Reviewer1 (corporate)" <followup-reviewer1@example.com>
 Tested-by: Followup Reviewer2 <followup-reviewer2@example.com>
 
 diff --git a/b4/junk.py b/b4/junk.py
diff --git a/src/tests/samples/trailers-followup-name-parens-ref-defaults.txt b/src/tests/samples/trailers-followup-name-parens-ref-defaults.txt
index 06b883126bd3ea9f7a4d22c58fc10e9e89d6bde7..dfc013c89c415107ff2517c1715e523982df2afc 100644
--- a/src/tests/samples/trailers-followup-name-parens-ref-defaults.txt
+++ b/src/tests/samples/trailers-followup-name-parens-ref-defaults.txt
@@ -13,7 +13,7 @@ Fixes: abcdef01234567890
 Reviewed-by: Original Reviewer <original-reviewer@example.com>
 Link: https://msgid.link/some@msgid.here
 Signed-off-by: Original Submitter <original-submitter@example.com>
-Reviewed-by: Followup Reviewer1 (corporate) <followup-reviewer1@example.com>
+Reviewed-by: "Followup Reviewer1 (corporate)" <followup-reviewer1@example.com>
 Tested-by: Followup Reviewer2 <followup-reviewer2@example.com>
 
 diff --git a/b4/junk.py b/b4/junk.py

-- 
2.47.0

