Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B335F1AAB1
	for <tools@linux.kernel.org>; Wed,  6 Mar 2024 21:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709760288; cv=none; b=jS/hlUzpw99xHCYXpXRexBl+Q+Y2zRNide84HgVB4s0gEpkhoOwbhsmxWiQ0sBaAGIeKDQDC8OtLuSA1T2mzPyIvwyXbva2yXkktu8XKeWedavbpAoWC5YxpeXon/YqbRn/gbCt+TJbGdB0np48UJa8TscJo9j2iwE7DKyFWG+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709760288; c=relaxed/simple;
	bh=7q/4s2sGbx7uqW6h6lzQvLse43MuDsv03JBM77XVsKQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=T5PdyErdpRiEOIiv56TVGnYq3ti7e46elxtNTTfsbHDYyFw29zyKddGE9pZGC5IC++6U6aaXn2GAZchJDzV5oSa6HOBpUwzh2S3qAGvnbYi2ypY9Mh/+8iFR7GPHzyS3f3yU8TIjUPsHYLSyYZchyv74Z1xWue7w/W15gp1/pZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b=CU1DQ9N9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="CU1DQ9N9"
Received: by smtp.kernel.org (Postfix)
	id 50F3EC433C7; Wed,  6 Mar 2024 21:24:48 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 522D2C433F1
	for <tools@kernel.org>; Wed,  6 Mar 2024 21:24:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 522D2C433F1
Authentication-Results: smtp.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=cloud.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a2f22bfb4e6so38143366b.0
        for <tools@kernel.org>; Wed, 06 Mar 2024 13:24:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709760285; x=1710365085; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7q/4s2sGbx7uqW6h6lzQvLse43MuDsv03JBM77XVsKQ=;
        b=CU1DQ9N9/+1Smvh8I8RubUewcN1k49hcREw2jdc7wXZunHj2DGwAL5pK16jAZsgfM+
         E5bYl4rf+GmDFBySkcf9iRlyUnlzEv/fuWR3y7O9o+ZedLDDqVNkeOPDc9lf+fxgFziD
         S4O2u2h+JEOKU6/n5s4rCCGCBiAJHm0XfIxe8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709760285; x=1710365085;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7q/4s2sGbx7uqW6h6lzQvLse43MuDsv03JBM77XVsKQ=;
        b=FQUezHESIpXEF2o1R62gNz5kqIrD5/7mohgwpa98EODPHPsSnx3BoCtx8vBd9OqgQy
         ySsIW44fHjnlQVkiqURNTXd8o4gvFqiHA+p0xJ9GeXPh3Cx3FzJwHw1k+fWbwKcWu0gT
         Sz8Crrxqw3Gc73Z0Z8EAgI4NhhOgeg5jR4w5nxQiK4kK8C8PT0zmBTZNvENiocSQXddD
         k+T0FZ8Byw/iJ6BtUulw3cq369sXAnawOXvXesfeN44hp6VIZBun1QlNw4GQ9u3vlPLP
         v2N99CONTxcdSVjo4KwtoNKf2bnaUawqtTALU/8ytd3WMzN7YUJSYR6XL5yRYJuX/s+d
         3YiQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0+gBteyaJvjCBhsGvYW28qZuFeVHZmcW2ktaaQx+cRhM72EHX7yxdXxVklJiN/mX5ubstZhdzbHKzosspiP1j
X-Gm-Message-State: AOJu0YzQJa9lm3d8f2OZCxyW1qAyhU5xuLoOPYvZ/04/4TENm8kcRG6s
	I44FgoQ+DFzTW8uJaxpfMDIvznQ54HlumxVZz2qt9jLtRo+j/DCjs3FGLZL1wqI=
X-Google-Smtp-Source: AGHT+IFe49Ht3iqviXhIL0W1s5366xSkOehj3JyPcXCdhISY1aHyGtPZqVdas1kDcRPUT5rwCrITIQ==
X-Received: by 2002:a17:906:3c13:b0:a44:2563:c5dd with SMTP id h19-20020a1709063c1300b00a442563c5ddmr10651772ejg.45.1709760285406;
        Wed, 06 Mar 2024 13:24:45 -0800 (PST)
Received: from [10.80.67.149] (default-46-102-197-194.interdsl.co.uk. [46.102.197.194])
        by smtp.gmail.com with ESMTPSA id o7-20020a1709062e8700b00a4558314ea0sm3700531eji.15.2024.03.06.13.24.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Mar 2024 13:24:44 -0800 (PST)
Message-ID: <d5675b68-02a0-4a94-996e-c58506af29d1@citrix.com>
Date: Wed, 6 Mar 2024 21:24:43 +0000
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: b4 DKIM checks
Content-Language: en-GB
To: "Kernel.org Bugbot" <bugbot@kernel.org>, tools@kernel.org,
 konstantin@linuxfoundation.org, tools@linux.kernel.org
References: <16beccd0-db0b-4c9c-a4d1-fcf43f98959c@citrix.com>
 <20240306-b218567c2-d19e5ea37547@bugzilla.kernel.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20240306-b218567c2-d19e5ea37547@bugzilla.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06/03/2024 8:20 pm, Kernel.org Bugbot wrote:
> Konstantin Ryabitsev writes in commit 1457bc615a8ff06afba252a15480b61dd7cfef60:
>
> main: add ability to specify DNS resolvers for DKIM
>
> Sometimes it is useful to be able to specify alternative resolvers to
> use for DKIM lookups, for example when you're on an internal network
> that uses split-horizon DNS. You can now override the resolvers to use,
> but please check that you're actually able to query them.
>
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=218567
> Signed-off-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
>
> (via https://git.kernel.org/pub/scm/utils/b4/b4.git/commit/?id=1457bc615a8f)

Just tried this out.

Checking attestation on all messages, may take a moment...
---
...
  ---
  ✓ Signed: DKIM/citrix.com
---
Total patches: 1

Thankyou!

~Andrew
