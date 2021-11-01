Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0CA62C80
	for <tools@linux.kernel.org>; Mon,  1 Nov 2021 20:22:23 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id bq14so6270649qkb.1
        for <tools@linux.kernel.org>; Mon, 01 Nov 2021 13:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=XKYwYIGZwg8PV40HcGh9nupJ42mZTYLzNOttvjw1nEQ=;
        b=QtZtkWAyIwR5drylX+3yXWhC9CnaEEqQbEzA/nIGOFaV5G5dUJFQqWxPJ2RIvakod6
         Mxdze9Ink5JUQfWKAvM3nnrQxsYFl5B6vsjPxrd99Z0CxJHutWcaHamVYwy28hO2T0Cy
         hxBaxpBIVEPGKr/mEVxDq5vqQEEE1kTeBHemQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=XKYwYIGZwg8PV40HcGh9nupJ42mZTYLzNOttvjw1nEQ=;
        b=sucf28hTbWcaEJZ7dgfVTxgRLCwmOVWShbEDoo+dfDcIuYEMr63yqbrrcvtQsBLp3M
         WxRraQib4CGlIInxr6fU3sV+ij3nY6OrWdw5KM5j7obqRSN+MJVe7mM2TOy6s61HXTat
         x9P5fHPk/sTxmVOf5BwECWPNa1HHKINcMZ/EIh9gMSjyYC4EtBZjGhdoF0YxI9mCa07Y
         jLycJRTIjiyWymceyAa0S3fSpRE3NEqG4YU1FEb0s0JN2gkf9hWD+FGNNuU65p6uBkVt
         nnTtEilBjYcN8dfrvTgckH9DelZx62kEodi072w7lVIDh6Hnc4YsR/1nWmFQskUi/Nm+
         uRaQ==
X-Gm-Message-State: AOAM533PzcFTiCv4rj+F8sDV624w2083AOuTLO3yr9cPz0MR/O659c/t
	dFW5A+ajizLKtv/NFuUCPKsZM0gXv/yIpA==
X-Google-Smtp-Source: ABdhPJwn5EbIODE1g1oUL2kfmkVLa6++BFG5679+QoOvH609tsPQcKEFuDv4WlMLdRcz33i2OxFmVg==
X-Received: by 2002:a05:620a:204c:: with SMTP id d12mr17637323qka.80.1635798142858;
        Mon, 01 Nov 2021 13:22:22 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-32-216-209-220-181.dsl.bell.ca. [216.209.220.181])
        by smtp.gmail.com with ESMTPSA id i6sm4042682qkn.14.2021.11.01.13.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Nov 2021 13:22:22 -0700 (PDT)
Date: Mon, 1 Nov 2021 16:22:20 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: =?utf-8?B?w4Z2YXIgQXJuZmrDtnLDsA==?= Bjarmason <avarab@gmail.com>
Cc: Eric Wong <e@80x24.org>, users@linux.kernel.org, tools@linux.kernel.org,
	git@vger.kernel.org
Subject: Re: b4: unicode control characters -- warn or remove?
Message-ID: <20211101202220.dlcebvckeoz6c26k@meerkat.local>
References: <20211101175020.5r4cwmy4qppi7dis@meerkat.local>
 <20211101190905.M853114@dcvr>
 <211101.86bl333als.gmgdl@evledraar.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <211101.86bl333als.gmgdl@evledraar.gmail.com>

On Mon, Nov 01, 2021 at 09:02:34PM +0100, Ævar Arnfjörð Bjarmason wrote:
> It checks whitespace because that's something that's commonly a source
> of patch corruption. I'm not adverse to adding this to core.whitespace,
> but trying to catch malicious injected code seems like a rather big
> expansion of its scope, particularly since:
> 
>     "[...]sending patches for docs actually written in RTL languages[...]"
> 
> Or just code? People write comment and even in their native languages,
> and not all projects are as anglo-centric as those hosted on kernel.org.

My comment about docs was purely within the scope of the Linux kernel.

I think the following would be a sane check:

1. are there unicode control characters (CCs) present?
2. are there other characters from RTL languages present in the same line?

if both 1 && 2 are true, this is a legitimate use of Unicode CCs. If only 1 is
true, then it's likely worth a warning.

Maybe even relax #2 to just check for unicode characters above a certain
barrier where RTL languages live. I think everyone will agree that if there
are unicode CCs and no other unicode characters in that same line, it's likely
not a legitimate use of control characters.

-K
