Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4A03C14;
	Tue, 19 Jul 2022 15:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1658245113;
	bh=3FCWIsu6Y4N+wX1+FNrHdx4szHvh4CWN5wMDUXEg7xo=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=Nn0rPPio3OcEvjxSuqPLZEzgL6PdGgoA1NyZn6AUSyq9Ozt8dCNcFytG+Lw5BfPtQ
	 Izu3AzljuJqmJfeqQebaEOOtQMvoDYwmnL3J+CAt4/VDFhAxIVxGcK/jpHWxdYJkn/
	 iy8gqvFqsh5wH/dEgWR0q/tr5B3NNNuFEDE76/zQ=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 9332E1287D08;
	Tue, 19 Jul 2022 11:38:33 -0400 (EDT)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
	by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qHwBWngjIUud; Tue, 19 Jul 2022 11:38:33 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1658245113;
	bh=3FCWIsu6Y4N+wX1+FNrHdx4szHvh4CWN5wMDUXEg7xo=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=Nn0rPPio3OcEvjxSuqPLZEzgL6PdGgoA1NyZn6AUSyq9Ozt8dCNcFytG+Lw5BfPtQ
	 Izu3AzljuJqmJfeqQebaEOOtQMvoDYwmnL3J+CAt4/VDFhAxIVxGcK/jpHWxdYJkn/
	 iy8gqvFqsh5wH/dEgWR0q/tr5B3NNNuFEDE76/zQ=
Received: from [IPv6:2601:5c4:4300:c551:a71:90ff:fec2:f05b] (unknown [IPv6:2601:5c4:4300:c551:a71:90ff:fec2:f05b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id C36FC1287D01;
	Tue, 19 Jul 2022 11:38:30 -0400 (EDT)
Message-ID: <3c86badd79c61bb71beb707f7bc2ea682ac9ae48.camel@HansenPartnership.com>
Subject: Re: b4 submit ready for beta testing
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
	users@linux.kernel.org, tools@linux.kernel.org
Date: Tue, 19 Jul 2022 11:38:25 -0400
In-Reply-To: <20220719153402.GJ5049@ziepe.ca>
References: <20220716142954.voq4ucnl5wkq7h2b@nitro.local>
	 <4c4652b0e333bd81b91f71346ac6142322682eff.camel@HansenPartnership.com>
	 <20220716145638.ubuwwc7xtjw6ugy7@meerkat.local>
	 <6ad8ce3aa0d14d8a09a3c117affe19928a44f639.camel@HansenPartnership.com>
	 <20220717160218.a5ccu4chbaoj3uxv@meerkat.local>
	 <20220718181732.GC5049@ziepe.ca>
	 <d99a81d4f725eda056722b17c8749e8b96735e75.camel@HansenPartnership.com>
	 <20220719153402.GJ5049@ziepe.ca>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Tue, 2022-07-19 at 12:34 -0300, Jason Gunthorpe wrote:
> On Tue, Jul 19, 2022 at 09:01:36AM -0400, James Bottomley wrote:
> > On Mon, 2022-07-18 at 15:17 -0300, Jason Gunthorpe wrote:
> > > On Sun, Jul 17, 2022 at 12:02:18PM -0400, Konstantin Ryabitsev
> > > wrote:
> > > 
> > > > Perhaps, but I also have other reasons to like using an empty
> > > > commit for this. For example, it makes it very easy to mark
> > > > where exactly our series starts.
> > > 
> > > It is a good point, but it is backwards to how alot of people
> > > have been doing things already for a long time..
> > > 
> > > Putting the commit last makes it work a lot more like the usual
> > > merge-commit approach to preserve the cover letter. Particularly
> > > if you open the branch in any of the web viewers for git, or gitk
> > > you get a very nice view of the cover letter explaining the
> > > branch followed by the usual code in reverse patch order.
> > > 
> > > It would be nice to use merge commits to mark the series
> > > boundary,
> > > but IMHO, the tooling is poor for this.
> > 
> > The problem with empty commit is that a lot of the projects I
> > contribute to can be pains about only taking one or two commits in
> > a series, which means I use rebase to figure out the exactness of
> > what they've done and drop included commits.  I can't keep this
> > behaviour and work with empty commits.
> 
> Why not? rebase works fine with empty commits.

Because I don't want a load of non-cover letter empty commits in my
repo.  The problem is the current behaviour is all or nothing and I
want elimination of commits that did have code but now don't but not
elimination of the empty commit for the cover letter.

James


