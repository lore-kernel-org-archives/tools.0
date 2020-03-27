Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web11.11711.1585316787509476040
 for <tools@linux.kernel.org>;
 Fri, 27 Mar 2020 06:46:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ziepe.ca header.s=google header.b=J0ej1xDI;
 spf=pass (domain: ziepe.ca, ip: 209.85.219.53, mailfrom: jgg@ziepe.ca)
Received: by mail-qv1-f53.google.com with SMTP id m2so4842532qvu.13
        for <tools@linux.kernel.org>; Fri, 27 Mar 2020 06:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=/qWOmptXRG4/A8rcFdlUKJ46HncEwhONs128yL8FFaY=;
        b=J0ej1xDIeQbem4w42n0E/94YgHKrJZBoLb58yp648zVO2+vWWK0IYxlPG/lcmg+/tm
         GBcrrVhVovEO4lG+3VUoAIJUyQDFIeOJ8agNxVA1Z38u/cM3AwTyM+9uvC3GYAmNbcNN
         1pch9vv/oUcLWYUaCqjH1HDag/QdN9OgUDvOE6XAwgpOpER9fLNijkR+cA9Ss0f71Ezk
         Zwgk6HSLLvJVhC/AyFgNY096fnvHXGkCUag+4J49f3rQVUhleMr0+SjM5kG3tpPBkYKa
         QjDbZA0X9hotSxPaf/C2jf8gc1zSspzLFJOGsP1aSU991rLe0Q8qNewDmYJVNBnqR7Xu
         r2Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/qWOmptXRG4/A8rcFdlUKJ46HncEwhONs128yL8FFaY=;
        b=HxwGsuGQPSXPa5dLLDOdrNpRkSJpWEr8np069SNwL5rAuJOal/uvYmPvgogu9u3gD5
         TrftIfGhVQpheWoX4hcf1tNQqvrjetdHnNrN9hlJgoodFG4ZooaI9Foqq1PRE/4SS6il
         DKBe3N/TTVegC+jIM4dKZONYNJ8dVOX9oKsLpp6EAmvnhGHJZMNZP+VYT+Bv21ov6bks
         5xEeDsQSRfW1Ck7YUPcanRtQGd28rvciT3NTbVxMiybbx2fH4yNuOix5gq5hXLsHrmqo
         OMIq46jZld077ncLkOSy7jEr8i3bMER9K4QQq3iy2opAbgeLjP0Vy0Vcb5aF5o5gwVQq
         mPbA==
X-Gm-Message-State: ANhLgQ0MM9sRmHMOOvv6PHog9Ij2YAq7VNCQrCGnzsV5LP3q6gsCNkkf
	BvJVujqYw8hDQ8PkQ5dVcBDN/g==
X-Google-Smtp-Source: ADFU+vuz5uEgD0CW6uUFhdbtuEAVPAiu5UxpvRleeMD80/0sh59ovTOztZNcxdiU9hXIkDJGc91KeQ==
X-Received: by 2002:a05:6214:364:: with SMTP id t4mr13918046qvu.124.1585316786559;
        Fri, 27 Mar 2020 06:46:26 -0700 (PDT)
Return-Path: <jgg@ziepe.ca>
Received: from ziepe.ca (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.57.212])
        by smtp.gmail.com with ESMTPSA id j50sm4070199qta.42.2020.03.27.06.46.25
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Mar 2020 06:46:26 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
	(envelope-from <jgg@ziepe.ca>)
	id 1jHpJZ-0000KG-BF; Fri, 27 Mar 2020 10:46:25 -0300
Date: Fri, 27 Mar 2020 10:46:25 -0300
From: "Jason Gunthorpe" <jgg@ziepe.ca>
To: Ludovic.Desroches@microchip.com
Cc: konstantin@linuxfoundation.org, users@linux.kernel.org,
	tools@linux.kernel.org
Subject: Re: [kernel.org users] B4 and gmail integration features
Message-ID: <20200327134625.GV20941@ziepe.ca>
References: <20200320214532.wvmym643l3dw24qh@chatter.i7.local>
 <20200323121620.GX20941@ziepe.ca>
 <9d4c04a2-be5c-2fad-2513-dc2bcc052f3d@microchip.com>
 <20200327131438.GU20941@ziepe.ca>
 <93abb185-edc7-6edb-11e8-a1bd0b2b6bbe@microchip.com>
MIME-Version: 1.0
In-Reply-To: <93abb185-edc7-6edb-11e8-a1bd0b2b6bbe@microchip.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 27, 2020 at 01:34:39PM +0000, Ludovic.Desroches@microchip.com wrote:
> On 3/27/2020 2:14 PM, Jason Gunthorpe wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > On Fri, Mar 27, 2020 at 12:53:57PM +0000, Ludovic.Desroches@microchip.com wrote:
> >> On 3/23/2020 1:16 PM, Jason Gunthorpe wrote:
> >>> On Fri, Mar 20, 2020 at 05:45:32PM -0400, Konstantin Ryabitsev wrote:
> >>>> Hi, all:
> >>>>
> >>>> For my next B4 trick, I plan to add some basic gmail integration --
> >>>> since I know many of you do use gmail.
> >>>
> >>> FWIW, I've done some work on this here to avoid the 'OAUTH Apocalypse'
> >>> that is coming. You may find the oauth code helpful:
> >>>
> >>> https://github.com/jgunthorpe/cloud_mdir_sync
> >>
> >> Thanks a lot for this tool. We have an Exchange server with IMAP support
> >> disabled recently. It has broken my mail workflow.
> > 
> > Yes, we are looking to a similar future.
> > 
> > I hope in a month or so I can show how to make IMAP work again with an
> > OAUTH helper, but this tool turned out well and is nicer than mutt's
> > built in IMAP or mbsync..
> > 
> >> I didn't play much yet with your tool but first tests are encouraging to
> >> be able to use notmuch and mutt again.
> > 
> > Consider it 'beta' at the momement, would be interested in feedback
> 
> Sure. I already have one question. I noticed that if I remove a mail 
> from the server, it is also removed locally. That's good as I deal with 
> my mails on two computers. I wonder how it will behave with email 
> retention? I fear it removes the mails from my local maildir...

Right, the local maildir always matches the cloud mailbox, and extra
local mails are deleted to make them match.

Keeping a local archive would need some new feature - for instance to
de-dup and insert encountered messages into a public inbox.

Jason
