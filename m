Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAACF26656F
	for <tools@linux.kernel.org>; Sun, 12 Oct 2025 23:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760311046; cv=none; b=DL5L/kNZ6eXlvp9275UMqOn5OAySDksL7C3yy0NYeFP3XlxbwuVsFWGovwSRPwX1HB386Kh1XdlstM906PS3HsTkabztyicZ/uHPUMP7/XiidbCMPU4lbmm8/UTIxIsKLYYGkYrQcfWKgOxBu1rooliffBO6ZMD82LlLgzBiaJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760311046; c=relaxed/simple;
	bh=7BI+b9ZVbb4arRlarVfTNMcX0rPmrLvCNIS2yu6CyvM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oBUo+adq4Qs29BuC7H5VMbyS57xLsqWYbN1/Fz8PIP/zoJET3m6MII8a+198+iwz0QF8Pm228rCulu3cTCS7k4w2yxWiVgU/YWoYm1syxc5qXD8P36bA3Z2dC3DAUS5+4Idu6R8kgqOHWKbTytH3/pUGz2VQKDn/q71Ei3Aikpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=ThuyM31s; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="ThuyM31s"
Received: by smtp.kernel.org (Postfix)
	id 71605C4CEE7; Sun, 12 Oct 2025 23:17:26 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0F8C9C4CEFE
	for <tools@kernel.org>; Sun, 12 Oct 2025 23:17:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0F8C9C4CEFE
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-856cbf74c4aso680866385a.2
        for <tools@kernel.org>; Sun, 12 Oct 2025 16:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1760311043; x=1760915843; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=X/91eppdZKO8OVQu5xpvXife4xudzqh2RIpAhvdRDM4=;
        b=ThuyM31sO+Dk+JR35px+HlJOkDL3bV2hbQzn55r5xiLWmelREppp+LESF9JTB0Zp35
         dGdTGW/0vrnNZiO6ugfk7ttQjNrRjcfLb5M1p8lzs13L2wsBodImpszVcjFZCg3dKwxS
         plJjoKHc0AUgJ/kKZtDIV2L5G64JHq01iahTYJ6VH/W8ZStndDyucW2/IASeEE2nOrlR
         lIGeTAb33Ye+iT6W5s8JfWxRBdp7tJCQ+gd58ALvlZYhZgeir20WgSqfAQAAv3zTwMz5
         OISxUSzPC+kr83yHpJdt5bnULMslKg5CKGmb2yxET+yNzQo3Vv/S7ut6/+CRAEX9szNJ
         c/OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760311043; x=1760915843;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X/91eppdZKO8OVQu5xpvXife4xudzqh2RIpAhvdRDM4=;
        b=OpjokMVQmQanbVxNRKnoVMZdIX1UAIDZpKnemfnz8LhhJCMN4DOxDzjNVJxlAz8Sjh
         LYdo7383iYXacSGQztBk0UZQ7fNU4qptiR3bDtyFYU5IR4yBtdma9us8h2XCauHYzK2z
         Rq4MUg/1/1U9AHVjaLeoKMaNYBYKSU1icARmt6qX+BiypZLVJnkA0EKWX9OLwN7XZ/T1
         Cc0zgPT5eOJwkjhjGz8yDtHYgJTspwK9TBjJPE35rX8n10f1lRAlqdBMrP7JHsVihpzv
         4Z4Qtqe82nlhDrSnWunvbfhqdT1L9iPXqWnQq4RAHqY9qiY6y5JPybX7l0X/jdN2HFe9
         sfdw==
X-Forwarded-Encrypted: i=1; AJvYcCXd6BjeE2ugW4YHeWBb5tfgJvRSxW/m5kT0ub8ijnYrrnQfv/cYE6m2srMrEotZTrFrBi9k7w==@kernel.org
X-Gm-Message-State: AOJu0Yzxc6GiDzoibqL+QT0VW4y1Q6ADARqA/we3dUB3O4Ccbl6U7HMq
	VSFziu6sZGGr/OFRF75A3QHIfSMDjFvIBBgys/M3LPt1cMJXiDT2Fk6j9Urpkx7mYbQ=
X-Gm-Gg: ASbGncuZYyhCE0UcacgoILoEuWoRTlDDGx2Qky7hqQ9WEre3LS9tuVFsBjj8v0aQMxu
	8qHlseEir0WsEugRzkzILWMNLWLw3ntP6pooXp4v4eUGRv+21LMOEIPRSvxP2zEhJmJaUdxDyt0
	Bqf9X2RoTEk8Tvk+MtcCB0Mg8g2/p2FBJ7OsdyEu0uVc9WlwbqRCfgp1wRDliDzKBUIAcFDIaZ9
	xePER1jn+liM9+uCTpzyEyFKO9KOIEuk36BhJSeZtuyVZFu44tb314rJiwqObWt3A6isBA1fWEQ
	7M1zhsGWfU9AhogFLSSI5UqXwqprUdbqFr8k/erPEjejGm5cZ7QpCKV1allwfbLvwcykTAnfUWs
	aL3AWEP9g9/kOhSXX6hu2Q/g4BCI8F4uIRYwu2u/T0QxAKKITZM2hCLwa4/eUsHTR0ZGuhMvt/r
	7s7IjBz+WE5g4=
X-Google-Smtp-Source: AGHT+IHGcocV5d4ypFSurdNv0uEOmeO+rEBPKHizNXqIvXAOVZZt5ze2u6kbiLKKbxQ8iHt38g5M8g==
X-Received: by 2002:ac8:5710:0:b0:4e6:eb5b:bea4 with SMTP id d75a77b69052e-4e713d9d85amr106648581cf.16.1760311042784;
        Sun, 12 Oct 2025 16:17:22 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.120.4])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4e706bd52c6sm66209451cf.11.2025.10.12.16.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 16:17:21 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1v85JY-0000000GsqP-3A3r;
	Sun, 12 Oct 2025 20:17:20 -0300
Date: Sun, 12 Oct 2025 20:17:20 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Linus Torvalds <torvalds@linuxfoundation.org>
Cc: Sasha Levin <sashal@kernel.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	users@kernel.org, tools@kernel.org
Subject: Re: [b4] initial "b4 dig" to supplant Link: trailers
Message-ID: <20251012231720.GB3938986@ziepe.ca>
References: <20251010-muscular-camel-of-acumen-00eeaf@lemur>
 <CAHk-=wgNNVkgDco67tVceM87B7kkVZK=Oz8RZti1v6N2_+S+2w@mail.gmail.com>
 <aOrqZsBZemu6MkAd@laps>
 <CAHk-=wismGKUUxSRmUr2x8_fXF+L4G1POSs=w+Duu6PVZz4R=w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wismGKUUxSRmUr2x8_fXF+L4G1POSs=w+Duu6PVZz4R=w@mail.gmail.com>

On Sat, Oct 11, 2025 at 04:44:00PM -0700, Linus Torvalds wrote:
> On Sat, 11 Oct 2025 at 16:38, Sasha Levin <sashal@kernel.org> wrote:
> >
> > We have plenty of headers in stable-related mails that you can filter by to
> > avoid that noise. Something like the attached patch?
> 
> I was reacting to Konstantin not feeling like making it
> kernel-specific, and I kind of agree. It's a generally usable feature
> for any project that uses lore or something lore-like.

It is pretty common for backports (in any project) to have 'upstream
commit XXXX' or very similar language in the email and commit message,
so if you dig commit XXX and find emails that contain the string XXX
they can probably be excluded.

Jason
