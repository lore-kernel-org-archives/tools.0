Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11953234
	for <tools@linux.kernel.org>; Thu, 28 Jul 2022 16:24:37 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id x11so1455625qts.13
        for <tools@linux.kernel.org>; Thu, 28 Jul 2022 09:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=qg+h8/nWh5sSywZpWg+H+2qlQPrQSLBqUAPCZJcJXVE=;
        b=MaY9ll0/KH7TAAAA9I2Yk9O3v3z8hvsfVdkgzSI7qAHvHk0mjIyo92zxyAd9P1gylx
         rai7mcLzSO49kl/Nmh/lWz7j8nX8Nuc9TQIOI2+/pDZSs0iLhKefpsQedmAmElOff/Yu
         BxAyooKhSq4yxtIP37QaSTuugbJiCPQ05K+yI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qg+h8/nWh5sSywZpWg+H+2qlQPrQSLBqUAPCZJcJXVE=;
        b=VVr/u4G9DnfopznvdBi9WP57Xg6oz3H/+25GhIPCv/FWBkGKIIzuA+jU7VfjfBQO89
         YW10S+S9WRlP2KSv6w37ph5ozWr4OaiHwMwlAuKDsJBqed0nZ3svt6LgA2QcDBth8shB
         HHwvs6HC57/KRvLNuxJzzl8ZzqIHyrqFjE73boCoXY2fphbcGxb6SyEHY1kwvAlnvWkp
         OGLc3WIRfcyP0oJe1RE/BDpm4hTREAOCRGzkh+THnz6q9OkK10UpfcUrQ/6nFRpOAQYh
         YeooZQz0uuQC9HGQg0siROs9fxaajBuE2yyj5azWKTy9EI/ozorvjGoVl5nPn+lpvkNL
         pZcA==
X-Gm-Message-State: AJIora+bSW1Fkg+nTS1rWxU1w5B0hWFO8EH3zk5fHzRA2U2Kth7bZLWo
	lg30WGol8Wkgg1by+TUoW8Ry2g==
X-Google-Smtp-Source: AGRyM1scXvcUEukWDWBrizanh3GsRT5CyHYCyfwbrj5TB6TqYmpYxWFohuW/qCt9H6jAWJm1mzjC6w==
X-Received: by 2002:ac8:4e43:0:b0:31e:f583:7e5 with SMTP id e3-20020ac84e43000000b0031ef58307e5mr23446436qtw.384.1659025476749;
        Thu, 28 Jul 2022 09:24:36 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-245.dsl.bell.ca. [209.226.106.245])
        by smtp.gmail.com with ESMTPSA id dm52-20020a05620a1d7400b006a6ab259261sm799370qkb.29.2022.07.28.09.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jul 2022 09:24:36 -0700 (PDT)
Date: Thu, 28 Jul 2022 12:24:34 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Maxime Ripard <maxime@cerno.tech>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: b4 submit ready for beta testing
Message-ID: <20220728162434.eedqnx42sezb2vbe@meerkat.local>
References: <20220716142954.voq4ucnl5wkq7h2b@nitro.local>
 <20220720184835.uhnkucai54alhgo6@nitro.local>
 <20220728160418.sgfns5jsisjsz5hr@penduick>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220728160418.sgfns5jsisjsz5hr@penduick>

On Thu, Jul 28, 2022 at 06:04:18PM +0200, Maxime Ripard wrote:
> I've started to test the current master (9e95d523c9b9), and there's a
> typo in b4/ez.py:
> 
> sed -i 's/crtitical/critical/' b4/ez.py

Thank you, fixed in the latest master. I'm surprised pycharm didn't complain
about it.

> I also have a branch based on an linux-next tag that I'd want to enroll,
> but it looks like we can't enroll branches based on arbitrary commits?
> 
> Neither the commit ID or the tag seems to work:
> 
> $ b4 prep -e 37b355fdaf31
> CRITICAL: Could not find common ancestor with 37b355fdaf31
> 
> $ b4 prep -e next-20220714
> CRITICAL: Could not find common ancestor with next-20220714

You're right, we should support this using -f. 
I'll work on getting that in.

-K
