Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.985.1603821669789623866
 for <tools@linux.kernel.org>;
 Tue, 27 Oct 2020 11:01:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: alexandre.belloni@bootlin.com)
X-Originating-IP: 90.65.88.165
Received: from localhost (lfbn-lyo-1-1908-165.w90-65.abo.wanadoo.fr [90.65.88.165])
	(Authenticated sender: alexandre.belloni@bootlin.com)
	by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 86A6F1C000E;
	Tue, 27 Oct 2020 18:01:06 +0000 (UTC)
Date: Tue, 27 Oct 2020 19:01:06 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: b4 not fetching proper patch
Message-ID: <20201027180106.GE12276@piout.net>
References: <20201027173116.GA158870@piout.net>
 <20201027174527.6mt2gcsfxc2q4u5m@chatter.i7.local>
MIME-Version: 1.0
In-Reply-To: <20201027174527.6mt2gcsfxc2q4u5m@chatter.i7.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 27/10/2020 13:45:27-0400, Konstantin Ryabitsev wrote:
> On Tue, Oct 27, 2020 at 06:31:16PM +0100, Alexandre Belloni wrote:
> > Hello,
> > 
> > I'm not sure this is worth fixing but I though I would report it anyway:
> > 
> > I want to apply just this patch:
> > https://lore.kernel.org/linux-rtc/20200924105256.18162-2-u.kleine-koenig@pengutronix.de/
> > 
> > However b4 am -p linux-rtc -c -t -s -l -P _ -o - 20200924105256.18162-2-u.kleine-koenig@pengutronix.de
> > ends up with:
> > 
> > Grabbing thread from lore.kernel.org/linux-rtc
> > Checking for newer revisions on https://lore.kernel.org/linux-rtc/
> > Analyzing 20 messages in the thread
> > Will use the latest revision: v2
> > You can pick other revisions using the -vN flag
> > ---
> > Specified msgid is not present in the series, cannot cherry-pick
> > 
> > The issue here is that this series has been sent as a reply to another
> > series labeled v2 that it supersedes and b4 insists in using this v2.
> 
> Oooh, gosh, yeah:
> 
> -> [PATCH v2 N/3]
>  \-> [PATCH N/2]
>   \-> [PATCH v2 N/2]
> 
> 
> I'm sorry, it's one of those times when it's never going to be clear 
> what's been intended. :)
> 
> That said, it's a legitimate bug -- if the msgid we're cherry-picking is 
> not in the latest series revision, we should automatically select the 
> revision containing the requested msgid. You can still get the patch you 
> need in this particular case if you pass -v1 to the command you used, 
> but it should work without forcing the -v1.
> 

Yeah, that is what I did. I then applied with git am as usual. The last
issue was that b4 ty didn't seem to track that patch, I'm not sure this
is related though.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
