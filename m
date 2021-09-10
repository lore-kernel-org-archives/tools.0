Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24193FC2
	for <tools@linux.kernel.org>; Fri, 10 Sep 2021 06:10:23 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id u19-20020a7bc053000000b002f8d045b2caso558989wmc.1
        for <tools@linux.kernel.org>; Thu, 09 Sep 2021 23:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=iSufy7RKaoXbbZBMkgQEoIZbdU4JvC6JquTXHeNgBrE=;
        b=cGaxG1KYrUg5JBJvxMOCuWDgNcjLeqlrb0Y3VMQRaVipmDToqN7KMYMLwsT1onAvfL
         soO4WJbkWOBeazML0m0qfT8fVqlFu2kfK+nHxCW5gB/ZLCoOs9hYjFu2rWFwI+Eh+Rtk
         9NXa7nJB04PCAWJ5pXeDGtBWkHyHlSjau4YND8mELYj1yvcTOUDgrGbEnjtSF7SAMwqY
         lEmOLwrugEqBammW6AXVls/COW3qpVmLNOrcRtUWnnlqeNFxZyNOs3m0VgMpK+0U8vDe
         UVXARYjaU/9LLzdiUX4KDNg8CMbEEzQj1HDhEZNNB/DiREbCPLNdT726c0e/moTclrIM
         hz9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=iSufy7RKaoXbbZBMkgQEoIZbdU4JvC6JquTXHeNgBrE=;
        b=H4NpUUlwOp0fpZWzPdrPUYPExni3hhbPYZgxMMu0Xz8lfQaZmcPXTRk7WGx9tIVX0L
         JuUpnQXOm0KvRen76Z9Z5n8qykZMc2CLUtnrrrN9ub0d9pJZSLHh1YXIno3jESkyhB0z
         uFOFq5hArtNgCjUImAAh/1a4DINNAWMT13VrtVab69iCIiD135L7igtNhCbzI3DoSL2I
         iULPhdMD0M1ImkqvnTwV8QJ6wO6kuEvlh4hkHCbsX1gWorxa/URFmMDQvGe7YC7bkIYa
         I6fNK8wj67AERnda9x64h6xS+6pBDNXezw3oeIzWP5ldCj6lYZK45uysR1cxh2MkBMrw
         2g/A==
X-Gm-Message-State: AOAM533Hx/iVun8OxJPwIp9cm3xz6jK0/icabh6IDGEus0VeEWguTNnh
	3RLEpG3yPIYFhf6FU2bQKs33Gw==
X-Google-Smtp-Source: ABdhPJxHk6s3EHUOK+ILBBNH7kRE42P4apXtH6oxdtUYjWfOTKWCe7boSFgKo/WFQqIWWLX5swg3Lw==
X-Received: by 2002:a05:600c:2245:: with SMTP id a5mr6622187wmm.19.1631254221945;
        Thu, 09 Sep 2021 23:10:21 -0700 (PDT)
Received: from google.com ([95.148.6.201])
        by smtp.gmail.com with ESMTPSA id t7sm4061895wrq.90.2021.09.09.23.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 23:10:21 -0700 (PDT)
Date: Fri, 10 Sep 2021 07:10:18 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Jason Gunthorpe <jgg@nvidia.com>, users@linux.kernel.org,
	tools@linux.kernel.org
Subject: Re: New version of lore available for preview
Message-ID: <YTr2yodaqGl0QqBe@google.com>
References: <20210818190750.g3xedu7j24sqndo2@nitro.local>
 <20210902195332.GA2493828@nvidia.com>
 <20210902201402.bbdttirbb5ckrtiz@meerkat.local>
 <CAK7LNAQogtzDbAFDtRt7UvDkH6K4tkQgwfmu-2_0rGgo_Uj_iw@mail.gmail.com>
 <20210903152143.nt5mzgwprltl36pa@meerkat.local>
 <CAF2Aj3jbU_vnKvYB2EJXuKdTCeJx3dgZY2h7sriJX4fP6Fsteg@mail.gmail.com>
 <20210908183746.iancht34j3drun77@meerkat.local>
 <20210909084907.271b6df5@gandalf.local.home>
 <YToM6bH/I9rHQMeE@google.com>
 <YTofguBdkTO5ReBb@hirez.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YTofguBdkTO5ReBb@hirez.programming.kicks-ass.net>

On Thu, 09 Sep 2021, Peter Zijlstra wrote:

> On Thu, Sep 09, 2021 at 02:32:25PM +0100, Lee Jones wrote:
> > Does b4 provide this functionality too, or do I have to script around
> > it?  How have other's chosen to automatically apply the downloaded
> > mboxes?
> 
> My .muttrc has:
> 
> macro index B "<tag-prefix><pipe-entry>formail -ds | b4 am -slt -m - -o - | formail -s ~/mutt/mutt-pipe.sh<enter><untag-pattern>~T<enter>"
> 
> (which relies on that same muttrc having: set pipe_split=no)
> 
> which allows me to tag a (partial) thread using ESC-t (or otherwise) and
> apply the resulting lot (with folding of tags and adding signature and
> all the goodness) to my quilt series (as done by my mutt-pipe.sh
> script).
> 
> The initial "formail -ds" is required because mutt pipe output isn't
> exactly the mbox format b4 expects and formail basically reformats it,
> it's mbox in mbox out. Then b4 takes the mbox, folds tags and generates
> a reduced mbox with only patches; formail then splits it and my old and
> trusty mutt-pipe.sh frobs it into quilt one at a time.

This might well be handy.

I'll probably look into this when I have a need i.e. when I come
across my first multi-patch merge where there has been subsequent
reviews (trailers) added to the thread.

Thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
