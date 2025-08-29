Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC6827467B
	for <tools@linux.kernel.org>; Fri, 29 Aug 2025 20:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756500001; cv=none; b=EFNBrxBHHhD+zI22cKdyBRfTkitRolR79LUD9Ros2X5jGc+S28AGRGSCnxFJrjvKHEqGGidIHUWT06iFFlM/o76BHKM3eLKN1y9qXVDT3Qu/92NWyNy+cHI4GV8idDrdrRLeP4k3dGktDW1ab87E+UlJhS1+7zMf+OKSJwdA/C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756500001; c=relaxed/simple;
	bh=SCZvUL/Lw4g7IdXXNBu3qFBk6IhyXJ+sio2TxzefGFg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IrllYTajIoLSx7LpOMvpHxRz0EleoBYXxHJ+ixGIGyCRHPDluD3CEqZLtxGebvSCpC9IfQye8XXqnDjRu47GVxjgmyEMx3u/WjyuIrOdJDupkChNHRvjapKKpyvmuTrblXK5uGpRg6zhsA+cY5OIBslJgtB82o02z+0k1o1G8A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=inamo.no header.i=@inamo.no header.b=vPzkHc2P; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=hjoKG1Cm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inamo.no header.i=@inamo.no header.b="vPzkHc2P";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="hjoKG1Cm"
Received: by smtp.kernel.org (Postfix)
	id 7AEB0C4CEFE; Fri, 29 Aug 2025 20:40:01 +0000 (UTC)
Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2DF02C4CEF1
	for <tools@kernel.org>; Fri, 29 Aug 2025 20:39:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2DF02C4CEF1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=inamo.no
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=inamo.no
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 333311400070;
	Fri, 29 Aug 2025 16:39:59 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Fri, 29 Aug 2025 16:39:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inamo.no; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1756499999;
	 x=1756586399; bh=i4MxTSDe4Kn8s6DHsTSi0fUyQI/syzYY3aVuR/d8cFE=; b=
	vPzkHc2PFt/IKFtqfy+oII8uSvGib1X2rW0oS+OYktdG3yxBgDtltxjTLjSiiONh
	nO53uxaYmUeeck+s492+sJf09+8+GqFfsvUDdZbaQ7tWJ9cy5V7CCYTEvK/LzTPA
	ipeqoqbN565xDQeMTZtN1Vhvy29gBLQ+SmdRlehXRfmkV8Voi9hYN7YbL6XVjlm0
	DlOE4BW9LR1X8vPJ7OAnA8QCWO0KTEHPflnJQ1Yr5jNqtwUk/FWE4TZBbQHVGbws
	lc0Q7R5xHWR3KalstyBCEmBYGPAsFgW52n01n7N9dmsnIo+kF7Xl9pEp/0sDT3Ae
	eQ1MreiayCBSN4/H8iin3Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1756499999; x=
	1756586399; bh=i4MxTSDe4Kn8s6DHsTSi0fUyQI/syzYY3aVuR/d8cFE=; b=h
	joKG1CmTVVRz0T7lENLkvZqEEikGfKYuSqqUz/xyI21xB+xtrMkyKk93EWfcIo7R
	XanfN1dgBsGBNpxSR61Qe5pCAsMAzaScXL355SEBurNYWJFJ/dYfUHSpOJ1GFuP0
	v+T7kDPXGq50BK3gZezIvLmBhJSlCFFiDeRFE8Is+UitfOvEZlibNa6TPIwqhpbU
	YcMZbY8UTrfANTxFizRYVgJ0HFrukJgIqS7Ua24KAaG2OxR4RorVuG91tpukeGNA
	HsbrOjRmb32T528aSw2ECMukRk4wxqNS+mrEUZBjHbfHX59t9/38KyElj6EWkmLH
	VUMlpOTdkBKO1bN2+3RcQ==
X-ME-Sender: <xms:HxCyaG9u8Wsj2_13q0qq52Vi9kfYodcZv0MpUl19UOPoxaoPAIQEbw>
    <xme:HxCyaAVy7MqfjjfHSQhG5tdaLn7Kfiqgte0prOuQDkolAMnpWqA0cVNwubHVtdvgr
    D-iGWTdhEzyFXQSNQE>
X-ME-Received: <xmr:HxCyaMABi_lzrTdWlQZAb2hiMcN30r-4qLhjq7YmJreWJ5DdxhaoLTZGcFdSLW3IuXycAJWOf1Y1N3VYGWwHH62SeG7xI15dyQ>
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
X-ME-Proxy: <xmx:HxCyaBxHQHWreaHqeOz-fW6_lOix1pTsz_JZQfSdgDxIb17MuDJIAg>
    <xmx:HxCyaJDy22rvi1r3chOa_nufvBxiMOpoQgMmYr8-JnxxNs2ThaYDXg>
    <xmx:HxCyaOYitQKey57nKueoRun56xrp5b741lpE0GKUZSLoZ5Xd9zV_Hg>
    <xmx:HxCyaBgBFI-r_JYg1qo6kGVJ552OBk-W9k1Dv7TFTSRdEKnNhMfXtA>
    <xmx:HxCyaBV72YjjTh-C2y8j4e5A3_tvGsjijRqrzgB9RcvazaG-5PRMqjrH>
Feedback-ID: i6cf1495c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 29 Aug 2025 16:39:57 -0400 (EDT)
gpg: Signature made fr. 29. aug. 2025 kl. 22.17 +0200 CEST
gpg: using RSA key AF62044EB71DC79B92AFCF661C234B29C91A68CD
gpg: =?utf-8?q?Good_signature_from_=22Trygve_Laugst=C3=B8l_=3Ctrygvis=40i?=
 =?utf-8?q?namo=2Eno=3E=22_=5Bultimate=5D?=
From: =?utf-8?q?Trygve_Laugst=C3=B8l?= <trygvis@inamo.no>
Date: Fri, 29 Aug 2025 22:19:42 +0200
Subject: [PATCH RFC b4 1/3] debug: Add logging for requests
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250829-sourcehut-v1-1-8e259603352e@inamo.no>
References: <20250829-sourcehut-v1-0-8e259603352e@inamo.no>
In-Reply-To: <20250829-sourcehut-v1-0-8e259603352e@inamo.no>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 =?utf-8?q?Trygve_Laugst=C3=B8l?= <trygvis@inamo.no>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=837; i=trygvis@inamo.no;
 h=from:subject:message-id;
 bh=SCZvUL/Lw4g7IdXXNBu3qFBk6IhyXJ+sio2TxzefGFg=;
 b=owEBbQKS/ZANAwAKARwjSynJGmjNAcsmYgBoshAbZUXu2fR3q3oNbzKwsxnJyYnpPTUzkNfDq
 v7nLuPkvkSJAjMEAAEKAB0WIQSvYgROtx3Hm5Kvz2YcI0spyRpozQUCaLIQGwAKCRAcI0spyRpo
 zRG+D/9RpUYXWHuleYx0SjF8MWQqQj0IXieBxyNEtcJJGR5X9GqrsvpcM0s978VktoFXqPVvBSA
 mX5d1GeXp0I6hfieZyakpty/OXQz3zhCEGNRXlrnA709ar68CwdKaNkNbtyyGNVjFNhKSP0Vv2x
 yrAhEu+u8Tl/s9h55VYp1W/fRFArid1ULlvTJ2CIp//bPM2rLXdJbyeJQru6zpw9U5496Re2q60
 4Ao5c4TWWtHBJyzCOpbCtRNMOTUumhgQGgI794qsD+/1gzsvUK5o3OCsGjEqAoMlp5DvdaDyayH
 +EjgPMcrhVENXt9I4jDOShL9j6w9eNhRPEtjfhK8vb3oHieIpooJyzbKAn9wCHtztXavYXwL2Qv
 Yp4d1wjgzhO2gUHpor605Pvq+mNToO9KZW0coxdynBuAqea/IQiOj+rcIf5SpJmUf9ZF3W6/fJe
 gbY5hNMR2CXhg18r4IC3qBkJ3dYm7UqGZvP6vXUJ4+8enT8LdVnfybIdp39jguaCnPzj+zO42z4
 ntx1u5l9tHL1EpkJpuVJwKp0ymu//xu3kOJgrWn4JJKbQdAsQMfHzZq5bSzvlvnHto3T9sK+7zE
 phhWvLBgf1ZpiC8ySpVo7IT2dQqwGQ+1B7HvfGaru6YLPY1hsJMKj70FyL5am6+AHIdBJgijtRZ
 /HveyavJdQ05i+A==
X-Developer-Key: i=trygvis@inamo.no; a=openpgp;
 fpr=AF62044EB71DC79B92AFCF661C234B29C91A68CD

Signed-off-by: Trygve Laugstøl <trygvis@inamo.no>
---
 src/b4/command.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/src/b4/command.py b/src/b4/command.py
index 455124d..5305a14 100644
--- a/src/b4/command.py
+++ b/src/b4/command.py
@@ -411,14 +411,19 @@ def cmd() -> None:
     formatter = logging.Formatter('%(message)s')
     ch.setFormatter(formatter)
 
+    req_logger = logging.getLogger('urllib3')
+
     if cmdargs.quiet:
         ch.setLevel(logging.CRITICAL)
     elif cmdargs.debug:
         ch.setLevel(logging.DEBUG)
+        req_logger.setLevel(logging.DEBUG)
+        req_logger.propagate = True
     else:
         ch.setLevel(logging.INFO)
 
     logger.addHandler(ch)
+    req_logger.addHandler(ch)
 
     if 'func' not in cmdargs:
         parser.print_help()

-- 
2.51.0

