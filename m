Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED5B338F20
	for <tools@linux.kernel.org>; Fri, 29 Aug 2025 20:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756500003; cv=none; b=oRGOZW9G/+ocuZgUtS4UYsetbQSgROkSbnsiACf0oDHPFySw0uUjyJj/TIzrF189/aWP1fqPSYF2+iyfTg8zUTRlPaCq6dYzTfkSNd8GkBPjWB4suNW1r/XMsCGT+urJ2LkypWi13dAwYgAGXDb5NG431dZWJoN6539bwJf6CRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756500003; c=relaxed/simple;
	bh=2vw2ehCrckm0fNr3J93x/t6oEyAAAGqe+TOdI32V17Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pGfdTX2al+5rXBzh+p4sHx3GRln+8YJhhRv60zCjAr1IC0+9wLUj8kdhLa+GMgsB1q5uKLZQpKE2mUVgFuMVVHaAzaAaTRhKKQD684LucqaHjVKqGCdGwc8BSZjAFuzWFqQNb2XxM41RG3TjRexGoVAeAfcXX4PM+fFyZvbejfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=inamo.no header.i=@inamo.no header.b=raI3Dhut; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=EP+Pe5z/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inamo.no header.i=@inamo.no header.b="raI3Dhut";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="EP+Pe5z/"
Received: by smtp.kernel.org (Postfix)
	id 0405AC4CEF7; Fri, 29 Aug 2025 20:40:03 +0000 (UTC)
Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 75F81C4CEF0
	for <tools@kernel.org>; Fri, 29 Aug 2025 20:40:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 75F81C4CEF0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=inamo.no
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=inamo.no
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfout.phl.internal (Postfix) with ESMTP id 72325EC03D3;
	Fri, 29 Aug 2025 16:40:00 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Fri, 29 Aug 2025 16:40:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inamo.no; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1756500000;
	 x=1756586400; bh=vQqdoAQlQe5V7U+SMveXptcZB5eSu896lUgAI9fC41Y=; b=
	raI3DhutO2nGO/BVsGrEqxXok/VuaX3MzqObSVV3mZaTgR8GGujOIN68VTkJULJk
	W9R5vdMoAGOlnB+dh2AbCIj/lWzhGAd7L2oO/+LGJvYH+hu6l9wU2Bup50saQMcp
	T938Zaa1aiebdNv77CiJ46lhkxU6y/GUHRy4xCP2jYL6hKUzkpoT5epd6fZ2Kvyl
	B9+M6P3U7gEfjlpmoxfvFJaPeNOC/FU075rDUni7Fm6rlEE/51LsbZPEqHwk8osS
	TBNPND3jaAbB0Qie1WsCWa7UYjCvVAMer9pO+YNL4VHH6IgvtxVah52zdlFOBg7F
	duQICv+awoUk5KRR1bcJnw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1756500000; x=
	1756586400; bh=vQqdoAQlQe5V7U+SMveXptcZB5eSu896lUgAI9fC41Y=; b=E
	P+Pe5z/HdmSsfMn6i40Rjm80J23vusNL8HhwM8RuHU9QmlhYHq6zxBIHj99X9aPg
	nt4aGKAUzOMvboDCXgmN97FL/9hKg1rgm4nKyOgEmKDerwk6iJ6b1nLk1s7fQ/U2
	b1muG9v5icrUT96gLw3P8vwWt6iatnILk5k4cCBRoqEA8mFGzhryAsX8kAdDr1jW
	rP2fzgjjUhJlv2h1JMsTABEso9yu3YmfOASqCCZ71Rg/0TE0sCnbhThLXRCJH+iR
	s2HKO+i3nhaO2Z2Eiag8J1QV35GcO+5hel9O2pW4y3Uz0C5KTe9JjyX9ia+heK3p
	2eZAwmytT9lbDkJ160ptw==
X-ME-Sender: <xms:IBCyaETIQIvlKTUf8wa7hDSDfXB5BolXYejnUgiBDRBLb-fjPV90fw>
    <xme:IBCyaLYPx_AkQWtwT91BawDU4RSXx3CQ2ToV0LucdoCfRZU8SME7RAmgKqab1mNxf
    qwqzHWq1Rtod_PUE5s>
X-ME-Received: <xmr:IBCyaB0seV5FcdXc-q4Yfm7NRptIxUyU6gJX7sj3Vbj2ROQbMzPhe2858cLGPun11niFotW5vItPh-978Yu-h1VZWsDAP6nt9g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddukeeggeelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpefvrhihghhv
    vgcunfgruhhgshhtpphluceothhrhihgvhhishesihhnrghmohdrnhhoqeenucggtffrrg
    htthgvrhhnpeethfegkedtffefhffgffelgfevhfekieevheeiledtfeevvdfhuedthfei
    ieevhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    htrhihghhvihhssehinhgrmhhordhnohdpnhgspghrtghpthhtohepfedpmhhouggvpehs
    mhhtphhouhhtpdhrtghpthhtohepthhrhihgvhhishesihhnrghmohdrnhhopdhrtghpth
    htohepkhhonhhsthgrnhhtihhnsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhr
    tghpthhtohepthhoohhlsheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:IBCyaLXecxzC4un4Wnmhj2FUcQraylluFMHMgpaOpjxppkGY--H18A>
    <xmx:IBCyaLX0EmXyqVrCSVh3a5W-C1udgICfVWR71kSNcazo-sSktfo3NQ>
    <xmx:IBCyaKdKKggTbrrwmEJu7CqFENIYmxf4PPNtWvPI_mC9Uo4WMXtkEQ>
    <xmx:IBCyaEVUmSczlWfVsO9DhKo_Jl4XPEHcdqBmb2yM1cezEcCTn72bqw>
    <xmx:IBCyaA4O7p34nuXvubdn4hZslUdxKWcnkTiYj74FWaGoa6O2uHgoVEPU>
Feedback-ID: i6cf1495c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 29 Aug 2025 16:39:59 -0400 (EDT)
gpg: Signature made fr. 29. aug. 2025 kl. 22.17 +0200 CEST
gpg: using RSA key AF62044EB71DC79B92AFCF661C234B29C91A68CD
gpg: =?utf-8?q?Good_signature_from_=22Trygve_Laugst=C3=B8l_=3Ctrygvis=40i?=
 =?utf-8?q?namo=2Eno=3E=22_=5Bultimate=5D?=
From: =?utf-8?q?Trygve_Laugst=C3=B8l?= <trygvis@inamo.no>
Date: Fri, 29 Aug 2025 22:19:43 +0200
Subject: [PATCH RFC b4 2/3] Use decompress on compressed data only.
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250829-sourcehut-v1-2-8e259603352e@inamo.no>
References: <20250829-sourcehut-v1-0-8e259603352e@inamo.no>
In-Reply-To: <20250829-sourcehut-v1-0-8e259603352e@inamo.no>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 =?utf-8?q?Trygve_Laugst=C3=B8l?= <trygvis@inamo.no>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1569; i=trygvis@inamo.no;
 h=from:subject:message-id;
 bh=2vw2ehCrckm0fNr3J93x/t6oEyAAAGqe+TOdI32V17Y=;
 b=owEBbQKS/ZANAwAKARwjSynJGmjNAcsmYgBoshAbTRQanfFqFK0MWjzFEDaCJqZsOJKw7lm46
 JhwN+ljPeOJAjMEAAEKAB0WIQSvYgROtx3Hm5Kvz2YcI0spyRpozQUCaLIQGwAKCRAcI0spyRpo
 zfLQEACAjYCJ1Qdf3yoV6xLIv+c5Lg0lEX25+WeFLdw0mZBpNNqLV7woHqHCn0G8+BkXsCGNMon
 TStOQPRaSbgmFc93KBaW3tyL9Zp5qxZvAe8l9MbA2oxY/6l/oQe54n1d9nVoEgL3aDvOH35JwMk
 vq+p6lKDHrYh4CtifwFL0CgGcmc8Qp1Yl+28ZqRq0PcdjTB/vg6wy1HUfRhj/g0syJj8rKCiF38
 t9d/OvZA60qtF5sIFRS/afxt8CNchwG71hkQaoWU+OvUBOoQsPVuqCANBbJiCVMdDzDC6fbHBRp
 dh3RAmSsVubyuu44ARqtBrKXcP+HvBCAbx9DNxb1WNttCq7rBuaMTmxzl1QfvhVYx8SB4ogLY8p
 +eOtCr/yII76TOaRpPsJbRqS08ZqDicX1zzLdU2kbg4uX/jqpMRnmks5uk/A9Isvlgz6CeOUnNL
 LvuFikJ+uicliLvH1fl+mDN/E1Ig5GuO/0Miuk2Fbp9N3OwAlZ5JzKsrDU9byIz2pwfSUnZ55P8
 DCEAZRQImdgi1QJNzwC0BUKXAe5gi5Q2WpPNf+xQi7ja2ZHq33aFaldvZPG3aRF3ociUTH6EsvP
 hugFsV6jjnLSSBdDfuHVrd4Yga04rpxcjxts8ySynrrWKaxykKCf1KJUYz6qyYWmOdHCRsg/Ezo
 J0qjDw7gmosINRA==
X-Developer-Key: i=trygvis@inamo.no; a=openpgp;
 fpr=AF62044EB71DC79B92AFCF661C234B29C91A68CD

The mboxes from Source hut are not compressed.

Signed-off-by: Trygve Laugstøl <trygvis@inamo.no>
---
 src/b4/__init__.py | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index 33aee1f..02f4f73 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -3413,7 +3413,7 @@ def get_pi_search_results(query: str, nocache: bool = False, message: Optional[s
     if resp.status_code != 200:
         logger.info('Server returned an error: %s', resp.status_code)
         return None
-    t_mbox = gzip.decompress(resp.content)
+    t_mbox = maybe_decompress(resp.content)
     resp.close()
     if not len(t_mbox):
         logger.info('No messages found for that query')
@@ -3515,7 +3515,7 @@ def get_pi_thread_by_url(t_mbx_url: str, nocache: bool = False) -> Optional[List
     if resp.status_code != 200:
         logger.critical('Server returned an error: %s', resp.status_code)
         return None
-    t_mbox = gzip.decompress(resp.content)
+    t_mbox = maybe_decompress(resp.content)
     resp.close()
     if not len(t_mbox):
         logger.critical('No messages found for that query')
@@ -4626,3 +4626,10 @@ def is_maildir(dest: str) -> bool:
             and os.path.isdir(os.path.join(dest, 'tmp'))):
         return True
     return False
+
+def maybe_decompress(content):
+    # Decode bytes if they seem gzipped
+    if content.startswith(b'\x1f\x8b'):
+        return gzip.decompress(content)
+    else:
+        return content

-- 
2.51.0

