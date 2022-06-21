Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6001F7483;
	Tue, 21 Jun 2022 19:42:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5840AC341C4;
	Tue, 21 Jun 2022 19:42:27 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="GnXVJMH7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1655840545;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rpPjOvVyO9tHZrMgu98VjvG4nIBR0UJYjYPCaiF52NY=;
	b=GnXVJMH7R8B2jJnRsPRizn2844DFONOz9UKHeMCL+2EL4Ck36/rx5WvO5rfqvc5luRwcj7
	EUsfYPj1V0ChjyRhurdGftrftXK4R1N7dG1YOl5W/cNNhJLT4Qb6wuHvaduQ0AUMNaa8q7
	DW9Qo6JXrxivavQxHgPf5505s35+nVg=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 78569f5e (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO);
	Tue, 21 Jun 2022 19:42:24 +0000 (UTC)
Date: Tue, 21 Jun 2022 21:42:22 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linuxfoundation.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>, tools@linux.kernel.org,
	users@linux.kernel.org
Subject: Re: b4-0.9.0 available
Message-ID: <YrIfHvaxCUVfQ7D8@zx2c4.com>
References: <CAMuHMdV4AHH1TM6xf26MP0-dUQ0-fB+62GeeuVuth9pgWgdu7Q@mail.gmail.com>
 <20220621152903.czivp7fdn6me775i@meerkat.local>
 <CAMuHMdWz8=Zr8hnXNGBZVfe70F8oVdK670Z41=Dtib0GMDgAug@mail.gmail.com>
 <CAHk-=wiQzp+aurcmj15=LAa2ntvRZH0Ee2dn-PLjcFpmRE6Jcw@mail.gmail.com>
 <CAHmME9p+zRErOsvA1zC=kTHtpYD_sGjFxVsj0pMwteAp4dCdjQ@mail.gmail.com>
 <20220621165953.z25hwos7gom6bp6s@meerkat.local>
 <YrIEnmt5vDMcbOiG@zx2c4.com>
 <20220621182953.p5asczznnz3pn6dl@meerkat.local>
 <YrIR2v7GdC3qIt2E@zx2c4.com>
 <20220621192724.ls6q6fyr6ehtsyah@meerkat.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220621192724.ls6q6fyr6ehtsyah@meerkat.local>

Hi Konstantin,

On Tue, Jun 21, 2022 at 03:27:24PM -0400, Konstantin Ryabitsev wrote:
> I think the discussion veered towards "don't call it Link:", not "don't link
> to it at all". Without "BugLink" in the running, the next winning option was
> "Archived-at:" and I am considering towards making -l add that trailer
> instead, with the custom msgid.link domain, to further distinguish it from
> "hand selected" lore links:
> 
>     Archived-at: https://msgid.link/20220617190153.tvi5lkzlvemeqou5@meerkat.local
> 
> I am not currently working on that, though, so I'm happy to go either way,
> including making -l a "does nothing" switch.

Oh. I thought it wound up concluding that none of this was necessary and
instead the tooling could be fixed server-side, so that you could have
patchwork query "hey which mailing list post is patch 0123456789abcdef?"
and it'll tell you that, or vice versa, especially since it's not always
clear which patch version is the most relevant, as sometimes things are
tweaked after the fact, and so some fuzzy sorting is usually required.
In other words, no need to store this inline with commits, and a service
can handle that more flexibly anyway.

> > - Don't reorder `Signed-off-by:`. The simplest thing to do would be to
> >   remove the `trailer-order` option all together. But some people do
> >   want to sort the trailers (within each S-o-b segment) for aesthetic
> >   purposes. So if you don't want to take that away from them, maybe
> >   S-o-b needs to be unconditionally special-cased so that it forms a
> >   reorder barrier.
> 
> This is already the case for all trailers -- we *group* them by trailer name,
> but the *order* in which they are written is preserved. E.g. with the config
> option trailer-order="reported-by,reviewed-by,signed-off-by,*', we go from:
> 
>     Signed-off-by: Ze Developer <ze@example.dev>
>     Reviewed-by: Some Rando <rando@example.dev>
>     Reviewed-by: Managing Rando <mgmt@example.dev>
>     Signed-off-by: Awesome Maintainer <aw@example.dev>
>     Reported-by: Bug Finder <bug@example.dev>
> 
> 
> to:
> 
>     Reported-by: Bug Finder <bug@example.dev>
>     Reviewed-by: Some Rando <rando@example.dev>
>     Reviewed-by: Managing Rando <mgmt@example.dev>
>     Signed-off-by: Ze Developer <ze@example.dev>
>     Signed-off-by: Awesome Maintainer <aw@example.dev>
> 
> Perhaps I should call the setting "trailer-grouping" instead of
> "trailer-order" (it's called that because we did reorder them alphabetically
> at some point in the distant past when the feature was first implemented).

I don't know what that first block is, since the Reported-by comes after
a Signed-off-by line, which means it's already ambiguous and wrong. But
even if we throw away that line, your new snippet is still wrong, since
now it shows Ze Developer having collected those Reviewed-bys, when
Awesome Maintainer is the one who did it.

In other words, if we start with this:

     Signed-off-by: Ze Developer <ze@example.dev>
     Reviewed-by: Some Rando <rando@example.dev>
     Reported-by: Bug Finder <bug@example.dev>
     Reviewed-by: Managing Rando <mgmt@example.dev>
     Signed-off-by: Awesome Maintainer <aw@example.dev>

A valid reordering is this:

     Signed-off-by: Ze Developer <ze@example.dev>
     Reviewed-by: Some Rando <rando@example.dev>
     Reviewed-by: Managing Rando <mgmt@example.dev>
     Reported-by: Bug Finder <bug@example.dev>
     Signed-off-by: Awesome Maintainer <aw@example.dev>

But NOT:

     Reviewed-by: Some Rando <rando@example.dev>
     Reviewed-by: Managing Rando <mgmt@example.dev>
     Reported-by: Bug Finder <bug@example.dev>
     Signed-off-by: Ze Developer <ze@example.dev>
     Signed-off-by: Awesome Maintainer <aw@example.dev>

Since the bad one obscures who collected the tags.

The prevailing idea is that each hop in the custody chain has their
"S-o-b area", which is the zone above their S-o-b and below the previous
S-o-b. Sometimes such areas accumulate text too, such as:

  [ Replaced turboencabulator jet fuel with diesel. ]

So if you sort, fine, but don't sort across S-o-b lines. Those form an
ordering barrier.

Jason
