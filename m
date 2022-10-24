Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8311E6ADB
	for <tools@linux.kernel.org>; Mon, 24 Oct 2022 21:20:10 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id s17so6873671qkj.12
        for <tools@linux.kernel.org>; Mon, 24 Oct 2022 14:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FemoHKa3zD6tmSBhqNcvq7yOokE5BhMaAs/TikdP0qs=;
        b=E9bSTn4Qxa0kn0YU2MIo/5IdK+XPONIgyInYhSCAJ53ZSFxpr5kJSL+pGD3XmDyV38
         WV43yhG+v2WjlBrjxiPId7n6j9b/bpEP73t/tb/8xoBPhgx8sqe2C0wWKyhNJWJ0p1qL
         te6yLwMJiwOK6YZOUf47ukkxqOnyia45XAqMo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FemoHKa3zD6tmSBhqNcvq7yOokE5BhMaAs/TikdP0qs=;
        b=xqa/FlsZlhoSvp+i7i/naVctS5xnyU8w9sAs6vHZ1dK6ohcB4MraMcB3DZ0KklfJyc
         q3udCmXF9jxA4iNR8O8lfuKoBfZbI9eNBP7S+1fE2JIIDQoYprP3nGMqiInU7Hmq7/P/
         dzyzsO3lf6tN/4ELdAp5r4PvYkPIefZWahcesccoBCOKZRlhnCoXh2Acph3+Y0vNk8Ge
         4/3Ave/8kppGtyyAcwPYGaYi0jKMSqxxd9BKnVN8n4phPngttxLn7xSgn0PvV1i9hOMU
         jbrqEByd420zDUvjjGb+e0cN+xDODcEEAaonYdVcKKWGvLNdM12t3CCKPrHfJp3kYZ80
         vTOw==
X-Gm-Message-State: ACrzQf0k4F9YaHCE999QB1BP3L8JAhJ7czult4WHaP509/McLhnsmxnt
	X07R0L8k6U/hQAE6eUApcDRbrilgDVT23g==
X-Google-Smtp-Source: AMsMyM5cvWk9CpQVXypKnsHSJ6/VuyMmuUHqmVVivnofx9cYMbO/Z7CcW56irz9wMuETMYJvkeGWTw==
X-Received: by 2002:ac8:5d87:0:b0:39c:eb24:2e1a with SMTP id d7-20020ac85d87000000b0039ceb242e1amr28750974qtx.577.1666646399160;
        Mon, 24 Oct 2022 14:19:59 -0700 (PDT)
Received: from nitro.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id x6-20020a05620a448600b006b9c9b7db8bsm733583qkp.82.2022.10.24.14.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 14:19:58 -0700 (PDT)
Date: Mon, 24 Oct 2022 17:19:57 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: tools@linux.kernel.org, users@linux.kernel.org
Subject: Re: b4 shazam --continue
Message-ID: <20221024211957.ursvybud4lmbzgt4@nitro.local>
References: <Y1K+czGJHoCd/4z6@orome>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y1K+czGJHoCd/4z6@orome>

On Fri, Oct 21, 2022 at 05:44:51PM +0200, Thierry Reding wrote:
> when I apply a patch or series and midway some error occurs (could be
> checkpatch or conflict, for example) shazam will interrupt the operation
> and drop me to a shell. I can then resolve whatever errors those are and
> resume using git am --continue, but that has the side-effect of loosing
> track of the patch/series. Things like added Link: tags still work, but
> thankyous are no longer tracked.
> 
> I've gone through the documentation and various b4 threads on this list
> but haven't found any solution to this. Is there a way to have shazam
> pick up where it left off? Or would it be possible to add such a
> mechanism?

Right, I think the best course of action here would be to record tracking
before we exec git am, not after.

I'll plan to put that in.

-K
