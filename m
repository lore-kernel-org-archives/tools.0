Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9476D28;
	Wed, 14 Apr 2021 15:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=eXEBeiSb1nsTQ27jYwtIrFbTKjugdP82HIDQ/1Tw5Xg=; b=AVG/qhmfDpYcBxjg2WIfgml0Bo
	nsI9KkxQzNRGxMo4Qj/GZxYruiMLeA0SHYQtsEMZsj6ZVvoWmltZ7hOqeA9O7JZ4igWmpModh0MrJ
	5nMIDeJXKeZxZsTXzsv8TGlJMtjeTrXirrCtxP0ivmvtzYxghu4xttr2i0L2adNfWSxUZP6NEcuCl
	lshEJq9WIqPNsg79I9c+Rms194PBeSrout/P++5wePyruOoLgnTwRgwJoBTkPZsebw+3/C0fZzWP1
	ETjbXHbA5txTqp6/wRR2uybcPSPT4AFUQgs+jPE81bQvKXVDV7XOzODmjA5JaTxdTvUkbdS4doqEj
	kiRNRWhQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
	id 1lWhYg-007IKk-IZ; Wed, 14 Apr 2021 15:36:16 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 08ACF30015A;
	Wed, 14 Apr 2021 17:36:01 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id AC5FC2023B124; Wed, 14 Apr 2021 17:36:01 +0200 (CEST)
Date: Wed, 14 Apr 2021 17:36:01 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>, Alex Elder <elder@ieee.org>,
	users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: RFC: Superseded-by: follow-up trailer
Message-ID: <YHcL4ZsRYoBf4uRI@hirez.programming.kicks-ass.net>
References: <20210413204932.yovoa7njwc56jo5v@nitro.local>
 <fd732fc9-83a9-5502-fba5-f08317bdcaf3@ieee.org>
 <CAHmME9pFqm00ibpqhQQ9_P61F7mU12yrcOvdNSDYDz8ot8HJDg@mail.gmail.com>
 <20210413172901.1465307c@gandalf.local.home>
 <20210413214031.fenjvgh5helyuqdz@nitro.local>
 <YHaaMaa2uaa6HM9c@hirez.programming.kicks-ass.net>
 <20210414114950.GM227011@ziepe.ca>
 <2f6c16aea7593e25d51ed54501d462443d4b9012.camel@HansenPartnership.com>
 <20210414143618.GN227011@ziepe.ca>
 <20210414110102.18234650@gandalf.local.home>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210414110102.18234650@gandalf.local.home>

On Wed, Apr 14, 2021 at 11:01:02AM -0400, Steven Rostedt wrote:
> On Wed, 14 Apr 2021 11:36:18 -0300
> Jason Gunthorpe <jgg@ziepe.ca> wrote:
> 
> >    People seem to struggle to both narrow the CC list of individual
> >    patches series and still CC things like the cover letter to
> >    everyone.
> 
> As someone that still uses quilt send --mail (I'm much more comfortable
> that it will send the right thing than I am with git send-email), it
> struggles with the above. I haven't had time to fix it to allow you to Cc
> everyone the cover letter but narrow the individual patches.

If you really want to do daft things like that, just edit the mbox. I
mostly just send everybody everything. We all get too much email as is,
we should be able to ignore a few more emails a day.

