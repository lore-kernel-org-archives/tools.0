Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.18140.1585331206289486172
 for <tools@linux.kernel.org>;
 Fri, 27 Mar 2020 10:46:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=U2Qy7uBJ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.52, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-lf1-f52.google.com with SMTP id x200so1428955lff.0
        for <tools@linux.kernel.org>; Fri, 27 Mar 2020 10:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=OIKEvfpkZMqAwB1cOKqh67XcwyyToQ6X9VRwZ1tIGVA=;
        b=U2Qy7uBJTwNJ7TqqEm4CoJuHHVRsB+Nrp0ovsRamXFvI+F5Woy5a943PN4vsy6ITkI
         wRFM1SKaAeS6RZ/DTT6A3FsujSe45MNatohO+fAMpGbKucHGR9QI9eLDreC/lGMGLmF4
         QiV6M88b0TCeOk7coDiZiElUNVN70iu7rgkRo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OIKEvfpkZMqAwB1cOKqh67XcwyyToQ6X9VRwZ1tIGVA=;
        b=L4aOwGYrtX264BeLHTsVBbcJBZFdKxvSrhJBNUSjbRmisuI2K/xFpofgP2AmXVlG7Q
         CC6f9FqcCT1B324DUxBocjtvW7UwGs/PPPjQ02EpGHJ0RZLcY/VoCXm5L9vtvc2ip8Gd
         Fsrh1gsTsgaO+1cf0jk48UozxyAmWOejKk606ptUgwo+QzL4y+C4mP6ZBBEcP2IKkzev
         x1uZ8Th6Px1Dcpb2r/agYBo325Nhlvxl8tfn5JvwTJLme8mrfdsIIaGfBbaXN4hkiQoe
         /4gdPc1qqlU0rJ3qq3MX3hLjaCbx4YmjALnrDaAy5hNPBHkvm1aRvOe3sq6zPNQA+iGx
         WyIg==
X-Gm-Message-State: AGi0PubttzRI8FWZ3pzAwpGaS2ozz3aHVbE9WtZJ8A8M3HhzxRcZl+iq
	1rImY7bIycz8f+DZEwbtSGeBmQ==
X-Google-Smtp-Source: APiQypLNcM0qOpme/KX54VgLbZV2cOuHIXFGlRYre7asjoay1ATwE2W/Fe2Kl+ABAY73s6BZYo4YiA==
X-Received: by 2002:ac2:4578:: with SMTP id k24mr295119lfm.180.1585331204432;
        Fri, 27 Mar 2020 10:46:44 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local ([193.180.164.196])
        by smtp.gmail.com with ESMTPSA id y20sm3219588lfh.20.2020.03.27.10.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2020 10:46:43 -0700 (PDT)
Date: Fri, 27 Mar 2020 13:46:39 -0400
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: tools@linux.kernel.org, users@linux.kernel.org
Subject: Re: [kernel.org users] b4 version 0.3.5 released
Message-ID: <20200327174639.3an72wofl6tlfgjn@chatter.i7.local>
References: <20200327164537.wxfcj5f7xtwp574o@chatter.i7.local>
 <yq1a741bt2b.fsf@oracle.com>
MIME-Version: 1.0
In-Reply-To: <yq1a741bt2b.fsf@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Mar 27, 2020 at 01:34:20PM -0400, Martin K. Petersen wrote:
> 
> Hi Konstantin!
> 
> > Version 0.3.5 is a minor point release in the stable-0.3.y branch.  
> 
> I started noticing this a few commits back. Sometimes my SoB is being
> added before the patch author's. The interesting thing is that it is
> non-deterministic. I.e. if I run exactly the same b4 command several
> times in a row, sometimes the ordering is correct, sometimes it's
> reversed.

Dang it, I know why this is happening. I switched to using a set() 
instead of a list() when handling trailers in order to simplify 
duplicate tracking. Unfortunately, I forgot that the order in a set() is 
non-deterministic, so even if we sort the list first, the moment it 
becomes a set, we lose positioning information.

I'll put in a fix.

-K
