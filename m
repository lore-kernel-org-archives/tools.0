Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8606228136F
	for <tools@linux.kernel.org>; Sat, 25 Apr 2026 19:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777146600; cv=none; b=cJt+xP+yueHTRQWvvvCu81mA2s3jEnv2An9oxUEtaQSpl25OJjjE7KfRdp8buuumyQbnPatFLzkFqkRZ7UqpLxmoGXeYfcxYC0PFGLX5ojV3ZXLpkxV2pTHOW1igWHaWwtmHFhD1T8DPaBpBeHwEPNWwRaDgsn5J45AtBP5T0j0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777146600; c=relaxed/simple;
	bh=AMvJOhvz0SsRFvkYqoBjWg3enVtXuBjo2cP5STZHzg0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dt+J+RdpW6TsfEaBOr5zugju4tu+aWXfM1svW7eyTat2DcM1TvnhtqVa/11FvKsQo+PYQ/leqVYgS/oX9PR2Hbvg1mc5CSUOc+NPB1v+uw++78TEWhsOz3ONttgaRD2zj9sigYnJ8HbP8qOtlQaiEFXYl0LXmbPXPxVxmZdnBLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QVVglTYD; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QVVglTYD"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-12dca45c95fso86040c88.3
        for <tools@linux.kernel.org>; Sat, 25 Apr 2026 12:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777146598; x=1777751398; darn=linux.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rAVYOu7fuOGc0oHBPu6bl+5iZUjtgUoqzhpeOAwy7FI=;
        b=QVVglTYDGMv+9a0MpVeG5U+LvOolKiYP0nLEf8aMT1TTqgOvog2dbQUViAgmLVWyeq
         U3JVSSk8dM32Oc+7QDeqg08NiMwYEVgrQZSRw4I9RKNl+Gj5dKOQYJlHQ7ckJFmJhtbM
         UpmfRja2bXCpJVRH1eLOGG4aQr1BfaMNjyMxzUXZWmkHM6RCpgXT4rmHdn459v+BmoUW
         4I1j0JlYY0dT6Y+Xh+0EY1N0g5ehytOD1cmEvqePRGC3ozLCzYwohTxi6PM2XJ6IlXL9
         axMg8w4jivnFrdPyWhTQ9gY6kzP7gKIXMLN7+woJyiut4bXsgvMF5PYPo/ZQNoUkfS29
         og+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777146598; x=1777751398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rAVYOu7fuOGc0oHBPu6bl+5iZUjtgUoqzhpeOAwy7FI=;
        b=i9AX0Si2IBphOYbqAMOFdFJQywOuDQqFuZbDzocxteMFjcLr7DuSm3bZUBLUnIVqd5
         +XrEhXSYCsB7AneUqdqyPkjOv789AP9zRP5nXNPK3h3wEfwXMaP+qAoaB07UG79pQN2v
         MtlXUJiqW1urimMoD/TogFEt181NBG2DAtCOSbT4TMYs7d4TR37YJTFT5QjL+PKcvtGT
         n66OnCUGF60aV1NflT9OuL6O6/xd8cXwfUlJ1HaHjuCrVqxBj3luOvIUr3uzTTU2Junt
         NfZyf8CP34BgZsACuxQ3IHx0+NTXOTJfXZmbCuzou3pRu0khnZAl+BFSu5z+cdzH2Llo
         FqCA==
X-Gm-Message-State: AOJu0YwQp8KPvq2SqiYRakMr1AmxfeLzvnNoNhv+tFBiDCnT3TqS+1nn
	3Y+KNDax+b2XJV2vR9Pe326jvd4KZ8AT3ABFfC6YcHXVMVFICUAq0R5k1pQoHg==
X-Gm-Gg: AeBDiesAZ6wH+rVoBMK9F1uChmprIjZC6dusFv0KlE8eBL5sOeoDYADMNkZtGCZXt0u
	pl2M4TjHl00kUxp/pndIcjYVYOiKK1ahaiwrA2Zxgo9yZABDYEejYULr0rrVvgZFLORez/Jk57s
	xmwVtW8OIbWfQjoo8BUMiPC4GyR5Z0+xbw7uOzwnLZtz3XiDaPMuoU7O+l7OKMYbZ9jkuQUAjB5
	wvOcSDNJP4JNtz3em60/95nC+f7ynVBXgL417tRdwFBfLLsw6AplkVdgXs0kb+wNzAzd+ULDiIQ
	Asl2n7W466jbu1TVtS5uBEYBoVhG6o+tBJKppC6t31TysmLgFRTJcGFMXtm+KXvecVXnZoH5lVP
	dDesJnjXgNb4EtltAPWBWcY9N+ZEGR31rVYMW4SIDHjaY7ewduqm9hnhEMIUwqJAGJN+gOcETVV
	yLxfaxOaSOW8/AxFin+uGFjGbAUvULWG/SLbVraSyR3urm5G5NU+OmzXTpJv4bJPpWOBb+IOX9Y
	mlT/CnQCylbWtziMMJG3OI9
X-Received: by 2002:a05:7022:6085:b0:12d:b4e2:f566 with SMTP id a92af1059eb24-12db4e2f66cmr4561130c88.4.1777146598501;
        Sat, 25 Apr 2026 12:49:58 -0700 (PDT)
Received: from localhost.localdomain (187.250.115.107.dsl.dyn.telnor.net. [187.250.115.107])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c74a20eb5sm48512078c88.14.2026.04.25.12.49.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 12:49:58 -0700 (PDT)
From: Adrian Neftali Sanchez <lutgaru@gmail.com>
To: tools@linux.kernel.org
Cc: konstantin@linuxfoundation.org,
	Adrian Neftali Sanchez <lutgaru@gmail.com>
Subject: [RFC PATCH 01/13] tests: specify UTF-8 encoding when opening files in text mode
Date: Sat, 25 Apr 2026 12:49:29 -0700
Message-ID: <20260425194943.1499-2-lutgaru@gmail.com>
X-Mailer: git-send-email 2.45.0.windows.1
In-Reply-To: <20260425194943.1499-1-lutgaru@gmail.com>
References: <20260425194943.1499-1-lutgaru@gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Python 3 open() inherits the locale encoding by default; on Windows that
is typically cp1252 rather than UTF-8.  Explicitly passing
encoding="utf-8" makes the test portable across platforms.

Signed-off-by: Adrian Neftali Sanchez <lutgaru@gmail.com>
---
 src/tests/test___init__.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/tests/test___init__.py b/src/tests/test___init__.py
index 3c4c2d0..5544978 100644
--- a/src/tests/test___init__.py
+++ b/src/tests/test___init__.py
@@ -75,7 +75,7 @@ def test_save_git_am_mbox(
     dest = os.path.join(tmp_path, 'out')
     with open(dest, 'wb') as fh:
         b4.save_git_am_mbox(msgs, fh)
-    with open(dest, 'r') as fh:
+    with open(dest, 'r', encoding='utf-8') as fh:
         res = fh.read()
     assert re.search(regex, res, flags=flags)
 
-- 
2.45.0.windows.1

