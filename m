Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99FE42F5F
	for <tools@linux.kernel.org>; Thu,  1 Dec 2022 14:16:45 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id e15so1055063qts.1
        for <tools@linux.kernel.org>; Thu, 01 Dec 2022 06:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ByBUzDvzM4j/gp90rEVsVwRt5tlydokLLLhC4JKYf6Q=;
        b=ALKYG2D/tADzmmrBG2F3xseeZLU9Pndwb16fHF0A/f7XQgK5jyMFTwdCUz0xY9OoVp
         cREeQQ3+FW0jrwzLfQ/2wqFV6IBhYQF7vbaPcJwfsNL060cwpUnIhYMg0wAgvWz45uBc
         N7bAvldEO4GvHVLo0aBH48ATa64osjZndwqLU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ByBUzDvzM4j/gp90rEVsVwRt5tlydokLLLhC4JKYf6Q=;
        b=jZjBrBsMHiqpDTQV8N4ADC0a/QB2aewH/u3zp6HbvM0d7j2BZv0W0ZkcWr3mBEDaRu
         yffFP0zXzsi1XiSI6ZuTmYuQr2aM4ZJT5VwqsbTNROthi88EtRebe7oH9Dy/PxHPrSZ6
         6xgrqoavc/B8C8XWlJIRSZ2vPQyyEx2er3FOZ6x/QbJpvHgjy9LJMI0ogwnubI7nNgku
         C4hgNU+a5aLWSo/IsSZe9cw4RiR6BxM2vk6laBg+8hhi5rBFXwueMG8I+4oIBBLur+pU
         IxI0nlk+qm3bppXJIxs5vYq5hfsJRtcYRFGUzoEkaHXKt2j2e6tzRMdMm9vn4L2fm/mH
         GKpg==
X-Gm-Message-State: ANoB5pnxNksnAC6BZlZOiXhTsrs2nIP+LfGeub/U/G+hUzgPNaxradbg
	B2oinRTC18rbvrtCWo4KEQBISw==
X-Google-Smtp-Source: AA0mqf4sje8Z+QezshaWc/1aH17c3fAMaRO7YFMGMDGpOgxLC6kxNdCsPxqps85W5A5wbu9nD4HftA==
X-Received: by 2002:a05:622a:4114:b0:3a6:94b4:bb11 with SMTP id cc20-20020a05622a411400b003a694b4bb11mr1505998qtb.539.1669904204490;
        Thu, 01 Dec 2022 06:16:44 -0800 (PST)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id bi13-20020a05620a318d00b006fb0e638f12sm3554530qkb.4.2022.12.01.06.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 06:16:44 -0800 (PST)
Date: Thu, 1 Dec 2022 09:16:42 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: Greg KH <gregkh@linuxfoundation.org>,
	Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
	tools@linux.kernel.org
Subject: Re: [PATCH v2 0/6] drm/gud: Use the shadow plane helper
Message-ID: <20221201141642.uvonbrny4rhuacl5@meerkat.local>
References: <20221122-gud-shadow-plane-v2-0-435037990a83@tronnes.org>
 <Y4hB5odv9IGaq3Di@kroah.com>
 <1cb40762-5f0a-1739-1670-155f59ec7110@tronnes.org>
 <Y4iaODY6hMVNsfP1@kroah.com>
 <4e75582c-b3d6-fb0e-19b4-e4fd58c6bf55@tronnes.org>
 <Y4iqR94aGFa3NahQ@kroah.com>
 <e57deac6-5344-3f81-8ef5-55dd28b8c363@redhat.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e57deac6-5344-3f81-8ef5-55dd28b8c363@redhat.com>

On Thu, Dec 01, 2022 at 02:34:41PM +0100, Javier Martinez Canillas wrote:
> >> Konstantin,
> >>
> >> Can you add a rule in b4 to exclude stable@vger.kernel.org
> >> (stable@kernel.org as well?) from getting the whole patchset?
> > 
> > stable@kernel.org is a pipe to /dev/null so that's not needed to be
> > messed with.
> > 
> > As for this needing special casing in b4, it's rare that you send out a
> > patch series and only want 1 or 2 of them in stable, right?
> >
> 
> Not really, it's very common for a patch-series to contain fixes (that could
> go to stable if applicable) and change that are not suitable for stable. The
> problem as Noralf mentioned is that the b4 tool doesn't seem to allow Cc'ing
> individual patches to different recipients, and everyone get the whole set.
> 
> So either b4 needs to have this support, exclude stable@vger.kernel.org when
> sending a set or stable@vger.kernel.org ignore patches without a Fixes: tag.

I think what I can do is a special logic for Cc: trailers:

- Any Cc: trailers we find in the cover letter receive the entire series
- Any Cc: trailers in individual patches only receive these individual patches

Thank you for being patient -- we'll get this right, I promise.

-K
