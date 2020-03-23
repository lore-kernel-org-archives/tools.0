Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.54731.1584975612465003307
 for <tools@linux.kernel.org>;
 Mon, 23 Mar 2020 08:00:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VINaQgvN;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id f3so17464646wrw.7
        for <tools@linux.kernel.org>; Mon, 23 Mar 2020 08:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=VOs8Y9Bh/VDr8nqxm+di41fiSg0LDc6PI3WWwg9ufBQ=;
        b=VINaQgvN9A/OCeY+1Y95q6V0Id1siuh5VvIR5J64TIYgmIn/WnMeqkgL6dAmX6sh1a
         JpRpYmNwds+vY7m86Qp9nw2xuIrT8UAsVzR9olIMCnm1NUE0G44EjbV+LKVTOh/RpeAQ
         Oo7v2h2wlg/O/j/Uc9zTF9IB3RQuv6a2+9uBw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VOs8Y9Bh/VDr8nqxm+di41fiSg0LDc6PI3WWwg9ufBQ=;
        b=TDFayEg2e1n5ny2jCZA9HWonchTufghajZ2F6M7W+jpbLvtZn7ky4WEde5PM3atrPj
         bvVZJv4eFFNflrfrj5AVGz1C7kh5nv90S93XRL1v7EET/x+kWoKWodurUHtv1wXJvnZH
         QfUWZLnhI1bLsdLs9ls3rYsKcxaV3mxjWU8BmpMypDHeb5hcEyA/Qou0ZhWkzuUfyEmH
         ZbPoeGV1Ju/J1L5/wm0ybQv0k/2hO+iDRTV2QIzPepQkr3K3BBrr+wKS3qTQBmfLNxWx
         C059BJlSvZzLlj+2hgbO2GJkN28bqhEij3ert+9GylWQQX4iGOAFA7R/RDrT+CjHOFAj
         96lA==
X-Gm-Message-State: ANhLgQ3UfK8ZclEv/t/zZXetYOZYeggQvoedbqzZwr8IBAg1YwGd/q1+
	YKndKOnQv7o5QEVNXoq6aEN0oQ==
X-Google-Smtp-Source: ADFU+vvtw56wr8q74h+a3bOx0D/X9pqG9ApzEzTIdk1RjJpNICtMKUKOwBlRNPZh/qZdhbAp+j6gEQ==
X-Received: by 2002:adf:ba48:: with SMTP id t8mr30542188wrg.329.1584975610735;
        Mon, 23 Mar 2020 08:00:10 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local (tor-exit-11.zbau.f3netze.de. [185.220.100.250])
        by smtp.gmail.com with ESMTPSA id c18sm22510038wrx.5.2020.03.23.08.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2020 08:00:10 -0700 (PDT)
Date: Mon, 23 Mar 2020 11:00:03 -0400
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: Pip dependency problem with b4
Message-ID: <20200323150003.owxg3xhwtgc7pzap@chatter.i7.local>
References: <1584974859.3780.10.camel@HansenPartnership.com>
MIME-Version: 1.0
In-Reply-To: <1584974859.3780.10.camel@HansenPartnership.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Mar 23, 2020 at 07:47:39AM -0700, James Bottomley wrote:
> This is on a vanilla ubuntu 19.10 system with a fresh install.  After
> doing
> 
> apt-get install python-pip
> pip-install b4
> 
> I get this
> 
> jejb@amdmilan1:~/git/linux-build$ b4 --help
> Traceback (most recent call last):
>   File "/home/jejb/.local/bin/b4", line 6, in <module>
>     from b4.command import cmd
>   File "/home/jejb/.local/lib/python2.7/site-packages/b4/__init__.py",
                                ^^^^^^^^^
Sorry, please use python 3.

-K
