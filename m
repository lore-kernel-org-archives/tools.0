Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBCD018B46E
	for <tools@linux.kernel.org>; Wed, 15 Jan 2025 16:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736958580; cv=none; b=BYhRKhKBw/thJoHS9DcW8YPiY+TsrYUOJNAmH3WhXHVi0rI1cLr3EKQQ/iKC3xbdXYSDadaTTmkKUZf75c1gYnaHiyJ720p4HK9qoM3hsjJkl1Vqb6AzQC5BWFAQaWngIxUn19N0uUqXfWZIrNudpec/Fan7MNSkNiJsB2QZHF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736958580; c=relaxed/simple;
	bh=+RNwHpHV/eq2e55mtHl2xaN+0NqIIWwDRwoEKfDQC08=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=rb4F3T4qWoZ8dasySGwdyX5CMSL35e5yZfruJ4dbhbZY6ngx+t/aIvOyr0dElr/kErpRMGkbIE6iy2m1pCh5KLaOZwztYy8FdYlKaYBD1Mk91BRwQ0j9CCejMjJH5kRBxH9LqiD6+QxvEHXa11jv4iupxHYNJA2Xr0iUpm5xvqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=pks.im header.i=@pks.im header.b=Dp5SWDmG; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Om+zyxtE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pks.im header.i=@pks.im header.b="Dp5SWDmG";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Om+zyxtE"
Received: by smtp.kernel.org (Postfix)
	id 581B2C4CEDF; Wed, 15 Jan 2025 16:29:39 +0000 (UTC)
Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B9A64C4AF0B
	for <tools@kernel.org>; Wed, 15 Jan 2025 16:29:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B9A64C4AF0B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=pks.im
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=pks.im
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id B70CA11400AA;
	Wed, 15 Jan 2025 11:29:36 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Wed, 15 Jan 2025 11:29:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pks.im; h=cc:cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm2; t=1736958576; x=1737044976; bh=IpGuULGfcH
	qt/WMo4r5scjIqHVaLHwtt+0+c51JsQS0=; b=Dp5SWDmG5K76pJSk+kddJRFLG7
	8+N/FHYn4qDWHzAUFKlf5VRSTeY9MEoIfRcK1JahXky6Fl9uI4rdYnUCTJ45X51R
	fEqzHw8wGFIRqkofw2MyW3Rpr+3Ddw+U+o419FikZLCyBQqIBoQSyznxCRNFAM1Z
	T78CdAXf0WQBYnfY1S5qHUG3QLJHraenjt28oWrQ6FGPnYOo8rnpsPg+384MuDWe
	61MITlcofsxRhKINxDs2TQxYQxKVPyT46ZTerL2M1j0Zi1Fc8FMpjETEYzu2h0iG
	7xa15oicNVQ9PenancpjhYVCPfhHY1ni5fO5eew0+vU1SChhjdDxwvZI0VbQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1736958576; x=1737044976; bh=IpGuULGfcHqt/WMo4r5scjIqHVaL
	Hwtt+0+c51JsQS0=; b=Om+zyxtE8SfMrNVwXSWQgsDxbeimItvD1l0PItWKnn7D
	smbgpy/xEv27PibdqSZehnAZe/ZsOm0wQ7DNKpwJEYzGxUZwZND7Owsx/sogieU7
	GW6Hyc4iupR4EcTcyjYoJB14MR9EkWOhvnWRkYpeLfqtwXtFxZVM3/85RJUDSQDH
	0BF3btiFMLZEeL5XjnigQdlBYfb+liKqMkfcSdwM+c4kMu4xlNrU4tZS9lzVIUsB
	lT6KrRAsrLS/N2OD5WPLaHVwSYlzx0Bs9S8BIqJ0bwRmD73D1vTYlho7CzvRaYbu
	pAqZ9F3uh32EOY22jq1Fa+5k32r/04bMxmwEp2iduA==
X-ME-Sender: <xms:cOKHZ3zYURIAsbGs5MZDB5fxmY2TVXy2jUig9nkYs6cAusuUFj_GfA>
    <xme:cOKHZ_SwnreZbbVieAQv5qqKehWGJjZ0S5L0-OzCCKaVk7cb7mGjIa3wXD4-xACak
    WS40FVIKgqXZIQzZw>
X-ME-Received: <xmr:cOKHZxXo3HEdS9UqfOzI_emwEKSATg9hFdiyxyPJVBi1lH2tScCuQ9qV6huAWIV3TL99SFmuKJEy4b4LTP3x8Y6wuFnLMdNxzqL0TtmF7nKgn84>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudehledgieefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephfffufggtgfgkffvvefosehtjeertdertdejnecu
    hfhrohhmpefrrghtrhhitghkucfuthgvihhnhhgrrhguthcuoehpshesphhkshdrihhmqe
    enucggtffrrghtthgvrhhnpeeihfetieegkeeufffhhfdugfelvedtfefgleffleekvefg
    keekudeitdeijeelhfenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphhssehpkhhsrdhimhdp
    nhgspghrtghpthhtohepfedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepthhooh
    hlsheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhonhhsthgrnhhtihhnsehlihhn
    uhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepghhithhsthgvrhesphhosg
    hogidrtghomh
X-ME-Proxy: <xmx:cOKHZxgb0WG62NhWx5HwRTvO8XGur7la5KDQRQCT0uDoxPIQjgcfZg>
    <xmx:cOKHZ5Ddw4p7o4XWWihR4MBSG1iwFkMqqDJuacK2KLUchFWQAjt-VQ>
    <xmx:cOKHZ6JSG7BZRywkdsKjB9Wvw5G_BZnimWVt7pww1BM_b0ADV_Wk2w>
    <xmx:cOKHZ4BM1aMeDCQX3zclnkmvIpRIhwcbY7DlkA3LZkKV4jJemvrrQg>
    <xmx:cOKHZ4Oq6iBzRRdI0JXDO7gG4SVVWQ_wWu1fmU63J0E6L3W76-Pu5Z_B>
Feedback-ID: i197146af:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Jan 2025 11:29:35 -0500 (EST)
Received: 
	by vm-mail (OpenSMTPD) with ESMTPSA id c923b1df (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Wed, 15 Jan 2025 16:29:34 +0000 (UTC)
From: Patrick Steinhardt <ps@pks.im>
Date: Wed, 15 Jan 2025 17:29:32 +0100
Subject: [PATCH b4] b4: stop generating full object IDs for non-binary
 diffs
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250115-b4-pks-no-full-index-v1-1-23a4e8fa83da@pks.im>
X-B4-Tracking: v=1; b=H4sIAGvih2cC/x3MQQqAIBBA0avErBtQyaCuEi2yGWsoLJRCiO6et
 HyL/x9IHIUT9NUDkW9JcoQCXVcwr1NYGIWKwShjldYWXYPnljAc6K99RwnEGS115JVrSRsFJT0
 je8n/dgDXwPi+H6sVrJxqAAAA
X-Change-ID: 20250115-b4-pks-no-full-index-5d9df0b6d120
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Junio C Hamano <gitster@pobox.com>, Patrick Steinhardt <ps@pks.im>
X-Mailer: b4 0.14.2

The patches that are to be sent by b4 get generated via git-show(1).
These patches get generated with `--full-index`, which causes Git to
print the full object ID for the pre- and postimage blobs. This is
somewhat annoying to read and doesn't help in the general case:

  - It does not help in case the recipient doesn't have the necessary
    objects anyway.

  - It is unnecessarily long in order to protect from using the wrong
    object in a fake ancestor tree during a three-way merge.

The use of `--full-index` was added via 23a9ddb (Create patches with
--full-index --binary, 2024-08-27), which had the intent to include
binary diffs in generated patches. As part of that change we started to
pass both `--full-index` and `--binary`. Combining these two flags with
each other is not needed though: passing `--binary` already makes Git
print full object IDs for any binary patches, while keeping abbreviated
object IDs for normal patches.

Drop `--full-index` so that we print short object IDs in general, but
long object IDs for binaries.

Suggested-by: Junio C Hamano <gitster@pobox.com>
Signed-off-by: Patrick Steinhardt <ps@pks.im>
---
As discussed on the Git mailing list at [1].

Patrick

[1]: https://lore.kernel.org/git/xmqqa5bt2jc8.fsf@gitster.g/
---
 src/b4/__init__.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index bb93656..fa3c155 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -3465,7 +3465,6 @@ def git_range_to_patches(gitdir: Optional[str], start: str, end: str,
             [
                 'show',
                 '--format=email',
-                '--full-index',
                 '--binary',
                 '--patch-with-stat',
                 '--encoding=utf-8',

---
base-commit: 1b0d65dfcb498531da131511cab7f14e5845d969
change-id: 20250115-b4-pks-no-full-index-5d9df0b6d120

