Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61915AD31
	for <tools@linux.kernel.org>; Mon,  5 Jun 2023 07:26:20 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-3f6a6b9c079so37060915e9.1
        for <tools@linux.kernel.org>; Mon, 05 Jun 2023 00:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1685949979; x=1688541979;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=PwF+G2hBpsn0W0ZH54atRfuPXQtfO1AVg9GeE9+t45A=;
        b=cmhGlOKwiaEGGuYL7XJ+0CM5IhpORE3kPnLfe5aR95VhSI1VuNWFSRC+LyIBKl/Mc9
         oTFk0XwBT5h4xiKh7voS+lJbOsqVYzA0MdHE6ZFa2RwgmA04srHzCJkVv8840TZ7S50B
         B4HyoFPdY1rKEFZzkSeiwPEK9BlEd/IsPqqY5ah79tDJgttwOofYE63sphNk06/N3K6e
         +6VUzfVHgkD0erSS880A+JBc1bYHEseAJel/Xe+KIyQ9BhEbROoqL/t4wcFIqya1RNCC
         8ygcDeGLtYU5KkO0x3XgtwSPNHj/sZaWj1PhdT4l2Vk10KUKCILGAy8A7nwjuLDJOx+M
         V+lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685949979; x=1688541979;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PwF+G2hBpsn0W0ZH54atRfuPXQtfO1AVg9GeE9+t45A=;
        b=OTUrVaCQmmpw3ky0sI6SbHkx4sujc9EfdyNJliHIHL+YPvEFoW7MPQyLmHRP7RdRTK
         ITH6FrWqvtEk+o19BdwPmi6/DPkfyCfolmIkaJ+uOeNATikPtUEi+tTZ0AEmna5Fr2pF
         NMSFe3FjtRj0NE4yPKgA5risz9u2iP8GQAKPRCTQi8p8cAkbUvEnd9aGiVJH9qdqvu7t
         BXb8+naG76qf9mIYE6fs2nIIlqmcABLTdq0u8Qf1H2VMLH/tskkdZOXOUMA5GeGsfEDE
         0fWiSOas9xog+kEGnjLQIgRNR53CExTvisj/CNp1zt+QXNypwVYdud9blUImYPmQUCnH
         SPQg==
X-Gm-Message-State: AC+VfDxSmtfadCcdv8tubvlo9Q23WP5b7VdOTDw/sVzg35ePTrIohP1H
	mL3c/nTFtppV8YLS8OfAYm/xEw==
X-Google-Smtp-Source: ACHHUZ74/dTL7mQ81haihPrYMqVes1s7RvJhLJuOpm3rqFi6n9PWWh7nMkNmmSeFpjFX98JV+kMb3w==
X-Received: by 2002:a7b:ca54:0:b0:3f4:ed25:8aa9 with SMTP id m20-20020a7bca54000000b003f4ed258aa9mr5889995wml.36.1685949979142;
        Mon, 05 Jun 2023 00:26:19 -0700 (PDT)
Received: from localhost ([2a01:cb19:85e6:1900:2bf7:7388:731d:c4e1])
        by smtp.gmail.com with ESMTPSA id m14-20020a7bcb8e000000b003f7ba52eeccsm2183901wmi.7.2023.06.05.00.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jun 2023 00:26:18 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Johannes Zink <j.zink@pengutronix.de>, Konstantin Ryabitsev
 <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org, kernel@pengutronix.de
Subject: Re: b4: Feature-Request: use salted hash for change-id instead of
 descriptive-name when using b4 prep
In-Reply-To: <43916f96-a00a-119b-7438-a875fdcd50f6@pengutronix.de>
References: <837ab11e-e6c7-0dc6-9377-7889910aea09@pengutronix.de>
 <20230602-speckled-modulator-ebdc37@meerkat>
 <43916f96-a00a-119b-7438-a875fdcd50f6@pengutronix.de>
Date: Mon, 05 Jun 2023 09:26:17 +0200
Message-ID: <87edmqjrom.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi Johannes,

On lun., juin 05, 2023 at 08:10, Johannes Zink <j.zink@pengutronix.de> wrote:

> Hi Konstantin,
>
> On 6/2/23 18:50, Konstantin Ryabitsev wrote:
>> On Fri, Jun 02, 2023 at 10:00:11AM +0200, Johannes Zink wrote:
>>> Hi,
>
>>>[snip]
>>> I would like to ask if there is a possibility to change this to using a
>>> salted hash instead (salt is probably required due to rainbow table attacks)
>>> for messageID and changeID. If this would break some workflows, it could
>>> possibly be added as an optional command line argument for b4 prep?
>> 
>> I will consider this request. For now, you can manually edit the cover letter
>> commit to change the JSON bit there that records the change-id.
>
> thanks, that will definitely help for now, though it would be great to have it 
> supported natively in b4 prep.
>
>> 
>> E.g. right after you create a new b4-tracked branch using "b4 prep -n", you
>> can run "git commit --amend --allow-empty" and modify the change-id to be
>> whatever you like. Note, that you should only do this before you send out any
>> revisions.
>> 
>
> is that equivalent to do b4 prep --edit-cover?

No, it is not. b4 prep --edit-cover does not show the
"--- b4-submit-tracking ---" section that Konstantin recommended you to
edit.

You can only edit that with "git commit --amend --allow-empty"


>
> Johannes
>
>> -K
>> 
>
> -- 
> Pengutronix e.K.                | Johannes Zink                  |
> Steuerwalder Str. 21            | https://www.pengutronix.de/    |
> 31137 Hildesheim, Germany       | Phone: +49-5121-206917-0       |
> Amtsgericht Hildesheim, HRA 2686| Fax:   +49-5121-206917-5555    |
