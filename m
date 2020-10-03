Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web12.1772.1601752506019516016
 for <tools@linux.kernel.org>;
 Sat, 03 Oct 2020 12:15:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BSsJMiNo;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.222.193, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-qk1-f193.google.com with SMTP id s7so1256315qkh.11
        for <tools@linux.kernel.org>; Sat, 03 Oct 2020 12:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=XDd6ahIT6gLYMAruH7ju3Kkp37FW6zZiiBzXKCROhVM=;
        b=BSsJMiNovC7ylJtGVK8Pu6lbRNONMCIf6IKbC00u5s1boHBtCnTHfJa/Q5VQbBE7QD
         V4bS1NjUh5BbbOIsGpNZvopY7M6czs5rDiFGIqVWOTcL/cuAcI2C4+QBDfXFlYfMA/pD
         daW0tThIPF0WuvSn4othGKNjDJ5j6h9bkvbes=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=XDd6ahIT6gLYMAruH7ju3Kkp37FW6zZiiBzXKCROhVM=;
        b=cMDIgseFkILxEkDq9q92MLM4R5xAOpubwY1vCLU7s5uTVJ/6noT1ijYG2629AN9nN+
         Isvs4NaAOuts4uyxS6P3toP8syDemRP2Ple43aeTmgGidO+hskO7XmKEznEi6BP5Mh2W
         Mc4vVlXKbGetdk9U0BAbd+LeRnZiNRhw6wEdWQE1I96KA8VoXaGL7O9cB4oMDsZHfI+O
         Yy/BCBtW2UmrjEiIqfMZBtbrcbiA4Tem/bxbQrDQycshmXalVdQAm2qf1nCTmJm9QaW7
         VPba2MQZBZJdJ9KxLKnWEQb2tNy6Yn0Src407RmeIcNkXbu4ougCCipqC9u2B1cdVJl1
         Mb+w==
X-Gm-Message-State: AOAM532ONENHpit442UOc7YJCmlSOsIHQp701Zsi6xaDWCUK7buhlmG5
	9g/XWRBDtJnf1oHgrY3lZaAeZQ==
X-Google-Smtp-Source: ABdhPJyMY8qIL4KEm7vcRUWiReW42vytsh13A1Usl//XvmLKcZ1mWKVKCTveyFrYEAH8SB+YYGag4g==
X-Received: by 2002:a37:7844:: with SMTP id t65mr7450404qkc.136.1601752505009;
        Sat, 03 Oct 2020 12:15:05 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id k22sm3882799qkk.13.2020.10.03.12.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2020 12:15:04 -0700 (PDT)
Date: Sat, 3 Oct 2020 15:15:01 -0400
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: Joe Perches <joe@perches.com>
Cc: Mark Brown <broonie@kernel.org>, tools@linux.kernel.org,
	linux-iio@vger.kernel.org, Julia Lawall <Julia.Lawall@inria.fr>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-crypto@vger.kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jerome Brunet <jbrunet@baylibre.com>, linux-acpi@vger.kernel.org,
	David Lechner <david@lechnology.com>,
	Valdis =?utf-8?Q?Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>,
	kernel-janitors@vger.kernel.org, drbd-dev@lists.linbit.com,
	openipmi-developer@lists.sourceforge.net,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-ide@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-wireless@vger.kernel.org,
	Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 00/18] use semicolons rather than commas to separate statements
Message-ID: <20201003191501.o56tqq63d2buq5ox@chatter.i7.local>
Mail-Followup-To: Joe Perches <joe@perches.com>,
	Mark Brown <broonie@kernel.org>, tools@linux.kernel.org,
	linux-iio@vger.kernel.org, Julia Lawall <Julia.Lawall@inria.fr>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-crypto@vger.kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jerome Brunet <jbrunet@baylibre.com>, linux-acpi@vger.kernel.org,
	David Lechner <david@lechnology.com>,
	Valdis =?utf-8?Q?Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>,
	kernel-janitors@vger.kernel.org, drbd-dev@lists.linbit.com,
	openipmi-developer@lists.sourceforge.net,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-ide@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-wireless@vger.kernel.org,
	Neil Armstrong <narmstrong@baylibre.com>
References: <1601233948-11629-1-git-send-email-Julia.Lawall@inria.fr>
 <160132172369.55460.9237357219623604216.b4-ty@kernel.org>
 <b1174f9be2ce65f6b5ebefcba0b48e792926abbc.camel@perches.com>
 <20200929113745.GB4799@sirena.org.uk>
 <db26d49401dc0bd6b9013a603a155f9827f404a4.camel@perches.com>
 <20201001110150.GA6715@sirena.org.uk>
 <f44d19ad596f261c0287c9ab18c45161003efb43.camel@perches.com>
MIME-Version: 1.0
In-Reply-To: <f44d19ad596f261c0287c9ab18c45161003efb43.camel@perches.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sat, Oct 03, 2020 at 11:40:48AM -0700, Joe Perches wrote:
> (Adding tools and Konstantin Ryabitsev)
> 
> There seems to be some mismatch between b4's use of the
> cover letter to a patch series and what maintainers that
> apply a subset of the patches in the patch series.
> 
> The merge description shows the entire patch series as
> applied, but the actual merge is only a subset of the
> series.
> 
> Can this be improved in b4?

So, the following logic should be applied:

- if the entire series was applied, reply to 0/n
- if a subset only is applied, reply to each n/n of the patch that was 
  cherry-picked out of the series

Is that an accurate summary?

-K
