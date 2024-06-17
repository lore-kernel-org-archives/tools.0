Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A5F17C9F6
	for <tools@linux.kernel.org>; Mon, 17 Jun 2024 05:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718603403; cv=none; b=HYGck+m3OQS/VUAlsMp1/6ph4qBrzf9sg/9SwX3MYJdjr7WDzgr1d5LrWyXvgT7tFUGxJ3yAAHr/IFYimCGbbsv8mLSBXrdiyAppAmaCriSCAUjKwDW6Ampb5RaoSciS4W5Oieq9mfQpsGn06OWlh0iwW3MqhzOXtCG1tRleasc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718603403; c=relaxed/simple;
	bh=SbFBAy1VRTSUAAapBEJfa6VYfdZCssJmt1B+5htV7nw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=NIFNoCDXijRzQig3UBUM2yVTrWaTqJgBJPCTyFGInpSBYWfkBkIafvfxIijZPE0FjUOISQ8POuXZnO5TSka5qqfw4DytXN5hPlk1QxHVRPSGoXJo4QbZchpxOLPvP3fdqZku8rO4VF948CuiyjzZJs0HaL2hEDky9+HBuPcFemg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id A0660C4AF1A; Mon, 17 Jun 2024 05:50:02 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A1430C3277B;
	Mon, 17 Jun 2024 05:50:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A1430C3277B
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-57c75464e77so4678342a12.0;
        Sun, 16 Jun 2024 22:50:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718603400; x=1719208200;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PD6TWZ1JDRfqvpjYZNv5x+smQwwJUgCPHMZblPz21ag=;
        b=ppVCF6R3loeWS+UppQM/IwSRelhyCTyVmrt23PWz4hiEHrH3AwSZVLntR+tJf3H+Tt
         iu6kjKFYyH6i3ysLbMAfkNmEScvQ1pRTIEPYlrWbQIbiVxmUI1SBHsgWJAaPFJKUP9oq
         ySNh1aZibpNKUzFh2BLVWnBBPr8cj1NvOssuFbR99Y8JYh4/u0PAHePyp08bdzPUY9Ou
         Cxr95avgqENQ2bEO+faIB8Yqzis3c4zGwuznf1gz2OPTey06fllCXRbHgh8Rh3t25xbf
         jRgkBwJ46uQSAZoQOxjhrLn/UkdNsbqTJHFBeVKaoBEH0XEgggXp3bcWisE/MnUKSbeM
         5VOw==
X-Forwarded-Encrypted: i=1; AJvYcCURKNPPSE0WjkZpS5XSAh8XAvzrW/6fDrURCKgfGzoSiE/mSAJZQfnFIUyXw4+WZAWS+XTX4VA0CmOAm9r2hrAurv4rh8MCakWOauufS8iqDr9Y
X-Gm-Message-State: AOJu0Yy+KJIJYKXhEeg8uug/0eOyWRQTRK6ajgd6zWsoqdrd1gwIchQD
	D+ytl8zEygoVfmro7OHI1yVNb1oyOYIQHG7zE5IUMEw3Ki6Ff6jbx5MoWSwm
X-Google-Smtp-Source: AGHT+IHHsT0lvZveTEtVgCjJ6n9jIsUTsJreFq0nagzODO+GMGCMdqcrV8OnLYlHOm+BHtjijrTg0w==
X-Received: by 2002:a50:d4d8:0:b0:57c:a478:2ff4 with SMTP id 4fb4d7f45d1cf-57cbd681ae0mr7323582a12.11.1718603399721;
        Sun, 16 Jun 2024 22:49:59 -0700 (PDT)
Received: from ?IPV6:2a0b:e7c0:0:107::aaaa:69? ([2a0b:e7c0:0:107::aaaa:69])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57cb72ce07esm5871266a12.12.2024.06.16.22.49.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Jun 2024 22:49:59 -0700 (PDT)
Message-ID: <16c45272-8ece-4503-87b0-5fd67d052a74@kernel.org>
Date: Mon, 17 Jun 2024 07:49:58 +0200
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: b4 0.14.0 available
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, tools@kernel.org,
 users@kernel.org
References: <20240614-flashy-inquisitive-beaver-ddcfea@lemur>
Content-Language: en-US
From: Jiri Slaby <jirislaby@kernel.org>
Autocrypt: addr=jirislaby@kernel.org; keydata=
 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
In-Reply-To: <20240614-flashy-inquisitive-beaver-ddcfea@lemur>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14. 06. 24, 21:26, Konstantin Ryabitsev wrote:
> If you're using b4 via the git checkout, you can either update to latest
> master, or checkout the new stable-0.14.y branch. You can also download signed
> tarballs from the usual location:

Hi,

with the new toml, strange files are installed:
/usr/lib/python3.11/site-packages/tests/__init__.py
/usr/lib/python3.11/site-packages/tests/__pycache__/__init__.cpython-311.opt-1.pyc
/usr/lib/python3.11/site-packages/tests/__pycache__/__init__.cpython-311.pyc
/usr/lib/python3.11/site-packages/tests/__pycache__/conftest.cpython-311.opt-1.pyc
/usr/lib/python3.11/site-packages/tests/__pycache__/conftest.cpython-311.pyc
/usr/lib/python3.11/site-packages/tests/__pycache__/test___init__.cpython-311.opt-1.pyc
/usr/lib/python3.11/site-packages/tests/__pycache__/test___init__.cpython-311.pyc
/usr/lib/python3.11/site-packages/tests/__pycache__/test_ez.cpython-311.opt-1.pyc
/usr/lib/python3.11/site-packages/tests/__pycache__/test_ez.cpython-311.pyc
/usr/lib/python3.11/site-packages/tests/__pycache__/test_mbox.cpython-311.opt-1.pyc
/usr/lib/python3.11/site-packages/tests/__pycache__/test_mbox.cpython-311.pyc
/usr/lib/python3.11/site-packages/tests/conftest.py
/usr/lib/python3.11/site-packages/tests/test___init__.py
/usr/lib/python3.11/site-packages/tests/test_ez.py
/usr/lib/python3.11/site-packages/tests/test_mbox.py
/usr/lib/python3.11/site-packages/b4/man/b4.5.rst


and OTOH, man is not installed (path from 0.13):
/usr/share/man/man5/b4.5.gz

Any thoughts? I don't speak python...

thanks,
-- 
js

