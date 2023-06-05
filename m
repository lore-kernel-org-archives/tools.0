Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7C4AD3D
	for <tools@linux.kernel.org>; Mon,  5 Jun 2023 07:32:35 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.ext.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <j.zink@pengutronix.de>)
	id 1q64hc-0003nR-Kp; Mon, 05 Jun 2023 09:32:32 +0200
Message-ID: <19b5d7af-44fb-37ba-6d20-98e53c9154b1@pengutronix.de>
Date: Mon, 5 Jun 2023 09:32:28 +0200
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: b4: Feature-Request: use salted hash for change-id instead of
 descriptive-name when using b4 prep
Content-Language: en-US, de-DE
To: Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org, kernel@pengutronix.de
References: <837ab11e-e6c7-0dc6-9377-7889910aea09@pengutronix.de>
 <20230602-speckled-modulator-ebdc37@meerkat>
 <43916f96-a00a-119b-7438-a875fdcd50f6@pengutronix.de>
 <87edmqjrom.fsf@baylibre.com>
From: Johannes Zink <j.zink@pengutronix.de>
In-Reply-To: <87edmqjrom.fsf@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: j.zink@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: tools@linux.kernel.org

Hi Mattijs,

On 6/5/23 09:26, Mattijs Korpershoek wrote:
>>
[snip]
>>>
>>
>> is that equivalent to do b4 prep --edit-cover?
> 
> No, it is not. b4 prep --edit-cover does not show the
> "--- b4-submit-tracking ---" section that Konstantin recommended you to
> edit.
> 
> You can only edit that with "git commit --amend --allow-empty"
> 

thank you for your explaination and your fast response!

Johannes

> 
>>

-- 
Pengutronix e.K.                | Johannes Zink                  |
Steuerwalder Str. 21            | https://www.pengutronix.de/    |
31137 Hildesheim, Germany       | Phone: +49-5121-206917-0       |
Amtsgericht Hildesheim, HRA 2686| Fax:   +49-5121-206917-5555    |

