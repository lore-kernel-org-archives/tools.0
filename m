Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A001DDC7
	for <tools@linux.kernel.org>; Fri, 22 Dec 2023 20:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="MexYzwG6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E630AC433C7;
	Fri, 22 Dec 2023 20:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1703277120;
	bh=khAO1LuKENXmgoE6KUGQjy0yRH5h932jvzw8GShCUJw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MexYzwG6nR7uSkAhRs9MJNxbehMbn55Am94BcyoFU0GeejMYDjCM5mFss3sPUDfAA
	 DLjVSebpuBJtkhylsxLXVkZ/exc04N+4bub2YjtzZuiB2wMOZvnWdOPLdipd+E0Ofu
	 HLcdN0vhWx/pXE5pyZbHoYx6vW/Tm3hZ3Nc3Nc5g=
Date: Fri, 22 Dec 2023 15:31:58 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Cc: tools@linux.kernel.org
Subject: Re: [PATCH RESEND v4 0/3] livepatch: Move modules to selftests and
 add a new test
Message-ID: <20231222-neon-daring-grasshopper-fdc0c7@lemur>
References: <20231220-send-lp-kselftests-v4-0-3458ec1b1a38@suse.com>
 <55b717dba239f3bedf0da7e25925e390a63459f5.camel@suse.com>
 <20231222-horned-caiman-of-freedom-3fec0a@lemur>
 <f5c38763b4d42cfafdaac24d83ec18b81dfc073a.camel@suse.com>
 <20231222-groovy-llama-of-pluck-feaafd@lemur>
 <3a0b19b97cedd69b49a23aab35038e0844f3f1eb.camel@suse.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3a0b19b97cedd69b49a23aab35038e0844f3f1eb.camel@suse.com>

On Fri, Dec 22, 2023 at 04:13:40PM -0300, Marcos Paulo de Souza wrote:
> > How about the following:
> > 
> >     b4 send --only-to colleague1@example.com,colleague2@example.com
> > 
> > This will automatically trigger the "don't tag and reroll" mode.
> 
> Looks great! Exactly what I wanted to do, and very simple. Thanks a lot
> for looking into it!

I'm going to implement it as --dry-run-to, just to make it more obvious that
it's a dry-run action and won't trigger a tag-and-reroll.

So, you should be able to do:

    b4 send --dry-run-to mentor1@example.com mentor2@example.com

The subject line prefixes will also include DRYRUN in that case, e.g.:

    [PATCH DRYRUN 0/3] Some cover title

-K

bugbot assign to me
