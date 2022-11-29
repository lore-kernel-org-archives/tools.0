Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1383FAD4B
	for <tools@linux.kernel.org>; Tue, 29 Nov 2022 17:14:56 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id k4so10273651qkj.8
        for <tools@linux.kernel.org>; Tue, 29 Nov 2022 09:14:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OCFeFK0dSSXPbQfPRJWcnAP05vVJTuR1MVanPxiNRdM=;
        b=O/pn/jjnHpFreW/0eN7OZ+rA1CAdr3w/iLVzXPsyOyzOOeSMSIt3H4d0tpOAU0XzUN
         AVca2N2C1VWGaOOvbU0x7pmwceIa6KA+n0yfKoWamhCcB4xJsnxUmyuNQHWUOi2fheu+
         FbBtqy1rDQnM0IAZ6fAiSg+7s5L2tzxeV5F2c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OCFeFK0dSSXPbQfPRJWcnAP05vVJTuR1MVanPxiNRdM=;
        b=dW/Prjpt1es68GNepiGnTPgv7uGErSK0hS3kYlZ50wW2OD2OrNTBZh4utn/onXfsFB
         cK7jIaK2j1Ku8EpIn7E3Bv7MHTHdXQ8LtEOGdJ5iwqSwytFJRVZv7a0VbzQdIhfTGAJP
         /9WGpxOXisIk4fD4j3LF9mNwkAMnltTeGCP4PNy0O1TBkvNAtzxm+LGwjP5cu6omBdvm
         KBT7dBhygfwh9TW2T9TxCL43D8bFshYDGK+dEP4DU8THputqwQg94mkjnSNm6itu0dz/
         V6YSHHpQVAiy6+SJyWy+VlnupbdMJ9gOvXVj0BNb7t3GqIyj56B7ND3K81sgy65Qi1em
         p8zA==
X-Gm-Message-State: ANoB5pm3iJXQJfcgpnWWRpllXeEWVCogTtaZmrrBOP7RkGSTOJdJ0xFU
	NdTSTvhISw1xHuGi5IpMi70aMw==
X-Google-Smtp-Source: AA0mqf47Dw9yhku07q6vOJfFwEmulvfugjFV3edrrFxWlhpCMIo2jyZGOjGkiNUH0aaOqYHcRROvKQ==
X-Received: by 2002:a37:607:0:b0:6ec:56df:12dd with SMTP id 7-20020a370607000000b006ec56df12ddmr33418078qkg.124.1669742095817;
        Tue, 29 Nov 2022 09:14:55 -0800 (PST)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id y26-20020a37f61a000000b006fbaf9c1b70sm10600644qkj.133.2022.11.29.09.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Nov 2022 09:14:54 -0800 (PST)
Date: Tue, 29 Nov 2022 12:14:53 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Maxime Ripard <maxime@cerno.tech>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: b4 bugs / future improvements
Message-ID: <20221129171453.f74wxgd3kemsvy6q@meerkat.local>
References: <20221018153620.tyuedbldi2ofbe2x@houat>
 <20221018201804.na5x7lohm4yszg5h@nitro.local>
 <20221019080140.zc42aqi7gwjpvczs@houat>
 <20221020084930.vpu552rag6gdvmvm@houat>
 <20221109141459.ud2wofasq2jozmks@houat>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221109141459.ud2wofasq2jozmks@houat>

On Wed, Nov 09, 2022 at 03:14:59PM +0100, Maxime Ripard wrote:
> > It seems to be related to
> > https://github.com/marlam/msmtp-mirror/issues/51 except I don't have
> > set_from_header in my config. I've tried to use allow_from_override and
> > force it to off, and it didn't help.
> 
> I just discovered something else.
> 
> For various reasons, on one of my series I keep a per-commit changelog,
> in the commit log after a ---
> 
> This works generally fine, until I run b4 trailers -u which seems to
> drop the entire content after --- when adding the tags.

This took a while to track and fix, but this should no longer happen in master
and stable-0.10.y. Thank you for the report.

-K
