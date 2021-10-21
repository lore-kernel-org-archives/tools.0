Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448FC72
	for <tools@linux.kernel.org>; Thu, 21 Oct 2021 22:57:34 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id g20so3110817qka.1
        for <tools@linux.kernel.org>; Thu, 21 Oct 2021 15:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6zsYSHaX3Rn1myrNn9kPr/4NG6vITikITKqlicR6+ng=;
        b=WzUalZ/leiYo5KFzgz2TyGz68/0zZaabC2tn+LhqeJbj/jzTY+BBaVPICoxO3WbwPB
         g5oqczcKB01+dECfd/jcRsUhmDwXEr61NK2K8pTawNw8pw1C/sg0jM1lDe9odT2QzVAQ
         HbcaogVoOYItv4v7I0G9tvYRqA2I7phAf3Gos=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6zsYSHaX3Rn1myrNn9kPr/4NG6vITikITKqlicR6+ng=;
        b=jjFLwNnL2bvx9oEeIjlX5LaFKXjd0X17hc7fayhE5ctIgE91h8yub3I4CThLntWEqh
         HsheKyOTuEGTysw+D0YtwB6qF5NZENdTuQNuXf5gDzTSwkBcHGawH/mPZLnyg0zYKcvs
         qPLFQJU8uxXpuwq8q3I+UhEEi4MOkAXFFgy/dcY4VH2hvDLquH0sUI/S31TldauA4epa
         Q/ER3J04b0Xw2JEQArWllvYS5jLWaR3WaEqG2PG0eeJWTOX2c9kdc5G8jUQhJjwCQbVz
         pzPxapr72RxKNtmSceex7WwsvtnNI1IiJK9hVP8hJjF3H2Ban9mR154b5KvQnv9/Cuuc
         FLUA==
X-Gm-Message-State: AOAM5303PJtwi3+/V4tbpjkVo4XHKiBEzFxLmewkIweRpDhQmAbbkc54
	UZ+3uQBO1kp0Ar1BmT05kfnfSQ==
X-Google-Smtp-Source: ABdhPJzVk1IjPgtzWZyvGG/HfrPb/pw4VCYEB/09eugJLKpy0M2iwaYGQY/9EXMfQqycKpUmptHEBQ==
X-Received: by 2002:a37:9404:: with SMTP id w4mr6843769qkd.469.1634857053106;
        Thu, 21 Oct 2021 15:57:33 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-32-216-209-220-181.dsl.bell.ca. [216.209.220.181])
        by smtp.gmail.com with ESMTPSA id bm25sm3530266qkb.4.2021.10.21.15.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 15:57:32 -0700 (PDT)
Date: Thu, 21 Oct 2021 18:57:31 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Kees Cook <keescook@chromium.org>, tools@linux.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: injected body trailers
Message-ID: <20211021225731.qril46obyaywoqhw@meerkat.local>
References: <202110211313.B5C5C61@keescook>
 <20211021204459.xd63t5xn24vktqf3@meerkat.local>
 <7786271477279d4fbf9292db1f6aede8428eb00d.camel@infradead.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7786271477279d4fbf9292db1f6aede8428eb00d.camel@infradead.org>

On Thu, Oct 21, 2021 at 10:42:46PM +0100, David Woodhouse wrote:
> > >    (I realize now that all the mail from linux-arm-kernel has been
> > >    getting dropped into my Spam folder -- I normally don't notice since
> > >    I'm usually CCed directly or via some other list on things I wanted
> > >    to see.)
> > > 
> > > 3) Are there other lists for which lore is collecting emails where DKIM
> > >    is persistently broken, and can we fix those lists too?
> > 
> > I would also note that lists.infradead.org should not really be adding its own
> > DKIM signature to messages it sends out. It doesn't really serve any purpose
> > unless the From: header is rewritten (but please don't do that either).
> 
> No, it matches the Sender: header, which is the entity that actually
> submitted the mail to the system (as opposed to the possibly multiple
> entities listed in the From: header, which are merely authors of the
> message).

I know that's how it was envisioned to work (it's in the DKIM RFC as
recommendation for mailing list operators), but this didn't make it into the
DMARC standard -- DMARC intentionally ignores the Sender: header and will
*always* look at the From: header when performing DKIM validation.
(https://datatracker.ietf.org/doc/html/rfc7489#appendix-A.3)

It was a bad idea in the first place, if you think about it. I can take any
message, add a Sender: header for the domain that I control and force the
validating system to check the DKIM-Signature header that I injected instead
of the signature from the originating domain, thus making any message I touch
pass DMARC verification.

So, I have to double-down on my statement that adding a lists.infradead.org
DKIM signature doesn't actually serve any purpose, at least not when it comes
to appeasing DMARC filters.

-K
