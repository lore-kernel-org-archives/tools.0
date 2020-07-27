Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
 by mx.groups.io with SMTP id smtpd.web12.57255.1595861546776130089
 for <tools@linux.kernel.org>;
 Mon, 27 Jul 2020 07:52:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HlK1sL+K;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.160.194, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-qt1-f194.google.com with SMTP id a32so12380043qtb.5
        for <tools@linux.kernel.org>; Mon, 27 Jul 2020 07:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=79hYxF+usARbZ00cTWT0kKLV+YzAUU7f35ENcetC1Lg=;
        b=HlK1sL+KARpNJhufFB1oTHqm3sDZ7iTfeH+M/OfU6OP3YcqKnsYWeQibvSZFU4GHwV
         8i6A/YHA6Nq2CcpOi/yGSxsAUA2LhNYcARBANbzGHMDFuSlkNPd3GhLtCsKLkxTv8z2X
         MDJ8JUaGwRoZ+OZpF+A/yVONrWav4D017DOy8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=79hYxF+usARbZ00cTWT0kKLV+YzAUU7f35ENcetC1Lg=;
        b=Pqd3Ok+94I3wXtyE63R5ap6AzZDTEjzTBjybSfYr/5TjKJrW1SznAFDDwRTM7Zrxc7
         7c8SnkfBUG+TmMkosi4vIaaAWzDEOmWY6J/kwsBHfvM94i86Rr8UpUhVGZ8iH9tPimdM
         UxcZElF126AnCvfzZga1jTdymvhpyKzqUDPDGMgBl1135aAqAT5GS77V3cDSiDKCNcMe
         2h55BecGM6Sp7pbFuKLYvj1oeD5GoFg6JJ8zuKXA/6j3YZ7Bf7iiyh656ksrZYk/zZGH
         TgrDulkZV/qKEVEOVSN4dkjXwBK88Q5bB2cY7CvI3wxvW8pQwyH7tlAJ6JAdGN+7B+pj
         bDVg==
X-Gm-Message-State: AOAM531kb8rLa8g2QnFXsUyCl/h1guxVw6dXGc/sxTdGmjfJTbmpB+yR
	2xUbPCZMLHn/WwL7e13iYkdgkg==
X-Google-Smtp-Source: ABdhPJyEDfCmGbKyRhGhoyWb3aX3IjDEaXlK2pGMt4Pq+QXZnJJzxLbbOx4kH5DsihVyj11mt8PCUA==
X-Received: by 2002:ac8:6e99:: with SMTP id c25mr20162562qtv.324.1595861545813;
        Mon, 27 Jul 2020 07:52:25 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local ([87.101.92.156])
        by smtp.gmail.com with ESMTPSA id a203sm18311542qkg.30.2020.07.27.07.52.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 07:52:25 -0700 (PDT)
Date: Mon, 27 Jul 2020 10:52:23 -0400
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: Rob Herring <robh@kernel.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: [kernel.org users] b4 v0.4.0 available with new features
Message-ID: <20200727145223.sb3juyxu3jjrcn5m@chatter.i7.local>
References: <20200424170442.ad3b3j5f5vkbcmvb@chatter.i7.local>
 <CAL_JsqK+FyXZZ3uAcAsVFLYoxjzj_fpMLF=DFe3M2Byi9Fd6Xw@mail.gmail.com>
 <20200507202001.3sststasmemmgr5z@chatter.i7.local>
 <CAL_JsqLoekwTz3QWOCS+iY8ALvc9nhmNjjV+12A=_+gHmdbn0Q@mail.gmail.com>
 <CAL_Jsq+8Ey7CHMObBNTd-EVSkNRca+DrWSABMgEctJjq-BsOGA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAL_Jsq+8Ey7CHMObBNTd-EVSkNRca+DrWSABMgEctJjq-BsOGA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Jun 09, 2020 at 04:24:29PM -0600, Rob Herring wrote:
> > > On Wed, May 06, 2020 at 02:23:16PM -0500, Rob Herring wrote:
> > > > I found a minor issue on patches with no 'To' header. They end up with
> > > > this:
> > > >
> > > > To: unlisted-recipients: no To-header on input <;
> > > >
> > > > However, that appears to be a public-inbox problem as it's on there
> > > > too. Here's an example[1].
> > >
> > > Interesting. I'm not seeing any strange output from that series. "b4 am"
> > > and "b4 ty" seem to be generating proper things.
> >
> > Yes, 'b4 am' is correct, but 'b4 mbox' is not. That's with 0.4.2.
> 
> This is still an issue for me. I'm on current master, commit
> ca902b59c3d1 ("Fix mbox naming inconsistencies").

The reason I haven't really done anything about it is because we 
currently don't do anything at all to messages retrieved via "b4 mbox" 
(as opposed to "b4 am"). We just grab them as-is from public-inbox, and 
that's how those messages are in the archive:

https://lore.kernel.org/linux-devicetree/20200506010809.6348-2-i.mikhaylov@yadro.com/raw

As far as I can tell, this is inserted by some MTA even before it gets 
to vger, as it shows up in other public archives that I could find. The 
MUAs should properly deal with this situation, so my current approach is 
to treat this as "broken as designed".

-K
