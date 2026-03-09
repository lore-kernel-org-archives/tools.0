Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AAF920C463
	for <tools@linux.kernel.org>; Mon,  9 Mar 2026 07:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=10.30.226.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773041321; cv=fail; b=lOcQnW3EkfkdoswFPVnOTuUJIrg5iqf4oMkDVrI8IBo02rmjHv7mG6rBhdgWIe/ZzZfZgMDyZhET41xqrCNVKFSDQn0LYMuERUwnFgRPjcnCRQhC8h3fdPRd+6bPoYZRidc1Yac/uMgwnL+S/sfODXybryOB58u6LbGNaHMAdhU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773041321; c=relaxed/simple;
	bh=GYyBYsP5ejSUFhYeGd0uGFLDHbN/l3sFe0lHi2kDnls=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=rC2dCKZNHbDKqgtyyU/KBBPNGi09+B3EuYIJweQ5j5oLqTuz2AtXIBpABfL3ht3PHoBVc2UA4Ih8KziBJCu4N4AlJSlM3fHEDvsd2x1aHjSombhyNqRwynlf58vfZmzo9sGhiLxpSrZaS/w97oGI7zxmPcGG6BkoK4kj71vGpdk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b=U40+z++i; arc=fail smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b="U40+z++i"
Received: by smtp.kernel.org (Postfix)
	id 22F74C19423; Mon,  9 Mar 2026 07:28:40 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11021098.outbound.protection.outlook.com [40.107.130.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3F5D9C2BC87
	for <tools@kernel.org>; Mon,  9 Mar 2026 07:28:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3F5D9C2BC87
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=vaisala.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SPyX40/hMpi85NWv4WughmwE3SmQdUdh8u/VL8e68yb7+G9zwxYmZTcLsIs8m/+GJQljbgjgLnM4muYPG0Mo0Ougx+MGX3Jre0XguyJScf4ms/mpnSYF+oXEkYGplNm14FkJGp3G49v6YVRwxLTX9sc7G51tXfF2aACyBXgNH+hqWLXaOaGVU2gyEh3eiOn1PX2QTbDOT9LdvS2Zov0V+TJI9VAVU1XSnpM6nJMj9FInLxJ9T2MOax4ogWvp2k/FIq0nr6pJhCFMJwK/Ygv2yA5eB7oEA18vV2+hAKttcA9LLAJF+dTG1rg3Fp7UjGStjuR46tdT1WdCVONtIKz/VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QxToPYjnR62oXRBf5Ik2SqaIAJKgDF1v9JFcaFGDZBw=;
 b=vW1ayJv6Yqp5h2zRWbHSqF0Y4xDydgm/RnzG23xcPGAEpv37QmNhXm7nT8OR3BCKyRldd2umFi8poggRk8pFvSArmiRCbMp4OHIKMCc19cJBxfwWF3nr585bGEOydX/qAX7Iy4siRByZPx2slYaSpI5bbUtSNLm+KKc+Lf+bELWFkdpoM8/6/jYZ78d/VL5QbSvLwpIx8rgSZHN0RQXYleFTZrQ6Lq0PMpnsOeaEm74/61DTOBRF2kK2oeOlX0JKNc5/WEF76hlMXnprFBQQ6GTm4zptiTAVNDwz5dOIYX+2HqUXDHFAQoPe6jLTkO1qdqsDJV9XP51JmjnfST3izg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QxToPYjnR62oXRBf5Ik2SqaIAJKgDF1v9JFcaFGDZBw=;
 b=U40+z++i8THAg4obz3LpO9oYWFUZilfU9O/4mjiphpbY1tLCTJnTJHKXmU90ztGnkZA5/6BTlseU8cb9bJrS05NupAsFqjGJpyOs4Gq58V/zRYOibvKLMbiDB/lavpdfcDsfmbcu+XS75+DEaX3KAlvAOZ4boss1W0vcasVbKkd3hmINH03IRqYL6Up4hebTEdAYWeUmAAqvXlge2U+gPhocIL9opF8HmyXX9cL5bFmN2/pbFwlR/cAacVbQRwnZ0JN5ReGmeMXWKFeXiBNHScqf2QT8xWcjvlRZddVJ21wJo49+cyv+ddpOsMkGPnx8kzPns+ScDGBk/p/SCO2iWg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from VI0PR06MB10639.eurprd06.prod.outlook.com
 (2603:10a6:800:2f4::10) by PA2PR06MB9245.eurprd06.prod.outlook.com
 (2603:10a6:102:404::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.23; Mon, 9 Mar
 2026 07:28:32 +0000
Received: from VI0PR06MB10639.eurprd06.prod.outlook.com
 ([fe80::3a41:90d:2091:bfee]) by VI0PR06MB10639.eurprd06.prod.outlook.com
 ([fe80::3a41:90d:2091:bfee%4]) with mapi id 15.20.9678.017; Mon, 9 Mar 2026
 07:28:32 +0000
Message-ID: <56dc34c8-c63e-47c8-9ea7-4420d71574f2@vaisala.com>
Date: Mon, 9 Mar 2026 09:28:30 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] b4: allow using xoauth2/bearer token to authenticate to
 SMTP servers
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
References: <20260306162020.54683-1-dtor@chromium.org>
 <177281752583.2015423.2312633416921696209@lemur>
 <aasPUY9XWOBy96rx@google.com>
Content-Language: en-GB
From: Tomas Melin <tomas.melin@vaisala.com>
In-Reply-To: <aasPUY9XWOBy96rx@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: GV3P280CA0056.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:9::10) To VI0PR06MB10639.eurprd06.prod.outlook.com
 (2603:10a6:800:2f4::10)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR06MB10639:EE_|PA2PR06MB9245:EE_
X-MS-Office365-Filtering-Correlation-Id: 16a6547b-e569-4684-b6eb-08de7dad77b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|7053199007|7142099003;
X-Microsoft-Antispam-Message-Info:
	P3pF/y6UFNd8ISjfCl42yeCZ1yTMeS7uRZyc5ZtJZkoWCuD42+5bcBh/ZFAdEqyPTAq9OJ8NAKXHFvRlclqWGLhu3TNsPXO7NHZwU77goDeNI23KqhnFm88VEaIjdLwUI9jOgDdznfXM+hYRjQbm+HTmN8fzwiLDs2QskLmn5rDDMg7UokOcctJVDmURIcU3++Z3W9OkhJ35gnrhcmSJJVihJJOvRk80G0Bbg17fPbUspzVZFPHbfCspqX9Kpxg2cZxZgHg2NHshjisTET8EmENMaNrm3j6UNriqD/zJbxBtNunDUwAyucHE2Gs7ch1DGb1q9ah9RvMa7Szw8m8Dt0KQX99fHdn2lekMFr41Lx4isNbLdDq9Z7IL1N9MOH3bOTGp36AQSNFyaIVd4w5CJfMigsTvFrjT/FDxPrMXf7r96ftH+kvUEFdD/cJa8P3h4/OpTbsbv/Za9fEpej5SskqGlORKNLzYZZm1Nhzp10F9REd4Njaa5u33IW/dYseJusKq/aWwqY9xD6jag3BazKhVCeKavQROEiZYZv4VD2o1914A64R66QhTfnlGglpDaC5fvCoZoUVRwYzVUfulIGM3SPc7O9iZyXPVgCuQeZB8vWoYAOC/wVxgHV4Xo/s5rjWzQBrzTQaGk8u6uVtB5PCCFBv0PIsA+soaDJjge8zeBVkyhTIGFtMCy/MNwiGYqihLmAxNgo0q07pM3Xf9aXobqrkfCpycqYWtXWeiMf2KGo/Js2cFE1s+synpodcP
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR06MB10639.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(7142099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?clQwQmNwT09VdGlZbUdFeUJCbkwyQi8vVFBFWCtVM0xNNStFcHVlTW94Qkox?=
 =?utf-8?B?MFl3OTh2SEFWZnY3TURLOG1UUCtjYTVBSmNFd0FZRm1rRmdkV2pFcnV6RlZl?=
 =?utf-8?B?N0lqemdmZXVFWVpsVmMzdThHWXQ0eTQweEYya0c4Q3dwOVBHYkp6bWh0cFdL?=
 =?utf-8?B?c3dqcUczeEpTL3AxWmRvQnpjaWRteUlDbWZDVDBlUmlvR3VMZXlLUjBhdW4z?=
 =?utf-8?B?K0Z6WjR4VkFKa0ZKNkpTYS92RG9yUWJnU09zTTZwQ1o3NWtacXhCMUxqUzBF?=
 =?utf-8?B?RkpsTVNTZndYK2tWZ1A4a2lrdVNnRXNRMFJ2Vk9sRWR0bCtnUzNBelhMaFNC?=
 =?utf-8?B?Q2lPcFFSaE9tcEN4NzBFTEJJQ1E4UVg3aVlVZTh0R2hMNlpEWnk3ayt5OUQw?=
 =?utf-8?B?b0s3WjU0MTRpVGNSMGQvZzBLYnJxT1ovNmRZUGpyU2xGRXUzUFRNRjRSN21S?=
 =?utf-8?B?eUMwalFvenN4U0tDMWVjUTdhZlhNS0hXS3d1OE52KzlEbDdKemF6QUJaQ0hz?=
 =?utf-8?B?TzBCVlkyaThnS0hCOUlRY3p4cmp1YTFOeU5yVkRodTNJWndnaUcxK09IUHRm?=
 =?utf-8?B?cGx0OWMzb2NpQm5NNHZtMXZ4OGM4NG9zRGJCN2UvNVVsZTEvUVk4Tm1ma0tw?=
 =?utf-8?B?clUwWVRxT2JsanhoRUVqd1UrazFPaTFZWnl3NW42T3dEVU9sbkpPOWIyOGdS?=
 =?utf-8?B?TlVQOWE5N0czWithb2k3VUU5NzBKSVdCbXFsTGlqajRhZjBSaEVMOE1uL0tW?=
 =?utf-8?B?THFqTE1HRGNaTUl6ZkZDSG1HeTRTcStrZnpXdWUwQ1VKWHFmNU1BejdHRlF3?=
 =?utf-8?B?anRyMkVscEcwTjYwT2V3WFQxUlVOd09sbTFpait3dFE5bUkxL08wZENPaWdB?=
 =?utf-8?B?anRjTEJFYzBTY3JsWGx6Q0drVWVUbHdQeUEvVkFXV1JSZGNoZm1aYXVndXVU?=
 =?utf-8?B?cEpZTjJBV1p6WnlGK09ZUkttN3VYYjEvNm5zMjd0azQ4Mml5bXdYeS9MdWZT?=
 =?utf-8?B?MTRqTnBkTnBpcnFnWkVxKzdOeFNCbWs1UjQwN3o0MTJZT2hPRU5IWjlaVkVT?=
 =?utf-8?B?bnQ4WnNMODdrdW5ZQ0pNU3l2T3o5T3FERmJCREM4UjYvemM5S01nR2dJYnRW?=
 =?utf-8?B?Z1N5Vjd3MmhZZllrdnZwb290bUJJZGEzNTFMdmNBN1dLT0psZlhBdmVzY21R?=
 =?utf-8?B?ODd4dGRabUNFTCs1T2YzVENwVTdTKzlWMjFnQk8zK0RrbXNCbFFzbVRmejQ1?=
 =?utf-8?B?ejNxQ3NzVzFNcCtic3UyNHdjaDFVMXJLSjBvWnJqUy9CeC9LbDUvOEFDSDU0?=
 =?utf-8?B?T3hEblorOXlvbWl2SXNTWUJQaVlMYmN3T3JQU0tTK2prMnRRb1RiZnRlMHE5?=
 =?utf-8?B?NGZiVyt0a2RDNTJLbUpmVFJGTDd5bU5PcnVTN0JsYzhBWWpiMnhTQVM2R3B3?=
 =?utf-8?B?WWMzSWFsK0xhOE1YSmFqV1lmcEVDKzRlMHNZbDk2S3ZHWHZxMlM0YmE0UmxB?=
 =?utf-8?B?WnRGYTl4cVh2aGxUcGVKbkVJRFlnVzZsUVVOcWJMNXE2cWhJTDVqalovU1VG?=
 =?utf-8?B?QzV2eExsdzJpbC9MTWRzcDgwYittMkI3SFF5UFZ1U3VsdlIwYmt5SThmNkhP?=
 =?utf-8?B?QmI4eisySEFoYlM1OTAxSkRLakJETGZtOGpkOWFVeU5aclNVK21QcS9MRVVJ?=
 =?utf-8?B?aWNTQnl1ZmFaYVQzaS9GMlpkRUg3dUlrS3dHTy9sa3lpNDRvamhFc3d2N0U3?=
 =?utf-8?B?NnVzeUxvNkVyTVFCZjZzWHI1cHljSkRIQUdWRktKQkk5Z2QydWR6R2U3S2Rz?=
 =?utf-8?B?S0VZcGJiRzE4eENMMGxrUTB6eHNvckVqa01ISW1NaXZhbWMrQTF3K05XZ0VS?=
 =?utf-8?B?TUFvNThid1BXUWl4TUdtRUwzR25QRGZoVWZZWlIrZHVnemRqdUtmVXVrS2dw?=
 =?utf-8?B?Vkl1cFdWRjNjcVRIMFRCRHBIZnNSUkxYVHVkdnpMT1dmblBMSisrNUZjQXFy?=
 =?utf-8?B?dXB1QTRVOFBjSkxub0dUenc0WFNkOVM5c3cvVGZNUUF5cmhabllqUzBReVhJ?=
 =?utf-8?B?cE9GK2RUNCtZV3NhZDZYcGgxYnVCWVZ2Q3lHVUNReGpWVHl3b3h5ODhqMHZ3?=
 =?utf-8?B?emc4MDdkclVaWUl3c3FZZzkwK0tRWW1JbmRGOG1xV3RiTSsveCsrcXFNamRD?=
 =?utf-8?B?eHlIamJZV01lWUR4OVhLMmxEUVoyVXFZOCtQbXNnOVd3cWFXbldGTEpZWWYv?=
 =?utf-8?B?TGZOTjlIMU9HaEM3N1lKZHF2ckZoNlJkWld6RUFsMVJHbEZxL2pmc3d3SlpC?=
 =?utf-8?B?dndTMFV0TXdzc0tDU1FqRS82MGlUM1VBd0NXVEd4ZzdnMGpFLyt1V01Ha0Qr?=
 =?utf-8?Q?a7xYuHOurNMDmvXY=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16a6547b-e569-4684-b6eb-08de7dad77b5
X-MS-Exchange-CrossTenant-AuthSource: VI0PR06MB10639.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 07:28:32.6109
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V6N/heR7D08f9S8DXG1ixn3gjjVkx/qteU+AlY2/OIs//WKHHP5BrXZvaUUXV84jLyvr6rubw3WLBCv/TqA8gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR06MB9245

Hi,

On 06/03/2026 19:35, Dmitry Torokhov wrote:
> On Fri, Mar 06, 2026 at 12:18:45PM -0500, Konstantin Ryabitsev wrote:
>> On Fri, 06 Mar 2026 08:20:18 -0800, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
>>> Allow using XOAUTH2 as an authentication protocol and assume that when
>>> XOAUTH2 is specified the password is actually a bearer token (typically
>>> not stored in the config but rather returned via "git credentials".
>>>
>>> Recognize "oauth", "oauth2" as aliases for "xoauth2".
>> Hmm... we do have another series already for XOAUTH2 support:
>> https://lore.kernel.org/tools/20260205-smtp-oauth2-outlook-v2-2-6a5eb233b285@vaisala.com/
>>
>> However, it's outstanding with a few requests. I wonder if we can take
>> this one as a first patch and then build the other series on top of
>> this.
>>
>> Cc'ing Tomas on this.

Perhaps I'm missing something but this approach looks to me more like a 
workaround. I'm not seeing how it handles the oauth2 lifecycle 
expiration which is typically within hours. The other series handles 
that with a helper that will update the token transparently as needed.

I will return shortly with updates to my original series.

Thanks,

Tomas


>>
>>> diff --git a/src/b4/__init__.py b/src/b4/__init__.py
>>> index eab290b..9a5d25b 100644
>>> --- a/src/b4/__init__.py
>>> +++ b/src/b4/__init__.py
>>> @@ -4331,7 +4331,11 @@ def get_smtp(dryrun: bool = False) -> Tuple[Union[smtplib.SMTP, smtplib.SMTP_SSL
>>>                   raise smtplib.SMTPException('No password specified for connecting to %s', server)
>>>           if auser and apass:
>>>               # Let any exceptions bubble up
>>> -            smtp.login(auser, apass)
>>> +            if smtpauth in ('oauth', 'oauth2', 'xoauth2'):
>>> +                auth_str = f'user={auser}\x01auth=Bearer {apass}\x01\x01'
>>> +                smtp.auth('XOAUTH2', lambda: auth_str)
>> This is what the agent tells me about this, and it seems valid.
>>
>> smtplib.SMTP.auth() calls authobject(challenge) with a positional
>> bytes argument when the server replies 334 (the XOAUTH2 error-detail
>> challenge). Because this lambda accepts no arguments, that call
>> raises TypeError, masking the real authentication error.
> Right, I guess because of implicit initial_response_ok argument to
> smtp.auth() when I tested it the lambda was called without arguments and
> the authentication went through (with gmail).
>
>> Suggest:
>>      smtp.auth('XOAUTH2', lambda x=None: auth_str if x is None else '')
>>
>> This way the initial response (no args) returns the auth string, and
>> a 334 challenge returns an empty string so the server sends its real
>> error code.
>>
>> I'm happy to take this with this fix, but I'm also going to wait on
>> Tomas's thoughts.
> Totally fine with me.
>
> Thanks.
>
