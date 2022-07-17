Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B01256C
	for <tools@linux.kernel.org>; Sun, 17 Jul 2022 16:02:21 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id w29so6488225qtv.9
        for <tools@linux.kernel.org>; Sun, 17 Jul 2022 09:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=lefmv/P4g7fgCJmgR37al6+vCIbSBd3tKRZ9JQmB0Gs=;
        b=ML/3FhDqqkY8YB3/f5PiAcSKsB2MsVTnWP1zgHJvd9Kt6BqB8RkBY6h2Obbgy69jUK
         C7I3LZo0GiXKUFq6hDSTvCop1VCsb8YZc/odvA6TE2NP+qmoA4rTsfO+eAhHliAMzhxV
         HMR+WWCoCW5y1pEepHfphnCYJ+O8B/i42sGPE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lefmv/P4g7fgCJmgR37al6+vCIbSBd3tKRZ9JQmB0Gs=;
        b=PHwFOUM2MBjlEAMxmDv+Ncex7VjOmZL39/hfAvQlFYpspWTHuQ5bOS04iz4tzDS961
         OSqqjjqFja+YoOYHtYBCrJC+Po1Y+VjrKHBvTokWkmnHQOiigxv86HFyL0bPW5HGmmem
         f30JdIH00l2UYMKWdJniQNbj16rNC/pfOgYtmhEYOQyoqEm4JJhkDSaEaU90hvdVB6Pm
         tGd/l3iu51bC6CSpBk0CvDv9u6urtLzRTQkEDKVsnNEXjbeur+ddTARcsfV7frJBNZwK
         +BhHGuSH75SfIzA8vi5Z609OHiuVroyxXvpBRoJJFsgCUNd5W7reGlx3xTbtZv3t2vz3
         yezQ==
X-Gm-Message-State: AJIora9MGn1NEF0TZLpmviOjnMbS/JfgrqPbEC6/5rF6HXfzBp3u/hK/
	SaVwK3G2dkOamj7esjWuvlHaIg==
X-Google-Smtp-Source: AGRyM1tgp1HpWKuJ2XF3fZKeC85pu23NPpfe9m4scNB5Z+ZP6yJDhAi/ZV69nBLRFgawM8qOPeWgKA==
X-Received: by 2002:ac8:5c51:0:b0:31e:e505:876 with SMTP id j17-20020ac85c51000000b0031ee5050876mr4800828qtj.250.1658073740742;
        Sun, 17 Jul 2022 09:02:20 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-245.dsl.bell.ca. [209.226.106.245])
        by smtp.gmail.com with ESMTPSA id y14-20020ac87c8e000000b0031ee34ca176sm3638318qtv.59.2022.07.17.09.02.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jul 2022 09:02:20 -0700 (PDT)
Date: Sun, 17 Jul 2022 12:02:18 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: b4 submit ready for beta testing
Message-ID: <20220717160218.a5ccu4chbaoj3uxv@meerkat.local>
References: <20220716142954.voq4ucnl5wkq7h2b@nitro.local>
 <4c4652b0e333bd81b91f71346ac6142322682eff.camel@HansenPartnership.com>
 <20220716145638.ubuwwc7xtjw6ugy7@meerkat.local>
 <6ad8ce3aa0d14d8a09a3c117affe19928a44f639.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6ad8ce3aa0d14d8a09a3c117affe19928a44f639.camel@HansenPartnership.com>

On Sat, Jul 16, 2022 at 12:55:26PM -0400, James Bottomley wrote:
> >  So, if you work on a series, send it off, and then pick it up again
> > two weeks later from a different workstation, that's no good for most
> > of what b4 submit needs to do. :(
> 
> Are you so sure that's the common case.  For me, to connect to an SMTP
> server, I need to be on a system running my VPN, which is only my
> laptop.  Thus however much I transfer the series around for testing
> etc., it always comes back to the same system for submission, so
> keeping the cover letter in the branch description of that system works
> just fine.

Perhaps, but I also have other reasons to like using an empty commit for this.
For example, it makes it very easy to mark where exactly our series starts.
It's possible to do this with other tricks like tracking merge-base, using
tags, etc, but they are a lot more complicated and have other caveats (e.g.
when using merge-base tricks you have to also track the branch you forked
from, and when using tags you have to also consider that someone may push the
branch but not push the tags).

> The point is you're introducing a divergence between b4 and git for
> this ... are you so sure most developers submit from arbitrary systems
> and that's the use case we need to optimize for even at the expense of
> the incompatibility?

Well, at least two people on this list specifically asked to use empty commits
for cover letters specifically because they want to be able to easily push
their work to a remote either as an easy means of backup or to work on it from
a different system in the future.

> > So, it was either using notes (which almost everyone forgets to push
> > anyway), or using an empty commit. I agree it's hurky, but it
> > currently the only thing that fits in the "least likely to end up
> > lost on a rebase or workstation switch" category.
> 
> I get what problem you're solving, but it isn't my problem and is never
> likely to be because I'm not going to increase my attack surface by
> running a VPN on anything but a single system where the TPM that holds
> my cryptographic keys is.

The upside of "b4 submit" is that it doesn't replace any schemes that already
work for others -- if you have compelling reasons not to use it, then you can
just ignore its existence.

The goal is to make life easier for occasional contributors, plus also make it
suitable for the subset of developers who find that it works for them as-is.

-K
