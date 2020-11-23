Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web10.39441.1606156119704301492
 for <tools@linux.kernel.org>;
 Mon, 23 Nov 2020 10:28:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ziepe.ca header.s=google header.b=eHCOEDns;
 spf=pass (domain: ziepe.ca, ip: 209.85.222.174, mailfrom: jgg@ziepe.ca)
Received: by mail-qk1-f174.google.com with SMTP id i199so4443224qke.5
        for <tools@linux.kernel.org>; Mon, 23 Nov 2020 10:28:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=wmYDms61rP6EJO+g9xZrVmFze144C5mR6PWHn/Iux0I=;
        b=eHCOEDnsZjsnt3ueKQOT9vT95RZeyQ/7XvTpyPY18pwi8NGOx1kukZMgCZCPusBuBm
         9GF0+DOQNrgsljid0032pRYrvaa0rB0+0y8MoWMttRVCvsQVg51gzW6InQysqwhFIXjo
         Ag3XDF+0z1xEr44kOBST+EtiOEEMAbnWddMsy0hOY8QfED12BnGhyDeMQGW7vBx/D9Ly
         kGxpdB/ZtvpDD2uOZopQuSJUQYyN3GO/scP5CEHX1GldVbVIfj7fWH7JcylGaMK1lkfF
         X8Uz4tMXlgquI4AOlXUGfK7DXcJTut2Eqqzp/aaofkIu3BvPKNfR1xMK1mYSYoKsEsb3
         XsVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wmYDms61rP6EJO+g9xZrVmFze144C5mR6PWHn/Iux0I=;
        b=DaalaaeA65JyxQ2k18+9BwOEwoNQJE9ai4wEB3hjUSvPbCSDUw4Z77q+2y53prPddP
         c7PtEHkG2aQUqC+H35tqfgU1ZSJCvoW1XnQCUIWmBZk8UKPKtnC02Qxn+yEA3YO6AzJl
         7v7I1emTvOCWagSHAtr5qUNCLuuVLfmiWL/5Zq1TJMLRZBxVHL9DqpRw86jk60HnqL+K
         iSR4W5u7qhlqd9rtKufUAKCfaBmSJjSo1dYxG8d6/hjaxT/vbf6QlGGrD7T8lj7/8gR7
         wbm9UMPfjMdJ2Zz914cYp4T8vVqKljmGYwD98iN+52boTwGDtmDHhBygQzAwJh757CJi
         H7Zw==
X-Gm-Message-State: AOAM530+vbWDfinChQAWOmyU0dQM3gG0BmQUCh3yTUvqp7UnL7ERe+Fk
	KVW+n4cSMPmpdEnAcmnYzVeLTg==
X-Google-Smtp-Source: ABdhPJxLkfpT2TtOTjYH6DQshn7svSBl7b5DjmXnroMXmu2d7U7Spwuuyhu4OUQR+WjGpYGGpN79NA==
X-Received: by 2002:a37:a296:: with SMTP id l144mr781711qke.357.1606156118886;
        Mon, 23 Nov 2020 10:28:38 -0800 (PST)
Return-Path: <jgg@ziepe.ca>
Received: from ziepe.ca (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net. [156.34.48.30])
        by smtp.gmail.com with ESMTPSA id v28sm3092869qkj.103.2020.11.23.10.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2020 10:28:38 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94)
	(envelope-from <jgg@ziepe.ca>)
	id 1khGZp-0001br-7Q; Mon, 23 Nov 2020 14:28:37 -0400
Date: Mon, 23 Nov 2020 14:28:37 -0400
From: "Jason Gunthorpe" <jgg@ziepe.ca>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
	users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: [kernel.org users] b4: DKIM verification available
Message-ID: <20201123182837.GA5487@ziepe.ca>
References: <20201120221530.mfwn72nr6lqr2qqs@chatter.i7.local>
 <20201123154841.GU244516@ziepe.ca>
 <1dccb9ac431b854ba4f7a72f6e7b90baecdacbe1.camel@HansenPartnership.com>
 <20201123164220.GW244516@ziepe.ca>
 <20201123181746.fu32rqyw3bpohciz@chatter.i7.local>
MIME-Version: 1.0
In-Reply-To: <20201123181746.fu32rqyw3bpohciz@chatter.i7.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 23, 2020 at 01:17:46PM -0500, Konstantin Ryabitsev wrote:
> On Mon, Nov 23, 2020 at 12:42:20PM -0400, Jason Gunthorpe wrote:
> > Konstantin: This seems like a few bad behaviors here.. Shouldn't the
> > first one report the DKIM failure??
> 
> Yeah, but I try not to put in features that everyone would immediately 
> turn off due to high false-positive rates. :)

Do you think it is that bad? According to DMARC data vger lists are
nearly 100% these days, b4 could sense vger and turn it on properly.

It would be interesting to see some stats on some of the vger lists
from lore to get a sense how many senders are misconfigured.

If you are going in this direction having vger reject messages that
fail DKIM signature checking just like it rejects HTML messages would
instantly make it usable. :)

> verification as a nice surprise and quietly move on otherwise.

Well in this way it will have no impact on any workflow or any change
in the git commits..

Jason
