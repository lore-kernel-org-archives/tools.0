Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50DDA163;
	Fri, 23 Sep 2022 16:46:46 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id s14-20020a17090a6e4e00b0020057c70943so6414882pjm.1;
        Fri, 23 Sep 2022 09:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=N8lUNA7EJCaL2znw7hua8Q5vq2bH6WYnLDAudoSVA0s=;
        b=GVpWIMp8Pl+0E1xUhlB2cAD8RgNDLDSBkztjlMloURNwha4FL1EP7WBSXWPMSzF8jA
         iJ7OrkvzXJOP9Jezspear+OAMzzx2ja5ERlwNc0UDS0ljqPyqQQ8UKI+8241/gKu1xbi
         tGFfCBnuNem2igHKmAdeVeyd+699XUhteGfHkz/xbyP6Noo98x7ieHXX3ecizR53N091
         l5c1YL7tGG3WoUseFZYTW1fvlRacPPUDd2ty0KEQLmoeBuv6a062z/htxlObDk7SI/yZ
         GA4+I1dvzKY4sF+Px9VTeKFvUs8CF1XS2AG6bItI4MDZj2zsz4eKiCDF3Q1behnqAxYc
         Pbqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=N8lUNA7EJCaL2znw7hua8Q5vq2bH6WYnLDAudoSVA0s=;
        b=0AmZIxw1/6KlLYu8KQ719JW1lIQkdpjY8Tx0t37G53+0UJCCnzGpN7mUynGX9ZaSwq
         TSx2xyLxr8k9WWv7QMyrnwuG6mnSMkpeK2OeO0tSKX0FjExoscXl+/EppIY0uJaZ8GRO
         AuANYoQSFWPy+s0mQND4lzyuZs3Nw0Ep3zuGQXqfPsJOvdDvd/uGiwQ+2iHqTlSo7fAV
         Jiy0XKDLOxSepA6nCIxu3BykQrkkPbIQPYAsCiRmcd9ph7SNxyNK5AT+D+dHuhTffBUL
         vWnVuVc+D3i0pUfi23FWCtUGNWeapDBuSmgU1RmNoChyb4jIco3uFK6DoT5d8ZZQ21Z/
         o6Dg==
X-Gm-Message-State: ACrzQf3h6iRHG8IMsQCV0gSfKp1/0CZ4K9K2y+MNJwK/rpmjdjPsDMsW
	qLGiMtX3FJxwSFF3XK4Up7M=
X-Google-Smtp-Source: AMsMyM6UK0eCrjeQ7DJBvbj+JelK3MNoxaeo8qfVvZtVq6E5y6EgXAJ1f8AJtdsfKWDcWZAhO8/ELg==
X-Received: by 2002:a17:902:aa81:b0:173:3f68:e768 with SMTP id d1-20020a170902aa8100b001733f68e768mr9327199plr.80.1663951605476;
        Fri, 23 Sep 2022 09:46:45 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:8b46:be3c:2c54:68a5])
        by smtp.gmail.com with ESMTPSA id v1-20020aa799c1000000b005360da6b26bsm6613195pfi.159.2022.09.23.09.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Sep 2022 09:46:45 -0700 (PDT)
Date: Fri, 23 Sep 2022 09:46:42 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: "b4 trailers -u" chops off patch subjects
Message-ID: <Yy3i8hrcdRw9jW1S@google.com>
References: <YyzWI/zCGli+3UcQ@google.com>
 <YyzW46WQ47HUKTSx@google.com>
 <20220922220523.5lwelntnjvma7tgt@meerkat.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220922220523.5lwelntnjvma7tgt@meerkat.local>

On Thu, Sep 22, 2022 at 06:05:23PM -0400, Konstantin Ryabitsev wrote:
> On Thu, Sep 22, 2022 at 02:42:59PM -0700, Dmitry Torokhov wrote:
> > > It looks like "b4 trailers -u" removes patch subjects from commits,
> > > leaving only body:
> 
> Yikes. This is fixed in master/stable-0.10.y. I'd just introduced it earlier
> today due to a refactor. I need to add this to the tests.
> 
> Thank you for the report.

Thank you for the quick fix. I can confirm it is working for me now.

-- 
Dmitry
