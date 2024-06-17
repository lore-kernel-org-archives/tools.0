Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A50619AA58
	for <tools@linux.kernel.org>; Mon, 17 Jun 2024 13:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=10.30.226.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718631367; cv=fail; b=RhwdIREudwpbQSghgEpINcuteBJNtg9IsrWiZb8Bj1fkcm/68DRYo2kD3ueoyPTtqr/jnqNoYyFuZ5xppzXijS83he5dqriQ+o9OplLZg2qTN0yUAnNGTHH4Jxa2pfYWNhnx5r1PsvS5j0HdzlDDmsT8HT0DjL+aRJDABLY90TU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718631367; c=relaxed/simple;
	bh=tk0hpLMleS4jil6JFboXd2sWGUViop2q35Bmbaa00vI=;
	h=Message-ID:Date:To:From:Subject:Content-Type:MIME-Version; b=YDrEEl2vC7JGRxUJoUqK8cKXbpYwmaDqKoTIBcZ7cJtBRNJqf0ESap5/evmwPpQGBCtZUK/2xsstt44/e2yWunSHRHtzymhKzVdUp/8FIuMCq34jdPkMxND/gHrZus7TsBtPcP47uzn5vq/kvmcfCo5iJ2T/kRvu6FEEl7aInpU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=Qg+NThvQ; arc=fail smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="Qg+NThvQ"
Received: by smtp.kernel.org (Postfix)
	id 499FBC4AF49; Mon, 17 Jun 2024 13:36:07 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-db5eur01on2125.outbound.protection.outlook.com [40.107.15.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4608AC2BD10
	for <tools@kernel.org>; Mon, 17 Jun 2024 13:36:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4608AC2BD10
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=cherry.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DFLOgyFpg9fcxhVI8IZFUlSLVDlI7R2vpDAyZB3ENN9YYizV2uufFZYGoTQ70QuN4sxXn52+CUiXGTp5qT3EKIT69v4310TUaOq9Dt77dugaVehE8nHLX0+fv9wZl5nOQV9H85qkDvm3M3e0+Mfw1SUK0iC8sBY17mw1k6YiSa3MHbxM/TLcbsNOF5+xNO8rA4fNclYtGjAMIU+lfyry4I0RXRSoqOkwpbW+AGeiWYImok3s9zfgZCMbaDMtb7e+1NRH83Yd/gL4dGvf5l/nGssqJh/+4Y7xHG/hcZFRKn4TkbiAXLJ7ztXxtVbKWZ4kXJ4/LkHFyFzvSn00dt4v1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UT745IPwIpUuPdUybvppBsUjP0Yrm+5V35HCxmniGnE=;
 b=OmzPKmdpdi8sk9UHz5QgC677ne8xf7/Kc8lgMpzQTFaF5JjrZFIsYFoPOiVHBCPxiVsVre8q6E1uhdYbyAkvABiDFoXfQ2gqXokTAMLMYhEASMjRiqQvNRWk8vrz6g2cfE/c9+oOLlU3qDo3FAJp/qTMpLRmue7wSg2L7miiXCzXNxljPDqqG/4F7zc3vWI6awQBTh9ka18wOzEBEVV72lwKJg5ESud1ZeXelsJgHuxBgW545tg7me8J9BAZ5rLCFQCob6H3egGkRcD8qSu4gXxh7pZ6kRsc4jLAgOQ431e8a0mfQqQHPdlP/LdZqat1nOsyoiWBeHgdtxWSteQ4sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UT745IPwIpUuPdUybvppBsUjP0Yrm+5V35HCxmniGnE=;
 b=Qg+NThvQN7IlBczq+tO7Yxrr2OJrsM2qOi3vdHMl+9Q3ksNXDvy6rA9wdnPkLne4YE8lO/31h2spScJNST/w0X+8/yko+RyBBDEVZgaBNq4DY5hRClw8WK3eBxF/D2NYxZd0PMxTbSs6IWc7GmtqZeETqZ3bImAxVjPTuwCAdJ8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA4PR04MB7982.eurprd04.prod.outlook.com (2603:10a6:102:c4::9)
 by AM0PR04MB7009.eurprd04.prod.outlook.com (2603:10a6:208:19b::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Mon, 17 Jun
 2024 13:36:00 +0000
Received: from PA4PR04MB7982.eurprd04.prod.outlook.com
 ([fe80::3c4:afd5:49ac:77af]) by PA4PR04MB7982.eurprd04.prod.outlook.com
 ([fe80::3c4:afd5:49ac:77af%4]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 13:36:00 +0000
Message-ID: <577465b9-afa7-4663-8382-606c3aa64159@cherry.de>
Date: Mon, 17 Jun 2024 15:35:58 +0200
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "Kernel.org Tools" <tools@kernel.org>
From: Quentin Schulz <quentin.schulz@cherry.de>
Subject: [b4] COVER not excluded from prefixes
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0040.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::24) To PA4PR04MB7982.eurprd04.prod.outlook.com
 (2603:10a6:102:c4::9)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7982:EE_|AM0PR04MB7009:EE_
X-MS-Office365-Filtering-Correlation-Id: 81f1cf52-17c4-4b1d-45f2-08dc8ed26d15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|376011|1800799021;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bnUvOU91anhRWGxnL041VVdtaEp5b2drR29NY1h6L1dIWUdCZzRQUnJtUnJL?=
 =?utf-8?B?V1NMb1U2TGpmemttd2Z4U0gyODU5WW5uMWhveU5LRm9wTmxGNXE0RGEyOXVL?=
 =?utf-8?B?cEk1Z0xFTVBCWHU5TWNHUXhkb3EwQndBaTRyQjhFeCtlcC93aTVRQXI5TmRJ?=
 =?utf-8?B?OW9iWm5FT0JYSGhZZFBHNFNJYVlBRXpVUWduTVI0RUNjUVowZjh3MlRpMTFI?=
 =?utf-8?B?aHdaWXNiZURVczZzcVFDU2xsWXAxVXM3cWVUWDh1MWZIc2EzdVFTbGhwejlP?=
 =?utf-8?B?amc2Z3pCUDk3MGY1YzQrY2NKdWs2QUhlVHMwaElya2NCOTVaWWxlSzNCWU9z?=
 =?utf-8?B?TjFUZ0dNMVJ6cTdXanlnbGJHN01nTHlOeGVzdUtGYk1sRXY2Z2d6MHowbTRE?=
 =?utf-8?B?Z3l4MXRuKzJkQXRGUG1wSlNkU3BPb1M0MzZsL2Y5cGkxVEg2L1pNOFdIZVdu?=
 =?utf-8?B?RDlRdDNwRFFoKzcyMzNIU0NLNHpQQjBINFNEWEpKbGYwanI1SDVFK3BoRHl6?=
 =?utf-8?B?elRwYW1sWUlxVTRROU9aWjYzSW1PRFczdys0OEFiUitGUXhSVUVFS0tYK1FH?=
 =?utf-8?B?ZGdOYk5UbGl4TU43SFlPNzV1UUo4K3hoVHQzSXpqbUFLK1NrRlZnYVZHeWt5?=
 =?utf-8?B?ZHhpd1hCcFBVbEhaWnNrRkZUZlRZbUpiMHFaVUlPR2RNRmlId1JkemkxL3ky?=
 =?utf-8?B?ZVdRdXptQXMzNy82VkRZb04zMnBCSjhjSlVYN29oY3duZ2xyVjdHWnZtcXBM?=
 =?utf-8?B?VXFZV29odHNZQ0prV1c3YWsvKysxQW42MHd5MVRHbElmckJBZ04zb0tYTHkv?=
 =?utf-8?B?TmFHZlZaOE4xUFdSQXhTbFpFSjQ0Q0EyS05LVit4MEpQV0ZYNW5Zdk1RMGlI?=
 =?utf-8?B?Q2dzYTJGWlVZa1JHWGQxZWZRTjk2RlhUMTUvVmlJb1AzbTkxcGN5SXY5WHNn?=
 =?utf-8?B?eEx0K051bDlVanJyRGpaTVh1djFMMUU3MVQ1OThONUVjS1BlV2RHMVJIUGV0?=
 =?utf-8?B?YzNzVEErRk83YVdqbVNIZlczV2JYdnNVZXFta0RMY2NSL0oyTXEwK0VJN2I5?=
 =?utf-8?B?K25mU2NtUmhCVHJjRzd4bzZVM0Q1UDk5eGVaQkkzdVY1bEVDQ1hzRmVtTzE3?=
 =?utf-8?B?ZDlYWHl3NkIvN0lFYmQ2dFEwY3FyOTROR0lBb3ArV1hhVDdvMUdkR051YlBY?=
 =?utf-8?B?S1RmaFJRaUZiRm5aMitIZlZFVUlDYzFjZVBNQlB6cUd5ZDlDaFhreS90WnpB?=
 =?utf-8?B?QVFuSEplTmFoSDRQSkpKY1I1SEg1MFRRUjRmYTk3M0psUTVlY1BBMHUxTGRk?=
 =?utf-8?B?OWp5K2xyeWFLdWtaSTl5ejRMeHk0NklLeXN1LzU1N2IrQlU5ZHlZMktVZC9w?=
 =?utf-8?B?WlhTSW1wMjl0YkRFaDlLRW9XWlZ3U2E3NUhhYTU5UHFEc2xBTEdSemF0ZTBr?=
 =?utf-8?B?Y2NxZHB3TkIrblk3YitLakM2V21sc1haMmNzMWtycmo0eXpseG9KUjhRZnRF?=
 =?utf-8?B?TUJEVVo2WWFtRFZZelErVzY4UlR4RW9CdkZaUkdkaU55Qm1wNHExRlpFTlVE?=
 =?utf-8?B?NCs1MndCeW9NSWIrN3pwa3MvQ09yeitFQUc1cXVnanBISFZ1cS80UUFHUmhk?=
 =?utf-8?B?Q1hwQXRTTDBxdlNuN1E5QWpLZjJZdm1KbE5rK084eHFwVHMzKzE1eE10MTYr?=
 =?utf-8?B?ZzNUVXd0NkplWkNPaklCdlB5K3VXUzFqUUUraGNhNjk3cWpibVJtbWp5MkpU?=
 =?utf-8?Q?Cg2dBxn6+uWlKW1BnVCRPLBubPtJXSsgs/jPgF1?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7982.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(366013)(376011)(1800799021);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eURYNFJXNi83UGVkOWxBRytNMlNuSTVxUVFXVEdJOXJEN3djbFI4dEJKeURG?=
 =?utf-8?B?V0JOcUtYdE4rcDBqc1Y4TENDZlZLUXlNL0JPOC9aTExiYklsT0ZRYy9PT3pN?=
 =?utf-8?B?S2xWWGtTQ2lHM1QyNFpoNExNa2x2TkN2NXBMV0hNVHVvM2dnQ3dNQ1Vyd1FC?=
 =?utf-8?B?ZWZMMGRQK3VSN3JQSUw4YXJqRXVBVFZaVmF4SjE4VmJxaXJybjY2OFRHN2FH?=
 =?utf-8?B?L0pveHdGR2l5U1RVajU2MmJFT0pkYjFndU42R1pyRmdNYTBUMFJvcUxJOXI3?=
 =?utf-8?B?RUNkR1pJdEFQM25rMlNhbWljeGJIdS9MTStoYldQa1VIMnp6ZUl2c2E1VkpY?=
 =?utf-8?B?eFRQQ0pYZkUxZkwxcm92RE52eTdaY2E3Q2twSjNpVWNNS0dxRW9Ca3FmbGN4?=
 =?utf-8?B?dWorc2hOcTdKTjc4QWU4ei9DTmpmcXVQaW5jYXhVZ212dDBoUWhrYzVpQjZF?=
 =?utf-8?B?S1VQOHIvT0ZEbmU4eDJiS0RxWFd6UFhpVlcvTkpZd2o4ZXY1TTA5MW55bC95?=
 =?utf-8?B?NkVFZU1BL2hqRUtwZnhyU29ueVhTNjlEMjF5a1h4TnREZ2tlT3VpWmlETnd2?=
 =?utf-8?B?cDJzUCtlZ25Db3FiY0picStmZUJDOWNEdXZCMnVIS04rNWFBRzc2UWdYR3ZG?=
 =?utf-8?B?emx0b21EQUdLU25CajdRdGJwSnJyTmdoWjJrcGphTDdHZnF6SDhocy9NSU5i?=
 =?utf-8?B?cXVzcklGRWdYZ2tCaGhpYXpveXN1ckVDV252NlVYMWpRWVpOSlIweWdMMktm?=
 =?utf-8?B?NFZZY2F2ekFTSFdTTnpaWVpjMkdXMzZXbDg4UVJZZzFFbUFZZUpIbklZTjVs?=
 =?utf-8?B?RTNxWnBCdjcwWjQrdmRBd0pXZExDU3pqVitDMXlHVGgwWVZteVVFMFNobzIy?=
 =?utf-8?B?dmREUFNVQS9OLzZYSitzaWduaWtxc1VvVEVPZVJTN2dLUXB0YloybjlQUnBD?=
 =?utf-8?B?VmhlSjlEbGpKdEc1UkZNYnJZL3hBdUZtT3FpQWFBZVVkYXdYVStUZnZkRWVN?=
 =?utf-8?B?L3hxSTNjd09nLzE4bVdoTCtObzZ4RStBMG8wVERYMWJkMFMwREtuREtsVk5Z?=
 =?utf-8?B?cUZKK2N3bWx6TmdRdGVrSWN1dlRqSDVPMHYxaXh5MDFaU1RMdWFVV2tqSkhj?=
 =?utf-8?B?MU8yZFo5OWxOejZCK0xrRldydFR0bnZzYUQ0SU9lRCtsYmNEVkxudWpNRHBT?=
 =?utf-8?B?dGFGaUV2TWxQc0VyckhKWi9sRndVaFVWOC9wK1cyRWRkSTlwVnNMVnJRMFBj?=
 =?utf-8?B?ZjgwbUxoY0hYdExjUkRSb2ErWk9CQkJ2RVl0T3dmRFZrUWs3RHMxY2N4R2Zx?=
 =?utf-8?B?TGgwQUVoV0xBaFJQWlFHMHZ5WFhSWm5GN3hJRVg2S2tST3lUb1ZtWVM1VjBr?=
 =?utf-8?B?Y29NVW5lRDB0ZkVTTEFxVnBTVzRTelFsMFUrTERaWEw5U2FWdVhuekJFMzMy?=
 =?utf-8?B?Q09tMHV4TzRTWGE1dWViS3pPOUtXSUhPRGpMeW9zdWYxTkJ3TzAxbmIxMmFQ?=
 =?utf-8?B?dE5XL2M5SnEyd2U3Nko2Y2pYRTVOUmh6TDNxKzR0cjFLL2VFVXBsQWJqUzh0?=
 =?utf-8?B?aG1DTkFxRHFXWW40VThZM0owR3h6L1haWldlTEdYcUMrRDdIREtaTng1bDJa?=
 =?utf-8?B?L2hQSjlLb3p2SGozMWJuYkZ5V1V0VENXbEcrSWM0V2d1Mml0NzdXa0dRL29U?=
 =?utf-8?B?cmpKWVdyQTM1RnRTSEJaN1NmRHRDODg5Y2hEMnpmZjFIaWNVV2lzb1p3c1A2?=
 =?utf-8?B?VklvNVUwalZWT1ZxZHpuUHlIMVppNDVvcTN3VG1lUk5EV1VCbnR3Wm85cDIy?=
 =?utf-8?B?WkVWSitHNnVxbUVlbVdXcHNoYmRwd1FIYUV0TnVSdVhROWh1d2FYSjJIZXZl?=
 =?utf-8?B?bVViZ0hkSDZCQjRFYjV6cnp5dTZEM2VlTG15QjR0L3RXQUMwZHdoSFFET1Q3?=
 =?utf-8?B?QmJKYVdFUTdZbHMrcFlMdEhIWVJGTFdoYk01a1RJVEUxRjRIYzNhcjNsWGc5?=
 =?utf-8?B?d2R6blB1cXBucDN2SERrMVNES0d0WVJpdWFtcS9LWmxWKytvR01wVjZycDhP?=
 =?utf-8?B?SmpFdWJKVmVTVHdaWTlJa2xCQmpINmczQkg2YTJ3UEZ6R2lQcUdRb09xckFU?=
 =?utf-8?B?NDZUcGs0V0pMd3MzR0t1dXBKbDJVdGRTSFovY3JBYldzeHZkY01sbngvSndI?=
 =?utf-8?B?V0E9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 81f1cf52-17c4-4b1d-45f2-08dc8ed26d15
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7982.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 13:36:00.5770
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zoFF3KD1zER3kWg//B8YKhsFZ00xW4X1KnWryVSIJ4FerCpdtJAOKRsHzGwBRQi56rgMnst248dmnJoiQwr+4oYBOF/6tmP6rzQxFsELQR0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7009

Hi,

6bf474ec07084f684d8dc96d301875ee7fd73137 introduced the ability to 
exclude [COVER] from the cover letter from the prefixes to apply to 
patches in the patch series.

However, 6472779acf09656a692a2cd13df12299cb78d489 removed this option. 
Considering the unit tests were updated as well, I'm wondering if this 
was done on purpose or if it was a mishap?

Cheers,
Quentin
