Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4152F3B
	for <tools@linux.kernel.org>; Thu, 23 Jan 2025 13:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737637653; cv=none; b=YEi+O48HTOFGlTEEzJNqIecHzhwl2Z2gXWjTxs6rZTflhbtnKtOI29BZOv/5Ay1fHoh3rY7UWNCRGEeTZTxY7y4ObW8J73ZMaTHb8fMdk/oCwbRtUkjsJD8tLhtbpXkMjWNMI0/KZeCQULy33CSIeYxy//FsZQV5Ws1HNrrYmlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737637653; c=relaxed/simple;
	bh=Wo1FrjwRVPPcdiyQCMVKqN1phiEMxq31iy5Q9Mp6adU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JC68uocmNu9FNR3GHQwvOFKeojsWFgRKbmCbnwKjg2to7rCDOhxwsYNdPH25uoZMe0S6QnUko95bf3BssnwmuXg1EJddVlwyxaUE1Oum3NpvgrqUN9+GeTXmcm2N7OcWm9/Uz3AIUbppCj4k8gQoYVTxBKEohwuRUxqt1WmfuFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZkuOYY3I; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZkuOYY3I"
Received: by smtp.kernel.org (Postfix)
	id 0FDD2C4AF0B; Thu, 23 Jan 2025 13:07:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FAC1C4CED3;
	Thu, 23 Jan 2025 13:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737637652;
	bh=Wo1FrjwRVPPcdiyQCMVKqN1phiEMxq31iy5Q9Mp6adU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZkuOYY3IKxjwLL7WUYOxBh3IB/IZUgBp3B/sRk5vBGxO8VpC8qPLdijwXHqojj+uG
	 +fKXBuKqQ4VBKMqzwPV8GkzsUkE0fwk6QMakb7TNzMESJd4TL4DM5kV2sJDyj8lkpC
	 E2NnTLvgY5RcQWfrWXcAHEyqJvf0F8ml6+PQnQGDpClpIfBc6cuNT+zbHzmCi3L6SM
	 x/tt3RUSBLCXEC96ij/1a4jTZQ2bSvdjVJJlQAdQ/gLnzTpeGhgrAse2lNSHM1NjQh
	 aTwVMVJLCsSXc7pLECtr759BfE5lUxr2zXPmoZ5DIG6zxabtpmXY2YWCtdXGCJnV/s
	 qdNWnXw2vA0JA==
Message-ID: <281c2d0b-a04a-4e5b-a5e9-bf5eb080e5e2@kernel.org>
Date: Thu, 23 Jan 2025 14:07:29 +0100
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH b4 v2] send: generate patches with --no-mailmap
To: Matthieu Baerts <matttbe@kernel.org>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "Kernel.org Tools" <tools@kernel.org>
References: <20240923-send-mailmap-v2-1-e2c62f1de79b@kernel.org>
 <20250122-dinosaur-of-perfect-conversion-7dfabc@lemur>
 <bb76736a-05ee-4c67-a8bc-626d81838089@kernel.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <bb76736a-05ee-4c67-a8bc-626d81838089@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/01/2025 12:04, Matthieu Baerts wrote:
> Hi Konstantin,
> 
> On 22/01/2025 17:10, Konstantin Ryabitsev wrote:
>> On Mon, Sep 23, 2024 at 06:04:31PM +0200, Matthieu Baerts (NGI0) wrote:
>>> b4 uses 'git show' to generate patches. By default, this command will
>>> use the mailmap file to convert author and committer names and email
>>> addresses if there is a match.
>>>
>>> That's good to display the last identity when looking at old commits in
>>> the history, but it doesn't sound like a good idea when sending patches.
>>> 'git format-patch' doesn't use the mailmap file, it currently doesn't
>>> even support it, and it is not planned to support it apparently [1].
>>> Note that 'git send-email' might support a new '--mailmap' option, but
>>> it looks like this option will not be enabled by default [2].
>>>
>>> In my case, I had to send some patches, including one from someone else
>>> who has to use the email address from his company, but has an entry in
>>> the mailmap file to his @kernel.org email address. When I sent his
>>> patch, b4 seamlessly converted his email address, and caused checkpatch
>>> to complain, because the From and the SoB entries were different.
>>
>> I've been sitting on this for a bit, simply because I'm 50/50 on whether this
>> is the right thing to do. On the one hand, I see your point, but on the other
>> it seems that if there is a mailmap entry, then the person would probably like
>> to prefer to receive mail at their new address, not at their old one.
> 
> Thank you for having looked at this patch!
> 
> To me, most of the time, it doesn't make sense to change the 'From'
> field when sending a patch: it might remove attributions, create
> differences when sending patches for stable, incoherences between the
> From and the Signed-off-by, etc.
> 
> (In my case, it was not an "old" address, but the owner is not able to
> use it to send emails on the mailing list. Still, his employer asked him
> to keep his email address in the patches he sends. That's why his work
> email is in the mailmap file, even if it is still used in patches, but
> not in the mailing lists.)
> 
>> What does everyone else think?
> 
> I guess that's a particular case, because I happened to send series
> including such email address :)

I would expect b4 working here exactly like git format-patch, where you
have commit with old identity (mailmapped or not, does not matter) and
resulting git format-patch (with mailmap entry and default arguments)
produces result as:

   From: old me
   Signed-off-by: old me
   Signed-off-by: new me

(with or without final SoB, discussion is not about DCO)

And above is necessary for all cases of changing employers.

So if b4 does not work like this, then this should be either fixed or +1
for this approach.

Best regards,
Krzysztof
