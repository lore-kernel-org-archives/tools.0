Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E042CA7;
	Fri, 24 Jun 2022 15:29:52 +0000 (UTC)
Received: from letrec.thunk.org (c-24-1-67-28.hsd1.il.comcast.net [24.1.67.28])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 25OFTjgX023503
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jun 2022 11:29:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1656084587; bh=Hh7klDZYbxesjVLu9ze8JyuP0csPGTUFQQ+i7bR3kZ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OMnbILLqTO8iuFPQpOLkq7z+uWoV7TguXGYOh9rAYIDs0FvTUuV03BCUCJENOZ0Mi
	 qWNVwmNdKWkmhT4IzooSkPMbXgreJWf7iQO5E10eTdVoQp4KPGgOTHGux7I1iiBMMu
	 2xXOaFW5rlrc/0BX54WQPUwy2Iy+XSXeROUUSO/Kn6G6kyBSvmojezn9DLRZZSH6Qg
	 Vvn2zxAJvQgfZbsugupt0jcI6w8cmcvkCYp8Z62nEZgZ9jNVMOUsbF+Nah2s6dGnh+
	 OCW0AwhSe0jVM+t5P8yIqg1yZrcZw0rzmeuu5Spj6YJ/BGXPjpvEILH96p8j7ZNyYU
	 BTFE0uqP9hhcw==
Received: by letrec.thunk.org (Postfix, from userid 15806)
	id F0F9B8C3495; Fri, 24 Jun 2022 11:29:44 -0400 (EDT)
Date: Fri, 24 Jun 2022 11:29:44 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>,
        "Jason A. Donenfeld" <Jason@zx2c4.com>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Linus Torvalds <torvalds@linuxfoundation.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>, tools@linux.kernel.org,
        users@linux.kernel.org
Subject: Re: b4-0.9.0 available
Message-ID: <YrXYaE12VFUDucsN@mit.edu>
References: <CAMuHMdWz8=Zr8hnXNGBZVfe70F8oVdK670Z41=Dtib0GMDgAug@mail.gmail.com>
 <CAHk-=wiQzp+aurcmj15=LAa2ntvRZH0Ee2dn-PLjcFpmRE6Jcw@mail.gmail.com>
 <CAHmME9p+zRErOsvA1zC=kTHtpYD_sGjFxVsj0pMwteAp4dCdjQ@mail.gmail.com>
 <20220621165953.z25hwos7gom6bp6s@meerkat.local>
 <YrIEnmt5vDMcbOiG@zx2c4.com>
 <20220621182953.p5asczznnz3pn6dl@meerkat.local>
 <YrIR2v7GdC3qIt2E@zx2c4.com>
 <YrI3W46GUS/Dap5J@ripper>
 <YrT4LIq6ssD1mhMQ@mit.edu>
 <20220624135147.GA23621@ziepe.ca>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220624135147.GA23621@ziepe.ca>

On Fri, Jun 24, 2022 at 10:51:47AM -0300, Jason Gunthorpe wrote:
> 
> Unfortunately it is a bit of a PITA for the submitter so not too many
> people seem to do it.

Yeah, "git notes" in newer versions of git makes it easier to compose
the cover letter, but tracking the lore URL's of the previous versions
of the patches that was submitted has to be done completely manually.
And because it's a PITA, very few people do it.

It would be great if we had some kind of tooling where when someone
sends a new version of the patch series, the tooling opened an editor
and allowed the submitted to enter a quick changelog of what changed
between the v25 and v26 version of the patch, with an option to also
edit the body of the cover letter.  And then then when the patch is
sent via e-mail, all of this would be appended to the cummulative
version of the cover letter.

I think if we had this, then it would *significantly* improve code
archeology for patch series.  Would it be enough that people would
tolerate a cover letter for one-off commits?  Probably not --- but the
same infrastructure could be used to keep track of the inter-version
change logs, which could then be included after the --- line which
delimits the end of the commit description, and that would solve the
problem for single patch or smaller patch series that tend not to have
cover letters today.

				- Ted
