Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500D81A4F12
	for <tools@linux.kernel.org>; Fri, 13 Jun 2025 16:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749831561; cv=none; b=DtTft6N6cjf4/4T7CnYBYYaZGbM6eMhWZZkbfq1PSL+LOJttY1EF0uisdV0433vB78KD3UoTctOtQhe3MtkFHBeGy62JvIgNrEz+vpa0pPN3DrHYq9Qgwpe7MU6sCGZWOid/DXt7GEHEv6LVvhfPjlL65EiDtmpVHi69jOUIg4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749831561; c=relaxed/simple;
	bh=5JeDgAZiyfPTI+5p8Bo2xRaDbdNeAqRiM5C23zXyzp0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rISuQJIDcdQNfTTVNwvr8lEpXWAdZ41y1a6jDmTEUihtrzaceP+EnTYm8a6tOHWAxf38o1zYvlODKFuuPfg7wk4ET9iacx5Y31y+SIkF8GVD3YcfP3/ddC2SfhfoyMrAPmhBEOVbTNFFKiFFrxXqYsLPfQg2c41CeMtyUDLlH7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=b19WODUV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="b19WODUV"
Received: by smtp.kernel.org (Postfix)
	id F0F4AC4CEE3; Fri, 13 Jun 2025 16:19:20 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 94025C4CEF0
	for <tools@kernel.org>; Fri, 13 Jun 2025 16:19:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 94025C4CEF0
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ade5b8aab41so480863766b.0
        for <tools@kernel.org>; Fri, 13 Jun 2025 09:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749831558; x=1750436358; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QdEunatr60LSlh+1KW6Dij+9VKDszjOFkOK9mKwcET8=;
        b=b19WODUVwyu9xzJuA6BKThhDNPtIWvvfcc8zu1tgrvfgzVy5h9zUlU6VmlutWtZdxB
         RCLLlW5fAtRFJTqCTGOIzg1Eu8F9dKIXf/3NLERwAY36wNdihbEM0kxm0EKNyr+wOmqN
         f7yM78CSKtZhNUnzN+6l9IFyR7qV2kVACpCb0OZdP3qR5vdFn8QFZDRBjPgURM2+i5b0
         d+sjU/VL7uGnffJRQ1mwug6mL31fQDdI7aVBiZ9ZK+wMZuzj+gmMKZzt+uZxOKLD6lce
         Xf4Rx2SHll7naBtxTsdOarbZPPBYGTU4zsaQi0wTVeZ6+MbgZIM8R381kE/EWSRhxAUZ
         pT1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749831558; x=1750436358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QdEunatr60LSlh+1KW6Dij+9VKDszjOFkOK9mKwcET8=;
        b=uAcKLh9cnql2w/07z6nJ3bOuUN463D2zY1N4UaGTpA8cxVlrMFVBHIcPPdysz4Yo5X
         ZPMexMl44eXHnMGRmnWhRm9dz3OMcNlwnajkmvo6yt1WX9OX/a5g8xCmJaBLpHb3yxrt
         FgWcsPUiDD2cUnOdkkoRh1vxqgFdODV54dGP8TtN+STOz1muiopa8/RMTiN/P+u3OQVH
         Na8SWvQ0TyilwVhK+oPKst4C2xujpcvCbCTeJGIoalw7LF1Q+q8RJrvaSQV4oZOYqD0H
         LIX9XsaQ3mTbxPwm98as9cB5tRprHKNadfcx6XCJ1ZC6xxjg6zkvlyhscF53KQ+/KmCz
         oNHA==
X-Gm-Message-State: AOJu0YysWD8vMBRxYcB/socDEO6qp8KIzFngOHsOuBDaWuJjsXZb/qwJ
	exrn3+jUIbjZGoRH6Xub2X4WXHhKaHB5/8mJafxfmq8FCLn4quKUUj0ZMO6yh+bTg242apVl5vb
	vGGg1
X-Gm-Gg: ASbGncvZaC2u5lRKqW9eBk844AD9OGetJ0E6TbraAR1u27rJVLBJtwjv48GNkwd6inA
	fVkf/1CwFC3U9xwifmwDnm7U6jmsHbOQCmRLpGVsSVdS5AMPq79UZjiNy1p4J0sV4sAM74H/+kj
	xALH21bnqYOXOQ7gLS/IGcw9ePygmG+67PNivdP2Xhd+FeCcEW3aUBsf+U6Vv4s53PXsV3ZkCnC
	H20EXAYGv3Ga8rx1KxfUy7CIc6FFdB+eHFp6Z0WzilW6JWR/X/teguOCYaeq3UU0785C+iwdgAJ
	XowusKuh7eXcD3aTlIdssOKw6vbtPGDJ6ftZClBvGsIO5pNogcYxTp//4FRBzeOat5w=
X-Google-Smtp-Source: AGHT+IGGXAHu40QJ3241Xw2J0yc4DwxooU4RHkXo4NUb9kreGyTgDZ4DS+K5ZcGeu8fkt6raXhue0Q==
X-Received: by 2002:a17:907:7241:b0:ad8:9428:6a27 with SMTP id a640c23a62f3a-adec5c7721dmr395324666b.50.1749831557795;
        Fri, 13 Jun 2025 09:19:17 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-adec8929307sm147927966b.113.2025.06.13.09.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 09:19:17 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: [PATCH wotmate v2 3/4] export-keyring: Add cmdline option --verbose
Date: Fri, 13 Jun 2025 18:18:58 +0200
Message-ID: <d0cee30f00abe0b0b0502b8630b35839f020e49d.1749831371.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1968; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=5JeDgAZiyfPTI+5p8Bo2xRaDbdNeAqRiM5C23zXyzp0=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBoTE92yYvS6Cs/0QaiWfnSpmNM642YeeafjyjEZ hHK+Es3sFWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaExPdgAKCRCPgPtYfRL+ TmGoB/sEMAFmtGVzRFxLf9LxOq2+cmYB9KTHrHJtgBnLDIshUPFg+xeSb3jiqDdidD2kvmeh9hl qKINPaqfd/p2lZ15jLp78iPDmYsGw8BcRtuptu9qXP8nygE86skA0ohRGJwBKlyGCVj7GLAORT8 MIVtS1ApYyicl1jerkaHXf5JA0+aWbGoNRB9roHeRXrD5nh+Oedfog7bnEvmbjqTGONO4uIlD3Y vfjRySgb1VomzjZXWjClRkvwZD/nn39FAMOBXmI2K9Im2oIiO5tRQ58HrB6SiI2XjgFJ0alARUl FgFuNFyhXPUBhObJ0BpmLMpuSXKbBdMyTZBGntRqqqnKtoL2
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

This enables emitting log messages at debug level.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
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

