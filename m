Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6BD54921BB
	for <tools@linux.kernel.org>; Wed,  6 May 2026 15:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=10.30.226.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778082792; cv=pass; b=hP858b9ysc4rGnHAktvvhdIwGl+JmM26lk7wjnjWddw/sLJ2Dhcu7NY4nOaBvskbsdksU5enmtOLSt2G6IWeGCb4vP5WboC66M2NQJYAwEenUS9XXSLWlsTFO1b7Y2MLsiTUlTPqAe9nG23VBkXkORry4y3G4TOVcXtym2MtS04=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778082792; c=relaxed/simple;
	bh=KHb8rVgU0IdTtj8mG67RKskSP8Ilx1WePdDz5OlOgKk=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Content-Type; b=AqgberFGgE0vZcKaEv3/UAG15/BugRE4EojWShBULB9XtzK7UP8lsVknoXMCtfqQTL0t3yHSf+kY2D83qzsyENjY6hHIeK9+kSSajYI4OPeBpOuzTxBzdIpub6hbM+sWJM14A7h/evaT9KV5dOj9MKAKTFrKRGupeH1XZnDOzLw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=N26ybFtk; arc=pass smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="N26ybFtk"
Received: by smtp.kernel.org (Postfix)
	id 6A7FDC2BCC9; Wed,  6 May 2026 15:53:10 +0000 (UTC)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9CF6EC2BCB8
	for <tools@kernel.org>; Wed,  6 May 2026 15:53:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9CF6EC2BCB8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-95cc3522c40so4142031241.2
        for <tools@kernel.org>; Wed, 06 May 2026 08:53:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778082788; cv=none;
        d=google.com; s=arc-20240605;
        b=X7HhRnjOPfH2yojQXIPDYuGEipIa2rRoYVTqhUhBs5FvPljCKK1csl05r2JOkIjYV7
         fseFyO7xR7RkZ08lgv9D2S6beK6ef4HLK2OXYcvlhfePKfhGvB7UI1L5VU+205pyLBiZ
         XhqKxFsOK+6/LbgBg993/Q/CCz64OjrnBvC1K4LXBVKvBEj/REJrDtgsv+Bq6PNJP8IY
         JxYow96YlvzFblF94dm8qSDt9RAp4rFb/LnH28ZLJCXzRmQc44hxz+CUjPZVlHzZ11nR
         Tn/Jq6s65YmKjyTsgDUFe+NC8QJojRijR5/nsH9/5778H1MCeUi8uVpWOXB8c8lfRnTW
         cZAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=KHb8rVgU0IdTtj8mG67RKskSP8Ilx1WePdDz5OlOgKk=;
        fh=hEAhbY4Z4VJioW+1JHx+fHJtlsKxnPuHOkoU5UdidNA=;
        b=KYvltnflPZFMHsOozzIYd+MWA2Y0HH2+BAiBQEX7YxGbT2huTKybRBm7KdJS1QCXEA
         PYqyYJBQgp9ct/uGDSP4KA7Gn8RTgI4N6JeKBbHOcdwgBAy5uhYT7THUooFA/8AZ2g0m
         YZ+/JwSWw6VRVrnQcLj3vnNO7kFT5g/ONC+JB5gCHbGazKMS+7jARMoht38LVF35qaQT
         RuTFmVtA8SpYlv/CyynSHI8Vth5B4djX7qCQQfFv8tJoyU+Kc8JVvHr2tEZU67Hp6pGl
         /C2E6ja2H3zxQT5c5tzYOr91tS/dc2l+inZwkoHnRffoitsZntPM00lkApV2JFnX4t7z
         36Tw==;
        darn=kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778082788; x=1778687588; darn=kernel.org;
        h=to:subject:message-id:date:mime-version:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KHb8rVgU0IdTtj8mG67RKskSP8Ilx1WePdDz5OlOgKk=;
        b=N26ybFtkwzZ1Imkun/7wQob8jfoUGJ2W4cfTSeqK+s6KTXBasysOBb/3AjIi2H7OeM
         47Kb81hH/mSv+VsuixAGTL9XfcZR6y1gcv/mMpngeD9BSefdrWaSyErtHdId82Vvie6y
         NWCJ0jcB9+mZkPlhv5fP3E6Ihvg3MkBvptzptj8tM5KhBUrJYyuejoiDfiwprbM2/wIm
         AWOZGM4gpN6rbkr4fGUQIA6fS+djTyUIMHKcNU7Af1T/3UseQdgPz1JKIN9y0YBgfp9J
         WsWEU5uQTEy9FJYR7pBvPAsxc4NtxiO0Fe/ZxQ04QnBBnoPABpCsZbGO8FV+2+Q4JeA7
         u9Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778082788; x=1778687588;
        h=to:subject:message-id:date:mime-version:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KHb8rVgU0IdTtj8mG67RKskSP8Ilx1WePdDz5OlOgKk=;
        b=rvcWwgQLYWPGT7idklNqGsXFy9GawRxQIPxpuR4hV1cqojfZL4Qyl/01Kma0Ggl877
         yxnF44j1PcciMjgYH90fR3xH6IvqeaNfGCiOOWpLbQR/TZFxevytnFuOCJ+XeKL6lGMq
         oipnMwzGy3vl3+gtI9f4K3iAcjPDdqSGHfQzQRMPUeqpYSrR+lhG7GypZdHMnJeFz9v7
         Udctq2wm9N7OeeFDtkyIoxgLSh5FwOZpvl0JVZzxSUG5usmcygeNIiwn82hNuePlBVyA
         4rvHGcfWvBgj+pj3tsmCpuqON0hnp5XErz3EWTVBjYM29JvGt5Dits5odCMPfez4+C3d
         Cg9Q==
X-Gm-Message-State: AOJu0YzoJ6BRLc9aHA4aNekWZ9wCYuBUEQ9jpAEbVcor/ktgKzMjAbGJ
	ZRXo1mcC4PelgCzs0EMbCKtMdKNa5/jjt4RRWcX6LJ5baLb8+uewwGd07hA/o6sg46dAv9AnQCJ
	210BNNBNFzC+z0hGk6qTMwQZ60r/OZ2cjiwoa1fDsjpFlKx/blDz9vg==
X-Gm-Gg: AeBDietSi11msQQ4N6yAeUrac8i9nbEN15MwJ99H8FyVzyv7NntXMUAMYLl0TTIjLMH
	ri/k+nF0yfKkJ7tqirKKmYA0EM490O+Z4bn8ZWntylSyFtmCFUQ6JUJTrKSgfqjHLe3+F7fEFni
	B/wQrjb/aLOw1uqGY1+bcO1F4PN0Jf9ltgvC/kLEL4eROCBuCtdnxyIMV+suutqzBsmvTxRByQv
	GLexLyifyD3FI5gsD+SBtHipc2Gxvrm9UxaZIZG1bV/i/VBV72CZe7liE2g8yf4DLkMGx2gsqpS
	rmP+NV7y54zyqaILq3oexy0CPQCrwtOp/YRAOVZa9GgEUjHq+vHHayTouyPJOtSet/Sn0UMBRCb
	3ZpjKGQW7d/cF/w==
X-Received: by 2002:a05:6102:5693:b0:605:5e9d:2e5d with SMTP id
 ada2fe7eead31-630f909e1ffmr1876476137.30.1778082787649; Wed, 06 May 2026
 08:53:07 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 6 May 2026 08:53:07 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 6 May 2026 08:53:07 -0700
From: Ackerley Tng <ackerleytng@google.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Date: Wed, 6 May 2026 08:53:07 -0700
X-Gm-Features: AVHnY4ItrztFa1jCeOJpsVJJiteMEx7Mz4GsV9R79siX0GG9J03igBJ48lg2Gd0
Message-ID: <CAEvNRgHEoAujWnf_bjPEvntMGMwng6TEMgDyZGuon7SR2=HfCA@mail.gmail.com>
Subject: Patch series sent via b4 relay have a duplicate/shadow tree?
To: tools@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

I used the b4 email relay for the first time recently and noticed that
the email tree on lore [1] has a duplicate/shadow tree.

In the "Thread overview" section, other than the tree with emails
suffixed with "via B4 relay", there's also the second tree, which
appears like I replied to each of my emails on the patch series.

There's a line that says "WARNING: multiple messages have this
Message-ID", and the diff is [2] just the From email and the message id.

Is this intended?

I did a search for "via b4 relay" on the mailing lists and found that
other patch series had the same thing. I was expecting to see only one
tree, as if I emailed it from my email and not the relay.

[1] https://lore.kernel.org/all/20260428-gmem-inplace-conversion-v5-0-d8608ccfca22@google.com/
[2] https://lore.kernel.org/all/20260428-gmem-inplace-conversion-v5-0-d8608ccfca22@google.com/d/



Thanks,

Ackerley
