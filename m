Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8947828EB
	for <tools@linux.kernel.org>; Fri, 24 Jun 2022 13:51:50 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id n15so4564752qvh.12
        for <tools@linux.kernel.org>; Fri, 24 Jun 2022 06:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=wuRXlwMBKjKubOsF005pXvRXkT2bZ51ysxCnJFAcIbE=;
        b=nSMsd+XcrceAjjVod3e08xgW1pcKRsDHcEKRlOg0dGPCixws8mwiDfe8576Bfsvc//
         M79I1LzV5LTZlWZ1aMhguFQrK4vX/lQytlWOO0aZua7/SEFHiElGs4z8+0Ms0wGV+k77
         B/mw4hc3qeOEOFDolCffr3rVGY68GzSRpMtP4HeuIdpv/U0yXh5605D0H8C7j6pOR57s
         eye0l2xa9zlklym29rSxcrirfWeXi9OVqa+BhoGULGpLSeEqxwiSWZ3etSFHS0cXp9SX
         eclHU8ikXB+Fm7uH0PJtVWWO73A6MHWJC1iG4JwDi7dt0WSNq+U0FeaBhAz6Ae8oKEOz
         ze6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wuRXlwMBKjKubOsF005pXvRXkT2bZ51ysxCnJFAcIbE=;
        b=sx63FaYK5E9zD5aBEixZ0OSZQwbdA1c8En2EpxCZKEbWL/03ftBb28engFxnFJ0nM0
         gnR8/fKXN1KPM+YKTfjQLYPGWhOekDNgIZubCjLimvaqrQQPWW5uurMxxLo9HH+kLyva
         fiSp7OkN2Ky42F+TwZLWPnP+wteK0x5S8cmEZQrR00geAf/hAep3a6wpx4YfRjRot1ES
         oSZ1MqW+iA8ZVyzDD03WaTQefvlSaMDvRFweyp1wy9DSIcosiUud1PrEDImPQv9igeDc
         VZenyTFTcdjoyr5JCquBSmATLISveGavFTqnybJmq/folDX8+QOL2c8EeQx3ruT5wJE9
         UCKA==
X-Gm-Message-State: AJIora/Xr/wZp1hA8ci4gvj4s5jr61gMgF1euMfh36WSYp/WENhEgymE
	hUTrdwnmGUrGZHmheeoIahFTpA==
X-Google-Smtp-Source: AGRyM1tO0RiWMPxEReFXCnD12DjMYrcBZ+UjYDKt99fj8cnblKvZTqbjwCJXoaW6eFgLiyDynsdH3g==
X-Received: by 2002:ac8:5c07:0:b0:304:f7b7:7dda with SMTP id i7-20020ac85c07000000b00304f7b77ddamr12540004qti.123.1656078709314;
        Fri, 24 Jun 2022 06:51:49 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.113.129])
        by smtp.gmail.com with ESMTPSA id fb10-20020a05622a480a00b00304e2e4bf1esm1382245qtb.88.2022.06.24.06.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jun 2022 06:51:48 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
	(envelope-from <jgg@ziepe.ca>)
	id 1o4jit-000XNG-2d; Fri, 24 Jun 2022 10:51:47 -0300
Date: Fri, 24 Jun 2022 10:51:47 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Theodore Ts'o <tytso@mit.edu>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	Linus Torvalds <torvalds@linuxfoundation.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>, tools@linux.kernel.org,
	users@linux.kernel.org
Subject: Re: b4-0.9.0 available
Message-ID: <20220624135147.GA23621@ziepe.ca>
References: <20220621152903.czivp7fdn6me775i@meerkat.local>
 <CAMuHMdWz8=Zr8hnXNGBZVfe70F8oVdK670Z41=Dtib0GMDgAug@mail.gmail.com>
 <CAHk-=wiQzp+aurcmj15=LAa2ntvRZH0Ee2dn-PLjcFpmRE6Jcw@mail.gmail.com>
 <CAHmME9p+zRErOsvA1zC=kTHtpYD_sGjFxVsj0pMwteAp4dCdjQ@mail.gmail.com>
 <20220621165953.z25hwos7gom6bp6s@meerkat.local>
 <YrIEnmt5vDMcbOiG@zx2c4.com>
 <20220621182953.p5asczznnz3pn6dl@meerkat.local>
 <YrIR2v7GdC3qIt2E@zx2c4.com>
 <YrI3W46GUS/Dap5J@ripper>
 <YrT4LIq6ssD1mhMQ@mit.edu>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YrT4LIq6ssD1mhMQ@mit.edu>

On Thu, Jun 23, 2022 at 07:33:00PM -0400, Theodore Ts'o wrote:

> It's not perfect, especially for large patch series where there is
> say, a v27 patch series before it finally gets accepted, unless the
> cover letter of v27 has a URL link to all of the previous patch
> series.  

IMHO this is best-practice anyhow..

For example:

https://lore.kernel.org/kvm/20220224142024.147653-1-yishaih@nvidia.com/

Which is perhaps a strong case for including meaningful cover letters
like the above as a merge commit - but git needs some easier tooling
to show the cover when starting from a commit id: 'git show --cover
<comitish>'

With b4 having the range-diff functionality it also allows reviewers
an easier way to generate their own diffs between versions of the
series, and allows people splunking in the git history to discover the
entire conversation and all prior versions (Konstantin, it would be
nice if 'b4 diff' would take a pair of lore URLs)

Unfortunately it is a bit of a PITA for the submitter so not too many
people seem to do it.

Jason
