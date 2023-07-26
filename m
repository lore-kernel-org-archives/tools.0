Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 543F34CE9C
	for <tools@linux.kernel.org>; Wed, 26 Jul 2023 19:48:38 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-403fa83523eso664651cf.2
        for <tools@linux.kernel.org>; Wed, 26 Jul 2023 12:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1690400918; x=1691005718;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sCpIcWQ+1axxb/fi5T6O9BMUWy29LV8Z1rtk+lRkZbs=;
        b=FV+e1LSOtHZBo3xRXDP33jZfNyi8a6HFw0mscvNWgca9lBdST3XPMsrlL3d0l31hlP
         WWprL8CBYIC6rr3EMkHBhCKgfAOI3C3DNmtvbIeMwuMS7qXMjCCN4zjnuMbi/G/a8GIS
         FWw4m/7bEfNTzwdUV8gnzpJQ9LaWXMk6Qc4bc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690400918; x=1691005718;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sCpIcWQ+1axxb/fi5T6O9BMUWy29LV8Z1rtk+lRkZbs=;
        b=fME9oK7OQAB6c3bzJ/tObVNTwyprCFg3MLol/auKpaPogar3g0Z4i8qvIGovdi7KJd
         6QxjV3B8Z0jYULbX1SapiFkxKAgFYyTd30Gwbaf7APy2Up4itX2H1NdzGl5L550S3z4r
         xwLs+l/j1A6VNBLha4bPEspbYuaTLYcWUN4W2ORUy91AWdTtFrwLUxwgO2K3Gy1ClqhF
         M45rPNGYoaNN9JPGaqCusSGE3554AITGttJkLRTl6DZJHPL96pydPEBCdIlDvD0qRRLb
         OuEGDBfI/0JHN8DCEOZAf7I2Z9WRXHWTfJbmu2EhkEyl9kfAcs+NJFNmRT3F9Ra3nWng
         3LmQ==
X-Gm-Message-State: ABy/qLbdsfGMmv0McAO2EYeeyiRj/QjHbNnfGAerJDzhe8pGxLKryH0s
	CAKc4e01aJqi8/7N1O3zDmuI7w==
X-Google-Smtp-Source: APBJJlENraWE7GEiaFqxTpTfPx2OUGnogF4q0XMaonUI+9yJxIaBv49QxFeUbcjqvUFpynN0fpOX/A==
X-Received: by 2002:a05:622a:f:b0:403:ed26:4083 with SMTP id x15-20020a05622a000f00b00403ed264083mr3536619qtw.61.1690400917792;
        Wed, 26 Jul 2023 12:48:37 -0700 (PDT)
Received: from meerkat.local ([142.113.79.114])
        by smtp.gmail.com with ESMTPSA id z10-20020ac8710a000000b003f9bccc3182sm5021407qto.32.2023.07.26.12.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 12:48:37 -0700 (PDT)
Date: Wed, 26 Jul 2023 15:48:28 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Duje =?utf-8?Q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Cc: tools@linux.kernel.org
Subject: Re: [BUG b4] Encoding issues with --auto-to-cc
Message-ID: <20230726-hula-wad-c9241b@meerkat>
References: <1940519.PYKUYFuaPT@radijator>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1940519.PYKUYFuaPT@radijator>

On Mon, Jul 24, 2023 at 12:49:41PM +0200, Duje Mihanović wrote:
> Steps to reproduce:
>     - Checkout Linux 6.5-rc2
>     - Run `b4 prep -F "<20230721210042.21535-1-duje.mihanovic@skole.hr>" -n 
> <any branch name>`
>     - Run `b4 prep -c`

Thank you for that -- I can verify that it's happening.

bugbot assign to me

-K
