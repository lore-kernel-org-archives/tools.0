Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web12.2025.1588965572813842210
 for <tools@linux.kernel.org>;
 Fri, 08 May 2020 12:19:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=I1T61cGx;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.222.172, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-qk1-f172.google.com with SMTP id f83so2812425qke.13
        for <tools@linux.kernel.org>; Fri, 08 May 2020 12:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:subject:message-id:mime-version:content-disposition
         :content-transfer-encoding;
        bh=j2KR9A6mnYrp9zkUhg+6qAtT23yvMtiWIT0DpdxTYio=;
        b=I1T61cGxbq2lG2R4GWApXQ6J6T/lNp5Mx8qg87tAYhOeEvjyGfTU4zknnIHtFRfY49
         F30YrWqCZ4KRrKURoyTNm5yC08o4AqmyJBgACdy2gqub7f2BmWQGsJjxSdpYcVEkmXXn
         0YYc0EH/fIuaR/LY86/eIXEOozAJuzdwkxvsU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition:content-transfer-encoding;
        bh=j2KR9A6mnYrp9zkUhg+6qAtT23yvMtiWIT0DpdxTYio=;
        b=WPae/wJj7Cb41co3VnkwvC3CdaDiGBb41bomM16bcbvVkwb5KMZ53WfD8gPvL/+hTe
         HBKh315yD2sXeTg1hXvm68JmdorTIqlGd4q6bdpzXmm6mno4Kup2uJcWBUUGQ1RjlWL3
         4B8jxvFj1f+VDhL4g3mmApWUHQHkv/2yuUFfdP57zs98FUSziBi00J+HC3hs0O8Q0gUk
         zX44Y5a/8Pz2OtvHOs2owMS/neQXh1Wg1FQAyjlb7cEXFhqtLf/4/C2hwqcLI6Eah/kt
         rlSUXzNLpA61nKtgWpeuiCDhgD2dRI8eGsMmniLlEEmFZqnKS1/vgHGYpRZ98BCbdfAS
         og9g==
X-Gm-Message-State: AGi0PuZ39Kh1xR7dzBuMjznoP+e/lyBbtSC+cc1VvaJsvERJVY04/qfE
	s+A5/ewMqQua7pbSJhzWZdO3CBDjd8U=
X-Google-Smtp-Source: APiQypKhf/1VYDK+jsR3YJNcWDrW34M4YSi9EIlUee+CrYtAeFZEYuWer0mTljZxJDCdjA5IQDQfqg==
X-Received: by 2002:a37:91c6:: with SMTP id t189mr4458012qkd.280.1588965571590;
        Fri, 08 May 2020 12:19:31 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from i7.mricon.com (107-179-243-71.cpe.teksavvy.com. [107.179.243.71])
        by smtp.gmail.com with ESMTPSA id l9sm2127825qth.60.2020.05.08.12.19.29
        for <tools@linux.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2020 12:19:31 -0700 (PDT)
Received: by i7.mricon.com (sSMTP sendmail emulation); Fri, 08 May 2020 15:19:29 -0400
Date: Fri, 8 May 2020 15:19:29 -0400
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: tools@linux.kernel.org
Subject: b4 0.4.1 available with bugfixes and minor improvements
Message-ID: <20200508191929.5l2jzw42fjz47jb4@chatter.i7.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi, all:

B4 version 0.4.1 is now available on pypi.

- ty: does a better job of preparing canned replies to short patches
- ty: is less naive about mapping local to remote branches when using them in
  templates
- ty: uses Link: and Message-Id trailers when auto-locating applied
  patches
- ty: switches -s and -d to use frienlier ranges;
  before: "-s 1 2 3 5 7 8 9", after: "-s 1-3,5,7-9"
- am: can now use the -P,--cherry-pick flag to select a subset of
  patches from a larger series

You can upgrade to the latest version from pypi using:

pip install --user --upgrade b4

Or you can use it straight from git, as before.

Special thanks in this release go to:

- Will Deacon
- Jason Gunthorpe
- Martin K. Petersen
- Lorenzo Pieralisi
- Heiko Stübner

Thanks!

-K
