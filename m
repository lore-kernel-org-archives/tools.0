Received: from relay.hostedemail.com (smtprelay0013.hostedemail.com [216.40.44.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54AE032861F
	for <tools@linux.kernel.org>; Thu, 16 Oct 2025 13:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760623135; cv=none; b=dI+4y7V7/QYRYUK4rcL81HDZfRf3X37q5oFeq7AJEhR5VF5xAZX6/p22csnoYfyY4c9Dj/Blp3x3qdAJcZS1VCW0gHxBhzQDk5YkMtROEukKTjmnflvaSvmcEtVsj2ciBRSOzyJchMttvhZnJKMz70nP1svng3RF9piNOA/J2PY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760623135; c=relaxed/simple;
	bh=O5IP68XVLrNEUT2X/Imp5IwOUEBVYrusOc+hsjbMAqM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=psIabYjELE7wgX2V/Csf7Y7PzSGiy2X3g/Xb+bAvwRJgy+pT8HI2HEDUJ2vgjUPUoM5dqMNJ9i8yy1zBMDp9idxWZRZOZmS+qEozmIu2T4K1FyUcEyFayGjZigu2MOWKluRLz6RscY0CZr++2DV5+Nk/4P4mM8lCnRCDALUXH1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf06.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay04.hostedemail.com (Postfix) with ESMTP id 3630C1A032F;
	Thu, 16 Oct 2025 13:58:51 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf06.hostedemail.com (Postfix) with ESMTPA id 7D6EA2000F;
	Thu, 16 Oct 2025 13:58:48 +0000 (UTC)
Date: Thu, 16 Oct 2025 09:58:58 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, James Bottomley
 <James.Bottomley@hansenpartnership.com>, Mark Brown <broonie@kernel.org>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Linus Torvalds <torvalds@linuxfoundation.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>, users@kernel.org,
 tools@linux.kernel.org
Subject: Re: [workflows]Re: In defense of Link (was Re: [b4] initial "b4
 dig" to supplant Link: trailers)
Message-ID: <20251016095858.79d2ed6f@gandalf.local.home>
In-Reply-To: <a0152333-3dd6-4f96-9808-8c963d785e68@kernel.org>
References: <CAMuHMdWxMhM1J3zHC8OkN_fd8XsJPFA6jM_3JFU=ySKhnX6ESw@mail.gmail.com>
	<CANiq72ka1y0YXysRQtuqnzc0i5FSbrGjKwprrXQpozwDOV3khA@mail.gmail.com>
	<aadb0515-4024-40c0-8024-fcdd029a3029@sirena.org.uk>
	<2991ae006906913c10715a9673ac53a4ea557728.camel@HansenPartnership.com>
	<20251015151447.GD3168635@noisy.programming.kicks-ass.net>
	<20251015111816.728bfda7@gandalf.local.home>
	<20251015155346.GA3287345@noisy.programming.kicks-ass.net>
	<20251015115917.5e031880@gandalf.local.home>
	<20251015160622.GB3287345@noisy.programming.kicks-ass.net>
	<20251015184043.GB30747@pendragon.ideasonboard.com>
	<20251016073232.GF3419281@noisy.programming.kicks-ass.net>
	<a0152333-3dd6-4f96-9808-8c963d785e68@kernel.org>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: oy5ts5yahmyukndtdgb5a1orh6wmuzu3
X-Rspamd-Server: rspamout05
X-Rspamd-Queue-Id: 7D6EA2000F
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+N5roy6WQupnA5dx/mhoFp6ux+huL4On8=
X-HE-Tag: 1760623128-358176
X-HE-Meta: U2FsdGVkX1+SHhO8Ll8NkpTaSqi3QGWNSam0s0sRcEw/HNL0SxOHnQV65UVlrOcMODSBVyBeW1uN9I3H9+HtaNLhVK0+ijvqMVCXykKXSIblGvaOhelMfml/joi0J3KWS6AyJQjKQ5JX88/rSxgxRiwNwdptpkphf/uIxoq3k9UeWTSj/yuHI2/S3iwkxNYL/bFhdPuq2Vz6ioN4t4JTJ5nLEYZgTVZHUBlRMMaF8U76b9/TAK0/iPgZSd4+mTps6h/U9ISnzUBhfL/I6Xu2ryrXrlo5wgoZ+3yHmyR3uLs2owF8rjO7H8HFym4P8NR1KcWziVU79GCcQO+0rZwCNbP2THDo9Zci

On Thu, 16 Oct 2025 10:20:44 +0200
"Vlastimil Babka (SUSE)" <vbabka@kernel.org> wrote:

> Perhaps a solution that would work universally on the sender side (not
> knowing particular receiver preference) and could be automated is to use
> "To:" when individual patch touches the code of given maintainer, and "Cc:"
> when it's not. People who only want to see their patches (plus cover letter)
> like Steven would then have a hopefully easy way (easier than by diffstat)
> to filter that out?

I'm not sure how much easier that would be. Looking at some of my other
emails, I can see the "to" section becoming quite large, and now I need to
find my name within 15 other names. Easier than a diffstat, but still more
likely to be ignored.

-- Steve
