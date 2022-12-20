Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D87E7E;
	Tue, 20 Dec 2022 20:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=yAEJ4arcNRKMH6cEcaTJbA0LD/+I31FTADKQ5r0OU0o=; b=hZE9DREuJvA6iLWTdh9ANt7BWy
	MzGPgfOlY10wqhm/hNw2weoVb/CDe0+x3LB1EbysCUoB36aNd/Bn6TDhuPjiJEyyVu9+8ih7pCPEO
	uF0rUSNMpXy8n0yUaBCOPgG6oLBTMLEEyzOsroo4XapeGrmuos62uwoxTgWpeKeMJNMNX95aBkudx
	m4Yk9OkXeWUCpxbuF1JNPdEMyjK5iRw0LkEUddCPeCc7eVLNmLsINbdC/AXlvU28v+YiTJAcqytmN
	ygY6sRiOZrssj/mkRz5/cU5qHVMPKQoHz02fKXWoe53cfoomb5xxCqBsrr+en9H3owU8pM/RllHoK
	KXt/WOhA==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7jPR-002A8F-1A; Tue, 20 Dec 2022 20:40:21 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id B95AA300193;
	Tue, 20 Dec 2022 21:40:09 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 58E2C2138E710; Tue, 20 Dec 2022 21:40:09 +0100 (CET)
Date: Tue, 20 Dec 2022 21:40:09 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org, users@linux.kernel.org
Subject: Re: b4 v0.11.0 available
Message-ID: <Y6IdqeOfLMrBrFiL@hirez.programming.kicks-ass.net>
References: <20221219213715.2qozw5emt5j7t3xr@nitro.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221219213715.2qozw5emt5j7t3xr@nitro.local>

On Mon, Dec 19, 2022 at 04:37:15PM -0500, Konstantin Ryabitsev wrote:

> Special thanks to the following people who helped with this release, in
> reverse-git order:

>     Peter Zijlstra <peterz@infradead.org>

For whoever cares; the below is part of my .muttrc that uses the new
feature:

  set pipe_split=no
  set pipe_sep="\n---9094415c807d3d9a7e592fe6307c363eec028754---\n"
  macro index B "<tag-prefix><pipe-entry>b4 am -slt --stdin-pipe-sep='\\n---9094415c807d3d9a7e592fe6307c363eec028754---\\n' -m - -o - | formail -s ~/mutt/mutt-pipe.sh<enter><untag-pattern>~T<enter>"

This pipes all tagged messages into b4 to collect any tags therein and
has it write an mbox to stdout, which is then exploded using formail and
fed into a script that adds it to a quilt series.

Typical usage for me would be to tag a thread using esc-t, possibly
untag some of the later patches and press 'B' to siphon the selected
patches into quilt.

An obvious alternative for the more git centric folks would be to modify
the above into something using b4 shazam.
