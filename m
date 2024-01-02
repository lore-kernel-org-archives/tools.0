Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5728F16409;
	Tue,  2 Jan 2024 20:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="xH2AEfP/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5C43C433C8;
	Tue,  2 Jan 2024 20:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1704228586;
	bh=CUtO/yoV0d1WGFZ7Nns3IW26ygAabZAKXjXlwj1NNWQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xH2AEfP/vQrZS8rXJ3Gelk1iozWQO79Ff7yl0GB1HsyuN1rRJxrwBARJ8PGoz+5kE
	 qAaQLoF3c2B65ruyJtYdhNTN9O50B1yd8RNuQV5kq+/UDHsVfbrgZ4HIyt0YX2On5G
	 eg8uv9aDiehDoE+Ub1QmTNNf3py0DjL6CY/5bapo=
Date: Tue, 2 Jan 2024 15:49:45 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: users <users@linux.kernel.org>, tools@linux.kernel.org
Subject: Re: Re: Re: Re: b4 modifying Cc-tags
Message-ID: <20240102-debonair-beautiful-capybara-afced1@lemur>
References: <CAMuHMdVGqTM08DvsAjZ45wn1HTR0Grh8Ewj9q21pPwJmbok5hw@mail.gmail.com>
 <CAMuHMdVhyjjcyxMAGF8rAqmyqin=xjWH0fhhOjqbq7rH4f-RNw@mail.gmail.com>
 <20240102-axiomatic-gabby-whale-48d3bb@lemur>
 <CAMuHMdVtCfkLCb=d59XDELJO53jXJmo03iLcCwvMq54BFiUpFA@mail.gmail.com>
 <20240102-calculating-purple-dogfish-f4408c@lemur>
 <CAMuHMdW7+ENssXG4aim-Oa0T1pH-i5-YhVB9C+JaFoJjzuQK4g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdW7+ENssXG4aim-Oa0T1pH-i5-YhVB9C+JaFoJjzuQK4g@mail.gmail.com>

On Tue, Jan 02, 2024 at 06:03:44PM +0100, Geert Uytterhoeven wrote:
> > Overall, I would suggest that whoever is responsible for linux-m68k.org sets
> > up all the bits required by the modern email delivery stack (DKIM, SPF,
> > DMARC).
> 
> That would be me (partially ;-)
> 
> Looking at linux-foundation.org, I guess that means adding a TXT
> record with
> 
>     "v=spf1 include:_spf.kernel.org include:_spf.google.com ~all"
> 
> + whatever outgoing servers the users of linux-m68k.org are using?

That wouldn't be sufficient, because setting SPF by itself won't really do
anything without DKIM signing as well. To set up DKIM with gmail, you'd pretty
much need to pay for their Google Workspace product. It's probably a huge
overkill for this purpose.

> Although the latter may not be strictly required?
> Or are Greg KH and Andrew Morton not using fastmail.com for sending
> email, only for receiving?

If you don't want to set things up and maintain them on your own, you can pay
a provider like fastmail.com to host the sending/receiving bits for you.
Unfortunately, since you have many users sending from @linux-m68k.org, they
will all need to start using fastmail to send mail once it's set up.

Sorry, properly setting up email these days is a thorny process, which is
really why we're down to a handful of major providers who now dictate how
things must be done to everyone else.

-K
