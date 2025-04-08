Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD32188A0E
	for <tools@linux.kernel.org>; Tue,  8 Apr 2025 20:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744145237; cv=none; b=YImW8ykwh0ks2a2GaccZ9sQKLpwx8QVRCC3nRHhf6cM6iJUSTYEXEpuvkQRxYujNdUnkGyHwYL5g8Y3JPa+S4JeqwRMpgOvxqVpzCvEhEUl2fQR+i+tmdyMgqaEQF92e+6zRjXx3q5zN1RICECMXRACMUFEbvo3cXrqMLlaCaqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744145237; c=relaxed/simple;
	bh=P4xuyqvd0BPLG+obGKyWR5eQr/L8BsyjFT9JyVxLrEw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YfcQ4dyvYRsuJWG+b3HvKyIf5w/gjUV/LvqYjaGfNY9+E/Q5XNQKtHmv1j79iZRlNiXssHPo9PVfxRTtBirk5uB8u4pl0n/XMsE/N+3ygi6TLX0gHMV+Iu1Sek7xLOFufWZFv0/bhQTfclZeqtQP1kFOMYm4jS++rbqFNjlTu7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vqf/D7zW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vqf/D7zW"
Received: by smtp.kernel.org (Postfix)
	id 9BEBEC4CEE9; Tue,  8 Apr 2025 20:47:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60F02C4CEE5;
	Tue,  8 Apr 2025 20:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744145236;
	bh=P4xuyqvd0BPLG+obGKyWR5eQr/L8BsyjFT9JyVxLrEw=;
	h=From:To:Cc:Subject:Date:From;
	b=Vqf/D7zW8TAswEWABRgcg+VSueWFEGMNpzqd12gbQxT+Ak1rPR7SGHF4aqJTW/S7w
	 t7ePKMHqy0nrxZYPFadx252eBv6vciKXk1z3Kxc2MaaC9759sjM4Axoh8pvI+hXsCJ
	 ldgpenMyWxkCqSxh4hJ+1UHDR0bzI0Ikui+LiYNtjIwg4XUpzrsB90p+Xb3EGJ9sZv
	 FwZp2FrGiznKDmDXDRJF4ich6SU3tE3TWC7k1mR4GPGabIB6i5N4CAV2HtL7b9hvoK
	 DYs151utFMLdiPmkd68WUiL1ajCi4FAZatkjHdQFK4SCTpEGBObEkH4Oawouk/7bFg
	 aKCD5hrVnGWTA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: tools@kernel.org
Cc: Brandon Maier <brandon.maier@gmail.com>
Subject: [PATCH] Avoid quoting email names in trailers
Date: Tue,  8 Apr 2025 15:47:15 -0500
Message-ID: <20250408204715.2787726-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A somewhat common pattern is adding an employer name to the person's name
in trailers (e.g. John Doe (Acme) <john@kernel.org>). The b4 trailers
command will re-write the trailers with quotes around the name.
email.utils.formataddr() does that as it is necessary for email headers,
but it is not necessary for trailers. As we already have the original
value, just use it.

This effectively reverts commit 832010c4d50b ("trailers: normalize
address after parsing") and all the follow-up commits touching this
code. Maintaining quoting or lack of seems more important and common
than oddball 'mailto:' links.

Cc: Brandon Maier <brandon.maier@gmail.com>
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 src/b4/__init__.py | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index 99ece6484d8e..de324d0f714b 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -1062,10 +1062,7 @@ class LoreTrailer:
             elif re.search(r'\S+@\S+\.\S+', value):
                 self.type = 'person'
                 self.addr = email.utils.parseaddr(value)
-                # Normalize the value with parsed data
-                if self.addr[0] or self.addr[1]:
-                    self.value = email.utils.formataddr(self.addr)
-                else:
+                if not (self.addr[0] or self.addr[1]):
                     self.type = 'unknown'
             else:
                 self.type = 'unknown'
-- 
2.47.2

