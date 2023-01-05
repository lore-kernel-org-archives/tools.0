Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B909233D0
	for <tools@linux.kernel.org>; Thu,  5 Jan 2023 12:35:41 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id z8-20020a05600c220800b003d33b0bda11so2374658wml.0
        for <tools@linux.kernel.org>; Thu, 05 Jan 2023 04:35:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YSA6zYxnKj2CJGgjVWVQgRIzGVPZDpCjVD215GDDcrM=;
        b=ILs/3NmKO0MKq0m1McZEP/lP6y2ZDXCidXCmIk0bb8ETVdlK9OHnV7vUKL8L9QZgZV
         ufyxm3BzRa8jaWz9QD5gMzHvWjU9JtPoYAArECXVeovwa3JPFpWLny2qQaG+bLQJZIhE
         ARw+YS6V3a+7Claq5yhDsGZtlBMCshLkIInkY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YSA6zYxnKj2CJGgjVWVQgRIzGVPZDpCjVD215GDDcrM=;
        b=OhTyiziGnfLUcDn8RpNXTqVJivRlNLeikf8zLOSmhY1GVU/PEN5PY7ODeN49Q6Yrvg
         Z9GuDrKo0dTOpb0HNnA8t9yTd8yXl0xsABLNOlflYyxbjdT5oqTiYjzCusGfkvHv8ytw
         /WdGEryGJtI9O2qiWNUBn9wdsd/kvl5KLHVXE+sV91G3n6/bStIHPkqRWq1tDCMEK8SZ
         tgOq+EDYP8zYLQqCCmRwSh3MXQoz5z6Q3juqauVt7ATIFeafnHwcQEbI9WWvYIHtq9fh
         vazkHXzolErJAdf8/0eCFKL46stoMhGMMDsBb3O9rwwjEhxsmkyYXVLg6eaJgYuvLYcf
         EW5A==
X-Gm-Message-State: AFqh2kpxG/mfhUX8EEDRU7pIS+0jx95VUYQW2hUDjXJWaASXWdnaDqyM
	K78NP0MwOR/GtNmgrau9rLaIxA==
X-Google-Smtp-Source: AMrXdXu3Q8WzdIO45lcNUAkTD9WkyiNM8TGg+WFlc9SJ4E40l78FDH5Y3z2AZwCJ5/ZeO72ekhJrFA==
X-Received: by 2002:a05:600c:4fcf:b0:3cf:360e:f37d with SMTP id o15-20020a05600c4fcf00b003cf360ef37dmr35938993wmq.22.1672922140065;
        Thu, 05 Jan 2023 04:35:40 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id i3-20020a1c5403000000b003cf5ec79bf9sm2377554wmb.40.2023.01.05.04.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jan 2023 04:35:39 -0800 (PST)
Date: Thu, 5 Jan 2023 13:35:37 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Mark Brown <broonie@kernel.org>
Cc: Vlastimil Babka <vbabka@suse.cz>, tools@linux.kernel.org,
	Greg KH <gregkh@linuxfoundation.org>,
	Javier Martinez Canillas <javierm@redhat.com>,
	dri-devel@lists.freedesktop.org,
	Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: Re: [PATCH v2 0/6] drm/gud: Use the shadow plane helper
Message-ID: <Y7bEGaZol7jFuHwR@phenom.ffwll.local>
References: <20221122-gud-shadow-plane-v2-0-435037990a83@tronnes.org>
 <Y4hB5odv9IGaq3Di@kroah.com>
 <1cb40762-5f0a-1739-1670-155f59ec7110@tronnes.org>
 <Y4iaODY6hMVNsfP1@kroah.com>
 <4e75582c-b3d6-fb0e-19b4-e4fd58c6bf55@tronnes.org>
 <Y4iqR94aGFa3NahQ@kroah.com>
 <e57deac6-5344-3f81-8ef5-55dd28b8c363@redhat.com>
 <20221201141642.uvonbrny4rhuacl5@meerkat.local>
 <dad6891d-5ca2-b849-b504-1a37b4741886@suse.cz>
 <Y4i672D3GHu2xPS5@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y4i672D3GHu2xPS5@sirena.org.uk>
X-Operating-System: Linux phenom 5.19.0-2-amd64 

On Thu, Dec 01, 2022 at 02:32:15PM +0000, Mark Brown wrote:
> On Thu, Dec 01, 2022 at 03:27:32PM +0100, Vlastimil Babka wrote:
> 
> > I usually do that with git send-email and a custom --cc-cmd script, but
> > additionally it sends the cover letter also to everyone that's on any
> > individual patch's Cc, so everyone gets at least the cover letter + their
> > specific patch(es).
> 
> > But that extra logic could be optional.
> 
> Yeah, without the cover letter if you've just got an individual patch it
> can be unclear what's going on with dependencies and so on for getting
> the patches merged.

+1 on including the cover letter for any recipient. If b4 can do this
right by default, that would be a really good reason for me to look into
it and switch.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
