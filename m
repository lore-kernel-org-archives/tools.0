Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B580648AE38
	for <tools@linux.kernel.org>; Fri, 15 May 2026 14:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778853752; cv=none; b=QRZ38rohBxmpnEZcEukDr2H0r6ApSUyikVY6wqxBA1YrqXvEV87cbavFg1Y6ldQmFFjhWzIxh0Y45C88t5ndH9lS2vi3Rj4+ilFWkTLjbL4npMkF/z2N0cf2bSTD3FgQSEslaxHJpxrAODXm69x0lEpWnO8BAyWMAz9DdbnrxhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778853752; c=relaxed/simple;
	bh=LaKig/8Xl/uQwzdOyLkBwBdJWzNvezXHKDrTjI+YPIs=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=T193obcAThzdu/+ZDSvfzuBFfF8U2Ezp2YwaAE26Xl5R/QdImo1WK0GM282JwZup5lhsQWqlU0o1kIAufVftuM7LZ9BICpQS6bMzvatv1bxwCEMFIxNkx/LHB/lIz5xC7/XIjtviHECh987o9Sr3Zn64/gQTIQ+w0AJgGXrBgbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bB1bBgYq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bB1bBgYq"
Received: by smtp.kernel.org (Postfix)
	id 0421FC2BCB8; Fri, 15 May 2026 14:02:32 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1D438C2BCB7
	for <tools@kernel.org>; Fri, 15 May 2026 14:02:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1D438C2BCB7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778853750;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=LaKig/8Xl/uQwzdOyLkBwBdJWzNvezXHKDrTjI+YPIs=;
	b=bB1bBgYqAX/9J/BTWSorgQZrPUADza284sCRbMRthQiyUisar+1M3HJMMSdmRUQDggkpKc
	JNVFQLRwuRUCoyaSOiyIQcsK0x/Jc5U9I/Qhtev+aW7fjRbaUCoXapuC/NRfTWV/Sn8ebN
	HXRsXtH1z2rtSGmRfrX/0PSNoIvvVes=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-436-pkh5e-xPPAa8H1IXGYOZZA-1; Fri, 15 May 2026 10:02:27 -0400
X-MC-Unique: pkh5e-xPPAa8H1IXGYOZZA-1
X-Mimecast-MFC-AGG-ID: pkh5e-xPPAa8H1IXGYOZZA_1778853746
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-83836443305so5287846b3a.1
        for <tools@kernel.org>; Fri, 15 May 2026 07:02:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778853746; x=1779458546;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LaKig/8Xl/uQwzdOyLkBwBdJWzNvezXHKDrTjI+YPIs=;
        b=nQf+ay+b5yDps1aBEzYK0tU9QGAbwwE1EctAMfzR2BJL9Gh29vCJExz9cJJNY+mNw7
         OBF2d56wOw1o7xHwXkaDMDBc3Q5G3PH4Lx8mF6K72gLcYTUT4qVGvWtN82w1qykKfazi
         aGyxdcwPeqp5ymXpEfygYhL3cAUinyiACdJW0tkwBIi1Xwqte5uKHGC6b/erIRt+f36V
         Cpx9x4HEL2IbahCwuhTaPTcmK32pPBSBHVvpGrtDPt0Fb8nJgwQ4q6I5mMluV0YhJUFn
         UlK5VKqUsXJDs+1siznRZAgZOymrvKHEPKUQ6CKUJ7mvegFy4gb05dLpxo7jtPtZrZYn
         k9qg==
X-Gm-Message-State: AOJu0YwHN6cclu/g7xxrA0hpwjs6FIR+R2mt2CMwGBXQ6GBPvTBbnig3
	4aOAxvR2RW0LUjYlxC5JkSk8ZUFFrRPLfP02NNNLOzQO0veqKVh0/xTnlnF3tKSm/b+jyyLUEDh
	5AbioQhjYWB6v2kfnZP+BjwlHuI0O71eChv79YQhY9psVoAdIQCG0ZnL1BpUV4zOCgSFbR7+xqm
	sgJz05dsv7LonLLAN6AakvxH1o5UYi2fLiiJg=
X-Gm-Gg: Acq92OFARV4wT5Zr6rI8Xh7AyZvP3jvDyBMMJwoFOynPn3Rg9yR3d+CDl/X7nVgfOvR
	FmFWMTclT5lo1wwSUDnY70LF3v4G6NLfadpE7XEu+2364v5OjPLA24t+Dcbp7WWu5k45iLfut5q
	ohk2oExEV+r/L33D8iJsoYg9hR+AK15jfRhDDDXVNb/8zZTrmC9Nd0F0WOdU+hIuLCRvHOof3a+
	SiXwOCYq9ViqFMKoiGA1EO6MFwqJF4pNf8P4QH3mrmLm4SAcw==
X-Received: by 2002:a05:6a21:3294:b0:3a2:d79c:415d with SMTP id adf61e73a8af0-3b22ebbf030mr5303113637.30.1778853744304;
        Fri, 15 May 2026 07:02:24 -0700 (PDT)
X-Received: by 2002:a05:6a21:3294:b0:3a2:d79c:415d with SMTP id
 adf61e73a8af0-3b22ebbf030mr5302746637.30.1778853742079; Fri, 15 May 2026
 07:02:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
From: Luigi Leonardi <leonardi@redhat.com>
Date: Fri, 15 May 2026 16:02:11 +0200
X-Gm-Features: AVHnY4KJm2usoskPlohZgQolNwYzh2Ijc68PH9TGhg3YOvrnMCsmwdimF6sZSEo
Message-ID: <CANo9s6mjy57bsiib_+BhpftUZ73=Nwg35VK_v+ebt_KK-yf9Bg@mail.gmail.com>
Subject: b4: not possible to disable automatic commit changes
To: tools@kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: CkHZKh5D0BeDNjcR7VgjNvTYYszFki-yYcx5FmdR36Q_1778853746
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi all,

I was backporting a patch to linux stable and I added a [] tag after
the maintainer's SoB,
explaining the changes I made to the commit.

The [] tag, which spans two lines, was automatically moved by b4 to
the text section,
without warning me when sending.
Going through the documentation I didn't find an option to disable
such reordering.

For reference, I wanted to achieve [1], but I ended up with [2].

Signed-off-by: Paolo Abeni <pabeni@redhat.com>
[LL: something something]
Signed-off-by: Luigi Leonardi <leonardi@redhat.com>

but [LL: something something] was moved into the text part of the commit.

Did I miss something in the documentation?
If not, I think adding an option to disable the reordering would be great.

Thanks for the great work with b4,
Luigi

[1] https://lore.kernel.org/all/20260515-linux-6-6-y-v1-1-b47eaf4cc6e6@redhat.com/
[2] https://lore.kernel.org/all/20260515-linux-5-15-y-v1-1-033f2ea86d6c@redhat.com/

