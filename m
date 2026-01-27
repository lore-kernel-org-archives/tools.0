Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE392222AA
	for <tools@linux.kernel.org>; Tue, 27 Jan 2026 18:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769537920; cv=none; b=JEWaKnZNdqBusEPuIae6m/8l24x5SK73T+GD+nbpQutyKPM+X+U3Q5MkIepNaVk0mt/bChmA/Kit3xpiHDTcOgxViALIhNJ76ua/SBN61XSEYeyp3wFpAVQOlSmJYEia1o0YfF69SzeLvD/QyZ+8/YWVEWydmp+FwY3sVVdDWCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769537920; c=relaxed/simple;
	bh=RuuufkEdZOP4rBOYWAay6DOv/JRYSyRSjknMksC6bxE=;
	h=MIME-Version:Date:From:To:Message-Id:Subject:Content-Type; b=AKF5D41WJgAuWP1LK7qpdByHxWXnp2s4VCZZ+s1jAbi0/vRfMVC73eITf5luc4FxGsrxfEQys00f1YFYcAt1gJLH5ZwzS5UwK5510iVkyHWjiUsB8+Kp9h5SNC2g3GpCNONCjwuKe5GrDaqVNpUFdV8y9y5D4LC8QGQMLz7iZxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tjvkqIkP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tjvkqIkP"
Received: by smtp.kernel.org (Postfix)
	id 3FB57C116C6; Tue, 27 Jan 2026 18:18:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1131FC16AAE
	for <tools@kernel.org>; Tue, 27 Jan 2026 18:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769537920;
	bh=RuuufkEdZOP4rBOYWAay6DOv/JRYSyRSjknMksC6bxE=;
	h=Date:From:To:Subject:From;
	b=tjvkqIkPyDg3wW0ekAPYljsByVyuXWwvp7QQBzE4x8qv/W6Cw6EZlkLNte0nRY5ol
	 RHV7q95QmExKF1vtX+C/IL4I8/qwD4mkmTWGLL3nML5Bmsl+gwzTBGtbAZd0W3Lfqy
	 mwHHKEzsuAC83j/0yvIz8Rqo5ej4J2/zI8/LZEamqlqG7x2LdVHPrh70CLqJH8OP62
	 BXeOv+9LyffpACZgoaxuyiQ1JMx5e+5JX5etFCHdJealVnA/i+J15dixlC+1ntedp0
	 o9UaZ88WFUjwcC9pFua750gQ1RwnlBvFf5W6iAX50Glxq2xXc0xSAEGgTT6Gd3ZRcn
	 M6080ylnjw7nw==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id E0069F4007B
	for <tools@kernel.org>; Tue, 27 Jan 2026 13:18:38 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-01.internal (MEProxy); Tue, 27 Jan 2026 13:18:38 -0500
X-ME-Sender: <xms:fgF5aeASF3t8K48QdpPIOyEqs2kHCfSxBC2txF68m2oBfofyPeXeuQ>
    <xme:fgF5aTUd16Xhw054B-wODt6s90tAmLlAeeJa_RcQObhWUlAjnJQJ1fIFesoXq9fYF
    c9gtWzDv6MtfyVQ9A0F-1r74eZx_jt_F5gJDk09RglvESuwoh0Q8aA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduieduudelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefoggffhffvkffutgfgsehtjeertdertd
    dtnecuhfhrohhmpedftehrugcuuehivghshhgvuhhvvghlfdcuoegrrhgusgeskhgvrhhn
    vghlrdhorhhgqeenucggtffrrghtthgvrhhnpedvieehudeuvdegvdeukeduteehvdfhfe
    evheduveegleffgfeuiefgiedtgeefieenucevlhhushhtvghrufhiiigvpedtnecurfgr
    rhgrmhepmhgrihhlfhhrohhmpegrrhguodhmvghsmhhtphgruhhthhhpvghrshhonhgrlh
    hithihqdduieejtdehtddtjeelqdeffedvudeigeduhedqrghruggspeepkhgvrhhnvghl
    rdhorhhgseifohhrkhhofhgrrhgurdgtohhmpdhnsggprhgtphhtthhopedupdhmohguvg
    epshhmthhpohhuthdprhgtphhtthhopehtohholhhssehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:fgF5aflZcPnXn7eAsCfhPOu21Yg3110BqX4FHWjFr0a_rd5L4PUuKw>
    <xmx:fgF5aZwZ2Kt0zG6FBBnTLdrPIhXShnWOr7GEXJEEKk3CHzYF_KRNaQ>
    <xmx:fgF5abR697E4wHLaNR4-AWUMSBeqSfAXPiugEoERwRP6dJqf8w1Ypw>
    <xmx:fgF5act3Ar2-56kd2RZY1--FqLcGnF0Bei571JNaPJ4cy0izqao4dg>
    <xmx:fgF5adtY9ssUej6XBGxCtrLSPnMUOGXKX8jXSziOHFUrIEvg12yhJ7gW>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id C3623700065; Tue, 27 Jan 2026 13:18:38 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Date: Tue, 27 Jan 2026 19:18:18 +0100
From: "Ard Biesheuvel" <ardb@kernel.org>
To: tools@kernel.org
Message-Id: <26435143-82c8-452b-a06c-e47de6772802@app.fastmail.com>
Subject: korgalore delivering duplicates
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

L.S.,

First of all, thanks for the work on korgalore - it is an awesome tool and it is already making my [work] life better.

As discussed on #kernel IRC, I am seeing some issues in combination with fastmail. I am using my @kernel.org as the email address in fastmail, using kernel.org for outgoing SMTP and an alias to ard@workofard.com for incoming email.

I am seeing duplicate messages in 2 cases:

- messages received directly that are also pulled by korgalore, potentially multiple times if they were cross-posted to multiple mailing lists;
- outgoing messages that are cc'ed to multiple mailing lists, which are then looped back and delivered by korgalore in the same manner.

Happy to test/play around/do whatever else could be helpful in finding a way to work around this. Thanks a lot.

