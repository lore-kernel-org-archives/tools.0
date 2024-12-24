Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B331990CE
	for <tools@linux.kernel.org>; Tue, 24 Dec 2024 13:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735045610; cv=none; b=TAdNswNqWjpqIzEMfyzDzR3I8IKfltq+myTSnsXttJlcLLECowJKuz86gEwJYTCfYo1jvnzq1vF3dDLVbHv/hEJawXAFuqFpk3Tdcf/NS76z7fr4Zh1nXu+MvYHsWIV1Rs1Dv2AnJ5phpKKFHqwQCvlFrCK8n1CjuCVNrOQKRdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735045610; c=relaxed/simple;
	bh=F6/swV7hN7UjzlyrkF2lRhIAs3pKIdukOx4wjtZDmAM=;
	h=MIME-Version:Date:From:To:Message-Id:Subject:Content-Type; b=na8dnGfxu69njbAch7F/s1YFoUqh6NTK34QAwJ7NB5LjKKUvNHj3zsYgtJJuY3OyoyFntYJW7udU/pQNLGxrRNqOZsZmhdscXCCnVEVv6+SkA6BexN4lE04iYcizN4AbvRdX/J3Zjwy8D7G3QNhpxNeS8rDu174fwON4PvFh1bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=UNkjtMh0; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=JnqBXAcN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="UNkjtMh0";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="JnqBXAcN"
Received: by smtp.kernel.org (Postfix)
	id A79D2C4CED4; Tue, 24 Dec 2024 13:06:49 +0000 (UTC)
Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DC91BC4CED0
	for <tools@kernel.org>; Tue, 24 Dec 2024 13:06:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DC91BC4CED0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfout.stl.internal (Postfix) with ESMTP id 05E8F1140120
	for <tools@kernel.org>; Tue, 24 Dec 2024 08:06:46 -0500 (EST)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-09.internal (MEProxy); Tue, 24 Dec 2024 08:06:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm3; t=1735045606; x=1735132006; bh=iTj/NZ4S/o
	kikPuE1CfwRnzRAIvNFJTtQo7R0nu/yG8=; b=UNkjtMh0h2hrF/YEpwCOuw6j9E
	vhl2RTtSORJfsgFZXeEWXh8OfQ4h/nXleV0vOLfqjkhGxbwxngo5ysLrVDZUJrp/
	L4CKaTsN1TTE2SCuk4Xn6ZcbxJVGdTnP0Aj0DUbP9mHM5OzeJ7nZ9eavMi3pICDD
	ANQoDNLlS5F142gvnPnnK5yeBzll8NkfX6zzEZMC2LDovEha/7c5x3ovT/JRq1sx
	7nHeDEb8nZtFuAQvo/qLU9SJaEBrovn8yxydN0ebgYe/igDIV0FF5V7UT80DPBKF
	pQrgi7xb4OhT8RKEX3nNOwRo9pEv3u8WO+LIAFR4GT91QWcZmkdXzkGRX/tg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1735045606; x=1735132006; bh=iTj/NZ4S/okikPuE1CfwRnzRAIvNFJTtQo7
	R0nu/yG8=; b=JnqBXAcNEvVWCEABsoldHLFYRkwOwiM5HD4wYv6xkanIWboGfUb
	AW7l+VdzMD48MGE5vjTysoIfh7S4HiSW4RrLWqAdVSv6XTsjLEDfUIfV6X1Hmb8W
	IyGP15HyhkNL3U26QHkuLeYObqvHamxUAOhI6S7vo3+UIWv1KcT3lHXWdQ3G2Cbi
	F6C2IP7g0qtNY3QfzhtFhLrptEik0OJYTBLplXfszzqo0aAD4bJEh6IMFZ4YR1IL
	pXlWSblF46Ki3uVJU7TZF4ule2ryzQABh6NUfvgxAGQyLO3OWHG2Kyk4mwkAaSL6
	lJY7X6g/Hjy7/NvBPYZvAuJmOJIINnuS8hg==
X-ME-Sender: <xms:5rFqZ7e8Doo0e0lqolGpwrOj3hdhpKoxBqoitdAX0PdJhGMOx1c_3A>
    <xme:5rFqZxPgfPh-XJmeQjp-06_M1wN3LThIrnaA3ioaSUt8Acg7nam8k5j5UfC_KRfca
    FJ1SKGH9QPpLfZ94xM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddruddugedggeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpefoggffhf
    fvkffutgfgsehtjeertdertddtnecuhfhrohhmpedflfhirgiguhhnucgjrghnghdfuceo
    jhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnh
    eptdegheehkeekvdetjeetheeigffhtefgtdejkeevjedvvddtgffhffdujedvgeffnecu
    ffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgt
    ohhmpdhnsggprhgtphhtthhopedupdhmohguvgepshhmthhpohhuthdprhgtphhtthhope
    htohholhhssehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:5rFqZ0jSYAFe5p5kPJcbR-j-nSadISzsExA0cp1mwp-oQeKteBJZcQ>
    <xmx:5rFqZ8-kaSJgvGVV0uaJjPOb1xjPzbppjRUGFA_RErQu3e_OAbDI6w>
    <xmx:5rFqZ3vqJD5uZvjM_DN1wYutIK8ILLvm-F9TYEHghT_7jPris6NfgA>
    <xmx:5rFqZ7H0rPRzPkQ82Ei6iueODld7QyWVQ0G7Xis69mcJ0xIo6cjZRA>
    <xmx:5rFqZ13wypR0TQTa_RIHZOFg63QsCuPGnuiIlBJMS5F30t42xRfiBFz3>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 9F2091C20066; Tue, 24 Dec 2024 08:06:46 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Date: Tue, 24 Dec 2024 13:06:27 +0000
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: tools@kernel.org
Message-Id: <af457861-6d07-451a-a4a3-9f52062f95b4@app.fastmail.com>
Subject: b4: Should send-series-to supress send-auto-to-cmd?
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi all,

This is a question (or possibly bug) raised from QEMU's .b4-config [1].

In QEMU's workflow, we have a fixed To point to the main mailing list, while
Cc is gathered from get_maintainers.pl.

However, at least in b4 0.14.2 specifying send-series-to won't suppress send-auto-to-cmd.
In such .b4-config configuration:

```
[b4]
    send-series-to = qemu-devel@nongnu.org
    send-auto-cc-cmd = scripts/get_maintainer.pl --noroles --norolestats --nogit --nogit-fallback
```

b4 prep -c will still cause default send-auto-to-cmd to run
```
$ b4 prep -c
Will collect To: addresses using get_maintainer.pl
Will collect Cc: addresses using get_maintainer.pl
Collecting To/Cc addresses
CRITICAL: Running /[...]/qemu/scripts/get_maintainer.pl --nogit --nogit-fallback --nogit-chief-penguins --norolestats --nol failed:
Unknown option: nogit-chief-penguins
/[...]/qemu/scripts/get_maintainer.pl: invalid argument - use --help if necessary
```

My current workaround is to specify a dummy send-auto-to-cmd (i.e. echo).

I wonder if it is an expected behaviour?

Thanks

[1]: https://lore.kernel.org/qemu-devel/20241223-swift-of-splendid-protection-b5dcac@lemur/
- Jiaxun
