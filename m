Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4083845E
	for <tools@linux.kernel.org>; Thu, 22 Sep 2022 14:46:59 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id ay36so6968703wmb.0
        for <tools@linux.kernel.org>; Thu, 22 Sep 2022 07:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date;
        bh=SqDhNDNAwxarpM/eIJvgafxt156gNaSuu7kCq8cU6zk=;
        b=v8yyj/TJrD82K6xl5QwDjyrbCZQbF4hGmjyLWoVLZisWsDSxrbhPimY+zOc0w4jsf3
         ROwT9AheEGGA2En7xgk3UuAjltjCwpxcevntg6s9erri0oF4LyQbNiwL89CSnQVeir4z
         1yDWkjg/cPtDGfnczq1odr8nCRFvIYzomhpYCB3+66jTCy20BLk3sYcgkdR32Tc1xVKa
         3qOCngf+GS5A3btxuA9T8VH+9eMcZEgSAB5WOnmH9pT6YW1mS3dXpD4BYC5tAQ4CIEoa
         A6y84QvG0QsPMrBHhxwGFEb8BY4x27wG/FDtvOtB5ITGUnHUu6hLqqQTJY6LX0mcx0u3
         F4vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date;
        bh=SqDhNDNAwxarpM/eIJvgafxt156gNaSuu7kCq8cU6zk=;
        b=AS5FHf61zx2yj4opRzHrINluP3pUZxKeRVBVjnfeeTyCtagVb8Dtu9g26YtTUiseST
         xw8XKbbtW6Eyv8y0UeUPswpErSQK/PVIDahDUJdlMDRj+GumF0NxsI9lKNzw7fcKJ0h5
         tHliLetHvQ2Px368Hq7rlYPB/jHmEj55wpbQp+xGa08emzjgTfv6C9n91s7NeO2K6M9h
         RUY24z7JY0p48e+8zU7okqlASltLS6aKFZU0H3IrNWtDgoTZuNhQX4iWVm2EsphscHAK
         LbX4OlpWnPlbir7qWDCFLB2swpwvJlqoteNaNkSRaKDAwnqoBdG/k4xhNMqIm6l5US29
         utrA==
X-Gm-Message-State: ACrzQf2GICAsKLw83YVlR3tpEXiaIeobkb0iZxOAeR9nDRK5ddBgBP7K
	yKAmGrcUOfSbTx2zYiHoJJxVsQ==
X-Google-Smtp-Source: AMsMyM7GKE81z/e4JTafzZDvxQT4VLtRZSZMFZ9kk0dWswPRMp+dLV3mxyy4UekPecydUn6OokTR2w==
X-Received: by 2002:a05:600c:34c2:b0:3b4:76f2:9c3b with SMTP id d2-20020a05600c34c200b003b476f29c3bmr9397490wmq.179.1663858017461;
        Thu, 22 Sep 2022 07:46:57 -0700 (PDT)
Received: from localhost ([82.66.159.240])
        by smtp.gmail.com with ESMTPSA id r8-20020a05600c35c800b003b48dac344esm6527462wmq.43.2022.09.22.07.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 07:46:56 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, Guillaume Ranquet
 <granquet@baylibre.com>
Cc: tools@linux.kernel.org
Subject: Re: b4 send: missing diffstat in individual patches
In-Reply-To: <20220922142216.vpetai65om2bvv4l@meerkat.local>
References: <CABnWg9uBOGqJMq=yCtn7SoEME=+2u1-ZK9ftb6=_jRhkhL_jiw@mail.gmail.com>
 <20220922132910.gz66mwjcdd7ljd6j@meerkat.local>
 <20220922142216.vpetai65om2bvv4l@meerkat.local>
Date: Thu, 22 Sep 2022 16:46:56 +0200
Message-ID: <87mtarfov3.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi Konstantin,

On Thu, Sep 22, 2022 at 10:22, Konstantin Ryabitsev <konstantin@linuxfoundation.org> wrote:

> On Thu, Sep 22, 2022 at 09:29:10AM -0400, Konstantin Ryabitsev wrote:
>> > The serie was sent with 0.10.0-dev (master from some weeks ago).
>> > I've just retried a dry-run with the latest and the diffstat is still missing.
>> > 
>> > I haven't seen any option in b4 send to produce the individual commit
>> > diffstat, I will have
>> > a quick look if I can propose a patch.
>> 
>> I'll try to put that in today.
>
> This was an easy fix, so it's in master. I'll backport it into 0.10.y stable
> later today.

Thank you for all the work you've put in the "contributor" side of b4.
Your responsive replies and fixes are really appreciated, and so
is the new documentation.

Cheers!
Mattijs

>
> -K
