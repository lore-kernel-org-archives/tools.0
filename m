Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C022C8B
	for <tools@linux.kernel.org>; Thu, 21 Oct 2021 20:45:02 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id v17so1749343qtp.1
        for <tools@linux.kernel.org>; Thu, 21 Oct 2021 13:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=XCGVoaLkMe3bA9rnf1MOhQYscd5DGHvDNP9y0BVBiAc=;
        b=iSlTtYGFVF034GvgSA+VTLun9ZSecRDBdjW2evv8J7iKUrt86xFTZDB9f7YGpcajTy
         dKo/EyhTmRrRDMSkHslM5IXPucS6RGcPst+cwnIwpStvTv4q+lZN6i5+fkwbhXiuK5gP
         xQqoqCDNh6DrXwh1w3LaTEEBERtMEvTeFITL4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=XCGVoaLkMe3bA9rnf1MOhQYscd5DGHvDNP9y0BVBiAc=;
        b=G51heAcRskz9mJIXDPb8VxEK6qzqJL5ATB2EtrtSowjSdj2Dtv/20Hwj4agswNlgR5
         AHCcNlaO1eIOar9gFrhJn9sNwllNCxn9VYC+ENXbt/ybr4CZnHtB71UVBk1guPrNLln2
         YUubxZw6vdqP6w9/K7rvUgmVwZxNA+3Bo6RYgaN3Ar5n+TODqTOYQG5ElIN+aPpRSLgd
         Cf6UzNf6beFVeZWjG/90eCluDfAK4IsttJ3X5wYXmwsC9N1zNrqz3LV+963Foe7J84co
         bBo8wMEmJ3SnB/ibPwf1WgWBuCX1nFPdbSajjzQ8meLBH9qb1C6q04ENOS+UAnM5t5ka
         dmqA==
X-Gm-Message-State: AOAM533EFROIhVhnepikahqxHZKMQxjz0gHQYNqNd7eeSCtWJJfdZdrP
	pdakZI8ZHo4fNmwCdB7CvBd76eiGMlI4Sw==
X-Google-Smtp-Source: ABdhPJxsaGUk2SsHa7oTp+0438S/w1f6Ppslr3WE7p8vCjaZCh/FxnpIa/ZazXl1NFJb5Xjg3RJZdQ==
X-Received: by 2002:ac8:7c46:: with SMTP id o6mr8608103qtv.197.1634849101806;
        Thu, 21 Oct 2021 13:45:01 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-32-216-209-220-181.dsl.bell.ca. [216.209.220.181])
        by smtp.gmail.com with ESMTPSA id t19sm2975107qtn.26.2021.10.21.13.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 13:45:01 -0700 (PDT)
Date: Thu, 21 Oct 2021 16:44:59 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Kees Cook <keescook@chromium.org>
Cc: tools@linux.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: injected body trailers
Message-ID: <20211021204459.xd63t5xn24vktqf3@meerkat.local>
References: <202110211313.B5C5C61@keescook>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <202110211313.B5C5C61@keescook>

On Thu, Oct 21, 2021 at 01:22:31PM -0700, Kees Cook wrote:
> Hi!
> 
> So, I just saw a DKIM failure, and it was entirely justified. :)
> 
> Grabbing thread from lore.kernel.org/all/20211021142516.1843042-1-ardb%40kernel.org/t.mbox.gz
> Checking for newer revisions on https://lore.kernel.org/all/
> Analyzing 1 messages in the thread
> Checking attestation on all messages, may take a moment...
> ---
>   ✓ [PATCH] ARM: stackprotector: prefer compiler for TLS based per-task protector
>     ✓ Signed: openpgp/ardb@kernel.org

You will notice that the openpgp signature passed. This is because we:

1. record the length of the original message when we're creating the signature
   (see l=2495 in X-Developer-Signature)
2. if the initial validation fails and the body is longer than l=2495, we trim
   the body to that number of bytes
3. if the trimmed validation passes, we use that version for the patch body
   content, since that's clearly what the developer intended

>     ✗ BADSIG: DKIM/kernel.org      
>     ✓ Signed: DKIM/lists.infradead.org (From: ardb@kernel.org)
> ---
> 
> This is https://lore.kernel.org/all/20211021142516.1843042-1-ardb@kernel.org/
> and for some reason, the linux-arm-kernel mailing list is injecting a
> body trailer.

"For some reason" is really "that's the default for mailman-2". Mailman-2
belongs to a wholly different era and *can* be configured to be DKIM
compliant, but rarely is.

> I just downloaded this directly and removed the trailer, and the DKIM
> passed. This experience has raise a few questions...
> 
> 1) Can (should) b4 grow logic to progressively strip lines off the end
>    of a body until DKIM passes?

Ah, but then the lists.infradead.org DKIM will fail. Theoretically, we should
always prioritize the signature that is closest aligned with the From: header,
but that's not actually that straightforward, as DNS lookup and validation
rules can get really complex.

> 2) Can the linux-arm-kernel mailing list please stop breaking DKIM?
>    Who should authorize this change (rmk, Catalin)? And who can make
>    the change (peterz)?

The relevant settings should be a) don't add any subject prefixes, b) don't
add anything to the body trailers, c) don't rewrite any other headers (to, cc,
reply-to, etc).

>    (I realize now that all the mail from linux-arm-kernel has been
>    getting dropped into my Spam folder -- I normally don't notice since
>    I'm usually CCed directly or via some other list on things I wanted
>    to see.)
> 
> 3) Are there other lists for which lore is collecting emails where DKIM
>    is persistently broken, and can we fix those lists too?

I would also note that lists.infradead.org should not really be adding its own
DKIM signature to messages it sends out. It doesn't really serve any purpose
unless the From: header is rewritten (but please don't do that either).

-K
