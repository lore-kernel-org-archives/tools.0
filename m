Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8AF48C00
	for <tools@linux.kernel.org>; Wed,  7 Dec 2022 19:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
	; s=ds202112; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=HPyob2nAMaR6YyQBkEd1+m6ajwT1pkqGk7IDFDUvr/Q=; b=P3dhZQtFzYYruPxYJsEw1TgNXa
	zH+QgKi1yl/ZJwc3ONqEk1sGUSEf57HNk7oAPl1+o5FE+yEDUiBN22T758R8bfxpNFBeTywykRgps
	qQfQSpoqLM64YQ+anpEuP/wTs+tI3flKpJixLTDIJpShRzXpHv3o1thqVKuV5zpWMkwj+qMg7CFyN
	glPyzFfD67jQ1FE3ybbGi2uDJGZJomCMGG/3VMEPFZlqNl8uKjA4GPWuTYsSmOi0TOTCmZ0ZmPNCL
	8Qyc6h0o3gexc9moGZiVcbQRm9LYK7TFYrvy3mhGftwD4Cq8RsnPX/zZMk1VcZ0LNTEIrCi9gi7g9
	3UGKYO2Q==;
Received: from [2a01:799:95e:1700:6395:ccbd:d000:d42b] (port=60145)
	by smtp.domeneshop.no with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <noralf@tronnes.org>)
	id 1p30Uo-003fJj-N0;
	Wed, 07 Dec 2022 20:54:23 +0100
Message-ID: <a0f80fcf-be19-3dd2-6d6c-0f9795f3e2a4@tronnes.org>
Date: Wed, 7 Dec 2022 20:54:20 +0100
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: new: b4 send --reflect
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org, =?UTF-8?Q?Noralf_Tr=c3=b8nnes?=
 <noralf@tronnes.org>
References: <20221206215340.556ov3bdfyf3qvyy@meerkat.local>
 <f8d14fd5-58e0-853d-64e0-72cc60e69629@tronnes.org>
 <20221207182156.zbwmcdckoegef6lf@meerkat.local>
 <f0394397-0cd3-72db-36c2-91ba1f98b709@tronnes.org>
 <20221207194544.ei2nkaw2lvvs7ifq@meerkat.local>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20221207194544.ei2nkaw2lvvs7ifq@meerkat.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



Den 07.12.2022 20.45, skrev Konstantin Ryabitsev:
> On Wed, Dec 07, 2022 at 08:36:44PM +0100, Noralf Trønnes wrote:
>>> On Wed, Dec 07, 2022 at 05:39:40PM +0100, Noralf Trønnes wrote:
>>>> Error from endpoint: This service only accepts patches
>>>
>>> Stupidly, I never tested it with a single patch, always with a series.
>>> Please try again.
>>>
>>
>> Getting closer ;)
> 
> You're tripping up all the corner-cases, this is great! :)
> 
>> Reflecting via web endpoint https://lkml.kernel.org/_b4_submit
>> Error from endpoint: Destinations must include a mailing list we recognize.
> 
> One of my goals is to make sure that this service can't be abused to send
> spam, so we're running a bunch of checks to verify that it's a legitimate
> patch sent to a sane set of destinations. In this particular case, we weren't
> expecting the only list to be lists.freedesktop.org (usually there's always a
> kernel.org address there somewhere).
> 
> Please try again.
> 

It's working now, thanks.

Noralf.
