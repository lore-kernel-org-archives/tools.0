Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C67478F37
	for <tools@linux.kernel.org>; Thu,  8 May 2025 09:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746697518; cv=none; b=aDfb8ayInYXRyZxk7HRZ2Il1r94NO9LpSnFxB2bQBgoQD6j8frWQ73SlxqjhlQ/Elp6x0tzkumY7FWTrI4SH7R3jQBvOj87xtZLXKYPV+5ENLp5/UKJF4bTVNzsFTs8ZqNEfd+naz5N/78QsKXb9r4WTPEaijnsFcqGrKXxNo1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746697518; c=relaxed/simple;
	bh=ZlPpo7bPHQi1X3W6C63vE/fmFzMQWei+LpQwfXU0/ng=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jy390hm7QpXpZfXD4S8lVH8dugORMcCplUDfJYm9lYnYpb16oiuEnicOapDxihX/MjP4seWRk06St7G4SICnsnFgexRB+HyQ1JFSBZzwwwZ1ZDB8sgr7JydWD+ZebrlgrDFzYQzmUxUvpwEqvqozUYxuYn032a/te+cu1AR3Cpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Zfp1CGDz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Zfp1CGDz"
Received: by smtp.kernel.org (Postfix)
	id CB1FBC4CEE7; Thu,  8 May 2025 09:45:14 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3322BC4CEE9
	for <tools@kernel.org>; Thu,  8 May 2025 09:45:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3322BC4CEE9
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a0b9303998so367638f8f.0
        for <tools@kernel.org>; Thu, 08 May 2025 02:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746697511; x=1747302311; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TWQCVqyw9y9RLNZ6kgAr96aBPOm4DY/uWinSgtOBQMo=;
        b=Zfp1CGDzq1XsT6+XJjr8J3fldjoJgeMPz44NWU8Glo6TzhY6WdGpfUMPkB0bJbcyyp
         q+TptFetuYWXEolU9FSmiUfKay5KB69gzsnJGPnEtM8Vjt6KWjBHpl1jAaG9Et7ypPo4
         nf8iz4HQpSL2wgUzX/YJQryseJ5hMJxeSUd33tCr3ZgAD8kgKqvLfHxymnMFNO42Kiq0
         HPVdts0V22i6DzCWQy4eTYtSx8pTqVWRlJ8iapY2mjF4rRN5RiDJlGw5Rux44vAS5dBv
         Iu1aH1JDY6dBsoxVDHl81URVHXlYVlnnb70y25BL8JpJ00Na1nTca5uuh+7CZ5RSIWlv
         EHtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746697511; x=1747302311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TWQCVqyw9y9RLNZ6kgAr96aBPOm4DY/uWinSgtOBQMo=;
        b=kWJrLN/dxk/U5XOaaoL7EXWQvT/YEGQOF58tiC1BBD3nRgLtIs8d9LUS3l/mSydW1/
         s3hfkY1LPPSNlZQGChO219vElBOnzpBDPIRBazaeIDldk11K6ODNn+MKfYg4VU2KiheU
         YPqGGW2/KFPyHvRLQzsZ39TUfLOWg8LZVbfuDusmfy6PPHe7eGz+kf2uEYi4KE7+9cGV
         Fi/Vd01eyKr3eWF7RvGd+xQExLp3uRKw0DK/xqWNVCkxUCnJNALtrMBUKxMcRrAsDS7w
         S/a5HEISvY3kH++VAUwgJLSIY5Iu4UHY8oLaP+cXNpPKGnyNW5IWks96FMtxrq7aVm0A
         j0GA==
X-Gm-Message-State: AOJu0YyKsZ3c1fZMqU1DDQ4lFZKYO6aWToymVHAFjS9h1oKkFo7Hs+5/
	n1wQ+5RWns80boAuEEG9pbA3qO5EQdQR5H5LyuZw/pd76DgvQdCyq5+ROGI+E0I=
X-Gm-Gg: ASbGncv7E7ms7U35uB9xmnAjec89B3cyTvjA1mzxGdAx8mISnxu/+U4fomVQZDNGw4l
	hHVwB4xI+RS3ArIU8oHQAWTBp7DlYNdpUYlPZQFZO+VoM5tYS9aZrnE9SyZrNJQjrX7IGPYeah5
	E8mvHPz1IdkbChwTibl+u50EGzTYSnY6yE+BEuQPhy2smKBGJwBKJQmxtZPyBJzQSwlDHC1ye7R
	dsn+bJtUkRssAi0knyl8zA/718KwVye/jsMxE5xUt/JVBrPV0lGFDqLkT7XwBGZeBlBIXly6oqP
	301G80ICOPTjFKmXU5JPMzV6yY2SsmK30H0lBIcdtKR4HazytJ/Wf2kFPhmgSFIO7qfswEgR73U
	imw159YE=
X-Google-Smtp-Source: AGHT+IEXTu1Q/sKnPnJKkXZfyUQsNT83CqaFM+brgiTRXpK5ND2gyZ/XL1D+ZMMH5XsYPQIOJ2bFOQ==
X-Received: by 2002:adf:b199:0:b0:38d:ae1e:2f3c with SMTP id ffacd0b85a97d-3a0b994030amr1829355f8f.25.1746697511386;
        Thu, 08 May 2025 02:45:11 -0700 (PDT)
Received: from localhost (p200300f65f00780800000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f00:7808::1b9])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a0bb7c29e8sm1684652f8f.7.2025.05.08.02.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 02:45:11 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: [PATCH wotmate 2/3] export-keyring: Continue updating keys that lost all their trust paths
Date: Thu,  8 May 2025 11:44:54 +0200
Message-ID: <20250508094451.762484-7-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250508094451.762484-5-u.kleine-koenig@baylibre.com>
References: <20250508094451.762484-5-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2536; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=ZlPpo7bPHQi1X3W6C63vE/fmFzMQWei+LpQwfXU0/ng=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBoHH0ZJ5ypg4iQRUf62aHQSgVPAq9DCyEnllM40 wqvH4MwEt2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaBx9GQAKCRCPgPtYfRL+ Ts+iCAC3LqBfculW8CDox7O6NcY1cM5wvDM2MNkFORGsP6ZZiVWN5NwTCO++9ir6qO2syIDexrf 2ZiBm1NaGEnDGcmjk2FWbYXYkJwKqKk2KMop53vu1MLoQQbM1Rv/+TYCHsXZGpzyTMsgCvaP44j 8VB1Lw5HHIyJIkbdT+h+7uljAyhTXYZBfVHn3QKSuiAK1+6lG2ZTNQsixMU8Iq9vOLyCYhItpkF asDWh2puIWSUnLDMOAxGYHes3fsXMdCqOlTEovCtvlv/qqgegm9uo/tVU1naJnQ+lF/F6AL+ni1 2h7d6fHOn78lpgZwZXF9twhlRuo3SqsQwdvpwuR7GIRMiCWP
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
index 5531b096a6aa..fc12624a42f6 100755
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

