Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F91479C0
	for <tools@linux.kernel.org>; Wed, 30 Nov 2022 19:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
	; s=ds202112; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=HnnX5XNQ2BCJTmVD5epxFuF5W8Cbglk1EAuDqAMdrz0=; b=PNpq7T4vZtRroTpegqvl5hnGnI
	l81vW8XTPqkhdK3SS1ZjK9kdY0umSiOYXK4ZfebCNW28CGwYZBhBWZN/n1T1+iukr6KTUC9jNBu8l
	B8pDrs29AqrO0YHaDRLVvEJunxYdiRG+cubm0SbCUygrHRK0tATVXaRS2fqvrBihXSe7Wm9d/Xj33
	zvnadMlfYXTJCaYIWQfkJFaV/g6l4JqQTKbsT7ExXBidyeZabCyfEr27R3cr9ne11xtyj/ilpXFzQ
	U8y1Da1GcwAmSz9/i18Vr9Yy1uviVJRwS8rv9gjlA5ScDkw2UZhXFxsvyyvetpx4OjKefSFLlPvQZ
	KOPYqlXA==;
Received: from [2a01:799:95e:1700:6395:ccbd:d000:d42b] (port=60942)
	by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <noralf@tronnes.org>)
	id 1p0Sr1-0002bC-JT; Wed, 30 Nov 2022 20:34:47 +0100
Message-ID: <da129f85-45b0-2544-aca9-a674ed5357a5@tronnes.org>
Date: Wed, 30 Nov 2022 20:34:45 +0100
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
References: <3d2f9038-435f-f78e-31f4-59dbae587d18@tronnes.org>
 <20221122200049.ma5jpfiawmgmpng2@meerkat.local>
 <d9951176-24ed-ded1-c5dd-5586f779483d@tronnes.org>
 <20221122202033.jeukag3i5pttqp5d@meerkat.local>
 <4161738f-e2df-2d8e-7646-2c61df2f76b9@tronnes.org>
 <20221122204456.6tqutsoybrisa4xf@meerkat.local>
 <4adcd45f-21e7-698e-dc97-70995850ac9f@tronnes.org>
 <b1fb933e-e8b7-a46b-5234-7fd469ea9524@tronnes.org>
 <20221130165557.7ptog2pdgpa54377@meerkat.local>
 <77d7c98c-2fbe-d23c-b772-634b2a377761@tronnes.org>
 <20221130191736.pdt2x74znz2tcfxy@meerkat.local>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20221130191736.pdt2x74znz2tcfxy@meerkat.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



Den 30.11.2022 20.17, skrev Konstantin Ryabitsev:
> On Wed, Nov 30, 2022 at 06:02:58PM +0100, Noralf Trønnes wrote:
>>> Can you please do `b4 send -o /somedir` and then send me the tarball with the
>>> output of that?
>>>
>>
>> Here you go.
> 
> Thank you very much. Can you please try again?
> 

Thanks, working now:

https://lore.kernel.org/dri-devel/20221122-gud-shadow-plane-v2-0-435037990a83@tronnes.org/T/#t

https://patchwork.freedesktop.org/series/111222/

Is there an easy way for me to use b4 diff before I send out a new
version so I can see the exact changes I've made so I can make sure I've
not messed things up or forgotten to fix up something?

Noralf.
