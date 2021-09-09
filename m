Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C33E3FC7
	for <tools@linux.kernel.org>; Thu,  9 Sep 2021 14:37:38 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id l24so1580046qtj.4
        for <tools@linux.kernel.org>; Thu, 09 Sep 2021 07:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=RUIhqCSwKeF3NJjlNZluncBZrFyEP1WFrdDdfEwiHCU=;
        b=NmR/t/J7uIcfpQRw5eeWOJWhqtwuEBjdxjK471zQeLdK6PJLx8b1EWvATO2Q81Ckcd
         bltRFNUlBZ3Ma3fmDM2X2PpyrAiSysrx6dJ+uokHAu5As4F5m9ze90xbaGNh/OvAefD0
         JePjK5LWAYDHi9FnJr+AsdG2B/m7vsyI460wU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RUIhqCSwKeF3NJjlNZluncBZrFyEP1WFrdDdfEwiHCU=;
        b=CTRG+JLqG7kywnrEFMsejcfnEIZoNT/dQfpPIReZlPKPwfen85ucfWTusrJCqLZHUZ
         WKQTnz8jjZ1cCCchdeJNuNZqvqZhFR4nsD6B+bf7j4N5w39lidizDIvPBUu1AaC7r0p0
         p8ul0fa+H1DKyRU+B6h+RT8wA3bpW4bf+NCDji0nWzYKt1QOJhBKY2boT7OmahCvVbla
         6/eaO85jcHiRhuyL6MVrDg8KmPm64CaS42in4KtBUfG54JohjENFosaqe7+Kj3+D7oTL
         Ns15t6KfbMR2O8aFl+ickYNI8Nq/eLj4vM+oUaFQO+X5xXgAX78UI2xKTKc6m1qcxKAX
         sGUQ==
X-Gm-Message-State: AOAM53189Vd4dwM3n5mXKpBYf6Vh8wJo72eeRCVT6GLFebJau5a4LAXH
	BEShNUVyZF2MAIjwrsRqmSnZew==
X-Google-Smtp-Source: ABdhPJz072a323kAwzqxXYeLv8GvJbUJpakiZl+8syCH3ZB3cajl9rOCiUD0g+PEvqQ70xt9rhxd4A==
X-Received: by 2002:a05:622a:d:: with SMTP id x13mr3209592qtw.23.1631198257335;
        Thu, 09 Sep 2021 07:37:37 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-32-216-209-220-181.dsl.bell.ca. [216.209.220.181])
        by smtp.gmail.com with ESMTPSA id h13sm1367604qkk.67.2021.09.09.07.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 07:37:36 -0700 (PDT)
Date: Thu, 9 Sep 2021 10:37:35 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: David Howells <dhowells@redhat.com>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: lore.kernel.org upgrade: Sep 1, 2021
Message-ID: <20210909143735.btp4hroyvohv6wfg@meerkat.local>
References: <20210909123150.fgo7vma4i32t36mg@meerkat.local>
 <20210830164626.tq5emfrht4o46x33@nitro.local>
 <398626.1631181532@warthog.procyon.org.uk>
 <515599.1631195648@warthog.procyon.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <515599.1631195648@warthog.procyon.org.uk>

On Thu, Sep 09, 2021 at 02:54:08PM +0100, David Howells wrote:
> Cute... but IMO, that's not actually easier than just clicking on the lore
> item in the bookmark strip, then pasting the message ID in the box and hitting
> go.  Is it possible to add a separate lore-search box, I wonder?  I search
> lore a lot.

You can just bookmark https://lore.kernel.org/all/ and add it to your bookmark
bar for quick access.

> Btw, is there some ordering on the list of archives on the front page?  I'm
> guessing it's in order of most recent addition.  Wouldn't alphabetic order be
> more useful?

I don't have an option to control this order right now -- this is just what
public-inbox chooses to do. I'm not sure alphabetic ordering would do much
difference, honestly. Just ctrl-f and start typing to find the link you want.

-K
