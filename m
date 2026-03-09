Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127E937A490
	for <tools@linux.kernel.org>; Mon,  9 Mar 2026 09:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=10.30.226.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773049854; cv=fail; b=h5tR5GoQwuv8HiAoqjFmiyEq64cgRQnAgJO4TUa3t+TXWDA5DAEHs2BHB5Es0wQ60ZJIdlETjA43m/IYPFwocufA8igWhyFKSaY3vH5zF7pXYSKbdePYAf1vducjxh937WEATJi1ushFBwSc3k5GDMeYOPgo06dHUd5vf3/I20I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773049854; c=relaxed/simple;
	bh=puYkVBNb7o/CJZPVlUdGrHcfNdfN7dz2F96q40e0hCU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=E5Tz6PM1arkPhQHuEsgnpNXfWEarfE2k9xDFpN8GlLhpwMgG1+X8w0DPAxNvxcRxix4HU0CjA3MRSUP4VlC1F3dUcS9NKD/wT5bUZrhD/rTUw3MYfWdkw8E3GUfQ5tj9pDcHfBAAPm7Oya/EbM1WQbC88nquDvLDArOGD8wo7ng=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b=EuMBszyO; arc=fail smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b="EuMBszyO"
Received: by smtp.kernel.org (Postfix)
	id D0CCCC2BC87; Mon,  9 Mar 2026 09:50:52 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11022097.outbound.protection.outlook.com [52.101.66.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4D2CAC4CEF7
	for <tools@kernel.org>; Mon,  9 Mar 2026 09:50:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4D2CAC4CEF7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=vaisala.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EUnuwCjt8GP1Uvtb6FImyHQCFUvb+BwGos2AOOJBCFnyxi0fsDjtZe2Wpyl7BSzUROlcYKpajW41cmcyZNIcr8uBBn42AdBpLGJHUoE+014MhvyCKpwUEjY4k6KsfFM/1xkhhijhb/qO4/iAWiLDKxIYMBG/CMAl612UbGmigGPBRuluxxU0WLzM4E2Ymj9z9pPT0Q2gbwkxKyzGgA2Sxd3OFOPyHkGWlSrBiT/z3q7zQJ/Z5IacZE5CtdSCiwNeUEnjZHPn/X6WPzddBQmp5/owztFC5C603Ej29vHhHIXgActqDmlH4x/9hecBnbBIGJAlvPO5gyo1VgEvtoRe1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Ksfp+ZRIPNxlJWl7XgaYqveWCIkvW5NupUmyjSpxRo=;
 b=WCB0nttOrdbhR3a1jr+8Mi4wyBwuzmINwDAVXzP3QxKv6+2e0hVpH6CaOM/n71lv3ZbTpPCALQfP4gYXWZxpNrQUcUA+DfEQVMmfbLYtSGwjm6HbLmh2aKCMo2HiEHvZdTgrG2l9Lz3Ebm/gHzsw1+sVKGHaEP99bt1UA8/Pd3VvqkFiueQiM8YM20J+PUqH9UZhG1W0Ee3ha+vopPgpPprTLiJ3W9+ku0HFaVYV7g2ArVYrfFCKUu3RzyQ64nQGeKM+kdhttcYKTgiwxNZZ5b5/XTDo/dJLU7lD99JAoPXBNZgKSEsmd8xQaewee395UHsUAX79o/W6djHocSA3Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Ksfp+ZRIPNxlJWl7XgaYqveWCIkvW5NupUmyjSpxRo=;
 b=EuMBszyOLFlN3x+7ipOgz/9ptWq8mBIJ2n+/VEmSOq5PH4h80+RgmIisJ+a2yCrcle8NKB1W8Sn23a3bZOvfmqLo+OHaX4R2wZJstL5N0O2a53f2QZgoH65qbJGdA9EXUFe5ISyu1JiwHHklkmxS59swUC5bi89MbuUjwmioEsmp1LgryV/h75/69fHCgiNpi2+TP/P8amXhJM6yw3fmxLoqhjtY0dCXlFnmJ9aycfxZe0Kasivqddgghm82u3KpjY4YuxxMj1J9bAHThwr78h57IGPkiLIsKJ5jjOsYLb37sx86UkRt0tpMTxM7M4Wkd77ENYpUP4jlYcNidmX39A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from VI0PR06MB10639.eurprd06.prod.outlook.com
 (2603:10a6:800:2f4::10) by DB9PR06MB9937.eurprd06.prod.outlook.com
 (2603:10a6:10:5c5::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Mon, 9 Mar
 2026 09:50:44 +0000
Received: from VI0PR06MB10639.eurprd06.prod.outlook.com
 ([fe80::3a41:90d:2091:bfee]) by VI0PR06MB10639.eurprd06.prod.outlook.com
 ([fe80::3a41:90d:2091:bfee%4]) with mapi id 15.20.9678.017; Mon, 9 Mar 2026
 09:50:42 +0000
Message-ID: <466569ed-7b4e-4ab8-a6be-3c5379fc3544@vaisala.com>
Date: Mon, 9 Mar 2026 11:50:40 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] b4: allow using xoauth2/bearer token to authenticate to
 SMTP servers
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, tools@kernel.org
References: <20260306162020.54683-1-dtor@chromium.org>
 <177281752583.2015423.2312633416921696209@lemur>
 <aasPUY9XWOBy96rx@google.com>
 <56dc34c8-c63e-47c8-9ea7-4420d71574f2@vaisala.com>
 <aa54CjijJk_1S4dd@google.com>
Content-Language: en-GB
From: Tomas Melin <tomas.melin@vaisala.com>
In-Reply-To: <aa54CjijJk_1S4dd@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: GVX0EPF0005F68B.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::131) To VI0PR06MB10639.eurprd06.prod.outlook.com
 (2603:10a6:800:2f4::10)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR06MB10639:EE_|DB9PR06MB9937:EE_
X-MS-Office365-Filtering-Correlation-Id: 3202cf67-5ca4-4c57-6508-08de7dc153d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7053199007|7142099003;
X-Microsoft-Antispam-Message-Info:
	WgCZc8NfUcVRjblN9MSy90fzOidXofiYJmdXtUHQoDO8Q91RjsfpuBQIP394JWswjXCEgX/1q0IpyWFHai3khaq/SLPnbgJENDXOFmYdx4qS+4Z3168ofmw81vv3MfvfVnBshRt2P6xN+0/XtRnyFvCg9RVE5I9ochLSnmN3lRhFcPosl7htnhVYNAQtXYsCem0CmLvkGJWXi49Arzw901kT1QNw8n72LpeLEOp+ST5eLJj4L8N3i3W1GU2yFNKdEQZemQvbx6EPi2dOlweo0eFA/Hwi1jtxv0lIYFJ2mORNyLa+EPBrQht/w2RXHHI6WWcJnw02QxV+fadWKfxVcX5wrDWbVnL5DZ1ySceBQFUf0USankm8KnfvlbjSo23QpDN9ZHtyZ7eUnxMS20Td7K03b8ldmrVqi+RwHZx4Q4xcGaOZwG4jCCeIFexHo48dqH4oNSsPNXFJ2qycvvFk0Ulqrv8ja0QJQuhGmqZA3aP+mqKCj6xhezEfC2Zr+fLGN3phCMkT3TCsCJwZV5x1py9kgWPnMSkShZ/f0Iw2wuoZx1YoNePX/U7FNb4IsfGIbVURVN1cAoKhm03ZF43Uwo2cIla1Apq/87ynbeCAgX98PQ3peGZtGcECZwJRDO0CqVqS8mMMGdV/owf7MbS0TdPnvJ7aEvHMD/zTJKT6ZEImWQyxzno+775TYNRetlA6
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR06MB10639.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(7142099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bEtMNndQMldhQ1BYVXh3RzVBRGJ3Q0FnTFNHRDFtVFRNNmZDcmEyaEJucXhr?=
 =?utf-8?B?eFRPT2RlU3gyWDE4ZGx3STE1cGRYbExTSjQvRUdBM3ZPWU5hRWczOUtrRVV0?=
 =?utf-8?B?dUlOQ2NCR0t2VUtzVmRaSFdFTG5lU1ZLUTJGbTMxTnF2Z3NRVGFiQ1hMSU9Z?=
 =?utf-8?B?bTNKb1llR0FtZ3dQUlhPdGhPODV0L0xId1orTldTV1hZSFZmcGlsZjlFTDdJ?=
 =?utf-8?B?U0pRTWZKdHRaYkJxTnUyZUl1UUlVVFRBakV6MkFlazgyeWtFa0hkZVJ2a0Fu?=
 =?utf-8?B?ZEVwVW1vbC9XeUNBanRZbExUK1NxSUpJN2R0NXdDOWpHUnYrd05SeCtuRnRl?=
 =?utf-8?B?bWVibU55K242b0EzU1ZxazJDQ3J0eVJsLytaTm9sVk8yYmZHdkxmWEFkcjQ2?=
 =?utf-8?B?dkNBY3lkUFZtaHduN1ppK1BNZU5pL1h3WmtRa05VdmRxakNINnZqSFVnT3J0?=
 =?utf-8?B?c3NHdmNlL0ZCaGxwc3FJaXJzRXBiSU5GczJYMWFMSjlFVjhyNUd1TldYeXV0?=
 =?utf-8?B?b29LK0xzMWlrMUd1Q0dmTzl6YUxBRWZsVXBsWks5WlVYWnJxcXZHTUJlVnRv?=
 =?utf-8?B?R3BKcldvb2dBcXBSUjVEMG9GVDFJNWQ4VUVhR0hmQkNXMlZFVlpCdjE4elVp?=
 =?utf-8?B?cmxtUnRuVit0RUpMQmI5RU84SkQxNTgvTW1IVW9xUHB1NUp4SHFQUmZMS080?=
 =?utf-8?B?NGdJbUFpdDBhNnZPYTJOY2FCSjd2dmEwcUJhMytza3JHODY3eDZWNEtsRGdQ?=
 =?utf-8?B?TEZYblNhWWUvTk1XRjBtMmxCV0ZPMnNtL0k0bzZ0Z20xUjZhVGFMcVF1alpM?=
 =?utf-8?B?cVhnbEJoRjNHV1VWbG4vT2dyaHNhaDdaOEp4V1hmNklyZXRMMmUwOU0vTm5B?=
 =?utf-8?B?TXE4Q3pUMFBHUm9LUFYvdE15NWcyNkpvREtPSFE2YjhCbHNMMHA3NGVxOFRK?=
 =?utf-8?B?c1RhL3FmMThBWVRGRzYyay9VYjd1dkx0OFRaRUlGbkdMczZNSjhzY1ZKNmk0?=
 =?utf-8?B?eEZoa1g2NW5FdmQxSGZ4ZHA3UDNjU3hZQisxYkg1U0hDMVVQMllvdkNuSEo5?=
 =?utf-8?B?eTMyTEQzMWRHOWZKZ3FKdHdIUWRHR29WU0NBdUZERlpuZ3NSRlFLNVM4d1hJ?=
 =?utf-8?B?SUdKWDRBcnpLQWp0TzJaMENVQ1dSU1RaTDZWZzFiSnN1bFJOZTlGYlFBWlJQ?=
 =?utf-8?B?N1hCb2pKbjdRMmxIeXhuK2RLSmMzRVZCZDR5K1lUZ3ZnKzdyT0pxS0JudkNH?=
 =?utf-8?B?ME1IUmFLbWN3WFFtZ1NqQ0pLL1p0VElmR0VJcDlCbm94bWwybmljdi9KZm9K?=
 =?utf-8?B?WUNTd09seE45RFhtR2ZqOWVFSXZ5VEZCbTIvdmNnU1dlaktQS2xmRGtBMXpE?=
 =?utf-8?B?NUloa2kyTEdEQTVaRXZpSnczZTJFWUkyRFJSZ0M2N1hRMWxEOXM5NFdzMjha?=
 =?utf-8?B?d2xCK3YyUHhIdGlrQzdRMHh3dStwQU85djBibzY3RjVxVnl3ZWgybHhudFUy?=
 =?utf-8?B?OTdvbmFIajRrdk51TWRLWXlsSWdTb0pWcUJ0TDFPbXViMjVxa1pDb3dNVDJB?=
 =?utf-8?B?Z3RUMlpOTFVDKytxNm9LT0VtdVJ0OUhBUmYvS0xDalZmSy9UeUh5cmZyUGtG?=
 =?utf-8?B?bFVOekhwQTYrdHp3WUFLRlkwOEhzeWwwQUNuZ1lZL1NTNXNFMWwzakRySUR0?=
 =?utf-8?B?QmN2ckxlVnVPN0xQeVVhekt5dGttWEVXcUczemFBU3A5K3hNL1RqL0pIZVMy?=
 =?utf-8?B?Umd5ZjhaTVpmRDlFMmQ3UVhadllRWE1kUVZTeGxLYmdDYjJsS01jajAzQ1hk?=
 =?utf-8?B?TGI2S29zaDZnak5GWEtjUjlQR0xrdnQ4NDk3NkhWMUs3QjJRZ1BUTXBncDRz?=
 =?utf-8?B?UWhoSi9BU29KbHM2TERYbVVxQ045MGZod2J2TG5JUkVUdFZxVkxpNEY5WWVQ?=
 =?utf-8?B?UjdEMVdWZ3hIWTRWc1RvWlBkNHJTd0todDRiSmZydjhqN2pwL3lOMjYyNFRT?=
 =?utf-8?B?VWRZa2ZnM29qWURadGRHODd0RnVFeGJSc3YzK3g2eHBTKzBQeEp6eFVxU01H?=
 =?utf-8?B?Mm5RbHZXRjluRmEwL0o1THFhMVRoQnl1dXRyNnpkVkt5eDREUjRGa1lPVzA5?=
 =?utf-8?B?VGpzMWFLSTdGcktFN255UEd5dC9jMC9XVksxcVRuNjBpR29FUEdwN1FIUFV0?=
 =?utf-8?B?MWo3cVNtUWlDc1phWDlVV1dpQmcrL1hwZy8yazYxbE5tQWJzRXNVdlVSWVM5?=
 =?utf-8?B?eUcxRzlscW1YYjdJNWRwMWtSNVFLWTRDWW1keGpCZWljL29CYW4vOHl6Vkcv?=
 =?utf-8?B?dzdOUlN0MlpLeGlMUS9oMjNwWmFvZmx2UHFWUzUzaHRxeEVwNk8yZEZnR05E?=
 =?utf-8?Q?On2dhwovjL30cXbA=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3202cf67-5ca4-4c57-6508-08de7dc153d1
X-MS-Exchange-CrossTenant-AuthSource: VI0PR06MB10639.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 09:50:42.2874
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NHp72IVLerrSr1GZtNAr/Ey0JLSoAIVSaWvlyUOTMsaDAJYWITrhjb9ydwUsnASAb6GS7x8aw2VNXvzprFyUHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR06MB9937

Hi,

On 09/03/2026 09:49, Dmitry Torokhov wrote:
> Hi Tomas,
>
> On Mon, Mar 09, 2026 at 09:28:30AM +0200, Tomas Melin wrote:
>> Hi,
>>
>> On 06/03/2026 19:35, Dmitry Torokhov wrote:
>>> On Fri, Mar 06, 2026 at 12:18:45PM -0500, Konstantin Ryabitsev wrote:
>>>> On Fri, 06 Mar 2026 08:20:18 -0800, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
>>>>> Allow using XOAUTH2 as an authentication protocol and assume that when
>>>>> XOAUTH2 is specified the password is actually a bearer token (typically
>>>>> not stored in the config but rather returned via "git credentials".
>>>>>
>>>>> Recognize "oauth", "oauth2" as aliases for "xoauth2".
>>>> Hmm... we do have another series already for XOAUTH2 support:
>>>> https://lore.kernel.org/tools/20260205-smtp-oauth2-outlook-v2-2-6a5eb233b285@vaisala.com/
>>>>
>>>> However, it's outstanding with a few requests. I wonder if we can take
>>>> this one as a first patch and then build the other series on top of
>>>> this.
>>>>
>>>> Cc'ing Tomas on this.
>> Perhaps I'm missing something but this approach looks to me more like a
>> workaround. I'm not seeing how it handles the oauth2 lifecycle expiration
>> which is typically within hours. The other series handles that with a helper
>> that will update the token transparently as needed.
> In my setup "git credential" returns bearer token that should last
> enough for this b4 run. Next time b4 runs "git credential" will request
> a new bearer token if previous one expired. It is not expected that the
> token is stored in the configuration file. It looks like
> git-credential-email behavior should also be compatible with this use.

In your case, how do you provide the new token to git credential?

How does you .gitconfig for this look like?

> However looking at your patch I do not understand why you want to parse
> configuration and run the helpers directly instead of having "git
> credential" return the data for you and rely on it to figure out what
> helper to use and how. It gets protocol, username, and host and should
> be able to figure out what should be returned. It is not b4's role to
> interact directly with git helpers.

git-send-email also requires similar integration with external helpers 
https://git-scm.com/docs/git-send-email#_sending_patches

thanks,

Tomas


>
> I also do not see any traces of handling lifetime expiration in your
> patch either... Not that it is needed IMO.
>
> Thanks.
>
