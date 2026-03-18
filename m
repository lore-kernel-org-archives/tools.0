Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16BE3B8BB0
	for <tools@linux.kernel.org>; Wed, 18 Mar 2026 13:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773840378; cv=none; b=ARByDK2SrBRW5MTtt0XXOKeJeZNxbIITRKyqAMlFO4JqXN+d7oehHN9C6NgL76Mxdxv1liUkM6c1Aq5mWOujBm4uGNcdfRqHnqloHR4yxZjeOMUZHz/ksVaedloORIdFBLbuSEw6JVYDB5QChpP0hlAcTP3xgd837g3950ZdQ1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773840378; c=relaxed/simple;
	bh=JxSvXTY6xaOYwEWgMvVpBVsgPkK/8AolnaXGBRKMYLs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lc7Lku9FvuVydOaWlBASMy+v+dS4IiZJp106j81fw/4xLDtuqSi95gGyQTc9UhMsel7OkoMCpjf4jlENEQXMe5CYKfXjiH2qgX9hk/eivk1AmZoN3m4b/7oT910JKlr6A0vaTQPdw+K0npP/fSatAhqTDtzdLEZQWNSk28rq8gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D25/oQuc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D25/oQuc"
Received: by smtp.kernel.org (Postfix)
	id 8D4DEC2BCAF; Wed, 18 Mar 2026 13:26:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54182C19421;
	Wed, 18 Mar 2026 13:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773840378;
	bh=JxSvXTY6xaOYwEWgMvVpBVsgPkK/8AolnaXGBRKMYLs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D25/oQucmm5z0x48R6L8YbnmzYNw4hKWlv8rTf7C7yw00SwpRm81ZzEupZ+CIX/Uf
	 Knd2456P6xme7Jq/DA4Y3lWR5pqtt5jRngjQU6Fg0B9ralvyqeMEbqd+oT1PE5EAay
	 V+iKOV7eayKpD18Rid7QFqG1nRIK1XCCqn1UdcPNGo0089GUVTlKVq1+D69Bt/JzOH
	 8GRW24jWwb56gtVMyAF2OKh3T2lZZEg1xMHWBbuzzykYW8NzrHJ/IjjZ1TTcaKVDvi
	 K62aEC3fxPoM+dOfMvGk2wxUTpcZRc+0Pl5Va8aqe2ZcOevRPm7xHEP4ym4Mt0hbfq
	 t6O6MBc/zPc1Q==
Date: Wed, 18 Mar 2026 09:26:17 -0400
From: Konstantin Ryabitsev <mricon@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Jonathan Corbet <corbet@lwn.net>, users@kernel.org, tools@kernel.org
Subject: Re: b4 review available in master
Message-ID: <20260318-hallowed-hare-of-enhancement-ac01e1@lemur>
References: <87tsuffj7h.fsf@trenco.lwn.net>
 <87h5qffikk.fsf@trenco.lwn.net>
 <20260316-quizzical-raccoon-of-refinement-d88fdb@lemur>
 <87qzpieeb5.fsf@trenco.lwn.net>
 <20260317-starling-of-delightful-exercise-3472ce@lemur>
 <20260317-optimistic-impartial-kudu-deefac@lemur>
 <87o6km86zm.fsf@trenco.lwn.net>
 <20260317-crazy-belligerent-llama-a14ba6@lemur>
 <20260317-majestic-efficient-raptor-59f17a@lemur>
 <CAMuHMdVTLdeNr3gk7aE33+Kgedw+j3fmdaZ6CO9iDnNGsUxcGg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdVTLdeNr3gk7aE33+Kgedw+j3fmdaZ6CO9iDnNGsUxcGg@mail.gmail.com>

On Wed, Mar 18, 2026 at 08:56:56AM +0100, Geert Uytterhoeven wrote:
> > However, I am now curious to hear your feedback. The idea with the review app
> > is that you are not really sending an email, you're adding comments to code
> > and adding review trailers. The app will render and send that out for you,
> > trimming and formatting things nicely so you don't have to do it on your own
> 
> I haven't tried b4 review yet, but how do you decide what (not) to trim?
> It is not uncommon to explicitly not trim some parts, as they are important
> to understand the comment on a seemingly unrelated part.

We are obviously opinionated, but so is git, which by default gives 3 lines of
before/after context. Our logic is:

- always leave file and hunk headers intact
- give at least 6 lines of context above your content (double git's)
- check the remaining lines between the previous comment or the hunk start
  (@@ .. @@) and trim if more than 10 lines, replacing with
  [... skip NN lines ...]

If you're commenting on some code that requires a lot of context, it's easy to
do:

    Let's look at this chunk:

    > context
    > -bar
    > +foo

    Using foo here is not correct.

    > context
    > context
    >-baz
    >+quux

    etc

But, honestly, I think we're giving lots of context for the original
maintainer to understand what the comment is about, and since the file/hunk
headers are there, they can always find the code in question.

> > (I've noticed that many maintainers don't bother anyway -- there are emails
> > with a terse comment at the top and then a huge quoted bottom that is only
> > followed by their sig.
> 
> IMHO this is very bad behavior: not trimming replies forces everyone
> to skim the remainder for more comments.

I wholeheartedly agree, but pointing and shaming probably isn't the right
course of action.

Regards,
-- 
KR
