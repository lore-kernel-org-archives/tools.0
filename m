Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C586C1FAD;
	Fri,  5 Jan 2024 01:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eFHeoGW9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27776C433C7;
	Fri,  5 Jan 2024 01:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704418051;
	bh=c0iyzA28WaPaA9Y5ps851Y9gsi3Fb5gz7U76z8T4e5Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eFHeoGW9UnQgJnvahg4jucorXPan811YQSAf/NZkGc88H4Pc7rTxTDhA1xii5aV+t
	 fsDSIJIroHzzp1uvvQBQlmMxLCzWi5dFcUX75clBbQSWVSfm53yUk1cGue9/m0h5oE
	 SbVS2FJWsEcGoHUoQmbFNX/7SdpmcajIpJ9j+DIsnxtrqMTB3L95MRiTyFM/rKMe5B
	 48fpldOLNSylco3IjYWm3UazE5vOWZl99kPkJCaP9AnJ730L6I8LqoJvG8Pm56fn+I
	 GqBYZmgylriZCE7Fl1Q0ZJxAIZQdCQiUpxQIoNzG9RxHasw4PnB8AwL7PfkHdxFn2/
	 WtjWwY8beC2Yg==
Received: by pali.im (Postfix)
	id F03326F7; Fri,  5 Jan 2024 02:27:27 +0100 (CET)
Date: Fri, 5 Jan 2024 02:27:27 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	users <users@linux.kernel.org>, tools@linux.kernel.org
Subject: Re: b4 modifying Cc-tags
Message-ID: <20240105012727.wrmknqeqmrjsus34@pali>
References: <20240102-axiomatic-gabby-whale-48d3bb@lemur>
 <CAMuHMdVtCfkLCb=d59XDELJO53jXJmo03iLcCwvMq54BFiUpFA@mail.gmail.com>
 <20240102-calculating-purple-dogfish-f4408c@lemur>
 <CAMuHMdW7+ENssXG4aim-Oa0T1pH-i5-YhVB9C+JaFoJjzuQK4g@mail.gmail.com>
 <20240102-debonair-beautiful-capybara-afced1@lemur>
 <20240103004415.42xndtocu2ggr2a5@pali>
 <CAMuHMdXxzhddGOoxXLxNoyHX2NnLad2PRz9V1sGd_or6UWFkMA@mail.gmail.com>
 <f8d3ddc69bd95bc8553b5908523e55e0be245e84.camel@HansenPartnership.com>
 <20240104004108.zs3wlfju6gzfl2mo@pali>
 <c4bc2926-e0ea-4e3b-ad92-2227a66203c0@kleine-koenig.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c4bc2926-e0ea-4e3b-ad92-2227a66203c0@kleine-koenig.org>
User-Agent: NeoMutt/20180716

On Thursday 04 January 2024 13:45:58 Uwe Kleine-König wrote:
> Hello Pali,
> 
> On 04.01.24 01:41, Pali Rohár wrote:
> > On Wednesday 03 January 2024 08:19:15 James Bottomley wrote:
> > > Technically if you're going to do SPF like that, you can also do DKIM,
> > > you'd just have to distribute the DKIM key to everyone who uses the
> > > server (or more likely, give each one their own DKIM key and label
> > > which means you can revoke if one leaks).  Each sender would have to
> > > run something like their own opendkim instance, which adds complexity
> > > on the transmitting end, but it is possible.
> > 
> > Interesting idea. It is truth that you can have more more DKIM keys in
> > DNS zone (every key has its own record) but I have never heard that
> > every user would have its own key, and do signing during sending email.
> > For me it sounds like totally crazy idea. But when thinking about it,
> > maybe it would not be such hard to create filter which reads email from
> > stdin, DKIM-signs it and writes to stdout. Then it would be possible to
> > combine it together with sendmail or msmtp binaries and git send-email
> > or any other tool would work without issue. Also creating DKIM signature
> > should not be such hard, so the filter application/script can be written
> > in Perl or Python. IIRC git-send-email is written in Perl, so it can be
> > extended to also append DKIM signature and no need for external daemon
> > like opendkim? Private key can be read from config file, like smtp
> > password. :-)
> 
> Debian has a setup that includes that idea. I don't use is personally, but
> it seems to work. See https://anarc.at/blog/2020-04-14-opendkim-debian/ for
> a user who does make use of it.

Nice to see that somebody already got this idea into production state.

> However debian also provides a relay which is probably easier to use.
> 
> Best regards
> Uwe



