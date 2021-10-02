Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13833FDF
	for <tools@linux.kernel.org>; Sat,  2 Oct 2021 00:17:41 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id m26so9326814pff.3
        for <tools@linux.kernel.org>; Fri, 01 Oct 2021 17:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=mA6tv4hN+WmKcoMC//ZQm7EuLxj/UqjWn3cNwHuFJH4=;
        b=FsLAJaIxcnuCqXRVAnoL+jW17eqTUsEi5KXLQ9sg+XZexqkzkxMkSRHtlV+HEg4uDz
         VIFpCpvd5nwnjPnGYLNIEOBv/GwZPP+Eq0LlKr4hAA56/xm2nYhk5EcJ91AqWUkY3Hep
         TzoXnk2FC/ZR4KhcHEZ/enFHp+Nwm5KrkptlY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mA6tv4hN+WmKcoMC//ZQm7EuLxj/UqjWn3cNwHuFJH4=;
        b=g15LB3ZVAw/+Hu2x/n+HgzBD/4NJWwlEHg60btEyog7FgWaFXslisM2TTAk1Kmzszt
         34gMoqcTUjMHXhFGS1Vq/IpXHerxZwF9Ju0QULbcGycGNIVGOb2t4Ls0jSXOcexLIRfc
         iulSrniSwIDeB9FwyeXnqZKtw2yG4NjzbNg8IMFtfA6xb5RkW3ORyON4ZqeGLYGH0ZTQ
         M1myKD0l7bBFO1Fw46IsM0NXeMab5eQ2R6Vvzs4kFsdAHIXLrJn9J6iUog5QK6jHSkk5
         xs6yNsaS2yJbCrb838Pfdj4XAGbn7BLTYzU7nkxM1YSGsHV1Qz65DjvTiwxuHKMFywhE
         9cUg==
X-Gm-Message-State: AOAM533pQRHBEPP1HixI1oDecuG/PXfON/70rDH2teSuZ+yCgyOnoMfx
	4lHev0AGJb7iPZINEnloBgMXhw==
X-Google-Smtp-Source: ABdhPJz1HrOCCq8hoCOIuLvU4NKSvbCjJz+3oknCCmZa14EuPzT9t5tj/8EHaBDFqOgKTtfpFFqivA==
X-Received: by 2002:a63:e10d:: with SMTP id z13mr714874pgh.375.1633133861518;
        Fri, 01 Oct 2021 17:17:41 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id q20sm7377838pfc.57.2021.10.01.17.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 17:17:41 -0700 (PDT)
Date: Fri, 1 Oct 2021 17:17:40 -0700
From: Kees Cook <keescook@chromium.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	tools@linux.kernel.org, users@linux.kernel.org
Subject: Re: merging pull requests
Message-ID: <202110011715.BF8857DD@keescook>
References: <202109301023.B78ABE54B@keescook>
 <20210930200002.67vxbowvegso2zhg@meerkat.local>
 <202109301559.A9BFB03@keescook>
 <20211001092914.4738513b@canb.auug.org.au>
 <202109301630.C2646F8B5@keescook>
 <cef357f1ee179c8250fa1507eea7fe39e6ee2e78.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cef357f1ee179c8250fa1507eea7fe39e6ee2e78.camel@HansenPartnership.com>

On Fri, Oct 01, 2021 at 10:07:05AM -0700, James Bottomley wrote:
> > [...]
> > But given that maintainers may tweak what was sent to them or squash
> > fixes, there's likely no point in that kind of integrity chain...
> 
> Well, I think you need to re-examine what it is we're attesting to
> cryptographically.  We already have an attestation process, it's called
> the Signed-off-by: chain.  The DCO is very specific, either: it's your
> contribution; a contribution with attribution you modified or it's an
> unmodified contribution from another.  This is the base level of legal
> attestation the maintainers do and which we're very careful to get
> right.  If you want to try and express this crytpographically, that's
> fine, but it must match the workflow we currently use.

Right -- I had digressed off into integrity land. The personal trust and
forensics part has been covered for a long time. I've been thinking more
about "in flight" integrity, which is what things like patatt nail down.

-- 
Kees Cook
