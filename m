Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3C033C1
	for <tools@linux.kernel.org>; Fri, 24 Jun 2022 15:52:16 +0000 (UTC)
Received: by mail-qv1-f48.google.com with SMTP id 88so5116951qva.9
        for <tools@linux.kernel.org>; Fri, 24 Jun 2022 08:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=B8iIAEv4gEKgHQYQ52uFdXZII2+KlJh0cKnLgbKSMdE=;
        b=YDjZa5msem7XzFuCslq6rCWvidAwpSRd72SHIJ9a0QiSmmkiJxlq9Er4JgRtmhPT0a
         TMaT9eJBXb4Qjo1eagTHN2I0RoGrqDCBfexjXs4Zy3nKQ28ibsGV/IeFMslkPJ92aJD9
         kP92mzRSGrKm2K+QyK2n2f7jT8bIdOwY9NhGI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=B8iIAEv4gEKgHQYQ52uFdXZII2+KlJh0cKnLgbKSMdE=;
        b=0vkJCoGT6DNkfUHwoPn7kSkcBgLW//qkKqm3h8u3XcCBGJcZTGGWUw7vdRrj2xomM7
         9P3VSFMpfxcqWAd2uyitMzWQo3gQB2geVlaS4nZaT2iI7686KvSNwBtmN+6R/OkhI7I/
         7g57VEtK56PPDCIsJ9SV5dJ6y+OrLR67lXzG204pIMtLgatiDe9RkmE613G8m/9XKiXV
         EGZMZKM3jQT09NsggMrPczo731f2aPBBsqcHNAYd9ZGNJx/aruKsH98rmagC0jz5TTmT
         XjFZFeLPH2fyOuii/aOVBCVYjjESxCJ4ktmuStlkgujMZpJFbDPrgTNiayQoq4XXnPra
         AiPg==
X-Gm-Message-State: AJIora/6CDtSV4HrIc6zePigjCUVlVjmwWjaLPdDA2FaX/MkWt0ZQFKc
	evRmAFD10ZYzis33WGe3/PXJLg==
X-Google-Smtp-Source: AGRyM1voHaotET9k3TTgoSm1lf582ewdJGav/z89pf5BsFTGjfN4kgVbi3ynJc3HFKip1UsSVghfUw==
X-Received: by 2002:a05:622a:1a1a:b0:315:9960:2dde with SMTP id f26-20020a05622a1a1a00b0031599602ddemr13624100qtb.99.1656085935338;
        Fri, 24 Jun 2022 08:52:15 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-245.dsl.bell.ca. [209.226.106.245])
        by smtp.gmail.com with ESMTPSA id h16-20020a05620a401000b006a6a7b4e7besm2455867qko.109.2022.06.24.08.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jun 2022 08:52:14 -0700 (PDT)
Date: Fri, 24 Jun 2022 11:52:13 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Theodore Ts'o <tytso@mit.edu>
Cc: Jason Gunthorpe <jgg@ziepe.ca>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Linus Torvalds <torvalds@linuxfoundation.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>, tools@linux.kernel.org,
	users@linux.kernel.org
Subject: Re: b4-0.9.0 available
Message-ID: <20220624155213.4wfbnttowgom2sjz@meerkat.local>
References: <CAHk-=wiQzp+aurcmj15=LAa2ntvRZH0Ee2dn-PLjcFpmRE6Jcw@mail.gmail.com>
 <CAHmME9p+zRErOsvA1zC=kTHtpYD_sGjFxVsj0pMwteAp4dCdjQ@mail.gmail.com>
 <20220621165953.z25hwos7gom6bp6s@meerkat.local>
 <YrIEnmt5vDMcbOiG@zx2c4.com>
 <20220621182953.p5asczznnz3pn6dl@meerkat.local>
 <YrIR2v7GdC3qIt2E@zx2c4.com>
 <YrI3W46GUS/Dap5J@ripper>
 <YrT4LIq6ssD1mhMQ@mit.edu>
 <20220624135147.GA23621@ziepe.ca>
 <YrXYaE12VFUDucsN@mit.edu>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YrXYaE12VFUDucsN@mit.edu>

On Fri, Jun 24, 2022 at 11:29:44AM -0400, Theodore Ts'o wrote:
> It would be great if we had some kind of tooling where when someone
> sends a new version of the patch series, the tooling opened an editor
> and allowed the submitted to enter a quick changelog of what changed
> between the v25 and v26 version of the patch, with an option to also
> edit the body of the cover letter.  And then then when the patch is
> sent via e-mail, all of this would be appended to the cummulative
> version of the cover letter.

This feature is in-flight for "b4 submit". I wrote about it here:
https://lore.kernel.org/git/20211217183942.npvkb3ajnx6p5cbp@meerkat.local/

Here's the relevant part, slightly updated with the latest info:

1. b4 submit --new: this will create a new tracking branch and define
   some metadata to go with it, such as a cover letter template. The cover
   letter can be edited using `b4 submit --edit-cover` at any time.

2. b4 submit --send: will generate a patch series from any commits created
   from the topical branch fork point and use the cover letter from the
   previous step. It will be able to send the patches using the traditional
   SMTP way, OR it will allow using a web-based submission service that will
   eventually be set up at kernel.org:

   - submitters will be required to register their ed25519 patch attestation
     key with the submission endpoint and cryptographically sign their
     patches (email roundtrip confirmation required to register).
   - on the receiving end, the patches will be written to a dedicated
     lore.kernel.org feed *as-is*, but also sent to the recipients after doing
     the usual From/Reply-To substitution and moving the original From into
     the in-body git headers (this is required for DMARC validation).

3. b4 submit will properly include base-commit information to all submitted
   patches, as well as a unique change-id trailer (but in the basement of the
   cover letter, not in the commit message trailers as Gerrit does).

4. b4 submit --sync: will retrieve any received code review trailers
   (reviewed-by, acked-by, etc) and amend the corresponding commits in the
   topical branch, assuming we can match patch-id's (I've not tackled this
   yet, so I may be unduly optimistic here).

5. b4 submit --reroll: will prepare a v2 (v3, v4) of the series, reusing the
   same change-id trailer and adding a templated "Changes in v2" entry to the
   cover letter (that must be edited before --send works again).

6. b4 submit --send: will send the new version of the series.

I'm hoping that this will improve the experience of patch submitters *and*
help ensure that CI can be incorporated into the process by streamlining the
submission procedure and providing a public-inbox feed that can be easily
monitored. The important goal is to keep development fully decentralized so
that even if the web submission endpoint provided by kernel.org becomes
unavailable, plain old SMTP submission mechanisms can still be used as a
fallback.

-K
