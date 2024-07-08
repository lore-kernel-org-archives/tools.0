Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 129A01386A7
	for <tools@linux.kernel.org>; Mon,  8 Jul 2024 13:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720446230; cv=none; b=nnLggtWoXrggYO6oLk4GBCzTru5ucZvDD0ai2hO7h/BEoEATE3wyAhhiV11v5FFthN4nr6WBcFnw2asrRN4URmamfBBiz+fJxwWt7sLpRGhwpEAORTjNvOP7fFLpSBuzgSlEWty5E/JuruwFFWwqJW4cV2KYoASlbebi0MalvIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720446230; c=relaxed/simple;
	bh=7r21nsYjxrPFvoH1n1MGES5srJomaNctIq5JqnCIZaY=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=hNLciGwmja1sTUyJFCrDke6U31vgCJVPTrXspnd0xqEjWEUi3rhUToWYGOPDfly8f0UbAR0B5jKoPx3iOQJjq55S/sKY4GUcmg/mQZCrReW7ic+bgiJaHwZ3d2vc/R2geyLwRKxwvT7+zkeIr3DqKBle/F3nFg8gGQNWS8MySvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b=G7d93tzD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="G7d93tzD"
Received: by smtp.kernel.org (Postfix)
	id 00699C4AF0A; Mon,  8 Jul 2024 13:43:50 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 130A2C116B1
	for <tools@kernel.org>; Mon,  8 Jul 2024 13:43:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 130A2C116B1
Authentication-Results: smtp.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=cloud.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52ea79e689eso4055529e87.1
        for <tools@kernel.org>; Mon, 08 Jul 2024 06:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1720446226; x=1721051026; darn=kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7r21nsYjxrPFvoH1n1MGES5srJomaNctIq5JqnCIZaY=;
        b=G7d93tzDloHoOcMWSbcGpcttO0F0tyVx8IDYa9YGh7xausMf21WSbsDv7+WOV1ZdQz
         dOvJa224FxFbbhMpP2ktdOSRBYyv7gCpOzjIUu0Czu/E5vYCCx5O7VwHyxxR8LzfcaWI
         pWOuYeWHS9/tYD+ZCquOQ0t3rto+87LNTOBdc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720446226; x=1721051026;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7r21nsYjxrPFvoH1n1MGES5srJomaNctIq5JqnCIZaY=;
        b=Mp7l/XwkyBr024/qrEpK6zFFSoYwwrPZww5wdCF0+5JGwBtscLo3A8Nawbs5q/PjLa
         JPirZ/q5M2In5zzh+Z2YTPNkA6QgCjoOaCgSdgP3X70CIH7P4ITgoHMRSR8+MG6eibmx
         FU4h5zkUnbfDT2CdsBW5wX2fHP8eJBV/I6nFNDdzHSKJbwL/fuSbhhV94pVJcPTcACUY
         JhH6Qp9X4wc5KvftO9XRpPrhhEDYlHoqaHbvSETT4O/HwiSc6LmSfTyQSTRduX4PwASq
         gjmUhpBTCZb6S1J4rVSaGP4E6+r/XDssFSp/31/gx6z99ZPk7ioWC3ieBMeR/7wA1CDn
         xprA==
X-Gm-Message-State: AOJu0YzGGnmpPj8X42Uc000ZblMXgj+Q2BDQgLCMqc8bqN9wp+5uwZit
	qluvK7zLyU1WMLsljKprZ6kxPS5FdXEOmMq1mtyRO24l71zLZMqRP5iqZVu/Ms1seR+OnL7lW2E
	I
X-Google-Smtp-Source: AGHT+IFuHWML3Z/V7EqwjIX8JkKOyrEKuDjXm2DEdbW9TbDkNhXg7YTg8Ib6nkrSeCM6fuAErgM+Mg==
X-Received: by 2002:a19:ac45:0:b0:52e:933f:f1fa with SMTP id 2adb3069b0e04-52ea06c7106mr9254568e87.61.1720446225886;
        Mon, 08 Jul 2024 06:43:45 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a72ab08d138sm929587266b.158.2024.07.08.06.43.45
        for <tools@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jul 2024 06:43:45 -0700 (PDT)
Message-ID: <475803b5-3cc3-4da9-94b8-c2ec648d0c35@citrix.com>
Date: Mon, 8 Jul 2024 14:43:43 +0100
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: tools@kernel.org
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: b4 shazam --single-message still grabs the full series
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

$ b4 --version
0.15-dev-13183

$ b4 shazam --single-message 20240708080456.401764-1-Jiqian.Chen@amd.com
Single-message mode, ignoring any follow-ups
Grabbing thread from
lore.kernel.org/all/20240708080456.401764-1-Jiqian.Chen@amd.com/t.mbox.gz
Checking for newer revisions
Grabbing search results from lore.kernel.org
  Added from v11: 9 patches
Analyzing 35 messages in the thread
Will use the latest revision: v11
...
Total patches: 8
---

https://lore.kernel.org/all/20240708080456.401764-1-Jiqian.Chen@amd.com/
is the correct single patch that I want.

The help text for --single-message certainly seems to indicate that it
should ignore everything else.  Also, passing a -v doesn't do the right
thing either.

I suspect the underlying problem is that in this case, a single part of
a larger series has be split out for backport.

How am I supposed to express "literally this exact email and nothing else" ?

~Andrew
