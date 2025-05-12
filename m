Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64044257AC1
	for <tools@linux.kernel.org>; Mon, 12 May 2025 08:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747039172; cv=none; b=VAF8RQVdl51wigYLJ5vlzUqsy/WcBF97RWlLUx6l1bDeGxefCbtv6pyS1GxU3hEI68KmJQ9Ft/YAa62fonjTh4isJec/DlwjiEu4QnIq3NSRmFpQgImryJXLyBYC8ZiAjVKXEVKRH6UnQC6vOhaihuRxBPpDYt1/vbhvx6xxK5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747039172; c=relaxed/simple;
	bh=fZWTCV/i+fZjWfQaEFKwcj592iBe7Yy56k0hI+WrNf8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZUEoZQG5cuxQNMeqqgJ4UxG6/X8e/6Chl1XpLZWgxJcfqw17x1NuinH8PMdwDTX7gBbw5kLwyXiA1PKc+JvBhAU6PH924wBbuQB9YQIcfeLTm+ynlrj2OzSEYKRrZtGKy7m6S4TgEYBs4AzqpKNAZrkQdbbCH0ZbAEUyWpXh4xY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=niagKaG6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="niagKaG6"
Received: by smtp.kernel.org (Postfix)
	id CA6C9C4CEE7; Mon, 12 May 2025 08:39:30 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 487E0C4CEEF
	for <tools@kernel.org>; Mon, 12 May 2025 08:39:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 487E0C4CEEF
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a1d8c09683so2162394f8f.0
        for <tools@kernel.org>; Mon, 12 May 2025 01:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747039167; x=1747643967; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GV0OalcCyBLpb4RCfJ3rQRnY2LTtrBkB9aPPPJKrOdk=;
        b=niagKaG6IeUcDu3IjmcH9o3W7i2ihbV7Q36jqoTHBz4t9qWpZ10Cw82tlZexHPvUU7
         R/DZzFcA/3DLR6WceSQr3paQnupLINPz719Fft1L9FzhT/iyi1RsrtRbYez2+M3sA9q2
         haOrv2cemL/3rSzFQXd70tNH6NWHaWpyB2V+p0sUNt2FIvA0eISaoNtI1gyQ1/H0G7FN
         P71KbSq+Fi3TzkIh3Olt44QZMxHp+SD1nzCh6bdKykKsvHeYZb0O6aEqQZ6Mzk7VnqjH
         jaqi3HSr3PRKXsFgW1endqctPvxHBzb2FSyr5faPF/2brq+V44lhpRzFGbOZB9vvH3Ux
         4iyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747039167; x=1747643967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GV0OalcCyBLpb4RCfJ3rQRnY2LTtrBkB9aPPPJKrOdk=;
        b=QplN9OS0bxcjKfAsQUp1Fkr04Y8XUDAbml9Kh58yJIyd587ohcQH7FuC5wOCkwfFfj
         vfUStwYAKsqgMoDSBhKRp6AJFex9vECzb2kqnv3/ypyUAErjQwHvgrK2txg3Hs2Uc1K+
         ocjq7vCOyxz9SqYlChKRLZm00U/CkFCKhaIFI4NjNlMrlXvZKJNoMeRf32xNhZs4Eq3a
         7s6SDEYMNWSzHX8Pu4fus8jllXDMho59UT1Sx3tpIyp7VNPRIvWy8hXNPDhk4Mav+OrC
         Ic/xB7OFlPQTkpo7IS9hgvrwRHAGf0yelzLONNXbpH/wfD4E381YRV4RbihiuRyF7eM1
         tduQ==
X-Gm-Message-State: AOJu0Yyc1Hb85rYMqkKWUQufXcGx2bhU3mIta5IHzxaUi6Tp2YPEIb7C
	cFP47cupyErQ1ugM6mO0VxmbehpkyULTiSOn+H1pvqg7CtJnK/RjTR8t0+wzB3o=
X-Gm-Gg: ASbGncu7wwBejMzk/n6QCUQHBwqshAQ3nEdAg17QkSf4HRArxbu1O7k4mwSabeQUcOX
	zVnsMGvo5VpRyp3fiDQr51GLA2WImqSZwvIMheSIEAA/d/pCFggS8YwX1itjBuTC8n90aZEXM2h
	P3KlWyxPe6WDeHM5nr4x8AIxYo7Uz9CwBkUfz4t+yrcUZSOOXQsTubtprf8dFRqpuQe7Ovla8G0
	/pPMc0bSKncFXLSNNOimnpF8kRYFhhLCi+AIvpcWw/jjYC2hvFsKu3bN2g1AqF0zM5AQ27Kb5Um
	S3xsLKYmX3ya/QIAXsiYyRNgnCvYdQ6pNczjyiHMHLvilXtbYs99VWTFpOQFNnKx4rRD7tUtzw8
	V52asJYmdJkmL0Q8xCQ==
X-Google-Smtp-Source: AGHT+IGR9EJlF7KzHL/V1B+n4A/9qq7256JvZcOO6gkhSZzOYSnTZ2gybYWWGbI/Cw1G5vEr1AQlow==
X-Received: by 2002:a5d:5f8b:0:b0:3a0:b4f1:8bd1 with SMTP id ffacd0b85a97d-3a1f64ab2b8mr11369994f8f.52.1747039167470;
        Mon, 12 May 2025 01:39:27 -0700 (PDT)
Received: from localhost (p200300f65f00780800000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f00:7808::1b9])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a1f58ebec4sm11891438f8f.36.2025.05.12.01.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 01:39:27 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: [PATCH wotmate v3 2/4] export-keyring: Continue updating keys that lost all their trust paths
Date: Mon, 12 May 2025 10:39:05 +0200
Message-ID: <65fbca669f884f535d95b6fafd4f19eef4d9086a.1747038870.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1747038870.git.u.kleine-koenig@baylibre.com>
References: <cover.1747038870.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2536; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=fZWTCV/i+fZjWfQaEFKwcj592iBe7Yy56k0hI+WrNf8=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBoIbOtelJY/9sR8RuXmXZdjBHDlQ4njr1JgM0SE RuLpuoc7weJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaCGzrQAKCRCPgPtYfRL+ To5wB/9D57CKghWkVo9qXlau7Vs0SQd9Ch33pamlKtF0aFCD1X2rRAP3h9d+EKABdPY/A8QkOSM j247kiO7ap8etRQqTEOkcv0vzpaRvAg+HFXvNqoXiTApiUNlEp06xP5fAWAXOVn39v9TG+nOWWe q9PLR1QfdKg6uDy86AgwcIFrIYltiVn8y85hdD0dLlVz6LgSxzE2lavxQ82yM90zD1jlmVEh7KH 8cICc+qTo8iKQq0IxqQJCqFe9Uwvrmoq9cx0H/BN9IurQVUdKplWOA5HtruuvZ1HEQXu/T7OqDj XErCMdnRtvShZ3UiYwMGMLxCoDMSLV//1eNtOkvwN0vj2FxL
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

With recent gpg not trusting third-party signatures based on SHA1 quite
some public keys lost their trust paths in the kernel pgpkeys repo. It's
still sensible to update these keys, so only skip new keys without a valid
trust path.
---
 export-keyring.py | 33 +++++++++++++++++++--------------
 1 file changed, 19 insertions(+), 14 deletions(-)

diff --git a/export-keyring.py b/export-keyring.py
index e5e6d3787774..5a30f3ff6927 100755
--- a/export-keyring.py
+++ b/export-keyring.py
@@ -105,10 +105,27 @@ if __name__ == '__main__':
         keydata = wotmate.gpg_run_command(args, with_colons=False)
         keyout = os.path.join(keydir, '%s.asc' % kid)
 
+        # Is there already a key file in place?
+        key_changed = False
+        if os.path.exists(keyout):
+            key_already_exists = True
+            # Load it up and see if it's different
+            with open(keyout, 'rb') as fin:
+                old_keyexport = fin.read()
+                if keydata not in old_keyexport:
+                    key_changed = True
+                    logger.debug('Key changes detected for %s', kid)
+        else:
+            key_already_exists = False
+            key_changed = True
+
         key_paths = wotmate.get_key_paths(c, from_rowid, to_rowid, cmdargs.maxdepth, cmdargs.maxpaths)
         if not len(key_paths):
-            logger.debug('Skipping %s due to invalid WoT', kid)
-            continue
+            if key_already_exists:
+                logger.debug('%s has an to invalid WoT, but already exists, so still update it', kid)
+            else:
+                logger.debug('Skipping %s due to invalid WoT', kid)
+                continue
 
         kpblock = ''
         for kp in key_paths:
@@ -119,18 +136,6 @@ if __name__ == '__main__':
             kpblock += '\n'
         key_paths_repr = kpblock.encode()
 
-        # Is there already a key file in place?
-        key_changed = False
-        if os.path.exists(keyout):
-            # Load it up and see if it's different
-            with open(keyout, 'rb') as fin:
-                old_keyexport = fin.read()
-                if keydata not in old_keyexport:
-                    key_changed = True
-                    logger.debug('Key changes detected for %s', kid)
-        else:
-            key_changed = True
-
         txtgraphout = os.path.join(graphdir, "%s.txt" % kid)
         trust_changed = key_changed
         if not os.path.exists(txtgraphout):
-- 
2.47.2

