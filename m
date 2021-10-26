Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80B572
	for <tools@linux.kernel.org>; Tue, 26 Oct 2021 08:30:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C69BD60F92;
	Tue, 26 Oct 2021 08:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1635237014;
	bh=PfpdCgHu82jR8SeWHaqQo9sUUvd4PWxz+6S2xJWrYzE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RJhG9ReKVY4fB9Fx3rYfaRt5Ej34ffsVW8HcsaJkJowBsuGhTf0x5VD3ah4b8txoD
	 zMy9YNx4aBSGR79Pv4ViD1ft0wi/6dox73y0kSt/L2iL/1wYwRqP/E6bs2xwH3oRb/
	 FsHiYhTR6+bUZwDVBvY1U8TpcLpaRXU7S1eHOb88YufVJh2ysJ+NQzHn0cwxnXhCH2
	 Q9YZ+Pg5K7TzAGpnJlgXJyo6moc9p1BvrTrJNESnqMkM6D00woiY7xvP1SnrDZhQuY
	 FEF9RXYCFjr1zRN6eVzIq5c6KqIcRI0+SWN8v3wgetjUprnk5DIOKhhpFfjVztSNxV
	 eY8eyrXaAWR2A==
Date: Tue, 26 Oct 2021 09:30:09 +0100
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <keescook@chromium.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	tools@linux.kernel.org,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	Russell King <linux@armlinux.org.uk>,
	Olof Johansson <olof@lixom.net>
Subject: Re: injected body trailers
Message-ID: <20211026083009.GA20689@willie-the-truck>
References: <202110211313.B5C5C61@keescook>
 <20211021204459.xd63t5xn24vktqf3@meerkat.local>
 <7786271477279d4fbf9292db1f6aede8428eb00d.camel@infradead.org>
 <202110212044.D38D0993E8@keescook>
 <CAK8P3a1UrWfPxQP5v757XdOyEz-GE-jkStpQisA2mhAVneKwtw@mail.gmail.com>
 <CAMj1kXHBNuM3z-8DQ-_RUtU3QvnWV_=E9Ty2aXkR4RMr2P7ANQ@mail.gmail.com>
 <YXKj6jrS90DoJknq@arm.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YXKj6jrS90DoJknq@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Fri, Oct 22, 2021 at 12:43:38PM +0100, Catalin Marinas wrote:
> On Fri, Oct 22, 2021 at 11:41:30AM +0200, Ard Biesheuvel wrote:
> > On Fri, 22 Oct 2021 at 10:16, Arnd Bergmann <arnd@arndb.de> wrote:
> > >
> > > On Fri, Oct 22, 2021 at 5:53 AM Kees Cook <keescook@chromium.org> wrote:
> > > > On Thu, Oct 21, 2021 at 10:42:46PM +0100, David Woodhouse wrote:
> > > >
> > > > How about we reset that password and make the following folks the
> > > > list admins, assuming they're interested:
> > > >
> > > > ARM64 PORT (AARCH64 ARCHITECTURE)
> > > > M:      Catalin Marinas <catalin.marinas@arm.com>
> > > > M:      Will Deacon <will@kernel.org>
> > > >
> > > > ARM AND ARM64 SoC SUB-ARCHITECTURES (COMMON PARTS)
> > > > M:      Arnd Bergmann <arnd@arndb.de>
> > > > M:      Olof Johansson <olof@lixom.net>
> > >
> > > Fine with me, as long as I'm not the only one.
> > >
> > 
> > I'm happy to help out if needed.
> 
> Same here.

Likewise, with the disclaimer that I haven't helped to manage a mailing
list before!

An alternative would be to move the list to vger, but I suspect that's
far too invasive.

Will
