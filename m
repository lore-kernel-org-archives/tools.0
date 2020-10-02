Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web12.11240.1601642113609490093
 for <tools@linux.kernel.org>;
 Fri, 02 Oct 2020 05:35:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=chmAU2Oh;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.160.182, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-qt1-f182.google.com with SMTP id m23so1014455qtq.4
        for <tools@linux.kernel.org>; Fri, 02 Oct 2020 05:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9puPbp+de6HHTIleNpLOhgTKN8Awmu5KUNAateM0eq4=;
        b=chmAU2Ohj88Qa2SDWhYBf3/4USIsGZATM8ZbgE81QvdwlK42OD+SoRu280uAf+sUeg
         gqXN609KTdu76COfdwUjZhoQzr1av59NToHOY/HRXMBLK+Qrkpk3mNPaosbz2AhKAt9f
         T4BsMKFtIzkzJs0QFAMQ1ZQp4ZWN/vELA+mMQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9puPbp+de6HHTIleNpLOhgTKN8Awmu5KUNAateM0eq4=;
        b=cqgXZ3H3Z+XmVWg/m5rDgVAx95Iktt+fF6My7WX8FTWrXC+PcKi8EP4HTY/yb3+FhC
         x8uy6sPs5peDaM4uhJ4TXDVXUfWipHTMDexqPqrLOWLuKktzsZYxoYuLnsYFPBHmQTov
         5BsscjRcxfK3DMhTHlNQn5jkOB+hl9FuV9pI7be7OGc6GZd3W8ZeJrO2BBcMOmDd59GO
         f/Y1DUIafb1yG10x4nL8uBg8iktrwXkBfJf6F+B/PDZ7PyqLWjmCApBI/EIwBPX0jHmP
         fg5EhrenBDZQ33hUp+w1/BkU5ua+D/zQZiZnyEJcjHXI0F8TxwWGA/4T1gWmxrGdsjS8
         5WUQ==
X-Gm-Message-State: AOAM530e+iPHIjyprb0+6YqE8VMAgCoiTu6irQGzwmrzQNhg+qadl16p
	dmX5ojcqAw6IzvjOo/o7S9GioGQ1ObDj4fat
X-Google-Smtp-Source: ABdhPJxSjFQMvP4B6h+ibCiXHDu2eUuzqOTt9AsomdlVruQSWMYlSD7M2J5H+x1cbhXiKpua1dwi3g==
X-Received: by 2002:ac8:7281:: with SMTP id v1mr1946745qto.229.1601642112488;
        Fri, 02 Oct 2020 05:35:12 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id l21sm931708qkl.128.2020.10.02.05.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2020 05:35:11 -0700 (PDT)
Date: Fri, 2 Oct 2020 08:35:09 -0400
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: tools@linux.kernel.org, krzk@kernel.org
Subject: Re: [tools] b4 diff -m: max() arg is an empty sequence
Message-ID: <20201002123509.pcbxthxlhaonm2ie@chatter.i7.local>
References: <20200920163117.GA15084@kozik-lap>
MIME-Version: 1.0
In-Reply-To: <20200920163117.GA15084@kozik-lap>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sun, Sep 20, 2020 at 06:31:17PM +0200, Krzysztof Kozlowski wrote:
> Hi,
> 
> $ b4 mbox '1600234622-8815-2-git-send-email-yilun.xu@intel.com'
> $ b4 mbox '1599553645-26928-1-git-send-email-yilun.xu@intel.com'
> 
> (the second mbox is actually a cover letter as b4 could not download the
> actual patch directly via its Message-Id)
> 
> $ b4 diff -m 1599553645-26928-1-git-send-email-yilun.xu@intel.com.mbx 1600234622-8815-2-git-send-email-yilun.xu@intel.com.mbx
> 
> Loading 8 messages from 1599553645-26928-1-git-send-email-yilun.xu@intel.com.mbx
> Traceback (most recent call last):
>   File "/home/kozik/.local/bin/b4", line 11, in <module>
>     sys.exit(cmd())
>   File "/home/kozik/.local/lib/python3.6/site-packages/b4/command.py", line 222, in cmd
>     cmdargs.func(cmdargs)
>   File "/home/kozik/.local/lib/python3.6/site-packages/b4/command.py", line 65, in cmd_diff
>     b4.diff.main(cmdargs)
>   File "/home/kozik/.local/lib/python3.6/site-packages/b4/diff.py", line 115, in main
>     lser, user = diff_mboxes(cmdargs)
>   File "/home/kozik/.local/lib/python3.6/site-packages/b4/diff.py", line 108, in diff_mboxes
>     chunks.append(lmbx.series[max(lmbx.series.keys())])
> ValueError: max() arg is an empty sequence

Thanks, this crasher is now fixed in master and stable-0.5.y:

$ b4 diff -m 1599553645-26928-1-git-send-email-yilun.xu@intel.com.mbx 1600234622-8815-2-git-send-email-yilun.xu@intel.com.mbx
Loading 8 messages from 1599553645-26928-1-git-send-email-yilun.xu@intel.com.mbx
No valid patches found in 1599553645-26928-1-git-send-email-yilun.xu@intel.com.mbx


-K
