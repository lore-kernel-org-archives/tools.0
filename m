Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F1C158A28
	for <tools@linux.kernel.org>; Tue, 18 Jun 2024 09:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=10.30.226.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718703873; cv=fail; b=H9ZLGnXvV7mRt14aNenlneHzhOBY4OsxmaxfsWZ+xkqYLUJOjYSbjLlPUKverJ1ipJjKFLUWcywF7TRFQ7JXwq363txctVKoEV7JiEUPLgyZeifD+IvnMNBSmFIhnTeuuOY+wndBwY/jYVQ3SPM3v9tMcSmi5XJF+tTUMSGmx+0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718703873; c=relaxed/simple;
	bh=PTMZqcQADd5sNIkhpJ75ECv45rlb0j2tnOhwUyAQWa4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=sYIqHjOqdVO0vPT1PMlaVLLIIKLkwp5w6e48VgFgLdmF8qZ66nz8kv9MX/8JZ6Ns57rzEkjaWLjNPVXiqzPKtoKpWql8+EejkrDdO2cYoU23ABqNTBuliXH1MO1VILqP5quinbe0cjQphFF6JPHMHdpXPXiODjJND1aKzgGDlAE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=UTesCgWP; arc=fail smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="UTesCgWP"
Received: by smtp.kernel.org (Postfix)
	id 16827C3277B; Tue, 18 Jun 2024 09:44:33 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-he1eur01on2111.outbound.protection.outlook.com [40.107.13.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BC71CC4AF1A
	for <tools@kernel.org>; Tue, 18 Jun 2024 09:44:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BC71CC4AF1A
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=cherry.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vujy5JMjBw5tbsTzTssgqBYS5/outf9q3Ulak0oN6YGditL4oU/0SeEm6xPq91zRXOSrySchrQ/WvKJPvBBTDtkP9qR2SnFYDkb2L7HPnbm1yCSqRa9HsFHiLEv2W3yuS/0sW5PawP9AoR8mdvyWNa7PWuDp0VBJkljJsSYG3i2hC/V2T2t4P4VnzwuLrmOvJPU7MOuDvrQ4ALHTVYVLrC1gMLpv8spLGcEfL/qz9mr4t/Akcmu8Mw+UPtpGDnfNo02WXdwJX+frbv/GPccqlwqqTOJLSrS0Sy5FBZtbWKV2/Xhd/NYg986zUGlB0Hwf0pOzoqbuA4Z2z5GQUduSnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O4f+9OlBcF//QqGJcGGiiHuUgn/HItlOM4/GPZPoVEg=;
 b=QUlbyU+QkNREbuH5j1JqrNhJOo4peZaH/yc/X4+5LGNKT1juVsaPAedM/2NpdUYY0QpVR1HFbVp+khKnt6A5JxVvMPnD+AFrmIAN6UFuTVy2+b98RlQ6mFNoe+jfspvaO6qupVX2mS+TKEmoJSTdWKtI8thh/ImHCuWv3XLfCXO7xitg9c5llcVmGwW4ypo3DjVimc7u1aMuShvix5Z6uh+Jo8Wh8i35k5L9SzAi+y/10PDcvRdj7dfSolw4Oykzo+GCOtxJpbGvZCUQKvKT04Ue7X6MCeiMVUWtzqf2pZ/qEE4NJmWBRqq/8fnOWLBqhvA+2DiiH/f+5VT6Uar7kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O4f+9OlBcF//QqGJcGGiiHuUgn/HItlOM4/GPZPoVEg=;
 b=UTesCgWPASYOK7Z6J85ql8wSY0lVH5eelJ0DVEAx4uBYP18w9VoHAqTOc+YIFb0vIhfKapKMuKwGq5kt9HZO7aZs+irw3+0+uelprejaKe8oOEJYKLlMUjqF6yeDCg8BOpg7cy6zqf1BUBQQnpUz2Sit2wz68FstzRdnF5U/Lro=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA4PR04MB7982.eurprd04.prod.outlook.com (2603:10a6:102:c4::9)
 by AS8PR04MB7991.eurprd04.prod.outlook.com (2603:10a6:20b:289::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Tue, 18 Jun
 2024 09:44:25 +0000
Received: from PA4PR04MB7982.eurprd04.prod.outlook.com
 ([fe80::3c4:afd5:49ac:77af]) by PA4PR04MB7982.eurprd04.prod.outlook.com
 ([fe80::3c4:afd5:49ac:77af%4]) with mapi id 15.20.7677.030; Tue, 18 Jun 2024
 09:44:25 +0000
Message-ID: <9226fa72-4a47-4618-b592-980957ba9934@cherry.de>
Date: Tue, 18 Jun 2024 11:44:22 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [b4] COVER not excluded from prefixes
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "Kernel.org Tools" <tools@kernel.org>
References: <577465b9-afa7-4663-8382-606c3aa64159@cherry.de>
 <20240617-imaginary-deer-of-excellence-1e5e26@lemur>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20240617-imaginary-deer-of-excellence-1e5e26@lemur>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA0P291CA0019.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::21) To PA4PR04MB7982.eurprd04.prod.outlook.com
 (2603:10a6:102:c4::9)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7982:EE_|AS8PR04MB7991:EE_
X-MS-Office365-Filtering-Correlation-Id: ebde93dc-d57c-4b58-6c39-08dc8f7b3d2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|1800799021|376011|366013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RzNxa2Y1ZTZjVlp1VGdud1ZBYkp5UEh1ZWRNa3A0S1ZFM29hVFBreGdpd0kz?=
 =?utf-8?B?VlhwMEdxdTJLWGdaYkdHNm81ekliVnRYQUlZeVRSZ3J3SkdzN1NNN3dWUm1J?=
 =?utf-8?B?WXJtWk5BYWxFQkJyM0lnbi8xU09qYkpUeTdidy9wRjdhQmxYUkNlNzhFdk5S?=
 =?utf-8?B?MTdTOE5PS05JcFVnLzFwd0VBbXFSN3RsclpCZ0tnNEkvNXVXcjlHVStWeDk3?=
 =?utf-8?B?OUsxSWJCMXBaNXNZc1IyOWFyQ2JLMFhTVFZIdjU1bTB5cG9kSGJjUGJZUDhj?=
 =?utf-8?B?NzFCS3doOFFwMWJ1VmFnY1JwQ0ZpQU8vaGZVQ2FqS1IyK1JYK2Z0QXZyRjRj?=
 =?utf-8?B?TmVCeS9EaHhiSWVtN1BzV0RGUHNDc1NLSWgycjV1YTMwdE54ZU1yYTdJTW04?=
 =?utf-8?B?ZUxuWDBVSnNuSGFCNHlNVm1vcll5b01ZSFUwbGdvaldpeHVUclNmN1lYZWJC?=
 =?utf-8?B?NlQrYkxWTzB2YTZhcTdJSjJsYXNJNDQ1U25zcGV5UHh4OWpOdmpkREhYRWY1?=
 =?utf-8?B?bmxmTmJNdmtJVE9Sb2JyampaYzhIVEEzeVUvWTJXZElzLzRUN3lQdWJHV29L?=
 =?utf-8?B?V0lYZzgrcU9lcitBMlNvWGFTZHh4R2ViSTFWZ1pEL0RkbUJlbHNtNFd2MjU2?=
 =?utf-8?B?NTV6bWVHamgxa1piMnNVOFFXMDllTmJGNHFBSlRlaTVCSTJrUlhKQVBRMjBx?=
 =?utf-8?B?K2xSYUFGaVd5YzFUT0NqNlI4WU1vOWJ6TDViSXhlNWRUbnQvRWVEeXAwZnhy?=
 =?utf-8?B?VEJnWGpIczNzNEFyOGZWVUozWXdTSXc2ZHhYNkx3N0M0WHZBdnVsekVpREdK?=
 =?utf-8?B?YnZ5SGNIakxEOXlkUGFzZXhGcnF6Ly9ZTmdWS3Z6ZHdxWlZ6dCtEaW5nelRx?=
 =?utf-8?B?Z1poc3laV0VHcDNSdGNIMm1hK0ZRYWhGL05pS2ZEMEwvdTNRNHdsNG5wRlhw?=
 =?utf-8?B?WjBlcS9xMHBudWl2VkJSTDQ3MEtGL1dNQ3NYdHl6OHdHYk5iNmNUZGlacVNt?=
 =?utf-8?B?VUdkVEpFSzJGZEJ4eE5NNDJFQVZFVy9GdW9iT2RqMEdDS2JTdkQxMDZMS0RV?=
 =?utf-8?B?UUZTdU9xdGp4RDNBSnlxNkxCd1loZ3lRYWMwa2doSTlkRkVzczJuVFF3ZHVu?=
 =?utf-8?B?SlV6bHl3S1FLR05TcU9DVzlkdFpRcFk5U3BteW9jNlErUnhVaEFwMHN1Ky9X?=
 =?utf-8?B?L2ZJd29xVXByMThXNjFYMXVPQUFFTDFNZytDYnBBbWxSaGk2emlLWWxLcW5S?=
 =?utf-8?B?eUVyV1R1cUVkaTFxd2U5Tit3aHJ4MFcvTGZMQ1pNUzR1YnRWMGdKb01OSXlF?=
 =?utf-8?B?N1dwdk9CSUpNZ3BTd29wdkNQam9Rc05uVmM1L0xBVVBhdzVWSW5Za2x0YlB3?=
 =?utf-8?B?MjI0bkVmWmE3WE05cFF2ZExad2djOE5Ha0Q0WGZla01YUmQyb3VjMUlrVGVr?=
 =?utf-8?B?LzByUlhHR3RiS1d5L1hCdE5KWTFSNnJoQVBINE5kMWZTVmNVOU4zTkJocUpO?=
 =?utf-8?B?TnZqVTZ1NDhLcU9VNWVWN1B5QmJXZm5zUk16bWNWK3NwUnpJK1JweHB3TFRO?=
 =?utf-8?B?eW9DQnZnWEVFajEwOG9iYUtES0RYMWM4YjE3TERvSC9TOVNqQndqZHVzQ2Fx?=
 =?utf-8?B?eFIzbml0SVdmMGZSS1h6T3pwTjJYS1YrbnBvWDg3czU2Mm96NU53T3V2OWx0?=
 =?utf-8?B?SjEvMDgwWkc4aFBnYkczU1VMY25wYlJOTEo3czUrVUVmYllLdFJFK0FJbjdT?=
 =?utf-8?Q?W1WjboxEQdtdM9t9nmFXW6dmZOOIaQRHxtbgTK+?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7982.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(1800799021)(376011)(366013);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bno5bldqZUpKTGhFVnJiUFVEbG01djl5OGpzOHFpdDVTd3N3dXByMGs2Q0NC?=
 =?utf-8?B?c1N1QmV1b2VyOThUQVZIMkk4dml0Q0l4UlB5R2xTYW9XWXZFaVJWTVpXNFdK?=
 =?utf-8?B?bnRzNmhZdVlkY0hwMEpiMm5vVnRjUFl2REZoT3lrQ29NU29uN3h1S3FhVzB2?=
 =?utf-8?B?eURQRTdrbUJGNlgzSWlLUDlYVzhuU01TZlk1ZlVSVUhIN3UxbThEb2hZcHp2?=
 =?utf-8?B?K2NjVXpaMGhXS01BR0Z0b2ROaEhwZnFDcEUwTzhUS2tsVzdjekpNcFZhMGN0?=
 =?utf-8?B?MGp2YzRiVUg0QWNId1JkNmNrTU1tMVJrYndlQzZjZTNMT2xpWFV6MDBJMkhP?=
 =?utf-8?B?Z2lEWUdFNnJXWjZRRkRiNG1qRzBsWE40M0RFZm94TEVXaFpBdUZCajJNTXQ1?=
 =?utf-8?B?ejc4TkNGUVk2VFBXL29Rak1OSkdpSm05dmxKaUVCM0tPejVXU1hKZElqaU9y?=
 =?utf-8?B?UTdyejQyazNIUG5ZdHBlSDM0bDkwdkprZWZtTUMxK2VvVDhnVDhvOU9rbjdw?=
 =?utf-8?B?T01MQ2ZCejVSNWhjWlhCM004a3c0MUxrZkZhUU95ODA1VnRlTVpad1M0K3Iz?=
 =?utf-8?B?ZGZUcmJSSG9yWi9JRXg3a2RCRXBLeXBCbXVyWVMvbTBoZXRvbW9LYlJtQVBa?=
 =?utf-8?B?Ly9wTDhsalJWR3JOM3c5aVNsZTBTeVhDWTlVMjdWemhiTU5Ha0grTUYwQWp0?=
 =?utf-8?B?UVlicXNVYlIwMERkSzk2M0ljVUcrM3dOOWthWjd6TmNraHpoc0JhZ01vN1VR?=
 =?utf-8?B?L21NbzhZdTA2Q0g3ZGxCYnZqVHBTazhTTk1UYk9kNFFKYm91ZG1TNU9Zc0Vz?=
 =?utf-8?B?ZXlrSUpJYjJSSXZKY1JSbkNydWZJSVlWMFFjaEdzUEJoTTdxS0k5SXpvR3JE?=
 =?utf-8?B?K3pyUzFnN3I0YlI0VC8rVm0wdFpLOFIxakhQVXMyb2p1U1NNMEF2N1djcklh?=
 =?utf-8?B?YU1URnR1N1R2b0doTjVKdERwNWhmSjl6TWZ6Q3ZHSkhVTkFvYUNhdzJkK1Jh?=
 =?utf-8?B?NHQ3Rmo3QVVyTlBxaXpmUFA0dWlqUHZqTzI4eEV2N1pNa0xZMlMra3RTdklI?=
 =?utf-8?B?eThrNCtlc3ZJQjFWYTFCUURWVytIR0hZTS8zZSt6TWNWMU95dEE4KzI0UUhH?=
 =?utf-8?B?TU5oMGNqZWhiRHNCQkhOb0hIYmdyUkhkWHNySzdEaGc0KytXb3RCVFpSY3Ay?=
 =?utf-8?B?Y1EvNDhFdkU1VjIrRjB1UzI1a0xXeVNyekFPTGI1WkpPMTJaenJ3aU93bTQx?=
 =?utf-8?B?VE82WFlXTTNLaUViL2pMT29FMTUzWkVTV2l5VTNpSWxWYU94aTVxb0F0anJU?=
 =?utf-8?B?dUtXZ2JQQlhQUWFYaGV4cUJCdFkxdWNYTE8reEtiZFI3NngvazJ0TFZTekhD?=
 =?utf-8?B?cytTdUFBUlhYOG53VG9JZkV5TWs0YUl5ZmZYbGhoUWpYOHA1U05hVlJ1SWJ0?=
 =?utf-8?B?SEVSWDRBWTFmbjhObmlNQlhLSGFxV21DT09pdzlldG13UURTTEJPT0J1OGdn?=
 =?utf-8?B?d3V6czdnYjBDQlRhZFQ5ZVN0SDlnSDFxOXJqVnZjb2orM2hJMCtoWUEzRWxI?=
 =?utf-8?B?YVVzUTE4OXRsTjJiWHJoZkxrU1VkdVRnZEJSN2ZyV0pKREc4Y1BDbXczNnRt?=
 =?utf-8?B?QTcvbEVZQzJSM25GNXVDNS9Rb0JSdVQ2QjB4czRDRWoxeE1hK3BSNERIUndU?=
 =?utf-8?B?ZzVMSEtFQlpFMkFvWGl0UmZJTVJYSUxoeFBsbEtiek1XVVNFMFg3S2JnMXRV?=
 =?utf-8?B?VUxLT0FsWjVUMjVrQ0RtclhsaFVYQ0VNMGJSODBtNzJScXc4bWNOVmhCVHI2?=
 =?utf-8?B?L2pHcCtONUoxVzFXOWdhdHd3bnB0QzFEMVF3dWwxZC92Qis5RnBzM0FDVHBn?=
 =?utf-8?B?ZTlsQ0s2WTE1R0RGcnNHRGUwbS9MemxmaEVoem9tNDZuTzZlYW43SzZCTExG?=
 =?utf-8?B?Tm95MzRhamdmNEJ1TnI3UnhNZnExaG9LSko0K2FQRmxuRTA5RmNmM0VQS1FV?=
 =?utf-8?B?dTlaZWZKMk1jVC9mV3hCWWg0UDBGQlZJbk84dUovUnRmZjU2VS9DdmxLR3pM?=
 =?utf-8?B?cmJMZmhRZ3lrZFNFd1NyWlNsZ2VObGdaZWZSaTAwdmhaUzRmcWswZzlhUmRO?=
 =?utf-8?B?c2RxVHN4c2U5RWl1UUxaUjBKb1lINHlPSzg3OHZRWEdjLzdKc1p3eXBjc0ZH?=
 =?utf-8?B?M3c9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: ebde93dc-d57c-4b58-6c39-08dc8f7b3d2a
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7982.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2024 09:44:25.1070
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MnUOrSzYYMTZJeFY1fyvF90GKnRoHiAVHWUmSnx0G3tqzZXbq8Nx7AW7hZC2ELHDcMzIgsv3MbBeurgt1DDVOJsPr96EusNQGSc2Uh5G3n0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7991

Hi Konstantin,

On 6/17/24 9:42 PM, Konstantin Ryabitsev wrote:
> On Mon, Jun 17, 2024 at 03:35:58PM GMT, Quentin Schulz wrote:
>> Hi,
>>
>> 6bf474ec07084f684d8dc96d301875ee7fd73137 introduced the ability to exclude
>> [COVER] from the cover letter from the prefixes to apply to patches in the
>> patch series.
>>
>> However, 6472779acf09656a692a2cd13df12299cb78d489 removed this option.
>> Considering the unit tests were updated as well, I'm wondering if this was
>> done on purpose or if it was a mishap?
> 
> Sorry, it was done on purpose. I wasn't really happy with [COVER], so I bumped
> it out of the current tree until some time in the future. From the discussion
> we had in the past, I've implemented --add-prefixes, which should do most of
> what you're looking for, I think. I may revisit this again in the future,
> though.
> 

No worries, just wanted to know :)

Isn't --add-prefixes for the whole series though?

Excluding [COVER] allows me to put [COVER] in the cover-letter commit 
and it not being propagated to the patches in the series. Why would I 
want to add [COVER] in the cover-letter? Because if you have a 
code-change commit with the same commit title as the cover-letter, a 
git-rebase -i --autosquash would try to fix up the cover-letter commit 
instead of the code-change commit.

Basically:

decaf [COVER] adding this awesome feature #empty
0123e adding this awesome feature
87235 !fixup adding this awesome feature
234ac fix this annoying bug

Then, b4 send ->
[PATCH 0/2] adding this awesome feature
[PATCH 1/2] adding this awesome feature
[PATCH 2/2] fix this annoying bug

Instead, right now I have:
[PATCH COVER 0/2] adding this awesome feature
[PATCH COVER 1/2] adding this awesome feature
[PATCH COVER 2/2] fix this annoying bug

or if I remove [COVER]:

decaf adding this awesome feature #empty
87235 !fixup adding this awesome feature
0123e adding this awesome feature
234ac fix this annoying bug

I just want to make sure we are on the same page (it seemed we at least 
were at some point (6bf474ec07084f684d8dc96d301875ee7fd73137)) and that 
this was desired. If not, I just need to be more careful when doing 
rebases with autosquash, not that painful ;)

Cheers,
Quentin
