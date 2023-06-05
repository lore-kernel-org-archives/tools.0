Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEFF4443C
	for <tools@linux.kernel.org>; Mon,  5 Jun 2023 06:10:24 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.ext.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <j.zink@pengutronix.de>)
	id 1q63Pz-000867-7M; Mon, 05 Jun 2023 08:10:15 +0200
Message-ID: <43916f96-a00a-119b-7438-a875fdcd50f6@pengutronix.de>
Date: Mon, 5 Jun 2023 08:10:10 +0200
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
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org, kernel@pengutronix.de
References: <837ab11e-e6c7-0dc6-9377-7889910aea09@pengutronix.de>
 <20230602-speckled-modulator-ebdc37@meerkat>
From: Johannes Zink <j.zink@pengutronix.de>
In-Reply-To: <20230602-speckled-modulator-ebdc37@meerkat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: j.zink@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: tools@linux.kernel.org

Hi Konstantin,

On 6/2/23 18:50, Konstantin Ryabitsev wrote:
> On Fri, Jun 02, 2023 at 10:00:11AM +0200, Johannes Zink wrote:
>> Hi,

>>[snip]
>> I would like to ask if there is a possibility to change this to using a
>> salted hash instead (salt is probably required due to rainbow table attacks)
>> for messageID and changeID. If this would break some workflows, it could
>> possibly be added as an optional command line argument for b4 prep?
> 
> I will consider this request. For now, you can manually edit the cover letter
> commit to change the JSON bit there that records the change-id.

thanks, that will definitely help for now, though it would be great to have it 
supported natively in b4 prep.

> 
> E.g. right after you create a new b4-tracked branch using "b4 prep -n", you
> can run "git commit --amend --allow-empty" and modify the change-id to be
> whatever you like. Note, that you should only do this before you send out any
> revisions.
> 

is that equivalent to do b4 prep --edit-cover?

Johannes

> -K
> 

-- 
Pengutronix e.K.                | Johannes Zink                  |
Steuerwalder Str. 21            | https://www.pengutronix.de/    |
31137 Hildesheim, Germany       | Phone: +49-5121-206917-0       |
Amtsgericht Hildesheim, HRA 2686| Fax:   +49-5121-206917-5555    |

