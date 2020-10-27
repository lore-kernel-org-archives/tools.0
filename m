Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web12.454.1603819879933363062
 for <tools@linux.kernel.org>;
 Tue, 27 Oct 2020 10:31:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.232, mailfrom: alexandre.belloni@bootlin.com)
Received: from localhost (lfbn-lyo-1-1908-165.w90-65.abo.wanadoo.fr [90.65.88.165])
	(Authenticated sender: alexandre.belloni@bootlin.com)
	by relay12.mail.gandi.net (Postfix) with ESMTPSA id DAA3920000A;
	Tue, 27 Oct 2020 17:31:16 +0000 (UTC)
Date: Tue, 27 Oct 2020 18:31:16 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: b4 not fetching proper patch
Message-ID: <20201027173116.GA158870@piout.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

I'm not sure this is worth fixing but I though I would report it anyway:

I want to apply just this patch:
https://lore.kernel.org/linux-rtc/20200924105256.18162-2-u.kleine-koenig@pengutronix.de/

However b4 am -p linux-rtc -c -t -s -l -P _ -o - 20200924105256.18162-2-u.kleine-koenig@pengutronix.de
ends up with:

Grabbing thread from lore.kernel.org/linux-rtc
Checking for newer revisions on https://lore.kernel.org/linux-rtc/
Analyzing 20 messages in the thread
Will use the latest revision: v2
You can pick other revisions using the -vN flag
---
Specified msgid is not present in the series, cannot cherry-pick

The issue here is that this series has been sent as a reply to another
series labeled v2 that it supersedes and b4 insists in using this v2.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
