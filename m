Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE5D03FE9;
	Thu,  9 Sep 2021 13:55:17 +0000 (UTC)
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id E87B1611C7;
	Thu,  9 Sep 2021 13:55:16 +0000 (UTC)
Date: Thu, 9 Sep 2021 09:55:14 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Lee Jones <lee.jones@linaro.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, Masahiro Yamada
 <masahiroy@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
 users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: New version of lore available for preview
Message-ID: <20210909095514.49e68456@gandalf.local.home>
In-Reply-To: <YToM6bH/I9rHQMeE@google.com>
References: <20210818190750.g3xedu7j24sqndo2@nitro.local>
	<20210902195332.GA2493828@nvidia.com>
	<20210902201402.bbdttirbb5ckrtiz@meerkat.local>
	<CAK7LNAQogtzDbAFDtRt7UvDkH6K4tkQgwfmu-2_0rGgo_Uj_iw@mail.gmail.com>
	<20210903152143.nt5mzgwprltl36pa@meerkat.local>
	<CAF2Aj3jbU_vnKvYB2EJXuKdTCeJx3dgZY2h7sriJX4fP6Fsteg@mail.gmail.com>
	<20210908183746.iancht34j3drun77@meerkat.local>
	<20210909084907.271b6df5@gandalf.local.home>
	<YToM6bH/I9rHQMeE@google.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 9 Sep 2021 14:32:25 +0100
Lee Jones <lee.jones@linaro.org> wrote:

> Well, as beautifully inefficient as that all sounds, it might be
> slightly less time consuming if I just succumb to peer pressure and
> switch pwclient out for b4.

The old "Show them an even more painful alternative to make the current
solution seem good" trick.

> 
> Thankfully, my use-case is much simpler than Steven's.

Of course, my solution came before b4 was even thought of (I even mentioned
this solution in the kernel summit discussion that started the path to b4).

The one thing I need that b4 doesn't give me, is a place outside of email
to keep track of the state of patches. I've failed in all my attempts at
using email folders to do this. What I love about patchwork is that I can
keep the patches at various states.

 New - I just received it and need to look at it / test it.

 Under review - They have been tested, just need to be pushed to upstream.

 Accepted - they have been accepted.

I also created other states for topics, like "Real Time", "Scheduler",
"RCU", etc, so that I can go back if I have time (which currently I never
do), and look at these patches.

I also use the "delegate" option to assign patches to myself that are high
in priority.

I tried doing this with email folders, and even a git repo, but because I
use email and git for so much else, it still gets lost in the noise. I like
patchwork because its web based, and I have a window up all the time that
shows me what patches I need to work on next.

The pulling into git is actually one of the trivial parts of the process.

-- Steve
