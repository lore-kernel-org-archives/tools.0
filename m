Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911E18465
	for <tools@linux.kernel.org>; Fri,  2 Jun 2023 08:00:19 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.ext.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <j.zink@pengutronix.de>)
	id 1q4zho-0002BE-Bm; Fri, 02 Jun 2023 10:00:16 +0200
Message-ID: <837ab11e-e6c7-0dc6-9377-7889910aea09@pengutronix.de>
Date: Fri, 2 Jun 2023 10:00:11 +0200
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
To: konstantin@linuxfoundation.org, users@linux.kernel.org,
 tools@linux.kernel.org
Content-Language: en-US, de-DE
Cc: kernel@pengutronix.de
From: Johannes Zink <j.zink@pengutronix.de>
Subject: b4: Feature-Request: use salted hash for change-id instead of
 descriptive-name when using b4 prep
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: j.zink@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: tools@linux.kernel.org

Hi,

first of all: thanks for creating and maintaining b4, it makes my daily kernel 
developer's life so much easier...

Accidentally I came across a (documented [1]) behaviour of b4 prep that is a 
little dangerous for my workflow: the descriptive-name is incorperated in the 
MessageID and the changeID in plaintext.

While for most applications this is probably fine, sometimes I use branch names 
along the line of "upstream-feature-for-$super_secret_customer_project" (or 
some other stupid branch names [2] - which it at least a bit funny if you know 
german...), which poses a risk of actually leaking information I do not want to 
be leaked.

I would like to ask if there is a possibility to change this to using a salted 
hash instead (salt is probably required due to rainbow table attacks) for 
messageID and changeID. If this would break some workflows, it could possibly 
be added as an optional command line argument for b4 prep?

Maybe this is just stupid-me, but I think other people might also benefit from 
this feature.

Cheers and again: thanks for your work
Johannes


[1] https://b4.docs.kernel.org/en/latest/contributor/prep.html
[2] 
https://lore.kernel.org/lkml/20230516-lustige-usb-phy-dinge-v2-1-3383a0de34ac@pengutronix.de/T/

-- 
Pengutronix e.K.                | Johannes Zink                  |
Steuerwalder Str. 21            | https://www.pengutronix.de/    |
31137 Hildesheim, Germany       | Phone: +49-5121-206917-0       |
Amtsgericht Hildesheim, HRA 2686| Fax:   +49-5121-206917-5555    |
