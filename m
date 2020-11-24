Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web10.52642.1606229146076413539
 for <tools@linux.kernel.org>;
 Tue, 24 Nov 2020 06:45:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fsOSGiD5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.219.49, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-qv1-f49.google.com with SMTP id q7so10662695qvt.12
        for <tools@linux.kernel.org>; Tue, 24 Nov 2020 06:45:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=wvRw2opwaEZobJyALG79Rip4FwmjiAO3F4Q3zZZ/7KU=;
        b=fsOSGiD5TcG2IW4M1wGhpqY8E4Hji0DVMYZUqlpB1Br33P6LxRr41aL6QpGP4Dsaku
         6n37cj9MyvphLvnLdZq3jduC/9PVc8a0mYEHO8ha2rIWCQZX22KcPjEIpbna3whWvSIV
         p3BAxqOmixXa06u1mzReAEFmXrLCmVzvH0sk0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=wvRw2opwaEZobJyALG79Rip4FwmjiAO3F4Q3zZZ/7KU=;
        b=T/spy0Wq2OeZMarLqcL3X0ljxtVG0RddHtYseadEiqqF971tl+ka7DjCJQcz7nNEhd
         cZri5UhH0Fx+gzHLLrkvkjoIbRtfl/NgVt04NTO1wPBvk1IscvW5rXOdmUg5vep+hlmg
         VnfGTvhp8KbrWVGluUcIeQW88rTbT32gvXXWJOa8D6MlyiaLsqdOhPfg3RVmkgoJqKcc
         ZBHycGXL7TCqRSH/UlmMeOOy1L52sU71k9HFgZhuHr3SThe70J3QRPsCdliRwcocQxVe
         sQCdbMa+1Uzt8iWCCK6A2MQX5oFsbiOV+l+PVRHlH2BZRMUBdXS2ZD9cmvimMC7KmQHv
         rV0g==
X-Gm-Message-State: AOAM530IUmaJZBdWxaspKwNFZbZRH9R+q/hkyImhVpbLBblzenoOujB7
	HeNm9s83y6lHfsAg03+XFhu93w==
X-Google-Smtp-Source: ABdhPJzA1c/8vbmsA10KSIKtJPg8Or0jihvrfS1pYMRgv6KGuNMRt3YbZ6p7JqltXLJ94SyKCgyj5w==
X-Received: by 2002:a0c:b5c7:: with SMTP id o7mr5123423qvf.16.1606229145023;
        Tue, 24 Nov 2020 06:45:45 -0800 (PST)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id y3sm6469295qkl.110.2020.11.24.06.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2020 06:45:43 -0800 (PST)
Sender: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Date: Tue, 24 Nov 2020 09:45:42 -0500
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: Philippe Blain <levraiphilippeblain@gmail.com>
Cc: tools@linux.kernel.org
Subject: Re: [BUG] b4 can't grap thread with already-percent-encoded slash
Message-ID: <20201124144542.arws25irjgylbrqa@chatter.i7.local>
References: <2ce40a78-4291-c01c-f468-8b7f3be2f379@gmail.com>
MIME-Version: 1.0
In-Reply-To: <2ce40a78-4291-c01c-f468-8b7f3be2f379@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Nov 24, 2020 at 09:37:54AM -0500, Philippe Blain wrote:
> Hello,
> 
> I tried to use b4 to import this thread:
> https://lore.kernel.org/git/X7y+cZ3MPqqmGXx%2F@coredump.intra.peff.net/T/#t
> 
> using that exact URL:
> 
> b4 mbox -o- https://lore.kernel.org/git/X7y+cZ3MPqqmGXx%2F@coredump.intra.peff.net/T/#t
> 
> It does not work - I get a 404. I think it's partly 
> due to the already-percent-encoded slash (just before the @).
> I tried a few things, like manually changing the '%2F' to '/', 
> removing the '/T/#t' suffix, adding '-p git' to disambiguate,
> but to no avail. I always get either a 404 or "That message-id is not 
> known."

Yes, I kept meaning to fix that -- thanks for the reminder. The latest 
master/stable-0.5.y have a fix for that.

-K
