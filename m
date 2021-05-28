Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED27C6D0E
	for <tools@linux.kernel.org>; Fri, 28 May 2021 19:53:22 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id j184so5280576qkd.6
        for <tools@linux.kernel.org>; Fri, 28 May 2021 12:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=zus4+V0Rpu/SLJT1Unl/cgz54LHCqzaI1NMBtlezWt0=;
        b=SXoK86aYRAhkjmkAetoZDfLmAYQyfmKeCePGVPBn18o+cPDx1SbLQAnnZII1N44jlH
         Oe498F3DvUGcVwQtBvJAsJzZBppq44+VymyX69gXEKWpdttuDwbhT8Jaf7i+V7i4085n
         S88PWeDRsRM9w8IKShn0E7z20SU/yefP9sm+E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zus4+V0Rpu/SLJT1Unl/cgz54LHCqzaI1NMBtlezWt0=;
        b=QRP3He+FZJUqS+szJFacR0MuNaj8tBxlwslsOj4lCunsrSO1zx1yTFkLUhclTem4aw
         Yx8VN4nb+23vJvHdu7YS4361jFy1MDNxIZKbJbvpKSXoNWgHMEmUTgJYJE/qW3qq5z2g
         NUuQMdFfu3mVxPOBCk2BYbgXZNjMn8luXA64z6oTTgEPiX+FeS8LM4H87tq08n2dJud8
         5MyKRdfu6KsYyEQO7QRNccmV2TT1YU6Gmm9sCOIo7Zh7FUJUFHZEYSXVV/rQ55qxRRDD
         hb6Xo/FfAudk9OMuhn/gzLs87vQQuOmU1bZQAQEUq4MR6CBdbQJoyVKYx8MGSMa/TJoc
         h1eQ==
X-Gm-Message-State: AOAM532lfJD+2Ji+qMeEWciH/1gKnW9KXCILAFpCwtSAs+P6o2BzwcjS
	aKXfRaxHWQ4nI0hoxWEYyCmCBA==
X-Google-Smtp-Source: ABdhPJxF+8oLEBkw4FdfBq8YMuvMIkkwvaPlvl7fTr6PETVci+13fGRYDBUYxMatZari5K8oBxdtGA==
X-Received: by 2002:a37:a851:: with SMTP id r78mr5694317qke.95.1622231601911;
        Fri, 28 May 2021 12:53:21 -0700 (PDT)
Received: from nitro.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id q13sm4210984qkn.10.2021.05.28.12.53.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 May 2021 12:53:21 -0700 (PDT)
Date: Fri, 28 May 2021 15:53:20 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: tools@linux.kernel.org
Subject: Re: grokmirror and pi-piper for all emails on a list
Message-ID: <20210528195320.c2vbhfg3zj365ebw@nitro.local>
References: <CAB=NE6UdvJ3QdimXxbWVJr0+vTU+rkqjChtN-bgDyQ8VY83-TA@mail.gmail.com>
 <20210528193834.mwf6qvuw6wng7yoz@nitro.local>
 <CAB=NE6We=Vr8hDOBVmfiZxZyDqJXXfA9yz5t13aqMwdrp7pBZA@mail.gmail.com>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAB=NE6We=Vr8hDOBVmfiZxZyDqJXXfA9yz5t13aqMwdrp7pBZA@mail.gmail.com>

On Fri, May 28, 2021 at 12:46:03PM -0700, Luis Chamberlain wrote:
> > Note, that if you
> > configured pi-piper to reshallow the repository, you will need to unshallow it
> > first (see the article you linked above).
> 
> OK so do you mean that if I'm starting from scratch I should use the
> shallow setting or make sure to not use it?

If you're starting from scratch, make sure you don't use it, or set it after
you're done passing everything through pi-piper.

> > Also of note is that the upcoming "lei" tool from public-inbox is going to be
> > a much more robust approach to doing what pi-piper does. I really wrote it
> > mostly so we could feed lore lists into patchwork. :)
> 
> Whoa, ok so, before I go on raving about this, I should wait instead
> and rave about lei later?

You can use lei right now if you like -- I believe it is fairly stable.
I believe the docs are still pretty thin, though, and may require newer sever
deployments than what is currently running on lore.kernel.org.

I'm supposed to be giving a talk on lei, lore and b4 at the plumbers
conference this September, so I'm hoping that everything will be in a better
position to "just work out of the box" closer to that time.

-K
