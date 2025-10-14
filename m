Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C81226B762
	for <tools@linux.kernel.org>; Tue, 14 Oct 2025 06:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760424462; cv=none; b=fmppT1eZk4SF/SckytpQkyUflcjdEFJP3zC5JygTEt8a3nKwWu60nfCI9qhTzoXr+4SHHvgnKBw11WSFz/pyfPBrxIyp14RFm4mFokKmOdjBFAoxSj0w4/6nXvEIMlXBaL+iofaMPL+ZKLZfLPBpYqqznjskzz72nzNcJ4TbT90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760424462; c=relaxed/simple;
	bh=pyBbxp5CMz6peM7xtAWlLVYooTHq5QC5U1P/oYQQ9HU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hQ+HQCVa0i5O4oLNkfHtRQ6jV3y88KCInGiL1pIuoo/FI1bKE00YoFmycOSJM4AachY42QPfaMfO8p2G6fI9sKKi7kqCX/6dbHCUYw3Qe+Xj2Zftqjeo8h1q4Nke142zZwx+7NK+DsMEfplrnqW5f1dcjutMAN/fiBJ66rEmef0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eSPVaCjS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eSPVaCjS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEC54C4CEE7;
	Tue, 14 Oct 2025 06:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760424462;
	bh=pyBbxp5CMz6peM7xtAWlLVYooTHq5QC5U1P/oYQQ9HU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eSPVaCjS9A3rIBbTrV/dVueKEpXfU/YIc0H64LysJXkizsO+7ZO5Fing9duwVbjXm
	 nZtiH/0Q18//2/1khy1K4JLaa7x9Qiw/vCe5csnTSLeaRV88w3rCGronWa/6Vl2Skm
	 cC5l7iqFM+e3Luf+vp4O0AmNUyLp8Q4eCUI0yC/37/9Mpc8sSa7f/am1Ldbr5+0eD3
	 Jv7kR9Qt0/vdkpVYREY9mNuRY5zjFrpbXAoTfgzmuIuXrRqEJBKSxz0sO+ypikm6d0
	 3GIvrMHfhzMC8Yux2tdZa3QfXej0I3fDYKGU02rexsXhaI4lZcFUsA7mL65U0HXZiQ
	 t0wt00ImG7rsQ==
Message-ID: <4005c984-dc97-40a6-8760-4651b3a37572@kernel.org>
Date: Tue, 14 Oct 2025 08:47:39 +0200
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: In defense of Link (was Re: [b4] initial "b4 dig" to supplant
 Link: trailers)
To: Paolo Bonzini <pbonzini@redhat.com>,
 Linus Torvalds <torvalds@linuxfoundation.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>, users@kernel.org,
 tools@linux.kernel.org
References: <CABgObfY5agTRsB-bCqCYbA0erFn5cVbujtTNBiCti8g_68nCWg@mail.gmail.com>
 <20251013081536-mutt-send-email-mst@kernel.org>
 <CAHk-=whSShtPG1_+02Cc4yDuEJxVqX=G8tAx0gW7UjA7cuBp-w@mail.gmail.com>
 <CABgObfZS--70UTOpSXo=JOZViN1jm4O6M92pu-6Qunif3v1Y8A@mail.gmail.com>
 <CAHk-=wg4WfbXs-kMOAM7FmQ0w8q3KO9DC8CWLg1WPnoaZW-Wiw@mail.gmail.com>
 <2d4cd1ed-106b-414b-91d2-ba8e8730d2ac@redhat.com>
Content-Language: en-US
From: Jiri Slaby <jirislaby@kernel.org>
Autocrypt: addr=jirislaby@kernel.org; keydata=
 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
In-Reply-To: <2d4cd1ed-106b-414b-91d2-ba8e8730d2ac@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 14. 10. 25, 0:31, Paolo Bonzini wrote:
> Il lun 13 ott 2025, 20:53 Linus Torvalds <torvalds@linuxfoundation.org>
> ha scritto:
>>> it's there *so that no one has to think about it later*. Other 
>>> information may be sufficient but the point is that you don't
>>> have to "find" anything. Even with "b4 dig" there are *many*
>>> extra steps compared to a click.
>>
>> So the main argument is literally the "click" vs "command line"? 
>> Because this argument is clearly garbage:
>>
>>> and to reference or review them after the fact, and the message
>>> id is *guaranteed correct*.
>>
>> No. The message id is one random message among potentially multiple 
>> versions.
> 
> It's literally the one that was applied, which makes it the right
> starting point for interacting with the authors (the easy/common case of
> reporting a bug) and *also* a good one for analyzing the history. This
> is something that multiple people have said they are missing, right in
> this thread or elsewhere.

Exactly, and I still fail to see the reason in building up this very 
barrier between bug reporters and developers. Using Link: (or whatever 
tag) is so easy for everyone -- that's actually why every second one 
started using it. And works in 99™ % cases (for me at least).

Installing b4 is a real barrier, particularly. Now moreover, it has to 
be new enough, namely a snapshot (look at repology what versions of b4 
are in distros). And in fact, it does not even give one what they want 
to get.

>> So your "guaranteed correct" link is really just "guaranteed unique". 
>> And not in a particularly good way.
> 
> I'm not clear on what makes it not a good way? For me it's an effective
> entry point for the easy case. For the hard case there's "b4 dig", or
> Patchew that I put together a few years ago[1].

Using anything more than click a Link is more work to be done anyway. 
And I resist to spend it when I actually don't have to.
>> But I assume you use some terminal or IDE that auto-converts text
>> to links for you?
> 
> Yep, it's a terminal emulator (Tilix) that can make any regular
> expression match clickable,

Yes, like many sane terminals nowadays. Konsole in my case (without 
actually setting up anything special, just open "git log" and 
right-click, left-click).

So even if I had capable b4, I concur this might be helpful for people:
$ b4 dig -c 23743ba64709
Digging into commit 23743ba64709a9c137c1b928f8b8e00d846af9cc
Attempting to match by exact patch-id...
Trying to find matching series by patch-id 
c3157dfd330b6951d93ff0a0e35f5a09b0e05c85
Grabbing search results from lore.kernel.org
Found matching series by patch-id
---
This patch is present in the following series:
---
   v1: [PATCH] vt: add support for smput/rmput escape codes
  
https://lore.kernel.org/r/20250824142016.47219-1-calixte.pernot@grenoble-inp.org
   v2: [PATCH v2] vt: add support for smput/rmput escape codes
  
https://lore.kernel.org/r/20250825125607.2478-3-calixte.pernot@grenoble-inp.org
   v3: [PATCH v3] vt: add support for smput/rmput escape codes
  
https://lore.kernel.org/r/20250909202629.9386-2-calixte.pernot@grenoble-inp.org



But for me, where am I supposed to reply to when I want to comment on 
23743ba64709? Hint: it's not that v3. So I have to open them and read? 
Hmm, isn't it exactly what you, Linus, hate?

Similarly, if I were to backport 23743ba64709, where can I look for the 
whole series which this patch can be a part of?

The output is helpful, but not for our usecases...

thanks,
-- 
js
suse labs
