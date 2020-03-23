Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web12.1215.1584986698437718331
 for <tools@linux.kernel.org>;
 Mon, 23 Mar 2020 11:04:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LFMMe7ai;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id b12so400063wmj.3
        for <tools@linux.kernel.org>; Mon, 23 Mar 2020 11:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6OlISYDrDQt5yudZS6wPwg/grVVu9tm43tD/lEu2wJ0=;
        b=LFMMe7aii2xjGxeR+/7tWsUehEVLdkMEr4t2wqT/VpMtaW2YGFLJ17ey6khEGmHe+5
         nmnDQOTEU2GPKY/Y/a0s4XwngLfydXN2wWgy3nrRFHrRUfbM03Qk8TxeEX51/gG1DXhV
         irsT1GlVfCjRKvjz2CfS1mg1b5lz43B+OyCmM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6OlISYDrDQt5yudZS6wPwg/grVVu9tm43tD/lEu2wJ0=;
        b=qgOFJ7U/Dx+bI3lXpvMbIwDLhjexdBBim5puWfu9HnpjnMvXU6ikgC+TmdUBoRtIBB
         vn0vgBdET0VLKKr6oKEazDatsmKiZpKFGb/wxMV9rWNssZuhcxxEGAutk7d+LSnJzAlE
         qfMwFmD4DxAOVo/XDeflf5HqPK5hVIc4dcoKeXU+k8JH7mWghaUKjaP1QTo0ZCfurnkI
         FCf3x4M7uW3mmn3ViUtydaTyV/THi7ofI0k0YUL50XYOy0HwIx1Bg9UZyxlQuehKMSFM
         +Bx9m2YexeCafdbAJTvSpCs1EyOSUohvwSyEHqO1X2gwDfsy8nycWQjfOat2zufmfQhA
         V0pw==
X-Gm-Message-State: ANhLgQ27gUW+3rlrYUvmHFjku52IZVoHq05v8Zl8QeDBjGVlD/S75l9p
	f2/b7xa/sHK2Kw0Lf79V+qyw9A==
X-Google-Smtp-Source: ADFU+vu5CMU3W5oJ/xU4awO46mcFaWeh4Du3JCbCNdIMDXrMX41LVrW7B1FYDfmFGPl/7D2FSNMuhA==
X-Received: by 2002:a1c:6745:: with SMTP id b66mr591558wmc.30.1584986696044;
        Mon, 23 Mar 2020 11:04:56 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local ([185.220.102.8])
        by smtp.gmail.com with ESMTPSA id k3sm451005wmf.16.2020.03.23.11.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2020 11:04:55 -0700 (PDT)
Date: Mon, 23 Mar 2020 14:04:51 -0400
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@linux.kernel.org
Subject: Re: b4 message ID shortening
Message-ID: <20200323180451.ny2x2ujqqh6h6yqu@chatter.i7.local>
References: <20200323125456.GC4948@sirena.org.uk>
 <20200323163859.xyntfstr5o2uv55q@chatter.i7.local>
 <20200323170512.GF4948@sirena.org.uk>
MIME-Version: 1.0
In-Reply-To: <20200323170512.GF4948@sirena.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Mar 23, 2020 at 05:05:12PM +0000, Mark Brown wrote:
> > It doesn't really shorten it as much as it tries to create a 
> > descriptive enough "slug" that is supposed to help you identify the 
> > content by just looking at your dir listing.  How about we throw in 
> > the patch/cover title, e.g, for that particular case the slugs would 
> > be:
> 
> > 20200320_gustavo_spi_spi_s3c24xx_replace_zero_length_array_with_flexible_array_member.mbx
> 
> > and
> 
> > 20200320_gustavo_spi_spi_fsl_lpspi_replace_zero_length_array_with_flexible_array_member.mbx
> 
> > This used to be the scheme in early revisions, except filenames ended up 
> > being freakishly long. An option is to truncate them if they go over a 
> > certain length.
> 
> That looks good for my usage, long filenames aren't a concern for me but
> I can see some people might not like them (perhaps a configurable
> length, or perhaps that's overthinking it?).

Yeah, let's try to be more disambiguatey without piling on too many 
config options. I pushed the above change.

> > If we have more disambiguated .mbx names, would you still prefer not 
> > to overwrite existing .mbx files?
> 
> I think it's the silent bit as much as the overwriting bit that caught
> me out - I didn't notice that it had overwritten the existing mailbox,
> if it had said something about replacing an existing mailbox I'd
> hopefully have seen that.

I'm hoping that with the current change this will be a rare enough case 
that it doesn't cause problems. The output is already fairly verbose, so 
I'm wary of adding any more warnings to it.

-K
