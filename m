Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283FF656
	for <tools@linux.kernel.org>; Thu, 11 May 2023 16:04:55 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-5208be24dcbso6262549a12.1
        for <tools@linux.kernel.org>; Thu, 11 May 2023 09:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1683821094; x=1686413094;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AxkrxEP/OhLgvHLCTT52ggxCz3oCMaXGVWJP0jAXHm0=;
        b=d9AZYDf5bMXO+JHgOEQU/wEfJxnw1Mz+sRRktZHip/T19fAGHNtvPT4bOscYTy03sY
         /F9lx6HBRPIxis1wPJckkdZmc1FqcGCj2S2d+w7oOGkrlLm87u7pfNeVnnft74+v7h49
         OlBugx3jnZ6iCeJvSTucsd5SvS0l4HREKVbKc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683821094; x=1686413094;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AxkrxEP/OhLgvHLCTT52ggxCz3oCMaXGVWJP0jAXHm0=;
        b=NVQGigATLPDJh3WB5iaYkY5N2u3fE7gDhVLMDeq55feamTDOe4cazgTbUwZv+BONmB
         PwbeDWpso3B96cjO1GntNAwU3ICa20vO27WLK2y1vyFTg9/X9uvzdg0vPTtQrISi6v2L
         57XWgSQpZtPv1UieUHoDm7bjpp6nsob8wH1cofsB+ywMMCTbwjyqP2p109Wbvx0mOnrJ
         7Og9BJECQiEa2PuqOBa0jhsiJ6Sqxntm3e/DG7Yph40wE5g3g++C86R8TrPe4LFeR9dh
         jq4Z2uFHxm1WxJGP/ja8/hmICvuFzhgJzvHKQKibyLhYWYKN89algA4Iph1/xtccW599
         +9yQ==
X-Gm-Message-State: AC+VfDxo1R08t759FMYN/94W/hlfnarKJ8LBFuwuomYylVnjuZfh5cbM
	1eYjnxdyBnc8ak9vvBUUhmVhDl/AKuYgOyEkxUs=
X-Google-Smtp-Source: ACHHUZ5C32dHOOSsSVA0fe0hlv2rOnExhz8g5SBFlbtUQUYKaULcfrxpL9AGzYEqwfao2DR6KoUONw==
X-Received: by 2002:a05:6a20:1610:b0:104:161c:168 with SMTP id l16-20020a056a20161000b00104161c0168mr1631660pzj.8.1683821094386;
        Thu, 11 May 2023 09:04:54 -0700 (PDT)
Received: from nitro.local ([2001:4958:15a0:30:e305:5a3c:4c5a:1bc7])
        by smtp.gmail.com with ESMTPSA id n3-20020aa78a43000000b0063b7c42a072sm5729518pfa.13.2023.05.11.09.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 09:04:53 -0700 (PDT)
Date: Thu, 11 May 2023 12:04:52 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: tools@linux.kernel.org, Julien Grall <jgrall@amazon.com>
Subject: Re: b4 am/shazam tag accumulation with HTML-ish emails
Message-ID: <20230511-harbor-lamps-decal-93861a@meerkat>
References: <a512454c-2bd6-fd20-dff0-5ec19c8f85a9@citrix.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a512454c-2bd6-fd20-dff0-5ec19c8f85a9@citrix.com>

On Thu, May 11, 2023 at 03:24:29PM +0100, Andrew Cooper wrote:
> In Xen we had a minor error today.
> 
> Given
> https://lore.kernel.org/xen-devel/7E04E3DD-B260-49E4-8543-77BBF8715BCB@arm.com/
> providing an R-by tag, the resulting commit ended up looking like
> https://xenbits.xen.org/gitweb/?p=xen.git;a=commitdiff;h=cb781ae2c98de5d5742aa0de6850f371fb25825f
> 
> It appears that despite being text/plain, there was an extra <mailto:$X>.
> 
> Any chance this embedded mailto can be stripped?

We'll try to catch extra brackets inside brackets.

bugbot assign to me

-K
