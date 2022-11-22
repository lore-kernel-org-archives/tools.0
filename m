Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF511C15
	for <tools@linux.kernel.org>; Tue, 22 Nov 2022 21:15:02 +0000 (UTC)
Received: by mail-qv1-f49.google.com with SMTP id i12so10974786qvs.2
        for <tools@linux.kernel.org>; Tue, 22 Nov 2022 13:15:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DwP+tuc2XTBlTk9Y7BcVHt5JIlF7/l+HKRGEneVkk6k=;
        b=PflOHsr+tHdI5H0CGULpMryfojMN/beoumVAJ4zihuLC0wpx3fTAwa9sPJ2Z5w8tTM
         wj8tXS2ZbXs7PQVWPYtcmP+P/5EbDAXL0zS1MEXWxNYSQIl3ciJLx9KUS+UPBz99RoOV
         wUB3MtZkIoOrVCGjChouTASJfGRDunrKJhC7M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DwP+tuc2XTBlTk9Y7BcVHt5JIlF7/l+HKRGEneVkk6k=;
        b=kqEel95npGQhWR8n2tTmxT1AAMsGHXLD6qGxAZHpU5v5Zyx+Gd9QiQtnygeEqb5ArE
         9/KjLpib8vYXp0yGKcgZdi8e/9pdJtnuylAvEdr+gv7CZXF4FmUfXcUFTjvFbseF9mpE
         zObYcZccTKhGWNkmoUJ1Y3GB2eAHF/g3d4jelWpnoeIYlNbVqTUb2+oEyQs8YCCzR24u
         DtG+t+k0OFBJEi9HDiqqN92vdpqR+wVyxzQBtaEPrk4aqA2z5C0PACBcQYMi9oJ9xdXd
         cRIwPq7jRIhEzV8VJjxBW90V88BLMn2kKe3YS/RzAUPiN1HJbdc+cdbc2oyLjjfEZvAr
         DNfA==
X-Gm-Message-State: ANoB5pkmIIDVwMVlMprcfLMaQl74IUZzoJkWEPJnvjAJ8pFk9ANk9No7
	nVepRv5F6MEiqu+kqWBycb9K9yGmO3Cixw==
X-Google-Smtp-Source: AA0mqf7PDHPeaeoMcgH9HJZrJ56NM/Drhk3SemyjAfJWrqQMvsCKBdFUDXLHJg+3lXL9W1dwNABVFg==
X-Received: by 2002:a0c:bf0d:0:b0:4b1:827d:f33b with SMTP id m13-20020a0cbf0d000000b004b1827df33bmr6846264qvi.7.1669151701375;
        Tue, 22 Nov 2022 13:15:01 -0800 (PST)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id d5-20020ac85445000000b0039492d503cdsm8780087qtq.51.2022.11.22.13.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 13:15:00 -0800 (PST)
Date: Tue, 22 Nov 2022 16:14:58 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Cc: tools@linux.kernel.org
Subject: Re: Error using b4 web endpoint (was Re: git send-email friendly
 smtp provider anyone?)
Message-ID: <20221122211458.tezmu3tmb6m6e4lz@meerkat.local>
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
> Thanks, no errors this time.
> 
> Series:
> https://lore.kernel.org/dri-devel/20221122-gud-shadow-plane-v1-0-9de3afa3383e@tronnes.org/

Great! I also pushed a fix (which consists of merely removing the encode() in
auth_verify) -- I have no idea why I put it there in the first place, but it
was totally unnecessary and only really worked because simplejson
automatically decoded it back into unicode (and python's json just errors
out).

I see that your name got mangled in the From: line -- I don't think
public-inbox is happy with 8bit headers. I'll get it fixed, but it shouldn't
matter for git.

Thank you for being willing to try this out. It's still considered an
experimental feature and you're literally the first to ever use it. :)

-K
