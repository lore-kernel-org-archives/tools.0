Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web10.14129.1585150024348628807
 for <tools@linux.kernel.org>;
 Wed, 25 Mar 2020 08:27:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Y9m6qlet;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.65, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-wm1-f65.google.com with SMTP id l20so3161618wmi.3
        for <tools@linux.kernel.org>; Wed, 25 Mar 2020 08:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=yqtHlBIjX42QdkJqhV1x+J5R2Ix70ubWReeT8b8VrOQ=;
        b=Y9m6qletex32s/aT86eYZRO9yC7DnlONCoy2ORBPHl1WpxgSaRdZqDxNXgg4NTBus0
         2b6WT2EjbSmm88kNA7P0EZjMPkZnHs6GeMiNSD69AhFoQunoEyWd+/7W4GahyVvEIyiA
         0fkVsVgm7J9/20f/NQ6Pz1bf1yEfVl5ScUL0s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yqtHlBIjX42QdkJqhV1x+J5R2Ix70ubWReeT8b8VrOQ=;
        b=WTgjp4jgvsaoxbqlKMibIrKloo+uB3utyp5GDg3aRMHKtVlXHTHjDpT45PoQiJdNp0
         3B8AKLQdQA+6jbTi9fI6k6kjRW4DZRNtbnrMx9Lu9ZibW/hH1x6NK2h+szC58eY/Y4XK
         UcWr6xZetnWg0/b/MdRrs77X8Geli4Gtd3CdfyMB5zjWl/S5YhN9Ta9m6ABkKzM+1TQF
         cv7LXrFGYaxcn0tiB14zQYkW3X4wCNZKPdieCCDWcJqMAqWVxzdQgjwehXZXCMGkLBBx
         JYJEXNB/m7IeFMo3akzTW3LRbX37Oy0fyZp4C2P96hr3QwWpd/xWzwjOweAekziJotFq
         rAOA==
X-Gm-Message-State: ANhLgQ0ciXa/HNm9BpKSsPbKO9jrlu3W9Biy1sL4G6BaLHaCABrJu+dB
	Gdl3LS2lf3OAcgTyPS6t+PToKw==
X-Google-Smtp-Source: ADFU+vsVKGleBhaC3nw74w3I+QjTeVgRlvkW4/sdMjzP8nIlMmlYA1F72b3cUnXEiM4UFxqGAhC2bA==
X-Received: by 2002:a1c:3d5:: with SMTP id 204mr3975362wmd.188.1585149992997;
        Wed, 25 Mar 2020 08:26:32 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local ([185.220.102.7])
        by smtp.gmail.com with ESMTPSA id v2sm35940063wrt.58.2020.03.25.08.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2020 08:26:32 -0700 (PDT)
Date: Wed, 25 Mar 2020 11:26:28 -0400
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: tools@linux.kernel.org, users@linux.kernel.org
Subject: Re: [kernel.org users] b4 v0.3.4 released
Message-ID: <20200325152628.aju6peocay56ngdi@chatter.i7.local>
References: <20200323222041.uzfcexg2wy74jqdd@chatter.i7.local>
 <CAHmME9os=HxxxqWHp9nM6ggDdkqwpa6gOpTTAG68gamR3NtWaA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHmME9os=HxxxqWHp9nM6ggDdkqwpa6gOpTTAG68gamR3NtWaA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Mar 24, 2020 at 08:11:10PM -0600, Jason A. Donenfeld wrote:
> Hi Konstantin,
> 
> Still not a fan at all of the attestation stuff

But look how pretty it looks!
https://mricon.com/misc/attestation.png

Would people like it better if I added emojis? :)
https://mricon.com/misc/attestation-with-feeling.png

(Just kidding. I know that not everyone is interested in patch-level 
signatures, but seeing as we don't have *any* other mechanism of doing 
end-to-end attestation for mailed patches at this time, I wanted to at 
least take a stab at it and offer something usable and behind-the-scenes 
enough not to annoy the heck out of everyone.)

> , but the lore
> integration is a great convenience. Thanks for this great tool. I've
> packaged it up for Gentoo:
> 
> https://gitweb.gentoo.org/repo/gentoo.git/commit/?id=8374a4402f40ad1ff3613e281db5bb897708fcea

Nice. I've been holding off on doing the same for Fedora until b4 sees a 
bit less churn. Perhaps in another week or so once the 0.3.y branch 
stabilizes.

> Will you continue to send release announcements here, or should I set
> up a notifier through other means?

I will always send announcements to tools@linux.kernel.org at least, and 
major feature additions will always be announced on the users list.

> I'm curious to learn: where did this name "b4" come from? Is it like
> the millennial meme phrase "inb4" being a deconstruction of "inbox"
> for a postmodern command line work of art?

Nothing that clever. I'm following the Trek theme started by V'ger:

  The name "b4" was chosen for ease of typing and because B-4 was the
  precursor to Lore and Data in the Star Trek universe.

-K
