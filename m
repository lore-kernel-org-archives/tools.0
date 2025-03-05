Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC16A16CD1D
	for <tools@linux.kernel.org>; Wed,  5 Mar 2025 23:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741217385; cv=none; b=DT6oiQengcvQLtC/PK28cnkptci3PWVNbaySODEtUWHEynrs9AfYmZz00ffwCd0PS4FKc0XoHqr6J6wQMJEqQGNfHFDkSGKcKviG+bN3xBbQuyWRSkt5WyqIrE7v5voVYRtHO/U0U5HfHkSujgyYvGAkLZ/bmpW2DoXKVAX8Blc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741217385; c=relaxed/simple;
	bh=ANDpuTkdQZw9uon2+dDnOt4k4aTa/nFR7xibMcxgBgY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=Qf/ch9N5qyO+d3bkAuGgLl/F5YBAcUKCrBIOcuTU9Nki5DLX6N54Bs3571Bm+wZTadAaQeGvzsrrUi38f9zsAb3+WmwA4FIEz0nVDCdrn80KcODZ5V8QX+NVuKBLie57EHFGkkk7K5CZJMmz7NkP4nKzmqvZ4A7WUnOTEcQ/0s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=G/P48WvD; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="G/P48WvD"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43bcf9612f4so16313045e9.3
        for <tools@linux.kernel.org>; Wed, 05 Mar 2025 15:29:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1741217380; x=1741822180; darn=linux.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=GHTXOttKWe+LX92ovHRmbeDa/owPrjhIed0YWRQH3v0=;
        b=G/P48WvDE+PlKfhNp9e1vH9D+xVaywlV/gHkEh3/4fQUWRwURcMPlqX+2++2vD2Bhv
         HgK/Y7tV39d/37dMVx4c88EnwdX22BODcMe2+PI+Zh1Brepq7phYty1TDCpxnraeGz0C
         dYBV3QQUOpuhP+UgGA2Q0umMJFuS1to2d08wp7IHzMXarayVkubzS3fFa8dTDoKNUqU0
         66lJ2zGMm08KxATcjtCzl2T8YFalgcuZkIIyBIJ88eatlwnCcaUzD7jaM1ZELSnkDJdk
         34+SRbMGvLA533bq/liCpz86CWdQxLA7NMUO7XA3x05tRMpEc/1B3JXxQbuzNI2W24tb
         /L3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741217380; x=1741822180;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GHTXOttKWe+LX92ovHRmbeDa/owPrjhIed0YWRQH3v0=;
        b=fP8Z6t6YKr0oRfRJSclE25RRTwRQ+4Uo7S57Rq5c8MXe8TJdih+ZqG0nB1TcpDpid6
         W3oUpJCyVi9Sm6X+zWrJSeSDHCjSb6aF6I/4GzRAKrC3bO68Un3sgd2TdOlYRmdXaPug
         pVaPgYg+PsoKlA1vUFJcQsokv7RTSBXTb9lB5pxk7LhU5NgBKhc3SdsbCcB8IqA8BQJu
         iDFI36UBYRF9E9L7s6sQjAUPeEr0/inyA/mF+D/ko9LsEI+uMlI9esr3c4d8OA9wwOxL
         6Ow2U5DWe1VhliQtXS9q+49e2uN4F8o5UduHvkLyXUp+mdvIMSrt4LV5PK0135OV1XC6
         cvsQ==
X-Gm-Message-State: AOJu0YxRUg6DJ9mPDMTx95SW9+Xkaw08btv8cqaugEcjYqHsS68dHUu5
	lYwkp6UJT2suAhHulXRSSLlvvCjoy5nmlUzx+BvYw+p6OWDqGBA1KO9DvqNNzPgHS+11xZeVHvD
	V9do=
X-Gm-Gg: ASbGncvydlyS/IVa81juZHQhDEW/yZ1ymOEn+YJt1DMTn3ueqGjA6fsn7E5waYL3JEa
	56VKsXVx8M5OY9+FhCYSRzFvRMpYqfoC353R/hWJdKKYovBMgiRMdPiyRyI5PQm8lYNHEsDPUF8
	iRBtu1pmNjgZxO2Mgu6UJZBxwstnszsTLrTlc7l5U4m/emWU0k6KnU+HKwUAgmjKyKy78h7ocg5
	W+iVePkPN6hRB63QEEdbdUHs9wC/heDDsjQFyYcBWF25wCzWELVVeN+HtR5jnXEaIv47qCtoUjD
	GNhwepq/H5bwc9RpPjJ/hSO0ZXaWjb5B0KnaHgOZangD1+fez6t7vf0Mm/WeU5PnSKlwc8bkWT9
	MwKvXJUamjMHRQd0=
X-Google-Smtp-Source: AGHT+IGGd5+nQXWskwHWlC+mEPtireAaqMarlJjI7qg2l6nn57+mYEab/DHp5EbwNkkEAMQ61RyPfA==
X-Received: by 2002:a05:600c:1d01:b0:439:9f97:7d6c with SMTP id 5b1f17b1804b1-43bd2aec224mr37784875e9.29.1741217379713;
        Wed, 05 Mar 2025 15:29:39 -0800 (PST)
Received: from localhost (lfbn-nic-1-357-249.w90-116.abo.wanadoo.fr. [90.116.189.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bdd9470e2sm1270235e9.33.2025.03.05.15.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 15:29:39 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: tools@linux.kernel.org
Subject: [PATCH wotmate] Make the nodes representing a key a link to their respective graph
Date: Thu,  6 Mar 2025 00:29:24 +0100
Message-ID: <20250305232923.2902664-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=729; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=ANDpuTkdQZw9uon2+dDnOt4k4aTa/nFR7xibMcxgBgY=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBnyN5UPNBcJKyWWvlyBEgKVkQeHb2uwGgRtH/Lv 7vFxdEAVWmJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZ8jeVAAKCRCPgPtYfRL+ TpalB/4zGCbhHqvEhdCqe1jry2iI/pPhIXmq2dDE31kQEP1fbXWeMCQWzrMgGQyqLgUYykQk+Fh JiQAtwx8YV8t2svzFSpoIf4Dz6dZgFEw+Sp+K1rwjIzX0pajSGPtnVcjDGHortKGMqN9MHpGTVy 2U/+5EgHpLGFiB0upJmoSb5cmBHWW8xkTIggpov4YhIfgFTQH0/GLgCV2T6eyDf7OhIoZ0iwGsg kcQ3D4zOGZDO20/wEmfYYnQWvedzH/1VvgPmWnPY3fOq6HLdpKmDrBRSUDsEyMVz24UaW/o2Os/ Gfhg4M+Y7aksBUnBYApgxeyh/wyXf57+/LzE1Al+YzcjM7pu
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

With the URL property set, the nodes (in some renderers) become links to
the graphs of the key represented by the node.

---
 wotmate/__init__.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/wotmate/__init__.py b/wotmate/__init__.py
index 128a183f2c9a..32f91cf2a75b 100644
--- a/wotmate/__init__.py
+++ b/wotmate/__init__.py
@@ -224,6 +224,7 @@ def make_graph_node(c, p_rowid, show_trust=False):
         anode.set('label', '{{%s\n%s|{val: %s|tru: %s}}|%s}' % (name, show, val, trust, keyline))
     else:
         anode.set('label', '{%s\n%s|%s}' % (name, show, keyline))
+    anode.set('URL', '%s.svg' % kid)
     return anode
 
 

base-commit: 93e1fbb1bab72162c75ba3311513daa6f8abd231
-- 
2.47.1

