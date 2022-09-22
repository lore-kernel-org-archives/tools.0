Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F068B1B;
	Thu, 22 Sep 2022 21:43:02 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id d11so2626056pll.8;
        Thu, 22 Sep 2022 14:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date;
        bh=9v6WybS0Crfa+ik4fdXepaAOXmKiF+c2u04+aA53ye4=;
        b=SwcLyBAQYK+2nXZ7+YcTxDHlA7Xal9nuDUVkmTr7jNExh6juvPHl6L0ikIHEhCNcSv
         EKFw4jbUBa9RYYmXtM6FF97h7HeOMxJU9odBHPSKOxZDOrUpyF/SsMQsnKXDgw7p0nfC
         vPyTHGVqezM8xeDVBK6MJCi/HXQY9iayugq6AHh0LLOiB4WrdqSqqE8EZKobce14aU4e
         dLuywlznuRJMlLQWSfWjRXZraQquLBEVMCRjIJvwKHmz0W6Bhq7XvKAlx2Hw6AH0VA9t
         IBhfTW411iBItHrSARagQ6kVChLXUHKJO07KlB1Nh+lUI7V0FzaPN+WRi6PzJFEkiGuY
         Iu3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date;
        bh=9v6WybS0Crfa+ik4fdXepaAOXmKiF+c2u04+aA53ye4=;
        b=YFITVdAwx2sSKRbCp+uigyDNR3j8rzQlo1nNtZHkxq9W/ZMRSX8Zkdp3UFAX5tiKvJ
         23iNrJ1RQNgeddwzAm/2qppi08lvWp4KIF1596ct8tiUuhIFD2tSYWUn82a6R8DI/Oko
         f4wi8TS+hKYOTg8zZzwK46p4oPba24VexQCNs8yWT0+hbk6D6eBgWogM2vpOdx8OhUyH
         Hjvwo4ZaJkE/C2EZ4Qw1pIga3dTOkUdvCLEodjcvVM9jxKQ4AFIaXpodgff0QpdV0QPd
         ApAwO8U29BvN30KrETnic5lbC0ZjyE2P5FxPBNqNmbeqsoYUq5OfVn9RNBfKdpyXU617
         8e8A==
X-Gm-Message-State: ACrzQf0wvt86nlsNeriXNWqaCUsrkcGPguBP6vXlZKNRBSFBqbhHfFyP
	aeLhZJfZssg7ga0sPAfij2U=
X-Google-Smtp-Source: AMsMyM5iHzchpw/a8uc8/yE6qrxDVFXH79vH2FeLN7g5WyT5Cq1gQj/krByMLT3tsQxh+YS7kaVJZw==
X-Received: by 2002:a17:90b:3d91:b0:202:dc14:16c0 with SMTP id pq17-20020a17090b3d9100b00202dc1416c0mr18007562pjb.44.1663882982064;
        Thu, 22 Sep 2022 14:43:02 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:c558:d894:7bf:3842])
        by smtp.gmail.com with ESMTPSA id x18-20020a634852000000b004388f33b80esm4342411pgk.2.2022.09.22.14.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 14:43:01 -0700 (PDT)
Date: Thu, 22 Sep 2022 14:42:59 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: "b4 trailers -u" chops off patch subjects
Message-ID: <YyzW46WQ47HUKTSx@google.com>
References: <YyzWI/zCGli+3UcQ@google.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YyzWI/zCGli+3UcQ@google.com>

[CC-ing mailing lists...]

On Thu, Sep 22, 2022 at 02:39:47PM -0700, Dmitry Torokhov wrote:
> Hi Konstantin,
> 
> It looks like "b4 trailers -u" removes patch subjects from commits,
> leaving only body:
> 
> dtor@dtor-ws:~/kernel/linux-next (get_gpiod_from_child-remove)$ git log --oneline -5
> a31ab9768271 (HEAD -> get_gpiod_from_child-remove) gpiolib: remove devm_fwnode_get_[index_]gpiod_from_child()
> 359e79d23882 leds: lgm-sso: switch to using devm_fwnode_gpiod_get()
> 991ff1b001c0 leds: gpio: switch to using devm_fwnode_gpiod_get()
> 7820e4c4f360 Get rid of devm_fwnode_get_[index_]gpiod_from_child()
> 483fed3b5dc8 (tag: next-20220921, origin/master, origin/HEAD) Add linux-next specific files for 20220921
> dtor@dtor-ws:~/kernel/linux-next (get_gpiod_from_child-remove)$ b4 trailers -u
> Calculating patch-ids from 2 commits
> Checking change-id "20220902-get_gpiod_from_child-remove-a62638849e91"
> Grabbing search results from lore.kernel.org
> ---
>   leds: gpio: switch to using devm_fwnode_gpiod_get()
>     + Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com> (✓ DKIM/gmail.com)
>     + Reviewed-by: Linus Walleij <linus.walleij@linaro.org> (✓ DKIM/linaro.org)
>   leds: lgm-sso: switch to using devm_fwnode_gpiod_get()
>     + Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com> (✓ DKIM/gmail.com)
>     + Reviewed-by: Linus Walleij <linus.walleij@linaro.org> (✓ DKIM/linaro.org)
>   gpiolib: remove devm_fwnode_get_[index_]gpiod_from_child()
>     + Acked-by: Bartosz Golaszewski <brgl@bgdev.pl> (✓ DKIM/bgdev-pl.20210112.gappssmtp.com)
>     + Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com> (✓ DKIM/gmail.com)
>     + Reviewed-by: Linus Walleij <linus.walleij@linaro.org> (✓ DKIM/linaro.org)
> ---
> Invoking git-filter-repo to update trailers.
> New history written in 0.12 seconds...
> Completely finished after 0.52 seconds.
> Trailers updated.
> dtor@dtor-ws:~/kernel/linux-next (get_gpiod_from_child-remove)$ git log --oneline -5
> fcd562595314 (HEAD -> get_gpiod_from_child-remove) Now that there are no more users of these APIs in the kernel we can remove them.
> 34557baea2d5 devm_fwnode_get_gpiod_from_child() is going away as the name is too unwieldy, let's switch to using the new devm_fwnode_gpiod_get().
> 443abc336e8d devm_fwnode_get_gpiod_from_child() is going away as the name is too unwieldy, let's switch to using the new devm_fwnode_gpiod_get().
> 7820e4c4f360 Get rid of devm_fwnode_get_[index_]gpiod_from_child()
> 483fed3b5dc8 (tag: next-20220921, origin/master, origin/HEAD) Add linux-next specific files for 20220921
> dtor@dtor-ws:~/kernel/linux-next (get_gpiod_from_child-remove)$
> 
> Please see how patches changed after running b4. This is with ToT checkout:
> 
> 6c215d8 ez: don't send a cover letter for a 1-patch series
> 
> Thanks!
> 

-- 
Dmitry
