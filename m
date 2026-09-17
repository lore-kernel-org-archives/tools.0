Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D440259650E
	for <tools@linux.kernel.org>; Thu, 17 Sep 2026 14:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789655410; cv=pass; b=iK+Wq8Tjpu1qdr/sk/8YukUsgYSRT8bMBF9/7zNS0Iq974+/exnM3G8mCHqxOJYOl0dETUObt2/VCm9VckAyt3Ww3oIcSo2SDPZM4xlYQAO6zrd1BSeryvqIk598WHEgdHvrfAgoZ+pPpz6df1q4rqvfb22QLBsgiADUFg8yzc8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789655410; c=relaxed/simple;
	bh=TcQ7yxRN1e2FYIJa9k/c76Jiyp5XCdvYD7oMyZlDzyU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=OWvxgo4QSFw/c5+EOr1bvIvWq3fLYFTGwVWmfSgxWV486/YeI9iCETKrXN2pUKfM39xIPTH8YAue1XPYoo/n7KBhEcKg8o4nk32DQEG8A2vVATptqvEQBJFtWT7Q0UEuexlb0qzG0lbvLMI/PEexbpb4uPWXPI5iByAEAmnKOck=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=O688Kwkq; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="O688Kwkq"
Received: by smtp.kernel.org (Postfix)
	id 65C0C1F00893; Thu, 17 Sep 2026 14:30:04 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1789655404;
	b=fY86Tk8Tk839/Xi7Aiyd04bl5/XpFlO6EOeQqcRetbWbJQ7tFkiLN+WbSE8zzUOw6Lm4
	 9gjd3B7bdOPEJKfSFHk4ew7ix1s/aoZsi/H+axL+AeV0XYdgVDZiPOBZOnCgWkWQ8h6GH
	 hcU9IKNdmqfJmutFV+1D791BRfWsavKUgUtLzg456WiIMBhR7kFYcKFq39BgvZvCXxS7+
	 3YF+gfWbIB9kyx4y9+0h2rt+ogNiQ28jOQVP9SiZwJo/rkuPpAcXpunABh4osRc3caqju
	 wEoRSXFE2nfMefQKLoKIvEmAF5CijUgwtf6j5s7JwgmJzTHqAceTCgqg4Dkkhv7zDCg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1789655404;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer;
	bh=jRfEtJn8WsgLlPtC83u2RWp9vUrZOO2HLAy2JeTL0z0=;
	b=sSBBWLLIYyD5GodvXWx6MQtav1+vxvFlugGnJTwZ6g7/bSKPoFq2miaq6u/wqZNY+Tto
	 045IP0RQkc/WgjATQmG46kWAPqMbwnwXWgf8eYZ8wCf8eCD2Rn9gnw4QIIELHJl36IC+l
	 7d6m71u4BcX8IHbKGY+xpXxfX1FE9Giq5IQXqYvNjfJQAmZ03e4iL23ITq8esvTFo/s6t
	 gUV5Bd79LYGR4ZjW/hACQyW6DdZb/iHDCwb/GjYoOXafYel3BKzdTVrDgNSBG4yAliWEp
	 F+Z6nvg7LltgQR/qgQ+vLZ4CreF/tYdgCi+Q/4vLuHLfbU1qnr07TgmmVDUO5L+5pow==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=O688Kwkq;
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 50B221F00898
	for <tools@kernel.org>; Thu, 17 Sep 2026 14:30:03 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=O688Kwkq
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 50B221F00898
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789655401;
	bh=TcQ7yxRN1e2FYIJa9k/c76Jiyp5XCdvYD7oMyZlDzyU=;
	h=From:Date:Subject:To:Cc:From;
	b=O688KwkqcKyZeAd5u5FjI5fz0dqDcTSQR1bhSjTr7qfqn9ERVMvuuF2+2VyH1KWYB
	 VmKSlYa5pdmekIEvqzN1AkzCUup2AezPqJ6Syj51Ko+LL/Vog0EZG6ULIoyUvuxgfm
	 3GMXcZZQKOBZT1F6njF/I+x7mo34XJhUFP1h7VEEup02b7GZuz4NYukKBsqo3U9sly
	 f1WLikAXc2bHQ72/trvD9VFhHQrOqjEbrwuSdjutxVlkTckmDNqvgqNbEnQo3pKGEd
	 1B3CJBtyXbSg455Q7ZSGFhnD67j61B50BC1AcKA46GhzME5wmM2ckALgDaPA3rc25L
	 RZl5cS8YnehsQ==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BEC2517E01C5;
	Thu, 17 Sep 2026 16:30:00 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
Date: Thu, 17 Sep 2026 10:29:51 -0400
Subject: [PATCH b4] b4: Use full line in regex to detect vN prefixes
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-fix-prefix-triage-v1-1-4374dd85a143@collabora.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMTQ5EQBSEryK1nk486RCuIhaawrNAus1kEnF3j
 VXlq78DgV4ZUCUHPH8adF0iyCdBN7XLSKN9ZGRplqelFGbQv9k8b9m9trEgpJXelQPFIe7e9Pm
 s4Sya1wtfN7Pb7zOc5wVFoV+0eQAAAA==
X-Change-ID: 20260917-fix-prefix-triage-1ee41db9fe1b
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Detlev Casanova <detlev.casanova@collabora.com>
X-Mailer: b4 0.15.2

get_extra_prefixes() returns everything that is not a vN, excluded or X/Y
prefix.

The regex used for version prefixes didn't include the end of line char
($), so a valid extra prefix like "v4l2-utils" would be considered a
vN prefix and not returned by get_extra_prefixes().

Add the $ at the end of the vN regex, as well as for the N/N regex, which
is less likely to match other prefixes, but better be safe.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 src/b4/__init__.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index 2350916..b4de03c 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -3453,9 +3453,9 @@ class LoreSubject:
         for _prf in self.prefixes:
             if _exclude and _prf.lower() in _exclude:
                 continue
-            if re.search(r'v\d+', _prf, flags=re.I):
+            if re.match(r'^v\d+$', _prf, flags=re.I):
                 continue
-            if re.search(r'\d+/\d+', _prf):
+            if re.match(r'^\d+/\d+$', _prf):
                 continue
             ret.append(_prf)
 

---
base-commit: c9c068fb845f15691a80d5ce5ca6e25ab4c03187
change-id: 20260917-fix-prefix-triage-1ee41db9fe1b

Best regards,
--  
Detlev Casanova <detlev.casanova@collabora.com>

