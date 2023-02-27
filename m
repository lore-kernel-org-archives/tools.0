Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A55279EF
	for <tools@linux.kernel.org>; Mon, 27 Feb 2023 18:48:58 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id r5so7818489qtp.4
        for <tools@linux.kernel.org>; Mon, 27 Feb 2023 10:48:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XzkrdTkWDakhnTRTMC/BlOfEtpV1sHuRvkeYzb1Jc9s=;
        b=b0aURzIADsvRH/G1HyYYlXsDN2R1Ue68a10kIugjtZJxYSsDmYdZFn9qd0IHwk8Vcd
         MIVn/bVELV0BmOIfjqyrFvkqZZIYGdxrtnmjKEpYMQSvN3iltNj4wMj/0zUtbuP7ZcgA
         E57lz56H8TXDMqitBkoxOzKMFmH+BU/FUK8VM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XzkrdTkWDakhnTRTMC/BlOfEtpV1sHuRvkeYzb1Jc9s=;
        b=Vn8aUsLPaNUkNhHTv/VhmSpyiik8FEmh9hlbeSwcdlxnnr0Sn+nAOV1DAPoy8qqjYP
         /dLlbexfAAwjt6NVDe8P+Bg7GKehXBD5G1SqoJZiiVu8jjrVftwpOxMHyvgzGbSiB/2Q
         PjRC/QaxkU0v0e6NBoEOKxoPBfwOQiFwu1eAu9iULUiPL4CWU2yZMDxTx1XReiwqoaqM
         V0nhkBzZN6sf6i3kJHbnCdv1Jcji+pzR23tPEACvA5DKVYYC5BviiBVMmM9vnZtsHSb3
         RMhHD1tJva7DrQ4KI9+LHpX//bet4tCdeqEtkC6R7Jsu2jqe68wvaQZvBW0DIlf/5mbg
         /OEQ==
X-Gm-Message-State: AO0yUKVYEuEoUaYtbR/ta8xtseBACLvoE7h/hpVQb+l3GNGnkBebBa3S
	5HZwxiRGKEggWC1XLllWQbcU21VV2HUP1R6Q
X-Google-Smtp-Source: AK7set8Dsuvl0vQA36ws6UzLzFuZPx9NgfvqLUVJwU8sTGhyXZqc9PCedcjJyU995ebCz7BqwFk5GQ==
X-Received: by 2002:ac8:7d01:0:b0:3bf:a461:e6f0 with SMTP id g1-20020ac87d01000000b003bfa461e6f0mr433612qtb.31.1677523737954;
        Mon, 27 Feb 2023 10:48:57 -0800 (PST)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-7.dsl.bell.ca. [209.226.106.7])
        by smtp.gmail.com with ESMTPSA id i13-20020ac813cd000000b003bfb5fd72a7sm5016445qtj.86.2023.02.27.10.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 10:48:56 -0800 (PST)
Date: Mon, 27 Feb 2023 13:48:55 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: tools@linux.kernel.org
Subject: Re: [PATCH] shazam: Add the --add-message-id argument
Message-ID: <20230227184855.kkwdcweahglujppo@meerkat.local>
References: <20230216164841.3356-1-palmer@rivosinc.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230216164841.3356-1-palmer@rivosinc.com>

On Thu, Feb 16, 2023 at 08:48:41AM -0800, Palmer Dabbelt wrote:
> Some projects (at least QEMU) want Message-ID headers instead of Link
> headers.  I couldn't find an easy way to do that, so this just adds an
> argument to shazam that mirrors "--add-link" but adds a MessageID
> instead.

I'd like to go a slightly different way about it. We already have a
"b4.linkmask" parameter, so I suggest we also add "b4.linktrailer", such as
you can specify:

    [b4]
        linktrailer = Message-ID
        linkmask = <%s>

This would additionally allow someone to differentiate Link trailers that
point at code-review links vs. any other links.

Does that sound like a potential alternative to creating another runtime flag?

-K
