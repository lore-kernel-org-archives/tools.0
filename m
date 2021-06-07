Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 269DB70
	for <tools@linux.kernel.org>; Mon,  7 Jun 2021 10:02:57 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 68ECA1982;
	Mon,  7 Jun 2021 06:02:56 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Mon, 07 Jun 2021 06:02:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=fm1; bh=f6/u/in/AVOCB8Q1MGV7SzT+SM
	NVjw8GUtcFDpPCKMA=; b=NCZVoYXZggVSVv6uEfoKYyBuvd51pAISR61ELVTNsh
	vhBhuz5gGSsNuLYow6Si5ff2F6rFgn0sXxueJJGJrDQeugQVbF8sNPmkfv4yZRkO
	6H2j6a5SeRJhJ7rEDMOF62+tO7rTUynuaUkXqf40NKYEzKtJr94fSF/pA0KTPD6q
	Vo+eHwystBs6L7vc40BBeh7xkcLGqk7/DAnrEncwjE35pH2p95pQRyrELUoDSZ5m
	W/8BrYw7bi4TA6ubGIE5h99x/hdqVJA+vAFNXM3ttA8ppsXu7VuIWWYb4ckBNX0h
	XdXnoA5Of8yzrMMhKRD7wOiZhCrB2uHHRbX+IAs9LOiA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=f6/u/in/AVOCB8Q1M
	GV7SzT+SMNVjw8GUtcFDpPCKMA=; b=BbgtDUJR0sdXB75Oy3f/XbZLCysoq5EqR
	EsICMFRXMipPLJIlt5GLETrysMSaWfoC/qGH1/qmC0dIbRevkXmiz9ccsoa/w5vI
	vwC8ul2oFXa2ESJ5WDp2MX4AZHGfZ/+vNXXTWU7ZZ6d999Hqfp2ffOjX6ubAGIvy
	8fzuzqr5bLZPME5es1nbTu/FjGCH5mKwrdD7ndVMz460cBIEjswE/8/w4ZLDQhcS
	D2IFq/eTBtW0sjXOJ80kbk3o9mMxeoebwBB4WbFlScf0fbPcd4D2yMtJfTTg+Xw3
	tf39F+GEZgQdflkz4czgmlTp06EpP7x7Ur9EJ+CNQswksZQUwLofw==
X-ME-Sender: <xms:z-69YDbcWMl2RcaN1EsmthqKYCmIU8DVjv3L3oLuaJ3miOCxY5Io1A>
    <xme:z-69YCZjbK4zvxreLv-yOmWUYQvhCObjVNL9a37S43M39fiVk84shzYPMkoO6uPvu
    BEjxzoN8EArju8XR7U>
X-ME-Received: <xmr:z-69YF-zoveXl-dZar69siunVU57uyHR_LFaKoDMFZFDwsUcuOinQr5vfHb-i-KKbBLLMq_5Hfyt7BsVAVQ8_pGH7ti7E0nCzZy6ajSqshjfKhxo4DdI_wMlD1Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedtjedgvddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefrrghulhcuuegr
    rhhkvghruceophgruhhlsehpsggrrhhkvghrrdguvghvqeenucggtffrrghtthgvrhhnpe
    elvdelvefhheefjeekffekieekueevieeitdffueffleefffeglefhteevieegffenucff
    ohhmrghinhepohhpvghnphhgphdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehprghulhesphgsrghrkhgvrhdruggvvh
X-ME-Proxy: <xmx:z-69YJol5Z-eG5wop5LIxOdRvQVVgx5zcNSOXPPvUH-A5n0iaq6dpw>
    <xmx:z-69YOoilWZ1I-VG_M8PGH-c3OQIzaCcXqbqMzwsUbmpvBXVkm-p1A>
    <xmx:z-69YPS1fEcrF9ueBJYm3sI8uwLtdRL-LCdrsffsLR7HqBzA2u1fnQ>
    <xmx:0O69YDCKfR-gWJ-z9M45looGBHO2oK6A3U2XBa8iGspxSlqmjkF6ew>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Jun 2021 06:02:54 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
To: tools@linux.kernel.org,
	Konstantin Ryabitsev <konstantin.ryabitsev@linux.dev>
Cc: Paul Barker <paul@pbarker.dev>
Subject: [b4][PATCH 0/2] Improvements to DKIM signature verification
Date: Mon,  7 Jun 2021 11:02:50 +0100
Message-Id: <20210607100252.8253-1-paul@pbarker.dev>
X-Mailer: git-send-email 2.31.1
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=767; h=from:subject; bh=iiEtwVutY0OQdC2PIJbe7an8FtJz4cXm1jW/Hv/CYlE=; b=owGbwMvMwCG2OjnkzdxdX/IYT6slMSTsfXfSz3JamC1/9kSO2RXbX8Rs6WGXj1nhFL8r6qHIrwWn hd1YO0pZGMQ4GGTFFFk293y9/7TXkTcj5JYCzBxWJpAhDFycAjAR5jqGX8yG24781Nu/gs3TY/NMZ6 fsr4kPPa6cOPtHnW27j+bz9/cZ/lf2XzRS4iiqnyjUuO6TnI3H7tIA/l/mczg/mOWnMx33YAQA
X-Developer-Key: i=paul@pbarker.dev; a=openpgp; fpr=98B2AAC100AC3F82BB5D546774975C81B7E66BAC
Content-Transfer-Encoding: 8bit

Testing 'b4 am' with patches sent via Office 365 to lists.sr.ht showed
the same issues I found with patatt in handling re-encoded headers. So
there's a patch here to fix this and a patch to improve the ability to
investigate DKIM verification failures with debug output.

NOTE: The attestation key on these patch emails is different to the one
I used on previous patches - I've generated a new key so I've got
separate identities for 'work' and 'personal' hats. You may need to
referesh keys from keys.openpgp.org.

Paul Barker (2):
  Handle MIME encoded-word in DKIM-Signature headers
  Include dkim log output when -d/--debug argument is passed

 b4/__init__.py | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

-- 
2.31.1

