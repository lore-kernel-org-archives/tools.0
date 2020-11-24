Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web09.1169.1606242165511512347
 for <tools@linux.kernel.org>;
 Tue, 24 Nov 2020 10:22:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QCa6QcVN;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.222.194, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-qk1-f194.google.com with SMTP id u184so7185250qkf.3
        for <tools@linux.kernel.org>; Tue, 24 Nov 2020 10:22:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=NrZ2j4sRfVoltvsXDQnHowbaLP36AUeHU9xnyUT7EMs=;
        b=QCa6QcVNw4JFjKjTzXa3LJyvsUOptg4ePVT17LicY1uJx3vO6BSHtFgK1/jnc9wu54
         xxFd+tw0ZH12saOOqQWWet8W8PKOAecEpdR6oMHDJYw7Ps9aa8AcLgBrUjQkTj+sUu2U
         YqbpaKbmt6d5qh0wZ7W2VqjBClSh5dB9Wab0U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NrZ2j4sRfVoltvsXDQnHowbaLP36AUeHU9xnyUT7EMs=;
        b=mSVc/piq437J8J9b7YWu9asl691dUbDcU2AZYalaX5TqDYbdWzmmLQdkYarGz1rM/S
         S5+h2qRqF1E5T0jYrlMBce4aaJHC8nedLuJjsgYqZ7UWyXYcY5KzXoSfOgmw1s6vxWt9
         6Lc7J2mhBsSJG3e7ejSjrQYkHnOn3NXl8US6OKQWpUNFUkBTrWr0PjsfiRE6P82liCd3
         qGRtZsShaRk8/mWUWfm8zvr9XrUD6inbrLU5vKMCPixLQPEP82E7zdLnfUQmdM8a9BJt
         RrI1389ehvtbKfqRtmQaW9xsTDrzCg4ipSOFWVIGgHlqoMHhIt3da6G1uspOyIm9Zysu
         yYQw==
X-Gm-Message-State: AOAM533BMGL9zqcaH6DLCwPNSxiVzWzebeW459pAzFoWAHopK/5rBp0s
	0jQ6x5Oc5DPi7g+6Tcyd/UXjlnXbiAk59aIe
X-Google-Smtp-Source: ABdhPJyNDsdVqOVwnqAQJtG+SJHLsKdGBmqvsBg1hNa4gVtPiAP4sO+rsJusWei3LVjzmew1NIN/Bg==
X-Received: by 2002:a37:951:: with SMTP id 78mr6107106qkj.47.1606242164367;
        Tue, 24 Nov 2020 10:22:44 -0800 (PST)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id y44sm15164109qtb.50.2020.11.24.10.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2020 10:22:43 -0800 (PST)
Date: Tue, 24 Nov 2020 13:22:41 -0500
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: tools@linux.kernel.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	users@linux.kernel.org
Subject: Re: [tools] b4 ty : wrong patch number when cherrypicking
Message-ID: <20201124182241.sojck3t76qjm5a2s@chatter.i7.local>
References: <20201030173744.GA995986@piout.net>
 <1642D74B05A23708.27950@linux.kernel.org>
MIME-Version: 1.0
In-Reply-To: <1642D74B05A23708.27950@linux.kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Oct 30, 2020 at 02:05:30PM -0400, Konstantin Ryabitsev via linux.kernel.org wrote:
> On Fri, Oct 30, 2020 at 06:37:44PM +0100, Alexandre Belloni wrote:
> > I cherrypicked patch 4 and 5 of
> > https://lore.kernel.org/linux-amlogic/20201005203451.9985-1-post@lespocky.de/
> > using:
> > 
> > b4 am -p linux-arm-kernel -c -t -s -l -P 4-5 -o - 20201005203451.9985-5-post@lespocky.de
> > 
> > After applying to my tree, b4 ty generated the message I sent (without
> > checking, my bad):
> > 
> > https://lore.kernel.org/linux-amlogic/160391135997.385141.5554228268638639718.b4-ty@bootlin.com/
> > 
> > Where it had 1/2 and 2/2 instead of 04/12 and 05/12.
> > 
> > Is this too awful to fix? :)
> 
> It shouldn't be -- I have a similar request in the following thread:
> https://lore.kernel.org/r/20201003193137.z2bpwzlz5a66kkex@chatter.i7.local

There is a fix in the latest master that more properly handles these 
situations:

- we record actual patch prefixes when we start tracking a series, so 
  when we send a thank you report, the actual counters will be shown
- when we send a reply for a subset of the series, we will now insert a 
  "(subset)" into the subject to more clearly indicate to the submitter 
  that the series only got applied partially

Note, that this will only start working for *new* series you grab with 
"b4 am" -- anything you've grab previously will exhibit previous 
behaviour.

-K
