Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793545520;
	b=U/BaVgVpNHQZGQ/FuqFMS/5A5mxQdunAA4D403kcvNnaXAOroqjXdUfQfry0ruxOhuxq
	 YjZQRG1X7p+3UslhoQxU539QrP074rzHGoLu/OMw1eITfgAWhjTtxyZcua0llb25RfFVX
	 H6JDO7EfI6uMVdGDfXLrDJx2IJdu9rzWevyWa6n3LGndgfh8Qsp5oVJChotBRRvWRHXKA
	 yFlARJbyEDGxNxhaiTLvMuBBp73j5iQ+lqXP9YHK+dROvIm1p3riW0GyOSI0Jrd8It6Gu
	 dntyKy2i+hv4Z3FtPyDrIBZ+8DgdqzT4Ku0OVMVL7QL1GS0CCuEl4BNtcXA1lzWCIyg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793545520;
	h=Received:Delivered-To:Received:DMARC-Filter:DKIM-Signature:
	 X-CSE-ConnectionGUID:X-CSE-MsgGUID:X-IronPort-AV:Received:Date:From:
	 To:cc:Subject:In-Reply-To:Message-ID:References:MIME-Version:
	 Content-Type;
	bh=iR1PkMCGioT83Lr22OKwS6xnbl0LkFIxtbGUSz+GNTs=;
	b=in5J2ChExHz5X0e+/I7YB5wJdNdKCCJK6cDzf3Q2AWTQNMjZTIpjxt1TPaCTqi4zOftq
	 xPcPNG2AgrJ02jCfHQhaih/Y9F4g2tNlc3WV1kVZJxaEDWbllxA8hmg/fN6MweWB92U3s
	 UkWUfflmCmco4x3ebZaYnQtdpkwhT9U2PThQH+egaYuPehNPWWl9RvhzRMYGoaLde2NOw
	 bbUoo9CjY5+Tx1lrKL06jTwCpr0sS6EXyD2H3GWUz6KiGcYNYo7NkE0TbxL1hLAuFermK
	 q+wVUhU9RjgWEoUJlBTrrNocsq8xfxfoPLA6VuDPDbh1K7wMeS6Ly5E49Knd37ai/6w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b=n7OxxnOI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A5C606A324
	for <tools@linux.kernel.org>; Sun,  1 Nov 2026 15:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b=n7OxxnOI
Received: by smtp.kernel.org (Postfix)
	id 2E06F1F00A02; Sun,  1 Nov 2026 15:05:20 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=192.134.164.83
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793545520;
	b=r09KuchQRF54gMxUuURUJHOtBFyo1D5JrSeI4LCr3E3q+b11gjMTNGoI7IUoFS5dIk8k
	 mvv2dExPo8XhmSu2TP48scHPRAPjdg0FfSPTeAJw1DZ6kkpnTnw+wfDeeHgMSRgtzAEgF
	 1SOLR0vNhtI1N+YrOgR1EWYDjHQIeeKU2iO/bs9s1iPwjr1N9kyRJzXq/9Z+nD9ywOOlf
	 ZwbNsLTOZmPefOmUMCqq7rnPTWOky6+5SVI40yqEW1T3p87vV7JGCKTramiflJu1i0o0s
	 26zqhTDxXGqtQznA2sJgP37IGpUBj+Pe7phixZcRlp1mWdUMHNQ1K4CPF8oZaIUzSaA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793545520;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Date:From:To:cc:Subject:In-Reply-To:Message-ID:
	 References:MIME-Version:Content-Type;
	bh=iR1PkMCGioT83Lr22OKwS6xnbl0LkFIxtbGUSz+GNTs=;
	b=nLNvJzfdKUo46umyyM82kZcqfc0xIw1guZiGM7xs/SLdHv1252fcJMMNxj3yJAFkQavg
	 18VBU0otlHGy0qgNdV+L08SFMmdZVvHuVlnk/ypf1Qqjek+MVEHHk+IOGELeMFMoy9fzY
	 4BQvHznjmhFkcWhK1UFm7QKeuYeeghQoMGwLmyDdgjJY24OQREd3E443vMLNW6EtKyZSI
	 8Z1IQ2Snz60AuQmEsIRox8d908a3P2eINIdoRgSgIBe51iKP3/FFFqzQ6SChWONJyjh1Q
	 J6FxYgmE1bUY0FWkbdOyvklqchThVFStjPzntOK13GQw/OOVAGnU/CeK080scZ8ztYg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b=n7OxxnOI;
	dmarc=pass header.from=inria.fr;
	spf=pass smtp.mailfrom=inria.fr;
	arc=none smtp.remote-ip=192.134.164.83
Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 91C281F000C1
	for <tools@kernel.org>; Sun,  1 Nov 2026 15:05:17 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b=n7OxxnOI
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 91C281F000C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=inria.fr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=iR1PkMCGioT83Lr22OKwS6xnbl0LkFIxtbGUSz+GNTs=;
  b=n7OxxnOIp3nrIbypaG/4v2H1AejSV7vofAdifTtXmBO+qj8UXCo5Jvzb
   Rn+SAlviClMsujr/SjkBK5D/WMJvlt3E/Qc01TcI0HoBJnIDN6YqkzYBa
   93M+hVC4DIQ4QFi8Ex9je/u8BzebZZpCdizLa93M6BUf+EL9fVTej3eW5
   Y=;
X-CSE-ConnectionGUID: aDNy7RhGQwqgoxsRYcHIHg==
X-CSE-MsgGUID: Kog4sLtsRzuUpZQ8Pdqaqg==
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.27,190,1787004000"; 
   d="scan'208";a="303208856"
Received: from 88-188-149-159.subs.proxad.net (HELO hadrien-2.home) ([88.188.149.159])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2026 16:05:08 +0100
Date: Sun, 1 Nov 2026 16:05:08 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
To: Markus Elfring <Markus.Elfring@web.de>
cc: cocci@inria.fr, tools@kernel.org, kernel-janitors@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [RFC] Distributed data processing for SmPL scripts
In-Reply-To: <aefccf2d-3ca6-4d15-9026-649fb0a0f63c@web.de>
Message-ID: <b55ad049-86e0-f737-a96a-f3151db5012@inria.fr>
References: <aefccf2d-3ca6-4d15-9026-649fb0a0f63c@web.de>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Post: <mailto:tools@linux.kernel.org>
List-Help: <mailto:tools+help@linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
List-Owner: <mailto:tools+owner@linux.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Sun, 1 Nov 2026, Markus Elfring wrote:

> Hello,
>
> Some developers got used to tools which support distributed data processing
> for compilation tasks.
>
> Examples:
> https://www.distcc.org/
> https://github.com/icecc/icecream

Maybe such things can just be used off the shelf, since Coccinelle can be
invoked from make.

In any case, I have no intention of working on this.  If you want to
contribute something, please go ahead.

julia

>
>
> Would you be looking for similar needs also according to source code analyses
> and transformations?
>
> Regards,
> Markus
>
>
