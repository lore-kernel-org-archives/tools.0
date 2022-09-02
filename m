Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659FE110D
	for <tools@linux.kernel.org>; Fri,  2 Sep 2022 10:25:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E9E7C433D6;
	Fri,  2 Sep 2022 10:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662114341;
	bh=PZvOlY7ujfgnxDRitaDb3Si5yOGYMuf+FuN5L/Uyp2A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a7gCxinoRyPP4m3yiEKC9rOpNZn7KmLAA47k/FlYnIKdBeRg2SZmFQ7QV6stpauS1
	 CBqUr4eJOPyO8a4WnkQx8L9jvwq78MuaZHziu21wozV3Cf2YNBLG/Y4M6rUYAleAiK
	 0F6ZZCjgK46mst4pzxDhDysc4aZpHaB7KkMgQxTGV+JBkykwBDhmvtP/KawKVFz7L/
	 1bo19Cm5Ux7I2AZwnB6Mp+hd1u9yLv6fmRMxLKJomo6NQ6xZAjoYkE6BmKLmZjWjin
	 o1vgouHnpUKAMczUES7NZjyeDqj4d0AT1gC6V8n+5iMdPTXx2aJmeRS/Jd0t5LEuNT
	 9C/t0psourRSA==
Date: Fri, 2 Sep 2022 13:25:36 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: Re: Please return trailer-order option
Message-ID: <YxHaILXFF5Fzt4ig@unreal>
References: <YtZZE/6BOR5m86Kq@unreal>
 <7bb8b97f-dc03-41af-866e-767e4c15df62@www.fastmail.com>
 <20220728171351.4v65ytd2s5wp2lb7@meerkat.local>
 <20c1ca09-58e8-4ed4-a586-871a2daad70f@www.fastmail.com>
 <20220901214047.oyrmg4hyyihkdbbg@meerkat.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220901214047.oyrmg4hyyihkdbbg@meerkat.local>

On Thu, Sep 01, 2022 at 05:40:47PM -0400, Konstantin Ryabitsev wrote:
> On Thu, Jul 28, 2022 at 09:42:10PM +0300, Leon Romanovsky wrote:
> > >> Do you think that it is acceptable to return that option?
> > >
> > > Yes, it will probably come back as "trailer-priority" and preserve the
> > > chain-of-custody ordering as discussed on the list. It should make it back in
> > > by 0.10 release.
> > 
> > Sounds awesome.
> 
> FYI, this option is back as of today. It's still called "trailer-order", so
> you shouldn't need to change anything. There are some important changes in how
> it works:
> 
> 1. we only reorder trailers that are in your own chain-of-custody section
>    (below the last Signed-off-by that isn't yours)
> 2. we always move your own Signed-off-by to the bottom of your own
>    chain-of-custody section
> 
> Please let me know if this new behaviour is working as you would expect it.

Thank you for doing it.

I tried latest b4 with the following config:
[b4]
         trailer-order = "Cc,Fixes*,Link*,Suggested*,Reviewed*,Tested*,*"

➜  kernel git:(tmp) ~/src/b4/b4.sh shazam -l -s https://lore.kernel.org/all/20220901202645.1463552-1-irogers@google.com
Grabbing thread from lore.kernel.org/all/20220901202645.1463552-1-irogers%40google.com/t.mbox.gz
Checking for newer revisions on https://lore.kernel.org/all/
Analyzing 2 messages in the thread
Checking attestation on all messages, may take a moment...
---
  [PATCH v1] selftests/xsk: Avoid use-after-free on ctx
    + Acked-by: Magnus Karlsson <magnus.karlsson@intel.com>
    + Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
  ---
  NOTE: install dkimpy for DKIM signature verification
---
Total patches: 1
---
Applying: selftests/xsk: Avoid use-after-free on ctx

The end result as an outcome of 1 is:
    Fixes: 39e940d4abfa ("selftests/xsk: Destroy BPF resources only when ctx refcount drops to 0")
    Signed-off-by: Ian Rogers <irogers@google.com>
    Link: https://lore.kernel.org/r/20220901202645.1463552-1-irogers@google.com
    Acked-by: Magnus Karlsson <magnus.karlsson@intel.com>
    Signed-off-by: Leon Romanovsky <leonro@nvidia.com>

While I would like to see Link being below Fixes line:
    Fixes: 39e940d4abfa ("selftests/xsk: Destroy BPF resources only when ctx refcount drops to 0")
    Link: https://lore.kernel.org/r/20220901202645.1463552-1-irogers@google.com
    Signed-off-by: Ian Rogers <irogers@google.com>
    Acked-by: Magnus Karlsson <magnus.karlsson@intel.com>
    Signed-off-by: Leon Romanovsky <leonro@nvidia.com>

Thanks

> 
> -K
