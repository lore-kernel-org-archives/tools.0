Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35DA034572E
	for <tools@linux.kernel.org>; Fri, 29 Aug 2025 20:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756500004; cv=none; b=J+YOYBnAa9SOTRGHVs90HcBDYx2McPb4I2/gknPmy2lqICzrM+1I2fK1Q9kUlUNJQy+7RZ7BZTxrGBYmiro4JfOwuk5y7lMXi4KhHupUHaXjh7zLerNLHS4MPDv4zFLVfV/DW+JfcxSr2c9C+bosmTmkKCxBwJf0lLsp6txcf74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756500004; c=relaxed/simple;
	bh=p3mEMl47t0BVq7+F44069lczbhPD3VfRCV1SsE/YKOM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NAWKmBb3Afjq+KgTAh7b7N0PLI2bQBDU8SxRy68JlVs66QE/bZpM3Me6ps5ry4t9GA05RGoSkKv8t/HCbLuzbjGsY+fk0mlJshxN6+ppxmGQwYpG9s+H33t9ciJ11YuSLsxcVHtY5jN4NlYHfeMSimB39Rd/vK09yRHdQcIB6zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=inamo.no header.i=@inamo.no header.b=Zv9QVmDL; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Os7NRyrS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inamo.no header.i=@inamo.no header.b="Zv9QVmDL";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Os7NRyrS"
Received: by smtp.kernel.org (Postfix)
	id D9B29C4CEF6; Fri, 29 Aug 2025 20:40:03 +0000 (UTC)
Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D26F5C4CEF1
	for <tools@kernel.org>; Fri, 29 Aug 2025 20:40:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D26F5C4CEF1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=inamo.no
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=inamo.no
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id C65451400070;
	Fri, 29 Aug 2025 16:40:01 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Fri, 29 Aug 2025 16:40:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inamo.no; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1756500001;
	 x=1756586401; bh=PMyPkE5UxTE64zN3ZnLyu7yUr+uxC+RRxUSzeit7ufI=; b=
	Zv9QVmDLaZcPOPpijSihVMiTGkhu93g4VMYwyJE1t+GdyfwxXkqi/iyfzOYHura5
	OEwZtJDVUyyPen0MBwbntBTMCEizaRvzoQlpx1Vm30ltvCuG+587+PAd/EE+kKFn
	OEuW2PxB7vYqShFxlaInwYl1Psd4fMjV2Ryq2/CC24WIX9158Idbq5xE4KKa9YGf
	ZV6pjVmsM+eCvFnA+rZtid7k8wroGtvQgsGd6yZXuBq4NUNw+pjZWkcba4F4zve5
	b3iWBQY0xTc/QyO8ClMgXpl++ZAikVknF2FfAkYhxJmmFjLcs1P07POnHzlLucAp
	bVRxBdrSmTbuNGhZuqF27Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1756500001; x=
	1756586401; bh=PMyPkE5UxTE64zN3ZnLyu7yUr+uxC+RRxUSzeit7ufI=; b=O
	s7NRyrSipbQjxTlYwtJqoWnpuZ9393tJnGf724AkIPWnLVpiX7CGNpjlGvcrhtTi
	HZTK1rUosm+0zTsNieu+1P9OGj4qTLYNmHVT7bJ46yiDfCodERR9eKdJPZ8PVyxb
	cx0+S7YEL4exRX+RGHThlz4TAlF9uIm3r3p1WJkvKfEoVyqKQ6IY+8NVn3A9XWOX
	9wAaS0qiX03zcbiHOJLa20I9cMwogWNlaFG30xj3sKBRMs71FCc2RHJ4JP4xVtIm
	z1ANrOenn76Q/AukgfQ+26w4CflMl11zxp/f6aKS2BQ8mZyFnB6+CU7flmUYK30/
	gK7MPbJxgXxK1Z4kJScwA==
X-ME-Sender: <xms:IRCyaMRV5yLwnDCt47yKF9iD0FlXpeeRtB-mr_-1PvQsBs5cF4Nxew>
    <xme:IRCyaDZP0pcs7Ca-_4MaLC0sJq-kEfqj4Wdml7fs9ab6Qg1FNCdOUP6rm0ZbohmMC
    hv6S3vtMjZ0UEbJ4NI>
X-ME-Received: <xmr:IRCyaJ01UCNPVGaZwq_YJws46J8eTx55g70OiYwGGZ59ERA8nRoSK5dmXDLM210W2K6BXl3LW_77voNu4oDQXeNAagux83wE9A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddukeeggeelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpefvrhihghhv
    vgcunfgruhhgshhtpphluceothhrhihgvhhishesihhnrghmohdrnhhoqeenucggtffrrg
    htthgvrhhnpeeftdejfeeivddttdehkeeiffekleehgfffvedtieevledvteduvdekueek
    ieejheenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepthhrhihgvhhishesihhnrghmohdrnhho
    pdhnsggprhgtphhtthhopeefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehtrh
    ihghhvihhssehinhgrmhhordhnohdprhgtphhtthhopehkohhnshhtrghnthhinheslhhi
    nhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehtohholhhssehkvghrnh
    gvlhdrohhrgh
X-ME-Proxy: <xmx:IRCyaDXqi-BKsUqArL0hmtlC5MOxycmcOj8o_bxcGTWCKbMAtqe2Kw>
    <xmx:IRCyaDXapBdYC9ZXbIlKNlFJdSHYim4E0cTyw5I0DdaZ8hhbX_ojRQ>
    <xmx:IRCyaCcCerZfWK3JaIR5ahzXc2JgBZwYVKpmn2sV0pM_F41sBgOvdg>
    <xmx:IRCyaMV1Zyh8W2t_UqbTzsYYrVYxzR2WxMxYLRw2UccIJobZu7n3KQ>
    <xmx:IRCyaGNP4Q_FDKhF-qA67aU6xC4BDeE02xJRyBpEet2u4PEyNI007mFc>
Feedback-ID: i6cf1495c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 29 Aug 2025 16:40:00 -0400 (EDT)
gpg: Signature made fr. 29. aug. 2025 kl. 22.17 +0200 CEST
gpg: using RSA key AF62044EB71DC79B92AFCF661C234B29C91A68CD
gpg: =?utf-8?q?Good_signature_from_=22Trygve_Laugst=C3=B8l_=3Ctrygvis=40i?=
 =?utf-8?q?namo=2Eno=3E=22_=5Bultimate=5D?=
From: =?utf-8?q?Trygve_Laugst=C3=B8l?= <trygvis@inamo.no>
Date: Fri, 29 Aug 2025 22:19:44 +0200
Subject: [PATCH RFC b4 3/3] More flexible HTTP client
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250829-sourcehut-v1-3-8e259603352e@inamo.no>
References: <20250829-sourcehut-v1-0-8e259603352e@inamo.no>
In-Reply-To: <20250829-sourcehut-v1-0-8e259603352e@inamo.no>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 =?utf-8?q?Trygve_Laugst=C3=B8l?= <trygvis@inamo.no>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2013; i=trygvis@inamo.no;
 h=from:subject:message-id;
 bh=p3mEMl47t0BVq7+F44069lczbhPD3VfRCV1SsE/YKOM=;
 b=owEBbQKS/ZANAwAKARwjSynJGmjNAcsmYgBoshAcpl1cijBf2B+I2Gq4nW2GjC317gw4Eox3F
 Caj7PR1VbuJAjMEAAEKAB0WIQSvYgROtx3Hm5Kvz2YcI0spyRpozQUCaLIQHAAKCRAcI0spyRpo
 zScQEACirjMP+O5iCoFLKgdxkwAXdzdTwLWInFzSIPFEOZraq0hBnFnStRHu5cE1opJW3wFFw51
 TqsBgi6SWvR8YENkXDppwAA5lYbsjZ8Sk8s0q+NKl4OZ36nbKjLVtBcCancRO27vRzM7y7FiMjj
 Nj18csD/Xh7ezJnWfC2snK/bms1gHTABHu7WbF8qSV3KmyvOp+NThVPFRqOL+npM77iAaWSF7ol
 GEy0qlGv7P/uthhXTqqD7Hg0GCXnyN9rckQLw0SNHdy9+Jmtbif4/epdI8HQcPNeKHnICknSmsg
 PFgZWu9OCc0J2pXkleDu1wkI7sN1fV7ImyX9bFRQl1BhhJ1uk8+gQWsLr4c0UCyNc1s82IzF7m4
 a7v8Mlg7mMkw28Mh+AEm2S0KOlS5e98MfufUWGYBXm3svXpgws8ObWL95GPjUeVCTmzokRSB5gQ
 gGsM79/tZBTn+ZgsFq9HhavpkGuGeoBaUsut0fmGPDaOnqRP9wKsxVL5m+RxRMYuPWZkCCnY6+A
 y0e17ZY/nrNv5clm8nJINC/IEMy1+4g/pihJxJKnP2v3G9LCADknBhf5Mfx7Tj/O0OeXxURsUeP
 FOww+uAIFOQBw1fUfS9N7E85bjtA6c9Z5TlZZsryWOLojeQ9IpYhLn+gExosoSyT2X+VH45Ul3C
 /L0nkdGQ/E05I5g==
X-Developer-Key: i=trygvis@inamo.no; a=openpgp;
 fpr=AF62044EB71DC79B92AFCF661C234B29C91A68CD

Allow 200 OK responsed for the midmask and use the URL as-is. This allows
support for Sourcehut for b4.

Signed-off-by: Trygve Laugstøl <trygvis@inamo.no>
---
 src/b4/__init__.py | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index 02f4f73..495e83c 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -3539,6 +3539,7 @@ def get_pi_thread_by_msgid(msgid: str, nocache: bool = False,
     # In fact, /all/ naming is arbitrary, but for now we are going to
     # hardcode it to lore.kernel.org settings and maybe make it configurable
     # in the future, if necessary.
+    t_mbx_url = None
     if loc.path.startswith('/all/'):
         projurl = '%s://%s/all' % (loc.scheme, loc.netloc)
     else:
@@ -3547,14 +3548,19 @@ def get_pi_thread_by_msgid(msgid: str, nocache: bool = False,
         logger.info('Looking up %s', midmask)
         session = get_requests_session()
         resp = session.head(midmask)
-        if resp.status_code < 300 or resp.status_code > 400:
+        if resp.status_code != 200 and (resp.status_code < 300 or resp.status_code > 400):
             logger.critical('That message-id is not known.')
             return None
-        # Pop msgid from the end of the redirect
-        chunks = resp.headers['Location'].rstrip('/').split('/')
-        projurl = '/'.join(chunks[:-1])
-        resp.close()
-    t_mbx_url = '%s/%s/t.mbox.gz' % (projurl, qmsgid)
+
+        if resp.status_code == 200:
+            t_mbx_url = midmask
+        else:
+            # Pop msgid from the end of the redirect
+            chunks = resp.headers['Location'].rstrip('/').split('/')
+            projurl = '/'.join(chunks[:-1])
+            resp.close()
+    if t_mbx_url is None:
+        t_mbx_url = '%s/%s/t.mbox.gz' % (projurl, qmsgid)
     logger.debug('t_mbx_url=%s', t_mbx_url)
 
     msgs = get_pi_thread_by_url(t_mbx_url, nocache=nocache)

-- 
2.51.0

