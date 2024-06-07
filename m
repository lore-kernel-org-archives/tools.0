Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643B3DDC9
	for <tools@linux.kernel.org>; Fri,  7 Jun 2024 19:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717788630; cv=none; b=hbpr5j2FrRltRBUGx5N+Glk3rxATYKlq5MJthkT90P45FiU1vjLOoHlahq6Am5ae3XdQaKqW6bGyU/e9LPxBUOQz46IWOZEPCNX32WyPpot8K1V1ebbUsSsh9j+YI/cIN6+RAJid0XCs5MACXyCwqZUHT4TKA+KdsflOLWTtrqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717788630; c=relaxed/simple;
	bh=ec+6likjupSRGqNHhEEhQaVu0SIWw4OXh5KJyaGg8U0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AsbWSL/ywIilBYFCqS9qT4EHruuEzCMAd/Gld/VI93i7t4734yScjjfw5ILZuOpiHEczTKiXhZwQjEmKX42J6qM3/OHD07Poz2zBbH5HOJ/WXeBYvjBmJXclB7/9F7+aA//L3B1Hj882AhYJxUobfqUe0KptdRX0yRoRxQC7Oxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=C+mtCJlR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="C+mtCJlR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6184C4AF08;
	Fri,  7 Jun 2024 19:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1717788629;
	bh=ec+6likjupSRGqNHhEEhQaVu0SIWw4OXh5KJyaGg8U0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C+mtCJlRokzJSJ5bq5eAModDWhK8lwWjv44nW+Pgi3OPtjlAoOO1Uqj7r5HBCHZYD
	 Fj5bwmceG3gQbGF8CNd4wbMnUAqmA6m4FiE4en/d9hVfBJCZPGf33/HChJrjdgPZN6
	 Bv3n8HIZ9Rf52k2/K/QknahIF/35s6HnH6KKp8Qk=
Date: Fri, 7 Jun 2024 15:30:28 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools <tools@linux.kernel.org>
Subject: Re: Trailer updates to git commits not working
Message-ID: <20240607-practical-aboriginal-lionfish-b8b4ca@lemur>
References: <15b55c55-8060-4c46-b545-3a3e774a9875@sirena.org.uk>
 <20240603-opal-wolverine-of-tempest-7a8939@lemur>
 <da75a55b-a698-4723-958c-6ee5e3b55104@sirena.org.uk>
 <20240603-frigatebird-of-unearthly-satiation-62b1ff@meerkat>
 <020408d3-4918-47bd-b8de-5ca89de72935@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <020408d3-4918-47bd-b8de-5ca89de72935@sirena.org.uk>

On Mon, Jun 03, 2024 at 06:51:36PM GMT, Mark Brown wrote:
> > > Ah, that's me being confused about what --since is supposed to do!  I
> > > had been under the impression that it was letting me specify a commit
> > > from which to apply updates (now I look at the full help I do see that
> > > it says that the default is a time range style thing).  I didn't realise
> > > it was a passthrough to the git log option.  In that case this is a
> > > feature request for a way to specify which commits to update trailers
> > > for, the use case is collecting tags as I apply patches on top of
> > > already published commits.
> > 
> > So, like a --since-commit [commit-ish] ?
> 
> Yes, exactly.

Okay, so with the latest master you should be able to just do something like
this:

    b4 trailers -u --since-commit [commit-ish]

You don't have to specify anything else -- we'll query lore for any matching
patch-id's and bring them in for any commits where you're the committer.

This should simplify the workflow where you're queuing up a bunch of patches
for sending upstream and just want to make sure that you apply the latest
trailers that were posted.

I'll be happy if you trial it out. It shouldn't do terrible things to your
tree, but it may bring in surprising results -- e.g. a patch may also end up
included into a stable AUTOSEL series, receive a Tested-By there, and that
Tested-By will end up in your commit. The UI will now show where we're getting
trailers, but there isn't yet a way to exclude things you don't want.

-K
