Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7EF672;
	Wed, 14 Apr 2021 07:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=dVOlYeJKK5z0gCsQp67hoLEH+M1gSP5zrb1Qt0UN4Dk=; b=XOcbKxFZ6I6R50AGVafPGhyl2Q
	vYSgskrlxjKtBuJssWkxm6UADq0/mCQgBlDkRh9L9i4swPG2G+cV9CAI4WzTPXslSSmd8KbMJuydR
	S3hFp2f9/7GMVLxUxb/JP0FgZSottMHrvUFnlyYTuk1Qks8aU8jWimxHTxyUKjEghXD75mECleKRr
	YbJwGd8O+d/iUfn95fud2aB0JN1vLqjLj8F6qCeJLePCx7JgsmhomNo16uB+HesXW/XyhGi+68rRy
	CnTcYz0VV/sNiL5+EOaQs/kEaVzME6VEubCV35eBbupFaxHbGtI5pBkBkxfXxr4Xi9tGYWTfINng9
	Ja6cqDsg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
	id 1lWZzH-006o1N-4B; Wed, 14 Apr 2021 07:31:01 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 54CFB3001F6;
	Wed, 14 Apr 2021 09:30:58 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 0EE8A203CF7D1; Wed, 14 Apr 2021 09:30:58 +0200 (CEST)
Date: Wed, 14 Apr 2021 09:30:57 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Steven Rostedt <rostedt@goodmis.org>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>, Alex Elder <elder@ieee.org>,
	users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: RFC: Superseded-by: follow-up trailer
Message-ID: <YHaaMaa2uaa6HM9c@hirez.programming.kicks-ass.net>
References: <20210413204932.yovoa7njwc56jo5v@nitro.local>
 <fd732fc9-83a9-5502-fba5-f08317bdcaf3@ieee.org>
 <CAHmME9pFqm00ibpqhQQ9_P61F7mU12yrcOvdNSDYDz8ot8HJDg@mail.gmail.com>
 <20210413172901.1465307c@gandalf.local.home>
 <20210413214031.fenjvgh5helyuqdz@nitro.local>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210413214031.fenjvgh5helyuqdz@nitro.local>

On Tue, Apr 13, 2021 at 05:40:31PM -0400, Konstantin Ryabitsev wrote:
> On Tue, Apr 13, 2021 at 05:29:01PM -0400, Steven Rostedt wrote:
> > Now, I would really like the Supercedes: tag, as its just a link you need,
> > and not a email sent. Ideally this would be in all the patches (with a
> > direct link to what it Supercedes. I may update my scripts to do exactly
> > this, as I always add a "Link: " to the last version, and that's in my
> > repo. Or perhaps b4 could add this too!
> 
> I'd rather folks used the following notation in the cover letter/patch
> basement:
> 
>     Previous versions:
> 
>     Link: https://lore.kernel.org/r/foo # v2
>     Link: https://lore.kernel.org/r/bar # v1
> 
> This is much more succinct, indicates the version number in the trailer, and
> removes the need to remember how to spell "Superseded", as there seems to be
> little consensus. :)

How would you handle the difference between the above and:

Depends on:

Link: https://lkml.kernel.org/r/foo

Which is also a semi common thing to do with larger work that comes in
multiple dependent series.

That is; I supppse; a long winded way of saying that for parsing (both
human and machine) it might be useful to have distinct tag names. Now I
agree with you that Supersedes is a crap word to spell, but it has the
distinction of being clear on intent.

So my 2ct go to adding Supercedes: and Depends-on:

(Alternatively, Replaces: ?)
