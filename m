Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0D772
	for <tools@linux.kernel.org>; Thu, 23 Sep 2021 12:31:55 +0000 (UTC)
Received: by mail-qv1-f52.google.com with SMTP id gs10so3951716qvb.13
        for <tools@linux.kernel.org>; Thu, 23 Sep 2021 05:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=LbmkRfayhKQTGyIMYtq4WY5HmBuRNVA1Nh/5xFjVBuY=;
        b=AlpmvS5W3OklHkHIbb9PZCCIXUtOFDFCR2z0tjiU1AZMsqAU0jTA7nsb4+hYob3xxI
         qnUb+eDEpK+ukoOzBQB0qAknpWdRjv8fhQqFpeR43G7gBWlhD1/5xhzx/hUxyT+G6yLG
         6Vk5vv+k7xJc+9NOqCHM+AakG31LmcfEg4CSk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LbmkRfayhKQTGyIMYtq4WY5HmBuRNVA1Nh/5xFjVBuY=;
        b=RXRG1LBgC662bKR6v/kLmZfKmENjP8xD8a8uU34xVUUz9+DU9RkxSCTSeQgrhdTdr8
         cHdivQKS9HZzDiCZyb/3UTswIgQnNLyZlzZCE6NAbwbL9Pibnj2nrPJKuaUhyR4at2YY
         w0+GIl3cDsv2HRXDNLDp0bWXE3xqpGFZ1K6LCJunPiczHvvhiLFw46UROHTz5IHatFbS
         dMiGfr3cBjdh0syl/syBpphOco4NxEAT1vqKKQgj1iDHQsj4JQnYrqVfS+G3uLafD7K5
         Cxr5gs+5HBxr0QDo4F36/zONDLp6RLGqK6kGLOaGykje6JH8jHSxUJuhnJjM3ebk2XHD
         Pi8A==
X-Gm-Message-State: AOAM530VrmRSF4lPPMDn80so3iEV+KaqYC6SoQ97Jngoxgno4WxGp78G
	v3NSn6YSMHdh5+jeURB91WGzKg==
X-Google-Smtp-Source: ABdhPJy4UUv/rd6wKBh3Dq8Eqx0gdOnQbxKrhCmbJ7dykIlwnTCP6m9CPwVyb/88CwP4hvGeOclarg==
X-Received: by 2002:a0c:9043:: with SMTP id o61mr4100980qvo.54.1632400314251;
        Thu, 23 Sep 2021 05:31:54 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-32-216-209-220-181.dsl.bell.ca. [216.209.220.181])
        by smtp.gmail.com with ESMTPSA id j18sm3921384qkl.12.2021.09.23.05.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Sep 2021 05:31:53 -0700 (PDT)
Date: Thu, 23 Sep 2021 08:31:52 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@linux.kernel.org
Subject: Re: Issues escaping Froms
Message-ID: <20210923123152.bo75gckjbrsibtiu@meerkat.local>
References: <20210921115544.GB4203@sirena.org.uk>
 <20210921124926.5j5z4pdedkk4ulwc@meerkat.local>
 <20210923120820.GA5177@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210923120820.GA5177@sirena.org.uk>

On Thu, Sep 23, 2021 at 01:08:20PM +0100, Mark Brown wrote:
> > There is no working around this, short of saving everything as maildirs.
> 
> Hrm, right.  That's awesome.  There's something fishy going on here
> somewhere thoguh - I'm also seeing it failing to find the patch in
> 
>     60f0c65bbd52479cb83683b8475af435@bytesnap.co.uk

Hmm... this looks like a bug. I'll check it out.

-K
