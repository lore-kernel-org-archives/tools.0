Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397DA2727F5
	for <tools@linux.kernel.org>; Fri, 13 Jun 2025 08:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749804825; cv=none; b=PNTQLXIpL1x32VcjX6IYsQfFht46hLdlN3QP9EpGFf/MqGK7eahQK2E72RQmx0i24dvNS9Awn0AAJUoJOyQzW5HN/TDlG4AtIvfL/HzN/GfF5BWTHzsO8/9iV3Lv9JkI6FvMgdL4aVleVrzws0L4dsUvDuUPBe5s+qHCDya61BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749804825; c=relaxed/simple;
	bh=7l48Dcpps/KXVdnrp/3WPMVoEUT2t/ekLXnC5bl302Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hF5w5KizBA3Ot7HsfDVL/jy3CCsSp78NDIyxRDblKbAcjbnjCfgVfJf6Frhb/vN4g3YzZ2QG4K9HtMZQiujwyHzvTt7v+ehaFgCHPmoOpM3oN9pv4qTATWagW4XlE0fZBHmikjYB/pxC0GiGDtRffNO+br+/6bIPMBIrKpyOxr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=B1XJU+Cw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="B1XJU+Cw"
Received: by smtp.kernel.org (Postfix)
	id 2D0A0C4CEF1; Fri, 13 Jun 2025 08:53:45 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 36455C4CEE3
	for <tools@kernel.org>; Fri, 13 Jun 2025 08:53:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 36455C4CEE3
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6086502e750so3641176a12.3
        for <tools@kernel.org>; Fri, 13 Jun 2025 01:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749804821; x=1750409621; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HSL0vh+rqpKPe2NXIKisZ3GDiiGjp3jd1ChNyJyFfF4=;
        b=B1XJU+Cw9NzZvSUeGMcI6sC4LYU+BTGnmKCVyJjitD3ErukWVzGJOL0WcTC2CCXCE1
         dFy00lT+M3AN46rt246QO28LvU1Ihus5Q+N3oKFwoKC03NyOlNcHHSvM4ZM9osFySfdx
         yWf98gi9ovJD/u/+11z9zFHWdCfQxGJUstz9qadnhYQLHf438XC145yYNbLy4tx8fF3x
         5bojnQ6nqH5oIOF+faXPeLof0c619GE7JMEDNDtR7650owCUe+vcvGhdkoS5l1qf4hw+
         4JjAiYbW/RjLj5SHqgMcF5PbtuxWGjdcv83tjKJ0EKsVkVLuCI/AwOc5NOYX+dzMBbeC
         H9mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749804821; x=1750409621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HSL0vh+rqpKPe2NXIKisZ3GDiiGjp3jd1ChNyJyFfF4=;
        b=xRuaPAF3BJiWdX2LOt292YzDhPDLU0OJp9LLK+3iXs2A70gxHRexftYdEUXrG3p+aC
         0dKVm2E5IZ75eOaEXhUT8B+LgB81LaDn6ONAj8TnQbFKH8H+aa5xjD9p9VnSxkNZXZvQ
         jUj7/E/2L+urHrMMa83wPZCmvayfMXvFDN1EJa2e7QOKTLM0Fe5H7KN90TEDaiynIeKh
         1xkSFqjFWkbzWeQwqZfLV1zLFlaYQk9v9kc4P2i47SeW+Hyk6+Dkj8Fj8XyeO2Zje3ES
         vs4j8TAFKbCNeEspZGnudalB7Bc2uiVEQAeomsOSFtENMqiKwx0MjRetyhBcWoSzPtPn
         R5+w==
X-Gm-Message-State: AOJu0Yy/OUF0fc6TQtHFejMhUJLXaPRnADPMxRrgMLY6cNFBgHBiEhLf
	ADHXwIxT81KA7+cMEyPEkkea7jzG/V+/hQBwirScxqWbPw53PofPW1TQKbixXGPQNSQI6Yb06yv
	Epjay
X-Gm-Gg: ASbGncvxeKNdyyePmO+0nJ6VSLBzyi/xlXA12jmlkZ05+PZA4N3kTCft4YZPlhBrwWB
	Hwg9eacHM4VIh5kor/NOc70DqPiri9ejM70esZRrHitxq9GlDctDUFYC2pGnplvxbjDtlTTYIFw
	2dYMnV8tHSY9WMBvhlVua/z3BRFKrXCQBpz70p+UcrA/fyft4hsRPzJht+T0r7NXS1ApaOif/N6
	mw8oW8PQAuLHFviQNkqf2iDKd3aodzdWt1wQZNYshJ2A0Hgvp5HjPa7UNNZ5mkAd+a7Qya7OKft
	0FvGZM3VebiJym98BCNShK12JIJ+VXzay0MYyzBIJzsbYU0MjyEgsnzV6z684gyBSwEovWvNTpd
	lgw==
X-Google-Smtp-Source: AGHT+IENP2Mniy4IwaVpDNoCpN4aGxpiYnkIEOh4DB/OPu7R4BidYwRfW3yXTEoJVXh4twSAy0zqVg==
X-Received: by 2002:a05:6402:1d4a:b0:605:2990:a9e7 with SMTP id 4fb4d7f45d1cf-608b4952d41mr1765808a12.13.1749804821460;
        Fri, 13 Jun 2025 01:53:41 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-608b48a876asm894180a12.4.2025.06.13.01.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 01:53:40 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: [PATCH wotmate 3/4] export-keyring: Add cmdline option --verbose
Date: Fri, 13 Jun 2025 10:53:18 +0200
Message-ID: <3bd6bb0f2d9c18c6a9a4e36f1b15ce46b3608ba9.1749804735.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <ef678713de0a9aec1c1f07d92faa29e1f5b5e4e5.1749804735.git.u.kleine-koenig@baylibre.com>
References: <ef678713de0a9aec1c1f07d92faa29e1f5b5e4e5.1749804735.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1901; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=7l48Dcpps/KXVdnrp/3WPMVoEUT2t/ekLXnC5bl302Y=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBoS+cBWIArpVTcv5hnYj3bB74aSRsyguO26amFU y6ab7fDwG6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaEvnAQAKCRCPgPtYfRL+ TrEHCACG8NVZTm3KZo14o3mNcZ4qzqnnETmSH4Uq61BfCfjZXip8FfE/2QfoonRc3gFC782GY8G lY4Nf13UJVfMdY7NkshmCpWcTALtNR0zunrXTk+l/EnkSosjrr2DniJ6G6imNCjC0zuFE94062Q 7j0ge0q2bK3BMsLsj5moFgKYYE5oocj0SF0b+nuzFcA42KJMLa5eHgbvOrCgSpUfjTJm4aluxNF E6rz5bova7cMOS400Q6FHT8lqYKwrVc4HUgR2OIvrYaBJx5LYgCKg/dv/V6nKmKFda+JrYhiBjO kP7gaakkpQ9EV1jgjZQBlZMGTusrgvVGJXpEmwcTpveokyFp
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

This enables emitting log messages at debug level.
---
 export-keyring.py   | 5 ++++-
 wotmate/__init__.py | 4 ++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/export-keyring.py b/export-keyring.py
index 23736f610c79..14d190c83db1 100755
--- a/export-keyring.py
+++ b/export-keyring.py
@@ -28,6 +28,9 @@ if __name__ == '__main__':
     ap.add_argument('--quiet', action='store_true',
                     default=False,
                     help='Be quiet and only output errors')
+    ap.add_argument('--verbose', action='store_true',
+                    default=False,
+                    help='emit extra logging')
     ap.add_argument('--fromkey',
                     help='Top key ID (if omitted, will use the key with ultimate trust)')
     ap.add_argument('--maxdepth', default=4, type=int,
@@ -69,7 +72,7 @@ if __name__ == '__main__':
     if cmdargs.gpgbin:
         wotmate.GPGBIN = cmdargs.gpgbin
 
-    logger = wotmate.get_logger(cmdargs.quiet)
+    logger = wotmate.get_logger(cmdargs.quiet, cmdargs.verbose)
 
     dbconn = sqlite3.connect(cmdargs.dbfile)
     c = dbconn.cursor()
diff --git a/wotmate/__init__.py b/wotmate/__init__.py
index 8724931a8005..c88a209e1d59 100644
--- a/wotmate/__init__.py
+++ b/wotmate/__init__.py
@@ -48,14 +48,14 @@ def get_uiddata_by_pubrow(c: sqlite3.Cursor, p_rowid: int):
     return get_pub_uid_by_pubrow(c, p_rowid)[1]
 
 
-def get_logger(quiet: bool = False) -> logging.Logger:
+def get_logger(quiet: bool = False, verbose: bool = False) -> logging.Logger:
     logger.setLevel(logging.DEBUG)
     ch = logging.StreamHandler()
     formatter = logging.Formatter('%(message)s')
     ch.setFormatter(formatter)
     if quiet:
         ch.setLevel(logging.CRITICAL)
-    else:
+    elif not verbose:
         ch.setLevel(logging.INFO)
 
     logger.addHandler(ch)
-- 
2.49.0

