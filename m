Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 774D31C10
	for <tools@linux.kernel.org>; Thu,  1 Dec 2022 13:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1669901685;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=00jxYf1q3fxGkE8vzDP/kmUB4+CIeLC98DKRmKHBSEw=;
	b=B9cdARlB9T2boVHkWkXBCHYHn3JQ6j0vaAOkBGaTy0xwIv49N0BUuC9z1YisMAiF6GX1YX
	b8RLy6umzFmpRd/Lg18li+1dOvjFnbTg4nkyRVwpbmcSMWnMpl1JFFiE6FNSSO+dd6hYqT
	o2+QxEVDDiGIOo8zzzAX4nb10yiDs3I=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-163-ZiXEMkh1OWuOyglyjEok-g-1; Thu, 01 Dec 2022 08:34:44 -0500
X-MC-Unique: ZiXEMkh1OWuOyglyjEok-g-1
Received: by mail-wm1-f69.google.com with SMTP id o5-20020a05600c510500b003cfca1a327fso847302wms.8
        for <tools@linux.kernel.org>; Thu, 01 Dec 2022 05:34:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=00jxYf1q3fxGkE8vzDP/kmUB4+CIeLC98DKRmKHBSEw=;
        b=V6d+wuodiNtJWHCM1MR/x6yib5nv8oOBDEL9qzp3s7mDKy8znkdSq7UVXXR/hFkwFD
         JtjKuVBS/kMpGYszQk5vmbANKQjwh6wWH63Xl0YhaWFDcXK6tAJk0oYsWDyJGIIiZOT7
         CA+Gh1HQN0r9nk1nzYu3KBdB/GLRTW1pvn57IIzxjoxZs71oLcJPdkVLpAszQ+QREoY2
         9XjabrZWUYzPeqHhgO8faCMIyVZg42R4EkdAIEJPH4ttbwCS1wyfMGEGY1+QOBn93rCf
         cOebf0Cb1j0Q89ShywEbDKavU/mrWVNEtWOadWUlivXvSqufAiMYEIRq9ggw2K65ohhE
         60Fg==
X-Gm-Message-State: ANoB5plItuSUvFYKAe/icIgD47InkqIF+TwGBmIrdwod3D780BcRJo/b
	A5F8F6fwAeC31yfwRhZJGsCiuWobs1Xiyxs4P5QJv4ie/5AT+EObZkIVy6YPiPC0Q4Z8vBXp36K
	Bu1sy0DTpX6BzwP4f
X-Received: by 2002:a7b:c4d8:0:b0:3cf:9bcd:5009 with SMTP id g24-20020a7bc4d8000000b003cf9bcd5009mr41039331wmk.196.1669901683019;
        Thu, 01 Dec 2022 05:34:43 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6a1UceeJ8fuUb2jb/nO/ppeJaHDF1cSo6k7XADI/2XvITfAPjrofctw68A+B8wCYDc36oeZg==
X-Received: by 2002:a7b:c4d8:0:b0:3cf:9bcd:5009 with SMTP id g24-20020a7bc4d8000000b003cf9bcd5009mr41039315wmk.196.1669901682750;
        Thu, 01 Dec 2022 05:34:42 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id v24-20020a05600c4d9800b003cfbe1da539sm5152014wmp.36.2022.12.01.05.34.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Dec 2022 05:34:42 -0800 (PST)
Message-ID: <e57deac6-5344-3f81-8ef5-55dd28b8c363@redhat.com>
Date: Thu, 1 Dec 2022 14:34:41 +0100
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 0/6] drm/gud: Use the shadow plane helper
To: Greg KH <gregkh@linuxfoundation.org>, =?UTF-8?Q?Noralf_Tr=c3=b8nnes?=
 <noralf@tronnes.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, tools@linux.kernel.org
References: <20221122-gud-shadow-plane-v2-0-435037990a83@tronnes.org>
 <Y4hB5odv9IGaq3Di@kroah.com>
 <1cb40762-5f0a-1739-1670-155f59ec7110@tronnes.org>
 <Y4iaODY6hMVNsfP1@kroah.com>
 <4e75582c-b3d6-fb0e-19b4-e4fd58c6bf55@tronnes.org>
 <Y4iqR94aGFa3NahQ@kroah.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <Y4iqR94aGFa3NahQ@kroah.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello Greg,

On 12/1/22 14:21, Greg KH wrote:

[...]

>>>> This patchset was sent using the b4 tool and I can't control this
>>>> aspect. Everyone mentioned in the patches gets the whole set.
>>>
>>> Fair enough, but watch out, bots will report this as being a problem as
>>> they can't always read through all patches in a series to notice this...
>>>
>>
>> Konstantin,
>>
>> Can you add a rule in b4 to exclude stable@vger.kernel.org
>> (stable@kernel.org as well?) from getting the whole patchset?
> 
> stable@kernel.org is a pipe to /dev/null so that's not needed to be
> messed with.
> 
> As for this needing special casing in b4, it's rare that you send out a
> patch series and only want 1 or 2 of them in stable, right?
>

Not really, it's very common for a patch-series to contain fixes (that could
go to stable if applicable) and change that are not suitable for stable. The
problem as Noralf mentioned is that the b4 tool doesn't seem to allow Cc'ing
individual patches to different recipients, and everyone get the whole set.

So either b4 needs to have this support, exclude stable@vger.kernel.org when
sending a set or stable@vger.kernel.org ignore patches without a Fixes: tag.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

