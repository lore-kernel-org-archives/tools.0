Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web11.57351.1600074789461024918
 for <tools@linux.kernel.org>;
 Mon, 14 Sep 2020 02:13:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20150623.gappssmtp.com header.s=20150623 header.b=umHiiOTA;
 spf=pass (domain: baylibre.com, ip: 209.85.128.67, mailfrom: narmstrong@baylibre.com)
Received: by mail-wm1-f67.google.com with SMTP id w2so9876192wmi.1
        for <tools@linux.kernel.org>; Mon, 14 Sep 2020 02:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:autocrypt:organization:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JOxVanrduNlWPfYqkYX5ixgsqH/odls+ZZAIJmVqiQA=;
        b=umHiiOTA/kefs/QfQVBPe/VkUJ6bKvSsZNV8w+Xh3GM0UBsOam0guqeZXG3/ZP/3Po
         p9exML8PECl3/omkX5iH4Qxj9dk70/qWpYoo1zwMnJU60ZP4LP+37QS+Jm7DFcYNAHny
         b0JBKtgYsdor5Gpi7+UbiiWegKuSp1lvH5sTjCkGWuMnL5UZyG9MO1cNC6bsBAH3KDAO
         lt6IW5ih1n/ngFhhLi/XidyfRR+6yT3+QNA4xn9Dvm9zGDX84Jf0QICv8zX8eyHV0A1O
         PKmbtvYOHz/Py6QP7rMJBk5K632e/3C42lvb4+gxbN2WwGnXWmR1UuXnWhHRlGtqpcuW
         Ii0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :organization:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=JOxVanrduNlWPfYqkYX5ixgsqH/odls+ZZAIJmVqiQA=;
        b=VJZGCO4fGYLwN8jMyCBSeXIJMCLfxoE6d5DigaO05Pi8cW8ThstbiTDZwqNfLDDGJc
         ZotLoAILF8o5v3tQwNuLukkv2YZCGDrMGErDL5RozfW49mrcM9tP5o7ApErUZK5nV41c
         Mz1r5BP2X7DJtheKP6rHV5LG+dfA+gd+6KdcEaj0xf2B4W7JbvWtfH0I86+6AiuEaO60
         67qFzCnkC7ptChgWoH9umGQT08Ur7X5eIdcNwfAXxCfh8PQ4T/NySarMEUyYzwFmma8h
         qIM5HhYuxYPklW7FZeC5mkNjBC95tlEYGFaRLdi0Hl/QxhQ3KuoQb6EuOiIZhqoiwt3/
         Wi1g==
X-Gm-Message-State: AOAM5303GxKLTC7cFoUtcIwSfY4IWTmd+u5/MYWZAz+ypqTAuko57f8x
	kc0TdMtuaVZf7vNqIIfTbIWARJVmsl3UhUIA
X-Google-Smtp-Source: ABdhPJxMDRqrrABb00Duv3Sc42qSO4WcRP7hEpIm2m7kz9ymncUg+4TBgwhFMsnSKtnhD6Im/oEdJg==
X-Received: by 2002:a7b:c751:: with SMTP id w17mr13705639wmk.97.1600074787316;
        Mon, 14 Sep 2020 02:13:07 -0700 (PDT)
Return-Path: <narmstrong@baylibre.com>
Received: from [10.1.2.12] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id b8sm18575203wmh.48.2020.09.14.02.13.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2020 02:13:06 -0700 (PDT)
Subject: Re: Trying to figure out why your attestation is failing
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
References: <20200908175843.6urcfbntaa324ncz@chatter.i7.local>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <81152bc9-ea3d-eb9b-cb6a-dbe009243113@baylibre.com>
Date: Mon, 14 Sep 2020 11:13:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200908175843.6urcfbntaa324ncz@chatter.i7.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

On 08/09/2020 19:58, Konstantin Ryabitsev wrote:
> Neil:
> 
> I am keeping an eye on attestation emails sent to the signatures list 
> (https://lore.kernel.org/signatures/) and I noticed that b4 isn't 
> properly finding your attestation data. I poked at this series:
> 
> - thread: https://lore.kernel.org/linux-amlogic/20200907081825.1654-1-narmstrong@baylibre.com
> - attestation: https://lore.kernel.org/signatures/159946699508.19944.11132773619713429568@kernel.org
> 
> When we generate attestation hashes from the patches you submitted, we 
> get a different value for the "i" hash:
> 
> $ git mailinfo m p < 0001-dt-bindings-display-amlogic-meson-vpu-add-bindings-f.patch | egrep '^(Author|Email|Subject)' | sha256sum
> 7158b7d79fbd5342923a63ea14701fa75061a856f6eb30c9dfe83672894113ba -
> 
> Apparently, when you run it on your system during attestation generation 
> step, you get a different hash for i:
> 
> 3753d76c-4b385c46-aa69b83c:
>   i: 3753d76ca01efcc78b682dc0f9feb582d67a1e9a6a89b0519cdf54a36eee5e0b
>   m: 4b385c46651635915366eba13de55a445ae3d41afd2d0e5da8bad270a08c0e70
>   p: aa69b83c2b5d484b33deec0c59135fdfe7290b658f29527590261abab8a4ac51
> 
> This is why when we're trying to find your attestation document, we are 
> not finding it:
> 
>   Cache says looking up 7158b7d7-4b385c46-aa69b83c = 404
> 
> I am curious why this happens -- either the patches generated on your 
> system have different Author/Email/Subject values until git-send-email actually
> runs, or git mailinfo output has changed between revisions. I would like to
> understand this better so we can properly address it, if you're willing to lend
> a hand.

Indeed, I usually only add partial To/Cc directly in the patches and the patchset-wise
to git send-email, would it be the issue ?

Neil

> 
> Best,
> Konstantin
> 

