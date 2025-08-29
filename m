Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A5126AA98
	for <tools@linux.kernel.org>; Fri, 29 Aug 2025 20:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756500000; cv=none; b=WVcfOeBIVyCVarRZKKIvsCwFXcjYYc8iZklN2gfsIOZxfkkljQ7VEZnw17ZlkdQvhSvWCX76Z5uMi1xdDx2qK2W9JCrj5Ssvt0We60D7wmMsL471fDr7TqZkzyYma1fNg7l2St2XCUm5ZptQhNPZTYtYeAI3JKuj5l2BwxTsuuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756500000; c=relaxed/simple;
	bh=dl2dzRvkJBI4tj7Plh+6Jiutguqca9TuJUqv8BtIikA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=iVRWfgptymTZrS8dBiSlwI7xJye+q6p3Zw6pOsfNcUaMGbyjk9Vk2Weeb5SWbOQKlx6+mjZr+8SW4fgD9GLoXLKm29Qsy+e5tN51qQBo3AFtymjX172iv6eVjheHBb+7kuJ1+rvQxcV/v8z7DNuioZNLT3hlhYUwSIeHOh33Cfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=inamo.no header.i=@inamo.no header.b=Q+9V44Zt; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=VhTr8uLI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inamo.no header.i=@inamo.no header.b="Q+9V44Zt";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="VhTr8uLI"
Received: by smtp.kernel.org (Postfix)
	id 65D09C4CEF7; Fri, 29 Aug 2025 20:40:00 +0000 (UTC)
Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AF114C4CEF0
	for <tools@kernel.org>; Fri, 29 Aug 2025 20:39:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AF114C4CEF0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=inamo.no
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=inamo.no
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id ADC86EC03D3;
	Fri, 29 Aug 2025 16:39:57 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Fri, 29 Aug 2025 16:39:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inamo.no; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1756499997; x=1756586397; bh=iy
	esdz3exM/1mDWaojX7ENji8KWOpjqrZE5IxFtu+GM=; b=Q+9V44ZtHgh5CZ21q4
	2tacx1rqG3MenlCdT6K1K109lJWlTdlzeymqbt5Y0TPy86X7+3erFryKrRs9WgMp
	j8ChQX2vJmDZZauB9CiTP3y7MZDZgd1a05NN5ZGrXsfk3VP0L2EnwRTF8IRvq+zH
	GdlQxZSvvHMLdtxFbXVSEE/DKWXRIxzmn6ZghWzCNwpqMGrL1MVv19HgElpGHY/k
	NGvG7Xqy8gnYR9CDUO5SiAh1Gy48H+kcDiwvu6Y46/QE1LFHFdg1t/kEw/D6XmUM
	fM1QPl3nyyX6uPPz1uqwfmV2A34cJ8vB12FcBUhRaELC6CkqSmzWP6vijPG4BE8m
	g81g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1756499997; x=1756586397; bh=iyesdz3exM/1mDWaojX7ENji8KWO
	pjqrZE5IxFtu+GM=; b=VhTr8uLI6x3uE6eiy+e8Ulni4mThVVfbEwYiJQf2AZIr
	wdEN0s15/pfwfDYO8zU67EYRhVUQGHvTrgw+q2lAS1H0REB/cfxqcT/+aW/i4Oto
	PdSAHDVTSamxlzzf4huV078ZwmNc7QqxPFNrmACjUeame1I7gJOCVuODDlECc1/s
	DmoPkeArYHFzNZc6ET4z1jD2Z7eCLLbsyWpScnPMXjxmNv/O9hHHXBfd3EGxmSo+
	gSkP3ajOVHRItNO4dsnSUGLM+GsnTAaGSCD0t+GQRyuCg3KiVbGFKrirBOnUY3LJ
	hppE5XiWbbzXlG86KV1CHWcSWu3GGpD5gw/TjY/6UA==
X-ME-Sender: <xms:HRCyaINl9CBpkFD8LDFCvuTovmxSxLwtzuekpZi87-bkBpTQzfCrMg>
    <xme:HRCyaImdm6X-u6pip_Q9cJwaobBwuQHxsWJoH8sCgvflsWQbYskPbtMxQxCMqBSnz
    62cVNSOkadlACuVsck>
X-ME-Received: <xmr:HRCyaPQg6Qx6k9zLMw785ePbUneNdclxUg3w_l9x0hhEqaKfEs7ApTTkNP1A_snW4xA6GCnTiZP6uZgQqt79gMjUWJwOfs3QuQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddukeeggeelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffufffkgggtgffvvefosehtkeertdertdejnecuhfhrohhmpefvrhihghhvvgcu
    nfgruhhgshhtpphluceothhrhihgvhhishesihhnrghmohdrnhhoqeenucggtffrrghtth
    gvrhhnpeekjeetveefgfevgfejffdugfdvleduveegtddvfeejleevheffhfevffevteeh
    ieenucffohhmrghinhepshhrrdhhthdphhhtthhptghlihgvnhhtshhrtggsgegppghinh
    hithgppgdrphihnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomhepthhrhihgvhhishesihhnrghmohdrnhhopdhnsggprhgtphhtthhopeefpdhmoh
    guvgepshhmthhpohhuthdprhgtphhtthhopehtrhihghhvihhssehinhgrmhhordhnohdp
    rhgtphhtthhopehkohhnshhtrghnthhinheslhhinhhugihfohhunhgurghtihhonhdroh
    hrghdprhgtphhtthhopehtohholhhssehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:HRCyaEBITCD8L4qSRNVoDTd6fb7oD7XHWSkV2ylqcZ91x8ZczYQOBg>
    <xmx:HRCyaOTGLk31sZSnmTIPbxh5AhF3GFDiYsxwb4cg8kP6sca8TsxWbA>
    <xmx:HRCyaKoCLWBclpNyWQIIbsQ3gH1CZSJ1_7Ksb5xXCi274ssIzyvnDQ>
    <xmx:HRCyaIxf2E7rNH4IE_ly3jh0LLkJ2S5TzhWKSLzBb57GlVriRzPpEw>
    <xmx:HRCyaLnxfxlCc687SOMT6r6Nt1l3iYWdpG7fEOlAxOzdgLpUUUo69i3T>
Feedback-ID: i6cf1495c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 29 Aug 2025 16:39:56 -0400 (EDT)
From: =?utf-8?q?Trygve_Laugst=C3=B8l?= <trygvis@inamo.no>
Subject: [PATCH RFC b4 0/3] Support for other public inbox forges
Date: Fri, 29 Aug 2025 22:19:41 +0200
Message-Id: <20250829-sourcehut-v1-0-8e259603352e@inamo.no>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAF0LsmgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDCyML3eL80qLk1IzSEt0Uy8QU8yTTpDRTQ0sloPqCotS0zAqwWdFKQW7
 OILEkE6XY2loA+5ViZGYAAAA=
X-Change-ID: 20250828-sourcehut-d9ad7b5bf519
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 =?utf-8?q?Trygve_Laugst=C3=B8l?= <trygvis@inamo.no>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1501; i=trygvis@inamo.no;
 h=from:subject:message-id;
 bh=dl2dzRvkJBI4tj7Plh+6Jiutguqca9TuJUqv8BtIikA=;
 b=owEBbQKS/ZANAwAKARwjSynJGmjNAcsmYgBoshAbj+ZLqXSq7LQYeGCwiXfTu1NxCjtwHxv+I
 P1LROA/32iJAjMEAAEKAB0WIQSvYgROtx3Hm5Kvz2YcI0spyRpozQUCaLIQGwAKCRAcI0spyRpo
 zZxLEACrYPc/dLHr09+7NDWe9MWYHm2PSJ3hjEoMq5zfpohrp77nWuDrZ7BTqZIGa+WF1/mxrGa
 RCUUiToLShfOqa73lDsAZmA6kpHHDSvLYeSou6mqqCDDZcjaDvz7/srbApUEQRq94VBLLOziags
 xJLh000UPCz+35XM4gWQmWjdHcuAA2vyDAFvfhVpI/6FHa0p9NvWmNMwHFvuqduzBs3ehtsdtA5
 jfuP1iXUyCUpJF/bbJXN4FQJ6BIkNBkgSwQMDtqqda/aV10idR4MWM7dDx4qO4aNJEbvKjfRvKs
 bpiS3x1frSi9UIUFacmrnl5pTYdsfQRJ2THr2m6LOefaPsiJyKjfveHhiTYuuRoWwCb+8JVzkKE
 12jXufp5OVJ+gXi/Z36Rfql8rOTa+kTpFtnGrfKu/gvTDvmMItmjXbsqWm0PjValIRj3QecKiPc
 zHmPMRBX04bu6Y85H/TBIFT9RumaEt4tDCJ1JagNwG3gzCfZSywDNwq/gsWRE2HF53VU7oK8Jt7
 PHU0yT0wofSYgCfieimKsDvjIz3KdvjojCH0KEzULVentuqp0TCUFLt/JCcHLk+EaJaus97ZIuu
 9R2BoxvTUFzoQYyqClbk2BbpKXPIwRry/b+4Y+Q7lvNQRpk9YfpDACFmr8PmKML/SDb80zc/4ks
 IGihOw8oGSunF/A==
X-Developer-Key: i=trygvis@inamo.no; a=openpgp;
 fpr=AF62044EB71DC79B92AFCF661C234B29C91A68CD

I really like b4, but would like to use it against Sourcehut. Sourcehut has the
same "public inbox", email driven cooperation that public-inbox.org fronts.

This series adds support for other forges that support public-inbox like
email interfaces, Sourcehut in particular. I'm submitting this with the hope to
get acceptance on the concept and feedback on the particular implementation.

With this change users of Sourcehut can use b4 am/shazam with this
config:

[b4]
	midmask = https://lists.sr.ht/~trygvis/testing123/%%3c%s%%3e/mbox
	linkmask = https://lists.sr.ht/~trygvis/testing123/%%3c%s%%3e

Sourcehut uses mbox URLs on the form

    https://lists.sr.ht/~user/list/<mid>/mbox

leading to slightly hard to read quoting.

Sourcehut doesn't suppor searching mailboxes by patch-id, but I'll work there if
there is interrest on the b4 side at for support other forges than public-inbox.

I will update the documentation once this series is evolved a little bit more.

Signed-off-by: Trygve Laugstøl <trygvis@inamo.no>
---
Trygve Laugstøl (3):
      debug: Add logging for requests
      Use decompress on compressed data only.
      More flexible HTTP client

 src/b4/__init__.py | 29 +++++++++++++++++++++--------
 src/b4/command.py  |  5 +++++
 2 files changed, 26 insertions(+), 8 deletions(-)
---
base-commit: 50721cdd62ee283ac573e596a499f24aafee5b16
change-id: 20250828-sourcehut-d9ad7b5bf519

Best regards,
--  
Trygve Laugstøl <trygvis@inamo.no>

