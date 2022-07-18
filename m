Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A59433CC
	for <tools@linux.kernel.org>; Mon, 18 Jul 2022 18:23:11 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id c20so9359722qtw.8
        for <tools@linux.kernel.org>; Mon, 18 Jul 2022 11:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=nUxZjhEBbU1/EFGvvTepeiaY9Q8ty2hINXbeKvN/WEw=;
        b=TGDAb3WdpoKVJSiZRLfhACDieL0Pu1j4HlW6DrXxNB767exSYh3g9Vr5hnzu0I7Xkn
         +fWsWsbcWEGcgrfkSSKajs66MuSktfi39HUDJNe3O2fWq0/smjEna1V5DxquXzxKjP1+
         6PIiE1bpvn/ItUyqlohcgnJ4rjmNpIlhTGUZ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nUxZjhEBbU1/EFGvvTepeiaY9Q8ty2hINXbeKvN/WEw=;
        b=quHMbQSmVrOjm3xUtY2IoFbLdn9Y4gqC/ylK0rjBtnBg9rMBudHLrvILRzsO1HwIox
         mONb4JjOlq9va2uoAdZdUCluv7n3W0hHnEDNOhkG/YraKsolCAyxpGc2+ma0eDRn4pjC
         8qzauSjIhSU2ZmcUH7ufpDrP6NtsYlzEHrBOqTA92W0JBOWZBMgKAeVKqJkFA5vEdHBu
         2J9NrVEwHtYnQfQAraooi/+FIm7DfVXzus9IUFVh6W3Pw3N3vh42o7I2g/3we+Pi1tGA
         yw3bjxa50LTuEQnRHe7PoSYNjGPf3vpMDCDok53NwakysCjtC8qprjZjCTbXzlYxEpou
         WWUA==
X-Gm-Message-State: AJIora+1sAsp2xxHpy+Non4yIyJLTcrsUSRM8tkw5KnjOUXyeLVqbev6
	DX2fSl2dHgMASGTdU7pOPfPuRw==
X-Google-Smtp-Source: AGRyM1tpfNy9hxFxu2XzUOej72vorKFu7QfdwC3g02CK3t9+G7V/a0UAVy3pFYWqLr8rIl8cyWf29Q==
X-Received: by 2002:ac8:59cd:0:b0:31e:ed36:fffc with SMTP id f13-20020ac859cd000000b0031eed36fffcmr5236183qtf.394.1658168590048;
        Mon, 18 Jul 2022 11:23:10 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-245.dsl.bell.ca. [209.226.106.245])
        by smtp.gmail.com with ESMTPSA id bl13-20020a05620a1a8d00b006b5f8f32a8fsm867181qkb.114.2022.07.18.11.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 11:23:09 -0700 (PDT)
Date: Mon, 18 Jul 2022 14:23:08 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Rob Herring <robh@kernel.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: b4 submit ready for beta testing
Message-ID: <20220718182308.jqauh37cttwfojfy@meerkat.local>
References: <20220716142954.voq4ucnl5wkq7h2b@nitro.local>
 <CAL_JsqKSU6RkynTPyqM9uqdccjRxT1WmVYq4CWLvq0+_TXN+yA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAL_JsqKSU6RkynTPyqM9uqdccjRxT1WmVYq4CWLvq0+_TXN+yA@mail.gmail.com>

On Mon, Jul 18, 2022 at 11:15:00AM -0600, Rob Herring wrote:

[skipped a lot due to ongoing work changing some underlying things.
Not ignoring, I promise.]

> It seems like you are mixing sub-commands and options. Wouldn't 'b4
> submit new|reroll|send|update-trailers ..." or a new executable/link
> for 'b4 submit' be better? This is fairly disjoint from the maintainer
> side of b4 functions.

Yeah, the current set of flags aren't great. Unfortunately, I'm limited by
what python's argparse is able to do, and it can only do a single level of
subcommands. Maybe I will use a separate command for submit, as you suggest.

-K
