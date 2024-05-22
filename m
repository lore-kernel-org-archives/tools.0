Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 070237D3EF
	for <tools@linux.kernel.org>; Wed, 22 May 2024 16:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716394271; cv=none; b=QNbu7CEplWPTgUWYhKJi1uGXPkkU1nGIpfDoev1cdiMo68dtuqq8jxlvULxy6ahEh7y/mGWi0qT8EDqeQJt/+OjClDlB78gk160Eazuuh/VIyuiqIsNW1bhD4Ob1T2kEdYwpWennd4VWSKVCEcB/G3FzXz0RMvGH5uQ6loc8XfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716394271; c=relaxed/simple;
	bh=TxGsqpyp4mIm691SnvS47ETVdGUgWUNYPdB8nh55jN4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Dor5t/8cvbrBGsskOvrsbj2wa0jX5xE/XIlvWl/k01cy5wwPIqR2wmfWAjI/lvBRufy3SCM4mLgMWqXrwt4QVTPPpNkV8s4GkRA11IgAW+RAkpzr6u0q6zA6ByFkuVnIsAwrRLx1t11T995zAg6wQ7QAzZSM8do1rfBjpVuxXsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=OVcsJqPX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="OVcsJqPX"
Received: by smtp.kernel.org (Postfix)
	id AE243C2BD11; Wed, 22 May 2024 16:11:10 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 96E38C2BBFC
	for <tools@kernel.org>; Wed, 22 May 2024 16:11:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 96E38C2BBFC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-56e56ee8d5cso11780596a12.2
        for <tools@kernel.org>; Wed, 22 May 2024 09:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1716394268; x=1716999068; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RukLGiFUznNY9Op24WW+t+x2cGPJoJykDIcPoKvxlLM=;
        b=OVcsJqPXXUU83rxS5ERNHFkIZMTlMen1RQwFMEeF51UJSBqb5RvUASMuFD0entF05p
         g+5StfPnrDdZ+cmfxF6/cJiXVR7dF2v2rj4xChvRFi2utCcLLWINkrgoiLBbNmq4MdG6
         gO4LFckcU50+9tYBv+uzO5U0NEOgIAamGXxg0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716394268; x=1716999068;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RukLGiFUznNY9Op24WW+t+x2cGPJoJykDIcPoKvxlLM=;
        b=FITqdRzl7SNXpEIlu6G1e3Uuc7di4nlYm0Itm5gaH2dSda+3qhd7FwiR5YMWcqCQgc
         tRwf05Pmgnr+m2UY/ElABLz7sXBz4cwHvFAD+ehNrWsntHdjh/GiGxn5/f+/hv1HEAKk
         /5dEZF8Ow+L2aF0CiCcEnHWIKt4igL8/+gXhQUY2Hpy97zl3BRTBAwjkE6xE2Nd8c0xF
         +TxUTndLFgTKX3bS6uZewuXnpmUzIBhOUERXBcPBYJI6Ci2aOfY9flBbrUrjHBaqX3/1
         /a1RFSfOnvFJtmzCIy3mZson8voNuiiz9LbetXd2saQ2NpTIcvfnEpr4Xdtke4nFRvuQ
         nLsA==
X-Gm-Message-State: AOJu0Yyv9AlQ/6DZkB1+1az896iETcZJdH4lTfZ9lnVmTYI3x03p9BWm
	soZqlgv124OjeNXPNa7uLBXDOuKPtVqFUSc0PfMj0km1rE94qyhYQoFzb3Ptfo83Gtc8qzocQqt
	jsC81Gw==
X-Google-Smtp-Source: AGHT+IGpbNT84omLpUaOLalRY6AOJ76b1mFlLvgrGMiFhX4zb2iCPqSh8CrBGAHGWxP/CbhycJjV2g==
X-Received: by 2002:a05:6402:5247:b0:578:34ae:e28c with SMTP id 4fb4d7f45d1cf-57834aee431mr1782782a12.2.1716394267754;
        Wed, 22 May 2024 09:11:07 -0700 (PDT)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57829c0eb82sm1786600a12.73.2024.05.22.09.11.07
        for <tools@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 May 2024 09:11:07 -0700 (PDT)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a620a28e95cso294044866b.3
        for <tools@kernel.org>; Wed, 22 May 2024 09:11:07 -0700 (PDT)
X-Received: by 2002:a17:906:6617:b0:a5a:63bf:5175 with SMTP id
 a640c23a62f3a-a6228027e80mr170618366b.10.1716394266497; Wed, 22 May 2024
 09:11:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linuxfoundation.org>
Date: Wed, 22 May 2024 09:10:50 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjt8e26xgW190=Ws2hrgDsDN6BhCie2do6uQqrcAzF6JA@mail.gmail.com>
Message-ID: <CAHk-=wjt8e26xgW190=Ws2hrgDsDN6BhCie2do6uQqrcAzF6JA@mail.gmail.com>
Subject: b4 patch selection logic
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Content-Type: text/plain; charset="UTF-8"

So I've hit this before, but I hit it again today, and I wonder what
the right solution is.

I have *one* solution, so it's fine, but it feels wrong.

Anyway, the best way to explain is with the actual workflow issue,
where doing a simple

    b4 am 20240515091727.22034-1-laoar.shao@gmail.com

to pick up the patch in that email results in b4 picking up a
completely *different* and older patch, just because it follows the
threading and finds something else entirely.

The solution is trivial: use "--no-parent", and b4 simply won't walk
up the thread. But it really feels like b4 is doing something wrong
for that to be needed.

The thread is obviously this:

    https://lore.kernel.org/all/20240515091727.22034-1-laoar.shao@gmail.com/

and you can see what happens in the thread overview: it walks up to
the root of the discussion, and then notices that there's a "v2" of
the original patch.

But the message ID that I actually pointed at is a *different* patch
with a different subject line, and is newer than either the original
or the v2 in that thread. So I feel like the patch selection logic is
a bit broken here. It's in the same discussion thread, yes, but b4
shouldn't walk around and pick an *older* patch with a different
subject line just because of that.

Anyway, not a big deal. I've hit this multiple times before, this time
I randomly just decided to mention it.

                  Linus
