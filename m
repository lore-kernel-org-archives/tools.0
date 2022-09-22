Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24653C26
	for <tools@linux.kernel.org>; Thu, 22 Sep 2022 14:22:19 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id c19so6225625qkm.7
        for <tools@linux.kernel.org>; Thu, 22 Sep 2022 07:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=yDnv+w5flGaUGCPEUPpKrzhhoEK8Avu/tGVFN5p/AxM=;
        b=bkSS6H/AaV7HpXLEvzFxqaHejQVJS5FXkOsnRlrcKYKjIHH7DiI9JgPckOyi1y8Yb5
         P6RN8PhLiZlemPwj0XVAANzAGdSDtTAxyiq/tqOI51ZznmiQaF3oVSjtra/I4HqL37cV
         z2kVx68WstTDY/AQxJpV2EKphSZuvc9XCnhiI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=yDnv+w5flGaUGCPEUPpKrzhhoEK8Avu/tGVFN5p/AxM=;
        b=vA96KCF2XNvnZlj5kgwmG4bMVde9YfGR1PHMucwBibsVFnzggo/zeBwcOi3Cvn0ehK
         pVauhdEOwJEDRkLBJEm9jkFZKnd5+SqII9mDpLwUX/9n4ZEy01z0thfeUq3cpqNTX1cm
         3kBqEQ3goT00NltgjeKDzOHS3o33UMPqedfTgArZHaEyDXfe6hXWnVSFiCGAYHu6vYlE
         dztoAmn7toGK2LJrTXBAsq8QUIzKPkLdItZuFkREY1pgoI/VRqWyTtzXQbr8JR8jORyp
         znraBMVnL3U75aiLxF1vLaIODVTVTlm2nM60Kx1vK6A0Jhql3CVVF7S9+ODAVXwJuhpn
         QKQg==
X-Gm-Message-State: ACrzQf2ZoV/VwTS8sgTPazsBBLyb+sOmjbLOINWJG1VToqhEn4cWqBOA
	PsGW/FSTn4sNgRWImXg21Z/kPeJuRb8UZQ==
X-Google-Smtp-Source: AMsMyM4Q1vlYk2HEALhWiKM0+M79ACs92rq9u7ZJNgW3tChK40IUPPRoSHpcddoOkHskCPAbAL9RCQ==
X-Received: by 2002:a05:620a:4549:b0:6ce:76ce:3400 with SMTP id u9-20020a05620a454900b006ce76ce3400mr2316738qkp.328.1663856538539;
        Thu, 22 Sep 2022 07:22:18 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id n10-20020a05620a294a00b006b8f4ade2c9sm4229841qkp.19.2022.09.22.07.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 07:22:18 -0700 (PDT)
Date: Thu, 22 Sep 2022 10:22:16 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Guillaume Ranquet <granquet@baylibre.com>
Cc: tools@linux.kernel.org
Subject: Re: b4 send: missing diffstat in individual patches
Message-ID: <20220922142216.vpetai65om2bvv4l@meerkat.local>
References: <CABnWg9uBOGqJMq=yCtn7SoEME=+2u1-ZK9ftb6=_jRhkhL_jiw@mail.gmail.com>
 <20220922132910.gz66mwjcdd7ljd6j@meerkat.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220922132910.gz66mwjcdd7ljd6j@meerkat.local>

On Thu, Sep 22, 2022 at 09:29:10AM -0400, Konstantin Ryabitsev wrote:
> > The serie was sent with 0.10.0-dev (master from some weeks ago).
> > I've just retried a dry-run with the latest and the diffstat is still missing.
> > 
> > I haven't seen any option in b4 send to produce the individual commit
> > diffstat, I will have
> > a quick look if I can propose a patch.
> 
> I'll try to put that in today.

This was an easy fix, so it's in master. I'll backport it into 0.10.y stable
later today.

-K
