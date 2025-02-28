Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F3D31E1035
	for <tools@linux.kernel.org>; Fri, 28 Feb 2025 08:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740730143; cv=none; b=eECfMSulskeGACSM0Gl5kBx5rtipuLt+sqJEhXf5oogDGy3Z6qZnfvDVNra3lDaQ2bW+FJefQodOwx30yXCy/TM55B6RwcEw71Kfae5gmfIPeLKW6pQpC+mLf9U3Fv0X6s8rh/2nARt+U8+8wfBnqtwCxoomA9Qd1qc+m5hLa68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740730143; c=relaxed/simple;
	bh=TqtgvYSe4Qx290pX1pmIH+o6cG6XodRmh19D4uE8hf8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i4sPskrgEQlNsqUMjvvrq5EbSMuE+lQ2fukVM6wCm4b7O+G26FmALxTXgVayBuA5hpDs+v2koTTDSxivWlSQDrlS5Sd8wSL693yoZntadEpfIT3m92F0ANsg0pM6UuqmhdaOaLk22hAKmPXxwpH29PJu7wl8+oo601x1z8TWPe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=eKMkPhIc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="eKMkPhIc"
Received: by smtp.kernel.org (Postfix)
	id 3A4C3C4CEE4; Fri, 28 Feb 2025 08:09:03 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 74DCCC4CED6
	for <tools@kernel.org>; Fri, 28 Feb 2025 08:09:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 74DCCC4CED6
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-abb86beea8cso325660066b.1
        for <tools@kernel.org>; Fri, 28 Feb 2025 00:09:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1740730140; x=1741334940; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+cCQMOHEQKWNO+OISLXkJIWFxoaITrG0tx6jZztBg20=;
        b=eKMkPhIcj8k73FxP6/A7ZXoWL3Da01ElKqB4hz+jgVgHw8pZzuMJg7B538BaYlcNl5
         9X/rGN4da7sqPAQjdtZZeMPeQiz2svfyJdSkGVkZ6Z3Uv4uhTrlJ1Ye9OH0z9e30/6mD
         fwdASVf5D7uhuvq/SOc8zjsLdSO0xiGQKq3AIMaj9AhtJg8uFa7XXm1z6uUbs0tNpWeB
         AWFMEq9IEUB7AeOnjLLK+jthw6xsZESA73bD/g3aVqemRJCNVNLKBrQDlTzg2TT8nWTh
         YjWjkEDYF3UtBV73Jo4a1iLkpWHb6wHq+MTgh+oGfacIFKrduCe3ygs6fv0MHdORHUzd
         pMeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740730140; x=1741334940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+cCQMOHEQKWNO+OISLXkJIWFxoaITrG0tx6jZztBg20=;
        b=avnK1tnadojsz/UgglQp23A9WovkeC+IyJO+ocB+SIWgyP8lglEx1TAn4v0Yn36P2g
         qFJoi8MFixQrccwrCdsuHBlrwx9bTz33T1yCCfHw0sHXwTlSZAfyYGldRaC1zNgBKjBP
         cfS6Qp/VMr0gpPKzz3WfgMQDlvjDBA2IllcxGrOKKBAfaNBbffV3RM27jp4N3up6KxlU
         8+nL3xZLVsa5rQJ7DQY8K/awbSHUufDqvaqAqcQyOnauT4k4xgcvdc8EbziyjhxiXTk5
         e7D2vm9e3cjCy4ePL1Zqslzx3oy0qvlVgtDfCckL4KQii6L99U9G5POlWGcvCtE4Pb9h
         sauQ==
X-Gm-Message-State: AOJu0YwHR9V54MUQrYeySv9ypPA6RDMNPnTxk5gQKlHn2ch52IWcCdd7
	gL6RK2eYMLiyc6L1fw818rjb3YBXAw7tdL1GZ+f0tcJN/aWKSHawGK//XplJ0Jo=
X-Gm-Gg: ASbGncvSdlQEnsUkV7y9C+qP99twqrQOx9DsdMCgLCkn5t4w8v444OL5217aryv/w79
	tle5M2ooFqFuV/daEQefi200BrQtGinZsCPOi7LDo+qMEqr/qJeMZVtwNXQYssRnHDNSsBJAg4M
	BWjpvCiqWwICd5FVV7ftjxmwr3DCS2jHiboq2DOxzqkM4IdPEFGt2oOzUgDQ/73G9fzI1Qn9l1n
	PAKgdjPJfOs1v1NtgWD9g9li7bievH1bF2ztctFwzxvFDh7ppGJfJyy4Fs7hceFZlt/qebHMXbX
	/A9M731oCt9WbdEiQyIwtfsZNBK0Ex/NwMOiUeRzo5zLVejCfocVkE32aI8VTBar
X-Google-Smtp-Source: AGHT+IEqNlR0h5Y6GA7puUzLFylX+s0c/4vTMXB3seHC+ItJ84Xs/BO5KsQ/zSZ2h3VG7Kv+9xLG+A==
X-Received: by 2002:a17:907:980b:b0:ab2:d8e7:682c with SMTP id a640c23a62f3a-abf265ed042mr219656166b.38.1740730139734;
        Fri, 28 Feb 2025 00:08:59 -0800 (PST)
Received: from localhost (p200300f65f2c000400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f2c:4::1b9])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf0c0dc5f6sm255369666b.53.2025.02.28.00.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 00:08:59 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: [PATCH wotmate 3/3] export-keyring: Only accept changes that please the Sequoia linter
Date: Fri, 28 Feb 2025 09:08:39 +0100
Message-ID: <56371be75e13d288fd61e4b1d5ddf228fe01461c.1740729275.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1740729275.git.u.kleine-koenig@baylibre.com>
References: <cover.1740729275.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1687; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=TqtgvYSe4Qx290pX1pmIH+o6cG6XodRmh19D4uE8hf8=; b=owGbwMvMwMXY3/A7olbonx/jabUkhvSD+Vyl76xqfnpfrmFVOnxWubd5351g161bJ6YWCyg4h R8Uy5vWyWjMwsDIxSArpshi37gm06pKLrJz7b/LMINYmUCmMHBxCsBEzNdxMKz9JlAS62iiYSIU HeO9a7at/MX7XjtXJi8rKOSVK+J/q1quuTHqcJ78Mt3WEgb/exGzGTazTQtsWnXbKLrol6izg9T G2Z1fUieu95llZrDTvI+zufTyas0b5vMO+LIkxnJ3RfGkGL/gfvYkrHmRqquI463ZWZf3OV25qv 7yw2uFGcqZ2q2yvP3BfRsDW5kMnzYFvfx8d/tnz+AVfdlvtpfzp+0tEo86+nSdy1/7JuaX7+qmH +xnEnMvldkWI3D2kz1bpU7Zdr1phk4XdbONGsJDb7kofT7KJ8u/w/OWQ5zul5JLggsb5v8+Muee iGyZ/LGvv7dMdK9bd+oxr2Tbym0NzOeY92ScmZ+uzqEJAA==
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

As of Sequoia sq 1.2.0 the linter criticizes the usage of SHA-1 that
affects quite a lot of keys already in the keyring. To ensure the problem
doesn't get worse, only accept updates and new keys that don't make use
of that hash algo that is considered unsecure since 20 years.
---
 export-keyring.py   | 4 ++++
 wotmate/__init__.py | 7 +++++++
 2 files changed, 11 insertions(+)

diff --git a/export-keyring.py b/export-keyring.py
index abd15b3ffb39..6cf95f99738d 100755
--- a/export-keyring.py
+++ b/export-keyring.py
@@ -119,6 +119,10 @@ if __name__ == '__main__':
         header = wotmate.gpg_run_command(args, with_colons=False)
         keyexport = header + b'\n\n' + keydata + b'\n'
 
+        if not wotmate.lint(keydata):
+            logger.debug('Skipping %s due to bad linter results', kid)
+            continue
+
         key_paths = wotmate.get_key_paths(c, from_rowid, to_rowid, cmdargs.maxdepth, cmdargs.maxpaths)
         if not len(key_paths):
             logger.debug('Skipping %s due to invalid WoT', kid)
diff --git a/wotmate/__init__.py b/wotmate/__init__.py
index 402e9dd735ba..128a183f2c9a 100644
--- a/wotmate/__init__.py
+++ b/wotmate/__init__.py
@@ -78,6 +78,13 @@ def gpg_run_command(args: list, with_colons: bool = True, stdin: Optional[bytes]
     return output
 
 
+def lint(keydata: bytes) -> bool:
+    sp = subprocess.Popen('sq cert -q lint'.split(), stdout=subprocess.PIPE, stdin=subprocess.PIPE, stderr=subprocess.PIPE, env=None)
+    sp.communicate(input=keydata)
+
+    return sp.returncode == 0
+
+
 def gpg_get_lines(args, matchonly=()):
     output = gpg_run_command(args)
     lines = []
-- 
2.47.1

