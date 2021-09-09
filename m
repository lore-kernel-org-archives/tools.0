Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4DE72;
	Thu,  9 Sep 2021 14:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=jGdN2vpPbvW1JzAYWyL0u3akhPc1txslcu85hdkpFw4=; b=Ka3zT6bPaoD0vKUiKOiEKgrMPj
	4hxpKTQ7Hl2M0JipnikmEAJJvCk8JJ4tOLKa/OjoRdT/6s1w0u0N1LHj8RYXMJZnjo95a94Vb4Gtn
	tFvIYECi12Xm9XphGXoRcCz6qjjdFCC0nckXnyLB3EXsWyP8Q0rfOQ8SEny0+xedohNGeix59qgxn
	+OPSPEBv2B9yx+EN7M+JUNerEXlVasC3USay2COhJMa45sqSqFylluOo3qw8Hl3ot867/tqeKrJFo
	S3s9GDR3x3Zlz24BqdAxddNDcTix4c0+eIje9ifcCCHxJbGs60HLF8IxP1TvfR04h73DK2iHR7j6N
	Kc94zbqQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mOLP1-00A7K5-Tr; Thu, 09 Sep 2021 14:51:52 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id AC9753000A9;
	Thu,  9 Sep 2021 16:51:46 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 5F08220C09052; Thu,  9 Sep 2021 16:51:46 +0200 (CEST)
Date: Thu, 9 Sep 2021 16:51:46 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Lee Jones <lee.jones@linaro.org>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Jason Gunthorpe <jgg@nvidia.com>, users@linux.kernel.org,
	tools@linux.kernel.org
Subject: Re: New version of lore available for preview
Message-ID: <YTofguBdkTO5ReBb@hirez.programming.kicks-ass.net>
References: <20210818190750.g3xedu7j24sqndo2@nitro.local>
 <20210902195332.GA2493828@nvidia.com>
 <20210902201402.bbdttirbb5ckrtiz@meerkat.local>
 <CAK7LNAQogtzDbAFDtRt7UvDkH6K4tkQgwfmu-2_0rGgo_Uj_iw@mail.gmail.com>
 <20210903152143.nt5mzgwprltl36pa@meerkat.local>
 <CAF2Aj3jbU_vnKvYB2EJXuKdTCeJx3dgZY2h7sriJX4fP6Fsteg@mail.gmail.com>
 <20210908183746.iancht34j3drun77@meerkat.local>
 <20210909084907.271b6df5@gandalf.local.home>
 <YToM6bH/I9rHQMeE@google.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YToM6bH/I9rHQMeE@google.com>

On Thu, Sep 09, 2021 at 02:32:25PM +0100, Lee Jones wrote:
> Does b4 provide this functionality too, or do I have to script around
> it?  How have other's chosen to automatically apply the downloaded
> mboxes?

My .muttrc has:

macro index B "<tag-prefix><pipe-entry>formail -ds | b4 am -slt -m - -o - | formail -s ~/mutt/mutt-pipe.sh<enter><untag-pattern>~T<enter>"

(which relies on that same muttrc having: set pipe_split=no)

which allows me to tag a (partial) thread using ESC-t (or otherwise) and
apply the resulting lot (with folding of tags and adding signature and
all the goodness) to my quilt series (as done by my mutt-pipe.sh
script).

The initial "formail -ds" is required because mutt pipe output isn't
exactly the mbox format b4 expects and formail basically reformats it,
it's mbox in mbox out. Then b4 takes the mbox, folds tags and generates
a reduced mbox with only patches; formail then splits it and my old and
trusty mutt-pipe.sh frobs it into quilt one at a time.

