Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B7B79C0
	for <tools@linux.kernel.org>; Wed, 30 Nov 2022 19:17:39 +0000 (UTC)
Received: by mail-qv1-f45.google.com with SMTP id mn15so8781818qvb.13
        for <tools@linux.kernel.org>; Wed, 30 Nov 2022 11:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fuyTzaLSkhxa8sPYR9Uyy9Rf+diyoqa8qAZbYHEFyes=;
        b=RfM3E9La4dQJYjwpPwbzZZRmnQR7+nFKj8gXntYFWVphgaEe5LcY79LcGAx/lo0Q+T
         QUj6blXifCnXShhIIdAGNVF4nlcNhCiAuJXRgfhzTHxD8kkdbRo74NA7W1ZbC3Z2g3PW
         ro0jzKJsCtQZ0BlNz+QbQLun+sTbZ1iJ3B1ok=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fuyTzaLSkhxa8sPYR9Uyy9Rf+diyoqa8qAZbYHEFyes=;
        b=7IY1dlGpcoa+zysAQJ2XculsFdkDb0xYNPrg/0C3aGJg2RIAdryjmPEHkzh9Qw6L0I
         K/3TbdI/DADYZs87iXwt/NlwmQPNbOR5jQDhIhrF7xnp2ozK72OtaVOkPOKF3SvBNZIW
         6F1Ne1avhrjqSkWcr80z4I1WuBqipzwntAKjvrkpU1vpHATHMn+jBL8loHChat1659Xr
         /QrtZJJQqbUK8cASesTmAm9sfVEHG0e9wvMqS1wR2zvZ1AmKRIKDn6eYCck2+RS9QHwm
         Z89W2Iw8ATVkVwjT68lWUadxVHWn07TjvdngIpWD4WtPtUYI4r+hxpXW44NAXNbUGRBm
         lw5A==
X-Gm-Message-State: ANoB5plTS1Rl9/5Eeqh0jHUB7d+4ANbtZfFkDRYLM4juplopVXGFFpfU
	3X6A5yLjbTX7NhSHYEW8CGYFIb4XhcNkaQ==
X-Google-Smtp-Source: AA0mqf6mVvL8KH7P3GQS+B8GblbN3lVxHUijYwcqFDtmY3VVwPUYNzL0+BP2OPqW1MK3WY99yMJr/g==
X-Received: by 2002:ad4:43e2:0:b0:4c6:5c07:acc5 with SMTP id f2-20020ad443e2000000b004c65c07acc5mr26375338qvu.65.1669835858506;
        Wed, 30 Nov 2022 11:17:38 -0800 (PST)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id g8-20020a05620a40c800b006cebda00630sm1945114qko.60.2022.11.30.11.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 11:17:38 -0800 (PST)
Date: Wed, 30 Nov 2022 14:17:36 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Cc: tools@linux.kernel.org
Subject: Re: Error using b4 web endpoint (was Re: git send-email friendly
 smtp provider anyone?)
Message-ID: <20221130191736.pdt2x74znz2tcfxy@meerkat.local>
References: <3d2f9038-435f-f78e-31f4-59dbae587d18@tronnes.org>
 <20221122200049.ma5jpfiawmgmpng2@meerkat.local>
 <d9951176-24ed-ded1-c5dd-5586f779483d@tronnes.org>
 <20221122202033.jeukag3i5pttqp5d@meerkat.local>
 <4161738f-e2df-2d8e-7646-2c61df2f76b9@tronnes.org>
 <20221122204456.6tqutsoybrisa4xf@meerkat.local>
 <4adcd45f-21e7-698e-dc97-70995850ac9f@tronnes.org>
 <b1fb933e-e8b7-a46b-5234-7fd469ea9524@tronnes.org>
 <20221130165557.7ptog2pdgpa54377@meerkat.local>
 <77d7c98c-2fbe-d23c-b772-634b2a377761@tronnes.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <77d7c98c-2fbe-d23c-b772-634b2a377761@tronnes.org>

On Wed, Nov 30, 2022 at 06:02:58PM +0100, Noralf Trønnes wrote:
> > Can you please do `b4 send -o /somedir` and then send me the tarball with the
> > output of that?
> > 
> 
> Here you go.

Thank you very much. Can you please try again?

-K
