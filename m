Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D0A36C;
	Thu,  4 Jan 2024 00:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LF98P4m6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DC41C433C7;
	Thu,  4 Jan 2024 00:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704329759;
	bh=D0irC+sba7/KfMcEexT/4tXg2MlDXr4Y0BwyMAiSW2Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LF98P4m6YBw5MTZqDJ88Z4m7VTdHcObu6It24E+8Gcs34+6COQIRZJojV9fwhF4xX
	 jPw4RHvfyWSetElhDa8v+PuVciIij0L3jGhjFCZq8QagJ0XOYOWJYbD3hoWFZwi86/
	 FvTCwCDIsrOsU9VRlE6Nk4lB30bdqvapIlvaze97ZodfGDUTxJZQMCtMhVNG9XDSGX
	 bC+cmK6spPvJ3dX5sYoB0Gwch5Ys7jzORVNKqoC01JTyQHXeFb6x5wVdCenH/GW1nR
	 oDYybftK9GX2HelJAxVfLPmGbS34vh2Ut3or0V0hESap6pGQKtd7dYob1Y969pOPJN
	 0aPoz2zl+amtw==
Received: by pali.im (Postfix)
	id 2767A740; Thu,  4 Jan 2024 01:55:56 +0100 (CET)
Date: Thu, 4 Jan 2024 01:55:56 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Linus Torvalds <torvalds@linuxfoundation.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	users <users@linux.kernel.org>, tools@linux.kernel.org
Subject: Re: b4 modifying Cc-tags
Message-ID: <20240104005556.4zxuv3qzkq66vtln@pali>
References: <CAMuHMdVhyjjcyxMAGF8rAqmyqin=xjWH0fhhOjqbq7rH4f-RNw@mail.gmail.com>
 <20240102-axiomatic-gabby-whale-48d3bb@lemur>
 <CAMuHMdVtCfkLCb=d59XDELJO53jXJmo03iLcCwvMq54BFiUpFA@mail.gmail.com>
 <20240102-calculating-purple-dogfish-f4408c@lemur>
 <CAMuHMdW7+ENssXG4aim-Oa0T1pH-i5-YhVB9C+JaFoJjzuQK4g@mail.gmail.com>
 <20240102-debonair-beautiful-capybara-afced1@lemur>
 <20240103004415.42xndtocu2ggr2a5@pali>
 <CAHk-=wgZ-s0fHkxF-_7K5=WGW4G1ymom-nSHTFC+E-YAzPeTwQ@mail.gmail.com>
 <20240102-exuberant-glaring-dalmatian-d62bc5@lemur>
 <CAHk-=wg607GVe6NYrM6wi+ByKdVZASqHnWSOO-ij0f07b2ke1Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wg607GVe6NYrM6wi+ByKdVZASqHnWSOO-ij0f07b2ke1Q@mail.gmail.com>
User-Agent: NeoMutt/20180716

On Tuesday 02 January 2024 21:25:53 Linus Torvalds wrote:
> On Tue, 2 Jan 2024 at 21:03, Konstantin Ryabitsev
> <konstantin@linuxfoundation.org> wrote:
> >
> > > Konstantin, is that c=relaxed/simple intentional?
> >
> > It is, the important "relaxed" is the first one (header content). Nothing
> > should be doing any whitespace normalization on the body content other than
> > trimming any trailing whitespace characters, which is what "simple" does
> > already.
> 
> Hmm. I have distinct memories of seeing people claim that some MS
> mailserver would change tabs into spaces, and that you wanted to use
> c=relaxed/relaxed for that reason, but I can't find it now, so maybe
> that is just some memory failure for me.
> 
>                     Linus
> 

Technically, SMTP server can re-wrap long lines also in the body of the
email during processing it. I do not remember if RFCs permits changes of
tabs to spaces, but who knows that CRLF-based standard is allowed :)

I guess that recent SMTP software would not have "line too big" issue
and would not do rewrapping. But maybe that MS Exchange (or something
else) was doing it...

Anyway, SMTP protocol supports binary transfer of the email but this
(older) extension is not supported by Postfix yet (as one of the
commonly used SMTP server). When intermediate server is going to
transfer such email to Postfix SMTP server, it has no other option than
just reformat it, and broke DKIM signature. Maybe not so common... But
still I would be careful about changes with bytes <= 0x20.
