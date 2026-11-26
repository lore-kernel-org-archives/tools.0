Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795715336;
	b=YG8cgcRJeRpe8TplIWkHrSqFGJoWizMvEIwaA/74uiBTZfwrIkAVN6K7+AtEWLKppwLE
	 5+lTd7CbLz7gSEqBWqh6W1vwZLPxMJMocjPW0ykklvAXWi3/+ElQb0VXqAjcy6whvvuqQ
	 f2HZ3A3KayZKj2aC2zINowx7j8l2bgvDq6WaevDnJaaQl/eiohVFsDOg8SMyIAi7YXZdd
	 fFqw/N5ZUsz2wBDjkOa1EeVRXMaxUhaBjeYZEAJCNu7J9+nGGuHKVFcYZPMzfG37cvNWa
	 6M3sgCeGzWH3+m3VIUBYV/9e1k1xgBglUNnQIfRF/z6iM9lKwhvn7XJKeo7rodSyh8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795715336;
	h=Received:Delivered-To:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=OuDBNKmmCem17MAd8hAWSNyA/RDDkAPYf7BSrLxPqD0=;
	b=2Z1aa3U/F0OQ2/aAMFeyNpofIDe4xIjftYqc8Vg6xtBMBeMLouV9wOPcsGMtiUnowW4x
	 UZukmIRLMOR+MxmY1DFnPsi+qZT8VYFBNVVKukNzAJAOcnfSv5E3LpQYGOrmjfvYrqt2Y
	 Ws7aG2vASsXBpjAFZWkswMI/wPXx/GoCvHXfCP7Y4MLDSStRDubjTS3zNhi1ZTSyOLxmN
	 O4kbi8t36kDKkAgwDCPEtuuBaJOObrfwFR8omill//PMD7Ba9+/t1t1Vm1JsrYqBWVJN+
	 BWR/LRJBew5p4dGkM5uOy8uWAcboTbp20gxIPjlDR4YMfakTxCggEQcCsGe0orCKHsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=qZMCsR28;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF31606A31C
	for <tools@linux.kernel.org>; Thu, 26 Nov 2026 17:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=qZMCsR28
Received: by smtp.kernel.org (Postfix)
	id 1950F1F000D0; Thu, 26 Nov 2026 17:48:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B66251F000C4;
	Thu, 26 Nov 2026 17:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795715335;
	bh=OuDBNKmmCem17MAd8hAWSNyA/RDDkAPYf7BSrLxPqD0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=qZMCsR28Yl2jWLzyeMO6bkjWtJ0qwvIzuUntEvGBHKaqKZMsQLLkxFW0GtrFIAKVr
	 m5JntFTCNLjppBh1ngEIAElBxXii0pRkk7GWLy1sLU9wGfEyupeUD5vJyZTUXwWHgI
	 JcBTE5N/hV0bieILTxHEVv/rjjy6TMZivMeT8a3U=
Date: Thu, 26 Nov 2026 12:48:54 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: "Kernel.org Tools" <tools@kernel.org>
Subject: Re: [PATCH kgl] Preserve original dates when importing messages over
 IMAP
Message-ID: <20261126-cunning-wise-roadrunner-cf1601@toolbx>
References: <20261025-submit-imap-preserve-date-v1-v1-1-91ac2f5b502e@gmail.com>
 <179451279186.1693101.3646569244001837281.b4-review@b4>
 <CADvTj4oqJCvC1CoX4Dw=nXtCR4GYS5JiTNL5--iRKjCqG2FWzw@mail.gmail.com>
 <20261116-authentic-attentive-cricket-b046cf@toolbx>
 <CADvTj4qr0A0c8DpsNhWK3aV=Lh1bJL4knMjkG8rDaM=Qa01fsg@mail.gmail.com>
 <20261117-dinosaur-of-fabulous-skill-17ca6a@toolbx>
 <CADvTj4poKWpXDn149wXzq0-014w6H=arFgRCfwqZhs+7A8uEEQ@mail.gmail.com>
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
In-Reply-To: <CADvTj4poKWpXDn149wXzq0-014w6H=arFgRCfwqZhs+7A8uEEQ@mail.gmail.com>

On Tue, Nov 17, 2026 at 09:53:06AM -0700, James Hilliard wrote:
> > I think I will go the same route as mutt and provide "import", "date" and
> > "received" mechanisms -- this way it satisfies every preference.
> 
> Yeah, probably a good idea, I think "date" for at least this tool probably
> makes the most sense for a default however since it's the only option
> that gives you the patch authors intended patch ordering.

This is now in master. Please test it out -- I plan to put out a 0.8 some time
in the near future.

Thanks!

-K
