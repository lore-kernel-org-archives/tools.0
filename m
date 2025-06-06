Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84FC6323D
	for <tools@linux.kernel.org>; Fri,  6 Jun 2025 19:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749239489; cv=none; b=hKXiZgKZdHMVWu9gCLOxwEu7qB4Iq0OlLoJ8cbwh9RMrBr0gJ9MR7aw9nIQPiGoQPQekKyLAitjLITnCRiYqnxF1SN8313FnZ78Jpxev7pEJ1XJ1LSpRWL6eUQG2kexcF7Jk0Mj/EF0fxchq72eVssiOYCdVdNB7T/dBbFzmGks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749239489; c=relaxed/simple;
	bh=rYtM2vV6t4ziALDj+RiSOA7YKpMRH4GPE9/KSyUWm98=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QA0QykqqokwoH83rhJS6zs5ZLKPby12mXy8tqB1DP8bs2impJGjzaOQf6uprmt9oVu6rfX0GzqYPS+U6ZJQKsu0wxj6vk3dNa+K4GKig869I7jJrX+QJFE2+H7kKLm9w0hivyyfKHGo6BAcczC60VJifFKTzxdecLpkAFv9aHz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GiW6AOrb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GiW6AOrb"
Received: by smtp.kernel.org (Postfix)
	id 78F26C4CEEE; Fri,  6 Jun 2025 19:51:29 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9CBAAC4CEEB
	for <tools@kernel.org>; Fri,  6 Jun 2025 19:51:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9CBAAC4CEEB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4a44b3526e6so30175131cf.0
        for <tools@kernel.org>; Fri, 06 Jun 2025 12:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749239487; x=1749844287; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SarI6fJzp1EODUpr8YNpj6Ygrgwa1j34WyJOeOTIWZA=;
        b=GiW6AOrbgh23jt22EL003fXaKpQoUF7fQS0jL1PflLwCfvJ34QgSQE+lxn0vrTSMEl
         +YF7Wfkrau9qcch5fdcX+pZAiKuYkyGBFM3m2JCi0yO2/Yp7ysoTV4qwaVjSG5Fcenbe
         nUZmWsKrq5B9BG0iUlp7c3pNAfrj2FK9B7vQh7EDfmrRL09oT95BnSg/WjwJ4L+qzJ/D
         bIhSp+UgUjxevaFhkfgwlD7kmb41VPyas9wkIYSeADTf0vnaOptrWykym9uF3G4nk1T3
         ur0lbaaf2q5UWAyoNBOCbEnGenaJX3JENyS3tyx6pecHX2fVXL7iMeFmi0FIi5nxGjI9
         H19w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749239487; x=1749844287;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SarI6fJzp1EODUpr8YNpj6Ygrgwa1j34WyJOeOTIWZA=;
        b=CzpE03uT/dFfI1n3B11ABB1109p2jptqsrm5mpg0M8aUwWsH5fcx/lNNQoQHuoqlWs
         1D/UUqKAsEWftmhQetjhZxMAs9lXv+oG7tj37ZHs1UTssdR/Gg0655OjUtknXiemBwwf
         WufgB+kxuYJD0MjhGnpbue3cl97rWROH01smKRuqPxLJ9tTqTfetnWmhqZ6AiVOYpj0T
         oUefi39jIlLKgYWVi/L/wpI809TfgJdjbbG5kBoaEtb6JtzmiJotr/IZtexg+hNKx9bh
         4dI5X9Ktq9aAlVztoltv+jlibyjbB3guu7KyvOhLdeQ9wsDmYYPirMxJDPmmntr4Pn4Z
         OjXQ==
X-Gm-Message-State: AOJu0YxE1BElRHeeY24gEtkwknokLdhfCrQ79+CfFkk3QPSxCE9dwvgd
	X0gocmbVad+22Iq4e+dNKNCUIv1CEcjLvF2ZbQohevrTZjKlw+eYRubYN5cQIvbc
X-Gm-Gg: ASbGncvtOQiFX5e6qsSxBrPQim2ozvIuVP/T55P2jwj6gzzoghlsmB7bmCDAGEFD56j
	UHg/7UqNkSxpRDmi+NoJkRXCNfi+hCUqsCerUG5HozD6mu4XmsBm5FoaTMI98ywlBHc/8no5LEt
	sxXso7Oxdcu85mT6zNqoC1ojphof8GYo1jF3c8CsgL50qPDn8emLTSsgbwRY6PlQJ2+RnLEnq8P
	pSVokpRIdOgVUDHNZi4lXRDpNsZ4RcLLHcqOZahmUKmUn5smdtNIbvoxqX4C8I+b65Ml0UxOYMH
	yHqFzZozAfWvMnPMwHsxy3QCKLvV3uwisOtB9fqWyEbgxBw1JHSZS6Wce9SPdf+l9wAAuyZ99nX
	IK+P+H9qo
X-Google-Smtp-Source: AGHT+IG66veBy2BnwLNRm8U4kFihqEpT2wifV05oCxtJac9ddWE4fTzBwca1m1DTnMFpU4NhssRivg==
X-Received: by 2002:a05:622a:1cc4:b0:4a3:530b:2880 with SMTP id d75a77b69052e-4a5b9a2ac57mr88151951cf.14.1749239487599;
        Fri, 06 Jun 2025 12:51:27 -0700 (PDT)
Received: from tamird-mac.local ([2600:4041:5be7:7c00:d553:69f3:49b:5c70])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a619895298sm17718521cf.81.2025.06.06.12.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 12:51:27 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 06 Jun 2025 15:51:20 -0400
Subject: [PATCH b4 09/10] Make LoreSeries.indexes never None
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250606-uv-compat-v1-9-c76c1c8d6eeb@gmail.com>
References: <20250606-uv-compat-v1-0-c76c1c8d6eeb@gmail.com>
In-Reply-To: <20250606-uv-compat-v1-0-c76c1c8d6eeb@gmail.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 src/b4/__init__.py | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index a66c78b..b8f4c4c 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -502,7 +502,7 @@ class LoreSeries:
     has_cover: bool = False
     partial_reroll: bool = False
     subject: str
-    indexes: Optional[List[Tuple[str, str]]] = None
+    _indexes: Optional[List[Tuple[str, str]]] = None
     base_commit: Optional[str] = None
     change_id: Optional[str] = None
     prereq_patch_ids: Optional[List[str]] = None
@@ -795,8 +795,11 @@ class LoreSeries:
 
         return msgs
 
-    def populate_indexes(self):
-        self.indexes = list()
+    @property
+    def indexes(self) -> List[Tuple[str, str]]:
+        if self._indexes is not None:
+            return self._indexes
+        self._indexes = list()
         seenfiles = set()
         for lmsg in self.patches[1:]:
             if lmsg is None or not lmsg.blob_indexes:
@@ -812,17 +815,11 @@ class LoreSeries:
                 if set(obh) == {'0'}:
                     # New file, will for sure apply clean
                     continue
-                self.indexes.append((ofn, obh))
+                self._indexes.append((ofn, obh))
+        return self._indexes
 
     def check_applies_clean(self, gitdir: Optional[str] = None,
                             at: Optional[str] = None) -> Tuple[int, List[Tuple[str, str]]]:
-        if self.indexes is None:
-            self.populate_indexes()
-
-        if self.indexes is None:
-            logger.debug('No indexes to check against')
-            return 0, list()
-
         mismatches = list()
         if at is None:
             at = 'HEAD'

-- 
2.49.0

