Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
 by mx.groups.io with SMTP id smtpd.web11.12316.1584741786498687739
 for <tools@linux.kernel.org>;
 Fri, 20 Mar 2020 15:03:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel-dk.20150623.gappssmtp.com header.s=20150623 header.b=M+IM4p7g;
 spf=pass (domain: kernel.dk, ip: 209.85.214.195, mailfrom: axboe@kernel.dk)
Received: by mail-pl1-f195.google.com with SMTP id g2so3082419plo.3
        for <tools@linux.kernel.org>; Fri, 20 Mar 2020 15:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ejBTLvMzkQga/uuMGg+oir/XkGonNDV5fUgbz3VRYpw=;
        b=M+IM4p7gQ0gEbY0M7mYJNUJ6c4AoHYungsUBJFSOl/2xyJoUZNctHA+I6qXfNvO4LA
         FpRp4+CvU8x9t287+VIjxe4yY2yXOCYpZvhUL0T3k0R/ubOTReyF9KjtH4F5XTO9AXIi
         9XaVJ3KGA7at72Yl/Lhc42Mn8uvxqDgDMqervzypxI8fEiJZTBFK2q4IuZ+608wDyXh7
         eM8sipSla5BpfSxHgaB8FbCYQ9z/lajQk8S6w4L1xpMAZ3hwMrXbJOgJk5kvIHWv0BBP
         K2vdZZzJdsgfOX/EpiDgNHzCdvqX1X6VPP0YKwGAz0oEeMBrjvvX0KSlJES6sv+3JC29
         JfPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ejBTLvMzkQga/uuMGg+oir/XkGonNDV5fUgbz3VRYpw=;
        b=OiEVjc4Rl+utLF5uOoYycYR+YkqZVEST9LnNrzMaJOjRohrIXyfCZMi/6BgrTiHD6s
         cigkX/P1+HS9eWZX8U4myD9QER8gjzlAFjMErWWhUIAicimtsNqPJC/LpLIyFiG6gp2L
         L1f1G+vG1ba4g3X1RNIGZFPAxceTGS/uZqvvfXrFLAvIc+zliH8JIkLwIQlK7lUDRGao
         UaEpN7DxYJBi/ueVwHjc3vX+UrjPPhIz1ia6uQF9ZbKJ1i/XtPnGx0x+JgEKOCxw/pd0
         7hhFNqS+V6sQjsoR4VSb4b+/aZxd6kfI3Y6/uJHrGV5pY+hHLTFPA71KvAn8Rn3PjyZ2
         nuYg==
X-Gm-Message-State: ANhLgQ1kb93HXquuZymdH8AEztvjVyL2nS7T3Wyve/6GygfOQsvXw86K
	a+UVH9tM4DtsXDfJb6PTAZvxa2ADoFJ26Q==
X-Google-Smtp-Source: ADFU+vsVlT99aKET8RXndu4iNvPPChvx4+mr9lLR2EyrD1pPfXNa0FzZNOEIzvDKuRxxlhcvWcK17Q==
X-Received: by 2002:a17:902:b591:: with SMTP id a17mr10578490pls.333.1584741785478;
        Fri, 20 Mar 2020 15:03:05 -0700 (PDT)
Return-Path: <axboe@kernel.dk>
Received: from [192.168.1.188] ([66.219.217.145])
        by smtp.gmail.com with ESMTPSA id v123sm6238485pfb.85.2020.03.20.15.03.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2020 15:03:04 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
X-Google-Original-From: Jens Axboe <axboe@kernel.org>
Subject: Re: [kernel.org users] B4 and gmail integration features
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 Johannes Berg <johannes@sipsolutions.net>
Cc: users@linux.kernel.org, tools@linux.kernel.org
References: <20200320214532.wvmym643l3dw24qh@chatter.i7.local>
 <516a16778778f90f7d2f7d5a7ef392118fc90f28.camel@sipsolutions.net>
 <20200320220138.axvbfnlmzaajvkwh@chatter.i7.local>
Message-ID: <fe7b2a6b-f883-a9cb-87d5-396c05df167f@kernel.org>
Date: Fri, 20 Mar 2020 16:03:03 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200320220138.axvbfnlmzaajvkwh@chatter.i7.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 3/20/20 4:01 PM, Konstantin Ryabitsev wrote:
> On Fri, Mar 20, 2020 at 10:49:13PM +0100, Johannes Berg wrote:
>> On Fri, 2020-03-20 at 17:45 -0400, Konstantin Ryabitsev wrote:
>>>
>>> 3. Optionally, also send a "thanks, applied" templated reply after you 
>>>    do "b4 am"
>>
>> I've always thought that somehow this ought to be delayed somehow, since
>> I may apply a patch just to look at it, or to run tests, etc. and then
>> really only make up my mind when I push it out ...
> 
> How about we just "remember to thank" and have a separate command "b4 
> thank" which will interactively verify patch/series before actually 
> sending out the "thanks, applied"?

Have the option to do it while applying as well, sometimes a series
has been carefully reviewed already and you are ready to apply.

-- 
Jens Axboe

