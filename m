Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984A553A3
	for <tools@linux.kernel.org>; Wed, 19 Oct 2022 19:16:36 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id z30so11369096qkz.13
        for <tools@linux.kernel.org>; Wed, 19 Oct 2022 12:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oRovT4wFsLKWlG8SqmdxC5hfrI3DMew+tFik/1OYX7g=;
        b=ZB034rCcFffaLD/D1oEQaduRpIxM0WaisvVi6eNoS9ExfNfFXE6FJqTznQiv6kT1cM
         6nlXggrJZUejpybrbseOyWWyOBdo7r2TynLH999kapUlWRg9rdxpI8kQt+TdZTx20u7b
         clY40TzrdCg16/jfDjJUt9wYnA+FfqXfyk4f4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oRovT4wFsLKWlG8SqmdxC5hfrI3DMew+tFik/1OYX7g=;
        b=LcreGbQIAwjqTec5SK/vdXRII6xaoMBxU6fEp1VhMDYjQVaoDOzbz2fwprtHs0A+oF
         GgAlVX9Z1yhkb/WTRmQj9GVte/6P8aCY7CJDvJw8bRLiMyRFzzb9y73dzkJJ9ZGHAjIS
         iEK+wufTrCKbdyr3XTB9C+tiFxZJnSlrbvLw+++OuwssFCnDliYnIVc2X74ENRMt3x06
         xF3Vz0ysbV3cuNg8OLpYZ1FP+mY5s/ee2lU6N3G1tdCAPHk+Isa5tPpv0r0bZUb2jEJt
         odKxFXQ3Gqrb6ARLdMinAiPXW0JqCDkC1IJBhFbZz4scDQCfatsSHTREFz+fP/5Utgny
         MI1A==
X-Gm-Message-State: ACrzQf2VXjFlllkToc735gM5eYR2sqeYhQyFjutwYt/Y8whuRy+gXFMo
	CEw7DxZTMk/xXZur/ybidWQ7Zg==
X-Google-Smtp-Source: AMsMyM4oMJfpbNX8ObKbyPGGQ1cE4x4G33wJTCN63IwqfPsZJtocc9g/I97ID65iNdGg+zsVBqeDYQ==
X-Received: by 2002:a05:620a:25d0:b0:6bb:f597:1a3 with SMTP id y16-20020a05620a25d000b006bbf59701a3mr6635641qko.43.1666206995430;
        Wed, 19 Oct 2022 12:16:35 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id dt5-20020a05620a478500b006ee94c5bf26sm5691676qkb.91.2022.10.19.12.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Oct 2022 12:16:34 -0700 (PDT)
Date: Wed, 19 Oct 2022 15:16:33 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Maxime Ripard <maxime@cerno.tech>
Cc: Mark Brown <broonie@kernel.org>, users@linux.kernel.org,
	tools@linux.kernel.org
Subject: Re: b4 bugs / future improvements
Message-ID: <20221019191633.pay6hl43fiisgcrh@meerkat.local>
References: <20221018153620.tyuedbldi2ofbe2x@houat>
 <20221018201804.na5x7lohm4yszg5h@nitro.local>
 <Y08MuItOLxqpBr+/@sirena.org.uk>
 <20221018203749.o4i5h2qt6artzezx@nitro.local>
 <20221019080439.cwwiycfdn4b4evvv@houat>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221019080439.cwwiycfdn4b4evvv@houat>

On Wed, Oct 19, 2022 at 10:04:39AM +0200, Maxime Ripard wrote:
> > > If you're doing an inter-version changelog it's common to say something
> > > like "rebased against foo" in there.  It's a bit clearer about things
> > > than base-commit.
> > 
> > No, I don't think that's what Maxime means -- "rebased against foo" can be
> > done using "b4 prep --edit-cover".
> 
> Yeah, I'm manually editing the JSON part. But tbf, I don't really know
> why I started doing it, so it might be fixed for a while, or never an
> issue in the first place.

If you're using the "commit" (default) strategy, then you really don't need to
worry about the base-branch bit in the JSON tracking info.

> > I think there's two things going on:
> > 
> > 1. he's using a different cover strategy that requires base-branch tracking
> > 2. he's rebasing on a different branch, as opposed to a newer tag within the
> >    same branch
> 
> If it causes any issue, then it could be the reason yeah. I do rebase
> across different branches from time to time, so it might be why I
> started doing so.

When we keep the cover letter at the start of the series, then we don't really
care about the base branch -- we know exactly where the series starts, so we
don't need to keep any information about the tracking branch around. Next time
you rebase, just ignore the base-branch entry.

I will look at improving the trailers matching logic in the near future
(that's unrelated to rebasing -- we just need to have a sane fall-back when
the patch-id changes).

-K
