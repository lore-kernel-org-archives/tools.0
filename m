Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com [209.85.219.67])
 by mx.groups.io with SMTP id smtpd.web11.1791.1588183126607850143
 for <tools@linux.kernel.org>;
 Wed, 29 Apr 2020 10:58:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ziepe.ca header.s=google header.b=G8oQAXFS;
 spf=pass (domain: ziepe.ca, ip: 209.85.219.67, mailfrom: jgg@ziepe.ca)
Received: by mail-qv1-f67.google.com with SMTP id v18so1599693qvx.9
        for <tools@linux.kernel.org>; Wed, 29 Apr 2020 10:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=G/m4Q0B1xafjEMvuieOOgxTl8Dt2HkuorOozvLEIm8g=;
        b=G8oQAXFS3EWAcn8WtlYw9r2R8SQjOLKlhvGn74hcgQlbOs+riAWq8S8DcZy0IT9yCL
         /4qg7tyyQEkxwRpMNUghmS+VhOwGFaMbMzGt3LlW8xqtWSuILTJ5jyOULKoiJeRG8kFK
         cUkBOgclJ2fftJ1TeqGiT8w6QT/p/RyhYd91AJerkAr4O8HRsSRLeqMwmjt4uEuJV4LM
         m2R46kPX+qMz09Ixgnwx+vCZ18vsNyeYieAXkP5UTHV7x1QlQkewttU6ARaCU8hRMZYb
         0h63qONdo9XoAIVzHnu8H+MqEg2bGmeAkgWUkR8ZgjctEL0FA00hhXgAPnIkHncfkCab
         7QKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=G/m4Q0B1xafjEMvuieOOgxTl8Dt2HkuorOozvLEIm8g=;
        b=ankmFsjv0UKEhPIDIwEQf/buRH8YCi+WvwTWbMa3+IN9Nidtp87id9pw8WZ1IQ320Y
         HBy3rPlrTOTA0vshPL6g8uf+tcXG0sZW6tmfch75UnbiU8W6GTl/+RR2fe88ooo129O6
         PQ048rFD7fY4QBt5FDsC7KHEtM48NEeFHf43UPhsZbrpIGyEdl1bgiOfCX6vKAdbj3q6
         CPWwl5N4jp1HMj0/94E5184nEVxCLeGxiek61K0Kie0hfKBw1OzmaSKIjLa+BCeBOgOV
         eRwVnIWlEKVoWBuyYJ+cc4/FKXTyyLv5jvnqc7t2bYaEmjuH6H3RWlP3gjy80Q1clvSF
         71ZQ==
X-Gm-Message-State: AGi0PuY4K5fTvJntJG6difW6HEDYNIGPaNNcEz8kpcli5m+cIKb2psCS
	Kr1paPQS7V42GfVkmnk+zfArPw==
X-Google-Smtp-Source: APiQypLxaa9caUpwLIMfQ13iDkdGbcD03/c5A4+Xl4K9kOdNG9KRej+6Nrb4a9sTQAeCJ5ovzEk1gQ==
X-Received: by 2002:ad4:45ac:: with SMTP id y12mr33863969qvu.227.1588183125610;
        Wed, 29 Apr 2020 10:58:45 -0700 (PDT)
Return-Path: <jgg@ziepe.ca>
Received: from ziepe.ca (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.57.212])
        by smtp.gmail.com with ESMTPSA id t7sm8185569qtr.93.2020.04.29.10.58.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 Apr 2020 10:58:45 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
	(envelope-from <jgg@ziepe.ca>)
	id 1jTqyq-00017u-O8; Wed, 29 Apr 2020 14:58:44 -0300
Date: Wed, 29 Apr 2020 14:58:44 -0300
From: "Jason Gunthorpe" <jgg@ziepe.ca>
To: Mark Brown <broonie@kernel.org>
Cc: Junio C Hamano <gitster@pobox.com>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: [kernel.org users] What is a useful way to show changes between series?
Message-ID: <20200429175844.GH26002@ziepe.ca>
References: <20200428192938.aue3v6kxsm47day5@chatter.i7.local>
 <20200428193550.GX26002@ziepe.ca>
 <20200428194419.i2gamyjgbilp2x73@chatter.i7.local>
 <20200429101309.GE4201@sirena.org.uk>
 <CAPc5daUXCRv5CN9cVdGTgAWinTEFB0RnMF27MA5D4dOMiCCk1A@mail.gmail.com>
 <20200429175049.GP4201@sirena.org.uk>
MIME-Version: 1.0
In-Reply-To: <20200429175049.GP4201@sirena.org.uk>
User-Agent: Mutt/1.9.4 (2018-02-28)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 29, 2020 at 06:50:49PM +0100, Mark Brown wrote:
> On Wed, Apr 29, 2020 at 10:42:01AM -0700, Junio C Hamano wrote:
> 
> > Are we talking about format.useAutoBase or something more elaborate?
> 
> Ah, indeed I think that is exactly what I'm looking for!  Sadly it is
> not documented in the git format-patch man page so I hadn't seen it,

So if we use this, should we set the --base to be a linux-next tag?

Is that reliable enough?

Can't relly use Linus's tree, and if people randomly choose their
upstream's then it defeats the whole point :(

> even the base auto option is a bit buried.

Agree, that seems to be missed from the synopsis and option
description sections :)

Jason
