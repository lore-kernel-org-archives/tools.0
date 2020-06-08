Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web11.34287.1591633856719693944
 for <tools@linux.kernel.org>;
 Mon, 08 Jun 2020 09:30:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XgNw9DTD;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.160.170, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-qt1-f170.google.com with SMTP id j32so15126588qte.10
        for <tools@linux.kernel.org>; Mon, 08 Jun 2020 09:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ZW8TyYoDzEEmyOwXGwzn5XUKJgitATYMjJUlSbjilFc=;
        b=XgNw9DTDBeg513YhgwJMNYSIOivVeuzCgCngsXNq4IpAnM+WTZWCT+wBrNN9Du8Zbt
         Pc3zg+l22N5/Z2sM4UF9lwWDyBs7IS9PEuKsopBHVsiVcTxwl4SVR90hWEfbEmRL7F5C
         iSJPLtGjvqJgOprOe/xtCIU9g/U/mGRB6EiU0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZW8TyYoDzEEmyOwXGwzn5XUKJgitATYMjJUlSbjilFc=;
        b=N6OZJRuDcSXC9zbOwWQDaToueZ6ajBJqwPuvNJaqgJjAaq+k3wkXDPFh+yj8H4Nx3a
         1DIOU+KwfgWR3RsPflXoveQRETynQciJtPKu0gukDKyWdSbM2F0XKd54Uq03A9Bz8A08
         g1rZrNNOCbQXYG5vkRskCR47YjBChw1skbCdYJRu8be8mH+HkOVIOchlJGEcwU2qpifL
         a7ErU5uOFu/dvrEy+WfDi82XVJ5jZBoWc3s3ftm/714rV27vEVsPO5ypfbkdEpx/guOY
         sCp1SY61Lt5t2HPcSPSuqscuxVeTytdA4miS1SfvDF6WNXrB2KbHDiBBttmWufQEA6Wf
         P/gA==
X-Gm-Message-State: AOAM533hKMmDbAynYZfVGMVaCGnGPHYUdx0e4WCFY+utpJ4kEAYRdICM
	6eKLv7uttDu66IG7s0vHrhLPJQ==
X-Google-Smtp-Source: ABdhPJxR13U5QX8HFeXO+u1vxF1pQFjJCw/WeZQYsdWzSbHjjvLzjWdzC0fqvKsxX2rxwJvq8DdRyA==
X-Received: by 2002:ac8:4d0f:: with SMTP id w15mr24956114qtv.120.1591633855683;
        Mon, 08 Jun 2020 09:30:55 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from i7.mricon.com (107-179-243-71.cpe.teksavvy.com. [107.179.243.71])
        by smtp.gmail.com with ESMTPSA id v14sm8505904qtj.31.2020.06.08.09.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 09:30:55 -0700 (PDT)
Received: by i7.mricon.com (sSMTP sendmail emulation); Mon, 08 Jun 2020 12:30:53 -0400
Date: Mon, 8 Jun 2020 12:30:53 -0400
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@linux.kernel.org
Subject: Re: Tags placed incorrectly in malformed messages
Message-ID: <20200608163053.ut4aqjhtoc3mszhb@chatter.i7.local>
References: <20200608114630.GE4593@sirena.org.uk>
MIME-Version: 1.0
In-Reply-To: <20200608114630.GE4593@sirena.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Jun 08, 2020 at 12:46:30PM +0100, Mark Brown wrote:
> When fetching the message 20200606153103.GA17905@amd b4 picks up the
> fact that there's a Reviewed-by but places it at the end of the message
> after the body of the patch.  This seems to be triggered by the fact
> that the patch submission is not in a standard format, lacking the ---
> separator after the commit log.

Thanks for the report. I committed a fix into master and stable-0.5.y 
that deals with this case.

Best,
-K
