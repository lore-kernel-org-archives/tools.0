Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D1F7EA0
	for <tools@linux.kernel.org>; Thu, 29 Sep 2022 08:43:57 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id e18so463510wmq.3
        for <tools@linux.kernel.org>; Thu, 29 Sep 2022 01:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date;
        bh=C0BtYW9Oc4ODnTJcQ+hUwWfPiui/RxO1GOv8YVjmO2A=;
        b=tllliwhIstfK6H6Y4+EEfTdzxc1F3/ec0/xc2xwTXEv6pYqOD6jzyMkdYoYhvNlMh5
         PEGUYcu9k51qBSYakJv/4CIskgztJrib9285NDneWm/DTebn73H1UddGXPLReLgpdc/v
         h4dQOeHDThbGb/7jA131enRFJtNsPYdSpxpp8TsTaPOe5Gm3FS4ruBsO8kPRx+WmRqm9
         bJI9p0xbrY91HznLu4ZXUBMw5sk8FvEbsLw8dqK/jrDALlmZpj+RIuGiRfVKfAJcXI0i
         xn+aIoJ5CILUPLfqlO3phjdgz+Y0zv8wNmE0O4tP80CtKM1LY7bEVSsa6kUHDtyoGoeK
         PMow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=C0BtYW9Oc4ODnTJcQ+hUwWfPiui/RxO1GOv8YVjmO2A=;
        b=DjKlQxcIeGqze6fZH0Fr8m6xiciKjaX4AIfcwtM/ghOjppWcri73l1jl4rLSWopR/q
         VcelE1c1FtvE+akOYaL4y0c4d5h8/LfC3Shy+LrTcolYqYjbGtue3xU+yJvs/T2TG5/i
         uunpv1LV39rXjAr09eCk5X4Mgp0KOO0Xbdh3N2ZXHd2+54wS+ZhTCx8RaZLn4RHbBYNe
         mphWw9QYjCCDSuXB/Oc46qNBA91QQJ5PbsmZ6eA0oa0CDdLhZ5o0+RsT5TC/2UhzT2s5
         0W2m0fWRwW2Oms8R84EFY9iUwuoJEr4qWLp9ZGwq8zoBtI0R5DRuf4fWt0IaJD0yASMl
         oX2g==
X-Gm-Message-State: ACrzQf3m5NX6jWMDhVUu70suC6jAZdGmVCGKITHZN6hXnEZ1fHxM9Zem
	9fy/I0eY/PAA1xBvIaSZA6RG2A==
X-Google-Smtp-Source: AMsMyM4fxYnsQMNLdH9T0STbQETMDCUac/CDLsg803pMTnbJmv9I8z1RHXV2y0JBJR0Ozp3XUZ/uWw==
X-Received: by 2002:a05:600c:3b1a:b0:3b4:858b:aef1 with SMTP id m26-20020a05600c3b1a00b003b4858baef1mr1384395wms.193.1664441036286;
        Thu, 29 Sep 2022 01:43:56 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:1f17:3ea3:4e46:dff? ([2a01:e0a:982:cbb0:1f17:3ea3:4e46:dff])
        by smtp.gmail.com with ESMTPSA id bq21-20020a5d5a15000000b0022afe4fb459sm6303391wrb.51.2022.09.29.01.43.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Sep 2022 01:43:55 -0700 (PDT)
Message-ID: <85c182a4-0ecb-9983-26ac-235cd432afd7@linaro.org>
Date: Thu, 29 Sep 2022 10:43:55 +0200
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: b4 send crashes when sendemail from is missing
Content-Language: en-US
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
References: <eb5d38af-ed64-38fd-2515-e489120cbb0b@linaro.org>
 <20220928135617.ffe5gd23vr5f2lp7@meerkat.local>
Organization: Linaro Developer Services
In-Reply-To: <20220928135617.ffe5gd23vr5f2lp7@meerkat.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/09/2022 15:56, Konstantin Ryabitsev wrote:
> On Wed, Sep 28, 2022 at 11:37:45AM +0200, Neil Armstrong wrote:
>> Hi !
>>
>> First, thanks for the b4 work !
>> I've finally tried the b4 prep/send feature and when doing the first send I got this crash:
>>
>> $ b4 send --no-sign
> 
> Or, you know, you can just sign things. ;)

It also crashed without a comprehensive error, I need to debug why!

Converted the branch to 7 patches

Populating To/Cc addresses

Will write out messages into <snip>

Traceback (most recent call last):

   File "/home/narmstrong/bin/b4", line 8, in <module>

     sys.exit(cmd())

   File "/home/narmstrong/.local/lib/python3.10/site-packages/b4/command.py", line 341, in cmd

     cmdargs.func(cmdargs)

   File "/home/narmstrong/.local/lib/python3.10/site-packages/b4/command.py", line 86, in cmd_send

     b4.ez.cmd_send(cmdargs)

   File "/home/narmstrong/.local/lib/python3.10/site-packages/b4/ez.py", line 1259, in cmd_send

     sent = b4.send_mail(smtp, send_msgs, fromaddr=fromaddr, destaddrs=alldests, patatt_sign=sign,

   File "/home/narmstrong/.local/lib/python3.10/site-packages/b4/__init__.py", line 3145, in send_mail

     bdata = patatt.rfc2822_sign(bdata)

   File "/home/narmstrong/.local/lib/python3.10/site-packages/patatt/__init__.py", line 1002, in rfc2822_sign

     pm.sign(algo, keydata, identity=config.get('identity'), selector=config.get('selector'))

   File "/home/narmstrong/.local/lib/python3.10/site-packages/patatt/__init__.py", line 569, in sign

     hv, pkinfo = ds.sign(keyinfo)

   File "/home/narmstrong/.local/lib/python3.10/site-packages/patatt/__init__.py", line 264, in sign

     bval, pkinfo = DevsigHeader._sign_openpgp(digest, keyinfo)

   File "/home/narmstrong/.local/lib/python3.10/site-packages/patatt/__init__.py", line 366, in _sign_openpgp

     raise SigningError('Running gpg failed', errors=err.decode().split('\n'))

patatt.SigningError: Running gpg failed

> 
>> I figured the "from" field was missing from my gitconfig sendemail entry.
>>
>> I checked and nowhere this "from" is required for git-send-email, perhaps get user.email or sendemail.smtpuser as fallback ?
> 
> Yes, the latest master/stable-0.10.y will fall back to user.email if
> sendemail.from is not set. Thank you for the report.

Great, thanks !

> 
> -K

Neil
