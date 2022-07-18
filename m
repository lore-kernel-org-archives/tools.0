Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6925333CC
	for <tools@linux.kernel.org>; Mon, 18 Jul 2022 18:14:38 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id b25so8629763qka.11
        for <tools@linux.kernel.org>; Mon, 18 Jul 2022 11:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=agwlJEjAitpSETFASrxupBzxb2J00J3eoN39x1glVdg=;
        b=bu/67WBjgZFfxkbl4h+x3OfNr5q+ytYmIoj+Vb4TEWuNbUv47y3ElQw7kkVlQrIVh9
         ee0coYyhnKx6uPyhHK7O6s2/z8N2sIDoH97ep0QM8doIAMr9oZglC4SkHPEWHbYnFCfu
         A2kg/SuTO8h499bWjjfZRk383nArfnHSW2GsLmAljjn5PiyO2Kb1SbUnKyyf1uJJnDs8
         XU8WNNpXQ6BrTYMy7XeoQ+75fB/YSQBf3lzVFbFIPurw2smi3OuXAAu8hQjzYbQ7SgL4
         0/FH8VjE3RkcF5WSrLnUyNy3RL3lKP2qIRCf3zNE34mAI4Mm18Xjzf8uOJE+K0nsCV3R
         gj9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=agwlJEjAitpSETFASrxupBzxb2J00J3eoN39x1glVdg=;
        b=GfnPJSSMTFrIdiojfwPmmcs7lBWyGCO/TwoT5eP675pwHDYdF35rjtZA1jdf2lc125
         YGAtTlSl+q+8NKySKbrbxf/xp9sYBYpTL295F8ouZhx5Y1Dn0rtmAfqJmL2cxflrwLVj
         ZwFhuEATKqL6vaoS56+4lUZT4x+nFz7XWN7tTrzHPi0MevJQ+qz9l7dlKc7NtFXYhNQi
         oFbUsyI6ch24wdTsR9hIdhQfpVKbz6xWZ6tKYdSMncDDhJi892r5JQBEwpnbxUakUzQx
         iGv+ZBibGxJOQunPrG1iEGZHtHzTI3VxJSlgOwbeWEOYQ5Yzj9th8I0xGK2dkPz/6szY
         A38g==
X-Gm-Message-State: AJIora8aVTrnHpJMU1YJ7fFx5gLDvzirATSh3L0wADXFR8uSIO0Ra1+f
	vlp25IHrHLE57GKwdX+W8wQegLmf6BFqVg==
X-Google-Smtp-Source: AGRyM1stm1sndUVj8KEUy2PjD0Y9S8J1c+srbYQa+G0t0NWCbGb3EwhS6RoRlPcmHF4ygjVFebB1aQ==
X-Received: by 2002:a37:2cc7:0:b0:6b5:508a:f471 with SMTP id s190-20020a372cc7000000b006b5508af471mr18241895qkh.273.1658168077247;
        Mon, 18 Jul 2022 11:14:37 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.113.129])
        by smtp.gmail.com with ESMTPSA id cp4-20020a05622a420400b0031eb393aa45sm9160698qtb.40.2022.07.18.11.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 11:14:36 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
	(envelope-from <jgg@ziepe.ca>)
	id 1oDVGN-000J7i-Jj; Mon, 18 Jul 2022 15:14:35 -0300
Date: Mon, 18 Jul 2022 15:14:35 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Conor Dooley <mail@conchuod.ie>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: b4 submit ready for beta testing
Message-ID: <20220718181435.GB5049@ziepe.ca>
References: <20220716142954.voq4ucnl5wkq7h2b@nitro.local>
 <4c4652b0e333bd81b91f71346ac6142322682eff.camel@HansenPartnership.com>
 <20220716145638.ubuwwc7xtjw6ugy7@meerkat.local>
 <6ad8ce3aa0d14d8a09a3c117affe19928a44f639.camel@HansenPartnership.com>
 <d611454a-6a23-eb09-c8ec-84f1b4b49746@conchuod.ie>
 <20220717154344.jnbmklayhjgdekdu@meerkat.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220717154344.jnbmklayhjgdekdu@meerkat.local>

On Sun, Jul 17, 2022 at 11:43:44AM -0400, Konstantin Ryabitsev wrote:
> On Sat, Jul 16, 2022 at 06:14:37PM +0100, Conor Dooley wrote:
> > >> So, it was either using notes (which almost everyone forgets to push
> > >> anyway), or using an empty commit. I agree it's hurky, but it
> > >> currently the only thing that fits in the "least likely to end up
> > >> lost on a rebase or workstation switch" category.
> > 
> > 
> > Is it silly to suggest that b4 could handle the a notes to
> > description & description to notes conversion in a "b4 push-series"
> > or "b4 fetch-series" type of command? 
> 
> It's not silly, but it's significantly more fragile. Pushing and fetching
> requires reachable remotes and some kind of ability to handle conflicts, keys,
> etc. I'd much rather avoid going down that road.

More importantly all these other suggestions don't become trivially
visible on places like gitweb, github, gitlab, gerrit, etc.

The cover letter is important, if I want to share the actual commits
with someone else for some reason I want them to reliably get it.

The empty commit scheme also lets you make multi-series branches and
reliably share them in a way that other people can understand the
structure.

Jason
