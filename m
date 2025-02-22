Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD482F37
	for <tools@linux.kernel.org>; Sat, 22 Feb 2025 01:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740188294; cv=none; b=O3EENCDezh4RGKuECb5EnwCDH+c4JZ4rCdgg8ldjgwho6VzqioxUgpiZi56sA3brzrI2LX9VGxIKLq2DxQYKct/LXJsEVTYUc6KS3sH6bO4UsQaScnWpttsFpFXJw65N+rjcOgt9oCVqGGkNHIyUynLpjyIi5AWqzyCI7FSei00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740188294; c=relaxed/simple;
	bh=5myhagGKFxtZOe12+aWZt1NzI0PCgoQxqBUXMxrZBRo=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=GzXsyh0OYyCfaWfU0dRrPwSGTGMy/yrSTn5zwzCGQ1AKH+edbTv3TKDMYaPXF/bbI2L4Z5FTeCZSrE1UusqP/qlcTKbUuAUHgjOulWDDLXY+oUxtIew0H+MmNF7NHW/zgMHFAAyLGK9RAI9rcrGd3zXI7meVXtEv9oiQlpprrQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b=JJHEEAQX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="JJHEEAQX"
Received: by smtp.kernel.org (Postfix)
	id 06CB5C4CEE2; Sat, 22 Feb 2025 01:38:14 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D742AC4CED6
	for <tools@kernel.org>; Sat, 22 Feb 2025 01:38:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D742AC4CED6
Authentication-Results: smtp.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=cloud.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-38f1e8efef5so1599959f8f.1
        for <tools@kernel.org>; Fri, 21 Feb 2025 17:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1740188291; x=1740793091; darn=kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5myhagGKFxtZOe12+aWZt1NzI0PCgoQxqBUXMxrZBRo=;
        b=JJHEEAQX8NR4AWWTt23f1UJfxlr4j2BDkzMhDbozn4ofdTMahjOMqAwQYK0wb7pbge
         YrGKP793E0uzG5SrxJq4UvtoQY/PxFeH/XAWy7peKz3t+PzkGjlzHJ07Qmx0JYJOLE1K
         Ulp68HSQtI7oe7yBXzdx+b40jv+pKn7cUh+PQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740188291; x=1740793091;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5myhagGKFxtZOe12+aWZt1NzI0PCgoQxqBUXMxrZBRo=;
        b=UKulhGRSWt4pC8OWutUDLK4fk9OhsauFvynzKRPzkZFOi3zaVoak7qrk6aM9YPS08F
         zgmN85Pek7moO5whszpx+XDyQRruZvZTqNyd2/wX8Go400n719DDYeDP3Q5tiqZK0O1E
         OEacyovA1ydWsOrGSqJOzirVkq15rUn/WUGnr+Az1Rvh/nN0SB+aV7tHXhuPOlfvEDvF
         Xp+Q+bkPITF/ql8a3CNgD7LtZD4vDC+RIWlDy5rodqHcgrlLw1oB1zc2KAax0XNxt2yw
         0BOa8quuup/MO8ZiEWKfZQkiagJSTz5UpTkAoVgQtOc9Ok85BYY/7cW78kZ+jpSnl8NE
         mKYQ==
X-Gm-Message-State: AOJu0YxXu0ck98CtT4D/2RJz+5ii6w7TqhSA5Yy0JDFB3bYiKqH4w7Nu
	QpceSd/KZC4SrIV1V76AwSBlFNdnxko1+083hGVKssvR4lAfrc7kPtdd6KdiOTFBiHEc2s/xWSD
	e
X-Gm-Gg: ASbGncu/at2VdW4mde7raPnnjuEWOIQX91l1JUop4RY5g+5kGwiS+bXHoT02wzcG9nG
	1Ndpc3e6qIXVfPniS1i9LUJZKNhNScB4iA1s77qb5V5y8t6IPNIuuwBOBZ0EiY0FS44TiZ5MOPG
	ZXpoVEbQb80X0rOaIQJijZikLxv+NMhJEc38DYC74oQI1BCWQSgUcXFS64N9rpuYxoOGiXLgK8F
	4x+1JhlVoXhjpalXkYO0ZuIwOjJGmIivm2gI3MWcwgjiqxZQh1rsSc9Ro3UzVfAUg41SdBAiemn
	AiocB/lPUlv2oRVQM13xToJfcNJ96/+WzA3G2rL2bKZameOB2Rkjta0OEItJlItXRw==
X-Google-Smtp-Source: AGHT+IGItoVgxs7f3YG6LrNkWWBhCs5AcGhrjcK+Mit3T/pRTeuUtkGQAeUFo5IoWyHaNFzrJMCHzQ==
X-Received: by 2002:a5d:47c9:0:b0:38d:dc4d:3476 with SMTP id ffacd0b85a97d-38f6f0c29a3mr3677727f8f.52.1740188290799;
        Fri, 21 Feb 2025 17:38:10 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d5655sm24822337f8f.77.2025.02.21.17.38.08
        for <tools@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Feb 2025 17:38:09 -0800 (PST)
Message-ID: <8334309d-32ac-4900-9847-6622bae33bba@citrix.com>
Date: Sat, 22 Feb 2025 01:38:08 +0000
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
Subject: b4 and series with a retroactive 0.5/4 patch
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

With current tip of master:

> $ b4 shazam cover.1740071755.git.oleksii.kurochko@gmail.com
> Grabbing thread from
> lore.kernel.org/all/cover.1740071755.git.oleksii.kurochko@gmail.com/t.mbox.gz
> Checking for newer revisions
> Grabbing search results from lore.kernel.org
> Analyzing 11 messages in the thread
> WARNING: duplicate messages found at index 1
>    Subject 1: xen/README: add compiler and binutils versions for RISCV-64
>    Subject 2: automation: drop debian:11-riscv64 container
>   2 is not a reply... assume additional patch
> WARNING: duplicate messages found at index 2
>    Subject 1: xen/riscv: drop CONFIG_RISCV_ISA_RV64G
>    Subject 2: automation: drop debian:11-riscv64 container
>   2 is not a reply... assume additional patch
> Analyzing 168 code-review messages
> Checking attestation on all messages, may take a moment...
> ---
>   ✓ [PATCH v7] xen/README: add compiler and binutils versions for RISCV-64
>     ✓ Signed: DKIM/gmail.com
>     + Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> (✗ DKIM/gmail.com)
>     + Acked-by: George Dunlap <george.dunlap@cloud.com> (✗ DKIM/cloud.com)
>   ✓ [PATCH v7 2/4] xen/riscv: drop CONFIG_RISCV_ISA_RV64G
>     ✓ Signed: DKIM/gmail.com
>   ✓ [PATCH v7 1/4] automation: drop debian:11-riscv64 container
>     ✓ Signed: DKIM/gmail.com
>   ✓ [PATCH v7 4/4] xen/riscv: identify specific ISA supported by cpu
>     ✓ Signed: DKIM/gmail.com
>   ERROR: missing [5/4]!
>   ERROR: missing [6/4]!
> ---
> Total patches: 4
> ---
> WARNING: Thread incomplete!
> Applying: xen/README: add compiler and binutils versions for RISCV-64
> Applying: xen/riscv: drop CONFIG_RISCV_ISA_RV64G
> Applying: automation: drop debian:11-riscv64 container
> Applying: xen/riscv: identify specific ISA supported by cpu

There are 5 patches rather than 6, and the one which was originally 3/4
seems to get lost.

Furthermore, because of the (failed) guessing, `-P 3` doesn't work
because it can't see a patch 3.

`-P _` and an exact message id does work, presumably because it skips
the attempts to guess the new order.

~Andrew
