Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11A6DF72
	for <tools@linux.kernel.org>; Mon, 13 Oct 2025 08:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760343502; cv=none; b=P84EGKqK0yDXeAkU8dVA77KRjXdKQoe4lVVc/34D57mRDbmM9wI3th0jpzR6NHNACCcnCJu3TdHoLP9bZ6kh729rhdb3U3pVkD4VHruRBshVNaGJUqZPSyNpG6zLtdL7s8aR0uZay5dKWv446vyIt/rwfBrlpREGbGosOuZ/z48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760343502; c=relaxed/simple;
	bh=G7qRE7IbVXD6HRBD5AQvPdwlIZI27q9mYGG2ffQTkpY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PT8ObBAoAoXwtgnk7XutjRbP+NYYaLMKqaJQftQ9+DMAcTCszylJda0T/lvDzIPM09VDNvIhdZKlNWFL6NDuukmX42dZoLVd1Wmfl8583qcVSlUpABaff4iBpZGmmYw1Z0qxIXkdVO8+Y99WFVmhfPCxebeSIyS+iFbE/eEOPW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EmkUx6He; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EmkUx6He"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39627C4CEE7;
	Mon, 13 Oct 2025 08:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760343502;
	bh=G7qRE7IbVXD6HRBD5AQvPdwlIZI27q9mYGG2ffQTkpY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EmkUx6HeLuKInyVpEiRO4/kVbWshdnSDSaPgF8VS7CXXkI40OqCTbRVq+2/gfaRjr
	 m6ezCoYR9lc4qcTWTjHha2qvZB6T2puVSonp/sRCkAHuAbBQ6+j6ngnE75DGrDwvnS
	 AbX4Pv+PxockVYA5EBGcW2g4JQ29dv/GV9ovCpRcpWZt+osl0sFaVnHixmKcpX4uxr
	 eFRwfEH3SaUSMN9fF6cSJfyqpqoxVViPAtCw1hbjHJ+RVUrbSZiCqLZXkTvfXxA/0g
	 faOEziR4gwO/wTnla0UAA1mldhly2oii4660tBWq+1iVeXumsCz4erPBH0ORGO617V
	 rWJvy54pqGmhA==
Message-ID: <d884ec6d-856c-4dce-b8bf-cb6116c87bcb@kernel.org>
Date: Mon, 13 Oct 2025 10:18:19 +0200
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: In defense of Link (was Re: [b4] initial "b4 dig" to supplant
 Link: trailers)
Content-Language: en-US
To: Jason Gunthorpe <jgg@ziepe.ca>, Mark Brown <broonie@kernel.org>
Cc: Willy Tarreau <w@1wt.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>, users@kernel.org,
 tools@linux.kernel.org
References: <CABgObfY5agTRsB-bCqCYbA0erFn5cVbujtTNBiCti8g_68nCWg@mail.gmail.com>
 <20251011061351.GB23024@1wt.eu> <aOoyhUzNDgwiyl5s@finisterre.sirena.org.uk>
 <20251012232725.GC3938986@ziepe.ca>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
In-Reply-To: <20251012232725.GC3938986@ziepe.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/13/25 01:27, Jason Gunthorpe wrote:
> On Sat, Oct 11, 2025 at 11:33:41AM +0100, Mark Brown wrote:
>> On Sat, Oct 11, 2025 at 08:13:51AM +0200, Willy Tarreau wrote:
>> 
>> > Maybe what would be needed would be a "Lore" (or "Series" or "Discussion")
>> > trailer that automatically makes a lore link from the message-id, and
>> > which would explicitly indicate that there's nothing else there but the
>> > actual patch submission, contrary to Link that's for any extra info ?
>> > It would be added by "git am" when passed a specific option.
>> 
>> There was an attempt to do that with the https://patch.msgid.link
>> domain, that's basically the same idea just done with a domain instead
>> of the name of the tag.  Linus wasn't any happier with that idea
>> unfortunately.
> 
> FWIW I thought that was a great compromise and have been trying to
> follow the 'if it is mechanical information it is msgid.link' and 'if
> it is deliberately meaningful then it has a [1] footnote and a lore
> URL'
> 
> IMHO, I think a 'b4 dig' like tool is a great way to address Linus's
> use case of: 'show me all mailing list discussions about this commit
> and highlight what might be interesting'
> 
> I think including the msgid.link would make this job of b4 dig work
> better.
> 
> Like others in the thread I use the Links directly quite a bit, it
> works well and is convenient.
> 
> eg I posted a bisection found regression 6 months after the series
> was accepted and got a fix:
> 
> https://lore.kernel.org/lkml/20250917153209.GA2023406@nvidia.com/
> 
> Responding to the original series is the easiest way to get a solid
> list of interested parties.

That's all nice and everything Jason, but Linus has been very clear on this,
so it's just beating a dead horse now.

> Jason
> 

