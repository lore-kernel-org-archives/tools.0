Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352252AE77
	for <tools@linux.kernel.org>; Thu, 22 Aug 2024 18:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724351060; cv=none; b=CwVdBhUEXFZT8i3fN5rdxoNfCmhYF6UnSDwTNBCYpkcW/NUEGTszV9NRU2N7HaeuO3jZmiyzFhDMuhov7fiaJHtkY4T/q+TjiZV/wFVoSXQq6xMuqQoOffYVNrntV0Cua3z+stwuvZjblPpkPFyHzQ5Af98xH1Tf01VbFUm9nTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724351060; c=relaxed/simple;
	bh=QNyULarlccjxr63ek/zdL03zsU3OccR6FxH/edOX8Oo=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ifzF9dHxrqfEIj/nnjooeuS2YV04AzKcbkO0fYmXUbChnygSVvqwf6BQgKEv+EUQQ7CmfJ2UJ7Gw3mJWNgBoyMwY80Vd7RjhGabvo26z7swjWEzjTtLQ6UQ7nLrfnvWntzftnSuaCcFSzfi8gDPkN/plQr2Uw4baaukD5KJ6M/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eR7bW9Cy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eR7bW9Cy"
Received: by smtp.kernel.org (Postfix)
	id D6ED7C4AF0C; Thu, 22 Aug 2024 18:24:19 +0000 (UTC)
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E378EC32782
	for <tools@kernel.org>; Thu, 22 Aug 2024 18:24:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E378EC32782
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f195.google.com with SMTP id d2e1a72fcca58-714226888dfso1062251b3a.1
        for <tools@kernel.org>; Thu, 22 Aug 2024 11:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724351058; x=1724955858; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/Bu0FM4bB+kWHgQkhzi+pTumCfeodW4TeEf5jboyBq0=;
        b=eR7bW9CyWNBD0wEZ6JMvCjiYRX7sPTdG93VBMu7kWMCHXer0gOflhJVInCf3fh5Os6
         fBjaQswEZB1/UtDjjKXmJABfU1YswJzxPzN3vtdD96nDlIsDez1dPc6ediCGyhKZ+z2g
         YfgoVkNzSKJJpe8/S+FsesBjhApyYlgQc7DValdBQm+zeIyg5FEwmwLx0xgLsH6OJVm5
         Qn0Tc3RDwhbE9ivnkGZFN7YyJLjpEmhBsIkplHtLRyCTOLU7NxhhAO6sF9Saf0OvXgYN
         0Eqr4veyvUzU2Bc09Pb3sumA2fsE/2DgFvREd4ehMf8ghAFdyUBCXoZPEzh4oCgiB1bT
         F5gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724351058; x=1724955858;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/Bu0FM4bB+kWHgQkhzi+pTumCfeodW4TeEf5jboyBq0=;
        b=Z7gqiTawWHDpUoBZ7JRr3ArPRK9vKStbErAV67acBxV+ye3Wx/wtjie+B2qRbimNtS
         jghOtMntoKueNXXgf1lADYFM2P/O3uK/QpSc1UIqUEL4S8xG6lVIqrPBTTXsRQ+PZQxd
         Bf4kxpyB01pyGyiMvNiFF7eKdTwnDKipfmNrIvGrhvcPVhiXNc/1pQlIIPk36R++f3Gp
         5/mU4VKQsCCI8gNgKOxcMxzR7XuQ1n11H632Vxvtnb6BM12gc9VjrONKMPDnCN6KtCgF
         X6c99nNarugSVAu/XMWJW6Qx3AnUUn1wPxQgvcjLcbxRCYx3v0hqWAMujnuKusDhVmU9
         0B1Q==
X-Gm-Message-State: AOJu0Yz+TUaL2QfcI5liF8rLmXKRpOTFDxmadngZuqeNS0NMEibap53P
	EUoJ9uSneg4BPBm322v1TU2HIH0XAX6c2Sq5xBYUdyWMpGIKHeXD4DBDUjdiHaw=
X-Google-Smtp-Source: AGHT+IHg/l6LbCeRNqvQGKe0TWuCS6/mfjLVY9Edqwxms+FO1i92yKDx/1DcgQ40IeJGL0XTyqZVZA==
X-Received: by 2002:a05:6a20:9f4e:b0:1c4:9166:ae3c with SMTP id adf61e73a8af0-1cad7f89ac8mr7701085637.14.1724351057551;
        Thu, 22 Aug 2024 11:24:17 -0700 (PDT)
Received: from [127.0.0.1] ([103.156.242.194])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7143430a260sm1675578b3a.157.2024.08.22.11.24.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Aug 2024 11:24:17 -0700 (PDT)
From: Celeste Liu <coelacanthushex@gmail.com>
X-Google-Original-From: Celeste Liu <CoelacanthusHex@gmail.com>
Message-ID: <41c9424a-62d3-4ae2-ba91-e2a05071d726@gmail.com>
Date: Fri, 23 Aug 2024 02:24:14 +0800
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH b4] sendemail.smtpServerOption can be specified multiple
 times
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 Joel Granados <j.granados@samsung.com>
References: <20240823-fix-multiple-smtpserveroption-v1-1-0c4879fcb133@gmail.com>
Content-Language: en-GB-large
In-Reply-To: <20240823-fix-multiple-smtpserveroption-v1-1-0c4879fcb133@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 2024-08-23 02:02, Celeste Liu wrote:
> In git-send-email(1):
> 
>     The --smtp-server-option option must be repeated for each option you
>     want to pass to the server. Likewise, different lines in
>     the configuration files must be used for each option.
> 
> So this config option must be specified in multivars parameter of
> get_config_from_git() and be treated as a list.
> 
> Fixes: 37811c93f5 ("Forward the smtpserveroption to the local command")
> Cc: Joel Granados <j.granados@samsung.com>
> Signed-off-by: Celeste Liu <CoelacanthusHex@gmail.com>
> ---
>  src/b4/__init__.py | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/src/b4/__init__.py b/src/b4/__init__.py
> index 2b1a058..1d0f520 100644
> --- a/src/b4/__init__.py
> +++ b/src/b4/__init__.py
> @@ -3728,10 +3728,10 @@ def _setup_sendemail_config(cmdargs: argparse.Namespace) -> None:
>      # Get the default settings first
>      config = get_main_config()
>      identity = config.get('sendemail-identity')
> -    _basecfg = get_config_from_git(r'sendemail\.[^.]+$')
> +    _basecfg = get_config_from_git(r'sendemail\.[^.]+$', multivals=['smtpserveroption'])
>      if identity:
>          # Use this identity to override what we got from the default one
> -        sconfig = get_config_from_git(rf'sendemail\.{identity}\..*', defaults=_basecfg)
> +        sconfig = get_config_from_git(rf'sendemail\.{identity}\..*', multivals=['smtpserveroption'], defaults=_basecfg)
>          sectname = f'sendemail.{identity}'
>          if not len(sconfig):
>              raise smtplib.SMTPException('Unable to find %s settings in any applicable git config' % sectname)
> @@ -3785,7 +3785,7 @@ def get_smtp(dryrun: bool = False) -> Tuple[Union[smtplib.SMTP, smtplib.SMTP_SSL
>                  smtp += ['-f', envpair[1]]
>          server_option = sconfig.get('smtpserveroption', '')

Oh. This default value is completely useless: firstly, get() will return None when mismatched, and None is false in truth testing in Python[1]; secondly, if a multivars option is not in gitconfig, it will be set to empty list in sconfig, so default value is an unreachable code. I will send v2 later.

[1]: https://docs.python.org/3/library/stdtypes.html#truth-value-testing

>          if server_option:
> -            smtp += [server_option]
> +            smtp += server_option
>          logger.debug('sendmail command: %s', ' '.join(smtp))
>          return smtp, fromaddr
>  
> 
> ---
> base-commit: 37811c93f50e70f325e45107a9a20ffc69f2f6dc
> change-id: 20240823-fix-multiple-smtpserveroption-83731eb8b4e7
> 
> Best regards,

