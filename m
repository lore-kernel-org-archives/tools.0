Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29F23C141A
	for <tools@linux.kernel.org>; Tue, 15 Sep 2026 20:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789502584; cv=pass; b=R396OJPjdI6IAmu6ozjzdkE4u9/3qW56d+5qd4O1AsCMeOZalGprrCkfmdwW9PhdHsslDARTxrz5sJOjoOo05v6U0DDP7aQvoPYjJrcnNbTaHzodHmX7IO5fa6IVO2f4fHz1psgjC0fVZvMJ3wzsWJigsJC5VNbIipA75AH69tE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789502584; c=relaxed/simple;
	bh=7Og8CtagXrOTOjH2n+FsmiVpX/Yj6CfIODyv4YPveb0=;
	h=Message-ID:MIME-Version:Content-Type:Subject:From:To:Cc:
	 In-Reply-To:References:Date; b=cQ4VF0JBkmNuhcLUCalndR2rmcyGU2vxwOQAYq+JAIpGMk8r8WqiXzY46ZRp4OJv23RCndC43mXq7sDrGPU7nIFTWP6wyC3V95rjxe2Po40KrBzaPOfEoN4y3SWXCfncciKQRFvvf3AOi2JeQWoDPsr2+wYdychtZgq2+5ApSTE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=vates.tech header.i=@vates.tech header.b=hwyjfciz; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vates.tech header.i=@vates.tech header.b="hwyjfciz"
Received: by smtp.kernel.org (Postfix)
	id 69E731F00893; Tue, 15 Sep 2026 20:03:01 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=185.255.28.34
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1789502581;
	b=RSpJ5S4rJ/qDcbu5M9IEtpiye2g15bkgt+n4OMnn5QN8aLkU5Wyxa/QBTHwwAxhSBk2U
	 KBDZcs/n/gpRdp45eoyJslUWc+ztQs/i12EFTbXoKTgvWCUiwzE1iCB0UdouQeH/8+2ei
	 mI9JAPASKmQyAVCDnKyUH18MbAcVqBiCawN+TARMYRJWy3Es4dvW962bVEth0cdLEDsoN
	 i/vmh20MoGajAxhtBY6XT3egNmqyF79HLmq7IoZYL4po7h6Hg281kVHUCG469nR4cV0rh
	 x85bXz5Kg4vHfk60hTEsd4ZUA6OlneYVZD6odjg6WEC59tz2ccXaFzVctaI4yJ13h7A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1789502581;
	h=DMARC-Filter:DKIM-Signature:Received:X-Zone-Loop:x-campaign-type:
	 x-transaction-id:x-swg-uid:X-Mailer:Message-ID:x-swg-bid:Feedback-ID:
	 x-campaign-id:x-client-id:X-Originating-IP:Received:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	 References:Date:X-Developer-Signature:X-Developer-Key:
	 X-Bm-Milter-Handled:X-Bm-Transport-Timestamp;
	bh=/nUj/U7A4GMyE872QiM0LddelT2phBHloODnxvKeyt4=;
	b=J1noWyX1EDYC+5J2Dc1kJaiPW7DueajPX90SsWhMQCsynr0y33fFkEXuhV4W7FA9F+1X
	 gxeeEIr+mRgy6lM9m5d18L4KrT+muouzdThsSmBuOaSD6knsreJA3HlxTf1fQYMm1H2et
	 PBSkys26hjLAA9FyNPv42MPb5hEhsxw3wllhkxVN2zqwns4xG4VVmOvdNK06vnn6zhq03
	 O5Z6uG1eQ+rDRex8i+uTwrsJuQjKPdC4vg75bFophR3JMnY1Y3nRQ3rD7L0phNjrRhDoO
	 7WilM+z+g+60MSN9UruGz3Y88S4UFFvx0kTIvuDtwqP2MJUh9c3h4+CdmY6+DJSFVYw==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=hwyjfciz;
	dmarc=pass header.from=vates.tech;
	spf=pass smtp.mailfrom=swg.vates.tech;
	arc=none smtp.remote-ip=185.255.28.34
Received: from prod-mta-13-01.swg-srv.net (prod-mta-13-01.swg-srv.net [185.255.28.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2D6701F000FF
	for <tools@kernel.org>; Tue, 15 Sep 2026 20:02:59 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=hwyjfciz
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 2D6701F000FF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=vates.tech
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=swg.vates.tech
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=/nUj/U7A4GMyE872QiM0LddelT2phBHloODnxvKeyt4=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=hwyjfcizcAe+T1l0Thr1OnvVvpCOCp+594uS69LU7UedQxJK1Hc4rz9S9DskoCp3j1E7u5j4n
 62eGzFZY6SsViPEUp2VD8sJdDtH/ljeq6lyWmyaH+VCXtmoKG035KW8TfEb2Oz5Ep8WDM9eXMkT
 qwqiMnp7dRfEPtSo/pdCruc4mZjGsB+Qag2Far1+vo6OmVqCpoJz4gGfOa6wY2Z9GDSQl1eCI6b
 hqtQkxK2vLpkZ6yn0dv0P9eRPkBBDjtSCr3S6Vho0F1IpzW+pb3ut5DJzCLECb1VK3JFAtPwtO1
 9AODXAypLHmSWAk6JCbtqYL3YamCjRr5a2CIELKZLj/Q==
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender: 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id 1a0a6aa53b400072c4.001
 for <tools@kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 15 Sep 2026 20:02:55 +0000
X-Zone-Loop: 1c6cc5136959fc4e1a43f37f74400c97be05f4e81b46
x-campaign-type: default
x-transaction-id: be634693-df95-4cd4-8b7c-5e9d85c1772c
x-swg-uid: 01-fa3c1cb4-3034-4523-92f0-52d1b43c9c8d
X-Mailer: Sweego
Message-ID:
 <1789502575.8631fc262581453bbf619ec5b2062170.1a0a6aa53b400072c4@vates.tech>
x-swg-bid: 1789502575.8631fc262581453bbf619ec5b2062170.1a0a6aa53b400072c4
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
Received: from leducb-2.local (155.89.66.37.rev.sfr.net [37.66.89.155])
	(Authenticated sender: baptiste.le-duc)
	by mail2.vates.fr (Postfix) with ESMTPSA id C419980DCB;
	Tue, 15 Sep 2026 22:02:54 +0200 (CEST)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: (subset) [b4 PATCH 0/3] config: fix stale defaults left by the
 liblore migration
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Kernel.org Tools" <tools@kernel.org>
In-Reply-To: <1789502417.8631fc262581453bbf619ec5b2062170.1a0a6a7ea6f00072c4@vates.tech>
References: <1789130860.8631fc262581453bbf619ec5b2062170.1a09082676a000c4f3@vates.tech>
 <178949936562.12838.13729523467993364413.b4-ty@b4>
 <1789502417.8631fc262581453bbf619ec5b2062170.1a0a6a7ea6f00072c4@vates.tech>
Date: Tue, 15 Sep 2026 22:02:53 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789502574; l=1302;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=7Og8CtagXrOTOjH2n+FsmiVpX/Yj6CfIODyv4YPveb0=;
 b=9oVOmZmM0RIH7zHMDV+id8JePJDjD7YA5aumjXVu0/N+X3h5CNwjttPhgSkAV9JutIyQ0vEtT
 XMUYkrFXdplDQVJF6X3TZ/YYjssIBKOpFC/DvHeFXMOI4heBLOERchg
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1789502575104

On 2026-09-15 22:00:15+02:00, Baptiste Le Duc wrote:
> On 2026-09-15 19:09:25+00:00, Konstantin Ryabitsev wrote:
> 
> > On Fri, 11 Sep 2026 14:47:27 +0200, Baptiste Le Duc wrote:
> > 
> > 
> > So, this isn't really a regression as much as it's, indeed, an 
> > architectural change that left the "searchmask" config dangling. I've 
> > added some plans to 0.17 to complete the migration, but some things need 
> > to land in liblore before I can work on that.
> > 
> > I've applied patches 2-3, but I wanted to make it more visible to users 
> > that "searchmask" is gone, so I reimplemented your patch 1 to give a 
> > warning when we find "searchmask" in the user's configs.
> > 
> > [2/3] docs: correct stale defaults in the configuration reference
> >       commit: 9140a2ca914811037e56b637176d87e441d01140
> > [3/3] config: take get_lore_node() fallbacks from DEFAULT_CONFIG
> >       commit: 6a92fefac9882e0da6a82a5f1109f423265fac3b
> > 
> > Best regards,
> 
> Thanks for keeping me informed of this and for the upstream of those
> two patches.
> 
> Where did you put the first one commit which you reworked? If you want I
> could review it to give my "Reviewed-by" trailer.

Oh sorry, I just saw you already merged it. Thanks for that and sorry
for the mail noise.


