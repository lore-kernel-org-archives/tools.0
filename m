Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web11.6217.1589291848364175747
 for <tools@linux.kernel.org>;
 Tue, 12 May 2020 06:57:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dr24Uk+o;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.222.194, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-qk1-f194.google.com with SMTP id f189so7932445qkd.5
        for <tools@linux.kernel.org>; Tue, 12 May 2020 06:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=yxvWyMjk4nIHu7XthYzOQyOdO3so0YH8Wx8SxOX9aJw=;
        b=dr24Uk+oQzgIYRM6IhDEB11MNfjTC9NRRGVoODOG2UdvQu+BposqbUIr0g/j0/uSfw
         Tkhg4mRlNfjr3xEM2WVSJqdOsn6RKtmT2YgBSl6FCon2shblEdi/lkIye2y+ynRsErad
         rxcGSBN1ZHb+tkRFquoX0Xj5vVjVDDirVCBmw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yxvWyMjk4nIHu7XthYzOQyOdO3so0YH8Wx8SxOX9aJw=;
        b=bDCtEsJkvphU99KVehWUZAjoO+PnKk4pAGiWeaJLf/WDqSbGeMDpylJD214MCbMT5c
         gq4LC7Zb2t2GUV+Nt4Sl3K3jc7xQJeSjOdXhS6STcPlf1Nk5JVpRRPABoWcFtm4ByG0+
         MbmFLiIsgk0wcwfdpiqxAdEKeOK8l+VBXxNzlG00eNX7ci6Od/hnqxAGOPog21XMsmem
         aE78U5Nx09Zm/R7D5KwFbviVSCIjl6y/TeMdFw1ymHH2GmAKnbyndNc961WwwedvELsf
         QcYeIUeAiuNAr0eNQsrU2vahiLPSTOQWZL0T9w2okSyw4rww/FPyYKbngDvaFM64R2Rd
         E9dw==
X-Gm-Message-State: AGi0PuaK8yQJGsHsgbjQfN1q0MTAq7ajlnC75YCgxAwLthAP76ZNe4dw
	6cGMDgHKTThMaNB0FgWpJ7ySLXAVoNw=
X-Google-Smtp-Source: APiQypI3xfvdv1gdOsWYn/0iOCL6jreP8sAtKRmrqFAM+9FYntzJpGiNVWFOVgey5emgf7HRFZoSZw==
X-Received: by 2002:a37:9141:: with SMTP id t62mr20622391qkd.95.1589291847036;
        Tue, 12 May 2020 06:57:27 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from i7.mricon.com (107-179-243-71.cpe.teksavvy.com. [107.179.243.71])
        by smtp.gmail.com with ESMTPSA id g11sm11022609qkk.106.2020.05.12.06.57.24
        for <tools@linux.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 06:57:26 -0700 (PDT)
Received: by i7.mricon.com (sSMTP sendmail emulation); Tue, 12 May 2020 09:57:24 -0400
Date: Tue, 12 May 2020 09:57:24 -0400
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: tools@linux.kernel.org
Subject: Re: [tools] b4 0.4.1 available with bugfixes and minor improvements
Message-ID: <20200512135724.m5qqjogcnpivzyo4@chatter.i7.local>
References: <20200508191929.5l2jzw42fjz47jb4@chatter.i7.local>
 <yq1d0792rfj.fsf@oracle.com>
MIME-Version: 1.0
In-Reply-To: <yq1d0792rfj.fsf@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, May 12, 2020 at 09:50:24AM -0400, Martin K. Petersen wrote:
> 
> Hi Konstantin!
> 
> > - ty: is less naive about mapping local to remote branches when using
> > them in templates
> 
> My ${branch} now ends up being "master" because my trees are based on
> Linus' -rc1. Prior to Will's change, ${branch} emitted the local branch
> name.

I literally *just* pushed out 0.4.2 that fixes that bug (and fixes the 
--auto mode). Please try that out.

> Maybe I could just drop tracking linus/master, I guess I do that mainly
> out of habit. Not sure I've ever actually had to rebase to a later -rc.
> 
> But since b4-treename is already configurable, maybe we could have a
> matching b4-branch option? Another approach would be a "these aren't the
> remotes you are looking for" command line argument.

My goal is to fit in with your workflow, not the other way around, so 
I'd rather fix the breakage -- at least for now.

-K
