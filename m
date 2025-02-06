Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3330239572
	for <tools@linux.kernel.org>; Thu,  6 Feb 2025 17:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738862650; cv=none; b=gh9HItyFT949sxbWxcX0MfOa+vGtm6Ep46P0TW2aLTmO0a+HWCjivcqO4Py92XX6C43DneGVrF3MnnWdwNQqEDtRiYsOWb1bKf4SZcRMB1nRln6WFQq3xrNsaPxKyyyepY1eZy6psIeG88zBvSYtt3L83lEdYzWjHB/B80ev964=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738862650; c=relaxed/simple;
	bh=S+3+0EbPO91OAy8+1rFLBSlU3SB5k8JZlDd+tn8d798=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E1SQV2KhLXOKO7YIgCbwQrt3hiSnvTJcowDXzGGMBAjeIszUaLwHlGYQ7goQsClZjU7Dyzy4LZWvLJe/1TdrwhBzFzO6fDml3xf95Uf33fucNxXhtrmsJo4dH53eeYGTU2bsSPab/uHhpcCoI8OBMU02V21i6ecAFB4fQLrrbjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H7ESQ/i5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H7ESQ/i5"
Received: by smtp.kernel.org (Postfix)
	id 17A21C4CEE2; Thu,  6 Feb 2025 17:24:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7359DC4CEDD;
	Thu,  6 Feb 2025 17:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738862649;
	bh=S+3+0EbPO91OAy8+1rFLBSlU3SB5k8JZlDd+tn8d798=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=H7ESQ/i52Uy8nbJnpiEeQ9Ck3CM/nzuqEkVxFiwZiPn0CiaSxVMWIazRVyXX3LJTt
	 Y4RzLG93lyHqbDPUuluKwLDCvCef7NOEUXtYi9A44LIDuRzllqUnCd6otGJa2h9S1z
	 2/pkzhse60id9zDZ6nzxyKKT66WuXl1CosMpBlh9/I6pJbFg8mjUtqB83QfnMzP14p
	 fMcpjBOLyuueQYXAm347/k8nv63uegJ+1EwkaQK0ZicDz6bgLB3+WKvq8hnjrbupHX
	 tj2TZ9zofoSnuU7qoij/DnNWvSnnSvEjF57bJVqNHtQQ052jY+RSFXlNbWedWC48Q2
	 RNatthCW9/LeQ==
Message-ID: <16783231-108e-485a-8db5-f40f9c6bee9f@kernel.org>
Date: Thu, 6 Feb 2025 18:23:58 +0100
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH b4 v2] send: generate patches with --no-mailmap
Content-Language: en-GB
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "Kernel.org Tools" <tools@kernel.org>
References: <20240923-send-mailmap-v2-1-e2c62f1de79b@kernel.org>
 <20250122-dinosaur-of-perfect-conversion-7dfabc@lemur>
 <bb76736a-05ee-4c67-a8bc-626d81838089@kernel.org>
 <20250123-macho-sidewinder-of-acceptance-8dea0f@meerkat>
 <e6c6f928-bae7-4509-9410-42e4bf7d9252@kernel.org>
 <20250205-polar-spiffy-baboon-09cd5d@lemur>
 <8f145a14-d876-4a81-9c1e-cdc61dab2ef0@kernel.org>
 <20250205-shrewd-wolverine-of-examination-dea5c0@lemur>
From: Matthieu Baerts <matttbe@kernel.org>
Autocrypt: addr=matttbe@kernel.org; keydata=
 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
 lzVbFe7fduHbABmYz9cefQpO7wDE/Q==
Organization: NGI0 Core
In-Reply-To: <20250205-shrewd-wolverine-of-examination-dea5c0@lemur>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Konstantin,

On 05/02/2025 21:53, Konstantin Ryabitsev wrote:
> On Wed, Feb 05, 2025 at 05:29:45PM +0100, Matthieu Baerts wrote:
>>>> So doing this in cmd_send():
>>>>
>>>>  -    mailmap_replace = b4.get_git_bool(sconfig.get('mailmap', 'false'))
>>>>  +    mailmap_replace = b4.get_git_bool(sconfig.get('mailmap', 'true'))
>>>>
>>>> WDYT?
>>>
>>> I'll just roll back that part and simplify things back down to just pass
>>> --no-mailmap to the git-show command.
>>
>> Thank you, looks good to me!
> 
> The changes are in place in the latest master.

Great, thanks!

> Please follow up if there's more work that is required.

Sorry, I have one last question about this. When reading this part of
your commit message ...

> The consensus is that we *do* want to apply mailmap updates to the
> actual addresses going into to/cc, just not to the in-body From:
> addresses generated during the "git show" stage.

... I'm wondering if there is still a need to look at the
sendemail.mailmap config: it is now only used to modify the behaviour of
patches generation, and not how/to who they are going to be sent. In
Git, this config option is supposed to act only on the second part.

Don't get me wrong, the current version fixes my issue, and I'm happy
with that! Plus I know I suggested looking at sendemail.mailmap as a
"workaround". But now that the confusion around my issue has been
cleared up, maybe all we need here is to always use "git show
--no-mailmap" and forget about sendemail.mailmap? :)

Cheers,
Matt
-- 
Sponsored by the NGI0 Core fund.

