Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E429FAD26
	for <tools@linux.kernel.org>; Thu, 23 Feb 2023 21:18:18 +0000 (UTC)
Received: by mail-qv1-f46.google.com with SMTP id ne1so12248155qvb.9
        for <tools@linux.kernel.org>; Thu, 23 Feb 2023 13:18:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DHLLKjnxb2WbIxa2UokMwCgGwwvgNqwh1w3jLqPF2io=;
        b=NI1TRHQQEUc4a9IWTDvTXRR2pbyk+oUPBk99u8pKzY8vXEaJYXxrkYJipm+RcvwWj2
         ZdycLS5LKPMw+TJ6L1wLgzGEoTxVCOiMawsq0iE0IHRX4boFa1mjU/fVyBLHhic5nz3j
         k2OdYmHVFKt5vRQx3MaCssuWHtkMHUy6CBLQ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DHLLKjnxb2WbIxa2UokMwCgGwwvgNqwh1w3jLqPF2io=;
        b=e+PNKSblnf8vsVfDJwMHOlUKidi61V1X3YkPTkt6c97qVGWXK7WeP9dnVBzcS4d8OZ
         y4sWL6DHelO55vG00ztNyq0qwduCkSsGS6Q1bl0tGEDt5xvIihRo6lTI6r6oVMTwq9bW
         Fi0fAh+SmeqqepNoKCm2oW5MKOm7Ma0xVehlLEGFk+umEsUy7egRXGCZcduCfdUukm4Q
         enFnxAMutDdQPk4TkZWWo42Z+xKJ1dwcdW+HQwnCfecPMZFIy2WNE8/EW3MrfBllRtc6
         W9q/AhyBmDkqIniPbkdGX9kOrlaaqSLXbIM9u7r9OGFLJsUB6yndcM5bI2hUhuB/CBqY
         am3A==
X-Gm-Message-State: AO0yUKXY4dkrV5cuIJDKk9qli0dBdLpvWzW7mqr4Naie2TaTenwkiF58
	r169HEEbM/3EkPVaRF7dBAQYc5cTJ8g1Cacl
X-Google-Smtp-Source: AK7set+vmh+wDAmuOjBi9BWQqnKfNUwdhrQifay9fEGG8vb/sIIXMPGFlSfCDMvMhgN2QN3Q7rf3oA==
X-Received: by 2002:a05:6214:c8e:b0:56e:ba7e:35e0 with SMTP id r14-20020a0562140c8e00b0056eba7e35e0mr25289763qvr.48.1677187097678;
        Thu, 23 Feb 2023 13:18:17 -0800 (PST)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-7.dsl.bell.ca. [209.226.106.7])
        by smtp.gmail.com with ESMTPSA id j62-20020a37b941000000b0073baa5ec0besm3759904qkf.115.2023.02.23.13.18.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Feb 2023 13:18:17 -0800 (PST)
Date: Thu, 23 Feb 2023 16:18:15 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
Cc: "Kernel.org Tools" <tools@linux.kernel.org>
Subject: Re: [BUG] message header mangling on vger.kernel.org and
 lore.kernel.org
Message-ID: <20230223211815.3uzacmodoo5amfnu@meerkat.local>
References: <a997d239-2678-45bb-8f18-7780409a5013@t-8ch.de>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a997d239-2678-45bb-8f18-7780409a5013@t-8ch.de>

On Thu, Feb 23, 2023 at 08:56:45PM +0000, Thomas Weißschuh wrote:
> Hi,
> 
> I tried to "b4 shazam" one of my own patches from lore for which the
> DKIM check failed.
> Further investigation revelead what seems to be modifications of message
> headers by both vger.kernel.org and lore.kernel.org.
> As this affects DKIM-signed headers the validation fails.

This doesn't really have much to do with b4, it's just a known aspect of vger
-- it does not do "simple/simple". To make your mail setup work with vger, you
should change it to "relaxed/simple".

I go into reasons and details in this post:
https://lore.kernel.org/lkml/20211214150032.nioelgvmase7yyus@meerkat.local/

-K
