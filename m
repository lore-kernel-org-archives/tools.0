Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86EF41B3937
	for <tools@linux.kernel.org>; Wed, 15 Oct 2025 16:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760544942; cv=none; b=k50YRKAkBl6sRRpajb/9PQmpnlTWkjNtq7/UL1oUfeX/FXTWsAb2EFbehW/Rfa6Le7ndb+YG+MRoxK3NMTp/G+R/2DzmfUl3gPNYq6CUEGeJbjR5dZnM4BoSKD3ZVcIhBLxECvuVNXE7lRPWsXuDPYrawkysonvDBGPKbYXGp7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760544942; c=relaxed/simple;
	bh=0+XVX7+oPdvn7cZUPy0FIvAvdj47uUXl3idTzocGghg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sUoOs+Q4RSo8JUAIcWsKLy2/uQjinHT3JOiDUDn9jiuXYkPYsjkPK2UI4c1aI+EgnFbTycwgMYXruBPTSFMRRRGFqZSkd4FKMQJN23FqqZ+VdMwo1VrEvYSpUST4w9h2r58WDej6JaHOC4WQd+nff5IplwQkp9sfnxfkyw0z7LI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K9sJ8Xl9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K9sJ8Xl9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA2F9C4CEF8;
	Wed, 15 Oct 2025 16:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760544942;
	bh=0+XVX7+oPdvn7cZUPy0FIvAvdj47uUXl3idTzocGghg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=K9sJ8Xl9YK8DlRM4Olnf+HylV5yIZaJ6J/49/EbLGqKiF9ThG/nK7zvdwkUlAZnw2
	 QRj1Lg5yUeT1o/JOx6OvkCxX+dy/y6Au1TmJkWTGanBy0VllXKZ0D1e4MQQZpSda1G
	 vxfN17PwkUcAQogjqEGAm5f5QPLPb9/kn25lLpvmzPv8JGsw9Ad42/qgs8+PqKh5+5
	 i5/oAfhtUZHXR4l86oDQS+62Oq2D01Vy0lBfGf3MY6Za31cp/qVrZF1l0gMrZ+ojZw
	 d5yGZFYbZ3+umhj1CZq29botUGJl9Ocm5MigbqpV7oeAt5b/a9WjBqLRid+4/mX0HL
	 mdYvc80yV/asw==
Message-ID: <9a07d307-ede5-404f-aff0-9f28f591e0aa@kernel.org>
Date: Wed, 15 Oct 2025 18:15:37 +0200
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [workflows]Re: In defense of Link (was Re: [b4] initial "b4 dig"
 to supplant Link: trailers)
Content-Language: en-US
To: Peter Zijlstra <peterz@infradead.org>,
 Steven Rostedt <rostedt@goodmis.org>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
 Mark Brown <broonie@kernel.org>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Linus Torvalds <torvalds@linuxfoundation.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>, users@kernel.org,
 tools@linux.kernel.org
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
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
In-Reply-To: <20251015160622.GB3287345@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/15/25 18:06, Peter Zijlstra wrote:
> On Wed, Oct 15, 2025 at 11:59:17AM -0400, Steven Rostedt wrote:
>> On Wed, 15 Oct 2025 17:53:46 +0200
>> Peter Zijlstra <peterz@infradead.org> wrote:
>> 
>> > I have sufficient pending email such that any extra effort just means I
>> > won't bother.
>> 
>> I'm curious. Why do you need to see the entire series? Would a cover letter
>> and the patches that affect your code be enough?
>> 
>> Because seriously, I've skipped several series because I look at one or two
>> patches and say to myself "why am I Cc'd on this?" and skip it. Only later
>> to find out that patch 18 affected by code.
>> 
>> It's much easier to find the entire series from a single patch than it is
>> to find "what touches my code" from a large series.
> 
> Because when I see a single patch, I end up wondering WTF does it do
> this, and then I have to go find the others, which I don't have, I get
> grumpy and either NAK or just yell. And no, the cover letter rarely
> answers the questions I have.
> 
> Finding where or which patch is directly affecting 'your' code is mostly
> trivially done by scanning the diffstats.

Such personal preferences could be encoded in MAINTAINERS with tooling doing
the right thing, perhaps.
