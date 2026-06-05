Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE09947DFA7
	for <tools@linux.kernel.org>; Fri,  5 Jun 2026 08:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780646882; cv=none; b=e3l6nDNKenQ81r/8vLIKNf7y4i1aTPZ4djxI9ek5cX6tL2VnZ/PgPDyxiP+LN76my9UGBtv/9Zon16K4V4TN9uHGiuf5036HhCKSOzDmJAWB1HCREg26lIiIXyZRn8XSSB96iAA+3cMJECO7/ty4IDfT/i/kulBv/3JELGdQ5kI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780646882; c=relaxed/simple;
	bh=DtlaTiPdJx3+b7TstcaiXvKDUAa6l+Cm5+7MCjI7ADs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ck04ZMv6yFDMXZb17A/CpadTpiMtB5SNHobPCU/b2iWO+jo1RHHsTJb0xSz+ye6Jj8h8Vyx6Naw1nKc7yP96SeLgi+/L2GRgm8FQ9dZcFcNognKiLBFDzTpAfyt6gxsorpyY3c4TUI2czSHfCItrPWXH4QniJ/2yGlmYk0X3fZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MIhmRrUD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MIhmRrUD"
Received: by smtp.kernel.org (Postfix)
	id 701E91F00898; Fri,  5 Jun 2026 08:08:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A778D1F00893;
	Fri,  5 Jun 2026 08:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780646881;
	bh=zuw8PatDR5bJRXnjLRoPclMebj6Kz4k0sbGbEeOLezo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=MIhmRrUDXmUYMCa/NeVKrVau5i/1a4MNDvdswdrxPkxSvpU3Mzv4EZkWxvmuGTjN6
	 FR/HVV5aaQhSdX71yg0c6OoTuWRoDU+U2wno0BpK9pdCj18JQ7cOJA6HF9z7/vMhlr
	 5zh84cOqBjs6UWZ7EHEw+KcljRX+hsCxRD+4xur0997oNPuhTgDpmo69HoDURrWqw4
	 8i8G7CNklGl9lUKyWloW+UUjMV6FvM5mCX5UIDshyK7zjAcHE3quoKAGM5rjtpJq9I
	 2midPB4NlgWOsfCuqNcBpjbieSJ2+W7tdeksRnD+/bE8EoRk3xBUN5DRyEUj0IzSlb
	 zMTvwvR/TfF5g==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: Re: [BUG] b4: assertion error with `b4 send`
In-Reply-To: <20260604-elfish-uppish-poodle-afaad0@meerkat>
References: <878q8ujbqs.fsf@kernel.org>
 <20260604-elfish-uppish-poodle-afaad0@meerkat>
Date: Fri, 05 Jun 2026 10:07:53 +0200
Message-ID: <87tsrhif52.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Konstantin Ryabitsev <konstantin@linuxfoundation.org> writes:

> On Thu, Jun 04, 2026 at 10:23:39PM +0200, Andreas Hindborg wrote:
>> Hi,
>> 
>> I got this assertion error when sending patches today:
>> 
>> ---
>> Sent 11 messages
>> Tagging sent/20250305-unique-ref-29fcd675f9e9-v17
>> Recording series message-id in cover letter tracking
>> Created new revision v18
>> Updating cover letter with templated changelog entries.
>> Invoking git-filter-repo to update the cover letter.
>> New history written in 0.06 seconds...
>
> [...]
>
>>   File "/nix/store/xl7fx5x8g52g03npg1dpjzvaiijpv98z-python3.13-git-filter-repo-2.47.0/lib/python3.13/site-packages/git_filter_repo.py", line 4767, in _record_metadata
>>     self._compute_metadata(metadata_dir, orig_refs)
>>     ~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^
>>   File "/nix/store/xl7fx5x8g52g03npg1dpjzvaiijpv98z-python3.13-git-filter-repo-2.47.0/lib/python3.13/site-packages/git_filter_repo.py", line 4712, in _compute_metadata
>>     assert(usoa == intermediate) # old wasn't pruned => usoa == intermediate
>
> Looks like this tripped something in git-filter-repo, so not something we
> control anyway.
>
>> It looks like everything is OK and b4 set up for the next spin, cover
>> letter looks right.
>
> Yes, looks like it was during some kind of cleanup.
>
>> I observed this on nixos first with b4 0.14.3 via nixpkgs 25.05, then
>> upgraded to 0.15.2 via nixpkgs unstable.
>
> We actually got rid of git-filter-repo in the latest master, so I'm just going
> to blame this on gremlins and blame the alignment of the celestial spheres. :)

Ok, cool, I'm going to pull down that and see what happens.


Best regards,
Andreas Hindborg



