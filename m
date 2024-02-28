Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C0571EDE
	for <tools@linux.kernel.org>; Wed, 28 Feb 2024 18:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709146339; cv=none; b=OwObUtHV1Gz7Ihl/jxZOw1gihUlr6ZzdEBqZlHmUfEQrOzdnl1pwJG+VMC7evSER9hQztqQPKVOuJ2igd1jvYhDT/1OpisIMG/rjCF0bqIsBoxv/zw5afhjW7Qc77XX9CWPIPxyGFyIkFVdAmO6G8p+DjypkYB/j7JvIwHYVYik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709146339; c=relaxed/simple;
	bh=G/XWLtlrXjTaY1Jcyu5g1XD4GZhnReFAVXlyEk9/JvM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jRp7kz9IYQKeb7KKtNCBIEAzy+3XvqhemQe5iCKzhmJyiU1KIpU3D2csaJKQOTd7sblujckrLI6YOYZJf/uC83s779iXB0QeqxPPunVZoIDLRVzaSqnBpab7xmOoMEDTiQ0Gjuu+VOz4gkEmvsmQIaZtqVV+SCtuZGhwHtv+cts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=MHdyml1c; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="MHdyml1c"
Received: by smtp.kernel.org (Postfix)
	id 5A888C43394; Wed, 28 Feb 2024 18:52:19 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 19ACCC433C7
	for <tools@kernel.org>; Wed, 28 Feb 2024 18:52:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 19ACCC433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=ieee.org
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-787cfbc55beso5171885a.1
        for <tools@kernel.org>; Wed, 28 Feb 2024 10:52:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1709146337; x=1709751137; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nXdRShsVl2Yr3VUAeDAmdz/jvSTyMBSjYhDRGKzBZXE=;
        b=MHdyml1c5MzO6P2ppzinqTF4GGp0I4Flls/kj4kfX32NXTCHutdlgK1t/mkAiLZJMb
         7rnNytNcBPHKORn7jOXYGG3DwwxvzitJ+rUgIWnTkboKus3i9gW6qOeHWCSPhDk1WXsA
         +qjikkdGKXB/+GO73GGqqc+nrRzcSOtzfcewk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709146337; x=1709751137;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nXdRShsVl2Yr3VUAeDAmdz/jvSTyMBSjYhDRGKzBZXE=;
        b=q5SKCQJaI/ZBbX7OXKvbMN2gjf1OB4Y8GI+SWbZsDvy2CAM9uD8tvkMehcMbU/BlGt
         m8HaubC4AgUi8wl4yK53r3PZm5PO9F/iDks7WWR4DsenLQHsyxhZMjbigZfgsaxFykvT
         hXa5VVpq7k6VK1LjaXhRHELd/u666OpDjpif14ACVWuYkyAnHYhtcdIHo2kjiRo2e+Rf
         AQs2v7XSRq0h2PRCV8vdODK6bHi7nQX4f91t96fZs2qW9pPDqyc37UA/4VLa0+EMoYKM
         A8xdp5srr5toZqcxg4J6lEn/Vid/o0RwD3KuroX0xTRgkFXSrj60z/bEcejxjU/2uCCj
         YEdQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2LuimD29PE8ZbxVCY43ceQsUAJUu2tIEBlo0EGjfUgexHcZe+Z9k2FcYVmLLuyPJRon1CVHwU7edyKBgOG6Vd
X-Gm-Message-State: AOJu0YxXQFDi1ffOAS+CkK7n4KaBYi2w0jB8jbZw7yG7mV4npNE8cfDA
	FoKZalN0W4htQp09rzMDOBJv4MQcapWkWwDm/TS1lfNrssKZjp6s3WL86iDqFQ==
X-Google-Smtp-Source: AGHT+IFxTlH3wUsU1v/631yjABFsdLnt8s4kuo9pW7ZFcf8pN8c3NG3UkhD4t6Mz0TKBW90bXwwBwQ==
X-Received: by 2002:a05:620a:1192:b0:787:3f04:acbb with SMTP id b18-20020a05620a119200b007873f04acbbmr6060684qkk.12.1709146336985;
        Wed, 28 Feb 2024 10:52:16 -0800 (PST)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.googlemail.com with ESMTPSA id w17-20020a05620a445100b00787debfc66bsm51587qkp.97.2024.02.28.10.52.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Feb 2024 10:52:16 -0800 (PST)
Message-ID: <c694fad4-dfee-4ece-b931-597b85b37f28@ieee.org>
Date: Wed, 28 Feb 2024 12:52:15 -0600
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Toy/demo: using ChatGPT to summarize lengthy LKML threads (b4
 integration)
Content-Language: en-US
To: Jonathan Corbet <corbet@lwn.net>, Hannes Reinecke <hare@suse.de>,
 Willy Tarreau <w@1wt.eu>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@kernel.org, tools@kernel.org, workflows@vger.kernel.org
References: <20240227-flawless-capybara-of-drama-e09653@lemur>
 <20240228050007.GB18047@1wt.eu>
 <4fa1cbc7-0f9d-47bf-8ff7-a9b17456431e@suse.de> <87msrktrft.fsf@meer.lwn.net>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <87msrktrft.fsf@meer.lwn.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/28/24 11:43 AM, Jonathan Corbet wrote:
> Meanwhile, in the short term I suspect LWN can find a place for itself.

I am certain that ChatGPT and the like will *not* replace LWN
any time soon--not at *all*.  The human analysis and ownership
provides enormous value.

> After that I hope to be retired.

Nooo!!!  But yeah, we're all getting older.

					-Alex
