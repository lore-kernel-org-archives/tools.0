Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909C73FC9;
	Wed, 15 Sep 2021 12:06:04 +0000 (UTC)
Date: Wed, 15 Sep 2021 14:05:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1631707557;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=m4VNU9yX9jMiB16SldvOhlYMbMZQZWFLyccf5rcCMIc=;
	b=JSrXLRT2Rih1+ftPI06j238LFUr0lSA7M0LEvvhLpzhRJcbnuYFzpQ7EZ3ooruSq/HBOCC
	NSpVFQ0B2SsklGsQJ6QsY4y/eK51PYrO9Ep9FPYsJ7sNmMt+0Fc53vW4mCdzxzCxzBeIJO
	UHKgXxvM9CSFLvqv/6M4AOAiB+RmymVpwL+zsRxWmFNWlwcmwka5u9iidBAt6jSIJ8aETl
	Ghyj/vCQ15IabQGJ1aHcKFj9s2aC8kPVpwKhjwq1OX+e7CJhd4t5Ot9b4c7YPytPkbfife
	y4Zr49E2o4GFIlZNnrZbxWmGp0wAb0TLSlorPHmFGmRWRc5kG3U2LG/BKA2Vsg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1631707557;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=m4VNU9yX9jMiB16SldvOhlYMbMZQZWFLyccf5rcCMIc=;
	b=2SwJdkjBPJ2iBEmHdF4CDP8SFAG742CHi1ceohD/y4j30t2jVqKpGae6Ss5sD2rIf9s3IX
	iZ7SK7nMVh1n69Ag==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: lore.kernel.org upgrade: Sep 1, 2021
Message-ID: <20210915120555.3goilbwqeertbexe@linutronix.de>
References: <20210830164626.tq5emfrht4o46x33@nitro.local>
 <20210901131259.7slxtcftirxb4bhp@linutronix.de>
 <20210901132519.vxw2wrly4pifnorv@meerkat.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210901132519.vxw2wrly4pifnorv@meerkat.local>

On 2021-09-01 09:25:19 [-0400], Konstantin Ryabitsev wrote:
> Thank you for the alert -- looks like my deploy missed a step. It should fix
> itself once DNS entries propagate to you.

Thanks.
I've been just pointed to this behaviour:
  https://lore.kernel.org/netdev/

has a search field at the top. But if you use
  https://lkml.kernel.org/netdev/

then there is the archive with no search field. A redirect to lore would
be nice.

> -K

Sebastian
