Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D492C8B
	for <tools@linux.kernel.org>; Thu, 21 Oct 2021 21:21:05 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id u6so1326517ple.2
        for <tools@linux.kernel.org>; Thu, 21 Oct 2021 14:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=v9QQLzKt4yZ8P337U+h9dl1OcG8b46xjHFaG5/v2mQo=;
        b=fZ7T4gPFEIF6hbuC3di3x43+H/BUUZYkb8NDKsgPg6yQtGrhYwA3YSkjDKyQu7Ur0B
         aT3XUd5diq5E30tDZ29Bp2WVdWMM5pRlc2jwo24r0MDT1URwlZ+sJTYDQvm/KGGP5VWY
         WzHu+bD5fh80S+COPPMzu3FyONDTn9vhqd9t0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=v9QQLzKt4yZ8P337U+h9dl1OcG8b46xjHFaG5/v2mQo=;
        b=nr1qb+LFDoUvTdPIU5tH/pH7DLZZc2MHy3yKlrpdjpP9NdXOJB9RKEcq4yS5jCj6gZ
         zISvpETSAoxr4DTsWb6b8ivk0hQNT3ADnxWyjA7Bo19+3R5FL8eMQkYcZ53NG+rAOgtY
         32AnbQ7bUJAqr4bs/+XN4G4ObMY3yuLjZzg9F022DI72DEgdaF0V8+ODIi/AAT+LSIdz
         u9HaDVjEpWQt0Ii14GKv3dmf03kVaqbBgfjtufL/R2oax+wiTKEu2XKTtwvhefgeqb2Z
         +6GUkLMuPxWcsZxKvLlb4Q0E5vtHpICM1cQChzNIFR0btuGsMsv6PeDsTtMFS2vAtECU
         6toA==
X-Gm-Message-State: AOAM531P4JCsRO8Hi6bZGkHaTOyvpBZwL1u3rxm7oODwyEERzFsDalLb
	H1Bh7XN7kp51LmQRNgEPG4UTkA==
X-Google-Smtp-Source: ABdhPJz7/jfQHZUKtWpM3Cr5U0qQ2CfRlw3yormPIrKpj4MAuZ9iyblcVap3GRN6UV+zOuLpXy1w4A==
X-Received: by 2002:a17:903:32c7:b0:13e:ea76:f8cb with SMTP id i7-20020a17090332c700b0013eea76f8cbmr7416949plr.74.1634851265222;
        Thu, 21 Oct 2021 14:21:05 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id w185sm6960632pfb.38.2021.10.21.14.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 14:21:04 -0700 (PDT)
Date: Thu, 21 Oct 2021 14:21:04 -0700
From: Kees Cook <keescook@chromium.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	Russell King <rmk+kernel@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Peter Zijlstra <peterz@infradead.org>
Cc: tools@linux.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: injected body trailers
Message-ID: <202110211414.00C7DFE8@keescook>
References: <202110211313.B5C5C61@keescook>
 <20211021204459.xd63t5xn24vktqf3@meerkat.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211021204459.xd63t5xn24vktqf3@meerkat.local>

On Thu, Oct 21, 2021 at 04:44:59PM -0400, Konstantin Ryabitsev wrote:
> On Thu, Oct 21, 2021 at 01:22:31PM -0700, Kees Cook wrote:
> > Hi!
> > 
> > So, I just saw a DKIM failure, and it was entirely justified. :)
> > 
> > Grabbing thread from lore.kernel.org/all/20211021142516.1843042-1-ardb%40kernel.org/t.mbox.gz
> > Checking for newer revisions on https://lore.kernel.org/all/
> > Analyzing 1 messages in the thread
> > Checking attestation on all messages, may take a moment...
> > ---
> >   ✓ [PATCH] ARM: stackprotector: prefer compiler for TLS based per-task protector
> >     ✓ Signed: openpgp/ardb@kernel.org
> 
> You will notice that the openpgp signature passed. This is because we:
> 
> 1. record the length of the original message when we're creating the signature
>    (see l=2495 in X-Developer-Signature)
> 2. if the initial validation fails and the body is longer than l=2495, we trim
>    the body to that number of bytes
> 3. if the trimmed validation passes, we use that version for the patch body
>    content, since that's clearly what the developer intended

I suspected something like this was happening to make that one pass.
Nice.

> 
> >     ✗ BADSIG: DKIM/kernel.org      
> >     ✓ Signed: DKIM/lists.infradead.org (From: ardb@kernel.org)
> > ---
> > 
> > This is https://lore.kernel.org/all/20211021142516.1843042-1-ardb@kernel.org/
> > and for some reason, the linux-arm-kernel mailing list is injecting a
> > body trailer.
> 
> "For some reason" is really "that's the default for mailman-2". Mailman-2
> belongs to a wholly different era and *can* be configured to be DKIM
> compliant, but rarely is.
> 
> > I just downloaded this directly and removed the trailer, and the DKIM
> > passed. This experience has raise a few questions...
> > 
> > 1) Can (should) b4 grow logic to progressively strip lines off the end
> >    of a body until DKIM passes?
> 
> Ah, but then the lists.infradead.org DKIM will fail. Theoretically, we should
> always prioritize the signature that is closest aligned with the From: header,
> but that's not actually that straightforward, as DNS lookup and validation
> rules can get really complex.

Could each signature validation independently process the body, with
the smallest signed body being what is "produced"? i.e. GPG already
self-trims. DKIM could do the same, trying to find a matching body i.e. on
failure (slow path), trying trimming up to 10(?) lines progressively
looking for a match?

(Probably better is to just fix the mailing lists, but maybe this would
be useful for historical patch extraction? Dunno.)

> 
> > 2) Can the linux-arm-kernel mailing list please stop breaking DKIM?
> >    Who should authorize this change (rmk, Catalin)? And who can make
> >    the change (peterz)?
> 
> The relevant settings should be a) don't add any subject prefixes, b) don't
> add anything to the body trailers, c) don't rewrite any other headers (to, cc,
> reply-to, etc).

rmk, Catalin, Peter, can this get sorted out? Having mailing list
trailers is annoying beyond just DKIM breakage. :)

> 
> >    (I realize now that all the mail from linux-arm-kernel has been
> >    getting dropped into my Spam folder -- I normally don't notice since
> >    I'm usually CCed directly or via some other list on things I wanted
> >    to see.)
> > 
> > 3) Are there other lists for which lore is collecting emails where DKIM
> >    is persistently broken, and can we fix those lists too?
> 
> I would also note that lists.infradead.org should not really be adding its own
> DKIM signature to messages it sends out. It doesn't really serve any purpose
> unless the From: header is rewritten (but please don't do that either).

-Kees

-- 
Kees Cook
