Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web10.52696.1606229385406000949
 for <tools@linux.kernel.org>;
 Tue, 24 Nov 2020 06:49:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qy+EGNOd;
 spf=pass (domain: gmail.com, ip: 209.85.222.195, mailfrom: levraiphilippeblain@gmail.com)
Received: by mail-qk1-f195.google.com with SMTP id q22so20614652qkq.6
        for <tools@linux.kernel.org>; Tue, 24 Nov 2020 06:49:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=47lftltXR4j2SPa7sZ3evEMWWzVmCGPcS3QIZa0yzYE=;
        b=qy+EGNOdGdSYEFvbwvWdsxXWIqnZBFy2w3Ftle2dg5IUxoJNRfVBRncm+MjqlbRF0g
         1rzxAA4Rr2IJyisvvb3Ob9cqZ7tZjO8Jat4aXZH5qKymfLwlHGsFyBEwOobmz0Z34Yx7
         MUF50MTOlVNFd9VePrn2xhRRZKe8g3mFLX8as6v1HOPrdnYsopoG5MHr6cY9UaUncB28
         IWfgih9HEot5YMQwQZT+QzOSq6I/37Vtrtm4Ma8RRHpUVfdLCWwPl7+mdDbAxdUWhGv2
         NlPCecBzxz7mZ6Lm+xWMOYhyu8y93BvFUuSa117zRNs82hv0syxkuin14KYUWNcrPyXW
         6Qbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=47lftltXR4j2SPa7sZ3evEMWWzVmCGPcS3QIZa0yzYE=;
        b=Ykegu6AqgkkrHRA+cPE1IZt5gEmLWxlq7lBjxiOPi976ItFXCga0Dt1CUUbzuhO4XV
         Qpt1zT33GIjiRzNr1bK9xrT9JoYCZLfbpShLhuh/SpKUtUb1aKI0TR00JDTHPWJz7md2
         ousG5mtM1wVt6xaZVIEER6FmPMVuuojkv8LPPNqvSTg9eeVc7f71ddiCCNyedQgUNrdN
         Ltb0DYUfJlHcrqEEHCTk30bTnHRL2ojQEJvdzTLHZuVYZI6GHl4Qnjie6FNTKMws8/lp
         C87+Zmc0Ab7LPIC6jMBBd87LiMm9LxD7iBBDquv3wuiRWd+tA4zhqJBWXQpj2TBey3h6
         wc3w==
X-Gm-Message-State: AOAM533jkDeIVBZheUDt8o5bO35zVzPsmRvGnnL5M/pctDUWE+X0tsD6
	hbzOoBRxCejC+mqU13jj2oAyAmUVCwdVuw==
X-Google-Smtp-Source: ABdhPJxb8TSVacm4cOKJK3TSl8f/F85ys0VNySiu0HQkuPWYBXGZunF04vhNiWi0u989yYd2VYjC8A==
X-Received: by 2002:a05:620a:10a3:: with SMTP id h3mr4867045qkk.459.1606229383985;
        Tue, 24 Nov 2020 06:49:43 -0800 (PST)
Return-Path: <levraiphilippeblain@gmail.com>
Received: from [192.168.1.127] ([192.222.216.4])
        by smtp.gmail.com with ESMTPSA id h65sm12618345qkd.95.2020.11.24.06.49.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2020 06:49:42 -0800 (PST)
Subject: Re: [BUG] b4 can't grap thread with already-percent-encoded slash
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: tools@linux.kernel.org
References: <2ce40a78-4291-c01c-f468-8b7f3be2f379@gmail.com>
 <20201124144542.arws25irjgylbrqa@chatter.i7.local>
From: Philippe Blain <levraiphilippeblain@gmail.com>
Message-ID: <8a1500fe-7c1a-2904-7723-8e638f524c03@gmail.com>
Date: Tue, 24 Nov 2020 09:49:41 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201124144542.arws25irjgylbrqa@chatter.i7.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Konstantin,

On 20-11-24 09 h 45, Konstantin Ryabitsev wrote:
> On Tue, Nov 24, 2020 at 09:37:54AM -0500, Philippe Blain wrote:
>> Hello,
>>
>> I tried to use b4 to import this thread:
>> https://lore.kernel.org/git/X7y+cZ3MPqqmGXx%2F@coredump.intra.peff.net/T/#t
>>
>> using that exact URL:
>>
>> b4 mbox -o- https://lore.kernel.org/git/X7y+cZ3MPqqmGXx%2F@coredump.intra.peff.net/T/#t
>>
>> It does not work - I get a 404. I think it's partly 
>> due to the already-percent-encoded slash (just before the @).
>> I tried a few things, like manually changing the '%2F' to '/', 
>> removing the '/T/#t' suffix, adding '-p git' to disambiguate,
>> but to no avail. I always get either a 404 or "That message-id is not 
>> known."
> 
> Yes, I kept meaning to fix that -- thanks for the reminder. The latest 
> master/stable-0.5.y have a fix for that.

Not sure if you mean that it should be fixed in master... I installed b4 using

pip3 install --user --upgrade git+https://git.kernel.org/pub/scm/utils/b4/b4.git#egg=b4

so I'm at version 0.6.0-dev. Is it supposed to 
work ?

Thanks for the quick answer,

Philippe.

