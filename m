Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web12.381.1587140929057140335
 for <tools@linux.kernel.org>;
 Fri, 17 Apr 2020 09:28:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Z7VK79q1;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.222.175, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-qk1-f175.google.com with SMTP id c63so3045026qke.2
        for <tools@linux.kernel.org>; Fri, 17 Apr 2020 09:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=N1lKxuSaU089CF9ZzUQwFT7oyICxvO6B1n2T8cS3V9w=;
        b=Z7VK79q1gT5smV0vLBV6Ra9tpsZCn1lWuIh7PmdIRi0myr9tEhFpBuAOKExBRw6Kfd
         G0YQqOQSnLvYlry7GkTxuhOKsZUaPbq1WjwRQz8dprqNgJweP03VIbnSyP37IMFDJWXJ
         yyOdvJcPqAkEY4MUqNQ7lXh7zdt9QbsoWJWgg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=N1lKxuSaU089CF9ZzUQwFT7oyICxvO6B1n2T8cS3V9w=;
        b=bRM8t1tDVuWBluO6Pg8YkmrTyYDCgC9gPlAWPiImc6veqh22Q8Z0dfB/AdTr59QBdD
         891p9w2cYOInlq1/3XYDzJ9rF17HwclQ/q3XPcyHtWLMwn4bGPYzYc7aULflCQtIKFdx
         asKb+X2O7hkUW5hJajS0mB5Hco3gtzjc4/+E2j6q+3a/SeglfSsYT7Wk57eEADBTDbma
         FfO0/15ITdHHGXHb3p0NYr3zpazBd11bnDzKWpPqC1BsBiCR6wwFMMLXiulxZELsllBq
         pLzRmM8dzOIaAVEDbARfjiNIvqDNH2/yANFuWtruEcZSp/xLHtt0MsDNIqgf9usAUTAz
         SwIA==
X-Gm-Message-State: AGi0PuaGsJRO+hEYMGMxRUU0oVDln+v6Kj/JWLcX3xhhbngFYStiH6FH
	9krqQ5PDjaRaccgAavnXNWcFPuqRkTI=
X-Google-Smtp-Source: APiQypKo/tIcGuA5roS4I8hVcc2hj2VizRCmDghr+T4Nvkn9dAWlTd3OzO0LHdtCYZZnwnfLOO9GYQ==
X-Received: by 2002:a05:620a:22b1:: with SMTP id p17mr4107486qkh.249.1587140927798;
        Fri, 17 Apr 2020 09:28:47 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local (107-179-243-71.cpe.teksavvy.com. [107.179.243.71])
        by smtp.gmail.com with ESMTPSA id d23sm14037575qkj.26.2020.04.17.09.28.47
        for <tools@linux.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2020 09:28:47 -0700 (PDT)
Date: Fri, 17 Apr 2020 12:28:45 -0400
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: tools@linux.kernel.org
Subject: RFC: "b4 ack" to quick-reply with trailers
Message-ID: <20200417162845.uolobnt75ei6svtd@chatter.i7.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

I wanted to get your opinion on the usefulness of this workflow, aimed 
at reviewers.

1. Reviewer does "b4 am <msgid>"
2. Reviewer performs the review as usual
3. Reviewer does "b4 ack that.mbox"
4. B4 sends "Acked-by: Name <email>" as a reply to the cover letter

Acked-by would be the default, but can be set via -t "Reviewed-by", etc.

This functionality would be easy to add, but I'm not sure if most people 
would just do this from their mail client and never bother using b4 for 
this.

-K
