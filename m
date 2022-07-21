Received: from mail104.syd.optusnet.com.au (mail104.syd.optusnet.com.au [211.29.132.246])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 967101FA0;
	Thu, 21 Jul 2022 02:52:08 +0000 (UTC)
Received: from dread.disaster.area (pa49-181-2-147.pa.nsw.optusnet.com.au [49.181.2.147])
	by mail104.syd.optusnet.com.au (Postfix) with ESMTPS id B436062C95B;
	Thu, 21 Jul 2022 12:31:15 +1000 (AEST)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
	(envelope-from <david@fromorbit.com>)
	id 1oELy5-003OG4-5H; Thu, 21 Jul 2022 12:31:13 +1000
Date: Thu, 21 Jul 2022 12:31:13 +1000
From: Dave Chinner <david@fromorbit.com>
To: Theodore Ts'o <tytso@mit.edu>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Junio C Hamano <gitster@pobox.com>,
	Linus Torvalds <torvalds@linuxfoundation.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: b4 submit ready for beta testing
Message-ID: <20220721023113.GO3600936@dread.disaster.area>
References: <20220716142954.voq4ucnl5wkq7h2b@nitro.local>
 <20220720184835.uhnkucai54alhgo6@nitro.local>
 <20220720192456.GM5049@ziepe.ca>
 <xmqqmtd31ip8.fsf@gitster.g>
 <CAHk-=wgWY5920sr5AUxZVP6hs85wiTzR0AMH9pc5epfzTeC3wA@mail.gmail.com>
 <20220720233940.GO5049@ziepe.ca>
 <CAHk-=wgEmH89HpOB5ZYO9owwZ67=O6cikbre2-PShM+AsXhYcg@mail.gmail.com>
 <CAPc5daWCm=8Bket5t9Q+SJ+6pRL3PPSYVqU3Z98miKV+D_bFFQ@mail.gmail.com>
 <20220721000256.GS5049@ziepe.ca>
 <Ytijr4YQn1OB88P8@mit.edu>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Ytijr4YQn1OB88P8@mit.edu>
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.4 cv=VuxAv86n c=1 sm=1 tr=0 ts=62d8ba74
	a=ivVLWpVy4j68lT4lJFbQgw==:117 a=ivVLWpVy4j68lT4lJFbQgw==:17
	a=kj9zAlcOel0A:10 a=RgO8CyIxsXoA:10 a=7-415B0cAAAA:8
	a=7LDZOF_M7FJHwPsqoYYA:9 a=CjuIK1q_8ugA:10 a=biEYGPWJfzWAr4FL6Ov7:22

On Wed, Jul 20, 2022 at 08:54:07PM -0400, Theodore Ts'o wrote:
> On Wed, Jul 20, 2022 at 09:02:56PM -0300, Jason Gunthorpe wrote:
> > 
> > I'm getting the impression that people are building series in git
> > without using a lot of 'rebase -i' ? How is this done ?
> 
> There are lots of different mechanisms.  Some of them are syntactic
> sugar on top of git rebase and/or git cherry-pick.  For example, there
> is "Stacked Git"[1].
> 
> I used to use "guilt"[2],

I still use guilt.

I have a hacked version of it that can store the commit description
in an empty commit as the first patch in the series, and 'guilt
patchbomb' has an option to take that first patch as the cover
letter for the series being patchbombed.

However, I don't use that anymore, because updating the cover letter
as I work on the series turned out to be a PITA. These days I have
a series of untracked files in the tree root that are named
"changelog-<branch-name>.txt" and I edit them as I need as I work on
the series.

But then there's the problems of using those branches for pull
requests: it's not really possible because we want an editted
version of the cover letter in the signed tag for the pull request
so it ends up in the merge commit, not as an empty, unrelated commit
in the tree.

Hence when I sign the tag for the branch, I pull up the branch
description file and chop all the bits that aren't relevant out of
it (e.g. change logs, last testing status, what it was last rebased
on, where to pull it from for testing/review, etc) so it only
contains things directly relevant to the code that is being merged.

I'm only mentioning this because it's relevant to the discussion:
I've moved directly from using the the "empty commit holds cover
letter" model to the "branch description holds cover letter" model
because the branch description model has much lower overhead to
maintain and allows for far more flexibility in my local
workflows...

> which I liked because it stored the patch
> series as a quilt patch series, but when you used commands like "guilt
> push" it would apply the patch to the current git branch, and "guilt
> pop" would remove the patch from git branch (i.e., the moral
> equivalent of "git reset --hard HEAD^").  You could then edit the
> current using "git commit --amend" and then "guilt refresh" would
> update the quilt series to reflect the changes made with "git commit
> --amend".
> 
> The reason why I liked guilt is that since the source of truth was a
> quilt patch series directory, I could keep the quilt patch series
> under checked into a git repo, and so I could easily look at a
> previous version of the patch series if I screwed up.  Rebasing to a
> newer baseline was also pretty easy --- "guilt pop -a; git pull .... ;
> guilt push -a".

Yup. if I cared enough, I would have hacked guilt to store a
"description" file alongside the series file added a command like
'guilt description --edit' and then plumbed that into commands like
patchbomb. If it was still maintained, I'd probably do that work.
But it's not, and keeping the description in guilt does not save any
time or operations in my workflow, so I haven't.

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com
