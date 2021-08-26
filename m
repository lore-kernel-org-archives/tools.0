Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E7E13FC8
	for <tools@linux.kernel.org>; Thu, 26 Aug 2021 14:04:30 +0000 (UTC)
Received: by mail-qv1-f53.google.com with SMTP id eh1so2024252qvb.11
        for <tools@linux.kernel.org>; Thu, 26 Aug 2021 07:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=NP35dhkXlooeGtlUZNgZHo9tS+OZIxf2iq3z1MU4he0=;
        b=J8+AltBXmHOcxVdDhOdkHSEfeylzcQRE9dGrJg0mwLpFi+W/ZI1QwT4N7k41s3PYJW
         JOA/5iMiMH5FBYpzOOGIp1226nH4VMmZDT/Ic53Gh+6mZOtZem7PLnhnkYIJYqFW3fFJ
         HoUF8mAhrhsVeQP+j0RY9RJDK3n9KVfrDWPzc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NP35dhkXlooeGtlUZNgZHo9tS+OZIxf2iq3z1MU4he0=;
        b=K2h/AvZQ3Q7JYAffro8srKjexeZiECTEBtmk+nCcOaUAcfy0k1EW8PXaialmNBM0La
         +ARn6i9Iv6JSG4LkyjuZ0hOkMpPTjHd6AlvbwW6KbJMHA0lih9GHMnUlxuUa/kBljXqx
         JfKJCQyUuJb2wpCmmgiP+fr40gUeOquo+KGGVHEvUWkX4jUsbpM/6rgEL46yb4aDeM5i
         yabbumGsEDeylcSsnF/7jxKOiKNky8d/A1uNXDWvqtLhcaj8AgaN/ct8Bk1PbnXANJa5
         Q7UgHSDcp8ZJ9jpHv9dPnLw5TlR2VfVxdWCHihGr/ny3lpnaaWSsnw5yIOrbbgE3ci0R
         J55g==
X-Gm-Message-State: AOAM5321Xl5RiPE7/7K5nJn1dto2FL49LvhDjXMrYzt9jm7pUXouVPa1
	2L2165pW0CodQU5GLDApgfd0aQ==
X-Google-Smtp-Source: ABdhPJy8EXYvva/t5zS1YxW/Rq+vE9WVh/SO0GM2gG57QqwPgQMXibB+sZKu449rNwmBEI7tHcYTnA==
X-Received: by 2002:a0c:9103:: with SMTP id q3mr4305078qvq.36.1629986669340;
        Thu, 26 Aug 2021 07:04:29 -0700 (PDT)
Received: from nitro.local (bras-base-mtrlpq5031w-grc-32-216-209-220-181.dsl.bell.ca. [216.209.220.181])
        by smtp.gmail.com with ESMTPSA id p123sm2552245qke.94.2021.08.26.07.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Aug 2021 07:04:28 -0700 (PDT)
Date: Thu, 26 Aug 2021 10:04:27 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Josh Triplett <josh@joshtriplett.org>
Cc: Rob Herring <robh@kernel.org>, users@linux.kernel.org,
	tools@linux.kernel.org
Subject: Re: New version of lore available for preview
Message-ID: <20210826140427.ulnlkvrpzuat3otm@nitro.local>
References: <20210818190750.g3xedu7j24sqndo2@nitro.local>
 <CAL_Jsq+zxVw3BaAzF+58KT9jrFWNzUpELevj=SGPJSrdcVFPSw@mail.gmail.com>
 <20210825164459.5pxaxsl5a6nuipbt@nitro.local>
 <YSa4kYDpTAFOf0az@localhost>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YSa4kYDpTAFOf0az@localhost>

On Wed, Aug 25, 2021 at 02:39:29PM -0700, Josh Triplett wrote:
> On Wed, Aug 25, 2021 at 12:44:59PM -0400, Konstantin Ryabitsev wrote:
> > Great to hear, thank you for sharing that. I've been running b4 in a loop
> > against /all/ as well, and so far so good on my end, too. The plan is to
> > switch over to the new lore on Monday, August 30, but I need to release b4 0.8
> > first, which is needed to better work with the upstream public-inbox changes.
> 
> Would you consider applying the following patch, to improve the mobile layout
> on x-lore? Without this change, the mail listing pages are much narrower than
> the device screen, making them hard to read. This *should* make the pages size
> perfectly to the device.

I don't want to diverge from upstream, but I'm working with them on this
issue. My hope is to move the entire basement view (with mirroring and cloning
instructions) onto a separate page so it doesn't interfere with thread
rendering:

https://public-inbox.org/meta/20210826132747.6gxuwnhftyf7c6hp@nitro.local/

-K
