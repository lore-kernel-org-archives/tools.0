Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B348A1C15
	for <tools@linux.kernel.org>; Tue, 22 Nov 2022 22:05:13 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id j26so4169109qki.10
        for <tools@linux.kernel.org>; Tue, 22 Nov 2022 14:05:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fPl0HYpelE5V7DMqJkpNhZEd3MJAKZgKeHVlDTFIGu4=;
        b=EYgkwQCfCafnPCSJL69wlVRT2Na5JI0eYiwskDk8ABJMQvdgwoxHumcDkbz3vCz5zO
         /pfLiEH9OK8LzxPlGuZn/NPM4JFcBC/BaTyFqvNRgQJugLtfqFdIQ95U6RIUtifqinf5
         hYM76pIUuK5wHbpHucN2G1kcmohh+jSlNDpZo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fPl0HYpelE5V7DMqJkpNhZEd3MJAKZgKeHVlDTFIGu4=;
        b=Uj1HCbqlH0Wu+kIzubGETuKb7XHoH5m8jxvpRVvFEtKkqwVvlkT3YdBdDUoxe6hriQ
         qeuv/i+w1qsi7WLeeoV+jCoi8Z4w1JAAQoYfjKMTgVlHnt2g6OF91yYYNyXNATCREjxt
         SJ5xBddEC0wJp7vDPLmmcPf8MedGkGAXSprIMc0yzFNotucbMGPYLuvab6+2k4acI0ve
         L41xullCFraOEEwVMLGEmI2eBOOzJsD7Kf5/4aFSq2H4GDvgMhm9ZFYOYG6vKI8/ZRBS
         jMTN0THYpCNszS2jK2B3zEVJPwhgj7BN5b7G5LAe2wXxn9uTWnaUcwd7cANGeRntTBrj
         wkaQ==
X-Gm-Message-State: ANoB5pnn+mB/t1boPe5vM8taPEUg7kNj+x6r+vf1D0NwnyHOv7m4TS0c
	ZQPv3PXGwlB3ye0vip9CrkNU/JYgc8lAkA==
X-Google-Smtp-Source: AA0mqf4f/dpMcUjuhhwoJGLLyOoFTPj3scIVc6eCCawcU55tfEjm7N7qGgofs9kmO9DwzcFqs1X02w==
X-Received: by 2002:a37:aa51:0:b0:6ee:f54d:e17 with SMTP id t78-20020a37aa51000000b006eef54d0e17mr11124653qke.63.1669154712521;
        Tue, 22 Nov 2022 14:05:12 -0800 (PST)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id x30-20020a05620a0b5e00b006fbb833fef8sm10802537qkg.28.2022.11.22.14.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 14:05:12 -0800 (PST)
Date: Tue, 22 Nov 2022 17:05:10 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Cc: tools@linux.kernel.org
Subject: Re: Error using b4 web endpoint (was Re: git send-email friendly
 smtp provider anyone?)
Message-ID: <20221122220510.f7b3zubryeincyyn@meerkat.local>
References: <20221122185001.q6hmeblp64jqdzvz@meerkat.local>
 <02bc2442-e3b3-d720-9d13-ffcdfd760fb8@tronnes.org>
 <20221122194428.fmbayuz6vbvdd6uw@meerkat.local>
 <3d2f9038-435f-f78e-31f4-59dbae587d18@tronnes.org>
 <20221122200049.ma5jpfiawmgmpng2@meerkat.local>
 <d9951176-24ed-ded1-c5dd-5586f779483d@tronnes.org>
 <20221122202033.jeukag3i5pttqp5d@meerkat.local>
 <4161738f-e2df-2d8e-7646-2c61df2f76b9@tronnes.org>
 <20221122204456.6tqutsoybrisa4xf@meerkat.local>
 <4adcd45f-21e7-698e-dc97-70995850ac9f@tronnes.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4adcd45f-21e7-698e-dc97-70995850ac9f@tronnes.org>

On Tue, Nov 22, 2022 at 10:03:55PM +0100, Noralf Trønnes wrote:
> > On Tue, Nov 22, 2022 at 09:26:03PM +0100, Noralf Trønnes wrote:
> >>> However, I see that it's failing on Debian 11 with the JSON error.
> >>> I'll poke some more now that I have a test env and follow up.
> >>>
> >>
> >> Yeah that test snippet fails with the same error.
> >>
> >> $ lsb_release -ir
> >> Distributor ID: Ubuntu
> >> Release:        22.04
> > 
> > Okay, this is not a real fix, but it will get things working for you while I
> > implement the proper solution:
> > 
> > apt install python3-simplejson
> > 
> 
> Thanks, no errors this time.
> 
> Series:
> https://lore.kernel.org/dri-devel/20221122-gud-shadow-plane-v1-0-9de3afa3383e@tronnes.org/

Sigh. I clearly need to fix the 8bit header issue (ugh, woe!, etc). I'll try
to get this done asap. I'm glad the very first use of the web endpoint we had
is the one where there's 8bit content in the From: header, and we have to
rewrite it with more 8bit content for DMARC purposes.

-K
