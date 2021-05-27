Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F7F2FAD
	for <tools@linux.kernel.org>; Thu, 27 May 2021 13:20:02 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id v8so564394qkv.1
        for <tools@linux.kernel.org>; Thu, 27 May 2021 06:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=C8JWwWQ7hRh4+HSK7kmxt62BKLeiRki1wra+fOepfX0=;
        b=YbpPO/bm4PcGyd+X2cD0/0920sP/+PPcbk1gbiQ6Id2uKZPAF6IzqBFdYkhmSmg0Bi
         nxoNFb35rPvBX9tZJ+X4ADlEKzJI4kMx146JrJCjupgi2pM12n+ewd6lrzQbb58bDuRs
         QpSNFhXOHA+pIM+oq0rnO0fJv79HFc9bNFGxk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=C8JWwWQ7hRh4+HSK7kmxt62BKLeiRki1wra+fOepfX0=;
        b=QJG5oFZCN2vpHVPpJd5Yq4H0J3K4TsBDP6f5KqX87z46bxk7uXoBrxBnWMBni3/Jgz
         oVqYupSo2PkRoGiRhcxiE8dtb7KRctvlo45IbN8/dSQbAqRjDFeD+cV3qHA3m/dolExv
         Ed0CZ+ltIRdVZWTFgDKGe6Hp6z1y7lXziK/6IBhQf972w64MloMqqi/9dWabkRHbPY2u
         Ipi+vuwsIxy6+UI9IddZYrAD0Jmx5tsNEopHsHNKdA0y0gsSDQ3pJLs6achDUy4cSmvB
         9lGTHgR3qnhBiMH1G7cupEYuKwQ0qb4pOByu7dZhMQI+VQ+wUkhI9UhgmJfYlbPqSP7m
         fDNA==
X-Gm-Message-State: AOAM532R1o5qyFX8sy8RCi8bvxI6jh2kw2/LKuQ0H9vAlnBA3Y4I8wMB
	CiCRgCIbwTycbRjZoOoGUjBLtw==
X-Google-Smtp-Source: ABdhPJzu2aaU7HlotXeRujP2SRHyCj1sUQZDIBB3G8JfT94Rw2bNjFhGNjn6Jphb4OWOXuzgNs7cvQ==
X-Received: by 2002:a05:620a:e09:: with SMTP id y9mr3356600qkm.359.1622121601359;
        Thu, 27 May 2021 06:20:01 -0700 (PDT)
Received: from nitro.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id k75sm1331220qke.103.2021.05.27.06.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 May 2021 06:20:00 -0700 (PDT)
Date: Thu, 27 May 2021 09:19:59 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: tools@linux.kernel.org, users@linux.kernel.org
Subject: Re: b4 v0.7.0 is available
Message-ID: <20210527131959.kotele35rsksyezt@nitro.local>
References: <20210526192558.pex7tuorwqvkzxe3@nitro.local>
 <CAMuHMdU5vyhHOZ7x-3d0uQqD9kSLBztaKBt9yq+pNGTmATHxCQ@mail.gmail.com>
 <20210527120021.o52btp5tikzj7wnu@nitro.local>
 <CAMuHMdUyctKCMTT4rFCktPfqPZHpnzMt6xDXsxvb7sYj0mH4Zw@mail.gmail.com>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdUyctKCMTT4rFCktPfqPZHpnzMt6xDXsxvb7sYj0mH4Zw@mail.gmail.com>

On Thu, May 27, 2021 at 02:05:30PM +0200, Geert Uytterhoeven wrote:
> <konstantin@linuxfoundation.org> wrote:
> > On Thu, May 27, 2021 at 09:56:25AM +0200, Geert Uytterhoeven wrote:
> > > On Wed, May 26, 2021 at 9:26 PM Konstantin Ryabitsev
> > > <konstantin@linuxfoundation.org> wrote:
> > > > - b4 am will warn when it finds a message in the thread with an
> > > >   "Obsoleted-by:" follow-up trailer. Running "git am -c" will automatically
> > >
> > > "b4 am -c"?
> >
> > Yes indeed. Sometimes I wonder if naming it "b4 am" was a good idea, as half
> > the time I type "git am" when I meant "b4 am" and vice-versa. Brains are
> > terrible.
> 
> Glad to discover I'm not the only one doing this ;-)

By the way, it's easy to set up a git alias command that wraps b4. E.g. in
~/.gitconfig:

    [alias]
        b4am = "!sh -c 'b4 am -sl -o- $1 | git am' -"

This way you can run: 

    git b4am <msgid>

-K
