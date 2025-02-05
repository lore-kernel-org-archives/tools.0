Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF4737160
	for <tools@linux.kernel.org>; Wed,  5 Feb 2025 15:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738770387; cv=none; b=YR7BxXpptWNzusjZuWwdD0SV7OroOc4EZoNfnsjpouLX9kD1aj3frtN/bp7Di+YaGKdRDV8oDd7IpS8ziPFeJ75RZ3v/i4gxrWJ/dj7k+VTl9bVsmBx5nXHf1jrY1Dn16diJz9pdSY7YJtiXk7BkgQu+4LMZWLBHmdcksXY7TQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738770387; c=relaxed/simple;
	bh=7Anhm+ei1Uo0WNPXq3BKdEm5uLxqmleQeX+HbZUrDiw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WBjNfodgcfSKiPw0Qi7qjs1JqfiOtgpVzO1MJGdaPQB4aLgEsKLH22BqALhMPFH4MOrZhq665+pjXHmZgFoUdB6hmElg1F4qmjwfzEwqrCH2Ubewk7d1MrUyRIHuAr3h4/WfJq+Kw3Brh5jjlBkqVggb91qE6x3zoXp/FoA2QKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r+1QNeUb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r+1QNeUb"
Received: by smtp.kernel.org (Postfix)
	id 42533C4CEDD; Wed,  5 Feb 2025 15:46:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E381C4CED1;
	Wed,  5 Feb 2025 15:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738770387;
	bh=7Anhm+ei1Uo0WNPXq3BKdEm5uLxqmleQeX+HbZUrDiw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=r+1QNeUblQcgp/jwskqQTXhKVQEyWvWy4hXY4ppjNBdF86puqjSKXACWHv9wuarbw
	 X4MEpy+cC0SeSpr3bLOVKzDNURXcW9HvW2NqIdyhzOdmUIDvJlF1h78O1aIFdmz284
	 1Xg0ejTdF+jOOijsQmlgpBl5oGXVekB7JAabpucvizy2n34wQEokGuQleAm4LsZCA0
	 i/xlPFTIy0eekn/YcFfL5DkSpqzASXpsRuaJODCqO9vM0Wnb9+QrrGh//fEx3Yp/FB
	 Q9+RUkGwmCB3DfSkTahgNopTfVIhfUNuVh6hisSOtGQCB8CjoovEQ/Lc2ehxRDcGyJ
	 tdhwkULsslJlA==
Message-ID: <e6c6f928-bae7-4509-9410-42e4bf7d9252@kernel.org>
Date: Wed, 5 Feb 2025 16:46:16 +0100
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
In-Reply-To: <20250123-macho-sidewinder-of-acceptance-8dea0f@meerkat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Konstantin,

On 23/01/2025 19:04, Konstantin Ryabitsev wrote:
> On Thu, Jan 23, 2025 at 12:04:37PM +0100, Matthieu Baerts wrote:
>>> What does everyone else think?
>>
>> I guess that's a particular case, because I happened to send series
>> including such email address :)
>>
>> Please note that since then, a new "sendemail.mailmap" option has been
>> added, set to False by default:
>>
>> https://git-scm.com/docs/git-config#Documentation/git-config.txt-sendemailmailmap
>>
>> Maybe this could be read before adding '--no-mailmap'?
> 
> Ah, that sounds like the best course of action. We already parse sendemail
> configuration options, so looking up if sendemail.mailmap.* is set is the
> right way to go.
> 
> Thanks for the suggestion! I won't take the patch, but I'll work this in and
> give credit.

Thank you for having applied my suggestion [1].

However, there was maybe a small confusion: I think it is important no
to use mailmap for the equivalent of 'git format-patch', but it is still
interesting to continue using it for the equivalent of 'git send-email'.

My issue was that the author's 'From' tag was modified: I wanted to send
a patch from someone else using an address having an entry in the
mailmap file, and b4 changed the 'From' tag, no longer corresponding to
the SoB.

In other words, instead of:

  From: Me
  Subject: Foo

  From: Dev <Original>

  (...)

  Signed-off-by: Dev <Original>

b4 prepared this patch:

  From: Me
  Subject: Foo

  From: Dev <MailMap>  <== Modified :(

  (...)

  Signed-off-by: Dev <Original>  <== Unmodified (good)

=> I don't think b4 should modify the From (due to "git show --mailmap")
by default. This can also happen when sending an "old" patch to stable
for example. Your recent modification fixes that in
__init__.py:git_range_to_patches() by using "git show --no-mailmap" by
default, thank you!

Now there is a second part in your patch: the modifications of the To/Cc
fields. For me, it is OK and maybe better to send the patch to "Dev
<MailMap>" instead of / and "Dev <Original>", because that's what "Dev"
wants according to the mailmap file. This behaviour has been changed
with your modifications in ez.py. Maybe the emails should continue to be
updated to use the mailmap version by default, if sendemail.mailmap is
not set?

So doing this in cmd_send():

 -    mailmap_replace = b4.get_git_bool(sconfig.get('mailmap', 'false'))
 +    mailmap_replace = b4.get_git_bool(sconfig.get('mailmap', 'true'))

WDYT?


[1] https://git.kernel.org/pub/scm/utils/b4/b4.git/commit/?id=8438e306

Cheers,
Matt
-- 
Sponsored by the NGI0 Core fund.

