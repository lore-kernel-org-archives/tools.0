Received: from relay.hostedemail.com (smtprelay0015.hostedemail.com [216.40.44.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FABE25F98E
	for <tools@linux.kernel.org>; Wed, 15 Oct 2025 16:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760544901; cv=none; b=su4pjxB76AHyu52WggvK3HbnG0g3eocOjwqFhFUb825CBaCozs6xyvPnZTfg4W+ItRmm9ieltrLat2NrvN0m4ZJDjioxbsiwP8WWAW25yIHhhyVq47M5bNk2xVqFrn/o/Us0U61hGcSALlnme8NcTVI4vEl0I9aj/JYwmt6/D20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760544901; c=relaxed/simple;
	bh=ntNGX5w/KLfRjgOnE3CYSawmf6APsYLzQYSMf3d45HI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VOtKNPx39Hg+bw4k3AiN/AKRmsVJ4cTyd5iwowQPfLPVq7UeeymE2uSHTButjY3meuhI9+wsnl6Q08ctMxeuQB3fybxnilq5B2CEeKTaMkK6NXPoYfn6+00GA8qJYKNrrmG31q9nX3cD8+u9s/yI16lr0XaMxlP2KTEVXKUPhkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf12.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay10.hostedemail.com (Postfix) with ESMTP id 2D8F1C01C6;
	Wed, 15 Oct 2025 16:14:57 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf12.hostedemail.com (Postfix) with ESMTPA id A25441D;
	Wed, 15 Oct 2025 16:14:54 +0000 (UTC)
Date: Wed, 15 Oct 2025 12:15:02 -0400
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
Message-ID: <20251015121502.7430d067@gandalf.local.home>
In-Reply-To: <20251015160622.GB3287345@noisy.programming.kicks-ass.net>
References: <20251013081536-mutt-send-email-mst@kernel.org>
	<CAHk-=whSShtPG1_+02Cc4yDuEJxVqX=G8tAx0gW7UjA7cuBp-w@mail.gmail.com>
	<CAMuHMdWxMhM1J3zHC8OkN_fd8XsJPFA6jM_3JFU=ySKhnX6ESw@mail.gmail.com>
	<CANiq72ka1y0YXysRQtuqnzc0i5FSbrGjKwprrXQpozwDOV3khA@mail.gmail.com>
	<aadb0515-4024-40c0-8024-fcdd029a3029@sirena.org.uk>
	<2991ae006906913c10715a9673ac53a4ea557728.camel@HansenPartnership.com>
	<20251015151447.GD3168635@noisy.programming.kicks-ass.net>
	<20251015111816.728bfda7@gandalf.local.home>
	<20251015155346.GA3287345@noisy.programming.kicks-ass.net>
	<20251015115917.5e031880@gandalf.local.home>
	<20251015160622.GB3287345@noisy.programming.kicks-ass.net>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: A25441D
X-Stat-Signature: u78dhijmqt5ukp4kadh4irzpubyjauca
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX18l5JG9mimqO0JGUCWrp1LgIVhYpzvCwIo=
X-HE-Tag: 1760544894-793621
X-HE-Meta: U2FsdGVkX1+NHyKwyBHtRe7f1T1Wk62GtB9pQ3er6rDvshnHUnLmjTnNZ3N7MaDKFVj46MOdJTAt3S4A9rG6nT5slBMbvrU9o9clefTPHZqLCbHLuoK7MxNyv2aSArJHNXXnwEFi9WPrjoLALsA4o3QLUmrfcQ1mdM6hFy3xJhMH+5Q+PKmVVi0uMmqDUAbbQbIp1B71eX0lEYWswrm8hT3v6ACU70hLeJ7hgCwejgBVl1QgfAJvzRR6aymP8xF99eYIcK7c04/zp1EyQIJJbgQr/crnjPpwCx0F0jEIlCB9tb1BCUGu+zEp3W7NGkrMrUrJkkbeBjbxlVSeT2R9NFYDzJIEHESEe03bm/RHoSo+mT1dvGKYVQFGQ4zf3NUf

On Wed, 15 Oct 2025 18:06:22 +0200
Peter Zijlstra <peterz@infradead.org> wrote:

> Finding where or which patch is directly affecting 'your' code is mostly
> trivially done by scanning the diffstats.

I don't have the time to scan 20 different diffstats that are at the end of
every change log. Especially when it's not in the immediate view, and
requires scrolling. It takes much more time than a simple lore lookup.

And sometimes, the files don't actually tell me if I should look at a patch
or not. If there's a patch I need to look at, just Cc me on that patch. I
usually don't care about the rest.

-- Steve
