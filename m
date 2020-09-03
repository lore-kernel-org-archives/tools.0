Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web11.16844.1599147434057927148
 for <tools@linux.kernel.org>;
 Thu, 03 Sep 2020 08:37:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@toxicpanda-com.20150623.gappssmtp.com header.s=20150623 header.b=oblW+qri;
 spf=none, err=permanent DNS error (domain: toxicpanda.com, ip: 209.85.160.176, mailfrom: josef@toxicpanda.com)
Received: by mail-qt1-f176.google.com with SMTP id 60so2205704qtc.9
        for <tools@linux.kernel.org>; Thu, 03 Sep 2020 08:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:references:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=MKkQ5Ui4genQzFf4l9JKaXbCQOLbgcAU2pxFJC1ElAs=;
        b=oblW+qriAYUMYo+BwZRKUXiPDiFG+q80J3+FxOFD+zLJ5hXqpzi0CqE9JYJAiReqQz
         wv+Ha4UaqYRswGLSj/WwqIDmw8dek2ZkMjp7hFIGhEsmZpgr7qMz1MZUC+wikpAvrzGr
         HsCk3RzuQho/vvemfF5nCtdxnmufI6WhwdTIolmyjq513z6LxnjOovE0IRHABghdT0JQ
         Loe6hU8ZFqXbxNNhuErAJt1MaY20GcYzWUeLyWAg1CxXiZVuvVeupFytgne6bPy6n0YE
         yfSAcPC87T34o/BEwZQvD73V7cbFnagO7j8Riehk/2mRvWXtitJDuPV7cqVeasuLprqQ
         7aZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MKkQ5Ui4genQzFf4l9JKaXbCQOLbgcAU2pxFJC1ElAs=;
        b=eL5UTWnVt4Fp6AvoA6dfLyUp6CuMZ0RvbZ19vH+yg00v1oQq23D0w2iFzcDB5knYJz
         caC7PvxzS6qHfXPCLhrV7RHFSfjEZB/ZZPjIWFmuBao2HYA4BBfFn2qkk0XEeOHrnn0S
         NvNLnqzpUGba+zkwHdXPAygYTDy1oswZ4JmOQa/O96Z2yVEjoEnp+luLHIyLH2Q7AOQ/
         N0eKJEGA7DQXwqHpIogtDc3BWpe3YR7lDPAVtf0onOEfAD2Ym0jPKGeVLuL957aZHUdn
         bUPxDDsdADLU+81XoEeD4mt298zRSooG9CH1bQRtVc0F+f1/2WKMkOAyC1rWE0x62TOC
         z0kg==
X-Gm-Message-State: AOAM532POQBM+um63rVv1zQJiAgGNZhnLhmdAqw1UXgEaxXa8en9RneH
	Bf7U6yw1RtyNV0ZZJa5at+t0xUzUZgXu81/N
X-Google-Smtp-Source: ABdhPJyE0qVD9M8ef2FN3rpJMy4++FWKtaCkN4bntfuub+q/ku+IkWJKqd8y0XJ3oSZVnIO7Z3fFHg==
X-Received: by 2002:aed:2356:: with SMTP id i22mr3922367qtc.92.1599147432918;
        Thu, 03 Sep 2020 08:37:12 -0700 (PDT)
Return-Path: <josef@toxicpanda.com>
Received: from [192.168.1.45] (cpe-174-109-172-136.nc.res.rr.com. [174.109.172.136])
        by smtp.gmail.com with ESMTPSA id r42sm2327080qtk.29.2020.09.03.08.37.11
        for <tools@linux.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2020 08:37:12 -0700 (PDT)
Subject: Re: [bug] b4 not working with a patch valid patch series
From: Josef Bacik <josef@toxicpanda.com>
To: tools@linux.kernel.org
References: <19d6330d-b1c4-96d3-f081-7cbe1ac07e2e@toxicpanda.com>
Message-ID: <a6996501-8570-fe7d-d25d-7e894cc8b5d8@toxicpanda.com>
Date: Thu, 3 Sep 2020 11:37:11 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <19d6330d-b1c4-96d3-f081-7cbe1ac07e2e@toxicpanda.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 9/3/20 11:32 AM, Josef Bacik wrote:
> Hello,
> 
> b4 from pip and b4 from git do not seem to be handling this patch series properly
> 
> cover.1599091832.git.anand.jain@oracle.com
> 
> I'm getting
> 

Bah nevermind, got bitten by that stupid single [v3] reply to the series.  -v2 
works fine, ignore me.  Thanks,

Josef
