Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E4D3FD5
	for <tools@linux.kernel.org>; Thu, 30 Sep 2021 23:43:00 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id e7so7798280pgk.2
        for <tools@linux.kernel.org>; Thu, 30 Sep 2021 16:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=u3kZlcSJCY8A2wrGr/+yQITloGPgL4d/3a/W5zaIw/w=;
        b=QSLJ96UFadiOnA0aTiDD6qEaamqavGIGcIfYr+4cQ9B6y9+C+U5k0EB5qwhtgXS38Y
         eA1AfQwf5CRJjMGaIjBiyYucsx8wtK4Y77PyS8MH3TbHCXpdkfzCDtXHEdCAtiMWaRgH
         q3oqKcR3yGSKLU42f1MpuYYnAT1GHErvafIis=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=u3kZlcSJCY8A2wrGr/+yQITloGPgL4d/3a/W5zaIw/w=;
        b=g4y2pzlzmVVA690s6TjQtxHDigt/0CSvuqZI9fR80JvamPw7+CodjlhrvxUsjrapEh
         TBM85Ksc0iNkWscJ0G1Bf2lHDTHtkPXPcpYZIA5WPTWM66XGz5AqGlEw1+sbE5fMXE8o
         8bZTOlCD8oFDobG9ScTq5W3BEfWcNb4b9Q1445unWyEPUizCF+W0L0XiklUk4JP7ybti
         rwkh1RnRlOdiiIwBbY/xQGE1S6s+AhuJNDfnpdC2a8TjmdneePBaDADRr1TwV29fxgsU
         bWia8BDI5d584SsX56mylNEBzfW3UFD2mc1gWZJP24v4V+T6vY3OkGgIvm+pbERDhVcB
         CIug==
X-Gm-Message-State: AOAM532t8NwQ3GbrU01tY00WhaN5FizoWw2ekYoFmlW9IXahaobleaxC
	pk+GueK9AILR9a7CfadLRWuN1w==
X-Google-Smtp-Source: ABdhPJyMsGVDoDgaxgbLm2ky6NHpXsId4uP0aUf+Qleyn5yklGmXJUxT0sS591Rqu+HUtBlnVWZK8Q==
X-Received: by 2002:aa7:93ba:0:b0:44c:f4d:de2e with SMTP id x26-20020aa793ba000000b0044c0f4dde2emr1993723pff.44.1633045380216;
        Thu, 30 Sep 2021 16:43:00 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id p21sm5948005pjo.26.2021.09.30.16.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Sep 2021 16:42:59 -0700 (PDT)
Date: Thu, 30 Sep 2021 16:42:58 -0700
From: Kees Cook <keescook@chromium.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	tools@linux.kernel.org, users@linux.kernel.org
Subject: Re: merging pull requests
Message-ID: <202109301630.C2646F8B5@keescook>
References: <202109301023.B78ABE54B@keescook>
 <20210930200002.67vxbowvegso2zhg@meerkat.local>
 <202109301559.A9BFB03@keescook>
 <20211001092914.4738513b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211001092914.4738513b@canb.auug.org.au>

On Fri, Oct 01, 2021 at 09:29:14AM +1000, Stephen Rothwell wrote:
> Hi Kees,
> 
> On Thu, 30 Sep 2021 16:09:13 -0700 Kees Cook <keescook@chromium.org> wrote:
> >
> > I guess it depends on the expected order of operations. What do other
> > maintainers do to process a PR? I would think it would be:
> > 
> > - pull remote branch (to FETCH_HEAD)
> > - review (in FETCH_HEAD? in a "real" branch?)
> 
> Our workflow usually requires that all patches are posted to an
> appropriate mailing list for review.  If the developer then also has a
> git branch/tag containing the patch series (after updating for
> Reviewed-bys etc) then that is a separate issue and (probably) requires
> a level of trust on the part of the maintainer (or a recheck) that the
> patches have not been changed since the final review.

Right, that's why I'm such a huge fan of "b4" (and patatt). It makes the
integrity chain very easy to maintain. (Though see my P.S. below...)

> > - merge into my topic branch (where the commit subject should retain details
> >   of the pull location, body has notes from the signed tag, etc...)
> > - review, build, and test
> 
> "rinse and repeat" :-)

Indeed. :)

-Kees

P.S.

The only "hole" I see with the integrity checking is that since only tags
or mbox headers are signed, and those aren't part of the merge, there
isn't a easy way that I see to follow the integrity chain for a given
resulting tree. (Which is technically different from the "trust" chain.)

For example, for stuff going into my tree:
- If it's from an mbox, I can easily check that the patches haven't changed
  in flight when the author used b4/patatt to wrap the email delivery.
- If it's from a remote tag, I can check the tag signature.
This is all fine.

Now I publish my tree, and sign a tag for it for a pull request. Whoever
does that pull can only check my tag and has to trust I checked what
went into my tree. At the end of the day, that's exactly what the
tag signature is for: whoever is pulling must trust the PR sender for
all kinds of reasons. But there isn't a way to mechanically perform an
integrity check on the components of those results: the merged mbox with
the signature headers or the remote tag signature aren't associated
with the resulting branch any more.

But given that maintainers may tweak what was sent to them or squash
fixes, there's likely no point in that kind of integrity chain...

-- 
Kees Cook
