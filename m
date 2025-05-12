Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189F3257AC1
	for <tools@linux.kernel.org>; Mon, 12 May 2025 08:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747039175; cv=none; b=h95YZoWeVfOhaHE1HP7z3WoYevDnH+qQ/1TDdjfefWgVb9dL/IiYaDuF9eRddyyVdWWUUq2OMWWeyohhU4E2Fg/dk1t7uuHn6JlPlUJmERzqdZz6I/Ec6a0KRod3+Ql56mfMu4i9pgHvDjxew+/WnsMPAGr1J8h4P6p68YhrLvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747039175; c=relaxed/simple;
	bh=CAi0zmEXVY4pXmr8dXMWrEHTYaXfANPjnmfQt3G+Lp0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UkBXTKmDZG6LC+GqI+tSVA3RKnKRRBmlwQjkbKmtyk7cyyT6yU83orcUz+fFfl1a5e/X8pTHUA/+OJu5bpyZnqX0e8thkn4gtE0K8aFOFW5JmWjV14AY0xB8taVQfg4x93u4zDCrF+i2yVwnzu5YlHYh5kHy5JkUrljWtnR7Y3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=JmZqhYQ1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="JmZqhYQ1"
Received: by smtp.kernel.org (Postfix)
	id 87E40C4CEEF; Mon, 12 May 2025 08:39:33 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 73A7DC4CEF2
	for <tools@kernel.org>; Mon, 12 May 2025 08:39:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 73A7DC4CEF2
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-441d1ed82dbso44905025e9.0
        for <tools@kernel.org>; Mon, 12 May 2025 01:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747039171; x=1747643971; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=16OpYsMPS10KxOYKNWgk88DsaCuF+kNMyb4iz3BZjmM=;
        b=JmZqhYQ18u3wPaZ621TskN37dmwINLwWKIhs342FcbcBhhmnN3CVDA1zr0bhN5C4jf
         evyHNqRbbHV7VVg/bLstHH3O8drdqopko/VKzdBKJGcM3wRcka8GgOMkcuEkLPZS5rup
         i6HVJvD6nGDQ9ixd4yWNEjgGxQ/ya68RkH4gEN9Y77/ozjXj80gHVtxND3cjWGIyrmoG
         WyydaYTZsTUY+9itIIDvPf6Q58Fw6Gw4VV/GR4Ja+ypSiGxYwCj6Cm94hYcIyHpZuqgd
         u4tZ6ESNF6Q8YTwwC4FUkrQRjRlc+laQGeL4tMnVkFWJOGeGHva83nS3DJyG1QEjmGZn
         3GCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747039171; x=1747643971;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=16OpYsMPS10KxOYKNWgk88DsaCuF+kNMyb4iz3BZjmM=;
        b=dfq+GwNAuFRy+lvBfslDivcnkppWWd84ZeMvEm9q0xiVFZQCmszxGPX0XzZlcoH/IC
         YFfSmjAGJlc/dxNTK1EJSzIfegkNWtgBhrmUYRq3R/CN03AM97o3Sn3XKZfM+JEn6kjk
         ot/nsdb6aIS7qgeaNxl4Fq1actNEaZa6c6K0uySQVkQls8kg9KpWoZqiBiWSPUdXAbG4
         zgN47WTNjX5Ql4XwX8lFr38IIcJOusDngrpZUtr1q163uXqVvbu7Trv4HZbKwtX6Dstx
         9EduzTAOU2BvgZ2QKw9kCu2jJvNJHBFu8NMPmTmg35kQND0xEDXsvl8dVDGSN3TFUSi6
         q0Lw==
X-Gm-Message-State: AOJu0YxpjsTvHB89FP1936G/Kb0T2ON+hxPtW/pFHDG5B7En/M/+Lo30
	RgPrAj65wLXSDzV1nrtFyM93P+esPYfM8KFMDA8v0gWSx7B2Hey0TmUxG+7HsqA=
X-Gm-Gg: ASbGncsfHMOSYmnXjRzg8FgYYaKbLFKxbjABWg5tVSsVybNDFNLvNy1wNjAWfX8JUCa
	/NCH6zSJYKsQfQjtUGPRj2XSUEyCljTD3pr/gz9SQnaKKc9lQdw/TC3PRwqeq3kGYJSNbKRIlih
	p0b9LxfY7aPCKDsTDZApD9WA9sq0Fy58bDUBm2D5PPsQgCsfM0VeM/2PWNhPq3/lc0NJg8FGTLC
	6t79TLi0XlIiX96oOMZuXf5PXRxaqbNgY3VBniG1jAmDsP0C40PBQr7pvQXpH92Wi8jol1qpH28
	8YvFxYfkOJVTNMwFGGR0tlvU3dQY1vlufJvi2F+JwAJod8F7N278thwbwUohpS+OfAS9/xLDjkS
	bBYxy/wbOn3GeGokaMg==
X-Google-Smtp-Source: AGHT+IHwvMzFNjFgGG4HXvSSyOrJIuAiL6TMl2drhx2dowVfiGe9rEEb0WGEiPi3N8Cnw4AAnKLdxQ==
X-Received: by 2002:a05:600c:1c1e:b0:43d:fa59:af98 with SMTP id 5b1f17b1804b1-442d6de5140mr78719645e9.33.1747039170721;
        Mon, 12 May 2025 01:39:30 -0700 (PDT)
Received: from localhost (p200300f65f00780800000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f00:7808::1b9])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-442cd328f0fsm164488715e9.7.2025.05.12.01.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 01:39:29 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: [PATCH wotmate v3 4/4] make-sqlitedb: Don't consider SHA-1 signatures for trust paths
Date: Mon, 12 May 2025 10:39:07 +0200
Message-ID: <efceaacfd5c1bcd14d7481ae3575253b7bb71a77.1747038870.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1747038870.git.u.kleine-koenig@baylibre.com>
References: <cover.1747038870.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=675; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=CAi0zmEXVY4pXmr8dXMWrEHTYaXfANPjnmfQt3G+Lp0=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBoIbOyeJPzbxuT+1TTIX7H+LFil0U/MB2jX/JMI sBvBwSJ1z6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaCGzsgAKCRCPgPtYfRL+ TugJB/oDp4Vds41eiiov7+exj/NHOFjfFGwNhJwikhnWNQx/rpgGKhQD5IISWmbogmZiWNLwL88 5pk7x9gGNgXkV7/QX6wQWgoTNYvUKLF/b5Riac6+NVa6rc3eAeopyVjgdJmEyTBWWpu3UzvxSYv wwXNYF8vMOtGNTb0+gXS3r5U6nek3VW8Kdh5h302KMcfAWrXPHb8wkKXn6C2R8WAMQ+Rhoxdk/v erTQStv9cHj/LuBz/1DeErBD4hYpBr8Rc/pzfi6q7qgzZErDfrWBKDtwJ8VcgPaLxfRBzs3N7NZ IUA5yscQ93PLwSF6MVpweD1+PAZ8pYrQGQxwuKkJ+NVFq2gJ
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

---
 make-sqlitedb.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/make-sqlitedb.py b/make-sqlitedb.py
index fec199def51d..e8c5969f4d50 100755
--- a/make-sqlitedb.py
+++ b/make-sqlitedb.py
@@ -163,6 +163,11 @@ def keyring_load_sig_data(c, pub_keyid_rowid_map, uid_hash_rowid_map):
                 ignored_sigs += 1
                 continue
 
+            # skip SHA-1 based signatures
+            if fields[15] == "2":
+                ignored_sigs += 1
+                continue
+
             # do we have the key that signed it?
             if sigkeyid in pub_keyid_rowid_map.keys():
                 uidsigs[sigkeyid] = (
-- 
2.47.2

