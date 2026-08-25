Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F882212FAD
	for <tools@linux.kernel.org>; Tue, 25 Aug 2026 18:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=100.103.45.18
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787682945; cv=fail; b=WZabKv6RloRlijlIpfrWOGsTgfJF/2BGftr58d8gVqFSK9btohc9AlnkHmTss5DSvcutlegti3pWxcJAi4ISXXM1ZDqO5iNa33I44+/VBLgaDmKN79EwyfezsQwj1LZ+jIcK0/bV+KEVSUNQ/W7daBMB85BQ97ThN+3di9xMDEw=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787682945; c=relaxed/simple;
	bh=qdBgkcrPEu1RE9mFVU2i46hwdXtUWPlTWETvZQ8pKz0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CFlc1akW5Nx/3fvYoK0ABynrrG95/d7NaEGoi6Ug0BqNrlneByXBtwZUqpbv9UDRzJox3XCntJ40cwsN384CW/Ubn57csDW0kmKFfQBWpkNv/AyBT15fy3+zwAMiCuKnj7o74pf/4DsOoHAXr9xtnBtNLGaBjk/FZTpxIgDG4ic=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ba8+Ty4U; arc=fail smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ba8+Ty4U"
Received: by smtp.kernel.org (Postfix)
	id 2C5861F00A3A; Tue, 25 Aug 2026 18:35:44 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.5
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1787682944;
	b=cOoencRXAM3r5Ap71Yv+VHQ3n71aljsnux7YtVZ6WzeTGbFg48QI6erjHCeLGcL1kmsH
	 5eEAq8t3JA+DnJJe2S9X7nsNoOFmk2IORY4rtyARaGwfwmfnVJemDWyVGzdinsYsLxR8e
	 WI98XJ7qBYX7aF3oHBj4aeLKOWZHcgPHMISIGF+AteARgh0pETYEa2MspKHkIM97AC3nd
	 /DLxzvNvj3LN0X1j5hYP2K9jmyADte76Y0Exhu1TplGVK97vRdndpKygwVOwE9Jv+yaTn
	 ChHnW0o/ika52rPxviQGJdZnczk+rJPPzFn1pCvHn/8GMDWU3CjJScrg9SqtvtL86qA==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1787682944;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Subject:Date:
	 Message-ID:In-Reply-To:References:Content-Type:
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
	bh=rU1vniht27KVd8TNcWfwRgJZnV1jmd44yj2qfEI41c0=;
	b=hOcbYAUWvsOS5KRfDd7n66XMAEbb+VUP24YvU19lYiSXhGJea+0hhfyHQjUw4CRZG1wN
	 ojlyxZ1pBbCmlOUy4XeC0tLzzDPj9lJRzWR/KDs0ylUXZZSyk0EYmxS69R1WfvzEeh0WX
	 G3Xc+7K80hpUV0wq4ERTki+/hV7cVZb4tfsEW0/1Pqf2nJBjdEZunZPO4negioh1PXTXu
	 OvyJm8Cd8NICkmA+4yAyT0ph60/UFdeE0fn6cqL0oIG7dUObbmnSvIZpg1ThY6UQxgW5c
	 4zRj4D9aAxuyyaACHwKZxLOFm3YoJcpx1PP9y9fGLu6vQ1uEUvkCE6RJdS2Xx7QQB3A==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ba8+Ty4U;
	dmarc=fail header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.5
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010005.outbound.protection.outlook.com [40.93.198.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6BDD21F000E9
	for <tools@kernel.org>; Tue, 25 Aug 2026 18:35:43 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ba8+Ty4U
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 6BDD21F000E9
Authentication-Results: smtp.kernel.org; dmarc=fail (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MnIacHuGtXW0T1Oj4C/J38BoqqClB4/pd+dWiylGY3lEtmAK7rx8k73ZK1/6I7hR4PnyYrRg6de0Bd/7hsIhoTITv733NT8Nt+/n0xZyDeH0jGhUotjfUzilPGYfqx7hDHsoi6A7uaZ4QzncEfDebX8l9aD+hJNwGOprNrjzNb0ncUS0++ekDULFyxmOqxFncFRrM2XlJbAIE9p0JIn0Gh3Zdej5S0QzGo8CHvteneBGrGn2fADO/D1RWWA0C+bGwZ+oy7QIy/Ky/amk4TCrZ5syFp8o4Q1VVCPERCt1sgesVDhUn2LWpvNm+kwJNdftJMXmBDUvFW2UGZE9xcFAnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rU1vniht27KVd8TNcWfwRgJZnV1jmd44yj2qfEI41c0=;
 b=fRbPoBdSCzDVPQr8uf2JeSqXdeOlI5GFKa5V9vhnxiAsTLUwVVpozcnzP9vVk5ys0NlecvvTBX1pbSFoEE68GtkaeH6iBf+L4IZP72Wnl1EqZtpVXnkxVSQxQf1n9hcml5jxB9pk0NWRgVVbk279cteEXnGI3URlL6/BYS1tBXgkObr5+gpqRNt7qMzY9mKJzCCoL3EDyrC2V+d2cKBAMPwqezGCMoqYAyqYceneWtkHgJEZLR1Htj/jzAfBjVOo6iLRWhK5HvxLThMDcw6biGfLxAJcPVlWZQbUc5bv2KSxkXKzaXm0cTIA2qV0hvUFRPh+fCaWc1T+ZywL50MhAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rU1vniht27KVd8TNcWfwRgJZnV1jmd44yj2qfEI41c0=;
 b=ba8+Ty4UAc43t0dmUGtih0GvTPAfD0aIZ3W1Mmm5l/VOXuK0oj2XqGLC8ntPoK3uo5gxyv5Y6FHEw18lu7hYYPM1BkAN4wkftDdwRgA+Pfwe4kWeoGDca48R81CVyTBxuZu4EFLFEmWwrRmcHnVIcrarvH6U3ZZJjmYIJIOXmnoGHqlIZ4283hENI2g/vVe9dicgeLQgATxHOMJRRTK7T5wfDsst/RZyZK0sP2k4IGBjXP7oNaakG6mH7KP1KUv//BkiqzSa2HC0uaLkgJlTl7VmqAeWu1sew1uzrVVXe/+OnhMy901qPc6AcWZv1GQWEVeobErJv7iv53MD2RfS0Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by MW4PR12MB7214.namprd12.prod.outlook.com (2603:10b6:303:229::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 18:35:35 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%4]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 18:35:35 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: tools@kernel.org
Subject: [PATCH b4 2/3] review: discard blank lines between | and > quotes when trimming
Date: Tue, 25 Aug 2026 15:35:33 -0300
Message-ID: <2-v1-5f6173f1d4bf+3e9-trimming_jgg@nvidia.com>
In-Reply-To: <0-v1-5f6173f1d4bf+3e9-trimming_jgg@nvidia.com>
References:
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR20CA0050.namprd20.prod.outlook.com
 (2603:10b6:208:235::19) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|MW4PR12MB7214:EE_
X-MS-Office365-Filtering-Correlation-Id: bedddfbe-39b7-4ebe-f91b-08df02d7a6d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|5023799004|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	TgeTDxKkxrSyjruX1OReaWVpvtVjQD8MGwpM7VgO6k6I3amDM4rT8MKLKKOiOF6xGgUkyZZYjb4Uio2C4NvvHXpHrjUjwja/cTTpfMaG8u52QK7ylGawWToDYxXpwPwPkUu5eoXz6tVz035PKIkPHvHeBgli8IMUBIerQOQ2xNjIfGN5HF7R/sOEOxtd2AeqjnxOkaha88IgRWZwOW3Oab9U4n7mNtamaOGgnAZpYasFNlCAcqDpZSleT9qFJ8emOMYa9wBSWOy3QFGL6zfmKbAjT9XnGBWAopGcKbtbJz83LCoA0b9QuOO6C6BTKaTuTRlm2lgpLkYTA4LwmpJoBhAy7BzQRya7EnLRbIt/kRxJhBULAK4C0NCC6nKF0og/VBa7ErzS8CzDOgT8dtnqMcREgLLgivatNYmfgb29n3yyOvF0VaPUy65fthuc13Hr9x31REiUom6Zv87uw5N4UYbxt8AYLr8DVqhniw8gLT593ZUyKOflelkYsRFILpm7l9HJdomcYF1JmMjXlfA9yJVHw2skQJIk5Y9BXTk2SvRDaNaPWajOJ7zP+3YxzH6G8c1gvkpuRgVk4lKnRSiI/NDj5Q7ZsgWszRrAQ747uaA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(5023799004)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NEZOYWhua05zVUx5d04zY01uR3k4Q2xBNXVIT0RkOThCbGRxOGYyb2kyaklM?=
 =?utf-8?B?eE1NQUdwdFhBYUlZakp0TjlCaStJTi9hbk8xamZONEt6MnVGeDFiM1czUWlK?=
 =?utf-8?B?YkdBYitTQ3h5bWZJekJ2Nkpsd2pTLzB2ckUrZzJBYmgwYTdnSWlyMXoyc3Fy?=
 =?utf-8?B?WnEvaFNGTDR5VzlwVk52dFBqWFpRRXhGNWtUU2VOZHdNTm9XREhuaWRjM3ND?=
 =?utf-8?B?STZpRDdJMlZTcEgvN0Ntd0ZzenBvMEVFK2x5NXU5VDhsc05hTzYybUdtd255?=
 =?utf-8?B?ci9YeTRXbWlpVWxNRVIzemVFSlkwN3h2aXc5L0ZRMzRUYlM0dlN3YVQ1QmFl?=
 =?utf-8?B?S3pSbmNLU1ZobVNBa2grd1RoUGZiYit1KzJyMmlhdXhqZHMwYVpEQ0JqeGhj?=
 =?utf-8?B?TW13Z1J4TTZJMDhJcWtMMGE4MmpBSy9wM2VxY2tkS2E4ZHZpeXMwbnB2V21J?=
 =?utf-8?B?V1psdThrSzJkQU1ZanFYck41WHhVOG5jR2VKZWt2VDJjQkRqUGdaVVRLazE5?=
 =?utf-8?B?Z3A5NURSNUY4MTIzWjRUNURNY1pqRytVeGRBSWhwYWVVZXhMRVV6MDEyd2E0?=
 =?utf-8?B?U2dxUFdsdmJBYUR3cVQrMHE3czRRTkFGMkRDcU1VZG5mbUF2SndFZnRML1A3?=
 =?utf-8?B?a1NIWDV4TndqWnVVUkNFazdKWFhFNVZBa214enp2aHM1dnBTOU51cGVFaDdN?=
 =?utf-8?B?SkFiZlgvYlBBZENTVTExMnhiMW5WN0FqdXArbkV6ckxZdmJNMGQrVHBZMlNy?=
 =?utf-8?B?ZEg5anpENzF4bExLUUp0TS91cmVTNWtCRjRuZmFRdGljV1VVSzNZNmZRbDJ1?=
 =?utf-8?B?UlViaDByb0JvSmpZTUxHK1hES052M2F2S3NvZUZsaGVrZnZJMmNoUjUrZkdI?=
 =?utf-8?B?aVFsejlrUHlrcElYYkNjbyt1QnB6UEwxQVRWVnhRNVFlSUVmLzZJVlV2b0NM?=
 =?utf-8?B?R1M5em41Z0RQTFZvV052a05RSThpL0ltcWMxSUF5c25OdG1TeGI4Z0s4L2Z1?=
 =?utf-8?B?bk56ZTJkdS9ZS1ZrYzBGeDZiQzJ3WW5hV0tkNVZ2SXJSeG1zejdVa2p1bk9H?=
 =?utf-8?B?Y0tMalE0UnVXSmg5SWx2QVllNTQ3WGtPQnRTMWI2cUlmdUdmcmxHL3UzQmc0?=
 =?utf-8?B?YXpQaDN1Z0RMd3BrZEIzTHlBVitHRXhTT1RGemlQWU5NYW5OdVQzcWJ1bmN0?=
 =?utf-8?B?c0d6cUo0d2srRnBjVmdyUjB6UUNXZ0tDd0t5TEQvMnd3VU9qZG10cWFEcEdk?=
 =?utf-8?B?Tnh5Um4rVWtXd3Y2a2ZVUFo0WHFxN3VwSTg4YitNM0szNjErelJrZlE4Um5q?=
 =?utf-8?B?MU5WdlBXN2tHZnZKTFZCTGFPand6VlhZQzRibG5OREoxN01WWU1WZEJCdzkw?=
 =?utf-8?B?MEV3cXFQNjF3VjV5TGFGNU5UOEwrNk1TK05lQ3Q3ZEU1bThUSlpOckRYVXVK?=
 =?utf-8?B?RnpiNm1NeStqZ2tOSkw2YlJaT0MxTCtkTHd4Wnl0SEZSWGFyNTN4V2NYUkl4?=
 =?utf-8?B?ZlltLzhyazhocGtvaTVxTHM2YXRBZnV1S1EzSi9Sb3N1YTJBVDlVY3M1eWRh?=
 =?utf-8?B?clVuS2xUWklFaTI4SFZhaG1mb3RFckZSYmFxTjRGT2NGakQySHB1eVJkcDZL?=
 =?utf-8?B?RitqTmJVS1VUZHBtUXhIY2MybTI2a3orQy9udEozaXFzMjdHK1dJTENPVGxW?=
 =?utf-8?B?SWI4RnluNWJzSkZlVzB1dlh6QllFSGMwZitMaGo4OUtGU1N1Tk90TW5oN0Uz?=
 =?utf-8?B?clkxalB2ZU91NFd4OElOdDZOaVZNSEJGWlhGenFROFdYU01jQWZLK3VIRGtM?=
 =?utf-8?B?SXlJSjJCbThoZ3RyRFFycnJmRUNSdEp0QWplQVM4SkdEVkJ2N1JYTVRPWHNZ?=
 =?utf-8?B?WjFhUEtNaU9oNjJhYUNPcTlteklUbG5YUzhYd1hCYkZJSGtBemwxdXBtYi9k?=
 =?utf-8?B?WVRQcFJ6aTNqODMyVk5kLzN3KzlnUUpBZFA5blgwWFk5V3E1T2RZQlpqQUNk?=
 =?utf-8?B?YWtvdU5PQWpkSC9wZGdCaXFPWmQ5OE5KTkRDUkhzUy8veExzdlJEa3RjUDRt?=
 =?utf-8?B?RlI0SkFiQ0tHR3AxTHo5UmhtZDBvdFp4TjJUV1diU29saUxlVzhYVkpYNW92?=
 =?utf-8?B?SUd4OG13cGpnWEg5SW0rTWMrQzY5MzJVRTl1OUpRbFhCQXdRdmpXOG1Qa3A1?=
 =?utf-8?B?eUw0dDcwRWgzdWF3ejV6NExMQ3ljME5uMWIzZUlLRUZWb0xndmM3c3VhYnNz?=
 =?utf-8?B?STVhVEllWEQ4WUx3MXNMbFdXS2dqN1d6Mjl5ZnNqZGpLZFc3NDIzRkZ5QXUy?=
 =?utf-8?Q?m5/pYqQMBotY5N88MG?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bedddfbe-39b7-4ebe-f91b-08df02d7a6d0
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 18:35:35.1863
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jFI8B5T/9NImqDiiWCr7+IT3lDdKahrZYlwy7ei6/tMNPRoAFRmO64QWQelghxfx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7214

When b4 constructs the email to respond to it inserts the | quoted (eg
sashiko) text in the > flow with blank lines between sections. When it
generates the final email it strips the | quoted text but retains the
blank lines it added. Thus the email ends up with random blank lines
inside the quoted text blocks.

Remove the blank lines along with the | blocks, being careful not to
disturb user test.

Assisted-by: LLM
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 src/b4/review/_review.py | 51 +++++++++++++++++++++++++++++++++++++++-
 src/tests/test_review.py | 26 ++++++++++++++++++++
 2 files changed, 76 insertions(+), 1 deletion(-)

diff --git a/src/b4/review/_review.py b/src/b4/review/_review.py
index c303f9a1c34f8a..5a03e1667dc1b2 100644
--- a/src/b4/review/_review.py
+++ b/src/b4/review/_review.py
@@ -3368,6 +3368,54 @@ def _sync_reply_trailers(reply_text: str, selected: List[str], identity: str) ->
     return reply_text
 
 
+def _strip_external_reviewer_lines(lines: List[str]) -> List[str]:
+    """Remove read-only external-review blocks without leaving quote gaps.
+
+    Rendering puts bare blank separators around ``|``-prefixed external
+    comments.  When both sides of a separator are quoted diff, it belongs to
+    that presentation block and must leave with the comment.  A separator
+    after maintainer text is retained exactly, since it is part of their reply
+    layout rather than the external review's quote padding.
+    """
+    result: List[str] = []
+    index = 0
+    while index < len(lines):
+        if not lines[index].startswith('|'):
+            result.append(lines[index])
+            index += 1
+            continue
+
+        # A leading separator belongs to an external block only when it
+        # separates that block from quoted diff.  Do not alter the same blank
+        # after the maintainer's own text.
+        previous = len(result) - 1
+        while previous >= 0 and not result[previous].strip():
+            previous -= 1
+        if previous >= 0 and result[previous].startswith('>'):
+            del result[previous + 1 :]
+
+        # Treat adjacent external blocks as one block.  Their intervening
+        # blanks are presentation padding too.
+        while index < len(lines) and lines[index].startswith('|'):
+            index += 1
+            blank_end = index
+            while blank_end < len(lines) and not lines[blank_end].strip():
+                blank_end += 1
+            if blank_end < len(lines) and lines[blank_end].startswith('|'):
+                index = blank_end
+                continue
+            if blank_end < len(lines) and lines[blank_end].startswith('>'):
+                # The following quoted context is already separated by its
+                # quote prefix; do not leave the external block's gap behind.
+                index = blank_end
+            else:
+                result.extend(lines[index:blank_end])
+                index = blank_end
+            break
+
+    return result
+
+
 def _trim_quoted_reply(buffer: str) -> str:
     """Prepare a hand-edited reply buffer for sending.
 
@@ -3379,7 +3427,8 @@ def _trim_quoted_reply(buffer: str) -> str:
     maintainer left in place anywhere above their final comment is kept
     exactly as written; nothing is collapsed, reordered, or relocated.
     """
-    lines = [line for line in buffer.splitlines() if not line.startswith(('#', '|'))]
+    lines = [line for line in buffer.splitlines() if not line.startswith('#')]
+    lines = _strip_external_reviewer_lines(lines)
     # Drop the trailing quoted/blank run below the maintainer's last comment.
     end = len(lines)
     while end > 0 and (lines[end - 1].startswith('>') or not lines[end - 1].strip()):
diff --git a/src/tests/test_review.py b/src/tests/test_review.py
index 325edccedfb784..d8a10709386c85 100644
--- a/src/tests/test_review.py
+++ b/src/tests/test_review.py
@@ -808,6 +808,32 @@ class TestTrimQuotedReply:
     def test_empty_buffer(self) -> None:
         assert review._trim_quoted_reply('') == ''
 
+    def test_removes_external_gaps_inside_quoted_diff(self) -> None:
+        buffer = (
+            '> first quoted line\n'
+            '\n'
+            '| sashiko.dev <sashiko@sashiko.dev>:\n'
+            '|\n'
+            '| An external finding.\n'
+            '|\n'
+            '| via: https://sashiko.dev/#/message/example\n'
+            '\n'
+            '> second quoted line\n'
+            '\n'
+            '| another reviewer <reviewer@example.com>:\n'
+            '|\n'
+            '| Another external finding.\n'
+            '\n'
+            '> third quoted line\n'
+            'My maintainer comment.\n'
+        )
+        assert review._trim_quoted_reply(buffer) == (
+            '> first quoted line\n'
+            '> second quoted line\n'
+            '> third quoted line\n'
+            'My maintainer comment.'
+        )
+
 
 class TestParseReplyTrailers:
     """Tests for _parse_reply_trailers() — derived trailer display index."""
-- 
2.43.0

