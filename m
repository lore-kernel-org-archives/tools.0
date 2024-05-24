Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C043212CD9D
	for <tools@linux.kernel.org>; Fri, 24 May 2024 15:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=10.30.226.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716563281; cv=fail; b=s6PHKkO/l6jICoCkP/wGZ4a1w1BNsr71tuhZF+dbVGHP/5heeC1P6ucje8iH3qZBhTm+n8o3clG7ul8mQdNDFwGJjmPIp2sVQL2xxczJ+R8+f6SiMeUM5wxqEMJ/7qUqQJ0g+uruRfsYU2WdyNyvxh/M5X585LmJ8Q3hgnS3ui8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716563281; c=relaxed/simple;
	bh=+PiIJq0HQHqPd998yoHC9dC1XQw7PrYXd2+ngTykpAk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=C3SI1VB01p55kmn1443ZEnnXu3TdthSUJsPm31ukD9KM/hhsxL2rOQ2jZ7nFqB5Ix3ounq80JIYCsRRKedWU4+sQUqYsdlV51ymcdnKtu2sXihHJxsmQl3HJfNPKRRgYdaxCjeNTXHYwzh/Gbr2h9D3nL40MxGuq3CCdO7NCqRk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=ZIuKD8mf; arc=fail smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="ZIuKD8mf"
Received: by smtp.kernel.org (Postfix)
	id B464BC32782; Fri, 24 May 2024 15:08:01 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2128.outbound.protection.outlook.com [40.107.20.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 98EECC2BD11
	for <tools@kernel.org>; Fri, 24 May 2024 15:07:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 98EECC2BD11
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=cherry.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JzNvoZwEBXljvdkPkyvNQK8FayeSvMlLkU8sW61WjibyaXpS41XFzcdV/wnEpLTWEzxE+k+7rKzZMsOawaTowicrrSymIaWN463mqpjAVN3G3MfrP/GVPTD8ZD/VqMIqIWcZD9sR0f1vDxq0jbiPBai/hN5OCg5d/RpCFqpCC5jkxMuCwog8eqtHrs06a4+PxDTu36ilWMzmg4oDceiqoB57P+oaRTw33CLFvS0Sbv2WHsIg091REHL4l0o3V8H3cwBCzk2jaQk9DvPWlffrmQxO0KBlcOYSVOgGZIlMtUw+V6BL1vJMysYTb5ut/ESUrByP575Yx0VdNItmrfHMfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0JsYRXf1T0wAL2cETJrTlFSrslYxJ12WerxoYGI7c8U=;
 b=GFkyTtJLrAVriHhSDu+lHC6v03fDxz93jg+LjIafoZRPQzDJzk80yjQTwuWv+vxUujZIGCrU1G/jZ6OeiWYEnF4ZkIaDH2W1hmLvF6YJ2ciC+QX74Ags0EEG2q6zPpsUD7RGwIHA1JC+GQkakqqSaXBztYkypuKFuu6I8sc1BHFB7FZCHp1g7qrRLslkjeE3YC3fHf30g9tuNx5e27168NMl47pCbJXT3keKj606pvOEmRdRdLLhKKKe+lOvoG1z502N1KgjKCJOjM4d1EZCOoXgRjYqEwWXcTgsE6ioYqm8W/E5utfZuBahjrPf65HNhNQZDK15SBJ4dxTykVwUBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0JsYRXf1T0wAL2cETJrTlFSrslYxJ12WerxoYGI7c8U=;
 b=ZIuKD8mfpkKj6Pr68Xh6izyWFP2OEq+XRdGHznHHrtZyaowP4yPD30S2pjDxoqhSQJNkvOb6lavZaELDkRIugPfFJYBSe9XsjMN1VI5yIk7IwsOfI3pBvVNLPiIO11eUOSHUiJI4ltJaZf7YYsHs9igyr99WNd79YTulXCMp1U0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from VE1PR04MB6589.eurprd04.prod.outlook.com (2603:10a6:803:128::25)
 by PAXPR04MB8557.eurprd04.prod.outlook.com (2603:10a6:102:214::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Fri, 24 May
 2024 15:07:54 +0000
Received: from VE1PR04MB6589.eurprd04.prod.outlook.com
 ([fe80::8476:1b2f:f236:db31]) by VE1PR04MB6589.eurprd04.prod.outlook.com
 ([fe80::8476:1b2f:f236:db31%6]) with mapi id 15.20.7611.016; Fri, 24 May 2024
 15:07:54 +0000
Message-ID: <2e1d55cb-6692-4ea3-86b9-06e2af45f739@cherry.de>
Date: Fri, 24 May 2024 17:07:53 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH b4] docs: document b4.send-prefixes conf option
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 Quentin Schulz <foss+kernel@0leil.net>
Cc: "Kernel.org Tools" <tools@kernel.org>
References: <20240524-doc-send-prefixes-v1-1-c6465822ad8c@cherry.de>
 <20240524-great-fanatic-whippet-caec89@lemur>
 <20240524-nebulous-ibex-of-finesse-c2ec8b@meerkat>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20240524-nebulous-ibex-of-finesse-c2ec8b@meerkat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0022.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::29) To VE1PR04MB6589.eurprd04.prod.outlook.com
 (2603:10a6:803:128::25)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6589:EE_|PAXPR04MB8557:EE_
X-MS-Office365-Filtering-Correlation-Id: bb069b54-9508-42b9-fc18-08dc7c0349d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SGdKTCtNTFBIb2c1eWc2Q0NSNWJCRXhJT0lvdVIySllPYVNZdUh0eDBiWUlq?=
 =?utf-8?B?dzE1WS9tcC9SVDFPbUYwVVhFM0VBMmk1N1lUUkpsdzlYdWRQT3p5VFBkY0U5?=
 =?utf-8?B?Y25pY0NTaXM3NXArL2hJODQrNXgveXJ2clc1MnNhRjRJWG1VaUJ2dlhRNWNz?=
 =?utf-8?B?VXd0KzZEdjZxbk5Lcm9nbktwbmFDK0E4QWprRkl0OHF5UmFJTlJuaGtORnlo?=
 =?utf-8?B?WW5CZEViUTJFdU5nN2R6eXB3WUNNTmNoZ0ZtY2FrV3U2ZVM3cU5IaEtqczIr?=
 =?utf-8?B?b1VIZ2tRQ2FUTWY0TU5HY1lIbXgycXloamRsVktDWlRTUU55WnNkTERlSk43?=
 =?utf-8?B?RGN1b3I5VVBVVEp6dzdMMmp2WGxEbkpCR29SZjNZUkVBVWNRU0FIbWxkMS9G?=
 =?utf-8?B?WWsva2xPZGRMbDMrdW16Rks0eUtEQnlFMVFIbDZ5bDB2WXNmei95VUhuVi9O?=
 =?utf-8?B?QVJwR0hNQ0h0Wk1xNWtuV0VORDJUWHdzV1VKUTI0VjRCVUZvOVRsNjIybjF0?=
 =?utf-8?B?TnFYbVMrZUVFSFVGeTRTd3N1YWdPcFhRUDc4dCtvTkdwb2RQUDgxOVFUNWVz?=
 =?utf-8?B?Y1ZYWWs3Y2VjVlE0dXN2SEsvQy96STNRWFVPSUVEZkFmZDJHS1JpSVQ2b2Vs?=
 =?utf-8?B?aHI4SVBNb3lKL2YrMXc2czF1Ung2WnNlNVVoNzgvVWFrRFpNZnZVa0V6Qndv?=
 =?utf-8?B?ci9jeGkwU3BEWkkyMGQ3dnQzRkUySlVySUZzMmRuUitNWXd0dk1CVldFdm1u?=
 =?utf-8?B?U2E4ZHNBUGswajQ5U2h0aHNDdGhVMWxvMlFLRm1KdEtIUlY1MTV3MnkrUGc1?=
 =?utf-8?B?ODArc3RWVTY2QUh2SkJNenhwSkFNSXE5dncxOVhYTnlOdkhQMGZRZE4rM1h1?=
 =?utf-8?B?WUhuQXBRZEY0SDd5cHFXYXAxVE1MT0ZOeWxpallKSWRRYnZhQm1XM0U0eW1L?=
 =?utf-8?B?Q3hWdlFrYU9ldWQ3cWFqTmEwY3hFcDFKdmpKeUYzWGkxcHZoRmQzRHFWZy9G?=
 =?utf-8?B?US93R1ZBdS8va25ZUlpOcENUSlp6clZHWTdYeGc4WVNYUVF2S2kyMm40RXUx?=
 =?utf-8?B?dG15WXpHU011Qk50V2ZGY1A0TVdzRWNUc1NwSEVHTSswL1N5M0I3NDUxSGta?=
 =?utf-8?B?VlN1NjlVRHRrbWYzUXdFOW84VWxVaTMrQVFIUzhuSGpqK05VS2t4ejFxTkNF?=
 =?utf-8?B?djVlRjVFUHloUWpNaGJWbVhRNDhLcng3ZG9IYmNKakxPRHJFV3Z3SUN0OHRH?=
 =?utf-8?B?SWhmMFNlR2lIQjNKT1A3MVJnRmFrbUpGbXhrVjBBNXpIS1lzR0x4YjgzcmFN?=
 =?utf-8?B?K2plazBZOGhHSXpvcWZRaU9VWm9GRWU4RWZZTHdKQUFrRnlPRlF3aXZGd0k1?=
 =?utf-8?B?RVhsd0VjRk1Td2pISzZjM3gyMlF2azZDMXA5azRiS25ML3FjY1p0Y2t3N2pp?=
 =?utf-8?B?ZnJDajhPWW5WNmEvZ05UN0pVQUljbG5jV1lLRFpTd0YyNk5ZZjBjNk9xQ09k?=
 =?utf-8?B?cVgyV2tPMUNTQ2dndENPQndPejFIa21mWWY3UVIwMUlOTmxTOXNPUkkxaGdM?=
 =?utf-8?B?ZFJjSDViSEI1VHRlbC9EVkV0MUM3N1pORzhURWpOUXBnNzI3Zk85VlJqTHQ2?=
 =?utf-8?B?SThvUFZadWpoUlhwRzRkTG8rWDBBd3puTTNIMHVSQkx4QXhtMnRkUDVCYkYr?=
 =?utf-8?B?cnpOZFVMejExLytTM2FSZ2grSHdZMjR4d0VBbk9kOVR5elB4L2ZNcDRRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6589.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WEhkZkwzMzRYcGRRY2c3a2tucWpvUlROWWttL3hGcEJjc2ZSWU8weFcxSGh6?=
 =?utf-8?B?V0dHekdiMnhCOEpRMTRKdXd1UTRHN2p0YzJaS05WalRtM3BDMFhjMFVPeEor?=
 =?utf-8?B?NTVYV0lqbTRUdWFra3BQWXdyTlVrMnNOL216UFhMbDNVSTgydGdYbE5kNjVl?=
 =?utf-8?B?RTRvOHAvcXpVRzZMcXBmUHRnbTJVWUNiejhWRUNBNGZJUVdQR1krbWV6UWhR?=
 =?utf-8?B?b2N5U2VNTFkrbnRndjV5ZTFUTGdvYThVL3h0US9RZTRBWnpsUS9WbjRDSDF1?=
 =?utf-8?B?TTU0U21HUlRraDZIZVoxeDdOMnF2NmxFaDJDdndXWnZWbHpONzdsMDVDR3ZO?=
 =?utf-8?B?K01RNXZNRFBmQ090eGtaLzVpb0lJRGFlTC9Ic0FqZC9TWWlRZEV0KzJ2dzF5?=
 =?utf-8?B?cU5FMWV3eHEvSzk0UEVJdVdmQXVzcUxtUlF4c3kyZ1AyRk1CVnJmVnJxRHFr?=
 =?utf-8?B?S2V2MXVQVTkzMWNnOHdGbitpWUdyemY2SlY2Uml4YVJhS2VJdlF3WUhkVVpQ?=
 =?utf-8?B?V3lnaGFLVjFYdnhCMnNINzMxZ3RUVzQwMkUwTXBJbjZsU1BXeTl6UThqRHR0?=
 =?utf-8?B?S05CVm1Md1lidmR2RmpvVG5ZVTZVdkZscU5zS2llS3FTQ0xUZEtYTFVxdzlU?=
 =?utf-8?B?aUM5dUlhU01nMGxOZFlZRVUwb25DZTlVRmw1ZThobzlIb2hJelJJWE1vZmRa?=
 =?utf-8?B?Q0JyZkRVejdwcEZOUk1NUThNTGtZQTl3bUZZOE5IZXNQWTVyZW5Gd1p0OUdn?=
 =?utf-8?B?UWtub1B1TmUvakd5a015a0laU1A0WWt2c3JIdFFQMVdhN3pWRkJ2NkVJTFdw?=
 =?utf-8?B?RTROVk1nWWlQWWpsSTNodDlwbFk4eTdYQk9uWVhwc3FCZU1ITmdPNTc0UkNS?=
 =?utf-8?B?b0owRmlHMFJDRXkxUXloK2xLMzIrNjB2ZjRpbXpJTEc5OTFBekIwOUQyNnFE?=
 =?utf-8?B?S2c4TDJSZFRPUlg4N0ZMcG43KzNtOVA1NWdaOStzUTlrNTY1eDgvWFZXK1p4?=
 =?utf-8?B?Z3RGSHpOMmJFL1RPaXZkeURPaHlhQmt6eEZQUGorNTRuKzNCUi9iTHhNUHNB?=
 =?utf-8?B?YVc1K3NadGxvZmRPYmlMSVRwbEROWlhrOUFkVmR5ejlEZllkTXZXWWVVbmV1?=
 =?utf-8?B?dlpHMkJhbnhqTERVbzNDV2taeXRCQkMvb1VEWEU3dFBqc1dZejYxQUhtaWNp?=
 =?utf-8?B?V3k1K0tXRUErS2xlQ28rZDBpVWFSeTN5NGpxdDdpMWFLc1E5QUVYaUEzVk5Y?=
 =?utf-8?B?ZElEanBSSXhkamc1bVhxVXhnd1lLLzVoLzA3bHhUd0xpcTVFTythVUFDc3Zo?=
 =?utf-8?B?TGFrUnlnelRjUG91SWFKM21SVzQrT0VROTlmUkgzL29XeTZPL0t2UTRzSXhq?=
 =?utf-8?B?a1dmTkxZbTNta2RkRzdXYmx1ZjcvUkwvNGlDellJN0drN21UZnR0bndJSm05?=
 =?utf-8?B?bytmTUZTWmcreTdsWmdRTkkwbnJGcE4wWU54MzhmRWxiZHlzTEk4TWJ3cWVO?=
 =?utf-8?B?ekhGTHB1aExsa1dYU2tNZjBEREdFRERRckdVOXMrNUtPelA3V2Q0SDFCSGxN?=
 =?utf-8?B?UXBYRDl1cU50M3lBOGJXV2JDczBCdUQ5U1dhbnpUVE1UVElIQ0pJclJ4bmw0?=
 =?utf-8?B?NDFIUUNoT2lhb2U3QkFxV3NacjZPKzFKdWJJSktZTW1CTjBFcDhyWjRzQ3Qv?=
 =?utf-8?B?dTdqcHE3aHhzNythd0c0aTZPVUNIaHg5M2tzTnpJbGUyTHhacjdIaHhkZGFs?=
 =?utf-8?B?bFFzNFJVVTRIenhibDUrRFJvVENiMXhGSHJLR2JleWNTZXo1eU14dXRpczEr?=
 =?utf-8?B?THFUWjRlTXYxUjVWd1VzaEpydG53dzF3L2dJSWp5YkhGdVY2M2liS245UHgw?=
 =?utf-8?B?dllkUDFqVStLdzlLWnBPa29vOVE2SDF5c1lObXozNXpVaFVxOENucmVLR3Aw?=
 =?utf-8?B?YXEwNE9vYlBTQjM2VlRpNnVMWldsMVdHby9pL00wMkZsbFpzNi9XOThFQnVR?=
 =?utf-8?B?U0pZRE1GVktkUzdHQ3VrZE5QWUxjMUMvUE5qaVdEVEtVQ2d6YVVRTkhaMExN?=
 =?utf-8?B?OEJDS2ZjY2Voc01sMTlLOXNxaTlzUzNaRFJwV1NQbWVja21nS3ZuRGtxWFhH?=
 =?utf-8?B?VkZDaGFyaGR3TWJ5YWs4bFprYUh5eVRxa0Z2RHBSZFVTSitGdXVLT21UMU9M?=
 =?utf-8?B?eXc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: bb069b54-9508-42b9-fc18-08dc7c0349d2
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6589.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2024 15:07:54.6269
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sntRImk25zXf3vMv3sTS78RLlbB7sA4Ju0icFrVxHTEagOnVwMBpn/ln4eGnO/V6xn7dDw0mCHZ488uWOaAyRW+zrspPCD48bBrWGl63En0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8557

Hi Konstantin,

On 5/24/24 4:49 PM, Konstantin Ryabitsev wrote:
> On Fri, May 24, 2024 at 10:28:59AM GMT, Konstantin Ryabitsev wrote:
>> One way I can think of to address your problem is to allow a + to
>> indicate that a prefix should be added to any existing ones (if not
>> already present). This would allow one to run:
>>
>>    b4 prep --set-prefixes +foo
>>
>> and also specify in .b4-config:
>>
>>    [b4]
>>      send-prefixes = +foo
>>
>> It's kinda hackish, but effective.
> 
> I take it back -- thinking about it with some more coffee in, this would
> break things badly for people with old versions of b4. I think a better plan
> is to:
> 

Exactly, one would have '+' added with old versions of b4, not great.

> 1. introduce an --add-prefixes switch that specifically adds to prefixes

Yup, that was something that went through my mind too.

If we want to add a b4 prep --add-prefixes or edit a current b4 series 
add-prefixes, we need a way to be able to remove those I assume... One 
way is to manually edit the `b4-submit-tracking` part by hand with git 
rebase but I think there's a reason b4 prep --edit-cover doesn't give 
you this part of it :)

--remove-add-prefixes X Y Z? --reset-add-prefixes?

Or maybe we care about this once someone complains about it?

> 2. if there are prefixes defined in b4.send-prefixes, we *always* insert them
>     if not already present

Considering the option in b4 prep has a different name than the one in 
b4-config, that could be not TOO confusing, so that's an option. 
Though... inconsistent behavior between versions of b4 again :/ So need 
to document different workflows for different versions of b4, not sure 
it's a good idea.

> 3. switch prefix management to always be in the subject line of the cover
>     letter, as opposed to being stored in the tracking json
> 

That's an option but then it'd appear in git log. Additionally, I'm not 
entirely sure everyone wants to blindly have all strings matching '[.*]' 
in the subject line be applied to all other patches in the series?

I would go for 1., probably because I thought of it as well and that 3. 
may add a lot of corner cases and I'm not sure how to handle them?

BTW, I also had a "surprising" issu when the cover letter title is the 
same as a patch and I added a git fixup, a git rebase --autosquash would 
try to fixup the cover letter rather than the commit, which makes sense, 
but was not expecting a git conflict at that time :) So if we go for 3. 
maybe that's also a way to add some logic there for that, if that is a 
"problem" worth fixing.

Cheers,
Quentin
