Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF14A7B
	for <tools@linux.kernel.org>; Sat,  3 Sep 2022 06:31:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E68FAC433D6;
	Sat,  3 Sep 2022 06:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662186705;
	bh=oUMyLR72AOMfTxNguYJ79hrAYEYW7F2UHKyEBlFse3A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sXANnQKWXPh2hlRSor/14cB4ME3jJ/b1Cb0zGYgCC/DrWXwyU6kIelEjWuST/gYvX
	 mb5hxzju3DPxQaMC2iAmxf4w4t/nC9npRp93tfhWvWKH4/yjEMMNXKIjqm6o9ojn15
	 9dhovqjy/QFSpSIQswjC4m9zQImf2y3AZ/0GERbsstSwRzMfIS866NR0WIHaU00BDb
	 JbdN/ZIEmej8x2rabpXZtK3vpstpUM5OtI97nVoY7tbTzHTIzV/IGKhdYjA4gz9m32
	 Mueig9UdNmhd2tKmEIQfsykOkMEwfxODiLl9FWSlSOVy2XzKuq2pCXBuJ6Z6d6NElg
	 PxGu7fXCkD6kg==
Date: Sat, 3 Sep 2022 09:31:41 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: Re: Please return trailer-order option
Message-ID: <YxL0zcfGrUeUK6S5@unreal>
References: <YtZZE/6BOR5m86Kq@unreal>
 <7bb8b97f-dc03-41af-866e-767e4c15df62@www.fastmail.com>
 <20220728171351.4v65ytd2s5wp2lb7@meerkat.local>
 <20c1ca09-58e8-4ed4-a586-871a2daad70f@www.fastmail.com>
 <20220901214047.oyrmg4hyyihkdbbg@meerkat.local>
 <YxHaILXFF5Fzt4ig@unreal>
 <20220902144033.g2yzsvnuw5p7lk76@meerkat.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220902144033.g2yzsvnuw5p7lk76@meerkat.local>

On Fri, Sep 02, 2022 at 10:40:33AM -0400, Konstantin Ryabitsev wrote:
> On Fri, Sep 02, 2022 at 01:25:36PM +0300, Leon Romanovsky wrote:
> > I tried latest b4 with the following config:
> > [b4]
> >          trailer-order = "Cc,Fixes*,Link*,Suggested*,Reviewed*,Tested*,*"
> > 
> > ➜  kernel git:(tmp) ~/src/b4/b4.sh shazam -l -s https://lore.kernel.org/all/20220901202645.1463552-1-irogers@google.com
> > Grabbing thread from lore.kernel.org/all/20220901202645.1463552-1-irogers%40google.com/t.mbox.gz
> > Checking for newer revisions on https://lore.kernel.org/all/
> > Analyzing 2 messages in the thread
> > Checking attestation on all messages, may take a moment...
> > ---
> >   [PATCH v1] selftests/xsk: Avoid use-after-free on ctx
> >     + Acked-by: Magnus Karlsson <magnus.karlsson@intel.com>
> >     + Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> >   ---
> >   NOTE: install dkimpy for DKIM signature verification
> > ---
> > Total patches: 1
> > ---
> > Applying: selftests/xsk: Avoid use-after-free on ctx
> > 
> > The end result as an outcome of 1 is:
> >     Fixes: 39e940d4abfa ("selftests/xsk: Destroy BPF resources only when ctx refcount drops to 0")
> >     Signed-off-by: Ian Rogers <irogers@google.com>
> >     Link: https://lore.kernel.org/r/20220901202645.1463552-1-irogers@google.com
> >     Acked-by: Magnus Karlsson <magnus.karlsson@intel.com>
> >     Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> > 
> > While I would like to see Link being below Fixes line:
> >     Fixes: 39e940d4abfa ("selftests/xsk: Destroy BPF resources only when ctx refcount drops to 0")
> >     Link: https://lore.kernel.org/r/20220901202645.1463552-1-irogers@google.com
> >     Signed-off-by: Ian Rogers <irogers@google.com>
> >     Acked-by: Magnus Karlsson <magnus.karlsson@intel.com>
> >     Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> 
> Right, this is the intended change in behaviour -- we don't want to touch
> anything that's above the Signed-off-by that doesn't belong to you. I see why
> you want to move the Link: line above Ian's SoB (to indicate that it's his
> message), but I think from the point of view of chain-of-custody it really
> belongs under it:
> 
>     Fixes: 39e940d4abfa ("selftests/xsk: Destroy BPF resources only when ctx refcount drops to 0")
>     Signed-off-by: Ian Rogers <irogers@google.com>
> 
> This is Ian saying that he's signing off on anything above this trailer. If we
> move Link: above his signoff, this would indicate that he's also signing off
> on the contents of that URL, but that would be putting words in his mouth. If
> we put the Link under it, though, this indicates where *you* got the message, so
> it really belongs in your own custody section:
> 
>     Link: https://lore.kernel.org/r/20220901202645.1463552-1-irogers@google.com
> 
> "I got this message at this URL"
> 
>     Acked-by: Magnus Karlsson <magnus.karlsson@intel.com>
> 
> "I also collected this Acked-by, which can also be found at that URL"
> 
>     Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> 
> "I am signing off on anything above this line"
> 
> Hope this helps explain the reasoning.

Yeah, it explains, the thing is that pure chain-of-custody exists only in
flows that mostly based on pull request.

In my subsystem case, we fix many of submitted patches (spelling,
grammar, coding style and sometimes code itself), because for us the end
goal (having fix/patch merged) is more important than process. We don't want
to scare casual developers with strict rules, of course, the more experienced
submitter, the less tolerant toward his mistakes.

So in my mind, commit message structure is: "Subject, message, Cc, Fixes,
Link, various *-off-by".

Thanks

> 
> -Konstantin
