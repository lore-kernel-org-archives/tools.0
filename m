Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36354697;
	Thu, 23 Jun 2022 23:35:25 +0000 (UTC)
Received: from letrec.thunk.org (c-24-1-67-28.hsd1.il.comcast.net [24.1.67.28])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 25NNX0xn012738
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jun 2022 19:33:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1656027184; bh=m0pArqLwsZTZk5uPrsrebt51y0GFxqrVf+pn4TWHNV8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=S3cm8rU7kO9d7h3lzfgXBdx71QyJ8jmy20Zz8cWKViq/n0FphSyE55mt5nnmCQTBB
	 y1nii21QRWcMiffPriAWeFxaoNfo+BbrPDRbu7BabM87bdzUkoqlCpaOVTUBrNPf/p
	 gbcN5iIMKIYhfqh4FEtHCtvcihhFrnrRaEC0BxgeDcoLvf39gVxM3JM7arsc3O9mbY
	 ik9YCtua7zXVivp8RugruygmSvxXfh1TIwxedW8K51uO9u2IRBjydQGIjKDKgfcs4u
	 CJnwoqSD/QbA59FioDQkrDDDXAQ1rWesY2dDD5WTlc3S3JDwkkrC2tWm77cIDcI6zk
	 CnqefBWiraekQ==
Received: by letrec.thunk.org (Postfix, from userid 15806)
	id 4A9188C3295; Thu, 23 Jun 2022 19:33:00 -0400 (EDT)
Date: Thu, 23 Jun 2022 19:33:00 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Linus Torvalds <torvalds@linuxfoundation.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>, tools@linux.kernel.org,
        users@linux.kernel.org
Subject: Re: b4-0.9.0 available
Message-ID: <YrT4LIq6ssD1mhMQ@mit.edu>
References: <CAMuHMdV4AHH1TM6xf26MP0-dUQ0-fB+62GeeuVuth9pgWgdu7Q@mail.gmail.com>
 <20220621152903.czivp7fdn6me775i@meerkat.local>
 <CAMuHMdWz8=Zr8hnXNGBZVfe70F8oVdK670Z41=Dtib0GMDgAug@mail.gmail.com>
 <CAHk-=wiQzp+aurcmj15=LAa2ntvRZH0Ee2dn-PLjcFpmRE6Jcw@mail.gmail.com>
 <CAHmME9p+zRErOsvA1zC=kTHtpYD_sGjFxVsj0pMwteAp4dCdjQ@mail.gmail.com>
 <20220621165953.z25hwos7gom6bp6s@meerkat.local>
 <YrIEnmt5vDMcbOiG@zx2c4.com>
 <20220621182953.p5asczznnz3pn6dl@meerkat.local>
 <YrIR2v7GdC3qIt2E@zx2c4.com>
 <YrI3W46GUS/Dap5J@ripper>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YrI3W46GUS/Dap5J@ripper>

On Tue, Jun 21, 2022 at 02:25:47PM -0700, Bjorn Andersson wrote:
> On Tue 21 Jun 11:45 PDT 2022, Jason A. Donenfeld wrote:
> > - Don't add `Link:` if the URL hasn't been hand selected as being
> >   particularly relevant; the lkml patch email alone doesn't cut it. This
> >   suggests that automatically adding `Link:` is invariably wrong, since
> >   automatic != "hand selected", so maybe there's no point in
> >   `-l,--add-link`, and you can just remove that option.
> 
> FWIW I find it very helpful to have the lore-Link in patches, as that
> allow me to quickly find and share a pointer to already landed
> patch/patchset - in particular when the recipient doesn't have
> linux-next synced and checked out locally.

I'll also note that a number of maintainers (including myself) are
adding the Link to the lore via a git hook:

#!/bin/sh
# For .git/hooks/applypatch-msg
#
. git-sh-setup
perl -pi -e 's|^Message-Id:\s*<?([^>]+)>?$|Link: https://lore.kernel.org/r/$1|g;' "$1"
test -x "$GIT_DIR/hooks/commit-msg" &&
        exec "$GIT_DIR/hooks/commit-msg" ${1+"$@"}
:

This predates my use of b4, because it means that I can save a message
from my inbox, and then run "git am -s /tmp/patch-mbox" and the Link
line is added.  No one has really complained, and I've found it useful
on occasion when doing code archeology when I'm trying to figure out
why a patch was added, or to pick up discussion *about* the patch that
happened during the code review.

It's not perfect, especially for large patch series where there is
say, a v27 patch series before it finally gets accepted, unless the
cover letter of v27 has a URL link to all of the previous patch
series.  In some ways, this is why the Gerrit scheme of having a
ChangeId trailer is so helpful.  It's an invariant across different
versions of the patch, and it means that assuming the Gerrit server is
still up, you can see the entire code review history in a single web
page.

It would be ***great*** if the lore/b4/git workflow had a similar
functionality.  Perhaps that means some kind of tool to automate
generation of the cover letter, or hiding the previous URL link after
the --- line in the e-mailed version of the patch?

> And I don't mind there being multiple Link: tags to different resources,
> as the various automation use cases I've run into have been easily
> solved by just filtering the tags by domain...

I don't mind because when I *have* had to go back in time to do code
archeology ("what *was* I thinking two years ago...") having an easy
way to do that has been worth its weight in gold.

That being said, it isn't easy to distinguish between a Link to a bug
report that was submitted to a vger mailing list, and as I've
mentioned, there isn't a good way to find the previous versions of the
patch, since previous versions of the patch or patch series tend be on
separate e-mail threads, and some of the more critical code review
discussions happen on earler versions of the patch/patch series, not
the final version where it's mostly about fixing the final nits, as
opposed to the design/architectural discussions.

Cheers,

						- Ted
