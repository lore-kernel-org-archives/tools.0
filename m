Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E8574F30F6
	for <tools@linux.kernel.org>; Mon, 19 Oct 2026 13:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792417839; cv=pass; b=LxEQvboZ1W/5fQbyUTsVFBCKd86PQ6uqy4CWczHEMjhiF3YZAyH3zF2ckVXP5LGxL2p7W5duUSdNwYP64LNuTxBq9xLxvIneX31sRXs+OGXbDC4Z0aDFPV0Wf+2X/01NI/vOszIEp4TQggJUICeL75zBizZM0r3WIIQl8QjlR6I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792417839; c=relaxed/simple;
	bh=MRzBexvlhdoH+0NhJToZdqH+srEvqL7tuVFETiat4+g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=Z8g0MNnl5W0SsgecXpAM1Hda4Q57jzPF74+kNEp7ug/CxjiNiSE4P1rWASzVZbUpB5obpzGAjGwP8gi1oGGz3hjJhq9SZ4PyMh3GwQa4j6ECWkFRNYCboRkGClpzLA6+OiUByz3HxU+K8Er+NI8irKL7SUZRxLbS9L5yB9XuJAQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UwUIJB98; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UwUIJB98"
Received: by smtp.kernel.org (Postfix)
	id 40D1A1F000C6; Mon, 19 Oct 2026 13:50:38 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792417838;
	b=xpaNs7zXLVO5Rq+qBiuhOBe9Rl4tqelPf2+xZbcSUHg1fhiGeBYvkqylkQ5te/8VHNqK
	 X/fd4xKEwrtVQ33omuR+ykmo4n/8X/XF912uiy+jN3KVXVy1zZ6RgElnmOojIzd/FIaZL
	 o6ax42GeWu6tTxpytRCPiakAWhkpEycOtZbLtT4JJudhTFgkgnvwAWAvwcn8JzHf+xW14
	 LiBZm6p9Wxx3Eru9EQBQQ8UByrM5w+Zd0G0Tim0nQ0jgQRkPEDDUOZxEbPKfDvbR0kQoR
	 x9J8n8vTDsIsIvwdbL+bMS6fK94OW90u+O2LnWBsfCjIr5PIdPvQwczsKeZY5I2zgEg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792417838;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:In-Reply-To:User-Agent:X-Mimecast-Spam-Score:
	 X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:Content-Type:
	 Content-Disposition;
	bh=MRzBexvlhdoH+0NhJToZdqH+srEvqL7tuVFETiat4+g=;
	b=T6vBlgr1599bNBHO0ercAfMPJv4A1peI1zP8h70xdpWJIz+4uFxSka+urnlFH91vlyVK
	 R0z/4RUBZeFWjKM2eVY4Xv1NWsKYx5/N/Ex9/Mu3N0sz2rV9CEAgcU52fW4veQWoS8bzz
	 IGoPRvkL+Q53aiE6pFq4gJzETMhURfzigr8EUqyLbu+d/omtCR/WEZzWHYhO+l9mv1chI
	 6QHOwbUu0Nc8I6JyXqMWH+MS+2wkXCexaSA3x5jYLSXHCkj5a48y6ClqYG1PhykS0Zbg8
	 8l6XaQQu9yWZkZaX+iW7TsdI14yMtGFRhH0Kx3ZB14v2AO0cHkh9oDh53qjFZ7aNsrw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UwUIJB98;
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 912C51F000C5
	for <tools@kernel.org>; Mon, 19 Oct 2026 13:50:37 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UwUIJB98
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 912C51F000C5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792417836;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MRzBexvlhdoH+0NhJToZdqH+srEvqL7tuVFETiat4+g=;
	b=UwUIJB98zGXpEFF6EgZZ8v+yCKKZUAMEqmwKytlyDYi4BxM8MHc4ZIUau1JjLMTIagfHUW
	3pcXDpv9qRSKpWzgwKwEOdb3Xgk4v3sqNfisCULVWbFHSnJ13voFJHBVX1xZjlCVriKSBT
	xkON7HlpMsAhNofVzqSBshdDyu34xuo=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-140-68SRpvEfPWCZM9eBcjb94w-1; Mon, 19 Oct 2026 13:50:35 +0000
X-MC-Unique: 68SRpvEfPWCZM9eBcjb94w-1
X-Mimecast-MFC-AGG-ID: 68SRpvEfPWCZM9eBcjb94w_1792417834
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f1f2fafeaso300294885a.2
        for <tools@kernel.org>; Mon, 19 Oct 2026 06:50:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792417834; x=1793022634;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MRzBexvlhdoH+0NhJToZdqH+srEvqL7tuVFETiat4+g=;
        b=2bbUakdQ5L5k8yqEP9qr7LZVzOGf5r4srp70XCO6l3ZQ/GHLET33cHFg40vH3NiW8M
         FiPOtdPfu64XKx2luBeHjXVPc6ZnLdsfm+uLVobDXyNqIft7ovZXZ/Nacu7F4qUwHfOs
         WmLwCkN+xS38Nd59A5zyQROl2008RNjm31kKgp3tsBjTOaGM9NHleejhVB84JCq3yrbh
         eoJkCCZpQNVFICnvERVEIlni8okSe6WyYxywmZ46QnHivF+3ACSfjpEreqwLSOh26Tt1
         kvStfiqaWWKBDMLOghMmU7WkkRpDq8Ja2eWpthHRvr0eaRIA3OOL5VYFXidk1bvC8kwp
         mcxA==
X-Forwarded-Encrypted: i=1; AKwUvBworj08E6fgLiwMEB5aWADud0ADGWHmnQmOvmuDIsOIWjLVm8NhH3FQDHh7ROxxDrSnHxLNXQ==@kernel.org
X-Gm-Message-State: AFq9FYLPq6SCyeQVW4ahgIaxKEHrAeJr0dC9ZkN/7sOk1fNFhbeubRdr
	iAsIlEAfe8Up4MiDhllACrRg6Xx5OPV9P0mSERsXA0Or7Bh34k8QPO3LcZSD0ijl7h0XIio7fcY
	v2oDG7XvqFcUV6mWl3qnXSj7Vd7O0zMWEViazZtXHWSQjMku7hg==
X-Gm-Gg: AYBFou2aE5VwKUHwc/z99qsUz/UBOWFNaMIHg/ZsdRjvzYVBxzqWymJ7++NLATa6Gut
	CQmQk2Ro/2MS1CGSoq/QidpawpgMZi3L4qXgTAG5/DlWkM14KUg/9jckjkn1EGo9GiTI68TeGW4
	PEYurmK9sB4ngauIw0JN6zC+3shYDjviYia32mvSN9LUHmDXHPkecYvb6eH7WgUrUbeucHsgKqy
	GE9yktAybyY4RRKgCmv6SCS6lVuYzKweN/z78gmjpVnW+dsnW8ftLkaYmIHit6OSDN4WXcSP1MM
	tjF7hx2GvPYGJAnKuKQruWrIJu7ESFJAJxcZRRJZ/tff345osHKd3KHn86FOvFufZ9PRi0wUpVy
	3z8g/RKGyma60d39cxNgYblpb+nEKWobbhyERL/KGV+rLMV43cauT1BC9AeshykWB2lE=
X-Received: by 2002:a05:620a:4508:b0:93e:7ec5:1832 with SMTP id af79cd13be357-93f29cc8e70mr1297518485a.23.1792417833945;
        Mon, 19 Oct 2026 06:50:33 -0700 (PDT)
X-Received: by 2002:a05:620a:4508:b0:93e:7ec5:1832 with SMTP id af79cd13be357-93f29cc8e70mr1297512785a.23.1792417833374;
        Mon, 19 Oct 2026 06:50:33 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f1a16951asm972561785a.7.2026.10.19.06.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 06:50:32 -0700 (PDT)
Date: Mon, 19 Oct 2026 09:50:31 -0400
From: Brian Masney <bmasney@redhat.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: mricon@kernel.org, tools@kernel.org, users@kernel.org
Subject: Re: b4: retrieve API key(s) via git credential mechanism [feature
 request]
Message-ID: <atYgJxjTgToh1Jn1@redhat.com>
References: <20261016-tiny-labrador-of-serenity-28c5fd-mkl@pengutronix.de>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261016-tiny-labrador-of-serenity-28c5fd-mkl@pengutronix.de>
User-Agent: Mutt/2.4.2 (2026-08-30)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6oGD286X1gGQgsIuWN9L4854yZqrzVPiivy75STep74_1792417834
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Marc,

On Fri, Oct 16, 2026 at 11:36:10AM +0200, Marc Kleine-Budde wrote:
> I don't like the idea of storing my patchwork API key in plain text on
> my system (which uses encrypted storage, though) and my dotfiles repo.
> Can you use the git credential mechanism to retrieve API key(s)?

I posted a patch series to b4 last week to do that. Please give it a try.

https://lore.kernel.org/tools/20261015-pw-key-command-v1-0-6daa9b8cee2a@kernel.org/T/#m1ba5c2cd1c5924dc293be4c1969a509278a8bdf0

Brian

