Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B765D173
	for <tools@linux.kernel.org>; Fri, 17 Dec 2021 16:41:43 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id k26so2724437pfp.10
        for <tools@linux.kernel.org>; Fri, 17 Dec 2021 08:41:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=90net1eXis80PK6AMWu6hDqo2VPIxBR97QWrZd7++q8=;
        b=Zo2Yw5CJblTelpidR358C+7ibCK7My/ulYoFT2JZ9a45cqwXopGv6G/S5KvKwyi7En
         qqlDj7y/9SdEpohEDgzG7R/OrFWqd4v+ipmpTapWz0PWIvx3RquV9E+Cn8Yl/wW2cejg
         kA1/D612Va1wFIypeBouovwjXyK+HsF0/OkhM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=90net1eXis80PK6AMWu6hDqo2VPIxBR97QWrZd7++q8=;
        b=09OkozSsLun1rntJaEqtpAOtgcdJbxDPmiO26O7NsDoX7LkYqyV0bSczHr4ZWe7eGn
         HwLHvkOVeXGGuGAVFgDO6LVpqmGRxlNHBgKZxBzFre5kKhz+soa1274GJu0x5mkpUR7r
         e6v6wPm15kB+403ndmEPrY8LhlKZYrApBRRVNgBaFaTDz3m9d0IDua/6WP3BdPyWsYhN
         2gOdC0pb582aOQPbObQxMl8YZynwUZaZyqcrdO6eVMqiY4GbVhU7xhHNVT9eo43DzKO4
         TbvQ7KNPc1ujXjSibqv8GFXOwNQKMahpKio7CShE4oqNypj2snwU8jINVkn8lqo37V7E
         a3NA==
X-Gm-Message-State: AOAM530zECUgtEvdct+jmB3YP/9lSrEL93FCdcfVuyOgQFCKNpMNYbLm
	z+ruvJex+DcUy1G0FGSVsCZHWPkWii8pJw==
X-Google-Smtp-Source: ABdhPJwveyeZQmEFhjlVCHN6ssTpOHifSAQ2tq9xPs56hLOk8Of9QINKK8GzQkeR/9/8Llr7weyoSw==
X-Received: by 2002:a63:920b:: with SMTP id o11mr3647201pgd.314.1639759302950;
        Fri, 17 Dec 2021 08:41:42 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id 145sm8895922pgd.0.2021.12.17.08.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Dec 2021 08:41:42 -0800 (PST)
Date: Fri, 17 Dec 2021 08:41:41 -0800
From: Kees Cook <keescook@chromium.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: Re: [PATCH 1/2] patchwork-bot: Ignore empty context lines
Message-ID: <202112170840.1290901F@keescook>
References: <20211202233836.2024510-1-keescook@chromium.org>
 <20211202233836.2024510-2-keescook@chromium.org>
 <202112161410.FCEC1C1189@keescook>
 <20211217161744.rxvsw2wwqzseowao@meerkat.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211217161744.rxvsw2wwqzseowao@meerkat.local>

On Fri, Dec 17, 2021 at 11:17:44AM -0500, Konstantin Ryabitsev wrote:
> On Thu, Dec 16, 2021 at 02:11:08PM -0800, Kees Cook wrote:
> > > $ MSGID=20210911102818.3804-1-len.baker@gmx.com
> > > $ wget -qO- https://patchwork.kernel.org/project/linux-hardening/patch/$MSGID/raw/ | \
> > > 	grep '^ $' | wc -l
> > > 0
> > > 
> > > $ SHA=f11ee2ad25b22c2ee587045dd6999434375532f7
> > > $ git diff ${SHA}~..${SHA} | \
> > > 	grep '^ $' | wc -l
> > > 2
> > > 
> > > Teaching patchwork-bot to ignore empty context lines allows pwhashes to
> > > match in these cases, which lets those patches get located again.
> > 
> > With regard to the revert, do you not see the above problem with your
> > repos? I'm working against the same patchwork. I guess there is some
> > other root cause?
> 
> I'm curious if you have local git configs that affect your "git diff" output.
> If you "export GIT_CONFIG_GLOBAL=/dev/null", does this make any difference to
> your experience?

$ export SHA=f11ee2ad25b22c2ee587045dd6999434375532f7
$ GIT_CONFIG_GLOBAL=/dev/null git diff $SHA~..$SHA | grep '^ $' | wc -l
2
$ git --version
git version 2.30.2

Does this report "0" for you?

-- 
Kees Cook
