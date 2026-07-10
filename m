Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27DC72D3A7C
	for <tools@linux.kernel.org>; Fri, 10 Jul 2026 16:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783700080; cv=none; b=GmrXhdDiuLagFyLaACy8TPsA11A+ylWbM3Esk89GKYVpKX8oj+i2RUsrKXkRTwo/+Wn1s5x+UjoaCBmp9UJA+pFA1ejF/M9JtsfcFE8tqz0qm1No2YyD9hu0MSUeBEeczd1Cs3oXkgtIYHOhwo/AgO2uR7hKmXWlCqEiCZFWuZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783700080; c=relaxed/simple;
	bh=vOA76ND/wCE5ON2vgTIT7Ue+/Q2KiLDf7Oqr4WcU2AI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JKQ7j2tm71IoZWTUf7dXZUO8FJKKnOKGwnHELcgnhyx4PqDOf2AwMuAOusSfdj5BHhxN1PSfz67lPXA5CL0uHRPjx2lXkJjkoOJfknFVpLRauMWUjJcS7w40LU8AhrckPURswI2wRi+bg6YLHG8IOly5It0MshHb/gF0PQu3xrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i1ywBJ/A; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i1ywBJ/A"
Received: by smtp.kernel.org (Postfix)
	id C0D4B1F00A3A; Fri, 10 Jul 2026 16:14:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0231F1F000E9;
	Fri, 10 Jul 2026 16:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783700078;
	bh=1YDyg2kTOiLneydCsK5JGo7UPYrIJDSzDHY1S/m4GaA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=i1ywBJ/AtqfLPbM46x4+Lqr/A7LbOt5Pt8eCH8B4+Q8lzqFi6C2x1W/eMsIZsj36s
	 GLqxXPBEWtuBV3nageZmiyoNkBDXIpYnDXHOkP8tX9b7al6HyiwJBAbWfAVS1AzobT
	 gQ4oMl51wUz0vS5NGMOD7uKjaGc9DKrLPzUjWr57j80FYo5wY5QWoOXjd58G7sO4oA
	 vNMtfDDVh+jMcH2JWv4DWH0tQlcEq36Hycrs2ckzzaehrAbhs/p/XS1/smV7Kh2/FK
	 2+Vi8Qb5Ez4dSDAtxDp8DAEzDUuO3rpkPJg/sQ6fKVfMjCQaEINpEP04xkP6S1ZaD4
	 PE+R/vPpIUwFg==
Message-ID: <1fbfbdfe-38f8-45b5-9af0-e39b8db15ec8@kernel.org>
Date: Fri, 10 Jul 2026 18:14:36 +0200
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH b4] config: accept prep-pre-flight-checks from .b4-config
Content-Language: fr
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>,
 "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
References: <20260710-b4-config-pre-flight-checks-v1-1-ab16cf14a00c@baylibre.com>
 <a7e019e7-584f-4be4-bf15-c3ac51be8edc@kernel.org>
 <74f0e494-10e4-490a-bb3e-94efce984586@baylibre.com>
From: Matthieu Baerts <matttbe@kernel.org>
Autocrypt: addr=matttbe@kernel.org; keydata=
 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
 lzVbFe7fduHbABmYz9cefQpO7wDE/Q==
Organization: NGI0 Core
In-Reply-To: <74f0e494-10e4-490a-bb3e-94efce984586@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/07/2026 18:04, Clément Le Goffic wrote:
> Hi Mathieu,
> 
> On 7/10/26 5:51 PM, Matthieu Baerts wrote:
>> Hi Clément,
>>
>> On 10/07/2026 17:14, Clément Le Goffic wrote:
>>> The .b4-config file is a convenient way to share project-level b4
>>> configuration among contributors via version control.  However, only
>>> keys matching a set of glob patterns are currently accepted from it
>>> (see wtglobs in _setup_main_config).
>>>
>>> The prep-pre-flight-checks key, which controls which pre-flight
>>> checks are enabled or disabled before sending a series, is not
>>> matched by any of the existing patterns.  The closest glob,
>>> 'prep-*-check-cmd', only matches keys ending in '-check-cmd', not
>>> '-checks'.  As a result, setting prep-pre-flight-checks in
>>> .b4-config has no effect: the value is silently dropped and the
>>> default 'enable-all' is used instead.
>>>
>>> Add 'prep-pre-flight-checks' to the wtglobs list so it can be set
>>> from .b4-config, allowing projects to disable checks (e.g.
>>> needs-checking, needs-auto-to-cc) that are not relevant to their
>>> workflow and share that decision via version control.
>> I don't remember if it was present in this list for security reasons --
>> similar to *-check-cmd at some points [1] -- but I do remember a bug
>> report with the same patch [2] which has never been applied.
>>
>> On my side, I think it would be useful to be able to use
>> "disable-needs-auto-to-cc" on some specific dev tree of a
>> "sub-subsystem". On these dev branches, no need to add extra reviewers
>> from the "parent" subsystem.
>>
>> We could then have this config:
>>
>>      [b4]
>>          send-series-to = <dev ML>
>>          prep-pre-flight-checks = disable-needs-auto-to-cc
>>          send-prefixes = <specific dev prefix>
>>
>> [1] https://git.kernel.org/pub/scm/utils/b4/b4.git/commit/?id=a1360385
>> [2] https://bugzilla.kernel.org/show_bug.cgi?id=219705
> 
> 
> This is actually what this patch allows.
> My usecase is to use b4 in a project unrelated to kernel process and
> internals and I wanted to be able to use and push a .b4-config file with:
> "prep-pre-flight-checks = disable-needs-auto-to-cc, disable-needs-checking"
> in it so the pre-flight-checks doesn't fire for this project and for
> everyone.
> Note that disable all should also work here, not tested.
> 
> It should fix the bugzilla bug though.

I don't know, but I guess no, otherwise Konstantin would have applied
the original bug attached to this bug report:

https://msgid.link/a8bc0958-6c46-4622-96ef-b1e55c15f30f@cherry.de

> Should I add a Fixes trailer or something like that?
Better to wait for Konstantin's feedback before sending a new version ;)

Cheers,
Matt
-- 
Sponsored by the NGI0 Core fund.

