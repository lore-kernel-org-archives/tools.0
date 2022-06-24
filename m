Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAAB73FDF
	for <tools@linux.kernel.org>; Fri, 24 Jun 2022 16:16:42 +0000 (UTC)
Received: by mail-qv1-f46.google.com with SMTP id t16so5295224qvh.1
        for <tools@linux.kernel.org>; Fri, 24 Jun 2022 09:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=rS7JsYaCWohSs0Si1pMKVmROHDbR/ZS2LHTkHMw86yk=;
        b=Dd1/qaEDHOAtzE3uTMjfXEaYGL0EQybZIyDYE6mWGT6KHAkekhR3Q36wMaZxsanpHh
         hnkLRh6d9ZinF2j/2eFqC9vT8sgp80jIwpJpbBJJHRBD7TURikQzzmYjKkpm2BJ8pU5T
         ePsHIL07ctsTj34qHerigBTacJpqQDbpLStlM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rS7JsYaCWohSs0Si1pMKVmROHDbR/ZS2LHTkHMw86yk=;
        b=rUPIEwlF+rrmeS4maTCr87mbljuymdyGEYgeymmcQJyMRcSLipBGWx0GTS1K1MXK5S
         a5PCPbwVAlR4m0RbrElIxVA/vOJ4RI+MjiMqmQWEr0nqGbMEOsKWBJtPrHSxDkU0dhcW
         e3lc09BJmucfR5Z5xuQNL4MnjQZNqu45pW1xD+j0DXWiPLkPkQMfup+XceXJxU72xjf9
         Xmo23ZlQJgxTMPv5kEfSOj0UnZ0iXSUWTox/XH7cYcJV7pyv6zG6NI7VPqa3zEOuQCEG
         yI5aOqNKuruw0G9PCNKXjVV12B5cnSjKlYwhQcweFjVbhmG2UJFR9V0avR2r5RSQyMqv
         zUhw==
X-Gm-Message-State: AJIora//o3nxW6O3uLGsusCnl0eEgLfMj5wyWXYeP5D1tNJvIij9XNwZ
	COKia7rzOSbfGIsMSLLXN0p8Vg==
X-Google-Smtp-Source: AGRyM1vOG9B8chUWu65YSLvFPAVVlSzUsJ3DaXEaye898UMhy4qDmcCyVw3rNY1FJQtK4a18OuKobQ==
X-Received: by 2002:ac8:5a92:0:b0:305:2ad4:7e0c with SMTP id c18-20020ac85a92000000b003052ad47e0cmr13145302qtc.57.1656087401495;
        Fri, 24 Jun 2022 09:16:41 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-245.dsl.bell.ca. [209.226.106.245])
        by smtp.gmail.com with ESMTPSA id r8-20020a05620a298800b006a99088cd99sm2399136qkp.6.2022.06.24.09.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jun 2022 09:16:40 -0700 (PDT)
Date: Fri, 24 Jun 2022 12:16:39 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Theodore Ts'o <tytso@mit.edu>, Jason Gunthorpe <jgg@ziepe.ca>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Linus Torvalds <torvalds@linuxfoundation.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>, tools@linux.kernel.org,
	users@linux.kernel.org
Subject: Re: b4-0.9.0 available
Message-ID: <20220624161639.y2edtlzmlmc4avkz@meerkat.local>
References: <20220621165953.z25hwos7gom6bp6s@meerkat.local>
 <YrIEnmt5vDMcbOiG@zx2c4.com>
 <20220621182953.p5asczznnz3pn6dl@meerkat.local>
 <YrIR2v7GdC3qIt2E@zx2c4.com>
 <YrI3W46GUS/Dap5J@ripper>
 <YrT4LIq6ssD1mhMQ@mit.edu>
 <20220624135147.GA23621@ziepe.ca>
 <YrXYaE12VFUDucsN@mit.edu>
 <20220624155213.4wfbnttowgom2sjz@meerkat.local>
 <97e001a22c33fd65b08445aaddba590ae438897b.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <97e001a22c33fd65b08445aaddba590ae438897b.camel@HansenPartnership.com>

On Fri, Jun 24, 2022 at 12:05:35PM -0400, James Bottomley wrote:
> On Fri, 2022-06-24 at 11:52 -0400, Konstantin Ryabitsev wrote:
> >    - submitters will be required to register their ed25519 patch
> > attestation key with the submission endpoint and cryptographically
> > sign their patches (email roundtrip confirmation required to
> > register).
> 
> Can we please be less pejorative about crypto choices?  ed25519 is a
> fine curve, but lots of crypto HSMs which do elliptic curve don't do
> Edwards signatures because they're very different from standard ECDSA
> signatures.  Those of us who take security seriously tend to use HSMs
> for all our private keys and thus won't do ed25519 if the HSM we use
> can't do it.

This will be only required on the web submission endpoint, and only to begin
with. Shelling out to call gpg or openssh from a web process is a lot more
hairy than checking ed25519 signatures using PyNaCl, which is the only
reason behind this restriction.

> I was under the impression b4 used gpg on the backend, which can do a
> variety of elliptic curves and now, bonus, can use a laptop TPM as the
> HSM to protect the keys (which means pretty much everyone has no excuse
> not to do hardware key protection)? (TPMs are one of the crypto devices
> that can't do Edwards signatures).

If you're not planning to use the web submission endpoint (and I expect that
anyone already using git-send-email will not be interested in the web
endpoint), you're certainly free to continue to use gpg.

-K
