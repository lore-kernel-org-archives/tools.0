Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F6F2E11D2
	for <tools@linux.kernel.org>; Fri, 13 Jun 2025 16:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749831562; cv=none; b=hTAR4arYMdF5ku9YcfTZeKZ6TCEPDGd36r5GPV/e6WF3uF7PnMWdJNd4XT6dd3Hc3U4wAMcDGIfNJVg55XVCbIrovIBWBBB/GUB9KyPTkrmmLJUDtU7idXO0NpF49/EUasIlxTgUj5rbKMV0PJkdakkFzxkevDBAM73aqAjxFBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749831562; c=relaxed/simple;
	bh=fJcok3PJ20HteE/CNfkkqgl/iqnVkyKNX4iPlSjpZ/8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B0DIyXVzhQPyK+V6MGlYgqZ+X0ome0XuSa2HZrni405URhazI9VEqUyWmmE4oobrynTT37PGTou6GpxX03iQgeEQU/dYGrORdFeDFpVxhbasME+Dvg1gZudXoRtlLYlCRwbtSMAUwp97xFoXXvaiHrwq1byHACTi7AXebv6dut4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=GSqZTpsb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="GSqZTpsb"
Received: by smtp.kernel.org (Postfix)
	id 887E9C4CEE3; Fri, 13 Jun 2025 16:19:22 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 34DDDC4CEED
	for <tools@kernel.org>; Fri, 13 Jun 2025 16:19:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 34DDDC4CEED
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-adb2bb25105so392441866b.0
        for <tools@kernel.org>; Fri, 13 Jun 2025 09:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749831559; x=1750436359; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+LbeAI3FVLi/vu4Z9Rx2+pqe3QajvGe1OymPCc62rPo=;
        b=GSqZTpsbFmgIbjS2njcQBDWnVv0H+XVuQNBSoNMvg1Zr0QNZB1iROgA6NumFU0gw6i
         mRB30s2mnrPtHiE+teC3fWjVit5A/Pm0nBTHoN7uuPk72HoN73FsyBeV+LhKK3V2Bd/A
         lzo1DzRV8mDL+Taz0/vsUZSLHZFqBpFuWEhaLY6cluAZqginW4xd7jySudx7DhBQ7R1J
         QPUJMxrtReJMgQLcYnpLlXMbywTxdaA08uiQVQDGh+SxVvQWG/++wr1QKnnkcnE10NE8
         TYsQ6clXuXy743Xgu0oHEnIxLwcgO6y2Ca355Qlw481WlzXYuekixo9XAuQe3oQtoqLA
         X+qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749831559; x=1750436359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+LbeAI3FVLi/vu4Z9Rx2+pqe3QajvGe1OymPCc62rPo=;
        b=RL/bXgcXcZMN52uM567hL2CO+3xMRL2YmCURr60fQEO2vK6E5tb6RpBmqmfjf0ZXyO
         mtI+Ziz7rUIxCHbsfbE/oOTwpRtIQ92FzuqFhkaMSEtqbHIgXbwOvIqJX8Uuj01y1K2V
         nVpT86Z0JHJtU9vs0LDDPZ+oJVShkGNKR3iOFQOr6sWXs5XLkFIkdPmQgKWdglv0OPMe
         RSIEefVX33Pb6H3wbI6ZD+QsGjPqCV7j/56aCwQ8BZVqQwEo4YiPyjooyjrinrHx2UNw
         fa0RpBL4/TLG79J/7uUpyxV+n8q3Ku+Olk24Q6J2neppDWcOob0Pj3dWYrKfVzDCm9Tn
         uGVA==
X-Gm-Message-State: AOJu0Yxfb+dsTzNzQQFRyKDTSqSgDSGLSF/ZXxGU5r+//kTNxKm7wj3+
	do6xtwA2V1SDTVSleIqTxAgL8n/dJ2tgXmT/oX63mNc/xY/uAlMwuc4ufgrIh7bo0IQ=
X-Gm-Gg: ASbGncsx2ynz9Sj5udu9L7KtDBaxaT53NSFy06K5MCwrdKWIEOWxhLnt6G6/S8NDWZu
	x0BzXC5Alr0Bc86wF3QUU6C4rlTU6vERL16nA1hk1qrR+SJwhFjo7EPsgmkgOYJ+4nF2eeY3+Ik
	p0vexPyqyVtuENgkfODHvoKBl+sNHc6r3hcSb2OODIz1KcN6eDQluCupyn71aUzt3DBTWq4dHDk
	ojuqNO1MC4kmmKpyoCZ6B48yxNhsBFm/FiRemY/dLkFng4vj9SBm+dYDzVg0QickJUvj2kvanub
	21vzl23F1bPHodG6H5n0zXsEakPukNZn46/EGOGA0rX2I+OHaftwc1z8AiyeFukVdLc=
X-Google-Smtp-Source: AGHT+IFlB0uErrsLZonYmb6i0H/jlNd11xFf9mUJIASNqRC32fpBUzIFX7jHuG+LTRDf2hjPIz1bYg==
X-Received: by 2002:a17:906:c14c:b0:ad8:9257:5737 with SMTP id a640c23a62f3a-adec56483c8mr417502766b.25.1749831559543;
        Fri, 13 Jun 2025 09:19:19 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-adf37467a91sm64118166b.166.2025.06.13.09.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 09:19:19 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: [PATCH wotmate v2 4/4] export-keyring: Add an option to ignore the linter check
Date: Fri, 13 Jun 2025 18:18:59 +0200
Message-ID: <4051e0202ae6e80dc6402de35ca4ee7ebbd879a2.1749831371.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1840; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=fJcok3PJ20HteE/CNfkkqgl/iqnVkyKNX4iPlSjpZ/8=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBoTE94W/CmowgvVmu3/swrB6CypSLB1JxJ10XNw MIb/W1eGViJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaExPeAAKCRCPgPtYfRL+ TjStCACd7e4I9EZsNh8u64Bgl+DL11Wbq6OVj5Qjoel52bGQWj27nmV/uSz3Xtd+Nq1iS9KufNd 37k5+6XPZXluLSgjB3nN91I/skGoSpsj33HggdywpDBE6qgFHPb4dvzvpMyCiaCyE7uQ/e/YnjE wvI0j8HpyXdRtNUhqufYsls0yH6BHRkvxIU+pfa1IfZnCSedbDuPIh5QnWdtzQLWOG11ZURl7ou BkXI6vdvvv1cjz1/5AiYAWlQPIY3fHNG5ONC+F9bijVDtlsswulOHWrceKnYNbAMOxhWpb87Ois ZXxBXN1dVqO0uBqfuhFQiOXlDzMTn5GPURn1insGpM11ik3N
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

This is sensible to use in certain limited cases. One of these is to
force certificates that don't pass the linter check to be cleaned.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 export-keyring.py | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/export-keyring.py b/export-keyring.py
index 14d190c83db1..773aa5f8ad83 100755
--- a/export-keyring.py
+++ b/export-keyring.py
@@ -31,6 +31,9 @@ if __name__ == '__main__':
     ap.add_argument('--verbose', action='store_true',
                     default=False,
                     help='emit extra logging')
+    ap.add_argument('--ignore-linter', dest='ignore_linter', action='store_true',
+                    default=False,
+                    help='Also update keys that fail the Sequoia linter check')
     ap.add_argument('--fromkey',
                     help='Top key ID (if omitted, will use the key with ultimate trust)')
     ap.add_argument('--maxdepth', default=4, type=int,
@@ -173,10 +176,13 @@ if __name__ == '__main__':
             header = wotmate.gpg_run_command(args, with_colons=False)
             keyexport = header + b"\n\n" + keydata + b"\n"
 
+            # Only do this for newly added keys
             if not key_already_exists and not wotmate.lint(keydata):
-                # Only do this for newly added keys
-                logger.info('Skipping %s due to bad linter results', kid)
-                continue
+                if not cmdargs.ignore_linter:
+                    logger.info('Skipping %s due to bad linter results', kid)
+                    continue
+                else:
+                    logger.debug(f'{kid}: Ignore bad linter results')
 
             with open(keyout, 'wb') as fout:
                 fout.write(keyexport)
-- 
2.49.0

