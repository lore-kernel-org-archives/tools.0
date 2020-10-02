Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web10.14077.1601644435764981790
 for <tools@linux.kernel.org>;
 Fri, 02 Oct 2020 06:13:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DbUKc00L;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.222.172, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-qk1-f172.google.com with SMTP id q5so1236315qkc.2
        for <tools@linux.kernel.org>; Fri, 02 Oct 2020 06:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=luj9eIT8LQ0qwhcr05g83sFr1lZFzPrhY3QCoHmpsDM=;
        b=DbUKc00LHJj6v+TzjTd6jg9C1tC9HCtVIHPzMN5XSHh5DUINRnUnoNua7fyKAsFV5l
         MI1iTczutuhiu3lHFliEdWAshklfTF4rXVT/h0CITq0eCyc71RY15Gx5xGHy5gQA4kyv
         udeDAvQjhJerARJUBeFExyaEp0xgQg+IRtx1E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=luj9eIT8LQ0qwhcr05g83sFr1lZFzPrhY3QCoHmpsDM=;
        b=Ig1rhpJXJkO6Hh08f94XgEVVuN6eeFEphIMzi5fzjJ75bGXBJEHYchlWku4bXgbD7H
         m7/unEJlpEyDtZkygbPid7kviU+7v+ZRIEMHTfXdlgDQ8QHfb/1mouR3UgddpWnpvxLs
         Lw7UKElmq+htDvq9lS09iU2bh4WiY0Rkx69hFyKbUrDRthuMmWC25HloPwRc38m4l43r
         NHO50jHoIvbX07xlR6w53wDhNXFa06CCumfC2wWglRE2DDizK0Zm/+IuWz37tGLHM9cs
         7ZfKgzz2enRrmMIM7JcTccfTh4blM9oxyWuWLF8GfkA0/vbA8MiiUyGuN/TPcj9EM7xV
         FP9g==
X-Gm-Message-State: AOAM532UiwIzabzWcjYzi9I3LR8gAycFTSGBZCMJ5+OCVq6Vvs3sxd+r
	pFpqfC/DQCfrw8Lv4U5Q8C05yg==
X-Google-Smtp-Source: ABdhPJzzwn6CmkKmEZLJHWf4aJzOIDE+ndodHXfe16P1qPTa1uBKeE/M970Z2T5+mPOgyUkSClGlpA==
X-Received: by 2002:a05:620a:13a5:: with SMTP id m5mr2078312qki.280.1601644434705;
        Fri, 02 Oct 2020 06:13:54 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id b199sm993235qkg.116.2020.10.02.06.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2020 06:13:53 -0700 (PDT)
Date: Fri, 2 Oct 2020 09:13:51 -0400
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: b4: 'NoneType' object has no attribute 'msgid'
Message-ID: <20201002131351.yq55y53ztsdlfkua@chatter.i7.local>
References: <20200820154740.GA5195@kozik-lap>
MIME-Version: 1.0
In-Reply-To: <20200820154740.GA5195@kozik-lap>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Aug 20, 2020 at 05:47:40PM +0200, Krzysztof Kozlowski wrote:
> Hi,
> 
> I hit Python exception (AttributeError: 'NoneType' object has no
> attribute 'msgid'):

Thanks, master/stable-0.5.y now properly handles cherrypicking from 
incomplete series.

Best regards,
-K
