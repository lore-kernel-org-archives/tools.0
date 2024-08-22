Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE6AEC5
	for <tools@linux.kernel.org>; Thu, 22 Aug 2024 18:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724351457; cv=none; b=oxWefNOA2xZx3oJgMF4NJjd1Eae8YVro5jy1j4mtjhGaIk5IOA/GhY0isYV2gW6e3gMiWhNiSRszIjhttLFrdHaie4K5YOBdx8U0b0gs+GGdIqg9BdI+qjfvfR1BAZSu2QWDoqtctndlrD0WaKgp619YlSReFK6dBn68BoymVTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724351457; c=relaxed/simple;
	bh=5TuwW4Cmhn6G1nq+bOFEfTn0zEiVhjh9uATTwBEgxNA=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=NI0jr1twJMYRGSbXjToZh+oLz4PURw60GukSbRzzfUsF5URtL+nsiTVkN5QVhYfrKVq8as4WFGN2gfvV9i5GXEKGw/5rw587dcIbEMd1Qjoj0bfnXxoHzIzbzcWtbpnlXe7TP1McHeD60jqZ2FoF957zZbY3EOwGSBDw8j9hw5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MfMwKvNu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MfMwKvNu"
Received: by smtp.kernel.org (Postfix)
	id 88440C4AF0B; Thu, 22 Aug 2024 18:30:56 +0000 (UTC)
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 985FAC32782
	for <tools@kernel.org>; Thu, 22 Aug 2024 18:30:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 985FAC32782
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-201ee6b084bso10083025ad.2
        for <tools@kernel.org>; Thu, 22 Aug 2024 11:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724351454; x=1724956254; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=3Mj8lqpaY9rAiHQgpm5JgU4FBpjM0ep369fp+m6g6e0=;
        b=MfMwKvNu8DmXUTCwe3Go+BkENkhbfGI5/h2eqOx+f5HFVhSfvJsrbqWlZkI30DfPCB
         C97wwa8wkTO2R5iCJMUrxDStQgkk84PPY4eYW0menflpunf7PowDs+wrXC3dwTJ6mMlW
         UL2TNG9p8VQHivq8RB9vN/o3wQ8aFjQC3bI9lGgBjOdHHVSEB4Ucuudglztz/k1LEtJg
         e2xbcpH5eOveGpgy0j7Ct2yHhsCGt61KNrSz7G4PdcNFPZC4R1VAJymCaPqklS1cA9lr
         IzekpzEgxMmbZInDQfA6nKYHalaC1yb7Y5VldQJWPB6FMhoDz+CIZUO8LrNnMHBPBPuP
         GSIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724351454; x=1724956254;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3Mj8lqpaY9rAiHQgpm5JgU4FBpjM0ep369fp+m6g6e0=;
        b=ke8PUgk/bbnwauSMgm9FTa7NgIgkaDZOEYSkggSqHexFTsOA+scPbsrNpyWVvmPhGV
         ZO8ON5iSUWHobSB+vC3IOqOoGSrJR3oHroawAMQeM19PmPNOW8aTDGRSQNVzqWF7IgCn
         +pfGIwcS8jffmSNW6YwwG+DhJ3ziFHs84EKzBjItiLQ+m2+y/jhSKe3VnH/qNPY//m+o
         t+G4BenQM88No3knJl2wJ/IEnlvV6zPvzCUWvTjc8odk6waqJvOMOyfMXsnnUixTojK/
         SZS4TOVGEAwvZcEyMae7IIjkzRT8R6j+mO3Ky/0Y3QBoc1KifOQ0W/cXVScKUkZixwuL
         BxKw==
X-Gm-Message-State: AOJu0YwciLGlXSbDorIlfiiEYOTDGC+h9haED6EKeTFQIkRS1IJkVjAq
	ohjMrdI1Rm1vI5Pyek6wjd6CmgSrCsNxlfrQLbU5K8QVDM2UOXCDl07C72z6ODk=
X-Google-Smtp-Source: AGHT+IE7XyEJ9VjPrOUjnxNncMkHPtYG/hASWRaQQovL0lZEKRqNGYRAkWf3JN6qJf8EkINgZoeeBA==
X-Received: by 2002:a17:903:18d:b0:1fb:451a:449b with SMTP id d9443c01a7336-203681e3dbdmr73709335ad.60.1724351454423;
        Thu, 22 Aug 2024 11:30:54 -0700 (PDT)
Received: from [127.0.0.1] ([103.156.242.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-203855dded9sm15690635ad.161.2024.08.22.11.30.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Aug 2024 11:30:53 -0700 (PDT)
From: Celeste Liu <coelacanthushex@gmail.com>
X-Google-Original-From: Celeste Liu <CoelacanthusHex@gmail.com>
Message-ID: <e80a0a7a-9981-4bf4-be4c-7bcd18617502@gmail.com>
Date: Fri, 23 Aug 2024 02:30:51 +0800
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH b4] sendemail.smtpServerOption can be specified multiple
 times
Content-Language: en-GB-large
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 Joel Granados <j.granados@samsung.com>
References: <20240823-fix-multiple-smtpserveroption-v1-1-0c4879fcb133@gmail.com>
 <41c9424a-62d3-4ae2-ba91-e2a05071d726@gmail.com>
In-Reply-To: <41c9424a-62d3-4ae2-ba91-e2a05071d726@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 2024-08-23 02:24, Celeste Liu wrote:
> 
> On 2024-08-23 02:02, Celeste Liu wrote:
>> In git-send-email(1):
>>
>>     The --smtp-server-option option must be repeated for each option you
>>     want to pass to the server. Likewise, different lines in
>>     the configuration files must be used for each option.
>>
>> So this config option must be specified in multivars parameter of
>> get_config_from_git() and be treated as a list.
>>
>> Fixes: 37811c93f5 ("Forward the smtpserveroption to the local command")
>> Cc: Joel Granados <j.granados@samsung.com>
>> Signed-off-by: Celeste Liu <CoelacanthusHex@gmail.com>
>> ---
>>  src/b4/__init__.py | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/src/b4/__init__.py b/src/b4/__init__.py
>> index 2b1a058..1d0f520 100644
>> --- a/src/b4/__init__.py
>> +++ b/src/b4/__init__.py
>> @@ -3728,10 +3728,10 @@ def _setup_sendemail_config(cmdargs: argparse.Namespace) -> None:
>>      # Get the default settings first
>>      config = get_main_config()
>>      identity = config.get('sendemail-identity')
>> -    _basecfg = get_config_from_git(r'sendemail\.[^.]+$')
>> +    _basecfg = get_config_from_git(r'sendemail\.[^.]+$', multivals=['smtpserveroption'])
>>      if identity:
>>          # Use this identity to override what we got from the default one
>> -        sconfig = get_config_from_git(rf'sendemail\.{identity}\..*', defaults=_basecfg)
>> +        sconfig = get_config_from_git(rf'sendemail\.{identity}\..*', multivals=['smtpserveroption'], defaults=_basecfg)
>>          sectname = f'sendemail.{identity}'
>>          if not len(sconfig):
>>              raise smtplib.SMTPException('Unable to find %s settings in any applicable git config' % sectname)
>> @@ -3785,7 +3785,7 @@ def get_smtp(dryrun: bool = False) -> Tuple[Union[smtplib.SMTP, smtplib.SMTP_SSL
>>                  smtp += ['-f', envpair[1]]
>>          server_option = sconfig.get('smtpserveroption', '')
> 
> Oh. This default value is completely useless: firstly, get() will return None when mismatched, and None is false in truth testing in Python[1]; secondly, if a multivars option is not in gitconfig, it will be set to empty list in sconfig, so default value is an unreachable code. I will send v2 later.
> 
> [1]: https://docs.python.org/3/library/stdtypes.html#truth-value-testing
> 

I'm sorry for forgetting to wrap line to 80 column before sent...

>>          if server_option:
>> -            smtp += [server_option]
>> +            smtp += server_option
>>          logger.debug('sendmail command: %s', ' '.join(smtp))
>>          return smtp, fromaddr
>>  
>>
>> ---
>> base-commit: 37811c93f50e70f325e45107a9a20ffc69f2f6dc
>> change-id: 20240823-fix-multiple-smtpserveroption-83731eb8b4e7
>>
>> Best regards,
> 
