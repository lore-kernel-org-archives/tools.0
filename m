Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C892F32
	for <tools@linux.kernel.org>; Wed, 13 Apr 2022 20:07:09 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id e128so207388qkd.7
        for <tools@linux.kernel.org>; Wed, 13 Apr 2022 13:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=2jXYEFqHsuEfXGueVgYkw8zEEa5cT5CySTsRAkrZUZQ=;
        b=Neken3UStXM82l5Yk0lFrPA2Zq0HsM62ShipBs14v2oPTIBoNBQ7ldikGPImf3R2Uj
         j3tDUaw8tt7AFscD2VozhqZIdgkuaggbMJVNSG8BpceUyV5lGHVWwChE8PdQbsaSXrUW
         F8YknMfBy4eZsZOALlLx6CZXFKNoIXy3UijM0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=2jXYEFqHsuEfXGueVgYkw8zEEa5cT5CySTsRAkrZUZQ=;
        b=5HXeFoZHpewTwTAybNb5fTZ+0dOm5L5mK516BtntkreSYHTKnTY3xsu15X/HpkIZxQ
         8ePp5MuUOIyPZZfUAZ0aZR8f8aE/l2llS5Uo6dKtkEHBZnoH9cYT9Stx9HsxyAFTLD/f
         UUk+quuDDbEZybh84Kd2UmzZGM01km3+n3oFdU/OiGLJ0BNYEekoFUfX6Ka5eOGhl04B
         Wc+quffdKt9LoqD/qM70zPk+sNxir5agH8e/DpZimKD9Y4dX6t2ek6LBGTzye2GznSzA
         iJbgLzKijG+LebQn+jzOCY9XA7dN62ncllR9VYyaItxKdCuXfZshaNp1OHrqZasHHnKp
         hUlQ==
X-Gm-Message-State: AOAM531ElIEh7vYYhAZQGCrns7g919cmhxJsFJ1kd9v0Cy1jjsUaHHjo
	xk4lErpWV8uR5I6Dc8AmXIf5YgeDtD4K6w==
X-Google-Smtp-Source: ABdhPJwVewc6KRce3GZxm9yMEKTtmCyZY2hdmdCwW/TS6wAYapuR2CJ9w1ZL88Bn9F3TPblclOGwUw==
X-Received: by 2002:a05:620a:28c7:b0:67d:6d4e:16ee with SMTP id l7-20020a05620a28c700b0067d6d4e16eemr8051299qkp.59.1649880428912;
        Wed, 13 Apr 2022 13:07:08 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-32-216-209-220-127.dsl.bell.ca. [216.209.220.127])
        by smtp.gmail.com with ESMTPSA id y6-20020a05622a004600b002f1d2028296sm1450380qtw.87.2022.04.13.13.07.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Apr 2022 13:07:08 -0700 (PDT)
Date: Wed, 13 Apr 2022 16:07:06 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Conor Dooley <mail@conchuod.ie>
Cc: konstantin.ryabitsev@linux.dev, tools@linux.kernel.org
Subject: Re: [b4] previously passing dkim check is failing
Message-ID: <20220413200706.gx6zssxozh7cn54c@meerkat.local>
References: <cffe6d50-fa88-5873-a7cb-f646c57da91f@conchuod.ie>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cffe6d50-fa88-5873-a7cb-f646c57da91f@conchuod.ie>

On Wed, Apr 13, 2022 at 08:07:06PM +0100, Conor Dooley wrote:
> I then upgraded my b4 to the latest master (0.9-dev-6f2aa), because
> I am lazy & want to use shazaam. Between those commits, looks like
> something has stopped b4 from selecting a passing url for my mail:
> 
> b4 am e289c59c-96fe-38f0-8be3-7c1ba416817f@linaro.org
> Looking up
> https://lore.kernel.org/r/e289c59c-96fe-38f0-8be3-7c1ba416817f%40linaro.org
> Grabbing thread from
> lore.kernel.org/all/e289c59c-96fe-38f0-8be3-7c1ba416817f%40linaro.org/t.mbox.gz
> Analyzing 22 messages in the thread
> Checking attestation on all messages, may take a moment...
> ---
>   ✗ [PATCH v2 1/9] clk: microchip: mpfs: fix parents for FIC clocks

I think the thing that changed between b4-0.6 and the latest version was that
we made DKIM failures show up as opposed to just hiding them (it was a very
new feature on 0.6).

However, in this particular case the problem *is* legitimately with
microchip.com's DKIM setup. If we look at the signature, we'll see that it
uses c=simple/simple as the canonicalization format:

https://lore.kernel.org/all/20220411085916.941433-9-conor.dooley@microchip.com/raw

It's the worst possible setting for DKIM, for the reasons I mention here:

https://lore.kernel.org/lkml/20211214150032.nioelgvmase7yyus@meerkat.local/

In this case b4 is just legitimately telling you that DKIM signature is
invalid (because vger doesn't do c=simple/simple).

I suggest you reach out to microchip.com mail administration folks and
recommend that their DKIM signature setting is changed to c=relaxed/simple.

-K
