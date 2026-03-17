Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852B013B7A3
	for <tools@linux.kernel.org>; Tue, 17 Mar 2026 21:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773783971; cv=none; b=N3oBVl8i4cnKApw88/TbWoSE7teOWPTOC6GcH+JXzPYTvvZUXV/+BTZyGeRUZcbcS849M1yPyrpwh6ehJnNzJiFdpb7GNzmd48XjlolJ2PZxybUhMae6mUevYXT85yLmhSKl7A5F/KI5tfWskh21ow/YSjkuPpMkMzeMI8ZJGgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773783971; c=relaxed/simple;
	bh=8JkDBCHAkpVi3/c/XWhrUsQBDJLwqY7dlF3RGNI9y5k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=K2Yty2yXpi0KNTvTfQTpjrDdaKDSvPZjFORdigeC4E990XGeE9pV8VXgTdOHfx+VzIL3S0A1CvGQAYUZolvP6NiHO/XIUHZLdU05xWIzFwEF4F4ziGfkkzx3FRb5gDTy7xiCOY315XvlarPsJqf+AaD5siLJZRy7IGcZ1YX6FlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=J0yRw5g7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="J0yRw5g7"
Received: by smtp.kernel.org (Postfix)
	id 3E428C2BCAF; Tue, 17 Mar 2026 21:46:11 +0000 (UTC)
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0D591C19425;
	Tue, 17 Mar 2026 21:46:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0D591C19425
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 09F4040C7C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1773783966; bh=AZQzTli/nGebs7A1e9PK0vfY4uHj7pRKbO90zkUVamo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=J0yRw5g7K+WWJZbeirrKEmrPMQPG20H4YuXfah9H7pLN0fyYJRlvGSbfvuUiZ8yRi
	 pNvSBzolckitJuV2xFca9r5V6LePpGALdCoUUc+uqLfxu0Y0KEtZLLm1gwjXRExRuD
	 Heq61weJeSvDI5sH2yTTnd42P3GDII84BkXGWa0ffbR9U2E2sYWp1nKBUoxX9/kqNE
	 jV9dgAePhBIrbGaRJHLdHCZ/8rNip6UYIJx94NGQKNRS+jtxdFa648/lLyaIe1atnn
	 mjeNEvjsGK6vv0Z6/vl6RAVSUv1ZuVBWTrVfNFEh5eL7AtO08bvEAyogO8Yj2a3Ql3
	 cpcgCfK/qdW9A==
Received: from localhost (c-71-229-227-126.hsd1.co.comcast.net [71.229.227.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 09F4040C7C;
	Tue, 17 Mar 2026 21:46:05 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: users@kernel.org, tools@kernel.org
Subject: Re: b4 review available in master
In-Reply-To: <20260317-optimistic-impartial-kudu-deefac@lemur>
References: <20260227-imported-aromatic-guppy-ad3dca@lemur>
 <87tsuffj7h.fsf@trenco.lwn.net> <87h5qffikk.fsf@trenco.lwn.net>
 <20260316-quizzical-raccoon-of-refinement-d88fdb@lemur>
 <87qzpieeb5.fsf@trenco.lwn.net>
 <20260317-starling-of-delightful-exercise-3472ce@lemur>
 <20260317-optimistic-impartial-kudu-deefac@lemur>
Date: Tue, 17 Mar 2026 15:46:05 -0600
Message-ID: <87o6km86zm.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Konstantin Ryabitsev <mricon@kernel.org> writes:

> On Tue, Mar 17, 2026 at 10:23:33AM -0400, Konstantin Ryabitsev wrote:
>> > If I've done everything right, you'll find what you're looking for at
>> > 
>> >   git://git.lwn.net/linux.git b4/review/20260312-kernel-doc-use-a-c-lexical-tokenizer-for-transforms-0e0e9e143327
>> 
>> Yep, found it. *sigh*
>> 
>> Unfortunately, it's not an easy fix. I think I'll have to
>> abandon how we currently do inline comments -- the diff format is just too
>> fragile to try to intersperse it with comments. I think I'm just going to load
>> the diff using standard "> " quoting instead of trying to be creative with >>>
>> <<< markers. Maintainers are more used to seeing that anyway.
>> 
>> I'll let you know when the new code is ready for testing.
>
> Okay, a fairly big change landed in master that completely does away with "C"
> and inline comments. You now just hit "r" to reply and add your comments just
> like you would to any other message -- benefiting from your existing mastery
> of your preferred editor.
>
> We also ship vim and emacs syntax files in misc/ -- they make it easier to
> reply to diffs than regular email syntax styling.
>
> Please try it out again. Your old bugs should be gone and replaced by whole
> new bugs!

So it's still behaving a bit strangely, at least that's how it seems to
me.  I tried adding comments to a patch, doing my usual trick of
trimming out stuff that is being skipped over.  Quitting that, then
asking for email mode showed me a blank message, which is rather more
terse than I usually am.

So I went and did it again, simply inserting a comment in the patch
without removing anything, but it still shows up in the wrong place.  I
guess it just doesn't like me...?

(I can push another branch on request).

jon
