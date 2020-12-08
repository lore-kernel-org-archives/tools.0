Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web09.8717.1607435970308170797
 for <tools@linux.kernel.org>;
 Tue, 08 Dec 2020 05:59:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dAobDIya;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.222.169, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-qk1-f169.google.com with SMTP id n142so5780304qkn.2
        for <tools@linux.kernel.org>; Tue, 08 Dec 2020 05:59:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=wRUtlOnDIbwFgAkPl+wgBuumjj3hdL8lT4gdaYVvB18=;
        b=dAobDIyaV0P/52YYmqdcniFxSH9kEdvtg2oFmB8hIDLLhW8HHkPjfxXuRaDaCyLlN3
         Jrmy+4OxfE1o2VlWzJeGSadfdTonxXv+0HwRH9oU25IMFEWkHxvot0rQ8FxqWREQLxEX
         2wtN0pfHXB0rcB8GVNWzLbGPnkl9E5yzaBpPU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wRUtlOnDIbwFgAkPl+wgBuumjj3hdL8lT4gdaYVvB18=;
        b=rCjrbs/V14MpyW/Z5HXrpIqxj4BoRZBqIc9hiUYAvSqa5rtfcx7G8Ipr28z+bO6P8w
         hYcbBLYITINDUSLSGtpdpGc88YypXu0AyPNV46bHkOeqR3GseGU3T6wYlxW+9J/cuHHT
         B+iMwNek8XMduZAnfKTZ3Vh9DARA2a/6IvPx7fZOw3tCniA37jjOhk+yCkfckRYPDS0m
         pJ5109L6jLvd0y84UtMrWU9PqeGXgBiIWoIqmSk2GUFRBSccUjR+lbRYnDWMkWKEx7su
         COP68B8m/2pJIkjNzAiBkglbrLyGXFLQsVK0498jr706kZf3yq099aMejYTjPP4MGxZu
         r+EQ==
X-Gm-Message-State: AOAM530EpVuNUViizHkWQquCIyYPjpetrP30K7OatG3w1wGPpvQOWx4/
	0uzxp2htwj1IMyz/yRlK2duLBw==
X-Google-Smtp-Source: ABdhPJxVuSFk7SgqQLY1wv+WSO7iZZCllTj+F6KJ3DpGihl8VJS+N/ff/gJN9xWx0TmDBuC9USJPAQ==
X-Received: by 2002:a37:d41:: with SMTP id 62mr2095302qkn.110.1607435969386;
        Tue, 08 Dec 2020 05:59:29 -0800 (PST)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id d140sm6509139qkc.111.2020.12.08.05.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Dec 2020 05:59:28 -0800 (PST)
Date: Tue, 8 Dec 2020 08:59:26 -0500
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: Rob Herring <robh@kernel.org>
Cc: tools@linux.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	users@linux.kernel.org
Subject: Re: [kernel.org users] [tools] b4 ty : wrong patch number when cherrypicking
Message-ID: <20201208135926.fax4p7zqxpqgq3wo@chatter.i7.local>
References: <20201030173744.GA995986@piout.net>
 <1642D74B05A23708.27950@linux.kernel.org>
 <20201124182241.sojck3t76qjm5a2s@chatter.i7.local>
 <CAL_JsqJ8s6ry-nkSujEO1Pvxre=rW4p72U-_aadkQ-2Zc93sWA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAL_JsqJ8s6ry-nkSujEO1Pvxre=rW4p72U-_aadkQ-2Zc93sWA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Dec 03, 2020 at 08:03:33AM -0700, Rob Herring wrote:
> > > It shouldn't be -- I have a similar request in the following 
> > > thread:
> > > https://lore.kernel.org/r/20201003193137.z2bpwzlz5a66kkex@chatter.i7.local
> >
> > There is a fix in the latest master that more properly handles these
> > situations:
> >
> > - we record actual patch prefixes when we start tracking a series, so
> >   when we send a thank you report, the actual counters will be shown
> > - when we send a reply for a subset of the series, we will now insert a
> >   "(subset)" into the subject to more clearly indicate to the submitter
> >   that the series only got applied partially
> 
> Could we not modify subjects as that breaks gmail 'threading'. Yes,
> gmail is broken, but there's more than a few users...

Well, the goal is to make it extremely obvious for the submitter that 
only a subset of their patch series got applied -- so I would argue that
Gmail thread-breaking only helps here.

Overall, this would be an very rare situation, so I doubt anyone would 
care enough to get annoyed.

-K
