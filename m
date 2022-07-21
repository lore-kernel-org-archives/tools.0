Received: from mail105.syd.optusnet.com.au (mail105.syd.optusnet.com.au [211.29.132.249])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 189D87460;
	Thu, 21 Jul 2022 23:19:09 +0000 (UTC)
Received: from dread.disaster.area (pa49-181-2-147.pa.nsw.optusnet.com.au [49.181.2.147])
	by mail105.syd.optusnet.com.au (Postfix) with ESMTPS id 8E84A10E8290;
	Fri, 22 Jul 2022 08:49:14 +1000 (AEST)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
	(envelope-from <david@fromorbit.com>)
	id 1oEeym-003irH-FG; Fri, 22 Jul 2022 08:49:12 +1000
Date: Fri, 22 Jul 2022 08:49:12 +1000
From: Dave Chinner <david@fromorbit.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Theodore Ts'o <tytso@mit.edu>, Junio C Hamano <gitster@pobox.com>,
	Linus Torvalds <torvalds@linuxfoundation.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: b4 submit ready for beta testing
Message-ID: <20220721224912.GQ3600936@dread.disaster.area>
References: <20220720192456.GM5049@ziepe.ca>
 <xmqqmtd31ip8.fsf@gitster.g>
 <CAHk-=wgWY5920sr5AUxZVP6hs85wiTzR0AMH9pc5epfzTeC3wA@mail.gmail.com>
 <20220720233940.GO5049@ziepe.ca>
 <CAHk-=wgEmH89HpOB5ZYO9owwZ67=O6cikbre2-PShM+AsXhYcg@mail.gmail.com>
 <CAPc5daWCm=8Bket5t9Q+SJ+6pRL3PPSYVqU3Z98miKV+D_bFFQ@mail.gmail.com>
 <20220721000256.GS5049@ziepe.ca>
 <Ytijr4YQn1OB88P8@mit.edu>
 <20220721023113.GO3600936@dread.disaster.area>
 <20220721130718.GT5049@ziepe.ca>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220721130718.GT5049@ziepe.ca>
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.4 cv=e9dl9Yl/ c=1 sm=1 tr=0 ts=62d9d7eb
	a=ivVLWpVy4j68lT4lJFbQgw==:117 a=ivVLWpVy4j68lT4lJFbQgw==:17
	a=kj9zAlcOel0A:10 a=RgO8CyIxsXoA:10 a=7-415B0cAAAA:8
	a=mSN9POc7LJlgyZSEXIMA:9 a=CjuIK1q_8ugA:10 a=biEYGPWJfzWAr4FL6Ov7:22

On Thu, Jul 21, 2022 at 10:07:18AM -0300, Jason Gunthorpe wrote:
> On Thu, Jul 21, 2022 at 12:31:13PM +1000, Dave Chinner wrote:
> 
> > However, I don't use that anymore, because updating the cover letter
> > as I work on the series turned out to be a PITA. 
> 
> Can you detail how it was painful?

Take a 20 patch series in a topic branch and work through the review
comments one patch at a time, updating the changelog in the
description commit as you go. Change first patch, commit. Update
changelog, rebase series. Change second patch, commit. Update
changelog, rebase series...

Now do that a couple of times a week for a dozen topic branches that
contain 100+ patches across different lines of development with
various inter-dependencies. Upstream tree changes trigger this
update pain, as does testing finding bugs in random patches
somewhere in the middle of the combined stack of topic branches.

It's far simpler to have the topic branch description and changelog
in a file/context that is completely independent of the commit chain
that represents the series - it can remain open in an editor in a
separate terminal as the rebase/rework/bug fix is performed and only
needs to be saved once when the update/rework of the patch series is
completed.

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com
