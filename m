Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088BC2FAF
	for <tools@linux.kernel.org>; Thu,  9 Sep 2021 13:38:42 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id bk29so1745922qkb.8
        for <tools@linux.kernel.org>; Thu, 09 Sep 2021 06:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=YyiDjE646wCMSmzNAvvGakaZMZIVc6iodaJin5DQ2FI=;
        b=SORAqfZKZMMTXZjLO4t20KcJXwpXh0lr4fLj1/SEp5rggPoEEunSbb1P9Z3n/WXHq1
         7m8Ffm6rrCN0xgOEfobDucotOEagatmqZF5kMJu/mw3y7Z2kbQyXKtbnPQ2WfO2+5b+m
         QNXoanRT6Y2lT5r8y/JRU2muPVw16Spxi4sU8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YyiDjE646wCMSmzNAvvGakaZMZIVc6iodaJin5DQ2FI=;
        b=5bF94dMErVQMuQPA+klIujJuvZlY0gWoyFyErGbW7eEqcc9ISA4Ywq/rFrM0EYCWhC
         wrpOspqfSSZXJQQflzgDyIRFnMDfmp9Z9gEIdxERvfnV7ZvOMtVbCjucVGRyPpAGfN6D
         hLdDGOifEGJJyAxYMTQk3haMuu4hSK6VKFFhxIJBsbq2b5n6R3N1+of9VMJGQwyfnap7
         42OKOKGFHledMd8Fo/q+a79+len2nRs1oXaYVTCZEGE7GY9ZryqprbjWBaYTf3akc7o+
         Bzms+cNjaoHLLzRIZkBe64dQSQ+3lX8S+6EMMdwJECl44Vhq08lbFzZYy3Z1/D6bMTiY
         vDqA==
X-Gm-Message-State: AOAM531VjrLGvZyeCDmkCimcmzLXIM/gcdZ7sty/qKiUVbTSk+/tmUI9
	10MTWWiGUrWNEIO00aBl932Lxg==
X-Google-Smtp-Source: ABdhPJwxr+dSHsuKRUlMFm1KKfjO3B+NWFzk212/U/+BZwmMahBlma90t8TUcU24BEeeGtDAIUDo4A==
X-Received: by 2002:a05:620a:4151:: with SMTP id k17mr2741821qko.51.1631194721971;
        Thu, 09 Sep 2021 06:38:41 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-32-216-209-220-181.dsl.bell.ca. [216.209.220.181])
        by smtp.gmail.com with ESMTPSA id m16sm1272374qka.84.2021.09.09.06.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 06:38:41 -0700 (PDT)
Date: Thu, 9 Sep 2021 09:38:40 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Lee Jones <lee.jones@linaro.org>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Jason Gunthorpe <jgg@nvidia.com>, users@linux.kernel.org,
	tools@linux.kernel.org
Subject: Re: New version of lore available for preview
Message-ID: <20210909133840.hezwxmojt4o6lm7o@meerkat.local>
References: <20210818190750.g3xedu7j24sqndo2@nitro.local>
 <20210902195332.GA2493828@nvidia.com>
 <20210902201402.bbdttirbb5ckrtiz@meerkat.local>
 <CAK7LNAQogtzDbAFDtRt7UvDkH6K4tkQgwfmu-2_0rGgo_Uj_iw@mail.gmail.com>
 <20210903152143.nt5mzgwprltl36pa@meerkat.local>
 <CAF2Aj3jbU_vnKvYB2EJXuKdTCeJx3dgZY2h7sriJX4fP6Fsteg@mail.gmail.com>
 <20210908183746.iancht34j3drun77@meerkat.local>
 <20210909084907.271b6df5@gandalf.local.home>
 <YToM6bH/I9rHQMeE@google.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YToM6bH/I9rHQMeE@google.com>

On Thu, Sep 09, 2021 at 02:32:25PM +0100, Lee Jones wrote:
> In my current implementation, I have pwclient pull down the patch,
> apply my SoB and apply the it, all in one foul swoop:
> 
>   pwclient git-am -p ${project} -3 -s ${pwid}
> 
> Does b4 provide this functionality too, or do I have to script around
> it?  How have other's chosen to automatically apply the downloaded
> mboxes?

b4 am -3 -s -o- msgid | git am

-K
