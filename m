Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01FA45D5CC
	for <tools@linux.kernel.org>; Tue, 15 Sep 2026 20:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789502434; cv=pass; b=Xl6Nwn2BqsxmKKL2UkTuw9N/vpI8ah04tXGiWXGF0xL2xd6fKUL/QgBQMoMB4l7laejWPTFAufw4GHwZUXkr6N93SVdNY8kGnJaJ2iYbwqPyOnAPj2HplkThj138xFy4Z+SKF2tLBuHywSO+G3rW28rN++ckl6tV6DWQHGMA3LE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789502434; c=relaxed/simple;
	bh=IYrQzj52+j4IcWRbHugwwVT/YrPU+S/DEQHNypOi6is=;
	h=Message-ID:MIME-Version:Content-Type:Subject:From:To:Cc:
	 In-Reply-To:References:Date; b=ln8Ky6Z8aqW1BrYo6Nl0b1j/yprNEOlNrQfmIl4/wbfIsJ/X4P6tOqeeUOsXFq2Z/GSGvc9nQZKaIkX4r7JfL+NLDrEEBgTyM/+VSL/EF7dbZKe91ocqcY8yhzmxooJ81vRvfahf7rlh8biMY1TABLXhKdx8V585rOFXIeU6f+Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=vates.tech header.i=@vates.tech header.b=SkT3WMUI; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vates.tech header.i=@vates.tech header.b="SkT3WMUI"
Received: by smtp.kernel.org (Postfix)
	id 44EA11F00893; Tue, 15 Sep 2026 20:00:26 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=185.255.28.34
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1789502426;
	b=qc42G45ZLJc+hbzpqtULiKtFsj8hmNFWArY5xq4sJmai46NEbwxgqO3ci1lkjo07FU1n
	 fXEAf9EIOxTuFTU9+gTw/zDvj4Nb9EJR744Y/MzySHvKfm5JhCmEQAA7p8cpYiqZ/3WMq
	 H+g3V3AoWptRSWeS19h0bnmcm9eTNdWeZp08fHF+pf8zKcB4xtU6k9x0K8g7MzpH2x+c0
	 XDBHROqGcHjLDwPG2kZ7opYNe1OmV3Y5A61Ncs0Qbue++f6yH22dzG1p+5kEQJV9fEbah
	 JdT1aUOlKVHTgWOQBfHlGM+GHuZl5mAwvzbk+jimVzARtU89l7a8U1rs7CXaH2N1Btw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1789502426;
	h=DMARC-Filter:DKIM-Signature:Received:X-Zone-Loop:x-campaign-type:
	 x-transaction-id:x-swg-uid:X-Mailer:Message-ID:x-swg-bid:Feedback-ID:
	 x-campaign-id:x-client-id:X-Originating-IP:Received:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	 References:Date:X-Developer-Signature:X-Developer-Key:
	 X-Bm-Milter-Handled:X-Bm-Transport-Timestamp;
	bh=jsCMYL5A8UDN1+UGvGSOFvtvQy3NUBLq8JmLhu2P4r0=;
	b=cVXirMWMbmeTPVRkBbcNo/dVoxzq8KAv6Eue6f3h72PUc/XI6qP2l4Yo3GFew9nUNwOw
	 EvG22KYf4yGjzTdMn5kVF1JbkHWZuzngEgq1HfWNwMRk/cbO5w5U2c6q4yPQ6UxCPZzYm
	 U8wzslQvzO9Pmu5DX5jX2cZzw6Hyx37c9qOftqcX7P83Pu31lsWrl7c7LoYPIRNeCJX7m
	 KJnZogctQG9U1SJmqbDSVuBo0xVGlyz6KC0y2hkYxT0EWSELUgajRrAfhQ/c1c0tNvUro
	 IR5VKl9lYWhOdoTc8nLnjDG+8I8mTHdoV1t6HZcIjJJczc8pYwbzP/p23NWVbpwLmVQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=SkT3WMUI;
	dmarc=pass header.from=vates.tech;
	spf=pass smtp.mailfrom=swg.vates.tech;
	arc=none smtp.remote-ip=185.255.28.34
Received: from prod-mta-13-01.swg-srv.net (prod-mta-13-01.swg-srv.net [185.255.28.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DCC991F000FF
	for <tools@kernel.org>; Tue, 15 Sep 2026 20:00:23 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=SkT3WMUI
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org DCC991F000FF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=vates.tech
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=swg.vates.tech
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=jsCMYL5A8UDN1+UGvGSOFvtvQy3NUBLq8JmLhu2P4r0=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=SkT3WMUIjhCzO4jv/7xYsFcBfmAH7GrN3BP+5gNt5J/u4iLN0uwC0qnMEaqgajH438UCxlQVA
 1KMVZefEvxPWlkNEYj5bgDdBob5JqUbvhUBdPRLWN0rjCuowQbcwBYrsQ0DTM2kZ38oRXI4BVSs
 e2y8/8zSp8i+9+qfWmuU3qwOVrlzdtxqtMRHfazjEpOtAfN87ipdKrBIKyvUHaYsPNH8U0T/pfz
 1Y4YdFyfsL6u9BTaspj5nD7xeuBpoFgKLelMc+jlhvjwB5ysieU+tSCT2He7pBXbKyLZ5ohprdK
 pAWtiV/Cy5LJJ0CREpI/7f/bK4LlGcvCOHmyE3mtFgjg==
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender: 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id 1a0a6a7ea6f00072c4.001
 for <tools@kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 15 Sep 2026 20:00:17 +0000
X-Zone-Loop: db7893dc23cb917352af1a9ea219535261bad038ac1e
x-campaign-type: default
x-transaction-id: 380eceed-6249-4dca-83e0-6bd575e1ead1
x-swg-uid: 01-c2ecdce1-eb51-4d6b-9eda-c4b1fe1a90cd
X-Mailer: Sweego
Message-ID:
 <1789502417.8631fc262581453bbf619ec5b2062170.1a0a6a7ea6f00072c4@vates.tech>
x-swg-bid: 1789502417.8631fc262581453bbf619ec5b2062170.1a0a6a7ea6f00072c4
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
Received: from leducb-2.local (155.89.66.37.rev.sfr.net [37.66.89.155])
	(Authenticated sender: baptiste.le-duc)
	by mail2.vates.fr (Postfix) with ESMTPSA id 691E781CBC;
	Tue, 15 Sep 2026 22:00:16 +0200 (CEST)
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
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "Kernel.org Tools" <tools@kernel.org>, 
 Baptiste Le Duc <baptiste.le-duc@vates.tech>
In-Reply-To: <178949936562.12838.13729523467993364413.b4-ty@b4>
References: <1789130860.8631fc262581453bbf619ec5b2062170.1a09082676a000c4f3@vates.tech>
 <178949936562.12838.13729523467993364413.b4-ty@b4>
Date: Tue, 15 Sep 2026 22:00:15 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789502415; l=1425;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=IYrQzj52+j4IcWRbHugwwVT/YrPU+S/DEQHNypOi6is=;
 b=d9VdV74WPfb4DrUPAZZnQOcMvbyZflt0kHNTB3jQht1jkLrJ0WsHml++mKl0eKe9m3wgPkBmp
 6JhOgJKwdahAXeiLqxgivZydnJ9VYQSlivpyMBye4nIs89GhYdy7d/e
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1789502416735

On 2026-09-15 19:09:25+00:00, Konstantin Ryabitsev wrote:
> On Fri, 11 Sep 2026 14:47:27 +0200, Baptiste Le Duc wrote:
> 
> > config: fix stale defaults left by the liblore migration
> > 
> > Since db4cd69 ("Migrate lore access to liblore library"), search queries
> > are built by liblore from the server address in b4.midmask, and nothing
> > reads b4.searchmask any more. Setting it has no effect, and b4 prints no
> > warning to say so.
> 
> So, this isn't really a regression as much as it's, indeed, an 
> architectural change that left the "searchmask" config dangling. I've 
> added some plans to 0.17 to complete the migration, but some things need 
> to land in liblore before I can work on that.
> 
> I've applied patches 2-3, but I wanted to make it more visible to users 
> that "searchmask" is gone, so I reimplemented your patch 1 to give a 
> warning when we find "searchmask" in the user's configs.
> 
> [2/3] docs: correct stale defaults in the configuration reference
>       commit: 9140a2ca914811037e56b637176d87e441d01140
> [3/3] config: take get_lore_node() fallbacks from DEFAULT_CONFIG
>       commit: 6a92fefac9882e0da6a82a5f1109f423265fac3b
> 
> Best regards,

Thanks for keeping me informed of this and for the upstream of those
two patches.

Where did you put the first one commit which you reworked? If you want I
could review it to give my "Reviewed-by" trailer.

