Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A192C80
	for <tools@linux.kernel.org>; Mon,  1 Nov 2021 19:17:26 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id bk22so10827450qkb.6
        for <tools@linux.kernel.org>; Mon, 01 Nov 2021 12:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=I4qm2EF3GDlxXerlqItOcpnB2bwMWZxM9cINrbVZjV4=;
        b=Si8X3IeMTzl4MPMI6sWLZZX4JNO7ORnfT1dxAcSoQI2p3iB9OyAtMS1jUOosEO0IJl
         oguKEZBW9mwMK9Fdybo3vO91KdBf9dWJmb5J6ao4ghfVDbzf3FtxlN949jvFvdkeRTuc
         5q++KAfWZlfEPlU57FAsNJcqx9YoTBYre5+aM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=I4qm2EF3GDlxXerlqItOcpnB2bwMWZxM9cINrbVZjV4=;
        b=KmvtmIgqEccWheqFVGetrg9ni7sEK7I2y1pOj1/AyKxPWWaHXZwCWDujxbsAMYpJKm
         jwHZaxy0idfmcceeNzin+8hZACsqb5pw/Vc/gmAd/oCOR+SpQK3B/9I1NEGRF1pURFWz
         3I0EsitXiIBUCHcYRgHfzgr3aSYV+6N5joVT9loK5ppFJfLLCBSTEN5KdmTysTihxGlp
         foSyrAgIGI7hlrL1vY6oS/G/ouS6DkRrhy7PE1OI9yxDVoNIKbCQJ6y74VtxxVwPWkNy
         v/XuzEXN6JtWKSMAn8edAYsFm61SwXBOPqbVkCQ4TMG/ijB3z2J7wwHoQcwlRX0IHaRV
         xTzg==
X-Gm-Message-State: AOAM532KH7y2reUJZHOyGUmgpp7hKfExfTUCawcOsZJzyZlhj5UdDi9n
	zBLA8mRPRpf6RUhr7+Hzju4BlQ==
X-Google-Smtp-Source: ABdhPJwRmSitez2DRbdWleVZJ40mVHvCTZjDZ5fCSZ7zfrX6InUilTsQUPqJqMIvrH/F5iDVTvPe4g==
X-Received: by 2002:a05:620a:2943:: with SMTP id n3mr24621129qkp.199.1635794245328;
        Mon, 01 Nov 2021 12:17:25 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-32-216-209-220-181.dsl.bell.ca. [216.209.220.181])
        by smtp.gmail.com with ESMTPSA id bp11sm4864764qkb.24.2021.11.01.12.17.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Nov 2021 12:17:25 -0700 (PDT)
Date: Mon, 1 Nov 2021 15:17:23 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Eric Wong <e@80x24.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org, git@vger.kernel.org
Subject: Re: b4: unicode control characters -- warn or remove?
Message-ID: <20211101191723.vnsqrsx2jcw2nd2q@meerkat.local>
References: <20211101175020.5r4cwmy4qppi7dis@meerkat.local>
 <20211101190905.M853114@dcvr>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211101190905.M853114@dcvr>

On Mon, Nov 01, 2021 at 07:09:05PM +0000, Eric Wong wrote:
> > Per exhibit a, what should we do in the situation where we discover unicode
> > control characters in an email?
> > 
> > 1. Warn and strip these chars out, because they are extremely unlikely to be
> >    doing anything legitimate in the context of a patch (unless someone is
> >    sending patches for docs actually written in RTL languages)
> > 2. Warn and error out, refusing to produce an mbox
> > 3. Just warn and produce an mbox anyway
> > 
> > I'd normally do #3, but with many people piping things to git-am, I'm not sure
> > if it's the safest choice.
> > 
> > Exibit a: https://lwn.net/Articles/874546/
> 
> +Cc: git@vger
> 
> IMHO, defense for this belongs in git-am (which already checks
> things like whitespace).

I agree, but even if that is implemented in git, we'll still probably want to
catch this on the b4 side of things until everyone uses the git client where
that's handled natively.

-K
