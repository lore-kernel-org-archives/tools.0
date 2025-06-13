Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C9C1A4F12
	for <tools@linux.kernel.org>; Fri, 13 Jun 2025 16:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749831559; cv=none; b=KMJfJ/KcA9h5Z9twhRZpYVFo706c+dDUZho6Ou8l3trt5CmQTvHD74dbqbF0fBqOIXEgUCr04Xjc6KH1OtJntqbF4+f3CxMBJmP/jvLK+/YRQvCONOEZT5l/rgcziH/PeKPzag538Ww7e3f9U75LQBRYjsGrot5zIY5XPgI+OO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749831559; c=relaxed/simple;
	bh=XCU6yZQqwMA8d18r7xQYMmevV89OF4QVzLo1/9uCh08=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IeXi1x4gcJlk6iBYO30qT+aS3WrODcivMN1xXO9CdpeAUW7tN4jhdbmHIkpmAm8JGpvbtFCOTVn7VZ5rr7XhqDSnHFc2GnIXGpxCT/fE3CJn2qfQyUpyRKKhfmaWoVRQ+VHCVVSdQ7pI85xqvEcYwVOIYHa80KzECOkEQts+1y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=XGJdbODK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="XGJdbODK"
Received: by smtp.kernel.org (Postfix)
	id 9FA23C4CEF2; Fri, 13 Jun 2025 16:19:19 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E530BC4CEE3
	for <tools@kernel.org>; Fri, 13 Jun 2025 16:19:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E530BC4CEE3
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6084dfb4cd5so6101805a12.0
        for <tools@kernel.org>; Fri, 13 Jun 2025 09:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749831554; x=1750436354; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iIYq2UbFVQKD6uSlqqrtj0cE70jjWRQayiHWD7Y0m8I=;
        b=XGJdbODKiEV0ePLZZODFCk5XNyEAoyvQ9TuoRL6dr3xEDAdxWS/S9rgdkEPvA0CXxd
         oHtoBopWTcOEbCI10SICvrtEKYKTpXDyPpu7b+qkIAgeFaIWtTkgJnmEUbkbQcraYbaC
         Pa/w4NFulm/iq6fe+WdymhqynxYXPyuMO2Lb5ySR1DRF5tgDU+fGKCw1hNxWPBYDHwOT
         NMUQiVbANM9dtAxVEiltCPCS+Ip6P1P9bZWeLOTPx0tXhb2O8Iq0lNXEb2Y5Jv9mPP2E
         Bt+Zo3tiLqC6ahCA3pf7563BOuv6dJX19Lu5lAFFy/S7luBMv2VFYCZ8TLZn8Fa8Oa2h
         kobg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749831554; x=1750436354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iIYq2UbFVQKD6uSlqqrtj0cE70jjWRQayiHWD7Y0m8I=;
        b=aqtD9glzHscKO6/96C6MCpWzk6zzMLMwpQRxQnq4/d3LZyTm+uGuPrdYbovG3KwiC7
         egwqVplK6NOqqgnDkX2G4Iqih0IwgqxaNtQ/l6sufmzdcVekuwstOCQ8F0t8PY7LD+px
         9OIgEg/mHhVPY66z2jrgQ0HXVhmJxL8E8ePx95se+2IsZ+mWe0icbpaCx9jl2ItlF0qI
         qjIYYf7UvDnwD5Ijdf0iBfuIpN8pZnk5Cbcxh/vSi6/wCSy0b9XyCjyHllQZjEK/Sw/5
         Nkl/dzYhwiWeaXDh1WA5tIeszM8S9XQUby/2WdRZa4D4zp2Ee1UiUGNoX7eVAz8TBf8a
         LooA==
X-Gm-Message-State: AOJu0YzzTWTtSg5Hs56xtWx4IY1zUA2MIr/JHJPL9V/JBbr7yOQsmL4g
	5SVzf/cWFOIDyNHENV+cXMmH1PhkX24sYLx9PrniXx3jRIwNrUQFUyWZ6ebc63KPcyc=
X-Gm-Gg: ASbGncs30fGWqGtOCH2jNXQAKuJKNCeKZTFWargQZm95Bi9QoFWYyPItX0pMyLhlutx
	loHF9VIFEcVgXzlUlCsDHidDg7H/qSi5YSpli55McXN0JS6dekhcypaaFalPpjN4YSEw/rQlOfs
	oUNN+IQYcp6n431WBzeMrIM5E6imQofSGHx0rZGtCpMVOMj9YBjM+jx6bmCkT/cOlSXKjkLtNIP
	xdhTfbWn6zDccGNZuATjVMACs8n5hTJxI0v4Xh7BwaQAm1vKg17ocaFs3cSERimG+ju1milRbRb
	mTzrpgqBqsWfnIS0B6CFk1RfEddbcXDmNHWfk+wvnpZheDVxnBXeT3fM11XoykDUQQ8=
X-Google-Smtp-Source: AGHT+IGG3BLboYmtH+7YAExm3q3e08PX3JJBDKEuYa3+dWYsC4bv+Vjs3IshRomT1qbeAgrFO7t4xw==
X-Received: by 2002:a17:907:7f25:b0:ad8:959c:c567 with SMTP id a640c23a62f3a-adf9c02d820mr34029366b.10.1749831554262;
        Fri, 13 Jun 2025 09:19:14 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-adec81c729csm152738266b.67.2025.06.13.09.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 09:19:13 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: [PATCH wotmate v2 1/4] export-keyring: Skip graph generation if the trust path didn't change
Date: Fri, 13 Jun 2025 18:18:56 +0200
Message-ID: <204f68d615855ac880f12d2de046fc694466b497.1749831371.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1749831371.git.u.kleine-koenig@baylibre.com>
References: <cover.1749831371.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1500; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=XCU6yZQqwMA8d18r7xQYMmevV89OF4QVzLo1/9uCh08=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBoTE9xTu4PU8EKfkGvmhgWXXAZ5sSd8RMyw6TQu 5VuKMSsb7eJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaExPcQAKCRCPgPtYfRL+ Tq31B/40RFaXv1nR0Ag9K+snpi7ZMDE8+1hxabAcptt2DEMfljCL8IYoEFUHXcxMRJuL4b4TVr1 +FuN+QdI/FlIH0/JahPjOW9wHTRTiPfAhKfzmEFqeRBnTvCe4dRM2z1Livk0SkQOF/8NFPGxtHI mRNt0bOIvNEDd3kplxmwc9TShatZzwJGmqEMvhIEs2qHV7u1NVsoPuGlt9oD6lrfTDqd21TYm1C 9wUaZ5Xr4Xo5ShF1XuOSeJyCwuQyo0Pd/8wpPHyNNv/L5C8+18CmIJQe+Dz5idb4D4x2MclnW9g IsygWgJYB2cFX1d1ulaLYKD3v3DRpukkQ9p/dPW7GcbY0Bt4
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

It can happen that a key changes without affecting the trust paths. That
might be a new (or expired) subkey or a new signature that doesn't
matter for the trust paths. So always compare the trust txt file with
the new paths to prevent noop changes in the svg representation.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 export-keyring.py | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/export-keyring.py b/export-keyring.py
index e6550f8ba429..686c77cabb16 100755
--- a/export-keyring.py
+++ b/export-keyring.py
@@ -146,16 +146,15 @@ if __name__ == '__main__':
         key_paths_repr = kpblock.encode()
 
         txtgraphout = os.path.join(graphdir, "%s.txt" % kid)
-        trust_changed = key_changed
         if not os.path.exists(txtgraphout):
             logger.debug('Forcing generation of the text graph for %s', kid)
             trust_changed = True
-        elif not key_changed:
+        else:
             # Load it up and see if trust relationships changed
             with open(txtgraphout, 'rb') as fin:
                 old_key_paths_repr = fin.read()
-                if key_paths_repr != old_key_paths_repr:
-                    trust_changed = True
+                trust_changed = (key_paths_repr != old_key_paths_repr)
+                if trust_changed:
                     logger.debug('Trust changes detected for %s', kid)
 
         if not (key_changed or trust_changed):
-- 
2.49.0

