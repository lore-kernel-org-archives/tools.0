Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web09.18074.1604081134190507818
 for <tools@linux.kernel.org>;
 Fri, 30 Oct 2020 11:05:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=S+gIOAw5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.222.172, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-qk1-f172.google.com with SMTP id a65so3434053qkg.13
        for <tools@linux.kernel.org>; Fri, 30 Oct 2020 11:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=epl8PEZEqpkBQhIZQn/oOIl51Lnf2IyBc9q+zi7R34w=;
        b=S+gIOAw5/kYpAL8OXArnJQkv3Am9lSLNWUlbfE0E6W8CJ9SoJ4TokS3SP7HbheDNIr
         P8+5Uk1aYImUBoc39eopuWCZlq/qBEip4MQxHPQOf1yN08q4Nnc3TtYZPSXePBObzObF
         bme01bO1RsGIaB3RE+B5Y8Pyt3EOrXFexOrLo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=epl8PEZEqpkBQhIZQn/oOIl51Lnf2IyBc9q+zi7R34w=;
        b=Ohsjy2AT6SqZsbdu0Mxapa7Nj3cFAlYObd7g2vsM+JDBf3ZMff4c0v/Ci5DGGrSvlO
         6ziu1eFRakPA35CIFnFrjomEWwTzR+mBm8Erh5sxoa9O0cMmfuuhqY6GRMU/prIrUoGO
         V67nzUBa7pwHPZIzc4Si+xISqGju4CMTTtIYSbhU5Yv5JlS3G9MxEBhjCsbINBjJcS5Y
         jg8ou6kMPK7+QwuddPwUiPveJUAKOy7JGma0qHjKvcDe5EFfF0eXKFqTe2ZkQL0ljK2b
         BhGBATTngEWL9YXquJs0zvjXSTXRqx6NEIYL3zUX1SQcMQeyWykNNhCvTGwPG/6bAjPO
         rXqw==
X-Gm-Message-State: AOAM5334tMvXBoRV9PIb1uuBdR5zoMLdbMtVUl/FT0QzD4pENctHc3Ye
	5jGIe/g4Y0GW1VgbQzQZMuTxXg==
X-Google-Smtp-Source: ABdhPJxwHe63MHOlmIhGs08o1eaO7dp13ieUv5roNuMA9hC04ggSHOWJcuQGgV+IXo1CWMh2yJ97kg==
X-Received: by 2002:a37:5906:: with SMTP id n6mr3451209qkb.254.1604081133261;
        Fri, 30 Oct 2020 11:05:33 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id 8sm1215420qkk.90.2020.10.30.11.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2020 11:05:32 -0700 (PDT)
Date: Fri, 30 Oct 2020 14:05:30 -0400
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: b4 ty : wrong patch number when cherrypicking
Message-ID: <20201030180530.fpkcjxfjeih24cmu@chatter.i7.local>
References: <20201030173744.GA995986@piout.net>
MIME-Version: 1.0
In-Reply-To: <20201030173744.GA995986@piout.net>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Oct 30, 2020 at 06:37:44PM +0100, Alexandre Belloni wrote:
> I cherrypicked patch 4 and 5 of
> https://lore.kernel.org/linux-amlogic/20201005203451.9985-1-post@lespocky.de/
> using:
> 
> b4 am -p linux-arm-kernel -c -t -s -l -P 4-5 -o - 20201005203451.9985-5-post@lespocky.de
> 
> After applying to my tree, b4 ty generated the message I sent (without
> checking, my bad):
> 
> https://lore.kernel.org/linux-amlogic/160391135997.385141.5554228268638639718.b4-ty@bootlin.com/
> 
> Where it had 1/2 and 2/2 instead of 04/12 and 05/12.
> 
> Is this too awful to fix? :)

It shouldn't be -- I have a similar request in the following thread:
https://lore.kernel.org/r/20201003193137.z2bpwzlz5a66kkex@chatter.i7.local

-K
