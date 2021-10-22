Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A00A2C8B
	for <tools@linux.kernel.org>; Fri, 22 Oct 2021 03:53:11 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id w17so1809432plg.9
        for <tools@linux.kernel.org>; Thu, 21 Oct 2021 20:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1s7DKH6HdkkCEsCWcKRIJuC5cBFib2RBwa5EiuKqvdQ=;
        b=L7VSQJPPsMond1eBKe4BHWYhQM/oaUE8sbirFaBb4V0KpGrbxX0R2w2Q9/FqFd+e32
         Bw7Gs7P608mhnnXkkQ+PL8c9Zq4FBGu/960sRGAuMKZPByOjRVx8AygusdGdz93WiW/e
         y/TgKQ1IRxucSaemNq2SF8v4JqDPR1zFmvts4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1s7DKH6HdkkCEsCWcKRIJuC5cBFib2RBwa5EiuKqvdQ=;
        b=49LBfUEr52cu0URZPK4s0IC91LkUkMGgaK/Dqn1EyHB1/GQcowBnfr4yrCBwpm3wC6
         t8OE9MOSYcwlx+ovgxJOwYxAVn5IcsMjlRg6H+t9my+GcFa8Cv1ZnAkmER9o7sdfqa0w
         +CT04uqrwX8AdjgRoim6d5eEBPL8qYn8Q1a9NEhYpdlKdDC3yD7Q5gU5t0A+H/89unKX
         5Nnw2YhJuO9JPIUBU8fWI3+6Zfhk7cGOm8eApO0S12K7C01z0nUbcSvavK3wJgTD2ee5
         XcR+ooJ7vmv0w0FcaVna7+70qHh5dkkrmjD7yDudvsA9HKP2jszIejdm53bh5MeZ67rD
         dfaQ==
X-Gm-Message-State: AOAM531iSJztcwfTraJy2nF9LIZ7sg82yZZdTymbuGsJyxB0+PFg3jj+
	Pcpi8GBVDvWcU22192na0p5Pcg==
X-Google-Smtp-Source: ABdhPJwh3fEHbufTVo61WfgObTIHr25Qb0fvZG1ubL5BIAogeF9AhT3kaXpWsTcoAn50q3uweY06EQ==
X-Received: by 2002:a17:90b:188b:: with SMTP id mn11mr11701051pjb.170.1634874791011;
        Thu, 21 Oct 2021 20:53:11 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id b130sm7788891pfb.9.2021.10.21.20.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 20:53:10 -0700 (PDT)
Date: Thu, 21 Oct 2021 20:53:09 -0700
From: Kees Cook <keescook@chromium.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	tools@linux.kernel.org, linux-arm-kernel@lists.infradead.org,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
Subject: Re: injected body trailers
Message-ID: <202110212044.D38D0993E8@keescook>
References: <202110211313.B5C5C61@keescook>
 <20211021204459.xd63t5xn24vktqf3@meerkat.local>
 <7786271477279d4fbf9292db1f6aede8428eb00d.camel@infradead.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7786271477279d4fbf9292db1f6aede8428eb00d.camel@infradead.org>

On Thu, Oct 21, 2021 at 10:42:46PM +0100, David Woodhouse wrote:
> I run the host but per-list settings are up to the admin of the
> individual list. For the lak list, vince@kyllikki.org and 
> mouw@nl.linux.org are listed as admins. I don't know if that
> corresponds with who actually remembers the list password these days; I
> can set a new one and provide it if that's helpful.

$ grep -Ei '(kyllikki|mouw@)' MAINTAINERS .mailmap  | wc -l
0
$ grep linux-arm-kernel@lists.infradead.org MAINTAINERS | wc -l
157

How about we reset that password and make the following folks the
list admins, assuming they're interested:

ARM PORT
M:      Russell King <linux@armlinux.org.uk>

ARM64 PORT (AARCH64 ARCHITECTURE)
M:      Catalin Marinas <catalin.marinas@arm.com>
M:      Will Deacon <will@kernel.org>

ARM AND ARM64 SoC SUB-ARCHITECTURES (COMMON PARTS)
M:      Arnd Bergmann <arnd@arndb.de>
M:      Olof Johansson <olof@lixom.net>

-- 
Kees Cook
