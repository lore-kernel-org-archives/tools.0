Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EFA4470439
	for <tools@linux.kernel.org>; Wed,  5 Aug 2026 17:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785949638; cv=none; b=s2rI+p6nq8eAoQphfXMDi+zFRtbRHNdmf5KY6EmQVq1jLfxChjccz1yefq+QbD3IMOzqbsK/6ycvSixivBO5k5iRXNbzLbINTQ9HSLJ006HlWhshTCLqsIndrjZnAw5NYyTdygTP4qwGWuT2WHOK2Ofa59kUYsbIW/SRgFLT19M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785949638; c=relaxed/simple;
	bh=3ZSt7R6xTpEjJKHhTFp0ZzzzqADsJWQajiZmdsT23Ag=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HVm02tlbu4cIGTQemi9THongTf0J4Gh+A/P6BhaABr7qPG+7k3htqSuETDqt0Gx5MBa+GaKf3ma4KLeG5o9/5qPSvUK9DkIA2IRpmSBT5h/njHYZ1IZv7yZuXbx0f9/sC7CHGOjvhCQgdNSyQEfLX6OdE2ugFGm8UQOTEoabrTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KB22ViKB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KB22ViKB"
Received: by smtp.kernel.org (Postfix)
	id EDDB41F00A3F; Wed,  5 Aug 2026 17:07:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 268661F00A3E;
	Wed,  5 Aug 2026 17:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785949636;
	bh=sTElYPzRlUya61d8Z8rHgsDuaxSDv04XW5T5BgB1ye0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=KB22ViKBXtAhIL91+yQrsUOAK6VMkzWj8u0E8aJOYNg0ZdVN623GkckzIoxh3Jktv
	 icrykrW3xIHulDcOeReLCopBoLLkZkea5br6bdx9wHQVfGZcwAdtdTMh0VpBz95Le0
	 Y5Q+4fPT/2IBe7YNw3c1eoeQIWZaeEQB2Jm7bixa+BblxZMBDkvXRcqs+VTSpse4oo
	 IO3QI1UAomgyF1dd1jrTTu/6TlRg6JmIZl02Ptj1TF4wKKeD73/QTSolWJZvxH3IyZ
	 9JgO69bB3wvAGKYXuspiWnKX9li4HG+G7+QYCK5kdtx2O95Ti6cROstqmhsyrEeSKY
	 vUrtgpakMduNA==
Message-ID: <876c0cb2-8cfb-4254-9868-afa4efb292f2@kernel.org>
Date: Wed, 5 Aug 2026 19:07:13 +0200
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: b4 review tui: too smart reply features?
Content-Language: fr
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "Kernel.org Tools" <tools@kernel.org>
References: <c281cf50-7935-488c-8429-03eac9b8902e@kernel.org>
 <20260610-psychedelic-encouraging-quoll-c7b949@lemur>
 <b2c44799-85a9-4576-9aae-b43eb1092315@kernel.org>
 <20260729-pig-of-lucky-economy-3a5ace@meerkat>
From: Matthieu Baerts <matttbe@kernel.org>
Autocrypt: addr=matttbe@kernel.org; keydata=
 xsFNBFXj+ekBEADxVr99p2guPcqHFeI/JcFxls6KibzyZD5TQTyfuYlzEp7C7A9swoK5iCvf
 YBNdx5Xl74NLSgx6y/1NiMQGuKeu+2BmtnkiGxBNanfXcnl4L4Lzz+iXBvvbtCbynnnqDDqU
 c7SPFMpMesgpcu1xFt0F6bcxE+0ojRtSCZ5HDElKlHJNYtD1uwY4UYVGWUGCF/+cY1YLmtfb
 WdNb/SFo+Mp0HItfBC12qtDIXYvbfNUGVnA5jXeWMEyYhSNktLnpDL2gBUCsdbkov5VjiOX7
 CRTkX0UgNWRjyFZwThaZADEvAOo12M5uSBk7h07yJ97gqvBtcx45IsJwfUJE4hy8qZqsA62A
 nTRflBvp647IXAiCcwWsEgE5AXKwA3aL6dcpVR17JXJ6nwHHnslVi8WesiqzUI9sbO/hXeXw
 TDSB+YhErbNOxvHqCzZEnGAAFf6ges26fRVyuU119AzO40sjdLV0l6LE7GshddyazWZf0iac
 nEhX9NKxGnuhMu5SXmo2poIQttJuYAvTVUNwQVEx/0yY5xmiuyqvXa+XT7NKJkOZSiAPlNt6
 VffjgOP62S7M9wDShUghN3F7CPOrrRsOHWO/l6I/qJdUMW+MHSFYPfYiFXoLUZyPvNVCYSgs
 3oQaFhHapq1f345XBtfG3fOYp1K2wTXd4ThFraTLl8PHxCn4ywARAQABzSRNYXR0aGlldSBC
 YWVydHMgPG1hdHR0YmVAa2VybmVsLm9yZz7CwZEEEwEIADsCGwMFCwkIBwIGFQoJCAsCBBYC
 AwECHgECF4AWIQToy4X3aHcFem4n93r2t4JPQmmgcwUCZUDpDAIZAQAKCRD2t4JPQmmgcz33
 EACjROM3nj9FGclR5AlyPUbAq/txEX7E0EFQCDtdLPrjBcLAoaYJIQUV8IDCcPjZMJy2ADp7
 /zSwYba2rE2C9vRgjXZJNt21mySvKnnkPbNQGkNRl3TZAinO1Ddq3fp2c/GmYaW1NWFSfOmw
 MvB5CJaN0UK5l0/drnaA6Hxsu62V5UnpvxWgexqDuo0wfpEeP1PEqMNzyiVPvJ8bJxgM8qoC
 cpXLp1Rq/jq7pbUycY8GeYw2j+FVZJHlhL0w0Zm9CFHThHxRAm1tsIPc+oTorx7haXP+nN0J
 iqBXVAxLK2KxrHtMygim50xk2QpUotWYfZpRRv8dMygEPIB3f1Vi5JMwP4M47NZNdpqVkHrm
 jvcNuLfDgf/vqUvuXs2eA2/BkIHcOuAAbsvreX1WX1rTHmx5ud3OhsWQQRVL2rt+0p1DpROI
 3Ob8F78W5rKr4HYvjX2Inpy3WahAm7FzUY184OyfPO/2zadKCqg8n01mWA9PXxs84bFEV2mP
 VzC5j6K8U3RNA6cb9bpE5bzXut6T2gxj6j+7TsgMQFhbyH/tZgpDjWvAiPZHb3sV29t8XaOF
 BwzqiI2AEkiWMySiHwCCMsIH9WUH7r7vpwROko89Tk+InpEbiphPjd7qAkyJ+tNIEWd1+MlX
 ZPtOaFLVHhLQ3PLFLkrU3+Yi3tXqpvLE3gO3LM7BTQRV4/npARAA5+u/Sx1n9anIqcgHpA7l
 5SUCP1e/qF7n5DK8LiM10gYglgY0XHOBi0S7vHppH8hrtpizx+7t5DBdPJgVtR6SilyK0/mp
 9nWHDhc9rwU3KmHYgFFsnX58eEmZxz2qsIY8juFor5r7kpcM5dRR9aB+HjlOOJJgyDxcJTwM
 1ey4L/79P72wuXRhMibN14SX6TZzf+/XIOrM6TsULVJEIv1+NdczQbs6pBTpEK/G2apME7vf
 mjTsZU26Ezn+LDMX16lHTmIJi7Hlh7eifCGGM+g/AlDV6aWKFS+sBbwy+YoS0Zc3Yz8zrdbi
 Kzn3kbKd+99//mysSVsHaekQYyVvO0KD2KPKBs1S/ImrBb6XecqxGy/y/3HWHdngGEY2v2IP
 Qox7mAPznyKyXEfG+0rrVseZSEssKmY01IsgwwbmN9ZcqUKYNhjv67WMX7tNwiVbSrGLZoqf
 Xlgw4aAdnIMQyTW8nE6hH/Iwqay4S2str4HZtWwyWLitk7N+e+vxuK5qto4AxtB7VdimvKUs
 x6kQO5F3YWcC3vCXCgPwyV8133+fIR2L81R1L1q3swaEuh95vWj6iskxeNWSTyFAVKYYVskG
 V+OTtB71P1XCnb6AJCW9cKpC25+zxQqD2Zy0dK3u2RuKErajKBa/YWzuSaKAOkneFxG3LJIv
 Hl7iqPF+JDCjB5sAEQEAAcLBXwQYAQIACQUCVeP56QIbDAAKCRD2t4JPQmmgc5VnD/9YgbCr
 HR1FbMbm7td54UrYvZV/i7m3dIQNXK2e+Cbv5PXf19ce3XluaE+wA8D+vnIW5mbAAiojt3Mb
 6p0WJS3QzbObzHNgAp3zy/L4lXwc6WW5vnpWAzqXFHP8D9PTpqvBALbXqL06smP47JqbyQxj
 Xf7D2rrPeIqbYmVY9da1KzMOVf3gReazYa89zZSdVkMojfWsbq05zwYU+SCWS3NiyF6QghbW
 voxbFwX1i/0xRwJiX9NNbRj1huVKQuS4W7rbWA87TrVQPXUAdkyd7FRYICNW+0gddysIwPoa
 KrLfx3Ba6Rpx0JznbrVOtXlihjl4KV8mtOPjYDY9u+8x412xXnlGl6AC4HLu2F3ECkamY4G6
 UxejX+E6vW6Xe4n7H+rEX5UFgPRdYkS1TA/X3nMen9bouxNsvIJv7C6adZmMHqu/2azX7S7I
 vrxxySzOw9GxjoVTuzWMKWpDGP8n71IFeOot8JuPZtJ8omz+DZel+WCNZMVdVNLPOd5frqOv
 mpz0VhFAlNTjU1Vy0CnuxX3AM51J8dpdNyG0S8rADh6C8AKCDOfUstpq28/6oTaQv7QZdge0
 JY6dglzGKnCi/zsmp2+1w559frz4+IC7j/igvJGX4KDDKUs0mlld8J2u2sBXv7CGxdzQoHaz
 lzVbFe7fduHbABmYz9cefQpO7wDE/Q==
Organization: NGI0 Core
In-Reply-To: <20260729-pig-of-lucky-economy-3a5ace@meerkat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Konstantin,

On 29/07/2026 06:38, Konstantin Ryabitsev wrote:
> On Tue, Jun 30, 2026 at 12:55:25PM +0200, Matthieu Baerts wrote:
>> I just retried, and it is indeed much better now! Yet, I still have an
>> issue with trailers, e.g.
>>
>>   Please add a Fixes tag. Here I guess it should be:
>>
>>   Fixes: (...)
>>
>> The Review view then correctly showed my comment with the Fixes tag, but
>> *I think* the Fixes tag was not visible in green at the bottom left (not
>> sure, because I also added a Reviewed-by tag after the reply). When
>> looking at the 'email mode' view, the Fixes tag got dropped, leaving 2
>> empty lines around.
> 
> This turned out to be two separate bugs, thanks for the detailed description!
> 
> There's an attempted fix in the current master: the trailer menu now only ever
> touches its own trailer types (Acked-by, Reviewed-by, Tested-by, NACKed-by).
> Anything else you type into the reply -- Fixes:, Cc:, Suggested-by:, whatever
> -- is treated as your content and is never moved or removed.
> 
> Removing a trailer via the menu should also no longer leave a doubled blank
> line behind.
> 
>> Back to the 'reply' view, vim showed all lines ending with ^M, and the line
>> starting with 'Fixes:' was no longer there. Adding it back re-added it to
>> the other views, and the Fixes tag was also listed at the bottom left in the
>> 'review' view, but I could see extra new lines due to all these \r.
>> Stripping them from the 'reply' view fixes all the issues, and I was able to
>> send the reply with both my Fixes and Reviewed-by tags.
>>
>> Any idea was caused that? :)
> 
> That was bug number two, also with a fix on mater: b4 now normalizes
> line endings on every editor round-trip, whatever your editor decides to
> write, and previously stored buffers get cleaned up the next time they're
> touched.
> 
> Try them out!

Thank you, I re-tried today (after I saw all boxes were checked for
v0.16), and it is smoother indeed!

BTW, thank you for the v0.16!

>> BTW, after having sent a reply, it appears a few seconds later as unread in
>> my inbox. I guess only a filter on the inbox side can help to mark them as
>> read, right?
> 
> This annoys me, too, so I'll think of a way to handle this.

If it could also mark the patch I'm replying too as read, that would be
even better! But I guess it is not planned to give IMAP access :)
I guess yet another filter on the mail side could help, but maybe
trickier (or simply "ignoring" all patches that are supposed to be
handled by b4 by moving them to a different folder).

Cheers,
Matt
-- 
Sponsored by the NGI0 Core fund.

