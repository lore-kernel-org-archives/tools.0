Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD323FCD;
	Thu,  2 Sep 2021 19:13:02 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id h133so3893322oib.7;
        Thu, 02 Sep 2021 12:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+dr6IxXY24ovJmdX+Cd2dyTLXm8UGWJV5CXaBBygFWY=;
        b=I9Ug2ST5h5eT4KVbBl3ELXZ7zsOwZVDiWwNlU+jSGHvkCoqsSM5Z+3DI9UhEc4v4nG
         Q9GXDxWsSMpvVVG6TPCaGqj4k74KUmSwoQH5U1+c6wFMg1g+kqm3zfVctei5QXhIFDJf
         jr4r15srOhNttxoS6s6tOg2Y7Nv52nTKbUIK1dYk14IgJ5y+T84+tuV4GQsW3aUKIDMB
         X99LHBkj4KcaAYxXW1Ag2MK/uAfb5rgLzG0JghDsPCwVDjikHFgg1ET6/CtlqpwCyoqY
         oUAdPFjXqN10QA5wm5OyiO20qJeF7XaLOnDGUgWjcaR7gYuKpRgJgxcz9mOzfPi72Q64
         YSsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+dr6IxXY24ovJmdX+Cd2dyTLXm8UGWJV5CXaBBygFWY=;
        b=jMGgkjqqaooWE8LBsWJazYvbP2SmcAJlcO1uR9Pwvlhps7Q3RXmCnR4SLcJMiZS7WL
         fvVx5ddD4FCBiXZu4GVIMoz5BCogAcDqejFgoaPLkrUjucyrbIFhOB5AW3moSm76fxsH
         DhDpiwu2m8m5FyPvSgWmhwuk1Jbyg9devZNvfXOfFTYs56hk8f1U3sLjTFDw8vHaR5sP
         QWUsgoDs8csM051yJODNTX2z5KSx5ydEa2XTyIitwkYEm4Eupp1PWtHsz1UmPillwNei
         Hp2Uwi2jn9KhFlGMqZW3+VwGZXXczqCAf3zKyu6BgprojBtoMRcTl3J7PxpTdCpBuXgW
         LTOQ==
X-Gm-Message-State: AOAM533M3kV4eExcc6iYjSwiFIq6akJ4a++NFfEYJ+PNs9mvapmyDxJn
	8sw4KXEslVcmeItqg1cr1ysexFD3i7k=
X-Google-Smtp-Source: ABdhPJzq0IsQTZpIJpXj4yONCD6svdI8bu3Gv+7yq89Fa2lGsfalHI9nn7uUbVMiJfQSUFl+s8Eh3w==
X-Received: by 2002:a05:6808:2026:: with SMTP id q38mr3412279oiw.15.1630609981639;
        Thu, 02 Sep 2021 12:13:01 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s24sm546468oic.34.2021.09.02.12.12.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Sep 2021 12:13:00 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: lore.kernel.org upgrade: Sep 1, 2021
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
References: <20210830164626.tq5emfrht4o46x33@nitro.local>
 <20210902184543.GA1133629@roeck-us.net>
 <20210902185610.aejfdhjl52l2ivpb@meerkat.local>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <1610f7fd-70fd-a8a5-2d7c-a5f542198cb7@roeck-us.net>
Date: Thu, 2 Sep 2021 12:12:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20210902185610.aejfdhjl52l2ivpb@meerkat.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 9/2/21 11:56 AM, Konstantin Ryabitsev wrote:
> On Thu, Sep 02, 2021 at 11:45:43AM -0700, Guenter Roeck wrote:
>>> My tests of the new lore.kernel.org service (currently running on
>>> x-lore.kernel.org) are looking good, so I will be putting that into production
>>> on Wednesday, September 1, 2021.
>>>
>>
>> It appears that lore.kernel.org/patchwork is gone. Is that on purpose,
>> and/or is there a new link ?
> 
> It's gone forever, see this PSA, which was also sent to this list.
> https://lore.kernel.org/all/20210820171633.43xhblvzuk4swxln@nitro.local/
> 

Yes, I noticed later. Sorry for the noise.

Thanks,
Guenter
