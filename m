Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D46302CDB
	for <tools@linux.kernel.org>; Thu, 16 Oct 2025 08:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760602849; cv=none; b=jbN2e30c8zeeAYLtx3xR1ThbsjQ72gof73ofnoYJrpQvMOC5J5WxrkN8nefb8kDqdIOwc22ZUYsJ4egkGmy2uBZcwt0pWGRR9JA03UIOZ1jrTImjft2a5ViUEPeB9Fgpj/izry15DLe7kPwtsmisWzu/3+WClVrcnYTEvyznYds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760602849; c=relaxed/simple;
	bh=WmNQhtQjrqzJ6ww055/lig9L3CR+Q+TIaq8vKh6DjEY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ui1rV+v1DBAt15aqVt4ZxsM6Ehm1rhDI7ybN51JOMXeEAH1iojU1nADMBFQA/0X1SCCwed/GqemLMG49XuKIsXgC2qcaEsHpNImSFDppTul9FV5IojTYgmeP9blw6qSv5UCSFoib4qGZOmmQlMGMX8DmHpvwOemVp8SJ/jvyWQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SKlyr5uX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SKlyr5uX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33207C4CEF1;
	Thu, 16 Oct 2025 08:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760602848;
	bh=WmNQhtQjrqzJ6ww055/lig9L3CR+Q+TIaq8vKh6DjEY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SKlyr5uXjJEgWZhl7mPw3PACF9JcwYMx6Q/CwyW9zWjO/ciwLe/llPlF7EW74NVyQ
	 ZpoOOeFY3m/ReoyFI+Jr6lyEUjjeTwme57yjOtmgNn3wIGTckoOtq8AaimKnes5hkv
	 Cg3FM7q5DCCT42YYGwSVUJcrRll0biFXkm2h1CAue4qM0AATFKvBx0p3mlEQEqE2oq
	 M2gBRR3CSZevBkPoB9HH01CTaI1tThUoXwO/c2IZ1e1KogL0rawvmlxwLRQsafvMCl
	 /BJJsh4uXNXgWbOKB293FBS+NpVqwH62E+rO/ABwhK+c/qxIddfGL+uQW8JvghoXwR
	 LVL/w6KZ7GUGQ==
Message-ID: <a0152333-3dd6-4f96-9808-8c963d785e68@kernel.org>
Date: Thu, 16 Oct 2025 10:20:44 +0200
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [workflows]Re: In defense of Link (was Re: [b4] initial "b4 dig"
 to supplant Link: trailers)
To: Peter Zijlstra <peterz@infradead.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
 James Bottomley <James.Bottomley@hansenpartnership.com>,
 Mark Brown <broonie@kernel.org>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Linus Torvalds <torvalds@linuxfoundation.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>, users@kernel.org,
 tools@linux.kernel.org
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
Content-Language: en-US
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
In-Reply-To: <20251016073232.GF3419281@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/16/25 09:32, Peter Zijlstra wrote:
> On Wed, Oct 15, 2025 at 09:40:43PM +0300, Laurent Pinchart wrote:
> 
>> I've been similarly annoyed at partial series in the past, but that was
>> because I wasn't CC'ed on some important patches, not because I didn't
>> receive the whole series.
>> 
>> When doing tree-wide or subsystem-wide refactoring, it's typical for the
>> first patches to rework/improve/extend some APIs, and then for the
>> remaining of the series to address drivers one at a time. The cover
>> letter should explain the rationale. I've been CC'ed multiple times just
>> on a patch that touches a driver I maintain, without being CC'ed on the
>> first patches in the series that show what's going on. That's annoying,
>> even if I'm CC'ed on the cover letter.
> 
> This, very much this. How are you supposed to judge the new API usage if
> you've not seen the implementation.
> 
> But I've also had more involved cases where people were trying to solve
> a 'problem' and me then only seeing a very small part of it and going
> WTF. By going back and looking at the whole thing you can maybe suggest
> an alternative approach, which isn't at all possible if you've just been
> given a very small piece of the puzzle.
> 
>> On the other hand, being CC'ed on 50 patches touching lots of drivers
>> in very similar way causes lots of noise.
>> 
>> In such cases I try to adopt a middle ground, CC'ing everybody on the
>> cover letter and the core patches, and CC'ing only relevant people to
>> the driver patches. Is this something you would find annoying, would you
>> prefer always being CC'ed on a full 50+ patch series ?
> 
> So I'm in the simple rules and overkill camp. Send me everything, that
> way I'm sure you're not forgetting something.
> 
> The moment you start to make 'maybe' rules and people need to think
> (like the Link thing seems to be now), things become subjective and
> blergh.

Perhaps a solution that would work universally on the sender side (not
knowing particular receiver preference) and could be automated is to use
"To:" when individual patch touches the code of given maintainer, and "Cc:"
when it's not. People who only want to see their patches (plus cover letter)
like Steven would then have a hopefully easy way (easier than by diffstat)
to filter that out?

> So yeah, I would be okay with the core patches and the patches touching
> 'my' subsystems, but the moment we have a different view of what
> constitutes that core, or someone fat-fingers it, I'd much rather have
> been on everything. Everything is simpler, simple is good.
> 
> And I don't mind the 50+ patch series -- provided I can indeed really
> ignore most of it. I'm very good at not reading email -- job requirement
> for maintainers at this point :-(
> 
> 

