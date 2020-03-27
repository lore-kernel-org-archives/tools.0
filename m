Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web11.10982.1585314881254472103
 for <tools@linux.kernel.org>;
 Fri, 27 Mar 2020 06:14:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ziepe.ca header.s=google header.b=nXcZyMIZ;
 spf=pass (domain: ziepe.ca, ip: 209.85.219.42, mailfrom: jgg@ziepe.ca)
Received: by mail-qv1-f42.google.com with SMTP id bp12so786643qvb.7
        for <tools@linux.kernel.org>; Fri, 27 Mar 2020 06:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=tkhbRxDM4csH2u8b4WMj1F0hyQCa4JvwRhFmnAyayG8=;
        b=nXcZyMIZoZOIi+Cmz4lI5eWE5bBAlFwk42/uyG6zlYqIeewIHSVSO8w+rlIvCUlEFf
         pDUTd3kwf2Rxer/7BcNEqrkQlhx6LaqxQimbAqR2FCC5U62WZN5FSr//uyy8ifpjyFVQ
         ZjT9FZtz0eOFIfKExYGvDUEtn8CToLwF2zKXSSGEHB+LYf5mGy0jyJ8odAWmEUucDx6D
         kOkhVXrO2xy3NPpHh2h6HqjI4q5vmaN1ZoG0//LZLepOKBQk+Rd0xrPf5EuXBPNEwTAF
         y6Sskp7IpAaS7GNxka6/XkoH+x08J1yn0FZMybYk0ylqGI0o3mO94x4FuXq+NAHOSWVT
         L66Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=tkhbRxDM4csH2u8b4WMj1F0hyQCa4JvwRhFmnAyayG8=;
        b=qNEzYxRPjRfQbBoPM9Qm2CfpX1n+vl7hPHlCBdo1XuYouSzaESthl09lhMzRylpBKT
         m7G+Y6klba1GyArvR9qhMLswq7yYDxlJARwbVSQ9ATqTG4Lep22qTmYTB0GX6wt2cX3L
         d/BhVQ2wU2cbm9ZoHWK1b5JprkcypSWGnwFA/US8DqsDuY3D6GwrDb3GwwLPodHCE1A5
         NTSzf9hG3RyVy+aNZHiZWOpmoqdB1XJc/yVzYELuChyHf8s8I2ourwtz8RKRLFpGShpo
         x5xD74kgOt8I3oGdJJQF7QXIy6Q4U0crGmADLdwj18pEVfLkR+b3Pnmhch91jm3b1htH
         g1gg==
X-Gm-Message-State: ANhLgQ05q6dDo8WJCNNdGT9V2JAV10ZSJzgMN19QhrL6cYkwRmozeUam
	IAvSCzLT7n6n5ORI5zIjbYhjqw==
X-Google-Smtp-Source: ADFU+vtj/ff9Bo7gt80WxVXIELf6iGDhTwrmfPmesT6lEGZNwwG70OxjTpOHadLYJTmf+YpgXft+Cw==
X-Received: by 2002:a0c:9b95:: with SMTP id o21mr13656109qve.175.1585314880308;
        Fri, 27 Mar 2020 06:14:40 -0700 (PDT)
Return-Path: <jgg@ziepe.ca>
Received: from ziepe.ca (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.57.212])
        by smtp.gmail.com with ESMTPSA id y127sm3704078qkb.76.2020.03.27.06.14.39
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Mar 2020 06:14:39 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
	(envelope-from <jgg@ziepe.ca>)
	id 1jHooo-0008K4-O7; Fri, 27 Mar 2020 10:14:38 -0300
Date: Fri, 27 Mar 2020 10:14:38 -0300
From: "Jason Gunthorpe" <jgg@ziepe.ca>
To: Ludovic.Desroches@microchip.com
Cc: konstantin@linuxfoundation.org, users@linux.kernel.org,
	tools@linux.kernel.org
Subject: Re: [kernel.org users] B4 and gmail integration features
Message-ID: <20200327131438.GU20941@ziepe.ca>
References: <20200320214532.wvmym643l3dw24qh@chatter.i7.local>
 <20200323121620.GX20941@ziepe.ca>
 <9d4c04a2-be5c-2fad-2513-dc2bcc052f3d@microchip.com>
MIME-Version: 1.0
In-Reply-To: <9d4c04a2-be5c-2fad-2513-dc2bcc052f3d@microchip.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 27, 2020 at 12:53:57PM +0000, Ludovic.Desroches@microchip.com wrote:
> On 3/23/2020 1:16 PM, Jason Gunthorpe wrote:
> > On Fri, Mar 20, 2020 at 05:45:32PM -0400, Konstantin Ryabitsev wrote:
> >> Hi, all:
> >>
> >> For my next B4 trick, I plan to add some basic gmail integration --
> >> since I know many of you do use gmail.
> > 
> > FWIW, I've done some work on this here to avoid the 'OAUTH Apocalypse'
> > that is coming. You may find the oauth code helpful:
> > 
> > https://github.com/jgunthorpe/cloud_mdir_sync
> 
> Thanks a lot for this tool. We have an Exchange server with IMAP support 
> disabled recently. It has broken my mail workflow.

Yes, we are looking to a similar future.

I hope in a month or so I can show how to make IMAP work again with an
OAUTH helper, but this tool turned out well and is nicer than mutt's
built in IMAP or mbsync..

> I didn't play much yet with your tool but first tests are encouraging to 
> be able to use notmuch and mutt again.

Consider it 'beta' at the momement, would be interested in feedback

Regards,
Jason
