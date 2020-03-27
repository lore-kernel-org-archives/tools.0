Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web12.18611.1585332263897651423
 for <tools@linux.kernel.org>;
 Fri, 27 Mar 2020 11:04:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bBhhNJPE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.66, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-wm1-f66.google.com with SMTP id z5so12363224wml.5
        for <tools@linux.kernel.org>; Fri, 27 Mar 2020 11:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=lbVsTvMDLPvp3ikhHsN9Z7QHJ+lb8n6H5pjXL78Z5rE=;
        b=bBhhNJPE2ACuwhV7tL/7nB3DkiRTiiVULvQCm00lCXkV/B7mpA+/Z5pjcPSwA0D/sU
         1vb0qSMnwHF84nIrKX7n5rNzjD5XgCAIaLQAkVpHcO2MkcrT9VEzmlgdKQ7QLixzx+cV
         yBEXugRvW2luresvheq9VfzggkAgloCbVGnc8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lbVsTvMDLPvp3ikhHsN9Z7QHJ+lb8n6H5pjXL78Z5rE=;
        b=VPwbhqSQNbJa6SfIBmBg8BKqWCyMfRZakZaGqsa/9eJkeyAR3+ohunYp9CajustnNu
         MsXmnAXqR/8vWw93eg5QlM9nP99slow3JLjdnKCe4KxpG0fR2NzKEAB8G6mleHJNrvK5
         JvcPe4sI0ubHyXndTjIMVpW3hcSsuc7MJyGBhmpIYKXMGCSFqw2GxIy8bEbOT5cIsdQ6
         FsheBVH2k1rpqV95DDymLrovIq6kk4iWaGGBsqH5VJoZ0EGDVVPjwbzCI05JCYGHIseZ
         U3i4bdlituKoOjKaqJhMdQ/8ZsKLSZzgYU2LHtvQ0YcDpqEqQ4wZovMp8DOIspAYfHuc
         LQTA==
X-Gm-Message-State: ANhLgQ1q5HSVNaC9Op4jD45GMCL+Y9RzkVrsuKLXkbyXIWfE+OlV3kQd
	j1IFz8Bd9hVdZ1UX80XKo/7aAirsd1ja5ihH
X-Google-Smtp-Source: ADFU+vtYaJLZQqVttwPFNuIJGpYA3C/3SOpPtQqhOk68PzDOYOXJEtP8wxMzD4Etyu2rQHjVx2i8Tg==
X-Received: by 2002:a1c:721a:: with SMTP id n26mr6626883wmc.25.1585332261853;
        Fri, 27 Mar 2020 11:04:21 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local ([94.237.76.207])
        by smtp.gmail.com with ESMTPSA id l17sm9533227wrm.57.2020.03.27.11.04.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2020 11:04:20 -0700 (PDT)
Date: Fri, 27 Mar 2020 14:04:14 -0400
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: tools@linux.kernel.org
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>,
	users@linux.kernel.org
Subject: Re: [tools] [kernel.org users] b4 version 0.3.5 released
Message-ID: <20200327180414.bggwsgfa2k3yqmz4@chatter.i7.local>
References: <20200327164537.wxfcj5f7xtwp574o@chatter.i7.local>
 <yq1a741bt2b.fsf@oracle.com>
 <16003A554CE54555.17905@linux.kernel.org>
MIME-Version: 1.0
In-Reply-To: <16003A554CE54555.17905@linux.kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Mar 27, 2020 at 01:46:39PM -0400, Konstantin Ryabitsev via Linux.Kernel.Org wrote:
> > I started noticing this a few commits back. Sometimes my SoB is 
> > being
> > added before the patch author's. The interesting thing is that it is
> > non-deterministic. I.e. if I run exactly the same b4 command several
> > times in a row, sometimes the ordering is correct, sometimes it's
> > reversed.
> 
> Dang it, I know why this is happening. I switched to using a set() 
> instead of a list() when handling trailers in order to simplify 
> duplicate tracking. Unfortunately, I forgot that the order in a set() is 
> non-deterministic, so even if we sort the list first, the moment it 
> becomes a set, we lose positioning information.
> 
> I'll put in a fix.

The latest commit (in master and stable-0.3.y) should fix this.

Best,
-K
