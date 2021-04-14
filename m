Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568386D28;
	Wed, 14 Apr 2021 15:01:05 +0000 (UTC)
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 3EB9A6120E;
	Wed, 14 Apr 2021 15:01:04 +0000 (UTC)
Date: Wed, 14 Apr 2021 11:01:02 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>, Peter Zijlstra
 <peterz@infradead.org>, "Jason A. Donenfeld" <Jason@zx2c4.com>, Alex Elder
 <elder@ieee.org>, users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: RFC: Superseded-by: follow-up trailer
Message-ID: <20210414110102.18234650@gandalf.local.home>
In-Reply-To: <20210414143618.GN227011@ziepe.ca>
References: <20210413204932.yovoa7njwc56jo5v@nitro.local>
	<fd732fc9-83a9-5502-fba5-f08317bdcaf3@ieee.org>
	<CAHmME9pFqm00ibpqhQQ9_P61F7mU12yrcOvdNSDYDz8ot8HJDg@mail.gmail.com>
	<20210413172901.1465307c@gandalf.local.home>
	<20210413214031.fenjvgh5helyuqdz@nitro.local>
	<YHaaMaa2uaa6HM9c@hirez.programming.kicks-ass.net>
	<20210414114950.GM227011@ziepe.ca>
	<2f6c16aea7593e25d51ed54501d462443d4b9012.camel@HansenPartnership.com>
	<20210414143618.GN227011@ziepe.ca>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 14 Apr 2021 11:36:18 -0300
Jason Gunthorpe <jgg@ziepe.ca> wrote:

>    People seem to struggle to both narrow the CC list of individual
>    patches series and still CC things like the cover letter to
>    everyone.

As someone that still uses quilt send --mail (I'm much more comfortable
that it will send the right thing than I am with git send-email), it
struggles with the above. I haven't had time to fix it to allow you to Cc
everyone the cover letter but narrow the individual patches.

It only sends all patches to anyone on the cover letter :-(

-- Steve
