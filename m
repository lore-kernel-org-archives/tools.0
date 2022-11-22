Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6CF15C90
	for <tools@linux.kernel.org>; Tue, 22 Nov 2022 20:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
	; s=ds202112; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=SxFBnfyb5BVjyTvTpUYRcKS5xMGVyT8pyoAwUwLRbck=; b=rwd/6/9gJNUmMRFONg2kGfN4JL
	CWCMej5kZVETA3jknPbySThe6WhqHNei5U6ecXAWtNaXrpfdI0uuuUMsjeIjpyuGWPcuK7GoFv/AB
	JZO9W7XIYyuBJWKLbqgPDNTEt+FfWdMfXWKOYpEhnVIh6/TwmODcogRcZU1cETTX+kz7kkgMHxTX7
	1qA2x9lmXhKdlnFjtHVZ59Mw0I7BdedPlu91cSq2/H7sSINTANz3NAcoZxZUUj5V3KjDJYEVdQGJy
	142SjsschEqPdcPwynDOTjSJoxxK8BC/uqOZp+sPRI30ZbXKXefCQaEsDKY22+HkNcL21kfgQM/QW
	tP/ShlGw==;
Received: from [2a01:799:95e:1700:6395:ccbd:d000:d42b] (port=59742)
	by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <noralf@tronnes.org>)
	id 1oxZbO-0001oL-FD; Tue, 22 Nov 2022 21:10:42 +0100
Message-ID: <d9951176-24ed-ded1-c5dd-5586f779483d@tronnes.org>
Date: Tue, 22 Nov 2022 21:10:40 +0100
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
References: <1bc45775-0667-01f8-36e1-9f65d3081092@tronnes.org>
 <20221121151922.jaal6ym7z2ejju4q@houat>
 <de12952f-8346-8995-236d-69dcb70f19f6@tronnes.org>
 <20221122155122.edxtmsqpjxgj4dsj@meerkat.local>
 <3b06dfd5-0eb4-dbfc-6ba8-077b1a92865b@tronnes.org>
 <20221122185001.q6hmeblp64jqdzvz@meerkat.local>
 <02bc2442-e3b3-d720-9d13-ffcdfd760fb8@tronnes.org>
 <20221122194428.fmbayuz6vbvdd6uw@meerkat.local>
 <3d2f9038-435f-f78e-31f4-59dbae587d18@tronnes.org>
 <20221122200049.ma5jpfiawmgmpng2@meerkat.local>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20221122200049.ma5jpfiawmgmpng2@meerkat.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



Den 22.11.2022 21.00, skrev Konstantin Ryabitsev:
> On Tue, Nov 22, 2022 at 08:48:27PM +0100, Noralf Trønnes wrote:
>>> This is very strange, because this is literally the code in question:
>>>
>>>     req = {
>>>         'action': 'auth-verify',
>>>         'msg': bdata.encode(),
>>>     }
>>>     logger.info('Submitting verification to %s', endpoint)
>>>     ses = b4.get_requests_session()
>>>     res = ses.post(endpoint, json=req)
>>>
>>> I don't see where "Object of type bytes" would come from. Can you possibly
>>> insert the following above the `res = ses.post` line:
>>>
>>>     logger.debug('endpoint=%s, req=%s', endpoint, req)
>>>
>>
>> $ b4 -d send --web-auth-verify <challenge>
>> Running git --no-pager rev-parse --show-toplevel
>> Running git --no-pager config -z --get-regexp b4\..*
>> Running git --no-pager config -z --get-regexp gpg\..*
>> Running git --no-pager config -z --get-regexp user\..*
>> Signing challenge
>> Submitting verification to https://lkml.kernel.org/_b4_submit
>> endpoint=https://lkml.kernel.org/_b4_submit, req={'action':
>> 'auth-verify', 'msg': b'From: noralf@tronnes.org\nSubject:
>> b4-send-verify\nX-Developer-Signature: v=1; a=ed25519-sha256;
>> t=1669146435; l=45;\n i=noralf@tronnes.org; s=20221122;
>> h=from:subject;\n bh=E4BgU7G2i7CeIkR8F1AfDTtOvDBQA7ld22s0U29/H84=;\n
>> b=eRcDEBQvE702NSqEWQDLRyp9emSRvBjdhIW1c8e65OPf9Z1h78HB8UVqwWpf21mBSBtO8ZsLzPkg\n
>> L5w0Y/ekCLtNWAVqAjRGRASBZKkcbWnQ/CWLAHmzbHskL1tiwgMv\nX-Developer-Key:
>> i=noralf@tronnes.org; a=ed25519;\n
>> pk=0o9is4iddvvlrY3yON5SVtAbgPnVs0LfQsjfqR2Hvz8=\n\nverify:7ad470b4-f531-4632-8093-738d4d3e5d88\n'}
> 
> Heh, woops, I got turned around with encode() and decode() again -- we do put
> bytes there, but it works for me and it doesn't work for you despite the same
> Python version. Wonderful.
> 
> I'm guessing it's probably something python-requests handles behind the
> scenes. What version is python3-requests for you?
> 

$ apt show python3-requests
Package: python3-requests
Version: 2.25.1+dfsg-2
Priority: optional
Section: python
Source: requests
Origin: Ubuntu
