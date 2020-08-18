Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com [209.85.219.67])
 by mx.groups.io with SMTP id smtpd.web11.68460.1597763764751904887
 for <tools@linux.kernel.org>;
 Tue, 18 Aug 2020 08:16:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IDfRQwOK;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.219.67, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-qv1-f67.google.com with SMTP id w2so9672451qvh.12
        for <tools@linux.kernel.org>; Tue, 18 Aug 2020 08:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=dHlnG02uVoC8kedDIH/wu7mR85bQHrdySzi4/5P+x+U=;
        b=IDfRQwOK9scZdMTKBm7fLXrdlILy6/b/OrPKgm89qZ6skEddvrO9QTfWK8TPruZ2k4
         VvuqRT0yFmfcwExH2K3YYhflPEfbtVC4LkifW3nqKF+v3D+TTF8Pec5ek7EXVBiimEH8
         RgiBw/1fXbTMcMH0GzrPQr/Ge8NkwmRIFdvL0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dHlnG02uVoC8kedDIH/wu7mR85bQHrdySzi4/5P+x+U=;
        b=cq6dSkynXz0iPQuiar9jZUXUd3pR3yE5XphUZYLGO23pUNprndrSDkmg8aPEgSR6wv
         UhzvmkfQlEmQN9iuHnGf34jqOi+NrJsOT1oRFW07XciFkvn4RIAVZAZp0SxuOBBER97j
         0yJDsDGAKwSFxUsXBKp4BLvfTUm1jtSvSoFLQi46QP69SznXsLoJ3kbLsKxYmZiMPFUZ
         VDokFJfrwVsRGiLaiPIYBWF3VckfNSOJkTbFDQUTzXVREQ6ll6mI5ajWDlLXD7g/M6vI
         Qghl+ar64w4zQbSpnrgD5VlJ9zf2pAbjgaip3VRZCNJx/Ur0y/bUq+JQ6eSiyu08i1Dc
         Vw1A==
X-Gm-Message-State: AOAM531peZhPjRIEQdYlmtzBNAwBr9An8IVf55P4zYG6+PCGmaFqnbTP
	JzEs4krNhp8BrGmNdKA7xz0V5gzBV2jzP0Hh
X-Google-Smtp-Source: ABdhPJw7ti0vf63WO0/GGBB872zmotZL1zKStVIr/O3icjoc0ThEcKni2yniq13pvs9xWBd0zIefiw==
X-Received: by 2002:ad4:54ce:: with SMTP id j14mr19985443qvx.185.1597763763314;
        Tue, 18 Aug 2020 08:16:03 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id 84sm20409706qkl.11.2020.08.18.08.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2020 08:16:02 -0700 (PDT)
Date: Tue, 18 Aug 2020 11:16:01 -0400
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: tools@linux.kernel.org, josef@toxicpanda.com
Subject: Re: [tools] Problem with b4 with v2's in the thread
Message-ID: <20200818151601.ewj4spibjbwz7l55@chatter.i7.local>
References: <72f0dace-2283-b905-5ef3-ad623f34e79b@toxicpanda.com>
MIME-Version: 1.0
In-Reply-To: <72f0dace-2283-b905-5ef3-ad623f34e79b@toxicpanda.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Aug 18, 2020 at 11:01:23AM -0400, Josef Bacik wrote:
> Hello,
> 
> I have a thread here
> 
> https://lore.kernel.org/linux-btrfs/941273be-4250-3406-79e4-60ef762c5506@suse.com/T/#m64fdf99cfbdb8914a7f665a1d241f6643a8be389
> 
> That doesn't work right with b4 am, it's only pulling down
> 
> [PATCH v2] btrfs: Switch seed device to list api
> 
> Which is just v2 of the 5th patch in the series.  There's actually 2 v2's in
> this list to address the kbuild fixes, but it doesn't even pick up both
> v2's, just the last one.  I realize this is a weird case, but thought I'd
> report it anyway.  Thanks,

Right, this is not really a case we can reasonably handle without making 
too many assumptions (that could be erroneous). A similar case was 
discussed on the users list a while back and the consensus was that, to 
make maintainers' lives easier, the entire series needs to be rerolled 
and resubmitted, instead of individual patches in the thread.

So, I suggest you respond to Nikolay with "looks good, but please reroll 
the whole series."

The alternative is that you can download the entire thread using "b4 
mbox" and manually edit subjects to make the proper v2 series that b4 is 
able to process.

-K
