Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C34323E
	for <tools@linux.kernel.org>; Wed,  7 Dec 2022 18:22:00 +0000 (UTC)
Received: by mail-qv1-f45.google.com with SMTP id p12so13224627qvu.5
        for <tools@linux.kernel.org>; Wed, 07 Dec 2022 10:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wYminRkg9mkT6EUmW2Uc8bvRNZ3c+J5In/yHFEJ6KlY=;
        b=fVCcvRWG2tv+Jl5KAeyRiCMmcSfqFnUFpUDZAYrstKuTTF6B8kgXDsQ5DjIPwCt+lN
         0uVdF8ZiBlePHFS0q3XWvKOwdGaBKLlTYoLFeyeJy8bO2bAjmODLL1cQGWiyEJgH3Ypi
         RW7bj2Dtkek/pjQp+gQPSLVtGS9Cj4QUN81+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wYminRkg9mkT6EUmW2Uc8bvRNZ3c+J5In/yHFEJ6KlY=;
        b=NPTMeVblg/PWYokfI/M+aGvl8kvYtrTdJmgYssbSk31odVlu7npk7guP+iTkYiBRtH
         wjmxshAEIQtXW07qpZ2vSyPn+OtPYpZcQHFBRDXkCWBb2XOYzE9VKmo1C2iEhwIOSdFY
         fhXqm6UlJaZ0JX1UWxmBpWDMbUq/s5BLOjb78ScnShDMImZqC3y0+t3Zd2Gwr1DLnpJB
         1L8bBNHRX66crQgsuhErtVOZsgsJcHb0PPbapb+3VROSUBK8JosCQMXXNsHvDj99IA03
         TtVgHrDjq1KiJcBicZilmBhfYsfLAr9dFsFoq0LV48STOnqCmdiuBY+y+pUtKL5wRXjO
         SJeg==
X-Gm-Message-State: ANoB5pkTDsa9x3Ak57NFYVBQN69FtQDSwL99VVM0ngnu+QSWJ3whQAJj
	TofVlaam84HhGVKWS32OeEeoGA==
X-Google-Smtp-Source: AA0mqf4DLEPrsPDBaWxruYdgn29nclj96diAJMDuff9omICFw3mRO/u4/+/gi1TVG2NxWO0Vh63dAg==
X-Received: by 2002:a05:6214:123:b0:4c7:1608:666d with SMTP id w3-20020a056214012300b004c71608666dmr1217445qvs.17.1670437319390;
        Wed, 07 Dec 2022 10:21:59 -0800 (PST)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id u10-20020a05620a430a00b006fa9d101775sm17417876qko.33.2022.12.07.10.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Dec 2022 10:21:58 -0800 (PST)
Date: Wed, 7 Dec 2022 13:21:56 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Cc: tools@linux.kernel.org
Subject: Re: new: b4 send --reflect
Message-ID: <20221207182156.zbwmcdckoegef6lf@meerkat.local>
References: <20221206215340.556ov3bdfyf3qvyy@meerkat.local>
 <f8d14fd5-58e0-853d-64e0-72cc60e69629@tronnes.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f8d14fd5-58e0-853d-64e0-72cc60e69629@tronnes.org>

On Wed, Dec 07, 2022 at 05:39:40PM +0100, Noralf Trønnes wrote:
> Error from endpoint: This service only accepts patches

Stupidly, I never tested it with a single patch, always with a series.
Please try again.

-K
