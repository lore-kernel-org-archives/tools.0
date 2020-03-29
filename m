Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web12.31731.1585502002182364359
 for <tools@linux.kernel.org>;
 Sun, 29 Mar 2020 10:13:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RF+bplmf;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.43, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-lf1-f43.google.com with SMTP id x200so4872674lff.0
        for <tools@linux.kernel.org>; Sun, 29 Mar 2020 10:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=IXta+m03Awa0Db2jEsp+SiZ/f+r0tub/Gmz5NFG0CEs=;
        b=RF+bplmf2NY0o4iAOwEg51PYuZwl3CUqNu8jcbXpP8yuA5CyGHjKDiqx4OfP2JFVpz
         qqQrKYK++NkTBh9PBQRznG00Te15s+fAohnuuhTSkvWPelwA8ik763xoYwIRdVTsKuBx
         /x9o8N0jFYff64U+6Fa8TE4ol3Fcihjp5w89I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IXta+m03Awa0Db2jEsp+SiZ/f+r0tub/Gmz5NFG0CEs=;
        b=hulcpqc0UDmSa32av8/IZXN2jIl7zE7TrfCZQdNIKwhdG0T/aqye+H+ruP5WZDJZL3
         V4Q2UCNGtwPVRGzfJ1VZHnjpSqJvbAJfLtNlYIA/vVJymFWgtf5am8t6/Fswky4s/5Ol
         q5jfklrK31SIxaAqgqDYMCd+KTK4qX0h3XHxOwjMJzBgNNaKSoyfBKTAco69MyVg1hRH
         e31vv/5Z9xVyI2ef4q5re1qLrwg4BjTefkuRDW6VWqDRyqbosRQacsDIx75/jHU2GfwY
         LzVdsC9NMu9iu9pkJWVhezzH45eZquIeX/En9rt+W08DHteuN7wuiuLR4dksWGUZIS8d
         Iqgg==
X-Gm-Message-State: AGi0PuYlKMTAdX1XfLy11XLBspt7OmRtTT1yH+sotXUPTRQl9C6P+Cpz
	PaUW6kVJrVsXOyu0SGXlUsAtIA==
X-Google-Smtp-Source: APiQypLlu9MDTlr94VRZhXwrT3l/l2RnLTS07LWJVwnDZgUzcBJXADiUMYYQYAT1+ctAuqujeX1n3A==
X-Received: by 2002:a19:4a96:: with SMTP id x144mr2727400lfa.76.1585501999916;
        Sun, 29 Mar 2020 10:13:19 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local ([185.220.101.24])
        by smtp.gmail.com with ESMTPSA id f24sm2364459lfa.17.2020.03.29.10.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2020 10:13:19 -0700 (PDT)
Date: Sun, 29 Mar 2020 13:13:13 -0400
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: [kernel.org users] Gmail message ID finder Chrome extension
Message-ID: <20200329171313.s5qe5ofvmh3uoy7z@chatter.i7.local>
References: <20200327165402.slc5l46hc7hlo2l5@chatter.i7.local>
 <CACRpkdZRXh8gKEyeF-uwnP+GuBWxj_QGHeEL=dDOSMoKx6G=1w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACRpkdZRXh8gKEyeF-uwnP+GuBWxj_QGHeEL=dDOSMoKx6G=1w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sun, Mar 29, 2020 at 04:54:33PM +0200, Linus Walleij wrote:
> > If you're a Chrome and Gmail user, you can try the following 
> > extension
> > to easily get the message-id of an email without having to "show
> > original" and hunting for the right header:
> >
> > https://chrome.google.com/webstore/detail/gmail-message-id-finder/comcoiiifldaaejpbgbincdkoohihbae
> >
> > The message-id will be copied to the clipboard with the "rfc822msgid:"
> > lead, but current versions of b4 will handle that properly.
> 
> Actually, but I don't know if I'm unique in this, for my workflow
> I'd ideally take that thing a step longer so that the drop down menu
> simply had "apply patch" meaning it gets the message ID,
> calls on b4 to get the message, and applies it to a certain branch
> in a certain local git tree with --signoff.

The way I envision this could work is if we define workflows based on 
labels. E.g.:

1. You label a message with "Accepted"
2. You run "b4 gmail apply Accepted" (or an agent process runs that)
3. We then try to:
   - retrieve patch series using lore and your inbox as sources
   - make an am-ready mbox
   - apply to a branch provided in a mapping config
     "e.g. Accepted->refs/heads/pending"
4. If "git am" fails on a series, we label the thread as 
   "Review-Required" and move to the next one
5. If it succeeds, we add the label "Applied"

You still have to do your own merging, though. :)

> I anyway use gmail's web UI to read all mail and keep track
> of what's processed and not by whether is is read or unread in
> gmail.
> 
> Are these extensions to say Chrome hard to write? I think
> if I wrote an extension like that it could save me hours of work
> time, but maybe I'm the only one. I tried to find the source code
> for the above extension but no such luck.

I wouldn't use a chrome extension for this, but it's fairly 
straightforward to accomplish this with a gmail API. There are a few 
annoying things about Gmail that make it not super great for the purpose 
of working with patch threads. Specifically, Gmail ignores In-Reply-To 
if subjects don't match, so while the API provides a "retrieve a thread" 
call, we can't use it to get a properly threaded patch series the same 
way we can from lore.kernel.org, because Gmail refuses to consider them 
all part of the same thread.

The best we can do is do a search for "from:same sender AND 
date:same-ish date AND subject-contains:PATCH", and then go through what 
we got back to reconstitute the patch series.

-K
