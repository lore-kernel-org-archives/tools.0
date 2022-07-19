Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E4BC3C28
	for <tools@linux.kernel.org>; Tue, 19 Jul 2022 16:07:12 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id l2so11449105qvt.2
        for <tools@linux.kernel.org>; Tue, 19 Jul 2022 09:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=2U2ZUB1fEvIk1Q4/j7VzEEDuwh+308dPjtcO75/97gA=;
        b=hl0kMaVfW+pPqCCYwtB/Ua4kF9lEO/+quLf/hxHcXFsoAZKmG3tyra3iHSUiRxpGey
         q+qT5YLnGX9MSVBXoDCVKucQWhBynwvBMU232zSDRgG7mgw0a/aj/nj12Iq8+Q9DZalb
         g1ByomYwI445GHqnH648tW6PvVDCdlxt4bspY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2U2ZUB1fEvIk1Q4/j7VzEEDuwh+308dPjtcO75/97gA=;
        b=sDwXvuVEbeiPTpKc2uSOSsbQbJ5joYrnGV5m8fmCte5ru5Ew6bghFX8ApVvQ8h4I0r
         uZ3vXtD+FurLRqHRVa90yRKevlc8MMwnGR/XKgRpBaOZyot146NUYRek6PIC8/AjlaQG
         UvZ4wZu55aUjzXo0XGIRjF/3BCI5wYq1igA36dRJEO4sx/pEtUarVFnegZVtgGyzzG7l
         FCJHC2nKjUoyPTAXsERVv0qOUtYxEni5VqgvjN4Hwr/FJu6TIuSsZz2oCk5r0CCefYni
         /wjK6rlJJYl4Ev+pSrMH0l+k/+oBBm8rRBem+xjznsURvdG8thx5O2Mf1BxZ48TuraZU
         j3Kg==
X-Gm-Message-State: AJIora+wBDgTzaHdWGQhJXSbHvaUQPJXz4rpLI1q1ksFjx0clyO/jkmn
	xtbAojCqZ17TtzowcApujDdtpQ==
X-Google-Smtp-Source: AGRyM1v2V9dO4AO9jm86D2+Nz2LGzcjMhUxORFfbQVQw8MAAjrLH895bAlf0k3ptcZbRwpue9dMlnA==
X-Received: by 2002:a05:6214:21e1:b0:473:856d:8f6c with SMTP id p1-20020a05621421e100b00473856d8f6cmr25715220qvj.116.1658246830916;
        Tue, 19 Jul 2022 09:07:10 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-245.dsl.bell.ca. [209.226.106.245])
        by smtp.gmail.com with ESMTPSA id cc12-20020a05622a410c00b00316a384447fsm8427781qtb.16.2022.07.19.09.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jul 2022 09:07:10 -0700 (PDT)
Date: Tue, 19 Jul 2022 12:07:08 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Maxime Ripard <maxime@cerno.tech>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: b4 submit ready for beta testing
Message-ID: <20220719160708.kdx26oexzpqt4sfm@meerkat.local>
References: <20220717160218.a5ccu4chbaoj3uxv@meerkat.local>
 <20220718181732.GC5049@ziepe.ca>
 <CAMuHMdWgjimmGRxP6kLK_mzv3Fo=5S6SjYj5sbk24eSHLWKZHg@mail.gmail.com>
 <20220718231012.GE5049@ziepe.ca>
 <CAMuHMdUQiMwcC=r5NUZzniLC1qLkfcsB0rj+VnGm15+-ztjRqA@mail.gmail.com>
 <20220719123434.GF5049@ziepe.ca>
 <CAMuHMdVfrbnBmh=MCoX5S5y0JaMhZ7o8Do3bFORk1a_sF7MDOA@mail.gmail.com>
 <20220719130039.GH5049@ziepe.ca>
 <20220719135949.jlw3pfe3qz7xk53h@houat>
 <20220719153247.GI5049@ziepe.ca>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220719153247.GI5049@ziepe.ca>

On Tue, Jul 19, 2022 at 12:32:47PM -0300, Jason Gunthorpe wrote:
> > I'm sure that it works great for you and others using that workflow, but
> > it's far from widely used still. I wouldn't call it non-standard
> > because, well, there's pretty much no standard when it comes to how you
> > should use git, but if we're targeting outsiders we shouldn't go too far
> > off the typical workflow.
> 
> I think this thread shows exactly that there is no typical workflow
> here.
> 
> IMHO Konstantin shoul decide if the goal if this b4 feature is to
> support everyone's unique idea of a work flow, or to implement a
> reasonable broadly useful workflow that is simple to use and
> understand.

I'm implementing two different cover letter strategies:

- the default one, using the cover letter commit
- the tag-based one, a-la git-publish

Newbies and occasional contributors will almost always want to stick with the
"cover letter in an empty commit" strategy, but those who really hate the idea
can pick the tag strategy.

-K
