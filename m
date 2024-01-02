Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1EA114AAB;
	Tue,  2 Jan 2024 15:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Ynv3kgZ0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08757C433C8;
	Tue,  2 Jan 2024 15:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1704211179;
	bh=uXJW8so7fljDKQcq8vZD7eW/e0bO7g8D0JHA/UAGaio=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ynv3kgZ0DdmdY2ODyFpMdrTYDZu26Ns8CVqRR6mK/Wm0W5ValLqM2mPyzo/GLbCtz
	 Yr72oKsu45AuId/hbptADSYVweUjuSlNYMEnsoD9U/Q6uzQrwhcXuh0bJ6Mf/ZAIEs
	 x586uKzHgABHEu9hae9B3dtXFPKXYFZLc7J2kV4M=
Date: Tue, 2 Jan 2024 10:59:38 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: users <users@linux.kernel.org>, tools@linux.kernel.org
Subject: Re: Re: Re: b4 modifying Cc-tags
Message-ID: <20240102-calculating-purple-dogfish-f4408c@lemur>
References: <CAMuHMdVGqTM08DvsAjZ45wn1HTR0Grh8Ewj9q21pPwJmbok5hw@mail.gmail.com>
 <CAMuHMdVhyjjcyxMAGF8rAqmyqin=xjWH0fhhOjqbq7rH4f-RNw@mail.gmail.com>
 <20240102-axiomatic-gabby-whale-48d3bb@lemur>
 <CAMuHMdVtCfkLCb=d59XDELJO53jXJmo03iLcCwvMq54BFiUpFA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdVtCfkLCb=d59XDELJO53jXJmo03iLcCwvMq54BFiUpFA@mail.gmail.com>

On Tue, Jan 02, 2024 at 04:29:41PM +0100, Geert Uytterhoeven wrote:
> > The main problem is that your From: is @linux-m68k.org, but you send from
> > Gmail. I'm afraid there isn't much I can do to tweak things on our end -- even
> > if we make exceptions for your address on our end, your emails will still
> > likely be rejected or sent to spam when we try to deliver them.
> >
> > This really should be fixed on the linux-m68k.org side of things.
> 
> What is the problem with this?
> This is working fine with the vger.kernel.org mailing lists, and picked up
> by lore.  Only some (not all?) of my emails to {users,tools}@linux.kernel.org
> seem to be rejected?

When a domain is missing DKIM/SPF records, like linux-m68k.org, a lot of
providers assign them a high "spamminess" value. When such messages are sent
via gmail.com or some other large provider, this additionally raises
suspicions, because this is a common spammer tactic (pick a domain without
DMARC settings and then use it to forge the From address).

For example, on our end your message triggered the following spamassassin
rules:

FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS

By itself, this is not usually enough to trigger the spam refusal, but this
does mean that if there's anything else spamassassin doesn't like about your
message, it's likely to be refused. In your particular case, that trigger was
BAYES_50 -- amusingly, probably because of the word "enlarged". :)

We do have a bunch of other custom rules that usually lower the score on
patches and common code-review trailers, which is why most of the time your
messages will be accepted by the list server, but it didn't help in this
particular case.

Overall, I would suggest that whoever is responsible for linux-m68k.org sets
up all the bits required by the modern email delivery stack (DKIM, SPF,
DMARC).

-K
