Received: from relay.hostedemail.com (smtprelay0010.hostedemail.com [216.40.44.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B8D2FE59F
	for <tools@linux.kernel.org>; Wed, 15 Oct 2025 15:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760543957; cv=none; b=RWJbTd15S2EYn9dCUTK+bII2yvrY7meMfoqQm+4/VKPv6s2wpNK10kZkaHDQW0xqxu10fd+IVikhjZ1zrx9tR3i2AUYiJzA3aW4f4Vz+L1qYk3LWrApnwr1NX4EaWzF62RPabYN8bysULyRdQRbNYDDqw7zWGtIAKl0ixg6soes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760543957; c=relaxed/simple;
	bh=OD8CBt6q0v2/tXjzQczQWF+BMsV3xgkbshw1W2Tzylc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FCOfrd4MxofkicGXVCPB6ZASNOD1mWXicfhObtsqj9sx/Rb5u+WryugPv5uCmNljJYaq3ah/X3k4PnzYuHgHYHb7q9oSiQj1De9Kqy4skov/sowWUSmR01HJQOt9hovLvx5DUY0v8HvP0VvYb0hkNbVvrJ/FM6+X5/ayE76UX64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf03.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay06.hostedemail.com (Postfix) with ESMTP id B50A5118A82;
	Wed, 15 Oct 2025 15:59:11 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf03.hostedemail.com (Postfix) with ESMTPA id 54C0F6000E;
	Wed, 15 Oct 2025 15:59:09 +0000 (UTC)
Date: Wed, 15 Oct 2025 11:59:17 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>, Mark Brown
 <broonie@kernel.org>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Geert
 Uytterhoeven <geert@linux-m68k.org>, Linus Torvalds
 <torvalds@linuxfoundation.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Konstantin Ryabitsev
 <konstantin@linuxfoundation.org>, users@kernel.org, tools@linux.kernel.org
Subject: Re: [workflows]Re: In defense of Link (was Re: [b4] initial "b4
 dig" to supplant Link: trailers)
Message-ID: <20251015115917.5e031880@gandalf.local.home>
In-Reply-To: <20251015155346.GA3287345@noisy.programming.kicks-ass.net>
References: <CABgObfY5agTRsB-bCqCYbA0erFn5cVbujtTNBiCti8g_68nCWg@mail.gmail.com>
	<20251013081536-mutt-send-email-mst@kernel.org>
	<CAHk-=whSShtPG1_+02Cc4yDuEJxVqX=G8tAx0gW7UjA7cuBp-w@mail.gmail.com>
	<CAMuHMdWxMhM1J3zHC8OkN_fd8XsJPFA6jM_3JFU=ySKhnX6ESw@mail.gmail.com>
	<CANiq72ka1y0YXysRQtuqnzc0i5FSbrGjKwprrXQpozwDOV3khA@mail.gmail.com>
	<aadb0515-4024-40c0-8024-fcdd029a3029@sirena.org.uk>
	<2991ae006906913c10715a9673ac53a4ea557728.camel@HansenPartnership.com>
	<20251015151447.GD3168635@noisy.programming.kicks-ass.net>
	<20251015111816.728bfda7@gandalf.local.home>
	<20251015155346.GA3287345@noisy.programming.kicks-ass.net>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: 354mc9xj7397xwhmiksxysb48dg9rjh1
X-Rspamd-Server: rspamout08
X-Rspamd-Queue-Id: 54C0F6000E
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/KvKrG3LHFbQzf0DhebLAKUQU4VX9cZaw=
X-HE-Tag: 1760543949-585785
X-HE-Meta: U2FsdGVkX18bnCR75JEoSH+x3psp23PDH/PloXtAv82kk+K74AHGM+ufKkR7oZw6K0N0cJFOfLV9Ekbhd/3znqKFmY4OQ+7dtxyvFWudIZU+rmISlLsc5RbcqgMQV9tJhTqf0SeKi0vtVdjeo9UwQ4eQkMYaMtJB6Zbg9XYJQ8XyMOXROoRNTtZ9L8YDiBBIQURJuP3DEdUWIx3ybvew3e7O09RgnzFbHYS67m25WCr9aJnLxKtdzuYoTvP97AABaP9hz4r48td4+LX705QzwSdkQNIfAQ01zyeqFjLqwYzYq0YQCTBatE79TOV6paqSqhSbUKsPVqL1o4YuB9sR71mVJgMlgp/C1BUrmt1B+V7ydTwUsusk6QVH8N3KcCkC

On Wed, 15 Oct 2025 17:53:46 +0200
Peter Zijlstra <peterz@infradead.org> wrote:

> I have sufficient pending email such that any extra effort just means I
> won't bother.

I'm curious. Why do you need to see the entire series? Would a cover letter
and the patches that affect your code be enough?

Because seriously, I've skipped several series because I look at one or two
patches and say to myself "why am I Cc'd on this?" and skip it. Only later
to find out that patch 18 affected by code.

It's much easier to find the entire series from a single patch than it is
to find "what touches my code" from a large series.

-- Steve
