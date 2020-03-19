Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web10.3572.1584646151892916896
 for <tools@linux.kernel.org>;
 Thu, 19 Mar 2020 12:29:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JrzSqObl;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.66, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-wm1-f66.google.com with SMTP id c187so3942949wme.1
        for <tools@linux.kernel.org>; Thu, 19 Mar 2020 12:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=Fby/92Z+Yk7tD+8oHKlfzEFNtdnY61e52vPY4V8xz5w=;
        b=JrzSqOblxh835vXIDAaEWMSm+rF8btoZ6A197srsgX1j0XdgLPkYjKFVDtln02IxKH
         gn4lrSRlHT1AqMACTsXKJFL5KTnOP1FGWBkSKCVawImjdDKzHzFyecQ+wfPzlcJs6Yay
         pVYw0DXV3wp0Sic5uS8Zf3MUxPOGiETJPfYco=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=Fby/92Z+Yk7tD+8oHKlfzEFNtdnY61e52vPY4V8xz5w=;
        b=p6MBpvTwTKorqZZh5tPLJfVtOOW22iSzHsWH1MHG2hgRw4wQGi+BhvPIm5eC3z8Ean
         7XklrQLAY5s0aTazBIsGV0mgXEFiH9FmENHpRtlhqeORhwEdGafSz+wUbGi9y/02R+XL
         MwPwYMyqKqIyD9ztcijH5M1FX3/BF+NSaglpYKl+zi+pHgziofdvHeWFWrLGhyJQX7RL
         lGb3db+3Ohew8evkYzbpgmr3qLq4Md5OPI5H3o0s2QYLDrbw3Q31mqwzyPYDgHKOb6fd
         z/ZSpP3f0bEr7Q0dteXn0ODM1JHUk+0MJ8q3gS0dceOyJF4XvIQE+/bPAYLxzbVUQ4G9
         +bWw==
X-Gm-Message-State: ANhLgQ1qwUqWzeSMk3II2aHh3iRI+qDKRL8t5lUt86tzZxy9RB7SkUF3
	nMH3honYA5QI9+8QCvcc4VRDpJQuZDVsmqzT
X-Google-Smtp-Source: ADFU+vudzdQzPGX3RpYIOsDPTriMqed3LC1Nujg7HV3jMlFeIjaNuVQQ3xKiVMXPnAGWR4z+dZplVw==
X-Received: by 2002:a7b:c5d9:: with SMTP id n25mr5734249wmk.160.1584646149961;
        Thu, 19 Mar 2020 12:29:09 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local ([185.244.39.233])
        by smtp.gmail.com with ESMTPSA id f15sm4332839wmj.25.2020.03.19.12.29.08
        for <tools@linux.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2020 12:29:09 -0700 (PDT)
Date: Thu, 19 Mar 2020 15:29:05 -0400
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: tools@linux.kernel.org
Subject: Running b4 from checkout dir
Message-ID: <20200319192905.notdqutv5lnb5tzq@chatter.i7.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

If you don't want to install the pip package and want to be able to use 
the git checkout version directly, just add the following wrapper to 
your bindir:

   #!/bin/bash
   B4DIR=$HOME/your/path/to/b4-git-repo
   PYTHONPATH=$B4DIR env python3 $B4DIR/b4/command.py $@

-K
