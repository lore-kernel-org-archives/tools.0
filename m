Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794927517;
	b=ElCGUkgR/ahN88ZqsQaDV7LRAScyvuh4ma+7kuqYi9cxSUolQpDHx7F55S7GmwW1vFpi
	 9zSoJS2C9wsuSu2suzHRtsw2SENWIhKvXMGdmOsJUNOTru3HMI5KxvTpMXlN0Psx0ddkm
	 NJJm2j55LoJlJ21irLwMK9r0SYCiq4gtvfMaaRIfypjENGAJe7kMNYU+fDBZ1s+bMN6hx
	 xQrX/esK0F1O6NjME4SLPc2Rv5eQXEexWAtYpxCtok+uOorWZZV+0D2IlD7G3m0FTS1Zj
	 IdjundgEqaNdtdwGiKMKwYsITFM4Mh9lkZgH1Xg4YivLXSUYCi8fDKinNCh0dZsO8HA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794927517;
	h=Received:Delivered-To:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=qtIWyTe4vVuwtkX1Wy5VJlFMHmgnAqInuDKYruztAcw=;
	b=ilgSiUpQ6KouTBlul8kwLuDM6o7jawi9rjs6Tiz7+XOaPUd4Cfba6k7hXR/Bfk00RPxA
	 ydsBTzNbX95btT6w47jLFIPKFF4LGIZOw2qa5bEUPQHRBvTvJzE0UaRI0SNBEcL2Cia6R
	 hz/VONoiB+Fn6ejIFbb2A+XGWTClVbrs9za0MyeXKK7oIpjSF2epXfr/6zZHpVtMBoFx+
	 y3/oA69orLgO8MAWkQ+urCjaCClqQA+DWjbEes3g9/5RTFuue8sO8+vjAKn1EsovWBklQ
	 se0udXc1EK86Vm0sWAZTrEsVP3Qo6HrdYWnPnABqeYYMwIWb2tAFymNcJqinUHCJGiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=yvqsXtsw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B978606A336
	for <tools@linux.kernel.org>; Tue, 17 Nov 2026 14:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=yvqsXtsw
Received: by smtp.kernel.org (Postfix)
	id 07DEB1F000C8; Tue, 17 Nov 2026 14:58:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3EDC1F000C6;
	Tue, 17 Nov 2026 14:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1794927516;
	bh=qtIWyTe4vVuwtkX1Wy5VJlFMHmgnAqInuDKYruztAcw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=yvqsXtsw4mE28h/BxPTtDMrjtGfa8ryO+3k1ttO6Oxm1HmXDetCbc54dBG8aVHeMv
	 lL+MLtsaam3RgWPBOmlC/oxyFLnjrq8eDljFbNBCiV/NDYCX3THK+QH/nlJC/eSvVo
	 HypOi03HXhVg/NXMu8lWUonY1qGa/GUndO+MJvaE=
Date: Tue, 17 Nov 2026 09:58:35 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: "Kernel.org Tools" <tools@kernel.org>
Subject: Re: [PATCH kgl] Preserve original dates when importing messages over
 IMAP
Message-ID: <20261117-dinosaur-of-fabulous-skill-17ca6a@toolbx>
References: <20261025-submit-imap-preserve-date-v1-v1-1-91ac2f5b502e@gmail.com>
 <179451279186.1693101.3646569244001837281.b4-review@b4>
 <CADvTj4oqJCvC1CoX4Dw=nXtCR4GYS5JiTNL5--iRKjCqG2FWzw@mail.gmail.com>
 <20261116-authentic-attentive-cricket-b046cf@toolbx>
 <CADvTj4qr0A0c8DpsNhWK3aV=Lh1bJL4knMjkG8rDaM=Qa01fsg@mail.gmail.com>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Post: <mailto:tools@linux.kernel.org>
List-Help: <mailto:tools+help@linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
List-Owner: <mailto:tools+owner@linux.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CADvTj4qr0A0c8DpsNhWK3aV=Lh1bJL4knMjkG8rDaM=Qa01fsg@mail.gmail.com>

On Mon, Nov 16, 2026 at 07:52:49PM -0700, James Hilliard wrote:
> > > Consequently, importing the same archived message through Gmail's API
> > > or through IMAP can give it different dates in the same Gmail mailbox.
> > > Preserving Date: for IMAP would align the normal case with what the
> > > Gmail target already does.
> >
> > Okay, after more thought, I think your reasoning is good. I didn't take your
> > patch series directly, because there is already code in liblore that handles
> > date header parsing and I wanted to use that instead of reimplementing it.
> 
> The liblore helper prefers the latest Received: timestamp over Date:.
> For patch imports, that can lose ordering deliberately encoded by the
> sender.

Yes, as you can tell, I have real trust issues with client-set headers. :) In
my mind, Date: headers should mean absolutely nothing in any scenario, but I
am happy to accept that my viewpoint is a bit extreme.

> b4 assigns successive patches Date: timestamps one second apart, and
> git send-email also increments the timestamp for each message. Sorting
> by Date: therefore preserves their series order. Delivery delays and
> retries can change arrival order even when all server clocks are
> correctly synchronized.
> 
> So a difference between Date: and Received: does not necessarily mean
> the sender's clock was wrong. They describe different events, and for
> reviewing an imported series the sender-defined order is useful.
> 
> > The latest master should have the functionality you were looking for and I
> > credited your submission with a Link: and Co-Developed-By.
> 
> This avoids dating old messages by their import time, but IMAP and the
> Gmail API target still differ: IMAP now prefers Received:, while the
> Gmail API target uses a valid Date:. The same message can consequently
> still get different stored dates depending on the import method.
> 
> Should header mode prefer a plausible Date:, with Received: as a
> fallback? Alternatively, if Received: should remain the default, should
> we provide an explicit Date:-first option for this use case?

I think I will go the same route as mutt and provide "import", "date" and
"received" mechanisms -- this way it satisfies every preference.

-K
