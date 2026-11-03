Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793716191;
	b=GA0OI5PxpdV432nL/DfFaD6AL4oYDtpvZibD3YoaD24FyL+MeVZDzewX4cn3Yqp3JXys
	 v3Qql+TxcZsOGkU9b+pntJp8JXkRKecjbswXOciUOXZismbjRfDmWShyBJA9Psm6RABqr
	 a482qbgg/NF9Om102MIg3WA/TmIZWvK2JR4jmsAfF1aCKp3n4IYdthy+fqLxXRVwabxZa
	 NWOEuL2M/7Ct3QLW869CztzZCKHugrGt4d5FiKqxAcnuRKo0K+ycEOXbP0dvqrNSSlvlP
	 rkRpnUoazLebkPjLozHMlI/8+fWcVw0E3DsQBGoSMhTvCvABCfx0Z1VM8H140qdC5rw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793716191;
	h=Received:Delivered-To:Received:DMARC-Filter:Received:DKIM-Signature:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=WorAsYr4QsIIiULJvg9FetO/HnSimRJ32o/Ac3sAbkI=;
	b=33q1Tjzk0+YdRfaZ832SZYelBERJyusADisBuCtYsUEI+F55QtJKGqDyx40lihtz/RPj
	 3DJlmqsng4bcTYPy2vw14bnJhgCbWcqCHRxSj8z2ClnZwZNB2P6BKJUDGGWdqye1+zljU
	 ZKH9x5et7iI/l1h3Ks5XlfvIFbaw8EWxXB3e0s12LI9hMy1stit2phaI2mcblG82joYKR
	 suvRTuzpn8j6E+f3HIov78wXe38eC1lczuOa3drxlIMQV3L+uHgjXc7IkuHsasM8Qx3MK
	 Hbg4GYquLT/myfV2UHPUm3c3FWs5NbBT6/PHpPHU47dCtWrxFVQjOGUCs3nvoux0/Cw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y8KDKqpc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C89606A32C
	for <tools@linux.kernel.org>; Tue,  3 Nov 2026 14:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y8KDKqpc
Received: by smtp.kernel.org (Postfix)
	id 1F4FA1F00A23; Tue,  3 Nov 2026 14:29:51 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793716191;
	b=M20Iv2CL+JOxgD4xhvCZ0bfeOLr1rbZ9AUGVWxavzQMjg/174bUHRIGETflbhOSzcomK
	 nG+EoaShKxD1jS/Z62G5daWmY9oijEv6sIiKPDvj7kHP74/DdxeIMTDHp92/J199WUw8P
	 fMyqHXVeFK6NH6aU8eRpxdk2s2kRIS37gAQeyGTKKOcDbcZxus2vLA898IWiU5vB+FW6a
	 4E4Btr2+xYXprlwPw4gH0jJvOUGPja6R7+Fy6OYr7S4RomFpBrLHhVpvyLMsVOFazOgQT
	 saexshbV/x87JBslN3k1wfm7thdSnuDs/zDbzwvriHNOuMmz5PQtHeFZNcy1sEFzXXQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793716191;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=WorAsYr4QsIIiULJvg9FetO/HnSimRJ32o/Ac3sAbkI=;
	b=pb7RQfr9qKp9xl9Op0z5umQVHzlU1GH0dUCsCJNSp7eGwEgosgrUF/UE1EHshe/bTXPL
	 5LCmLp/WgDmhmZNHERGomw8zlmo5dRbs9Xh+WDtqUMqEpzU7uJLt/nUd4Hy41bPt6DBof
	 9505OzsQ2VBUizGtZG1W7bEl0Ah/PJ2e3PIMP64lbKp9rW9ZA52Q8YF/V1bKMBf9eCkSS
	 +F8DliPCkd68bcfLTkTikbpNSGIGlZ1NZaIvkfPnv2NuYZQrUjKWztvj4rI+oSxxjTYhZ
	 MGf9+IYTutDZKTPcb5kg/rx/Sy53TW2KpFxRum1gjdlanIZkGuut8xiGDhPpQEtWN2w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y8KDKqpc;
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 558541F00A02
	for <tools@kernel.org>; Tue,  3 Nov 2026 14:29:50 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y8KDKqpc
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 558541F00A02
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so38271185e9.0
        for <tools@kernel.org>; Tue, 03 Nov 2026 06:29:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793716188; x=1794320988; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WorAsYr4QsIIiULJvg9FetO/HnSimRJ32o/Ac3sAbkI=;
        b=Y8KDKqpcztQQSvTKENeM9qWkHNmTtIXwkAbKyS6OGAA1EaQQK0unl3RPSxoxnW39YS
         9bWv0otJdGITBip+3ChAxMU5UbMWkFRklqvdL8j41EX6d3Z8YAbDecYARQnnoXj3Dhi6
         yrnWpPn04tEhohyWEB1DdqeCnGIszJ44lW/oZWFGhdLOfGktS3+OC6Vy3Tk3+rhEE6Pp
         55LKPegj36cpYWkd6RNdGeJBiP823CO8Z87dICC5HAc3OtL+D2p8SkTuC9EqJJ3y+Ho/
         uFCU/xxEJdCe8Xard6s67tf00wdwX9ppUxFVVbk9/zzyNYaXgu3KVzDxo6cCgf9dJq8D
         Ornw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793716188; x=1794320988;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WorAsYr4QsIIiULJvg9FetO/HnSimRJ32o/Ac3sAbkI=;
        b=Thzmap/tCSO+qSOYz9z4v4TDtvJCg8K/PysrhPG5OoIA16kr+BdIJALMilLLeVh5MJ
         SG6ceownH4nhSX1BI4ElKExm6sLD8JJRD2FBD2lzVg9MBpS64hWCYZ2XZ5mwA61sjlTm
         DvmsmORh5eaTSDFk0XpZDOKv4S5tUrAsO7u5qOUDJakwuKSUKBJNBxThK3OPw9Zq+bzL
         9zrkBJdtlNSEWVieipqMnw6sDA/viUgevgssOFdScq/OZYQ9SXz3TeT42oQlK850pn1o
         eW+hJ06vxM3rvJCg3kd07LHPO4nKySaloy3LowsjSLNvyNGJncP31hddLdsQe86CZz2l
         TZdg==
X-Gm-Message-State: APuU4Z8bH4m+b3b4D6BrSoQETMzAbPX3a4Q+9bxHJhEz9UffHmzTmjCg
	Hs0d7PcxTQPHmNpoenfadMC7U0Eco8Rq+2Yz1EalJXGRTwGg9xS00G/TO8VhCQFc
X-Gm-Gg: AYBFou3jKwFK2W+kTI9PQkEGNXe+vZmviGbjlvHTfhFqeXiLiA7qOi4NKSIwiOLNWe8
	XHWOZYDCTHhKHM4k/7j4UAj3yj/4Ru59M1fFzrjtnna/UlqeVgFob/bfvjjnvRrbVIYpxIhkkDG
	EQ/K8yOQoncRnpMS0wA+ti/XTk4qxW/oMt5l0wMaBMs2Tj1DEysW0JGC8UEc5UqC7ALlzS+LzsC
	DiIOx26GIvy6kgkYfcYjmnoK2eimu8NoKYLrzuj11caujaeD7qpnl/wflfKAiaG8uvgMO2PM4Dp
	AQvNnWVZxszU16yuA5tLfRWRZBGGf4iUoq5bv1rpcLNztERfpZBTH5ZF8L8i8kLXOWP2NbCYDRf
	QqkjK2sff9CNLAA+RZPYadwaAuBmAptWPSy8w6Eh4nH37FNtDAmFp1Ihre2oIxxj07rFX4tEczt
	fi/XRMFtwoiNFji8RPmH5OzmUs7b6zGtvn8pGt82jp9yNzH+ltu2ntVGZHbqzZODzL51vqsrYph
	TkzENxCTtBNopvj3V4vPTPmRQknTTAGi7GT1jhaGQLYTOahUducGq0PVl8HxQM15Vp2k1lkQW2Q
	Tn592mneRkn2X28GltNbnn9UP6y/Uj++U5u3fHsQEg1tNvh8C4NdeTROyIsCRZiNa3o=
X-Received: by 2002:a05:600c:8b4c:b0:4a5:1cf1:b7b8 with SMTP id 5b1f17b1804b1-4ac17b2cf8amr304556815e9.28.1793716188554;
        Tue, 03 Nov 2026 06:29:48 -0800 (PST)
Received: from 990pro.localdomain ([185.68.248.203])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a96fc933sm65290805e9.11.2026.11.03.06.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 06:29:47 -0800 (PST)
From: Bernhard Kaindl <bernhardkaindl7@gmail.com>
Date: Tue, 03 Nov 2026 15:29:37 +0100
Subject: [PATCH b4 4/5] get_pi_search_results(): Add flag to raise errors
 during search
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Post: <mailto:tools@linux.kernel.org>
List-Help: <mailto:tools+help@linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
List-Owner: <mailto:tools+owner@linux.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-browse-and-track-series-v1-4-d9c9306f4033@gmail.com>
References: <20261103-browse-and-track-series-v1-0-d9c9306f4033@gmail.com>
In-Reply-To: <20261103-browse-and-track-series-v1-0-d9c9306f4033@gmail.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Bernhard Kaindl <bernhardkaindl7@gmail.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793716179; l=2769;
 i=bernhardkaindl7@gmail.com; s=20261024; h=from:subject:message-id;
 bh=V9IA7noXmc8+a5eH9DJ++of2Jt/J/sC0rHVty7afN8Q=;
 b=Y/ib7bpoQgOUC0XEl17nUyqvV0QIHvHeWdtd6I5EnCkbh4kEGoh3tDdu/LacQnPEx6eIbFPg/
 SD3wXPm+5SoB6Hv62KG7bxM4DGw2qqqSTIHebJYotsH8r6qXAwGT7C2
X-Developer-Key: i=bernhardkaindl7@gmail.com; a=ed25519;
 pk=oIjnI/us0Uh5d/WP18V5IQq/FrLPUp+W0JAhJ9QCQIs=

Signed-off-by: Bernhard Kaindl <bernhardkaindl7@gmail.com>
---
 src/b4/__init__.py         | 11 +++++++++++
 src/tests/test___init__.py | 13 +++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index 704ddec..a254a2f 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -5427,7 +5427,14 @@ def get_pi_search_results(
     message: Optional[str] = None,
     full_threads: bool = True,
     local_sufficient: bool = False,
+    raise_errors: bool = False,
 ) -> Optional[List[EmailMessage]]:
+    """Fetch and deduplicate messages matching a public-inbox query.
+
+    Return None when there are no matches. With *raise_errors*, propagate
+    archive failures other than the 404 used to report an empty result;
+    otherwise log those failures and return None as well.
+    """
     node = get_lore_node()
     if message is not None and len(message):
         logger.info(message, node.hostname)
@@ -5441,6 +5448,8 @@ def get_pi_search_results(
             local_sufficient=local_sufficient,
         )
     except liblore.NotOnMirrorError as ex:
+        if raise_errors:
+            raise
         logger.info('%s', ex)
         return None
     except liblore.RemoteError as ex:
@@ -5448,6 +5457,8 @@ def get_pi_search_results(
         if ex.status_code == 404:
             logger.info('No messages found for that query')
         else:
+            if raise_errors:
+                raise
             logger.info('Could not search %s: %s', node.hostname, ex)
         return None
     if not t_mbox:
diff --git a/src/tests/test___init__.py b/src/tests/test___init__.py
index 764829d..5e654b9 100644
--- a/src/tests/test___init__.py
+++ b/src/tests/test___init__.py
@@ -1644,6 +1644,19 @@ class TestLoreFetchMessages:
         assert line in self._messages(caplog, logging.DEBUG)
         assert line not in self._messages(caplog, logging.INFO)
 
+    @pytest.mark.parametrize('status_code', [None, 503, 404])
+    def test_search_can_propagate_failures(self, node: Any, status_code: Any) -> None:
+        import liblore
+
+        node.get_mbox_by_query.side_effect = liblore.RemoteError(
+            'search failed', status_code=status_code
+        )
+        if status_code == 404:
+            assert b4.get_pi_search_results('s:thing', raise_errors=True) is None
+        else:
+            with pytest.raises(liblore.RemoteError, match='search failed'):
+                b4.get_pi_search_results('s:thing', raise_errors=True)
+
     @pytest.mark.parametrize('quiet', [False, True], ids=['loud', 'quiet'])
     def test_tracker_sees_upstream_thread(self, node: Any, quiet: bool) -> None:
         import liblore

-- 
2.43.0

