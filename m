Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD1324DFF9
	for <tools@linux.kernel.org>; Fri,  2 Oct 2026 12:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790944250; cv=pass; b=FFdztQGgWWTI0vGheoN4+d+GPGNY3SfAWi8HRzKwmekyS8i+hDud6LvOmhPv2j1mAlBXPYP+eB6U48Es2NAiM/oHyHHAekbH0hl2DacMhtX2/n5syOuiBz8WogXPJHKL9PRJJSb/sZpcCUbdVT3wnwoZDlENX4umwwluFdnxGHI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790944250; c=relaxed/simple;
	bh=wkuHasxnTjeeW1qgcBjXp6xpICH2FRaOA+rEpGNp7Bo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l6rOky3LSKGvICmv6bpmw4fJryrO8Dmh3HvEoHSZuHqjOyiqzgwz/dg2S82nKwbvw/cwDerkVBqCVrwWU9j52ePo/PcEt6FFfLfn5BaeLMjE9IW86GgY84/Sp9HLwTFyxQzjwuErC4kW6OPEuOyZ7Uvp2Bcf1uhYAKrdgBRlT3E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=rsg.ci.i.u-tokyo.ac.jp header.i=@rsg.ci.i.u-tokyo.ac.jp header.b=O5nqDqnA; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rsg.ci.i.u-tokyo.ac.jp header.i=@rsg.ci.i.u-tokyo.ac.jp header.b="O5nqDqnA"
Received: by smtp.kernel.org (Postfix)
	id 475D31F00893; Fri,  2 Oct 2026 12:30:47 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=49.212.243.89
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1790944247;
	b=Q6NIQwWb2+KKNDGJmh0KfNHoe6jYCG7rIMeMdEsCQLVMmii3mdkc920ZFzLSqGpj6/zK
	 ZFPryyklJA01q5XIMmEdfokxj27ksHIslWhxWA7S2eed70VjnYlhP33+awd3DYxiaK0yC
	 vB5xe7g9YhlhRXAlV8rFH3Vb44FCVXh34X8K8QCiay1lM3JJWDbXU7VNGCyNgE9ae+E3E
	 cZGH0O5uS6yCqvy54/xIR5aZ7drXY9XAcBy2tiNafIgc23o+dWmkEBz9dy71l2p0tGjSd
	 CyR5M2N8YclZW3+CNoi5/924Mqe6fA4IhppNqTP7v2YUW9ek0owSFZNUfB79QTomgYA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1790944247;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=cBPmNqVVXTfqdjgq3sYmcZ8JAnSkby3V8ETUap5NI/g=;
	b=V98iXK7aNaTDnAI5yf3bLwaZtA6/MF06C4gfYni+oDr6C0nEG7v42+SWS14z5kZ8WO+i
	 6jWU6mEUT48BiXw5cAJiFrJJTSOelrRxwPg2pINGPwFOAUZoLlmKtSxBYarS5Do8FOjhz
	 0iVlVhWXfvp6I9f8xuiAxqkqhYzVUSmw1LZctMpkKGxQ1DJtxxr4WIbzHnz7f3ni0+wNV
	 EWl6iLaX5K13gCbrNiDxaUWFfe37RPsy+BABIJJImqxccv0UFG4nlIr1G7BvhsRHcn54s
	 FMsXiNzrPA10zhgFvUx58QmhinpRfrfafB+DigZ2uhr1EwJepv7YwOUGprLwT+16NCQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=rsg.ci.i.u-tokyo.ac.jp header.i=@rsg.ci.i.u-tokyo.ac.jp header.a=rsa-sha256 header.s=rs20250326 header.b=O5nqDqnA;
	dmarc=pass header.from=rsg.ci.i.u-tokyo.ac.jp;
	spf=pass smtp.mailfrom=rsg.ci.i.u-tokyo.ac.jp;
	arc=none smtp.remote-ip=49.212.243.89
Received: from www3579.sakura.ne.jp (www3579.sakura.ne.jp [49.212.243.89])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 802D71F000FF;
	Fri,  2 Oct 2026 12:30:44 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rsg.ci.i.u-tokyo.ac.jp header.i=@rsg.ci.i.u-tokyo.ac.jp header.a=rsa-sha256 header.s=rs20250326 header.b=O5nqDqnA
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 802D71F000FF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=rsg.ci.i.u-tokyo.ac.jp
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=rsg.ci.i.u-tokyo.ac.jp
Received: from [133.11.54.183] (h183.csg.ci.i.u-tokyo.ac.jp [133.11.54.183])
	(authenticated bits=0)
	by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 692CUals020120
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 2 Oct 2026 21:30:36 +0900 (JST)
	(envelope-from odaki@rsg.ci.i.u-tokyo.ac.jp)
DKIM-Signature: a=rsa-sha256; bh=cBPmNqVVXTfqdjgq3sYmcZ8JAnSkby3V8ETUap5NI/g=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=From:Message-ID:To:Subject:Date;
        s=rs20250326; t=1790944236; v=1;
        b=O5nqDqnA/CKsYBb8uXkZQJoCBY1vgAMm9QgfeQUipwoboB30hbiwWeiC/xpfjijk
         Wzb6q6aw+cCnOe0YkfBmgwgQE8f2dLQoKkKqk5tQfp3dtaV/WQRzemtvMSFN+GQc
         BNb7KTNIKLG6Tz+gouCk7Pmj2HSm00s4IXRrdinj6px0guuWwXGzUcs+D3+8Q5jN
         H0PGHCn4PO26PCY9khk01oq2gD/PrueoTWcmxwr8JycmjsmL41XOPPxVi/3QiafG
         enMCiwO/ausigZSfjW2O7FexMIAgJF6JjwoVNe4tJdhjR/g9ebeHDTLJfK+67fer
         jNzOlw5iBWFReWnrjddQBQ==
Message-ID: <75ad1175-cd4f-4da3-ac6a-7005e0248fb7@rsg.ci.i.u-tokyo.ac.jp>
Date: Fri, 2 Oct 2026 21:30:36 +0900
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH b4] prep: preserve recipients above cover changelogs
To: Tamir Duberstein <tamird@kernel.org>,
        Markus Probst <markus.probst@posteo.de>
Cc: "Kernel.org Tools" <tools@kernel.org>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>
References: <20260918-fix-cover-recipient-parsing-v1-1-5ccbbb572736@kernel.org>
 <0c57c5d6ed9b484616ecb0c76be06d2cb5b99a42.camel@posteo.de>
 <CAJ-ks9=T-v2J7PY+_+ZW5Ap-Ayn3XF4rkMja=P3DTDKeQu7Odw@mail.gmail.com>
Content-Language: en-US
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <CAJ-ks9=T-v2J7PY+_+ZW5Ap-Ayn3XF4rkMja=P3DTDKeQu7Odw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2026/09/26 22:14, Tamir Duberstein wrote:
> On Sun, Sep 20, 2026 at 8:27 AM Markus Probst <markus.probst@posteo.de> wrote:
>>
>> On Fri, 2026-09-18 at 15:14 -0400, Tamir Duberstein wrote:
>>> When a cover has a changelog below "---", prep --auto-to-cc misses its
>>> existing To/Cc trailers and appends duplicate addresses after the notes.
>>> New recipients are also placed there, where the preflight recipient
>>> check does not find them after the cover's diffstat is generated.
>>>
>>> bf7beca19f72 ("mbox: don't split on '---' in free-form reply messages")
>>> limited separator parsing to bodies containing a diff or diffstat. Raw
>>> cover letters contain neither, so their trailers are treated as prose
>>> when a changelog follows them.
>>>
>>> Allow callers to explicitly request separator parsing. Use that context
>>> when collecting and updating cover trailers, extracting destinations,
>>> and folding a cover into a single patch. Retain automatic diff detection
>>> for other messages so free-form replies keep text after visual
>>> separators.
>>>
>>> Add regression coverage for raw covers, repeated recipient updates, and
>>> separator text in replies.
>>>
>>> Fixes: bf7beca19f72 ("mbox: don't split on '---' in free-form reply messages")
>>> Signed-off-by: Tamir Duberstein <tamird@kernel.org>
>>> Assisted-by: LLM
>>> ---
>>> This surfaced while preparing a patatt reroll: --auto-to-cc appended
>>> recipients below the changelog, and b4 send still reported that
>>> --auto-to-cc needed to run.
>>> ---
>> This seems to be a duplicate of
>> https://lore.kernel.org/tools/20260628-prep-v1-1-8ac18db0abf3@rsg.ci.i.u-tokyo.ac.jp/.
> 
> Agreed, thanks for pointing that out.

I agree. Your patch is more comprehensive than mine: it also handles
destination extraction and folding a cover into a single patch. The
tests additionally cover separators in replies and repeated recipient
updates through b4 prep.

One issue remains: auto_to_cc() still uses get_body_parts(), so it
does not recognize To:/Cc: trailers that earlier versions appended
below the changelog. It can therefore add another copy above the
separator, even though cmd_send() already recognizes those addresses
through find_trailers().

My patch uses find_trailers() in auto_to_cc() as well, matching the
scan used by cmd_send(). Could you include that change too?

Please Cc me on any revised version so that I can review it.

Regards,
Akihiko Odaki
