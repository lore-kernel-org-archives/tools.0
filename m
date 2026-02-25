Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4922D395253
	for <tools@linux.kernel.org>; Wed, 25 Feb 2026 11:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772019775; cv=none; b=LXeb0ozo2yAESiPUNIa4mMJlBADWxbNuYNFE5P80XFZcn+yTYcm3L+jJKyoObyHyUhrdqkolznhyG3YmdyNyS3KwPmUgqqWOli+NQeP22o6qn2bFflT0DRfmOAQD0s+2AdjeK5f6cdpE1LIrWku3VwHARSW1LIXTfUdFpJtFcIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772019775; c=relaxed/simple;
	bh=phx2x5EsZxS3anxD/J8Tyhy58XyqqR42Og4MVDk+zWM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=fzPnjSPsOlzEbhK6Pj93eE5FBVrXNDIjb0jEyQlpvXCT1+s7+Da2tqazoQSv42C+cMJT0AFDE7UuLdu9/hpEuhJjn5Fpr8d828ELUiCCgCuaLH8PFoClfJ7i698HjzT2Sh8w/CvNiCaeCik9BlOAkeH0vuC0WAePKFCfjCaAEOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=yv//kz+l; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="yv//kz+l"
Received: by smtp.kernel.org (Postfix)
	id BAEC3C19423; Wed, 25 Feb 2026 11:42:54 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B4D49C116D0
	for <tools@kernel.org>; Wed, 25 Feb 2026 11:42:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B4D49C116D0
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48374014a77so69001195e9.3
        for <tools@kernel.org>; Wed, 25 Feb 2026 03:42:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1772019771; x=1772624571; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=l2m6+s9z5edzWN8SCDIbhqcBSMal11SMktMvC1DQ8AY=;
        b=yv//kz+lmHeSb8W9PLduL68Eph2JUm4qrXWtzDoayidhrdtqxRla+2mwFE3gNiQ1is
         liMuV4RpxWmXmFfGOvevTZIehzsj9K63zathMFQKOH7ZcesYSMtbsPqqaKUlrWgD3CzX
         2CoH+YDSHxa6sFyL+wmu6gVhVeSxuKIpSnDKh/Nzu7nKbt6gjNupnqlmc2w3U9/O9GRV
         VgeG1M5GGP+HxPKXWjJQPehAgHCCKsAgSZtvQfM9s3n6yDtZ9ZbW5xLF9FRawSN56yzy
         CDCYTQRVEqdWxWAw/QixkYRalP3Oe36p0xFVYsjcGxwJFlczeNh/Y7EZinJhdOQaGYat
         Xqeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772019771; x=1772624571;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l2m6+s9z5edzWN8SCDIbhqcBSMal11SMktMvC1DQ8AY=;
        b=PjDGg1nZypOXh9YBUuROuKwfukohKMsS7cJYD8VAr/A2N2Az8e/A99amMUl51s5zkq
         N1E3Ohzf8BT8HZzz0JdKjS+THYuO6aj++khOQQV+XKC8FU4ouTlgr/OqUTo9GDvexU5D
         Q8pXRXIgFEKn2b/GWcfKC1oFKsCTkFwGMAB+F/u/Zk81Biwj+lChvb4n0rpp+KL5D2sM
         lhGksuGlOvBE/L35QkF0JQ8QviggUBnFvOCVlE3HLIW1X7kwQT9LuhuX6nt4VzNsBCen
         fQ2hp/MWbcdIxuxWvGkN1qQSkXlfyc6KwbInCIH4lMIsTdDsxtbpmTcBRIlU35Xhiing
         mXeQ==
X-Gm-Message-State: AOJu0YypECmSn8TaFDNig+Yzg0OkGGan8HTRxQiStG1W/c5eccrBQRSC
	HfsD5jbxFKG6O89nXhPEakx5bWexua+37ZoUXQ3ybfrp+EcQQm+NUkBQQkhLfwo8w8oyFppJqVH
	guu/r
X-Gm-Gg: ATEYQzyAo/MQQktzpp3PSAUIP9AL6gL3RE3IasSP3niY3GKhdNZT3P5JJlk6ehTrQLp
	yGu66W/qNUwcxa7mO7V5pUrJOrdFHfX0kz6DXCEa6kgIXBIemP3n7WVOMiz3d+caAuw4F6s2T5W
	mA3AmN6uuRuenqfjnnzmeDUNuSOZJkGFkb4sccaf7UYBtrDVXo1/g8LKbaAbNOMaLEK3E+hgwGg
	kg2ZFKNnWs8+Kp9QWHQZiJzXeNd1p48VeqMp8JaZRbkzsjHSYTxceZSant+SvRiGvexm0++H+1n
	IhS05t8cHDr7oKv8CltsbGe6mT1Bk4hznCvddvtsx1i5iIO5LpcI3IwlEAlq7JiUFUAbpqMZax/
	GXd+80KxW9+kvpO7Q0UYLar6Rc+mhWYEg7c9V6LvTqWHorfOsMk6T3DlSvCMNF2LvSiyiWB7XtD
	CSlFuyN/mdgmTLwe1OB7fcjvuJOORBfjLVitprXEy/W1nWiqUNBl57CEnoDnrs09EQx2ten66kx
	EEOzz2GN5b3BM4=
X-Received: by 2002:a05:600c:608f:b0:480:32da:f338 with SMTP id 5b1f17b1804b1-483a95bea87mr271274145e9.14.1772019770920;
        Wed, 25 Feb 2026 03:42:50 -0800 (PST)
Received: from localhost (p200300f65f20eb04b3fd8f64e7668a99.dip0.t-ipconnect.de. [2003:f6:5f20:eb04:b3fd:8f64:e766:8a99])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-483bfccd7b6sm9526245e9.24.2026.02.25.03.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 03:42:50 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: tools@kernel.org
Subject: [PATCH wotmate v2] export-keyring: Add option to update certificate header
Date: Wed, 25 Feb 2026 12:42:42 +0100
Message-ID: <20260225114241.2609196-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3266; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=phx2x5EsZxS3anxD/J8Tyhy58XyqqR42Og4MVDk+zWM=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpnuAxtIFMM6DLA0xVE56l/L0p3fZ8J79ov0z0L JLhzap0ajOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaZ7gMQAKCRCPgPtYfRL+ TpapB/9YLwdTEG8TlPn/J8FC6cCVzPbf1DUYOqmtVvMZF40oALeLO1Lk2efP10yK/Mf2GugTb6s wwQQRdtBlpgGL8Xigabj41fEORKtF+04wAj904SxiER+pc1KNjNz7W1NlH7/U/RXl7yxTqvluCQ unVAEVbCPlCH6CR84C3RVFxtogoH2HplELf6q4QuvvHP9bl8+X0ClabCYMbZ2rWRRuupVLl5Ux8 NWEp7TpIjjPZDbujFQShyc2MWej7FZrXGY/QmWIJYzI7Ad+clp9EnYtf82p622shmsMk7beiZQG dQ1BRJC5iHhf7QuNjUTxpBZz0YYUstgG7uEqLrwjAlg86F7B
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Sometimes the header changes even though the keydata did not. That
happens for example when a key expired or when the way the header is
generated changes (see e.g.
https://lore.kernel.org/tools/20260129100727.950475-2-u.kleine-koenig@baylibre.com/).

Add an option --update-header to write the certificate files in this
case, too.

Caching the result of the new get_header function (e.g. using
functools.cache or functools.lru_cache(maxsize=1)) brings hardly any
runtime advantage in my tests, so I didn't add them.
---
Hello,

compared to (implicit) v1 (available at
https://lore.kernel.org/tools/20260210082521.1789192-2-u.kleine-koenig@baylibre.com
) this ensures that without the new option the
header isn't generated without being needed.

Best regards
Uwe

 export-keyring.py | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/export-keyring.py b/export-keyring.py
index 0208343c1b47..af5798cbcb14 100755
--- a/export-keyring.py
+++ b/export-keyring.py
@@ -17,6 +17,11 @@ from typing import Set, List
 import wotmate
 import pydotplus.graphviz as pd  # type: ignore[import]
 
+def get_header(kid):
+    args = ['--list-options', 'show-notations', '--list-options',
+            'no-show-uid-validity', '--with-subkey-fingerprints', '--list-key', kid]
+    header = wotmate.gpg_run_command(args, with_colons=False)
+    return header + b"\n\n"
 
 if __name__ == '__main__':
     import argparse
@@ -67,6 +72,9 @@ if __name__ == '__main__':
     ap.add_argument('--gen-b4-keyring', action='store_true', dest='gen_b4_keyring',
                     default=False,
                     help='Generate a b4-style symlinked keyring as well')
+    ap.add_argument('--update-header', action='store_true', dest='update_header',
+                    default=False,
+                    help='Update certificate files also on header changes')
 
     cmdargs = ap.parse_args()
 
@@ -130,6 +138,12 @@ if __name__ == '__main__':
                 if keydata not in old_keyexport:
                     key_changed = True
                     logger.debug('Key changes detected for %s', kid)
+                elif cmdargs.update_header:
+                    header = get_header(kid)
+                    if header not in old_keyexport:
+                        key_changed = True
+                        logger.debug('Header changes detected for %s', kid)
+
         else:
             key_already_exists = False
             key_changed = True
@@ -170,11 +184,8 @@ if __name__ == '__main__':
             continue
 
         if key_changed:
-            # Now, export the header
-            args = ['--list-options', 'show-notations', '--list-options',
-                    'no-show-uid-validity', '--with-subkey-fingerprints', '--list-key', kid]
-            header = wotmate.gpg_run_command(args, with_colons=False)
-            keyexport = header + b"\n\n" + keydata + b"\n"
+            header = get_header(kid)
+            keyexport = header + keydata + b"\n"
 
             # Only do this for newly added keys
             if not key_already_exists and not wotmate.lint(keydata):

base-commit: b417eeaf41bcf062b4e233060c6e54d39bc582c9
-- 
2.47.3

