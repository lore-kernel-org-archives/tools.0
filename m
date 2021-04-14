Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E50296D28;
	Wed, 14 Apr 2021 15:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=daVbitaX4bXG6VEVUkQl6DZmLD1KyXTAhayzP33R2JY=; b=FraBv0f/2FqOvcLgXUFZG2EKKL
	f44k9lEmrJ0RrjVhnGs7EYl740Sci+lRRBtlJWPC3smTwl8umYYILiDiMV+/jZxdSP7uqGUHIM4dw
	JznfdSeE5ZD582mQRamzdm26WLggQbp2lFZU6WHiQTkzQWRUrbiq2EJM32DgueTP9OvA1EXhKQBDY
	AL7MYRjoxeWwSCZ/V4xWGNKGSx2R8E13UzlfYfQKuwNPtXjPyuQkoLAPY4ikDmxw6ec6phi09Rrz5
	Zo13Nyrim1TdOVrxGuFSWsPeBWdb+teV+or2vCu8tbokQ8h02ZD6Y2/tgA3Er06r8+/5UO/iptH0d
	SBwATALA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
	id 1lWhAA-007GiQ-Na; Wed, 14 Apr 2021 15:11:00 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 7ADE8300222;
	Wed, 14 Apr 2021 17:10:41 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 297262065A492; Wed, 14 Apr 2021 17:10:41 +0200 (CEST)
Date: Wed, 14 Apr 2021 17:10:41 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Steven Rostedt <rostedt@goodmis.org>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>, Alex Elder <elder@ieee.org>,
	users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: RFC: Superseded-by: follow-up trailer
Message-ID: <YHcF8YE2BNjUvmL/@hirez.programming.kicks-ass.net>
References: <20210413204932.yovoa7njwc56jo5v@nitro.local>
 <fd732fc9-83a9-5502-fba5-f08317bdcaf3@ieee.org>
 <CAHmME9pFqm00ibpqhQQ9_P61F7mU12yrcOvdNSDYDz8ot8HJDg@mail.gmail.com>
 <20210413172901.1465307c@gandalf.local.home>
 <20210413214031.fenjvgh5helyuqdz@nitro.local>
 <YHaaMaa2uaa6HM9c@hirez.programming.kicks-ass.net>
 <20210414143504.l3txdpd6xbcf6qh5@nitro.local>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210414143504.l3txdpd6xbcf6qh5@nitro.local>

On Wed, Apr 14, 2021 at 10:35:04AM -0400, Konstantin Ryabitsev wrote:
> Hmm... there is an officially sanctioned way to indicate patch
> interdependencies using "prerequisite-patch-id:" footers (see
> https://git-scm.com/docs/git-format-patch#_base_tree_information).
> 
> That said, I've never seen anyone actually use them, I guess for two reasons:
> 
> 1. it's per-patch, not per-series
> 2. it requires running "git patch-id" on each patch in the dependencies

I'm not using git, not for making patches, not for sending patches, and
reading this thread makes me glad I'm not. It looks super painful in all
respects.

As to the original proposal, I'm with Steve, I'd never bother to dig out
the old thread (in fact, it's not even in my Sent folder).

As to the pain mentioned elsewhere, I'm not having that, I have an mbox
of the old submission laying about that I use as a basis for the new
submission, so I have all Msg-IDs right there.

Maybe the new-fangled tool you all need on the submission side already
exists, it's called quilt :-)
