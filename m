Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D3311C15
	for <tools@linux.kernel.org>; Tue, 22 Nov 2022 21:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
	; s=ds202112; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=hPqth5zqc9Lj1KUSPssqoR2runE2i8j8+xLwB3nvJqQ=; b=d3erweO56stm3DcZqxEUFNJIwv
	Oabg3N/WcSTMIe+RUDsXTloYf9sxwkoqgP+6tHpFxIFON9jyQ8S5qgH/GGfXxTd3lkgnVVovmRy/P
	0RawjWNhpiFYhAeuVgnbkk+mhwwzO2QrxqTNSID8n+iUIkM42daSHMj68IaNTGUrFmo10r0SpKvD7
	vhFzKtSY0BbC7dnDfUOGtsq/vPX4cGMIlF/46MucZwnKDPTJaQ2SgNaly6XF5NCizgJvhMEPdaNVG
	SHOTO6YtW2Dhxe3QesC/8w6wF0iXDaam2xByoQt27YksgjLIoR96h+MfD3rKu2HGeFelyeGaE0OwV
	fRGKs3Aw==;
Received: from [2a01:799:95e:1700:6395:ccbd:d000:d42b] (port=61624)
	by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <noralf@tronnes.org>)
	id 1oxaQw-0003lw-FC; Tue, 22 Nov 2022 22:03:58 +0100
Message-ID: <4adcd45f-21e7-698e-dc97-70995850ac9f@tronnes.org>
Date: Tue, 22 Nov 2022 22:03:55 +0100
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: Error using b4 web endpoint (was Re: git send-email friendly smtp
 provider anyone?)
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org, =?UTF-8?Q?Noralf_Tr=c3=b8nnes?=
 <noralf@tronnes.org>
References: <20221122155122.edxtmsqpjxgj4dsj@meerkat.local>
 <3b06dfd5-0eb4-dbfc-6ba8-077b1a92865b@tronnes.org>
 <20221122185001.q6hmeblp64jqdzvz@meerkat.local>
 <02bc2442-e3b3-d720-9d13-ffcdfd760fb8@tronnes.org>
 <20221122194428.fmbayuz6vbvdd6uw@meerkat.local>
 <3d2f9038-435f-f78e-31f4-59dbae587d18@tronnes.org>
 <20221122200049.ma5jpfiawmgmpng2@meerkat.local>
 <d9951176-24ed-ded1-c5dd-5586f779483d@tronnes.org>
 <20221122202033.jeukag3i5pttqp5d@meerkat.local>
 <4161738f-e2df-2d8e-7646-2c61df2f76b9@tronnes.org>
 <20221122204456.6tqutsoybrisa4xf@meerkat.local>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20221122204456.6tqutsoybrisa4xf@meerkat.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



Den 22.11.2022 21.44, skrev Konstantin Ryabitsev:
> On Tue, Nov 22, 2022 at 09:26:03PM +0100, Noralf Trønnes wrote:
>>> However, I see that it's failing on Debian 11 with the JSON error.
>>> I'll poke some more now that I have a test env and follow up.
>>>
>>
>> Yeah that test snippet fails with the same error.
>>
>> $ lsb_release -ir
>> Distributor ID: Ubuntu
>> Release:        22.04
> 
> Okay, this is not a real fix, but it will get things working for you while I
> implement the proper solution:
> 
> apt install python3-simplejson
> 

Thanks, no errors this time.

Series:
https://lore.kernel.org/dri-devel/20221122-gud-shadow-plane-v1-0-9de3afa3383e@tronnes.org/

Noralf.
