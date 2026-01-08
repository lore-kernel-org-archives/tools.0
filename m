Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945E62C21C4
	for <tools@linux.kernel.org>; Thu,  8 Jan 2026 18:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767896446; cv=none; b=iPU5b5+lF5dO0/yJd8zf5+pS/GMPiJshtyo+GT/G2dOdQj27xxBCaal6AwERT5ulqBxHn743d6N4CWbbtMzHa2/BxGuuiBKeE+iokstqAS8kribxWqBdvChUuK1ZA4te1CuLpzf0OfSKhetlnMfgL/R1Xg9KD3iCqfgDqN5nuLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767896446; c=relaxed/simple;
	bh=GYhQjfwjNvpv2cYTwr9/e9Xo2FSVcB2D9pMrfBJEc0c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ISgnp7M1ETtq+u/S4XeVSUoLvVGUq4VOrgtrLkLstJeeKQxJzNCE4K/LhpQakg3ZiJ7WVhhQE6SdP16ErUwVZPrGCmq2VSiRP9hr1pcNyFIQC7WWMMyIjR/6jctMBNB0eTausZDJvrWVW3O5or+yF3Zl3zri1ndyGtDsBQn06/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lo2KJB6J; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lo2KJB6J"
Received: by smtp.kernel.org (Postfix)
	id 31210C116D0; Thu,  8 Jan 2026 18:20:46 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 79B1FC116C6
	for <tools@kernel.org>; Thu,  8 Jan 2026 18:20:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 79B1FC116C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-432d28870ddso512672f8f.3
        for <tools@kernel.org>; Thu, 08 Jan 2026 10:20:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767896444; x=1768501244; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gxnre8wBA0aKZPMlNNM4Suq1Jef0tNIw97tBb1fyKzo=;
        b=Lo2KJB6J0EZcY9fhdeNID0h1Cb2uCGU9JealiaKlurmJCVnQn5M2YmWHW1DRTsZ9iY
         jpcxwtyq0pdSsNLGJcGA7x98DKQmby3qir6G7pFepljyO50RoTMJcHWgVnqbMCYIEg0m
         wpTD3z87vtj1u9k9uWofbckHpRXilRDhbW2o1EKNBoLeD11wObUVH46Ogyvx3VB+VgxC
         4OJHCHzd9iWe20vIqWQv6Ev0n09vXVF22EcQ4R2xQunIMA3mk48t4zQx6GlR7kmHoHbJ
         KbBUMfcEvPR5WmWz9X2lIcj9ZGo67v5YNiIWPzpSiQuvulU8xuq9/uvoQiDnDSDPFOlp
         DRfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767896444; x=1768501244;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gxnre8wBA0aKZPMlNNM4Suq1Jef0tNIw97tBb1fyKzo=;
        b=Y7QQNq1wnSQ/yJMuZsK02K9RFT9ygVgHlCZClKDVYB4yf6+zIqMdwjyyUmo+qNERHh
         7RxoXzOesZkQUIeRuQjjwYiw1QDknNMuv2YpqFMOTl4DUW0NZ41ykDv45YfioMQv8zyO
         6AnOm0JKb40DkaV+Zt3Jm7Liuq5hrZhWvE1E6BGZZ0gTqPmSdoK9nVjH5sJWFOokhnJP
         2dEUrsHZ7Z6nJw9NWK4aM1pdD4EAEkCpkjjapat/zjOqbQAUfXDEcftin30z8oROlvU/
         yYny9lxIQYkUuMNV8aXXlPipo4cweAtcjNIcYQoW/IBNkuv74tZz0k1OpfS6JIH8rhxL
         +7KQ==
X-Gm-Message-State: AOJu0YwHp9yIxf7V6FEdxRf2s82kWfheuaGWovWy1uTjX15vo7wru0QW
	iLodMzsmQDWLd47kVhJmoHBfqo3oR7U8FONDbAKE8+YkENrWqRf4EJTVqCYxuA==
X-Gm-Gg: AY/fxX480VCsIvhQ83U9JhkCNY4MaeeS3m0tisJTkw41W9dORqpOJ8o0FzHQ82dYZ5N
	+wFKVe+bOVtbOcDoCRCd/RlJCQ3LDCnGfGdLSCGhzXeHJBvY3bBjs/mB254NPoTPzjr3l+Po94L
	trby4ZyxlzuJcyOYjrsI8IGtw2J/QVK6ghAVC5QeW3hpvPutMU5V42X3slo82P6uLsFfsbPBAUv
	K5bKAVmsHfrktCNwhDpR6snw0wKmfh9WaQ3hh9qrje7C3QdNY4S77YhRvHup3PObDa4xfPUNkQS
	nA4LTytlp+yP0gylHhxaKXhU2FVCXiH5guuD9Y975aE8GmkvmowYBAFwPLwInsuST+Qsto5BKYN
	C69WEcoL2Z01fgfbOdgsheNzaMhBpP58VlGNIEPYpynLJpTpWF6bwHVztchESJcRiFmcL3uFZ6t
	yc/pgIEDsdDWPLv9AoHa1EJ+RbvHErdJB+7f586hKjGMIf3Vke37FKmTfTTLHW0B+3TZu3/z5Fx
	BsBk8ZOxDnfi7MpY9Q7LomjwIVUBs7cBgubYW3yAfHyDmuc1H2EeFyWdCu5a5OKuy787P8lpP8=
X-Google-Smtp-Source: AGHT+IHi/RVaPQmvCE0En6NS7DZHMATORl8hP0fJOc+LLV5j4w1atqZ+6heFllwAPBzlLbk8tpaAKw==
X-Received: by 2002:a05:6000:22c1:b0:431:74:cca with SMTP id ffacd0b85a97d-432c3760fa1mr8698531f8f.44.1767896443568;
        Thu, 08 Jan 2026 10:20:43 -0800 (PST)
Received: from ?IPV6:2a01:114f:470e:6200:3b12:322d:3b6d:c5a1? (2a01-114f-470e-6200-3b12-322d-3b6d-c5a1.ea.ipv6.supernova.orange.pl. [2a01:114f:470e:6200:3b12:322d:3b6d:c5a1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5edd51sm17733119f8f.29.2026.01.08.10.20.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 10:20:43 -0800 (PST)
Message-ID: <e0229ecf-5ce4-45b3-af3b-7008afed94fd@gmail.com>
Date: Thu, 8 Jan 2026 19:20:41 +0100
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Use pre-Python 3.13 Generator type syntax in conftest.py
To: tools@kernel.org
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
References: <20260108165200.11313-1-aweber.kernel@gmail.com>
Content-Language: en-US
From: Artur Weber <aweber.kernel@gmail.com>
In-Reply-To: <20260108165200.11313-1-aweber.kernel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8.01.2026 17:52, Artur Weber wrote:
> Python 3.13 defaults to None for the other fields of the Generator type,
> but the version of Generator in older versions does not support such syntax.
> Explicitly add the missing fields to allow the tests to run on older Python
> versions.
> 
> (An alternative solution would be to use typing-extensions for older
> versions, though that would require adding another dependency.)
> 
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>

It just occurred to me that I didn't mention what this patch is for 
anywhere in this mail.

This is a patch for patatt :)

Best regards
Artur
