Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web08.9485.1610031975940685348
 for <tools@linux.kernel.org>;
 Thu, 07 Jan 2021 07:06:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=C/Rj399F;
 spf=pass (domain: gmail.com, ip: 209.85.222.171, mailfrom: levraiphilippeblain@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id 186so5664828qkj.3
        for <tools@linux.kernel.org>; Thu, 07 Jan 2021 07:06:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=TTcnh36zrAxGsmFEcFVYQ7UHkOrRkcD/Bkg91tEkQ6w=;
        b=C/Rj399FOgXiyvdRAh67hEJZq+Tf+qNlJ1hn5Zlr30wNxwXXvo6KenADunerpDxqmr
         yUr5Gdv9wYM+526n8tbC6gXYje9GOWT2gieNi7dwW0v8ED0z9aCSMIQ6oLIvFnDOoTJY
         1jKlfZ8l8/BDx2lUoOT6EZ54gq7a/i7BlxGExnXYZNc2UWLS0Qy5UfyaWKEOebwTWKQE
         Un7rN2TwBP8F5PfZOup5PGFvHQwdfS03bd2amAPV84jVX0/M3+tmolsWKBP+jbaomQ1i
         f2+PvEdr2D2A8I6dIlgWcHqOQPgzwWhxnmmmopjVr9Ngy0/gH0nEAEQDgVTcv0aGrwSB
         sGcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=TTcnh36zrAxGsmFEcFVYQ7UHkOrRkcD/Bkg91tEkQ6w=;
        b=gfyLhdGcg4BzmPPnO7nhLyuLxS2ad+tzgE+y/fJ29dJwhE25ZabJH/XC0opE6ZRlcs
         +hC8l+QlFmK3q0sKOBKCJJKy7+HNcTJrTIXxY/51Z6X7rL6d1tSuNOMOZ1DfNShJGXXY
         k266ZBq4QGQXUZvbCfWz+J888Tuwe6ESAbuqQQvJif1heFeJqLwRHe7M29JHmc5Y8/za
         pl9rPiJ8/dUC7MN66oGOEyXlFFX3/bp6lPwe8NNndeOwVvSb/ZGRQ/ZvQIzcGeWN0qL8
         v/yypektG/NaE4ZlABDN692PEMan9TEAVNkmD3TcmrmL5lRu46ut9R1m6zgyViRmVaQr
         6wJQ==
X-Gm-Message-State: AOAM531+UHHXAt4aL7cq3bB540u5+4l86wwi4Tce0aZgPnEQ33XdBZXl
	/Xhh53h0q7j1aLlE8xrnjFbCP2pgJPsTWXBt
X-Google-Smtp-Source: ABdhPJyrQhzIP7Xy0zSvrVkbEOJL/N7NrW0ct0UzPljSYDSVQgSesvqk7F5m6PbDlK+xRwvAqNBorg==
X-Received: by 2002:a37:a614:: with SMTP id p20mr9298153qke.359.1610031974815;
        Thu, 07 Jan 2021 07:06:14 -0800 (PST)
Return-Path: <levraiphilippeblain@gmail.com>
Received: from [192.168.1.127] ([192.222.216.4])
        by smtp.gmail.com with ESMTPSA id p10sm3110055qke.32.2021.01.07.07.06.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Jan 2021 07:06:14 -0800 (PST)
Subject: Re: [BUG b4] b4 can't import message with '$' in message-id
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
References: <1dd0249a-d3bd-dd43-f4f4-f59a6a096c7e@gmail.com>
 <20210107145723.ma47zcem3dihxaef@chatter.i7.local>
From: Philippe Blain <levraiphilippeblain@gmail.com>
Message-ID: <b7852bd5-f1d7-5687-9ee5-fdbf47504179@gmail.com>
Date: Thu, 7 Jan 2021 10:06:13 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210107145723.ma47zcem3dihxaef@chatter.i7.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit

Hi Konstantin,

Le 2021-01-07 à 09:57, Konstantin Ryabitsev a écrit :
> On Thu, Jan 07, 2021 at 09:20:07AM -0500, Philippe Blain wrote:
>> Hi Konstantin,
>>
>> It seems b4 0.6.2 can't import a message for which the message-id contains '$':
>>
>> $ b4 mbox -o- https://lore.kernel.org/git/002601d6e480$c193bd00$44bb3700$@nexbridge.com/
> 
> Your shell is the culprit here -- try putting the URL in quotes.
> 
> $ b4 mbox -o- 'https://lore.kernel.org/git/002601d6e480$c193bd00$44bb3700$@nexbridge.com/'
> 

Obviously... sorry for the noise!
