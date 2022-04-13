Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43E42F32
	for <tools@linux.kernel.org>; Wed, 13 Apr 2022 20:17:08 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id q20so1793497wmq.1
        for <tools@linux.kernel.org>; Wed, 13 Apr 2022 13:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod-ie.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=P0S0txA+bvD6ursvDLsKxC1sVtGo1B/XbiPVMUqw780=;
        b=0S50QDvM0DK/VuteQBDesqCu4kHoWH1WBN5omr+OIzQtP2ISFbYXrxFBpHJ5zoLk2I
         0bcp30yo4Lhl3bTaOuaYfZghNqoIN0nXXOXkHp/thpuDGjd7MBrOCJdVaym9x8Uj200V
         xXD1TCuVZ2DuopU4//HoKuWD5yFy1pf8T+3+oudd/KkZRwFc1KQSaEKrTLSgYl1MXf0N
         gOoDyQu/lY/ozV5+PxMF2YMeBTFCple017tL2lYadLnEJ89Mtp70fymmX9daggmTKxPG
         5DYAR6bzzjYPyQH8ln7Zs7BPoWv7GWoOk3v374VMfhArUf2p1WkGBYuIa6GWYHRYNaJr
         hTVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=P0S0txA+bvD6ursvDLsKxC1sVtGo1B/XbiPVMUqw780=;
        b=EwEWYEnFGungVIjKZI5XGc1Y3n1NfNCaIbH+MhUto3CFdesSLulSXH9lQV99QCoKra
         eQ4oqhnszV0vsUfMMdxNiFBN1EhlLIQ74jeu8HvqMaX+PYvSF3AGxr1N8puzS856MaEv
         gHOOjafJa/nT5yqQaSJod75hX1KEXrLAtVmTKMZCjulWDpA98QOk2qURj7n+/ndCFdJK
         vgUgh7ZREFXfOdsPMBA+JgN41J+FbGKyCs4eSj4XSMABn0jFb4/SsN+PYVsEP9DhJq+X
         lkTlPNSGeGR5r16nG9fuKEz7JKlvN51LurnDKwEmL/0E90x2mv6mi9Bpeva59JQLa1FZ
         Ep/w==
X-Gm-Message-State: AOAM532DrRkZ23WR2wwH15ZGoyBFRvSmQZA3PY9zsbALNkeqFf9GEKCl
	Tq2o3jTiEGj/rLEcCtM0O5PhvA==
X-Google-Smtp-Source: ABdhPJwBM32RFeXc27Idu8mJaqTaEf+4cqD7haikMoS43Cd9Ccmat16/vL/gfJXZJXWipM8xoBh7NQ==
X-Received: by 2002:a7b:c0d5:0:b0:38e:ca29:f40 with SMTP id s21-20020a7bc0d5000000b0038eca290f40mr320983wmh.205.1649881027033;
        Wed, 13 Apr 2022 13:17:07 -0700 (PDT)
Received: from [192.168.2.222] ([51.37.209.28])
        by smtp.gmail.com with ESMTPSA id az30-20020a05600c601e00b0038ebd950caesm3280972wmb.30.2022.04.13.13.17.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Apr 2022 13:17:06 -0700 (PDT)
Message-ID: <9185c463-2c33-9320-cdea-47e911d15a1c@conchuod.ie>
Date: Wed, 13 Apr 2022 21:17:05 +0100
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [b4] previously passing dkim check is failing
Content-Language: en-US
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: konstantin.ryabitsev@linux.dev, tools@linux.kernel.org
References: <cffe6d50-fa88-5873-a7cb-f646c57da91f@conchuod.ie>
 <20220413200706.gx6zssxozh7cn54c@meerkat.local>
From: Conor Dooley <mail@conchuod.ie>
In-Reply-To: <20220413200706.gx6zssxozh7cn54c@meerkat.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13/04/2022 21:07, Konstantin Ryabitsev wrote:
> On Wed, Apr 13, 2022 at 08:07:06PM +0100, Conor Dooley wrote:
>> I then upgraded my b4 to the latest master (0.9-dev-6f2aa), because
>> I am lazy & want to use shazaam. Between those commits, looks like
>> something has stopped b4 from selecting a passing url for my mail:
>>
>> b4 am e289c59c-96fe-38f0-8be3-7c1ba416817f@linaro.org
>> Looking up
>> https://lore.kernel.org/r/e289c59c-96fe-38f0-8be3-7c1ba416817f%40linaro.org
>> Grabbing thread from
>> lore.kernel.org/all/e289c59c-96fe-38f0-8be3-7c1ba416817f%40linaro.org/t.mbox.gz
>> Analyzing 22 messages in the thread
>> Checking attestation on all messages, may take a moment...
>> ---
>>   ✗ [PATCH v2 1/9] clk: microchip: mpfs: fix parents for FIC clocks
> 
> I think the thing that changed between b4-0.6 and the latest version was that
> we made DKIM failures show up as opposed to just hiding them (it was a very
> new feature on 0.6).
> 
> However, in this particular case the problem *is* legitimately with
> microchip.com's DKIM setup. If we look at the signature, we'll see that it
> uses c=simple/simple as the canonicalization format:
> 
> https://lore.kernel.org/all/20220411085916.941433-9-conor.dooley@microchip.com/raw
> 
> It's the worst possible setting for DKIM, for the reasons I mention here:
> 
> https://lore.kernel.org/lkml/20211214150032.nioelgvmase7yyus@meerkat.local/
> 
> In this case b4 is just legitimately telling you that DKIM signature is
> invalid (because vger doesn't do c=simple/simple).
> 
> I suggest you reach out to microchip.com mail administration folks and
> recommend that their DKIM signature setting is changed to c=relaxed/simple.
> 
> -K

Heh, I feared as much. I'll bring it up but I wont be counting my
chickens.. Checking some recent mail looks like you might have been
successful with Intel though, so maybe it'll work for me too.

Thanks!
Conor.
