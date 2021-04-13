Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC746D0D;
	Tue, 13 Apr 2021 21:29:04 +0000 (UTC)
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id E0B9961242;
	Tue, 13 Apr 2021 21:29:02 +0000 (UTC)
Date: Tue, 13 Apr 2021 17:29:01 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Alex Elder <elder@ieee.org>, users@linux.kernel.org,
 tools@linux.kernel.org
Subject: Re: RFC: Superseded-by: follow-up trailer
Message-ID: <20210413172901.1465307c@gandalf.local.home>
In-Reply-To: <CAHmME9pFqm00ibpqhQQ9_P61F7mU12yrcOvdNSDYDz8ot8HJDg@mail.gmail.com>
References: <20210413204932.yovoa7njwc56jo5v@nitro.local>
	<fd732fc9-83a9-5502-fba5-f08317bdcaf3@ieee.org>
	<CAHmME9pFqm00ibpqhQQ9_P61F7mU12yrcOvdNSDYDz8ot8HJDg@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 13 Apr 2021 15:02:53 -0600
"Jason A. Donenfeld" <Jason@zx2c4.com> wrote:

> On Tue, Apr 13, 2021 at 2:57 PM Alex Elder <elder@ieee.org> wrote:
> >
> > On 4/13/21 3:49 PM, Konstantin Ryabitsev wrote:  
> > > Hi, all:
> > >
> > > B4 (and git-patchwork-bot) try to deal with series revisions, but the process
> > > is not infallible due to needing to guess whether one series obsoletes another
> > > via weak string matches (subject + author). If v2 arrives with a modified
> > > subject than in v1 (even if it's a typo fix), or from a different email
> > > address, then auto-matching will fail.
> > >
> > > I would like to propose a "Superseded-by" follow-up trailer to help strengthen
> > > the link between series revisions. The trailer needs to be sent as a follow-up
> > > to the cover letter or first patch of the previous series.
> > >
> > >      Superseded-by: [url-ending-with/message-id-of-next-version]  
> >
> > Could "Supercedes: [url]" posted with the new version work?     -Alex  
> 
> But in that case, the metadata is kind of useless once committed, and

Not at all.

> it increases the overhead of submitting new patchsets, which means
> fewer people will actually use it. With Konstantine's original
> proposal, after you send your new version, you can lazily follow up
> with a reply saying what the new one is, which helps inform everyone
> who was hanging out on that old thread too. And folks other than the
> original submitter can help provide that kind of thing too. In other
> words, I think K's original idea seems like a sensible low-overhead
> thing, while yours is a bit more laborious.

I would actually be less likely do the follow up on the previous patch set,
as usually writing the next series, you don't think about the previous
ones, except maybe to implement the comments. But after testing the final
work and sending it, the old version may be long out of memory. I would then
need to go in my inbox (or lore) find the old series and then reply to it.
That to me is more work, and likely not to be done.

Now, I would really like the Supercedes: tag, as its just a link you need,
and not a email sent. Ideally this would be in all the patches (with a
direct link to what it Supercedes. I may update my scripts to do exactly
this, as I always add a "Link: " to the last version, and that's in my
repo. Or perhaps b4 could add this too!

About why it's not useless from the comment above. The history of why
changes are made are usually mostly described in the early versions of a
patch series. But even with Link tags, which usually just point to the last
version of a patch, it's hard to find that useful discussion.

When I do a git blame, I'll look at the commit. Then I want to know more
details about why that change happened, and if there's a Link tag in the
commit, I go there. Then I see the link is to v32 of some patch series,
with just a bunch of Acks and Reviewed by tags attached. Rather useless.

Then its an exercise of doing searches based on the subjects. But to have
direct links to the previous versions of the series, then you can easily
find the rationale behind the changes as you will see more of the
discussions that took place to make those decisions.

-- Steve

