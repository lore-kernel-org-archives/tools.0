Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71EEB4503E3
	for <tools@linux.kernel.org>; Fri, 28 Aug 2026 12:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=100.103.45.18
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787920970; cv=fail; b=FSSanS6f+SFO6EvKpI3+G7bQXqPGU/vcb2/kvx6wMjGpY4bvlPUNsxM/0aNWu/EH4f2ZRg3UQQqGV5AFfBsBc0eMp9jjJbVNReWJ97c7Blcg5uQ9bFmN58PxZQ7BMGQe9jvk2IyGzbLJhXJOxsc7b/AnsVdj7Nz6dZXQeRny1Sw=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787920970; c=relaxed/simple;
	bh=8XHmHroOX4sa7BxXRPAQQnAs1YufhSFQ05xFFo2Dajc=;
	h=Message-ID:Date:To:From:Cc:Subject:Content-Type:MIME-Version; b=Y8qxSx4Zf8Vm5dXepj2DWV1PpaUE3MO2QW2Ji00vq/a55m/CEz0Kx6y25J+Vk+TaTdqgz+bRj3Hzb/m5d2VyjBWS7HftnHOSWEo1A0fbFOlGQ6kGRWNtPDR3x1anNF92GyOKMMpG/8sGHNW55T6g533evMJcu3JsRT7lSoWn5jY=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=Vjv0LoOp; arc=fail smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="Vjv0LoOp"
Received: by smtp.kernel.org (Postfix)
	id 0D38B1F00A3A; Fri, 28 Aug 2026 12:42:42 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.85
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1787920962;
	b=MNNFG0sUZxfSzFten3F8EgdHdk8ehi5rjMmc+N1eZc5RC9WhbnF0vpp5jWq1NxfvEfJR
	 MR9RNqg2YLxEVt2viC+owprcuCwqxRA2k2zxVPpr7aJOHorb7K+0K977Z0cknT/E0yhrr
	 BUPhltMzZHEaa4MGagx9xAhmRe+Ivk/SaY9vFpRdRMroBTNqdbgMobb2Phu2hd40uC1Cn
	 FJAe0kukMj8ASdHJRR+WiH2CVnfjeo0J5xQ6jXEPqxtLRHLdpLZykPUjcG1SCxF59lxHG
	 bCNXEyl2C8DNjXmOWqams6bdnJb1ygCbGQ4k1SHL+mzwp+NuIsN0ThrAKQl6cX+DdBQ==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1787920962;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Content-Language:To:From:Cc:Subject:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=QJkxGaqt/hi8LQI5rKe8YIoxRgEfeqFXnBJ4H2+nY6g=;
	b=mJefIy3lY/sMVc3+HkmTyiA/HCCV9D8uI7GsK8W1vfnzxkaYVpcBU/s5rol/gK3c4+wU
	 pR+cWcamEtQMV4s88WpgpwI2R6ZI9QYBsDzJ2qyePNWOZ1QGvibnJp15O5ioWHqUAupLK
	 Dqbs1LxkmTOtTP1EneH9V3Ahc3xjaDIoCy5pCSF2aTVT29BElp3x4KXnvaeqZLm+lbyFP
	 U04fcSMcNEIrdWNp4iEuqokNw855wrulvjfavScEOk3NNZdYza50RVLSblW0Ea471kVoK
	 atC2I4oPkV3k34d+LCB4G3nJW4ejbBjo43HB+7BAiZDUbL8brw6vwNac9s3PJdsWWbA==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=virtuozzo.com header.i=@virtuozzo.com header.a=rsa-sha256 header.s=selector2 header.b=Vjv0LoOp;
	dmarc=pass header.from=virtuozzo.com;
	spf=pass smtp.mailfrom=virtuozzo.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.85
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11023085.outbound.protection.outlook.com [40.107.159.85])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D3C901F000E9
	for <tools@kernel.org>; Fri, 28 Aug 2026 12:42:40 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=virtuozzo.com header.i=@virtuozzo.com header.a=rsa-sha256 header.s=selector2 header.b=Vjv0LoOp
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org D3C901F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FUj53RFYHYsz7y+Qhj4zJJ6GL04mm/30RW7dv3RjMnbENFkjtfIMYsoJNNV7tsfQeHzqlk0tj/ES/yXoGrU5TmXpBcKY4rLJP6hxdoOrESwBBnqhNpyBFtERHzDTHglpY13y7Z+V4uhUk6i1+bHBXJXnatFvfjZ6mkCA6fvFppouoxm7+0Y0JSdUr2tLH8eNCsYI44zd1reWJHG9jS15Mv0LRISSkGbcIsXr4eT46jAPn7S2AQNVxQ3xpQ/oYzAE4VXzNWVQ+PXDqNmIb0iKzH1wm92OBcFN4E6L/9/pjRCuG1WcP6/OPPoF4I7dLgoAA61iD/Z2eUkew4ZtyB8UyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QJkxGaqt/hi8LQI5rKe8YIoxRgEfeqFXnBJ4H2+nY6g=;
 b=u1olBrGX3CTvnIx8JFnSp11jmmdzTcKy7HCSkwJMsQ/TnqFgk1Ml6dS/MLYc2y928LXf9zbsQwjD/MGAkBlCNEdYZBxEzp2NORrUXeno2A3fIWSNx19mQCu1PWMloMv+/LVxqP9p1nBMBt6p4Dtd/8mAu0YQoENNmMN7nFMVTRdtYXhSpsYf38KbABjBSUFHhy9BoG0x+19r7nIhaNeac94ehOhNRTiniFIzYsYihBCsV/yiqg1eLesBN3myNnuzqlj+lkeWoj7dQbQVz4TgegY5xXwOsWpsdKspukIDHmUZctJ9w4pGt0Gl2F2SYAZSuSdkWedrgvzF/6B4DPhmuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QJkxGaqt/hi8LQI5rKe8YIoxRgEfeqFXnBJ4H2+nY6g=;
 b=Vjv0LoOpohhBgguvVqsaRCAFNcV//roy4ouMzYhE8JHjgZoclrbI2hvXaXNEx0I9QvwJcI70qGFA0yX7yLzwMmP3ovvm0YhMu/ouWF6eMtfuZGD4aDmTZFmseEmcBWvU8K7ovcxBxyjsMpG6S2PhxUe068E6QnE2vlgonLhpT2Nlnzw5cMq7DroSc5M1EovwXTnEatCExb/fHfbc5IE/Jalj6zfj83f6X6dmjUGYhUOANSszNMF2snLko8UFQm9AmPbkb70cUeojUzbmnrECq8RNKf9+cmrQZgaXM01+H6h6rG3svivOuiRprKAgOK2+LWWk4cp52cVhW484X5HfXQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6942.eurprd08.prod.outlook.com (2603:10a6:102:15d::17)
 by PAXPR08MB6637.eurprd08.prod.outlook.com (2603:10a6:102:153::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.9; Fri, 28 Aug
 2026 12:42:36 +0000
Received: from PAXPR08MB6942.eurprd08.prod.outlook.com
 ([fe80::fe53:d5e4:a1c8:61e6]) by PAXPR08MB6942.eurprd08.prod.outlook.com
 ([fe80::fe53:d5e4:a1c8:61e6%5]) with mapi id 15.21.0382.007; Fri, 28 Aug 2026
 12:42:36 +0000
Message-ID: <f8ed2026-2b7b-4001-a591-0a0914b94796@virtuozzo.com>
Date: Fri, 28 Aug 2026 14:42:35 +0200
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: tools@kernel.org
From: Vasileios Almpanis <vasileios.almpanis@virtuozzo.com>
Cc: konstantin@linuxfoundation.org
Subject: [RFC] b4 review: an "inbox" view for series addressed to me
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0268.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::12) To PAXPR08MB6942.eurprd08.prod.outlook.com
 (2603:10a6:102:15d::17)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR08MB6942:EE_|PAXPR08MB6637:EE_
X-MS-Office365-Filtering-Correlation-Id: c1623c7e-89b9-4a3d-95b7-08df0501d69b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	oi4PyzlJDEVGNzFAAXtia9pchxAzRTPc6Arp6LOtENFNbagxOmVyGe28sqKouwxrLxNXBWOFbMXARPEpQxI8JnFTDNmQL3zrWfAuenWjoBGJ3Tk26w+1QCNK3QbVlYrkdaRZgI4+e0H9fgCJPkf0/re29dD3HbMXi8ha0zgDppfETMZbA7YZnwZuLTKda3DPGJzN3zvwLSARPctClZ25uSQ/dJOVuOupQesCnPOI8862ksreWsCnVdJ9b1pqdEdKr6CB6lq6AAxYBrkYK11bFY8JflzNJWyMmZvGZvCVxsteW1kEPYsUOqRcIi5KI6kURdjQAcMlMCx32dVFFry4uPvyQ/RzA4vh81XIAZVAT84DpITwbtb0VUqeMerZauBGRBmLVzA/V2k4k8UwAsTPAeKKcTPP7rRTmYB1wVcMhR/WSdY/738urrRzsLYGBoNS21hk+prlU80k9j1uJJ72zvQhX97d80TxBuQLzArm8x95VvDIxQnLogB3GQIr0mTierbmsvWXVWxfkbTLMWdnrBgWmQLLXj6tjDFU15Toiav0juB1LRJwfxU/h3KxOERYFx2j0uOmRaPcFejSIX/blq8Ihq11dGWNSZDYKg5s199QnZXYvWmrLe//CN630opbF/155UyJAOJtt4apUxxwqGMkTSTjXeSKqgHv0sowadI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6942.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T3ZtVFBVZUt5b3NnMENURHd0TXpwbHIvZDczWk9TT2NlZVcrL0NVeFp5RFo2?=
 =?utf-8?B?bmNqREtaSWtWNE9FeURYOUN6enF5aDIyQ2dObU5BZ01laW9OWVJMWlg0eTNy?=
 =?utf-8?B?TmdyWFVSZHhIaVlraFM1V2FUcElSYklyWDFDZ3ZBbmgveDR6eHl3YWVuRHlk?=
 =?utf-8?B?Tm01N3NEVjVjTWsyRWJlYUovaWJHSis3Z2FVQTdkdkxUbHc2NDFvMFRqaDE5?=
 =?utf-8?B?anNsQ1BSblVRRDJ4bzhUMjVXais0M0ZFQ3VFS0U5MGE4NzkrY2I1MHhsTTAv?=
 =?utf-8?B?cGNHYkRSdTl3QVJHdnFGd0c0dUg4OTU1UVZkTzIwbnVKZnpPdHkzQmFNWTd3?=
 =?utf-8?B?V1lOdVhZdG1qTkprcGlidjhNeWR5d2ViUnZDV2VpZG01cUFsbkZrVFVMVjhS?=
 =?utf-8?B?V2N5cm16MkpKY2VmTHR2MS9WaWNadS9mcVNPSm9LU3A5b2xWZXRJaE1JRC9J?=
 =?utf-8?B?S3lWSi83TTFPMHUrSEhBVWlmT0VQSkU3eUNjbFlIcnJuMVIwN3ZRNWUwS1FR?=
 =?utf-8?B?T2djL0F4RDJFRUZ0VFFCKzhjTkRDUWg0TzdJM1pmYy9FcFJJU1lsRTBQQ1ky?=
 =?utf-8?B?VmNYT3RFVnEzNk0yTEc1d3RDZ04xZlp3b2pMYnh2aUtsYjVnUDJaM1JnZ0NN?=
 =?utf-8?B?TDdUbVRiVFphUitha2lhOEEzTkxMZk4rL0dQeDhQUWR1bzZSem5VMWk2eXNS?=
 =?utf-8?B?Z1VRb1FLK01lRzhNbjB3TGl3RmduaDRXbnRUK0RGQmhJRTBvNEYrS3hBUWFo?=
 =?utf-8?B?em9OcmI5Mmd5YmlNWktnWXUzd1hCdlRiTTFTQjVnZVF6cDRRckVNdmwrOFdF?=
 =?utf-8?B?ME1qVTVpRWE1VE42NThVOXIyQ0lnamhxSjRhNnppWlVrNFhkelpXMjQyakRw?=
 =?utf-8?B?QmU1a2xUM0FrbHFpL01jdC9LOVphUUR1MERrdU55NFgvSzZ3eUpCbjhRdHRk?=
 =?utf-8?B?dFVkZ3I3VEIrdFJ6NHBqc0Foc3huZ1RFZFNpT0VEeTBLV3hzTEp0R0pUTURK?=
 =?utf-8?B?cXFIYWtaeEhoZ1N5WjgxY2FwdDI4cG9rWTZaenF2V0lnaTd3Q09jK1VaVnFu?=
 =?utf-8?B?bW4zYnVrMlhNalJPaldnSGRtVUN4ZXo2M0xRUkdyYmM4anBQOThzbERMR1gr?=
 =?utf-8?B?TXlHd0RpUER0TURLTjdNUjBuU2RPTjFWaTFnSzUyaSsyQWNTL2RJNjcyZjdl?=
 =?utf-8?B?K0JxcUVkemJLb2VuMEdaVGRHZmxnQTlSZFM3MzJFWlIremVGUU1tZ3NxTGZ1?=
 =?utf-8?B?eXhFWUkxWTVHdC9lWjRtUVZBdVZtTXBhcWxRa3J4VHNHREhreS9hNHIxTndu?=
 =?utf-8?B?UU52WERtL2N3aG0xN3I3OUNyVFNkMmx1K01WaHB2V09HbWRFZ2J6Q1Q2M0hB?=
 =?utf-8?B?QnRsVzNvV2d6dFBQVjRDUEdpN20rVS9uNmlHNnpSVWhrYUViblFQejZ2WGhy?=
 =?utf-8?B?VjcxY3BJWlBLaGZ2bXlmMUtVbjFkd1FTUlEyQjV5M3FJYUlPTVI4RHlrdStC?=
 =?utf-8?B?VjdBaGc2NWY2QzF5ZmUzaDNGUlR3cGMrV1JuM1Y2UEVIdHRFVjBoK2dWazhI?=
 =?utf-8?B?WVlsNzQ1OGRwSlRvSWg3Q3JVRFhOYXJLTVE2bGRYOEN3NWV5Vk41Ym1FY3VJ?=
 =?utf-8?B?TTJZcWs5NzJiQzZwZW14U3ArcnZSbDh0Znd4bzBFNXMrZHIxWkFpNkhESERO?=
 =?utf-8?B?RDMzVWhnVXJGQTNQUTFXL2trcmFWWWtmWEdrWlVNaDVUVU9xQzBzUFN0bkp6?=
 =?utf-8?B?cHRabFJMaEw3Y2F2OFVKK2EwM2orNC9aMXd3a0ZiOHMySUt3bHNpcjVCZFNj?=
 =?utf-8?B?eWRFczROaW5VQkhXUThjcTMxbGNhMCtQL1N1MFZEejhhcUQ1dW96RVhQTlNG?=
 =?utf-8?B?STFtM1pyN2FHY2E3RUdiTVpjTU94UEVxMTJ6a0lJRTFpc0JPNmRrRFNWczF6?=
 =?utf-8?B?anY5RS9JRzBzT1pmNDUyWEtOK1JCTW5XdmduRmQvekY4dEswU1doWXBuRkQ4?=
 =?utf-8?B?NlowNzdQTjdoRnpmRXhoU0JVMEJ6MUhCLzVVQk9kbkUyTDdIczVuTVg4TTU3?=
 =?utf-8?B?UzEzYkx5b3BiY1NGaUtoTTRZOWdMOVdBY2NvMTc3eCtmRi83MENuZTN5K3gz?=
 =?utf-8?B?SS8rbHp0Ynd1WlBQTWpGYXpUQVVhUzhLYnJHMmxlTTFrblFOSldvNVhrRHY3?=
 =?utf-8?B?eUdnbVBtbUxhOStzbXJ0U2ZBZTBxQzE5cFM0VzlyWXJCSEQzZjYwSXZkR1U4?=
 =?utf-8?B?cWsxL0UwWExUQmVpZjlQU2h0ZUp2VHUxS1VpUTFnYTV3dmpyaENmbzZKUkdL?=
 =?utf-8?B?UHhqekV6eFFJd3ZlWnVqdTIwZWdmQ0MweTVCaUpvT2h2NnNnbGt1bnJvYkxJ?=
 =?utf-8?Q?0r504Rq5l9pfThDk=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1623c7e-89b9-4a3d-95b7-08df0501d69b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6942.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 12:42:36.4984
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bZDYVXCtiRPITcdtSs80rsVPTRF58A7SFc+KXd8B5rLHUTOhBKnsKIVK0v0NLAaWgtV3Ht88X37flhW9Db166DCBl4lmzapGCkuo40w1mOXTunnxofbViqeffA1o1MZn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6637

Hi all,

I would like to propose (and implement) a discovery feature for b4 review
and would appreciate feedback on scope and design before I write any code.

Problem
---

b4 review tui only shows series that were explicitly added using b4 review
track. Finding what I'm expected to look at is still done manually. Open my
client, check my messages, find the message-id, run b4 review track 
message-id.
For someone CC'd as a reviewer/maintainer on a handful of areas, an inbox of
series that were addressed to me and that I haven't dealt with yet would 
remove
the above tedious work.

Proposal
---

A new b4 review command (b4 review inbox) and a keybinding in b4 review 
tui that:

1. Queries public inbox for recent series roots addressed to me:
    tc:<my-addr> AND NOT s:Re: AND dt:<lookback>.. filtered client-side 
to cover
    letters / patch 1. The set of "my" addresses would be configurable
    (b4.review-inbox-days, b4.review-inbox-addrs, falling back to 
user.email).

2. Annotates each series with best-effort state:
    - "replied": a Reviewed-by/Acked-by/Tested-by or any reply from me
      exists in the thread;
    - "in tree": patch-ids found in a configured upstream ref.
    - patchwork state, when the project has a PW instance configured.

3. Offers actions: track, open thread, refresh.

Open questions
---

- Is tc: the right signal for "I'm a reviewer", or should it also
   consult MAINTAINERS / get_maintainer.pl?
- Is there prior work on something like this or similar that I should
   align with?

Happy to adjust or drop any of this based on feedback.

-- 
Best regards, Vasileios Almpanis
Software Developer, Virtuozzo.

