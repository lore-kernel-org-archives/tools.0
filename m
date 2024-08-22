Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB3C78676
	for <tools@linux.kernel.org>; Thu, 22 Aug 2024 18:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724351629; cv=none; b=bDA4xnt4wH1PUM6lObKvNGUpIcsl7FB39BdG8P9zE2ImwcXI7Oa17XFqDg9rt+82Hp9Vko/rSzwyf+QIajvKtpMfuKMIqBUzYseJY/trpK7dPDgbkngIoW9f41im0YoYZCQJ1aHFfSx+fJHqCrxk8KD5YDczBrSXOAlXq4qayeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724351629; c=relaxed/simple;
	bh=iNtafBVK+jwjBp8Vu88y+CCODldJ/uFmWa/Kepz/et4=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=NGCsjdrhh4xtUmtR+9OCjFga502NdfNxWxLJ+KJdoj7kgkaOj48OmHrsjOz4TepReqbUK+N/RTJN4yEnIXO2F3oyQGM2cnSAbgdqR5WtMQTEyU0pCN6lNePszPJUwlFx3DVROHFjPkcOwzZuuceGHt28bf0foYL61dUvNHq44kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kzScbhAB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kzScbhAB"
Received: by smtp.kernel.org (Postfix)
	id 13A5DC4AF0B; Thu, 22 Aug 2024 18:33:49 +0000 (UTC)
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 28C23C32782
	for <tools@kernel.org>; Thu, 22 Aug 2024 18:33:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 28C23C32782
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f195.google.com with SMTP id d2e1a72fcca58-7141b04e7b5so758159b3a.2
        for <tools@kernel.org>; Thu, 22 Aug 2024 11:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724351627; x=1724956427; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=83QXs3MdzPLWZH1A6qvA72iBfhP0w0IG85IkLkurgYY=;
        b=kzScbhABKeIOyFkki0H+PJMLZt08glHgw4C28JEHJMUzJyL7ORl/SoxFKr1QKyhn7M
         /6GSif5N9Q/4xi2hGZudwnNrkRotYXZa2NtuBbs0sF/7lf7dVOF4wiXQo4G7zHDzBWd5
         hASqpdnPr7AzLkYPl+KbmohA5IyCm0s++Ut0LxTCO5VjfDQvsxrB/bW6+k9ivx/5Feob
         8jquWYXuLMkjZBdVqJSTVvZPP/LDyeBoEaZfPOPMxnTFQ+iMhyVK8NrQ/dM/MuUy+GsT
         R9dBe4VkqaorXQwPMP1zy+ppx84cCulCShmi8GS24KJ+6p/L5M2SzCu8XYOhP5hq7Tg6
         icuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724351627; x=1724956427;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=83QXs3MdzPLWZH1A6qvA72iBfhP0w0IG85IkLkurgYY=;
        b=MiTK5Wsr2cgd8+yOren0QILlvTpo8HAAStygzpOD5tsAmNsSXe3UkMLEbHSP1iqm6U
         giaInIi4VfEZaEFYdAUjhsp7usXnZaUfJov2HSt8xYnVIPi5Vv/EBSk9jlW05A2aKgQK
         6UVHqgcX60X7JKFa/uckc/s97nnbbTjplOjAygpkxSWKaSLUUYKW/BldfDH9zqzI/wa1
         WA7JYE1XeyDuHFACC/UgWFAnZjAA3WrXR9KNc1mPYKEG4fLXrB7wBT9+NgI7q7Em3YXp
         64RLLkufsbORQuu9UPUQQkxkfYlk/OFcHmFQh+2OtQhPoFzaIMY+HjiBiBZYOeUzyRRn
         NvdA==
X-Gm-Message-State: AOJu0YyQqihsTb0rTkb8kRRTK/MSMT8kYxOhGd/vbqPGtAxZ3q+6wqex
	tGeh7xWM0dbBy87kcgyt3JFNxLrJ9Jxl5ExDF286lOpEDEk5S945YPfnARv10DA=
X-Google-Smtp-Source: AGHT+IHiUmEP5vV9qWOaPxhYE4nHb5OXnEK/PoUJGVIJcsF2pBRvGzwEtUlNQYVoHdY4bOZYewAgqQ==
X-Received: by 2002:a05:6a21:9185:b0:1c4:d8ec:b59f with SMTP id adf61e73a8af0-1cad7fb1c6fmr7576471637.25.1724351626953;
        Thu, 22 Aug 2024 11:33:46 -0700 (PDT)
Received: from [127.0.0.1] ([103.156.242.194])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7143433b11asm1679709b3a.214.2024.08.22.11.33.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Aug 2024 11:33:46 -0700 (PDT)
From: Celeste Liu <coelacanthushex@gmail.com>
X-Google-Original-From: Celeste Liu <CoelacanthusHex@gmail.com>
Message-ID: <1ff7ab17-f8ed-436c-a063-e44635c4c37b@gmail.com>
Date: Fri, 23 Aug 2024 02:33:43 +0800
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

v2 has been sent.

> 
> [1]: https://docs.python.org/3/library/stdtypes.html#truth-value-testing
> 
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

