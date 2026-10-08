Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BDAA4C9E05
	for <tools@linux.kernel.org>; Thu,  8 Oct 2026 14:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791470774; cv=pass; b=k3QunA73NKKZ8qNyALE/eXlB12qtsIPQoNeNDbbbobBnd7cJaowrTZTDwGblYyti2OYpnsjEVJpaMKNGQu+d5g//1sDabzBSeGDveKr8nTn30tRKcNRuozIAArqb4oQrfiV6MR9aaPQgp79B8Isb2D1NE4+RELtE0uybU0dEXl4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791470774; c=relaxed/simple;
	bh=MVEV9yjSB9tNALeuWefzERFXLmdUYsA24XQRLOpTNfE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nMJ7/vnE0HEic2sHdXYFFClPKXaR3kgQnnXKF+KTg0nFsBSRW8SAkr6zFoySyviwKJCmKnGImD2hl5l+zfixJtVN8f5S+0zEcI834rRgvVGVqcdPwhpptusEAVFOn8X8J0aq2wa4eXZHLVdeCcXVK6R12hkl9N8KpnptdRAYhLY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=hallyn.com header.i=@hallyn.com header.b=cVrae5Ai; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hallyn.com header.i=@hallyn.com header.b="cVrae5Ai"
Received: by smtp.kernel.org (Postfix)
	id 499EB1F008A1; Thu,  8 Oct 2026 14:46:05 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=178.63.66.53
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1791470765;
	b=uFJ+zOsxga1vs53my8wMGnfkQ+fR3lnD01iLDSzXtsj2qNlqA+67ydNlxAUelhkB1o/s
	 mv/hxZReJ1dl4wAHQZ6GvqbShsPoJtwQ2HcDJklu8jLHBXTnntdIdx2qvUnvsm0WQYbcJ
	 lI7Yw4c7UYPHl2XagM2h48gdfLfHThL7vPa4890Ol5Jy+Vh+rXf8CltrN3gWKSz9if7u0
	 pBXdUC1cO08+4OH5fz0FrURS4Twdv4s16pARyJycnorICOhI79OS0Io/9+NAkoullEVHh
	 SV53Or0h860Exd8pGuhYFYKYmuS0tVxZTlWuFrykdOe5C+qN6eUe6TuPIIukfb3sIow==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1791470765;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=0Q28OTNb+nzBBPiSUJXogVTzPPgnEqbYXMePBjxC0rs=;
	b=bce6+vmLvIE7nUdxgxUvfDcsbA6zCJNJnoik3N6H8XpP69015QdMJ2+3l7SrpIxICc0Q
	 e+m5lY81gSzSznGGHlIpxb1WxmXQ5ANnHf+KCdQ6pE761NSVc3hNFtP7jCk33f7Vm/O7h
	 SPrxGgHnAYm/WZorFt5yoDE0JHPp/fHXNb1drk8y+htiCvAIdl8FH0q3nU7D7Rp2O1GSe
	 vvfJh0pcVh3LKGTB0gFOmOCGxVs4fkSQ5Hrn59E9YuIxzKUE3kKe8Au0zq948s2MJ456u
	 dPZ0CKFnfXAY31ldTWqUsozlA+TSksHwcVDuy2B784flyELoJTCkapT/azuSRMY7mww==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=hallyn.com header.i=@hallyn.com header.a=rsa-sha256 header.s=mail header.b=cVrae5Ai;
	dmarc=fail header.from=hallyn.com;
	spf=(null) smtp.mailfrom=hallyn.com;
	arc=none smtp.remote-ip=178.63.66.53
Received: from mail.hallyn.com (mail.hallyn.com [178.63.66.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 76C391F000FF;
	Thu,  8 Oct 2026 14:46:03 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hallyn.com header.i=@hallyn.com header.a=rsa-sha256 header.s=mail header.b=cVrae5Ai
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 76C391F000FF
Authentication-Results: smtp.kernel.org; dmarc=fail (p=reject dis=none) header.from=hallyn.com
Authentication-Results: smtp.kernel.org; spf=tempfail smtp.mailfrom=hallyn.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=hallyn.com; s=mail;
	t=1791470761; bh=MVEV9yjSB9tNALeuWefzERFXLmdUYsA24XQRLOpTNfE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cVrae5AiujcKzze1N9hA2EqJp+i8rFPLEO+6zDYHPz1z9UWfGnhqyuf/LOCNFikMb
	 MjTJPPW+D8Cd7b8Hg8hkUKTRODY3NjMHtqX6d8hu0QbLA4qWgy5vqGmEfszh06Izm6
	 Y3udqlh56KqpqTbEISFGd9CA/YGVlbb5DMjl4TIxJH0EbG56utOSC7I9xE8P3qbN5u
	 ewXDBaYLtJW4OwLJ/4lQsqyf2g+AYHIk3eKLrbFYl1n7il3NKtKyrCrA+hgXliNSLR
	 r077T7GwKiW88gefbmbCU08wB3wRbxenKZlN185lpyMR2BN2xNjjor8DPExHlv2gHv
	 LQunQAiSZbQDg==
Received: by mail.hallyn.com (Postfix, from userid 1001)
	id 24683196B; Thu,  8 Oct 2026 09:46:01 -0500 (CDT)
Date: Thu, 8 Oct 2026 09:46:01 -0500
From: "Serge E. Hallyn" <serge@hallyn.com>
To: Sasha Levin <sashal@kernel.org>
Cc: Gregory Price <gourry@gourry.net>, linux-api@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-kbuild@vger.kernel.org,
	linux-kselftest@vger.kernel.org, workflows@vger.kernel.org,
	tools@kernel.org, x86@kernel.org, Thomas Gleixner <tglx@kernel.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Dmitry Vyukov <dvyukov@google.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Cyril Hrubis <chrubis@suse.cz>, Kees Cook <kees@kernel.org>,
	Jake Edge <jake@lwn.net>,
	David Laight <david.laight.linux@gmail.com>,
	Gabriele Paoloni <gpaoloni@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Andrew Morton <akpm@linux-foundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Subject: Re: [PATCH v5 05/11] kernel/api: add API specification for sys_open
Message-ID: <asesqWv1gv0lPZhD@hallyn.com>
References: <20261008084956.2911790-1-sashal@kernel.org>
 <20261008084956.2911790-6-sashal@kernel.org>
 <aseRXi7hMWBBc0tB@hallyn.com>
 <aseWPV6ZRQM3JOMN@gourry-fedora-PF4VCD3F>
 <asemkQ2v0di0Eea3@hallyn.com>
 <aseqx-uc_QySDiiw@laps>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aseqx-uc_QySDiiw@laps>

On Thu, Oct 08, 2026 at 10:37:59AM -0400, Sasha Levin wrote:
> On Thu, Oct 08, 2026 at 09:20:01AM -0500, Serge E. Hallyn wrote:
> > On Thu, Oct 08, 2026 at 09:13:38AM -0400, Gregory Price wrote:
> > > On Thu, Oct 08, 2026 at 07:49:34AM -0500, Serge E. Hallyn wrote:
> > > > On Thu, Oct 08, 2026 at 04:49:45AM -0400, Sasha Levin wrote:
> > > > > Add KAPI-annotated kerneldoc for the sys_open system call in fs/open.c.
> > > > >
> > > > > The specification documents parameter constraints (pathname, flags
> > > > > bitmask, permission mode), 24 error conditions, locking requirements,
> > > > > side effects, required capabilities, and usage examples.
> > > > >
> > > > > Assisted-by: LLM
> > > > > Signed-off-by: Sasha Levin <sashal@kernel.org>
> > > >
> > > > I know Kees and Jonathan and others asked for exactly this.  But one
> > > > downside to this is it makes just paging through fs/open.c a lot more
> > > > painful.  Maybe it's worth it.  Maybe "noone will ever do that again" bc
> > > > that's why we have ai and tools.  But a) that's how I've historically
> > > > done a lot of code research, b) IMO something like a manpages section 2
> > > > under Documentation/ would be a great place for this, and c) we can also
> > > > use tools to always sync these, or even show/edit in a single view when
> > > > you want  ('kdocedit fs/open.c').
> > > >
> > > 
> > > In many, many other projects i've worked on, these docs are placed in
> > > the header as opposed to the .c file, but I understand there is some
> > > pain that comes with ifdef.
> > > 
> > > Keeping it in the header ties the definition to exactly the location
> > > external users import to find the function - so it makes sense.
> > > 
> > > But separating the contracts from the code guarantees they'll go stale,
> 
> My plan is to be able to have the more detailed part of these specs somewhere
> else, specially as they will grow some more, but I didn't want to add this
> complexity right now.
> 
> > OTOH these descriptions are so long that IMO they are guaranteed to go
> > stale anyway :)  While I'm editing a return value at the bottom of the
> > fn, most or all of the description is already going to be off my
> > terminal.
> > 
> > > so I don't think shoving it in Documentation/ does anyone any good.
> > 
> > If every build auto-generates an update and then looks for and flags
> > meaningful changes (API breakages), then a) that is more reliable and b)
> > it doesn't matter where the docs are.
> > 
> > Even if there's just a three line comment above a fn, history proves
> > that it will not reliably stay in sync as the fn changes.  An automation
> > step/check is needed.
> 
> Please see CONFIG_KAPI_RUNTIME_CHECKS added by this series.

My point was just that whether the docs are inline or not, they will go
stale without that automation.  So if that's the case, then the docs do
not need to be inline.
