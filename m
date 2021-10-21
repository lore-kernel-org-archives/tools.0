Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B4F72
	for <tools@linux.kernel.org>; Thu, 21 Oct 2021 23:33:04 +0000 (UTC)
Received: by mail-qv1-f54.google.com with SMTP id o13so1444541qvm.4
        for <tools@linux.kernel.org>; Thu, 21 Oct 2021 16:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=zhMJubkycNYnC30RdNdPfSG2SUo8qFFaJD/oh9EUuIY=;
        b=EP45UDSv4pItB7b0jzylzAJI82KgIRZoWrJ8XgN/2HpcvKpRAZNa/ae59kL+b0CwE9
         Df7mVe6cjvwxrmMQtw0ajuDKq4HdFieMF/awOXhm3xX1tIJBvraN5CmHL9LnxqakriB8
         faG9b6v/7ryNmGAiN12s8WrR895pkYXAliV2I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=zhMJubkycNYnC30RdNdPfSG2SUo8qFFaJD/oh9EUuIY=;
        b=8DHa1zOQ6Mk5AGxB1ivLctxwDI97sSEM69xevdCtbd6/Eohpku4ozxXyJIGTGvO3CC
         qBXtL4Cbs17ROiO72JnbM0BWk3LGR3qJCCoaIhVr6E0Hw9mLOTRVRRZnhWYLHOmEAI2V
         cf/zmNUtuy43sNUzPkHPbdNYZ5OqXll0c2qu8ryifQlaCMUbai9Kc7fLOBTIw9uBnnUY
         81naXGAHxZtz5y/K5D22PPhNh4AaAyy0TQVyvFI+v2PaWjQG8jBTpc031ZgcbgjwF6j4
         VagkJsESefG4yOme7MjMOGBA+Y2pM9HC9Xc5fCiY7TTU8MnqNmsGcAbZs7gCfO/cq57G
         NegQ==
X-Gm-Message-State: AOAM533S2NluUvli/F+GTHL96h4V04G6eytaFCKjRBJW64HSw+CV2fJL
	HvrtbtwrT2xvgiyXnkJ96bqNfq0e4xE=
X-Google-Smtp-Source: ABdhPJxggmSf4IOmhpxhk7D1YDiT+U8+uxgHx4wwJ3dV5OHE90yt1ZVGL6sjejW8kbz2soUjBC6zCA==
X-Received: by 2002:a0c:80ec:: with SMTP id 99mr8047258qvb.53.1634859183899;
        Thu, 21 Oct 2021 16:33:03 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-32-216-209-220-181.dsl.bell.ca. [216.209.220.181])
        by smtp.gmail.com with ESMTPSA id b19sm1623612qtb.64.2021.10.21.16.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 16:33:03 -0700 (PDT)
Date: Thu, 21 Oct 2021 19:33:02 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Kees Cook <keescook@chromium.org>, tools@linux.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: injected body trailers
Message-ID: <20211021233302.f6jw676z47g3mv5e@meerkat.local>
References: <202110211313.B5C5C61@keescook>
 <20211021204459.xd63t5xn24vktqf3@meerkat.local>
 <7786271477279d4fbf9292db1f6aede8428eb00d.camel@infradead.org>
 <20211021225731.qril46obyaywoqhw@meerkat.local>
 <6e943c88546b6924f81c3bc7eff29d771d97018a.camel@infradead.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6e943c88546b6924f81c3bc7eff29d771d97018a.camel@infradead.org>

On Fri, Oct 22, 2021 at 12:00:43AM +0100, David Woodhouse wrote:
> > thus making any message I touch pass DMARC verification.
> 
> 
> Er… "thus making any message I *send* pass DMARC verification".
> 
> The Sender is the entity who sends the message. Who submits the message
> to the mail system for transport. The Sender in this case is Mailman,
> and the DKIM signature correctly passes verification.
> 
> All else is based on a fundamental misunderstanding of what the Sender:
> and From: headers actually mean.

David, I'm happy to argue whether this makes sense or not, but the fact of the
matter remains that DMARC specifically ignores the Sender: header, so any
email gateway performing DMARC validation will mark messages sent by
lists.infradead.org as failing the check. Unfortunately, anti-phishing
policies at many companies increasingly quarantine or reject messages failing
DMARC verification, so DMARC non-compliant mail will be increasingly not
received by list subscribers.

DMARC and mailing lists are not mutually incompatible, but to make it work
correctly the list operators must either not touch the message bodies and any
pre-existing headers, or rewrite From: to be coming from the mailing list
domain. In the context of patches, I would strongly argue that the former is
the only reasonable solution.

-K
