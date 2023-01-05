Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F63D52B
	for <tools@linux.kernel.org>; Thu,  5 Jan 2023 16:00:15 +0000 (UTC)
Received: by mail-vs1-f45.google.com with SMTP id m129so32720859vsc.11
        for <tools@linux.kernel.org>; Thu, 05 Jan 2023 08:00:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aSHEUgoAVTsBx2WP9mPB6jIqd85r/n19I7sFr3zrFbk=;
        b=BPdtduib2wjqHIksFr16OcC2i8jbvTa1YHTCzx0f6Fsio8vg9CBh790NhKcZxyzUCk
         EwOEeCazQ0uRUpj78EYXlDR3np+5Wy2Xesg6ELNhOi5XOnsDBlHf91DuQrv3m0zW+QYi
         Lxbwk4+ZhqforKqq7EbjUZ/AY2fYwlpdQbcMw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aSHEUgoAVTsBx2WP9mPB6jIqd85r/n19I7sFr3zrFbk=;
        b=Eirv+2p62zdxt63561DtD2emEKV2uTHwNO7JaSExl5jTa/+Gejj97DJveRXmJ/6YPU
         hyjBxIUyZjtHD4YJCIHe1JohcyXQAR9bsH87A3/r7iRwkEJfGe6EJfjeF8Wni4ucFDOL
         ISbBGBKNgeL0cReqpMpTkiVCjeRa96VGBnm3qrINHEzi4zj2Owp0zDY6iJBI8BTwBZkY
         dlqFNiSaem0B6Ght2RHDJ3Mznod3R7bZ5dGlkIoiEeLaLl6qSfdOvNcTuYFQlND1RrmV
         zzzmGDcilIaLgZn53AoSRQnRWbopln0xGocyCuvMUQgm8gk+6Edi4QHmNwMftGfCOA+p
         2lGg==
X-Gm-Message-State: AFqh2krBRuT63LnccgtdP7JUmAk31lymPvL0qN0ZuRmkYNq6nZ8N3f+J
	K1Oa96HK7Yg4TgysiPRvT9uzvw==
X-Google-Smtp-Source: AMrXdXtOeMfPODlf9/OlvU7fdRW6djECrIKw8ilvSUUHS3/QXqgGHmaNaJIvDfcME5vOBEcideOTnQ==
X-Received: by 2002:a67:c902:0:b0:3b1:378e:f698 with SMTP id w2-20020a67c902000000b003b1378ef698mr22603620vsk.11.1672934414669;
        Thu, 05 Jan 2023 08:00:14 -0800 (PST)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-7.dsl.bell.ca. [209.226.106.7])
        by smtp.gmail.com with ESMTPSA id bi4-20020a05620a318400b006f956766f76sm26182320qkb.1.2023.01.05.08.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jan 2023 08:00:14 -0800 (PST)
Date: Thu, 5 Jan 2023 11:00:12 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Mark Brown <broonie@kernel.org>, Vlastimil Babka <vbabka@suse.cz>,
	tools@linux.kernel.org, Greg KH <gregkh@linuxfoundation.org>,
	Javier Martinez Canillas <javierm@redhat.com>,
	dri-devel@lists.freedesktop.org,
	Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 0/6] drm/gud: Use the shadow plane helper
Message-ID: <20230105160012.y5yo4ldg7ix73veb@meerkat.local>
References: <Y4hB5odv9IGaq3Di@kroah.com>
 <1cb40762-5f0a-1739-1670-155f59ec7110@tronnes.org>
 <Y4iaODY6hMVNsfP1@kroah.com>
 <4e75582c-b3d6-fb0e-19b4-e4fd58c6bf55@tronnes.org>
 <Y4iqR94aGFa3NahQ@kroah.com>
 <e57deac6-5344-3f81-8ef5-55dd28b8c363@redhat.com>
 <20221201141642.uvonbrny4rhuacl5@meerkat.local>
 <dad6891d-5ca2-b849-b504-1a37b4741886@suse.cz>
 <Y4i672D3GHu2xPS5@sirena.org.uk>
 <Y7bEGaZol7jFuHwR@phenom.ffwll.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y7bEGaZol7jFuHwR@phenom.ffwll.local>

On Thu, Jan 05, 2023 at 01:35:37PM +0100, Daniel Vetter wrote:
> > Yeah, without the cover letter if you've just got an individual patch it
> > can be unclear what's going on with dependencies and so on for getting
> > the patches merged.
> 
> +1 on including the cover letter for any recipient. If b4 can do this
> right by default, that would be a really good reason for me to look into
> it and switch.

That's the behaviour in the latest releases. I will release 0.11.2 later today
with some hotfixes, so if you want to try it out, that's the version I'd
recommend.

-K
