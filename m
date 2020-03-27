Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.16764.1585328048847163155
 for <tools@linux.kernel.org>;
 Fri, 27 Mar 2020 09:54:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=f/AXvW39;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id h15so12209681wrx.9
        for <tools@linux.kernel.org>; Fri, 27 Mar 2020 09:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=lykxb/y5JUcais2KuC81BvtYcZUdpauMYFNfkua+/CU=;
        b=f/AXvW39cVqO5zmK10a9zbItzTr26pfGPNWCg1lH5jgD9PEIl+ML/+Bkr9Ab/rwYkj
         mvpqZVKRXffwbLvnFhZShlhAPNFgwr0byYTWusw+jOkHy0QGSCh5UvY3gUA/6o1vYrfi
         2cYByL9OHNouJtUhGWFn4CLISnI/ytA0VjdQw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=lykxb/y5JUcais2KuC81BvtYcZUdpauMYFNfkua+/CU=;
        b=QedMjnvJhZ/DYnSYW6zrCr/8YOVLZNg98qAh+BhIMbyfl3Q0bYBSGfmOuDN+Ko7qVX
         6jTTvenPuYw3mc1aO7NbkxOXE2KXxSYRhAv36975Bvw8HyoEKztJGYSbpcua/jiRvkyc
         IhecEL6wRha4O4TGJimEsmxNBI20QvKH2Qeoc7Bm3wTjdd4opbWrBAbcSmQQgKqMJC4r
         MaUuuRwi7y5x+zeqlK/j/UNXUHe/sWJuyatLmwUtBeWK9MpZgbEYw1sn2xfSXFCQ1h2d
         SCpwBsAh1egCW8CNUVsNNTPE6rNv8qFuweh3o1syCVfUuk+xBlwpOzOZOhi3y4tKNaNm
         lpIA==
X-Gm-Message-State: ANhLgQ0DNccmdknN8Ce10LAkd0aJaP5/plnLIo99FrWhNxU+3Umijp4Z
	vVaKqIwakb6fVqn5kIJJqMU2iHQbQuKBiA==
X-Google-Smtp-Source: ADFU+vtckDHWMQz/pDXzoLmNbYAVA9ZLipHbtK3JOwbDAdUmtLEEASykjTQ6JybQ2SSMH7uLgnXfZQ==
X-Received: by 2002:adf:dc4f:: with SMTP id m15mr336714wrj.219.1585328047253;
        Fri, 27 Mar 2020 09:54:07 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local ([185.220.101.146])
        by smtp.gmail.com with ESMTPSA id p21sm9270840wma.0.2020.03.27.09.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2020 09:54:06 -0700 (PDT)
Date: Fri, 27 Mar 2020 12:54:02 -0400
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: users@linux.kernel.org, tools@linux.kernel.org
Subject: Gmail message ID finder Chrome extension
Message-ID: <20200327165402.slc5l46hc7hlo2l5@chatter.i7.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

If you're a Chrome and Gmail user, you can try the following extension 
to easily get the message-id of an email without having to "show 
original" and hunting for the right header:

https://chrome.google.com/webstore/detail/gmail-message-id-finder/comcoiiifldaaejpbgbincdkoohihbae

The message-id will be copied to the clipboard with the "rfc822msgid:" 
lead, but current versions of b4 will handle that properly.

I haven't been able to find something similar for Firefox, but perhaps 
this is easy to do with a greasemonkey/tampermonkey extension.

Best regards,
-K
