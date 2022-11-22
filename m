Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C9D915C90
	for <tools@linux.kernel.org>; Tue, 22 Nov 2022 20:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
	; s=ds202112; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=EATxqm7NZL2dYBtPblW49RblEqIuG5jx1d/DOUzWxMY=; b=dlGz34hRKAVnbJisKQ/xHsLQrH
	LQWSNoS8xVZp88TuC2P22VF2y4SSPdb9ekhfvsL54iYGvJMqRvncFOEEH70zDp6GqSC+Uc6tztB66
	RN7YeNR4MrD1gO7iA14y3feP+uQ83E3kSzrg/oLdQVKmRHBdQOPxrXe8KSq5EtyrhAPfg/LJ+3Zzh
	3g3bAGOczeJRETSROL/yc53wiWcDe68H9ln8yr0wdn+fDbNllVHB+FigXlJqsOBdLa/OSRILob5i+
	V4fS9FzIphU+QvfkvZ1un7krMYwaD4ucOqQfNhNUGRaUm9Nb91uzO41b9C61uuDy0ZCKL8+JCpoaS
	eJ4xemXw==;
Received: from [2a01:799:95e:1700:6395:ccbd:d000:d42b] (port=60354)
	by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <noralf@tronnes.org>)
	id 1oxZqI-0002i2-7Y; Tue, 22 Nov 2022 21:26:06 +0100
Message-ID: <4161738f-e2df-2d8e-7646-2c61df2f76b9@tronnes.org>
Date: Tue, 22 Nov 2022 21:26:03 +0100
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
References: <20221121151922.jaal6ym7z2ejju4q@houat>
 <de12952f-8346-8995-236d-69dcb70f19f6@tronnes.org>
 <20221122155122.edxtmsqpjxgj4dsj@meerkat.local>
 <3b06dfd5-0eb4-dbfc-6ba8-077b1a92865b@tronnes.org>
 <20221122185001.q6hmeblp64jqdzvz@meerkat.local>
 <02bc2442-e3b3-d720-9d13-ffcdfd760fb8@tronnes.org>
 <20221122194428.fmbayuz6vbvdd6uw@meerkat.local>
 <3d2f9038-435f-f78e-31f4-59dbae587d18@tronnes.org>
 <20221122200049.ma5jpfiawmgmpng2@meerkat.local>
 <d9951176-24ed-ded1-c5dd-5586f779483d@tronnes.org>
 <20221122202033.jeukag3i5pttqp5d@meerkat.local>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20221122202033.jeukag3i5pttqp5d@meerkat.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



Den 22.11.2022 21.20, skrev Konstantin Ryabitsev:
> On Tue, Nov 22, 2022 at 09:10:40PM +0100, Noralf Trønnes wrote:
>>> I'm guessing it's probably something python-requests handles behind the
>>> scenes. What version is python3-requests for you?
>>>
>>
>> $ apt show python3-requests
>> Package: python3-requests
>> Version: 2.25.1+dfsg-2
> 
> OK, this didn't get us closer to the culprit. :( This is the code that works
> for me on Fedora 36, 37, RHEL 7, RHEL 8, and Ubuntu 20.04:
> 
>     #!/usr/bin/env python3
>     import requests
>     print('version: %s' % requests.__version__)
>     jdata = {'foo': b'bar', 'action': 'test'}
>     res = requests.post('https://lkml.kernel.org/_b4_submit', json=jdata)
>     print(res.text)
> 
> E.g. on Ubuntu-20.04:
> 
>     mricon@i7:~$ lsb_release -ir
>     Distributor ID: Ubuntu
>     Release:        20.04
>     mricon@i7:~$ python3 /tmp/testme.py
>     version: 2.25.1
>     Unknown action: test
> 
> However, I see that it's failing on Debian 11 with the JSON error.
> I'll poke some more now that I have a test env and follow up.
> 

Yeah that test snippet fails with the same error.

$ lsb_release -ir
Distributor ID: Ubuntu
Release:        22.04

Noralf.
