Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web12.57189.1584981546020829704
 for <tools@linux.kernel.org>;
 Mon, 23 Mar 2020 09:39:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YhIMFG9s;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id m3so233429wmi.0
        for <tools@linux.kernel.org>; Mon, 23 Mar 2020 09:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=lbJeHUpq9TeORCsLFnNieieVv77Uliwl3cFA03DCeJc=;
        b=YhIMFG9stQ+oY5tuP5GC9LImYuuOYmI5z6wL5ttNerr8cdQd8z5AZP3EgZrt1k2nTs
         rTPyR+Mm2+jC2XkTJORbKP4sdNxq55LrM3raVj9p5BMjyjHgF74ImNus7MBU2hA8+E35
         W7enFUfq5Rt1dyOFLgAA1Xw67Y8lbkLyd8d0Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lbJeHUpq9TeORCsLFnNieieVv77Uliwl3cFA03DCeJc=;
        b=lkOniLIWLw4I5gsabM62gj5RMt7tjHKISSAStQBwqADc35H+lH4+F0FHCSah6DiIhC
         gu4QFsDDb3Fx6L/TV7L/bj9nN7TY+0OHxDemrZC782R4n5WL2XV4yCLjhrW+Agc1pziy
         tq6wCRruhJAuJoKQ5zZRLtj3SrxQVpoGHdGmaBP2vCm9EO7ajWgXKLwS12tsCT6w8g6O
         OAk/Cg/ZR4L3yFc0KGz70i6lERHF0VAqVhFr5by98q6nP3UmKf5BDgrg3a5poxhzvqcy
         G3qcwfzIy/ke7I2LQkemrGOXtoRJLGktBTu5QgXqA2Aqgij8JqrmpX4JeXBliVWAOJSr
         T4bw==
X-Gm-Message-State: ANhLgQ0wxo7YgXA7s90tq56JavllYq209SzokpoDL0g0/l6G2IkQM/I7
	jyBz3iCJQ3t/7wVVHKRAKKNg9Q==
X-Google-Smtp-Source: ADFU+vtuJEKqutW97ad1ouo/QbWBiaYQ72AuP6hdAsNglQJPCYhoszxWcs7+itdAVXM0sfCyXqh2NQ==
X-Received: by 2002:a1c:5443:: with SMTP id p3mr81699wmi.149.1584981544535;
        Mon, 23 Mar 2020 09:39:04 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local (tor-exit-1.zbau.f3netze.de. [185.220.100.252])
        by smtp.gmail.com with ESMTPSA id c7sm25141269wro.75.2020.03.23.09.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2020 09:39:03 -0700 (PDT)
Date: Mon, 23 Mar 2020 12:38:59 -0400
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@linux.kernel.org
Subject: Re: b4 message ID shortening
Message-ID: <20200323163859.xyntfstr5o2uv55q@chatter.i7.local>
References: <20200323125456.GC4948@sirena.org.uk>
MIME-Version: 1.0
In-Reply-To: <20200323125456.GC4948@sirena.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Mar 23, 2020 at 12:54:56PM +0000, Mark Brown wrote:
> When generating filenames to save messages b4 am looks like it truncates
> the message ID to generate the default filename (or possibly uses a
> portion of the date now I think about it, I didn't read the code).  For
> example
> 
>    https://lore.kernel.org/r/20200320232515.GA24800@embeddedor.com
> 
> results in a mailbox
> 
>    20200320_gustavo_embeddedor_com.mbx
> 
> which is all well and good except if you also try to save:
> 
>    https://lore.kernel.org/r/20200320232556.GA24989@embeddedor.com

It doesn't really shorten it as much as it tries to create a descriptive 
enough "slug" that is supposed to help you identify the content by just 
looking at your dir listing.  How about we throw in the patch/cover 
title, e.g, for that particular case the slugs would be:

20200320_gustavo_spi_spi_s3c24xx_replace_zero_length_array_with_flexible_array_member.mbx

and

20200320_gustavo_spi_spi_fsl_lpspi_replace_zero_length_array_with_flexible_array_member.mbx

This used to be the scheme in early revisions, except filenames ended up 
being freakishly long. An option is to truncate them if they go over a 
certain length.

> it generates the same filename and silently overwrites the first
> mailbox. 

I can do the -1.mbx, -2.mbx, etc when we find existing files, but I'm 
worried this will be annoying for people who are rerunning the same 
series for the purposes of adding other flags. On the other hand that 
would be safer.

If we have more disambiguated .mbx names, would you still prefer not to 
overwrite existing .mbx files?

-K
