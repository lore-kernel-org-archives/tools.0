Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web08.17359.1604079467666674504
 for <tools@linux.kernel.org>;
 Fri, 30 Oct 2020 10:37:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: alexandre.belloni@bootlin.com)
X-Originating-IP: 86.194.74.19
Received: from localhost (lfbn-lyo-1-997-19.w86-194.abo.wanadoo.fr [86.194.74.19])
	(Authenticated sender: alexandre.belloni@bootlin.com)
	by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id DFB03E0009;
	Fri, 30 Oct 2020 17:37:44 +0000 (UTC)
Date: Fri, 30 Oct 2020 18:37:44 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: b4 ty : wrong patch number when cherrypicking
Message-ID: <20201030173744.GA995986@piout.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

I cherrypicked patch 4 and 5 of
https://lore.kernel.org/linux-amlogic/20201005203451.9985-1-post@lespocky.de/
using:

b4 am -p linux-arm-kernel -c -t -s -l -P 4-5 -o - 20201005203451.9985-5-post@lespocky.de

After applying to my tree, b4 ty generated the message I sent (without
checking, my bad):

https://lore.kernel.org/linux-amlogic/160391135997.385141.5554228268638639718.b4-ty@bootlin.com/

Where it had 1/2 and 2/2 instead of 04/12 and 05/12.

Is this too awful to fix? :)

Regards,

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
