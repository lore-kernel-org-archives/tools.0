Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84C02F80;
	Fri, 10 Sep 2021 17:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=rikF0tbpYtoMm3bGSkd5LyOowNCtvftmnzK1UgfTTRo=; b=bB3vv2yRivHxoZdvN9RYvGQFb7
	GMswK+FB8Kdzl7SmQBNXjP1UpGVPp4Oo4sl7ci8MhLcY9J6gQtnhiQe658jF3qRLyluyaTaU7b9Z7
	qD1kRJ2m/ukTDsJGXjO2HmspjK8vCqj+zFrHJ5AurvETkP4jVne+cK4mwZ0x8SPCCoQgsxAO0zTbT
	jN9W7JSQZZJbXSaOc/MH39rW5B09gMDhD+8LflAKjVxDxogMQ1aQgHKzH3nAsBExeyYEZL9SZQlTm
	HiByfYaUjJsUG0KmHGta+FaAhbxV7m40ocu81MBWf/3dKalOvtLLXRB4IrHgPNI7sQhrIg8JOTr4l
	R+k4DBuw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=worktop.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mOkDt-00BCr0-SO; Fri, 10 Sep 2021 17:22:20 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
	id 0A9AE98627A; Fri, 10 Sep 2021 19:21:57 +0200 (CEST)
Date: Fri, 10 Sep 2021 19:21:56 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Mark Brown <broonie@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Greg KH <greg@kroah.com>,
	Lee Jones <lee.jones@linaro.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Jason Gunthorpe <jgg@nvidia.com>, users@linux.kernel.org,
	tools@linux.kernel.org
Subject: Re: New version of lore available for preview
Message-ID: <20210910172156.GP4323@worktop.programming.kicks-ass.net>
References: <20210902201402.bbdttirbb5ckrtiz@meerkat.local>
 <CAK7LNAQogtzDbAFDtRt7UvDkH6K4tkQgwfmu-2_0rGgo_Uj_iw@mail.gmail.com>
 <20210903152143.nt5mzgwprltl36pa@meerkat.local>
 <CAF2Aj3jbU_vnKvYB2EJXuKdTCeJx3dgZY2h7sriJX4fP6Fsteg@mail.gmail.com>
 <20210908183746.iancht34j3drun77@meerkat.local>
 <20210909084907.271b6df5@gandalf.local.home>
 <YToM6bH/I9rHQMeE@google.com>
 <YToPeUhL+Ro3zlnq@kroah.com>
 <YTuC2Og65gtLxsQ/@ripper>
 <20210910161204.GE4474@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210910161204.GE4474@sirena.org.uk>

On Fri, Sep 10, 2021 at 05:12:04PM +0100, Mark Brown wrote:
> On Fri, Sep 10, 2021 at 09:07:52AM -0700, Bjorn Andersson wrote:
>=20
> > Is this (pick a single msg) supported in b4, am I just missing something
> > in the documentation?
>=20
> You can pick a subset of patches but only by specifying the patch
> numbers on the command line - I do this outside the mail client as part
> of saying which trees and branches the patches are going to.

See my earlier email to Lee, you can have mutt pipe in whichever
messages you want to apply (and their replies) and have b4 do it's magic
on them.

I typically start by selecting the whole thread using ESC-t and then
unselecting the patches I want to hold back, but whatever works for you
best...

basically you have to use: "b4 -m -" (in addition to the other flags) in
order for it to accept a local mbox on stdin, instead of scraping the
web.
