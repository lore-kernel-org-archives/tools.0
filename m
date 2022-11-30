Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A7946FA0
	for <tools@linux.kernel.org>; Wed, 30 Nov 2022 16:56:00 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id z17so12701054qki.11
        for <tools@linux.kernel.org>; Wed, 30 Nov 2022 08:56:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=plKEV5HcENwSJlkP0pLdesVoXnJng0J8T06603Ivjyk=;
        b=iTNkNXuKHSnsAty/CdGrzWZhl5h/Sc7Lk+q16AJ7ebfgHwicP80O20wF0P3ayoqxX4
         +6ILajPJYb39RKK9D8j6dR4AOujA1F78r8D3McltfDKXDx/TQl0lKESmhYgrcpRB/eGw
         GXniMrYsAEmeBNRhAOz2idsvduxQkX4+sz8UA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=plKEV5HcENwSJlkP0pLdesVoXnJng0J8T06603Ivjyk=;
        b=BwzOwfbRuddLJoxppIk6RJKWzHVcSYzOdibIrpHWPU094+/krxDuSFw2RYkjdaMcSG
         NFLCH/QY9N7dwreBurcad9ci8pvIyp3GDNhSmy0H3FzjuPLdlqwgCUWHj5im91EUoUfQ
         twTFCk9EXGTcAxAeQmyeYlMKgeY3hK4bjCo1pTdaWMxQ5v6WXgCk1Y9Tv9VT7NgV9kzM
         0e6ySSNUUxLaoA+GH/vYIyG40XWlDzgVTyyomTIjkoj8pXl6Z2RYyvhV/dwONex/KGI2
         qN2olzcArLsgjrxzB+RCXhyNLj/XCtPSVXmVIIdl2LKJakyA9M4wSb9fRyXvAqQYzDsx
         D7gQ==
X-Gm-Message-State: ANoB5pmoRUXEIu2TkXSZ6ItfFZzW507xXj72DUl8PvCt75heJAahZrLc
	m/pXlEorAO7Lz2aaG/CyINljHsRDFbrICw==
X-Google-Smtp-Source: AA0mqf4ixJKecRD8C/qbz0xhdA4Wj4cs13q48LEvsiqhOsgmPJ7IrQHGRoIj5EwhiJAJxxoWGOGMCQ==
X-Received: by 2002:a05:620a:148b:b0:6fa:e099:bc12 with SMTP id w11-20020a05620a148b00b006fae099bc12mr39681263qkj.308.1669827358999;
        Wed, 30 Nov 2022 08:55:58 -0800 (PST)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id t3-20020a05620a450300b006eea4b5abcesm1576344qkp.89.2022.11.30.08.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 08:55:58 -0800 (PST)
Date: Wed, 30 Nov 2022 11:55:57 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Cc: tools@linux.kernel.org
Subject: Re: Error using b4 web endpoint (was Re: git send-email friendly
 smtp provider anyone?)
Message-ID: <20221130165557.7ptog2pdgpa54377@meerkat.local>
References: <02bc2442-e3b3-d720-9d13-ffcdfd760fb8@tronnes.org>
 <20221122194428.fmbayuz6vbvdd6uw@meerkat.local>
 <3d2f9038-435f-f78e-31f4-59dbae587d18@tronnes.org>
 <20221122200049.ma5jpfiawmgmpng2@meerkat.local>
 <d9951176-24ed-ded1-c5dd-5586f779483d@tronnes.org>
 <20221122202033.jeukag3i5pttqp5d@meerkat.local>
 <4161738f-e2df-2d8e-7646-2c61df2f76b9@tronnes.org>
 <20221122204456.6tqutsoybrisa4xf@meerkat.local>
 <4adcd45f-21e7-698e-dc97-70995850ac9f@tronnes.org>
 <b1fb933e-e8b7-a46b-5234-7fd469ea9524@tronnes.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b1fb933e-e8b7-a46b-5234-7fd469ea9524@tronnes.org>

On Wed, Nov 30, 2022 at 05:17:44PM +0100, Noralf Trønnes wrote:
> I'm ready to send version 2 of my patchset, but it doesn't work.

Ah, sorry to hear that -- I did make changes to the endpoint, so it's not
really surprising, even though I tried to run a lot of tests to make sure it's
working.

Can you please do `b4 send -o /somedir` and then send me the tarball with the
output of that?

-K
