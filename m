Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE852F83
	for <tools@linux.kernel.org>; Fri, 23 Apr 2021 06:04:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B078361404;
	Fri, 23 Apr 2021 06:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1619157899;
	bh=D4r0o+1Zd4d9tNystDimGhAjWAGvE+l0/PYVFEOxd/g=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ssY1/XqT/8hDp8DpBtcj9V4m7R9vO/sDlPPRBzB12ZsUBbUal1jRMCek6pQfLBrNt
	 +4QsFKdVf34cBzt/YSZMZe7Z8Vxt+/HkTxiUpDxgzc61IiNXebG9phmg6EpWXTpS8s
	 oL5FUuUcsGUyTwztvEj+MPeX9sC226HP45AfRgEXq5CL4a2km51PjUxWFWecsK4oQb
	 jkJuW6p6ps6U2MmRaTx7cg8gDgq72Qq7bm2BKvtHzGC25Mi2ApGJNX491FWSTTBdBg
	 VzmD7psW+5h+X9vP9TxPwVq1/eIcihdep5gBOYV+/Yx5aX5/YLwhuziLuo+Tbr47ZY
	 MQN8fyzJlJuyQ==
Date: Fri, 23 Apr 2021 08:04:54 +0200
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Rob Herring <robherring2@gmail.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, Leon Romanovsky <leon@kernel.org>,
 James Bottomley <James.Bottomley@hansenpartnership.com>,
 ksummit@lists.linux.dev, tools@linux.kernel.org
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
Message-ID: <20210423080454.78f4f662@coco.lan>
In-Reply-To: <CAL_JsqKS-=shqkLhzKeLHqNPhosGJw5X-fOi+dy1rT3Q_LfBZg@mail.gmail.com>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
	<YID5xhy2vv45fnOv@unreal>
	<20210422112001.22c64fe9@coco.lan>
	<YIFfXTVMDmHwVmSR@unreal>
	<20210422092916.556e5e50@gandalf.local.home>
	<CAL_JsqKS-=shqkLhzKeLHqNPhosGJw5X-fOi+dy1rT3Q_LfBZg@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Thu, 22 Apr 2021 09:20:19 -0500
Rob Herring <robherring2@gmail.com> escreveu:

> On Thu, Apr 22, 2021 at 8:30 AM Steven Rostedt <rostedt@goodmis.org> wrote:
> >
> > On Thu, 22 Apr 2021 14:34:53 +0300
> > Leon Romanovsky <leon@kernel.org> wrote:
> >  
> > > > This is not a matter of bad practice. There are a couple of reasons
> > > > why each patch on a series will have a different group of Cc, like:
> > > >
> > > >     - driver maintainers for each patch may be different;
> > > >     - scripts/get_maintainers.pl will return a different Cc/To;
> > > >     - patch series touch different subsystems;  
> > >
> > > Like Christoph said, if it is unrelated send the patches as separated
> > > series.  
> >
> > Since I use quilt to send my patches, my only two choices are all patches,
> > or individual ones with Cc. Some of my patches will need to touch every
> > architecture. I'll Cc the maintainers of the architecture code, but not
> > include them in every architecture patch. And because this code depends on
> > other patches, I can not send them as individual series.
> >
> > I use to have issues with this, but now with lore, I can trivially find the
> > entire thread and read it the whole story. IMO, it is no longer bad
> > practice to Cc only a single patch is a larger series to a maintainer, for
> > the one patch that touches their code. It's a "FYI, I'm touching your
> > code". But because of lore, it's really easy for them to get the full
> > picture.
> >
> > I much rather have my INBOX today be only patches that touches my code,
> > then full series of patches that I really don't care about. Worse yet, I'll
> > get Cc'd on a full series of 20 patches, where only one patch touches my
> > code. The sad part is, I'm much more likely to ignore that series, because
> > I'm added to stuff by get-maintainers for the strangest reason, and
> > completely miss that there's a single patch in there that really requires
> > my review.
> >
> > Please, just Cc me on code that touches something I maintain or listed as
> > a reviewer (which is still a lot).  
> 
> Unless the process of who to Cc or not is completely automated,
> relying on submitters to do the right thing to give you the subset of
> emails you want to see is never going to work. I have frequent
> problems with folks not Cc'ing the DT list for DT patches, how hard is
> that? I think the answer is making where patches are sent less
> important and better/easier filtering from lore (which is coming).

I have a script to automate it, but I had to tweak it while handling
patches that cross a single subsystem boundaries, using git send-email
with the c/c list obtained from get_maintainers.pl.

By default, the script adds all maintainers, reviewers and all mailing
lists to the cover letter, but that sometimes generate a cover letter
with 80+ c/c, which will be automatically rejected by anti-spam
measures and by mail servers.

So, I played with two different alternatives:

1. At the beginning, I changed the script to c/c only the mailing lists,
   excluding maintainers/reviewers;
2. As the feedback was not great, I changed the script to c/c only
   the maintainers, excluding mailing lists/reviewers. It seems that
   this worked better.

I didn't try to play with bcc, as replying to it would not send
the replies to everyone.

If you think it is worth, I could submit it to scripts/, but I
suspect we may need to adjust it to work with all maintainers'
workflows.

Thanks,
Mauro
