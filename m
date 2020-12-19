Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
 by mx.groups.io with SMTP id smtpd.web09.17126.1608420874914877318
 for <tools@linux.kernel.org>;
 Sat, 19 Dec 2020 15:34:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@hansenpartnership.com header.s=20151216 header.b=xx/aGdfj;
 spf=pass (domain: hansenpartnership.com, ip: 96.44.175.130, mailfrom: james.bottomley@hansenpartnership.com)
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 9498E12802DD;
	Sat, 19 Dec 2020 15:34:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1608420870;
	bh=tyf85BNcNZsVn0Ym/3rjtlGkfgoLytMSp+/mzPCjFTs=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=xx/aGdfj3YvRTFob/ohSdCEmCtTvHT3ldIKdxJWT261N9kIcI1kt5/fSMNyG8mwAW
	 cyZaTvrg0chwS9RWQuxVDkccnb5GReD5ManwgyEucNc04F2KeC2+NwEqJC6KmqEz2a
	 /kKtcooymYbilsm3tAujDG5fCO5sQHlfjHexbHNg=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
	by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aI_wpUgRrIcQ; Sat, 19 Dec 2020 15:34:30 -0800 (PST)
Received: from jarvis.int.hansenpartnership.com (c-73-35-198-56.hsd1.wa.comcast.net [73.35.198.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 1E514128028B;
	Sat, 19 Dec 2020 15:34:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1608420870;
	bh=tyf85BNcNZsVn0Ym/3rjtlGkfgoLytMSp+/mzPCjFTs=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=xx/aGdfj3YvRTFob/ohSdCEmCtTvHT3ldIKdxJWT261N9kIcI1kt5/fSMNyG8mwAW
	 cyZaTvrg0chwS9RWQuxVDkccnb5GReD5ManwgyEucNc04F2KeC2+NwEqJC6KmqEz2a
	 /kKtcooymYbilsm3tAujDG5fCO5sQHlfjHexbHNg=
Message-ID: <1fdc0edd747d58cd1a09c1d5fd0f0a22b83d4f45.camel@HansenPartnership.com>
Subject: Re: [kernel.org users] b4: encouraging using the cover letter in merge commits?
From: "James Bottomley" <James.Bottomley@HansenPartnership.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, toke@toke.dk, Konstantin Ryabitsev
	 <konstantin@linuxfoundation.org>, users@linux.kernel.org, 
	tools@linux.kernel.org, Jens Axboe <axboe@kernel.dk>
Date: Sat, 19 Dec 2020 15:34:24 -0800
In-Reply-To: <20201219221730.GD363602@kernel.org>
References: <87y2hum0t0.fsf@toke.dk>
	 <fc05bad0b5517500e62b271b8896f142060b235e.camel@HansenPartnership.com>
	 <20201219114529.42058976@lwn.net>
	 <b6094139488f2b725eb6ef632afa04f349980949.camel@HansenPartnership.com>
	 <20201219115716.416fa2df@lwn.net>
	 <12042294a3996c27d4f595f26bc1f54c1a4543a2.camel@HansenPartnership.com>
	 <20201219204832.GA363602@kernel.org>
	 <e700a8744c3b32070977bf672cd6788e12d6b7d5.camel@HansenPartnership.com>
	 <20201219214351.GC363602@kernel.org>
	 <f680b34d8bb711ce37627253d21478b02cdc5bee.camel@HansenPartnership.com>
	 <20201219221730.GD363602@kernel.org>
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2020-12-19 at 19:17 -0300, Arnaldo Carvalho de Melo wrote:
> Em Sat, Dec 19, 2020 at 01:57:06PM -0800, James Bottomley escreveu:
> > On Sat, 2020-12-19 at 18:43 -0300, Arnaldo Carvalho de Melo wrote:
> > > But we are digressing, assuming what is in the cover letter is
> > > not what should be in individual commits but has value, why not
> > > have it preserved upstream?
>  
> > Because on its own it's incomplete and we have other mechanisms to
> > keep the full historical record.
> 
> I agree that link tags points to the relevant discussion, and I hope
> that where that is preserved is available as long as the main repo is
> available, but that is only a hope, as it is disjoint from the main
> repository, keeping such valuable information in the main repository
> is still important IMHO.

OK, so I think we see the email archives in different ways.  I see them
as a thing, like the repo, which will always be there.  Even if
kernel.org gets sold off by the LF and we lose lore, there are a bunch
of internet heritage and archive projects making sure our history will
be preserved.  The link tag, since it's based on the msgid, will always
be usable through them.

I think you see this as less certain, hence the need to save the cover
letter, so in essence this comes down to *who* should preserve the
information.

> Its not like having cover letters in the main repository will cause
> major disruption or excessive overhead.

I'm not saying no-one should do it, I'm saying preserving cover letters
in merge commits is incompatible with the current linear workflow and
that link tags with that workflow provides a superset of the
information in the cover letter so there's no reason for anyone using
the linear workflow to move to a merge commit workflow.

James


