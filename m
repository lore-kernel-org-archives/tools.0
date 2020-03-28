Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by mx.groups.io with SMTP id smtpd.web11.3547.1585361280363000925
 for <tools@linux.kernel.org>;
 Fri, 27 Mar 2020 19:08:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@zx2c4.com header.s=mail header.b=IhY0NoAs;
 spf=pass (domain: zx2c4.com, ip: 192.95.5.64, mailfrom: jason@zx2c4.com)
Received: 
	by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1c793861;
	Sat, 28 Mar 2020 02:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
	:references:in-reply-to:from:date:message-id:subject:to:cc
	:content-type; s=mail; bh=aabBhYMb4oUSLytX+9y35yAwtVY=; b=IhY0No
	AsSQdbVTZ5lgb6d2la21CA1WHSYo9QVvwBeNrijbcu0lxRilIPMPowDSghWHUaju
	uGDy/5VX1Hlt4kg1ayaJf7OKqgo99J2nWBMN9BKXDKCMmbrjLsG3HgZbCfBKst3a
	HtvUNAHRQuUmDAP5BXgYWbZokP0GButrlr1zH4NhS9XDWqP8p+sqGHvC3+AYA20C
	MTvecnCiOKCR2cda1LH8XCjK9KV54RVkQYRp3cAGO4EedzkfUazaxweHUns6Oo/Q
	zsO1+qrgoiu5l/KbBUyo83i1n+98co9ITYZZ0wl5aCLa3pnsoDAql4SWjc1DgRde
	0j9ewyYm/HfCcHsg==
Received: 
	by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d51b16d4 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO);
	Sat, 28 Mar 2020 02:00:23 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id y24so11857786ioa.8;
        Fri, 27 Mar 2020 19:07:58 -0700 (PDT)
X-Gm-Message-State: ANhLgQ1HowqqACjk6L5rqe+oIv12Hd9/yVT2NFV1YrdvpiXdnj0rDDcY
	QUG43PD+mivglKxcdkb7mXmLOhjMoIM4MA2cq2s=
X-Google-Smtp-Source: ADFU+vtMmt0Dz3d1AOMMZQjOeih3P1kJYIaEc9L+fv8xlEngDiRdz6uwurC+YNnRzKUjuzk25Ud7V4lktURXkzo22iI=
X-Received: by 2002:a5d:954c:: with SMTP id a12mr1429925ios.25.1585361277470;
 Fri, 27 Mar 2020 19:07:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200327165402.slc5l46hc7hlo2l5@chatter.i7.local>
In-Reply-To: <20200327165402.slc5l46hc7hlo2l5@chatter.i7.local>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 27 Mar 2020 20:07:46 -0600
X-Gmail-Original-Message-ID: <CAHmME9oPWZFggrmDyOeu26HJZE16kmaHZ3HXUCTm1Yy0cLGrgQ@mail.gmail.com>
Message-ID: <CAHmME9oPWZFggrmDyOeu26HJZE16kmaHZ3HXUCTm1Yy0cLGrgQ@mail.gmail.com>
Subject: Re: [kernel.org users] Gmail message ID finder Chrome extension
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

Note that this extension has access to your gmail.com content, and can
also be remotely updated by its original author. I'm not sure I'd be
too happy about having this rando developer being the weakest link in
security posture. However, you can download that and install it
locally, or make it into a bookmarklet or greasemonkey script.
