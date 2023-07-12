Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B603C14F91
	for <tools@linux.kernel.org>; Wed, 12 Jul 2023 18:47:44 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-767582c6c72so706285485a.2
        for <tools@linux.kernel.org>; Wed, 12 Jul 2023 11:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1689187663; x=1691779663;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=udurjRPM2oxV9GO89UYyqskdq10DRY3XjUVxbwHoflI=;
        b=AM8VuAhnk8Hbn842iayEnBEh03qHQkagjg904DKrp8suE6uwGhjHpZI+AFydEyXTJv
         CKq1ypL5x1rR709bT8MvgeNPGIp0bQA6lqK6k5/1pHUOrB/u9m5pC3jqnM4nmD7Odn2B
         E+Eg7Jhv+byYJbzTX7w0tKPp2y5zMNtK85Gwg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689187663; x=1691779663;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=udurjRPM2oxV9GO89UYyqskdq10DRY3XjUVxbwHoflI=;
        b=N4E3vYooN6ZYjFCye9Cda/BiM/B4UE7qifEtykiNZTgUU+XwQCt2gq8tjh2M3rXj82
         /b5ll5bBN8LgaiuMD2JT/4J+QpARkw9HqbaMNLrYtnZ6Dr5SZm9Z0OLbYduyIwO3yfbO
         C0HwBavEjfx5BS73i/NrgH8tV/xptMUhHfjP/NzAibpTGn/WDS/kL1PgEwfFfNSlcU5Z
         016Ofw21j6dydX98iTcxwxa8+P3jDl92fi3nwNm4tp5UulcigJ4y2LYYESa0WqkcY+7I
         Qkb0oH5t9HHRzK0mSgNX4gvwyQsgyg+E0J2xFUnM9lT4k3TLsmPT2xHNUerfGjH63kwt
         knXA==
X-Gm-Message-State: ABy/qLatBsFPrEApkjdxu/k2m6ZQEsNHnEzWsh/Y6wRDI4YFi0m2YxNK
	pbxaGdpTDC2LBGjIChLWf4J7i2Am/0bGDjIXghY=
X-Google-Smtp-Source: APBJJlHJItGUjoGbzmDGipG1nJ2tsMpkrlmmSCcZJGpkWOBL1yBMZcw0RYFDjSgqmyvJHj9RE6VD7A==
X-Received: by 2002:a05:620a:410:b0:766:f9b7:b90f with SMTP id 16-20020a05620a041000b00766f9b7b90fmr19086941qkp.5.1689187663447;
        Wed, 12 Jul 2023 11:47:43 -0700 (PDT)
Received: from meerkat.local ([209.226.106.132])
        by smtp.gmail.com with ESMTPSA id v2-20020a05620a122200b00767cdf23ee3sm2336994qkj.92.2023.07.12.11.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 11:47:43 -0700 (PDT)
Date: Wed, 12 Jul 2023 14:47:34 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	tools@linux.kernel.org
Subject: Re: [PATCH v2 0/4] ASoC: rt5677: Refactor GPIO and use
 device_get_match_data()
Message-ID: <20230712-overact-conjoined-74c85e@meerkat>
References: <20230630172155.83754-1-andriy.shevchenko@linux.intel.com>
 <168916242630.46574.7633971537485557226.b4-ty@kernel.org>
 <ZK6xI8l7Vdp35yJG@smile.fi.intel.com>
 <d5cac1ef-1d44-4ab7-a933-b381108b1eaa@sirena.org.uk>
 <ZK7HUTyKB6hoaBtV@smile.fi.intel.com>
 <20230712-semifinal-expansive-f9189b@meerkat>
 <9327ba4e-2df7-4eba-85c5-4da7bd64d2fa@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9327ba4e-2df7-4eba-85c5-4da7bd64d2fa@sirena.org.uk>

On Wed, Jul 12, 2023 at 07:35:45PM +0100, Mark Brown wrote:
> > Could you give me something more to go on? Was this done with "b4 shazam" or
> > via some other way?
> 
> The patches are applied from mailboxes fetched with b4 am, then the
> thanks mails go out with b4 ty.

But I think the complaint was about the merge commits being cut off:

    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/commit/?id=5a043fd5c74c66897ad113e5ee34e9361e3f4c11

When I try "b4 shazam -M", the merge commit looks different to me, so I want
to understand how the merge commit is generated in your workflow.

-K
