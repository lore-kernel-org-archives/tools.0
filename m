Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com [209.85.219.68])
 by mx.groups.io with SMTP id smtpd.web12.67436.1597762890293475980
 for <tools@linux.kernel.org>;
 Tue, 18 Aug 2020 08:01:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@toxicpanda-com.20150623.gappssmtp.com header.s=20150623 header.b=U1AZM7aM;
 spf=none, err=permanent DNS error (domain: toxicpanda.com, ip: 209.85.219.68, mailfrom: josef@toxicpanda.com)
Received: by mail-qv1-f68.google.com with SMTP id b2so9656431qvp.9
        for <tools@linux.kernel.org>; Tue, 18 Aug 2020 08:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20150623.gappssmtp.com; s=20150623;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=atuD+wJ657mnps+WBc8H0jZBoupA7p/hCpbRyEIui84=;
        b=U1AZM7aMklSrLXABPlVbMMlvFPU2BUX6LuT+rTCP6FYDghfADS37+kcq1ZJWJHSx7t
         IZqxI/EHJ9uIMQs1SB+9vZvFoNhrcb7gOIKVFnTd3I75PPoEmRoMlgCY6e9tYeNJ2IMZ
         V8gf7mrHZ157kQSH/BQhillPTmKRrUyrHNcOJNNuLhbMn9tDzmEcCvu7mQgv18OhADxB
         TDo8soeSQwNktnh/vG/dDHf2A0+HzvTwYJrng0FINDgfAauhgbW+YqUY+blNwUv3DhGG
         9ZhpZ7GZlEieN+keNYxj7z1WJAQFADX7NVVnBczF8TRox2tL8UpOVI/+SYhx2iHa8kZ/
         DCQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=atuD+wJ657mnps+WBc8H0jZBoupA7p/hCpbRyEIui84=;
        b=GGKceni+MfK//lyPJHc1HC9poCirIi5hQtWTB90Iv5LjcJo/NbT+F+/PCytqRXfGxq
         cT5wmm4swE/IHUs6cVbou5ibyQW3RWCtZhLqJ9oUUxIwd8lOs0SioZvAdj2Ypp8yK3l/
         2tj3uUbHBDuAPK0vPJ2KyeRXY0srO3K4WfOIRSI5B6skqYYEOwwUW3TP7zEI+ekRJGqq
         AScwn12TPSnr5zurTCUMv3Aj6TbZA/8hW93DA2dIxC0WTzvLotvHlBviuEA0A/8EhvR0
         FWCmabPhPXHTP4ko5SGzcQPdldfEf9Y2P9erzWkhGRNyTXqR3YyHb43hwch15Qmh1dOV
         ZUnQ==
X-Gm-Message-State: AOAM5306Ts/VkTMFiwl8aRrVCbJGuX79P7VRx2AjvrYoleQa19jh0Sdd
	fvcDQHmsn8F5gPqkbirfD3whVJ7+j63gI+yg
X-Google-Smtp-Source: ABdhPJy/gbEzWYRjszgFa6/IYhJUJ5O+iXipXxiIfQryv2G5vdc+r5uff5JecKonFViaJeZPBf8uMQ==
X-Received: by 2002:a0c:fbd1:: with SMTP id n17mr19699980qvp.4.1597762889020;
        Tue, 18 Aug 2020 08:01:29 -0700 (PDT)
Return-Path: <josef@toxicpanda.com>
Received: from ?IPv6:2620:10d:c0a8:11d9::1055? ([2620:10d:c091:480::1:66f8])
        by smtp.gmail.com with ESMTPSA id o47sm24636566qtk.19.2020.08.18.08.01.28
        for <tools@linux.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2020 08:01:28 -0700 (PDT)
To: tools@linux.kernel.org
From: Josef Bacik <josef@toxicpanda.com>
Subject: Problem with b4 with v2's in the thread
Message-ID: <72f0dace-2283-b905-5ef3-ad623f34e79b@toxicpanda.com>
Date: Tue, 18 Aug 2020 11:01:23 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hello,

I have a thread here

https://lore.kernel.org/linux-btrfs/941273be-4250-3406-79e4-60ef762c5506@suse.com/T/#m64fdf99cfbdb8914a7f665a1d241f6643a8be389

That doesn't work right with b4 am, it's only pulling down

[PATCH v2] btrfs: Switch seed device to list api

Which is just v2 of the 5th patch in the series.  There's actually 2 v2's in 
this list to address the kbuild fixes, but it doesn't even pick up both v2's, 
just the last one.  I realize this is a weird case, but thought I'd report it 
anyway.  Thanks,

Josef
