Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF6B2C8B
	for <tools@linux.kernel.org>; Thu, 21 Oct 2021 21:29:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 26FCA6128B;
	Thu, 21 Oct 2021 21:29:31 +0000 (UTC)
Date: Thu, 21 Oct 2021 22:29:28 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Kees Cook <keescook@chromium.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	Russell King <rmk+kernel@armlinux.org.uk>,
	Peter Zijlstra <peterz@infradead.org>, tools@linux.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>
Subject: Re: injected body trailers
Message-ID: <YXHbuGrG7PJ1mCA3@arm.com>
References: <202110211313.B5C5C61@keescook>
 <20211021204459.xd63t5xn24vktqf3@meerkat.local>
 <202110211414.00C7DFE8@keescook>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202110211414.00C7DFE8@keescook>

On Thu, Oct 21, 2021 at 02:21:04PM -0700, Kees Cook wrote:
> On Thu, Oct 21, 2021 at 04:44:59PM -0400, Konstantin Ryabitsev wrote:
> > On Thu, Oct 21, 2021 at 01:22:31PM -0700, Kees Cook wrote:
> > > 2) Can the linux-arm-kernel mailing list please stop breaking DKIM?
> > >    Who should authorize this change (rmk, Catalin)? And who can make
> > >    the change (peterz)?
> > 
> > The relevant settings should be a) don't add any subject prefixes, b) don't
> > add anything to the body trailers, c) don't rewrite any other headers (to, cc,
> > reply-to, etc).
> 
> rmk, Catalin, Peter, can this get sorted out? Having mailing list
> trailers is annoying beyond just DKIM breakage. :)

That would be dwmw2, cc'ed.

-- 
Catalin
