Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA262F90C5
	for <tools@linux.kernel.org>; Sat, 25 Apr 2026 19:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777146606; cv=none; b=GxbkWoe7vw5sYHOdd2CYNsw8uekLOtSDeS1T0Kgp4v3vMB51JsMFvhYi0Pp54LX89fqMQ9y8t6u/AuxbcWK7rhSibuuBzXsHte/Ay57Pdd/pVesB63a4dBS0eQ7JD+CV+le/D72Lk8eVaOu84yKUUjHRfXRktgaXTTA7A8ou78k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777146606; c=relaxed/simple;
	bh=G7HyW1HNC9p4LCCU+xhN0km3JnxIoQy7DcYEzWGSz2k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XeHBveFSGzsbCAQP3m8qk1YNWwQPiOc54WIrF1iJZto/F82ztW0Io9os7VXSqR2z+xJkQ6gnJSW1quLuP3qKEH9zHlcLBSXOiUEz0k8cgnMhWZJ7pooI6fDyLTJegpLWLNoYJ/HvedKX9RcX/hNPqz+ZazTvNdWdFYLAjhBFR4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lpgUJAGb; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lpgUJAGb"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-12c750eaf4cso548031c88.0
        for <tools@linux.kernel.org>; Sat, 25 Apr 2026 12:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777146604; x=1777751404; darn=linux.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l5RUtxrTiTGOzE6IZAxpTvqnStGzR2CacLnv3ct0xpI=;
        b=lpgUJAGbYAEPtNoAW+YqeC4ztSJ6c0gJMZc9HA8dWXIHkTlJWsDDcV73/ITGeRRXfm
         fU/4x7r3pKD7hKrclzXPRTqb25LRnN6Jth2y1cjWzqrPFbitIr16wO6ut89pxTiQVlZA
         Ep7QHgIH6KSDj3yq+7xPVG0OGnWvMDaoVsgStS7Hc6/4FArODSh/HEAeuVy6nAnxs97e
         KRxsNL+osSmD0MA0O4MEbt2/xf9Jy80gHJYqaTJV+PPKoyiiyAdNMOhi9UCGxsagWCqU
         UD3nGRbHX2iKQQq3xijf/4B8BShI2dgN27sSmCaoK2G1BN/mmIvHXc78zVraX9htjTpQ
         MBDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777146604; x=1777751404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l5RUtxrTiTGOzE6IZAxpTvqnStGzR2CacLnv3ct0xpI=;
        b=crpx3S1MWO8Tec0qMCSp+BGZaWYnSooFjDXZP8CVgNeOQum9Irarm6sVyNnMKMhiyh
         odlgeQRrz6FvKv/UNanDn0uSdJJUnNWZUtbZJknDRi5EIdorkOU1U1L0xsJJtlqczJ/z
         Hnhm3GEhDaZH3mQ3mx161dSthYnYXeEuuKxWeIcyJHi432dfNJay8y0vt1hyrV5a0LUa
         /+EWYQ/zxIScUhTPWiOVN8DM/hyylb32c0f+CSPcb7j/gz3wktDztd3BGWBTtbu8Tmp6
         Ivs/LzxBIyw8qHpPO4iw0qbe1r/wh4HojoqNlCvJruSv5hctRlLu8QIneXwBzJzGAKwS
         RAVQ==
X-Gm-Message-State: AOJu0YzaJBzgXPT8FudWiIZpGW9q5pQVO+7bX9RZpUGNL7f8YsZteKw4
	cT+uhwq8PPGZT4sLDRpJs9W5pucAM9bVkL0ZBHm120EyntrNJXziIySEhFJhWQ==
X-Gm-Gg: AeBDiesLG2eBqySZ2jUWFr50PhdL5rllMUIPoTvBqwPMLp3QJ2GBcjlFnZEj8SDTTMc
	Fb84s3Ra/uLefV0YwdTf4Yso2CCGvka2DUm6/5wBF2JMW5m/ngaTNN5LEaeqZrKuyaX8hqcuiBN
	pt5MTzsuwUrjtyX0k+hi6LBVmVYhBZmE9dl4mwC/R2gvMqE59b2gp5cqgybLxj9W/jbuPjwmlMh
	H1w7e4gdT9bycKzN25pvRc6MC95GVfValSlm9kW9asuxkD1xKiEtwSw+pBK9+7k9hvrR1CZKe3j
	bIdNm0sW3SGVeSseIxsiW3WYAmjWLX4XfKPjDXbp1s+88eEXS7ZXHa1n3j5dBmkeefsf67Hr/7l
	sN1Ml1ZTBIFbv3W1vic/+mv2YdI6uuDw9Yyan48YlE9wq6nZqSExSGNBHFNp0UgqNYABAtXmDoo
	tIcq41vRUYUzSuhPuPs5zwz0DwFxh439MAsy/gEZJMpmC5gszUt6ftTX2H41rFOJE0YJ78LV9x5
	GAPhnCUSS4rKpVqHZ9LcW0gyTR7idhQOnI=
X-Received: by 2002:a05:7022:6289:b0:123:2d38:929b with SMTP id a92af1059eb24-12c73f9f31fmr7682146c88.6.1777146603784;
        Sat, 25 Apr 2026 12:50:03 -0700 (PDT)
Received: from localhost.localdomain (187.250.115.107.dsl.dyn.telnor.net. [187.250.115.107])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c74a20eb5sm48512078c88.14.2026.04.25.12.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 12:50:03 -0700 (PDT)
From: Adrian Neftali Sanchez <lutgaru@gmail.com>
To: tools@linux.kernel.org
Cc: konstantin@linuxfoundation.org,
	Adrian Neftali Sanchez <lutgaru@gmail.com>
Subject: [RFC PATCH 06/13] b4: select platform-appropriate default pager
Date: Sat, 25 Apr 2026 12:49:34 -0700
Message-ID: <20260425194943.1499-7-lutgaru@gmail.com>
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

"less" is not available on a stock Windows installation.  Fall back to
"more" when sys.platform is "win32" and no explicit pager is configured
via GIT_PAGER, core.pager, or the PAGER environment variable.

Signed-off-by: Adrian Neftali Sanchez <lutgaru@gmail.com>
---
 src/b4/__init__.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index 262668f..803d487 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -5685,7 +5685,7 @@ def view_in_pager(bdata: bytes, filehint: str = 'b4-view.txt') -> None:
         os.environ.get('GIT_PAGER')
         or corecfg.get('pager')
         or os.environ.get('PAGER')
-        or 'less'
+        or ('more' if sys.platform == 'win32' else 'less')
     )
     logger.debug('pager=%s', pager)
 
-- 
2.45.0.windows.1

