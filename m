Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE371CD213
	for <tools@linux.kernel.org>; Fri, 28 Feb 2025 08:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740730141; cv=none; b=S86uEMF2DOruklIEEf9CZInalH+VCu9Hnmtqkfrcp8NDu8MHLTZb46bIXVqwx5so/tNbpjuYWsVmz5Qvcj6yM/6CtjQZFn1f1ZlFYIqaIdj9Lzh3NNtrwWWY9eHRuDx7NQAAWqZzyLwGAAPnWVJEd0vM24Nc6vx3RjChx+Cwwmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740730141; c=relaxed/simple;
	bh=1cX3w4iSa97t5VxPKcTZ+mHYPSKpI/i0zMRT8+6q668=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MLC+QowYrr7Wp8G7PksoJdFOXV2SjG1780W9nkYF/EjILfkEJ/Uul9l+kDuVuyeUv/c+vSZswFwd8Jrj+aOWpeipHxBZ5ynJ2/FydEouOHUBBRoCCbFb4xSQ9/upvuHviuquRMYQgPljtH21L9L5vHr6UPwo4scTBVUUyqZuH4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=YtylGpJr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="YtylGpJr"
Received: by smtp.kernel.org (Postfix)
	id 873F5C4CEE5; Fri, 28 Feb 2025 08:09:01 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 05BC9C4CEE9
	for <tools@kernel.org>; Fri, 28 Feb 2025 08:08:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 05BC9C4CEE9
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5e04064af07so3289546a12.0
        for <tools@kernel.org>; Fri, 28 Feb 2025 00:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1740730138; x=1741334938; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o6taZvXGdO7DBgthtKDEzzet5yJ7thd6EwT6KTLfwl4=;
        b=YtylGpJra0105eedbmTowFDEn3rK/Ccxoi9OpW6g0HoofW+pQk0TTugPW5BFF+hjmA
         UotXJy5ItuYij0y/Vmkqsd/t/F4aEkATBnEYNjGzxxAuq7Ui3MAplIR6G9wRMr3goQOu
         b+B6jJaTcxUwsGuRE5ZDIrqPqKPyXtBDEPbtLBfllXG+NR6eDvKBX4VqBq2ulzubxtUc
         v3ffBDcbqVbH89IWyUNNo7kqxDJmS7kpbtgpHLk7htO1lOYtfCt0aSgJ3J+hw8Wcx6RY
         rj4K5JlJwpff9oG5AfSphjVfEbRHsfgVHFmpTEtBB5+lDYFyDDDs5R9okEiXBXPO+HBm
         eAaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740730138; x=1741334938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o6taZvXGdO7DBgthtKDEzzet5yJ7thd6EwT6KTLfwl4=;
        b=IaNMHMGVeZW/EW4G1QWaEohr7jkkNwJd5Dd9a2Ga2jHvKJzjTIQ2e6fvRJXY9WhGXi
         y3xJYMjEqnTJS3QMWThqmyNCCeuoCEnvknMADgbZ+I8APWSLQ2Ept93nXZhrjvuuIe7M
         5KsBGemJA4t5cPpLYIeAmg+CBRQXWrRFl8ZZCUrnzJW9ElLQkB/HyAd66sbrFu+EdoYF
         Mw4akYxWTTtKQcOwcSKLFRwlGVyfdCn2gTwnHQTVP5vCkBpM9iq7WiGmY/Exu+Ag0ymN
         fCPzzWiVHLDp/kRrEmvKA0GKfyLxDTl1NM9ufT+yPbhuLgYybAIu/iZONT43UMPHDQlI
         ASBQ==
X-Gm-Message-State: AOJu0YwsfItqwPzdQtSF3frfZ9pOmiZlV1X9KrQVS68VXzByXyPUm5Ag
	DDCncr58+ZT8e90wtAxuyXTHxHkK9TRsHaC40QdNlDFgsoNBONl14fmNjpxD1AzjErfI6FRcCpP
	3
X-Gm-Gg: ASbGncuGD3WGIm1XwQN0hojRrHhdoybDeeiFBci1PpfU2k1oB0iJlFSY3aKmiMXgl4o
	6Bl30yo/9zxOJom0G3hgHtQ/7jdt81QMw56IyX2gcq8ivmAW1Tr35poNI6yfBiVwByK2RsxbxiZ
	ICmVuiwoH271LC/tUcpOyZhbr3sm9jJ+kL7T7pzVo8VYlejNW9vpNou42FJ8OQYjL7dTlI9hkhE
	+3ld5RxXsNG1M2BVkqOFH4ICDNCOFChdpUTHKJ3z8XIUN5iFVKIihM6GOXl1OZ+XWwDkg997dJh
	UUMeeW3rb9HIWYLRYCNSdPzw5bR/AJ1cFTzsJ7oQ0SoUIhfdZgcbDikWMAZNECZR
X-Google-Smtp-Source: AGHT+IHKfeTwWxUoyutlRMyMNvfNay8ViUBSlKbQ4F0oPyWQpgFK5VnITZRMRVIIDso/2cX6CmPORQ==
X-Received: by 2002:a05:6402:2105:b0:5e0:9390:f0d2 with SMTP id 4fb4d7f45d1cf-5e4d6b62652mr1571097a12.20.1740730138281;
        Fri, 28 Feb 2025 00:08:58 -0800 (PST)
Received: from localhost (p200300f65f2c000400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f2c:4::1b9])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3bb7363sm2174859a12.46.2025.02.28.00.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 00:08:57 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: [PATCH wotmate 2/3] maks-sqlitedb: Annotate fields from gpg --with-colons for feeding in the db
Date: Fri, 28 Feb 2025 09:08:38 +0100
Message-ID: <529f0dd7e10e477cc6b8c74c3283f9baa8db007e.1740729275.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1740729275.git.u.kleine-koenig@baylibre.com>
References: <cover.1740729275.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1770; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=1cX3w4iSa97t5VxPKcTZ+mHYPSKpI/i0zMRT8+6q668=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBnwW8ItHkb8s0SG80szF0w7ckVCNIDQXVfZlcj2 ohVOJr61eqJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZ8FvCAAKCRCPgPtYfRL+ TnWgB/93T/91ImWRW3wkcJJUYcDxIgVOH6Zrob25LwmE8jsFS82lWlh47HN680jVnitN4v/7xx/ 543Tku6JnV3gtynP3Le66gE2YZUhqndAxGXASzWAiP92jYdQNhQYIhNfyPk8ub8pGgc7a6TmtNM bLkxDQj04N+fPz5kAHFM3voix1ipVFOzjOMfYCZp3h/4nBmyPcDhmV834cecNfbuIyk1F88mW3v ULYvEJcwcDHtm89VCo5HInt7Tl3hNU2HoWFmmzypwb6v09SYOrmEYmZxe5PllI5zynD7eks42K6 G4nS4kpv3pLNBa2qQqDqYMCgRLGGBg0BlA9WM8r20waROsCX
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

This change helped me to understand what happens when working with the code.
---
 make-sqlitedb.py | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/make-sqlitedb.py b/make-sqlitedb.py
index 6a4999b636a5..fec199def51d 100755
--- a/make-sqlitedb.py
+++ b/make-sqlitedb.py
@@ -32,13 +32,13 @@ def keyring_load_pub_uid(c, use_weak):
                 continue
 
             data = (
-                    fields[4],
-                    fields[1],
-                    fields[2],
-                    fields[3],
-                    fields[5],
-                    fields[6],
-                    fields[8],
+                    fields[4], # KeyID
+                    fields[1], # Validity
+                    fields[2], # Key length
+                    fields[3], # Public key algorithm
+                    fields[5], # Creation date
+                    fields[6], # Expiration date
+                    fields[8], # Ownertrust
                    )
             c.execute('INSERT INTO pub VALUES (?,?,?,?,?,?,?)', data)
             current_pubkey = fields[4]
@@ -53,10 +53,10 @@ def keyring_load_pub_uid(c, use_weak):
             if current_pubrowid is not None:
                 data = (
                     current_pubrowid,
-                    fields[1],
-                    fields[5],
-                    fields[6],
-                    fields[9],
+                    fields[1], # Validity
+                    fields[5], # Creation date
+                    fields[6], # Expiration date
+                    fields[9], # User-ID
                     is_primary,
                 )
                 c.execute('INSERT INTO uid VALUES (?,?,?,?,?,?)', data)
-- 
2.47.1

