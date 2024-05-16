Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B106626AD0
	for <tools@linux.kernel.org>; Thu, 16 May 2024 11:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715860202; cv=none; b=fcLNcF0lPs2ExJM1trAmDY6kXOS1veE+kzfOSFjiEmuiVqqlRsTzbXUR7k56c/xyxBnMQF2CvmMyaHKoyZM0asqYFeysjWptKCBGGQdTXyMdtRXaOC1duZupCRa3Ck9uaodkQq5iHRxPtB409OwPlJMFbyC0/23PKAaU9/L28Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715860202; c=relaxed/simple;
	bh=kp63TwmDmP7dIXqXAYFfGrnXUK70zSboUC+YTUI5I5c=;
	h=MIME-Version:Message-Id:Date:From:To:Cc:Subject:Content-Type; b=exWiufq84TB0s9aHsEtjHk67DtJUUaqHYizUygj5SAhSbt0dVsafdEVI7QVSeisYVwj56D1A9XgKx/Pm/c5TxDJFjJaEZ23qstfKj4GUYiLk1d4Sa1e+z6mtzFxfVVXx5W81WT9K3026/pksBDMV4UaMzmeqS4Hbtky6PuO7TyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=gKBIZSb2; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=FLRPArIC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="gKBIZSb2";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="FLRPArIC"
Received: by smtp.kernel.org (Postfix)
	id 68430C2BD11; Thu, 16 May 2024 11:50:02 +0000 (UTC)
Received: from fhigh4-smtp.messagingengine.com (fhigh4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 541FFC113CC
	for <tools@kernel.org>; Thu, 16 May 2024 11:50:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 541FFC113CC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 450781140188;
	Thu, 16 May 2024 07:50:00 -0400 (EDT)
Received: from imap44 ([10.202.2.94])
  by compute3.internal (MEProxy); Thu, 16 May 2024 07:50:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm1;
	 t=1715860200; x=1715946600; bh=kp63TwmDmP7dIXqXAYFfGrnXUK70zSbo
	UC+YTUI5I5c=; b=gKBIZSb2rZsaFmUXirs1YgN1Mo22W9kmt57j3nEqY4lrspxr
	/QkWGYfQjsIeDEMG5s/653f5+mmtsDcygs5gj2xcAut9tqDlVMoQ1uqWhpLnBHuH
	RK1CWJgCaeLUjlak4E1HDpzaS1lIWi/MA4jn6M+5KVC6a0RaAnXVh2wCfmlEZ8tn
	z7tF2ApSOrpS+bTXz+z/adot583i9x6c70BkUNu2YyhBfYXAOK9dfFF/SBCBjlT7
	Dv7/PImnSLPTsvgbsoWjtTODhUIoLfRqDpjAmQbt2RmR/uK5OXsXQStlS8eFbgwH
	iTkFDRW5PI0vWzYJBGIGZMFMrjm81oVClvBlmA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1715860200; x=1715946600; bh=kp63TwmDmP7dIXqXAYFfGrnXUK70zSboUC+
	YTUI5I5c=; b=FLRPArICSL0G+Fx1DFiGGlI8rv1/d+sIQE/ZuUuyCkpA5bDxdoR
	rVsXYUqHpd3oJfHO5Nb3bokClx2D8Orsiwn8VvFAgjGCIsLjFT/JuuOB+JEYwxoC
	6jMADizkIYKJNHASXRrAFCrUWgoWiY7qQmJUpOgBnVJvn4kfId+YF2s7YeqRlrqv
	ESJCY+kdZ58s4jTh/V7lF3J4r0EPuHedctNo6g05S/bm8HCZOJZDp6rjgAXj64/X
	zxy8lvLmOfo+5DzhVlVg7l/+64YzHItmwXLAvPM6OdypavkyQ0GXVdadetgJXNzs
	kBl9sU315DxGbNzzBVDPGU8xzWXMos6cAdg==
X-ME-Sender: <xms:6PJFZsBAEa-ILdtvuHIpy0EgiN6HovQDrSWoJDr-BpdHbHYmvs1p-Q>
    <xme:6PJFZugte4MJXmubSjnujpNFeJda1vpXYRajEduE0rRzLQpqg9atZ43GTuo31s9VW
    tLA2d1k4cP8cz2RzzU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdehuddggeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfffhffvvefutgesthdtre
    dtreertdenucfhrhhomhepfdflihgrgihunhcujggrnhhgfdcuoehjihgrgihunhdrhigr
    nhhgsehflhihghhorghtrdgtohhmqeenucggtffrrghtthgvrhhnpeeuhfdvheehgeduue
    etfeevjedtveelvdelhfeuhffffffgheevgeffgeeluefhgfenucevlhhushhtvghrufhi
    iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflh
    ihghhorghtrdgtohhm
X-ME-Proxy: <xmx:6PJFZvlT8R_xWacZg-IHU7hQtNis04ob4BW9z631BwZvwkfCT0V7lA>
    <xmx:6PJFZizjoQf9bM4lJnMQQtj7ANwF6T6zHw29uPYZkWJJHQcGDw7gPg>
    <xmx:6PJFZhQG24Jy_HbaF_aj25WlHyr-8O7r3BLZ5oLAHL3NXuxjlETfhw>
    <xmx:6PJFZtYqDvKxMcZB8qKxUxMTbacwP9AUQ28frbzbavQcDNAjmYt8rQ>
    <xmx:6PJFZgKoqcwnadOSg7RBenXz_vth2bvywMKkcU0Xs4R1OtFJylaowejt>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id F373D36A0075; Thu, 16 May 2024 07:49:59 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-456-gcd147058c-fm-hotfix-20240509.001-g0aad06e4
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Message-Id: <b483c569-66b1-4a4c-913f-3b60ebcd1743@app.fastmail.com>
Date: Thu, 16 May 2024 12:47:45 +0100
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: tools@kernel.org
Cc: konstantin@linuxfoundation.org
Subject: b4 one key git rebase -i
Content-Type: text/plain

Hi folks,

As a contribution oriented user of b4 I found in numerous occasions I have
to do git rebase -i on my whole series.

Memorizing the base commit of a series is painful when you have multiple on
going series based on linux-next from different dates. I have to check git log
many times a day to confirm base of b4 managed branches.

Is it possible for b4 to have a one key git rebase -i to whole series feature?
Or at least have a command to output base commit hash, so I can make an alias for
that on my own. I think that would streamline my daily routines a lot :-)

Thanks
- Jiaxun
