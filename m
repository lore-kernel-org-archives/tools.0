Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A075237B002
	for <tools@linux.kernel.org>; Tue, 25 Aug 2026 18:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=100.103.45.18
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787682944; cv=fail; b=El6Mhzw3jg85Ccp0U4BzFbnzRg6hPI6l6Yx2MUl1VnLw2NWZ4AUyERghxyLmTAN1uATh58W9IN+IVfo73lLuiwtlN0mEMYbu40IpIeiZ8enO88i8/hoJcUwWLhfYS6Qjd+Cicl5hDVQl+cQ68Z2FTGbM3aSMkK2GxMDjr14fQU8=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787682944; c=relaxed/simple;
	bh=9t+RRN/OrLkKHrDi4d7Z81UvSOmx7uz1q2YkGa0o17Q=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JOl/UQ60A74nj1tvTWbpDbQUuGJysDMNtg0z3004cEAnW+WSo9jlH2S8zA+3IqW8zxBiA6RL9PiOQ7SOgyEn3NArfDSAgUKtxLeGjZeyoc0NkUtN+ZbDJzDZD8hg+ie8qA2ZJJceV/hXVvk9zm3MP2lNEwpXiZVOfFw+ZyC2+9w=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=PAcSExMJ; arc=fail smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="PAcSExMJ"
Received: by smtp.kernel.org (Postfix)
	id 562351F00A3D; Tue, 25 Aug 2026 18:35:43 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.5
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1787682943;
	b=jSHGd+SYJB0RTdUbZCNResRL9AsRGJK7yLz591MVBvOq5D6PIRoBV/wT8dhxcuSfNcYA
	 viBkCN77BOWc0cGkdYkq/rDi4omPxWupQ4W3cHcNVafoPlA/VqQm10SSkCoC852sfssoG
	 uH10v7FaL+Hv3CqcERmWwEBWPvEkYKlYRgBtvBKd3eJlOskxriuyuCtI65rIxs8nzoJlK
	 2FYgITQkNn8a85vJ/nHkNWdOCJuVeAX5JOBuvUvk/90WLYgvnkG6L7dVMnIZwjLnWQaAe
	 y0FmG8XGt+d4Lbx3/AYyAerO3ZAYVXo1BPQEdr3FtbUQxpj3tOOxSzRsyriqJsWOruw==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1787682943;
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
	bh=1/S90q4P9ND4Xp4wg2QdECEFye7grVnXVcb4hBpj5k4=;
	b=jbfZWc7KgIZasaZ5KJug0BFEfateVk/LnW9GLQ43DEzlPPTmPDMpRQz41ujB8fg4XSp7
	 jH4Xhbo74ObifIsgZVqVcntMm0KhnVntFOYzUdqXlNH2eIKJ6v47Jip85ti2Cdm8RGubn
	 rW313WRIT/11TQfQzv0T5QRilaEYHs2vU0ozdUOoRiKyZlTfDgNoEVFUJT3Vrc1oKN8Cp
	 Gb86bG4LBL1FLlMLOVuAh1W0evOb3w8RdKEdESr8HTPLJdei86vkzywIt+6wm9Ux0JgS6
	 b+qNCB8VUu0vReR9Pj0/MctwAS7R2WLQnsy5E06VBgY6sKjriHRultxtMBzFHPR0vkg==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=PAcSExMJ;
	dmarc=fail header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.5
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010005.outbound.protection.outlook.com [40.93.198.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A08231F000E9
	for <tools@kernel.org>; Tue, 25 Aug 2026 18:35:42 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=PAcSExMJ
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org A08231F000E9
Authentication-Results: smtp.kernel.org; dmarc=fail (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zSfxRoaw9gtz7fgxSKtz89gsVmgYRVi2DQ8cSl01M4Dx9MIO/CJ30ShU01xCew4nztF0Gpq7FeikqwTfPl2182zQMlwYu0wVhyQFhr7wYq4tEwDdA2dFFYKfwPt5+vTK5Jz6QhaGUXx8y8RaAZNMDjnxO57kjG+XHPW7FOnfK682v8OF/6yQWRKJBZXvNFZX+8cLi1btALE7WI5pqfWsqUbPfv/HJacCX/NG6HM2hdJNJn1xSkB+koa1DCqj8Jx4llikkTBRM2p/RafrZpO0XSDdXG2UAURC0uzFlup1p1SzEpCifoTZjdLx87zJW6LWL4xqSR5skQpuaAqAAOF+aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1/S90q4P9ND4Xp4wg2QdECEFye7grVnXVcb4hBpj5k4=;
 b=g6MrldQhQPkT97cNOon6b5fOnitAGb748wqst9UqLvLVZvDLJyi35auQQ2HOtqZh6v9hfVSHgONe3L22Ax1iuyxs58DZu/Wnquw/It9yXcpTHjtfoAa2HW3Jye7pcl4XkA+qwYZRS+9K553kcuGMF3U11xB9VfahMt3gYUNbNNlEzvKCSZ5t69gCEX2rUrX6Id+IdXAOT1a06bTXsV68yXRWXjO/u+oRhPcNREAOUoGyuca7OqEN6FpM1MUjP1qOlaN4GfNOSj48w6zks3JOpczOYP/5ixzu66HCJLX0jggEri8RByQPrEDqB7EoBxE9V0fh81leueXQ6FuRaeAZuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1/S90q4P9ND4Xp4wg2QdECEFye7grVnXVcb4hBpj5k4=;
 b=PAcSExMJ6uk6QHWiGrLiQjmw0dd1YQNDvSCwo3PLMSJH/8Abb6xRLK2Atp+MuYT/AWs61u3tnQ0wt9VN/YBeZG7Mkoz/fxkwsbi73BQKpxntFF5LMWRj51OCzDCUtTgwLLBnTe5o+dPzB68xQjlAFvZG3zADlhD1C/BBxdkmzCdmNQrvsE+ueKtlVpLUnhr6cAOayI6+0r0ku+Iko43EY2B5J9Fe/NmKgYoWqZixsLNNyGcmpjscmvHaQF7pUh3Cj9eE8wdrrj78bMPhl1+gJXLZ64jrsbIBe0MsYUs2MCmGfqVaAEe07eou+1CkLDal3mHD9yVTiuQscvRgiOyHMw==
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
Subject: [PATCH b4 1/3] review: trim trailing quoted when adding a tag
Date: Tue, 25 Aug 2026 15:35:32 -0300
Message-ID: <1-v1-5f6173f1d4bf+3e9-trimming_jgg@nvidia.com>
In-Reply-To: <0-v1-5f6173f1d4bf+3e9-trimming_jgg@nvidia.com>
References:
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0096.namprd13.prod.outlook.com
 (2603:10b6:208:2b9::11) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|MW4PR12MB7214:EE_
X-MS-Office365-Filtering-Correlation-Id: e2fc36ec-1060-454f-963d-08df02d7a6cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|3023799007|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	YcBCDb5j/QgsbgIJpzn6JndK5TQ+/CKKb55i+iA4Ku3epDYc8oY/RHg0XQWOAibDTY6XTP+4plYk44tEseTu40c0O8rr3YQAT+3Ms2K9cWyCLHXvYe8UBIwGF0anmGfGn0hlFlzVJpL4ibLybod1SqYPoKZMwc1O/V4/fXcqyetREv48fW5vDyaTsyePlM/QP/TZhRqone8rkJSsHZ2vi1/8zdEiXn+1rqgeoJvi/90FAr1Ct62G6VhtMR7kqzQisTSsxSiJJ0bCwnLVLsMPJaVr+mxgIaSY1f7R6KMUR/HmjOBqpG075Jq4PW6inLaT5OAEVj5VaEyAcoEVwDgXiv+V6lWqC5c9VAYgACQlLCyL4jHuDkAcDxz6H3vBVU6EkWYIY7j7h7xFZFxXf0sMaaqcZQlQtesQYcK52oWp7b1eKhzYUbgSppPtMaaD3N8BLscuEuDGIpgvndSbL7Xtw4g0MlOXrnLK3gFZI63VXEJc/1w7HyTWkJlMOmUNh6EGut3LuTXYvBZuQCdj2c9UqzzlTw0GKPytAijcSTJ/+VX80H/KS0r/xSHreXTPCuTbwGKikRbHOfsxq/ZvgDa/Okpg79eVA3H7q6DQwMqIEUNGQ4/ATfESP2pXMyqKIfVoiMrbQe6zzfdlpBYP2xnSacqXZ7GH1fSOkFzdmHY6qKk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(3023799007)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YXNIUDc1UGJ0RjhoNEtGVG4vWEhQTHIwUkl4YlVaa2F2K29yclpNZ3VIVTdO?=
 =?utf-8?B?ZkJ1THEwV2VSZmdNSEhWNkp2dVdPS1J6Q1FHNGJUWmpvZ201QVNYcnNMT3dP?=
 =?utf-8?B?bnVtay9iYXNxQlM3ZnZzSG5pV0xwU2UyMnVTZmVMK0lPa1hDMmdBNUFac1Ew?=
 =?utf-8?B?TVZzMFQ5dHBIcHQwalJrZUNGVGdIUzFsSUpXbDlDVHY3NHpSS1JveEJkNEZl?=
 =?utf-8?B?b1dPNFZ1QVJMWmRFLzZTN09oQ09XSGNuY2NMT2dIQTRqWHlObWs4WFBrVU9B?=
 =?utf-8?B?Qnh2SEV4aVhJNEtYNUZQV29Zc0RMaFNkbHZvQjhucG5ZcDArMk9jOUVabW5x?=
 =?utf-8?B?Zllubi9jeXJDcmdOcFRiM0gyMzg5bDkzaGgvT3h4dDFDTHFEWTgrQXBUeWY4?=
 =?utf-8?B?dytBWTNFaXZ4WkhlK1o2aHlpZ2xLclFCdFFFSFJ5QzkyNW1TOTcvMFp1RHZy?=
 =?utf-8?B?emZVbHN1NTYrcnJoY3JhSVRYZVdGZTJuZkhrNXdmeFk1NTFKdnFKY1Mrbjl2?=
 =?utf-8?B?MmkrYlowRFRDVDhmQ21JWWhFdW9OTjUzU3FrTFpJMFpJc1kzRFM0bW1hd0hD?=
 =?utf-8?B?WTRDVW5USjkrVU9zR1ZHWGxmUVN6WTdORzdrbE1XQkxRdFdRbndhRzJVNnFh?=
 =?utf-8?B?SUR1Ynp4T2tHNGNwSnorMXdVaGRGWTNoczV3aTJEN1BHZWd1M2ZWRDZBQy9r?=
 =?utf-8?B?T29CL0lueXMzR0lvelVud2h4STA5NFZvaWdvZUlzMVlUbXRUZnNKSFJQYnBV?=
 =?utf-8?B?WEt3cFo3cFRVZTl0V3hiUVhpcXpqWWthQzJOZER0WHppWmwveEs4WUh1MWdC?=
 =?utf-8?B?VlJuRkkyOU95UXhUZllPVDF6MUJUR3B3Nno4ZVhWWGJoZW9DVEhaM0NQczBI?=
 =?utf-8?B?ZmxMREcrT0hvVFpkUklxdDZvamRIUzEzQ2dObVJIU1NHTm9HRGZGVnh6Z1ly?=
 =?utf-8?B?SXhyaDJ3dzN1cWpZMHpqeE1CZWo4QW4zRlM0a0ljYXRzbDluZjZpUGlvNjdh?=
 =?utf-8?B?djNhQVQzbFFxK2wzeEhtNEhUck9MWUR6YTRNQmVKcktyT2Y3cE5nWHRqbFBN?=
 =?utf-8?B?UWJpMDErTFNLaXNnREthdjk2RzZOcjJadHkwV3lMcUprQ0lUNnhvcnB0cU14?=
 =?utf-8?B?d2RxRGJaWGdQUGxBQ1MzZVpEQ3EwMUNkUENKSVljVkNxNFp1K1ZveUxOOWdp?=
 =?utf-8?B?dkdxZmtCL2lYc0EwZ01abWdISUZweEl4Ry9CckdOSVB5MVlkNXAzdEFpcGF6?=
 =?utf-8?B?SDVCbmh6UjhEb3EzZDBUeEhtS3RRd052WFBBNEpFcWx2QUFhbHc2UzgvUHhB?=
 =?utf-8?B?dUFaY1FNcWVzOWZ3aWVuQXpxNy9WODZCSkNFSzRoUjlYRU1yRHd3V2hYTk5J?=
 =?utf-8?B?b3gwZGxEQkYzTWpLYy92ZlVRbXh3NEV1MXVrL21oS3dLZEFxSnExVDRlZ21X?=
 =?utf-8?B?K1l5U005d3FJNFpwOHdEMmwveHJzTEpjd0ZldDNiaW0rMTgyMWxKankwOGpv?=
 =?utf-8?B?MlQzWlZnNGJUbGd3M29wV0NVVmRibWhkMTY5b2Njdjl0RkRJOWRjZUtISFBX?=
 =?utf-8?B?WDhzNEN2dDh1WHBlNUZGd0RWRXQ2V3RTc2M1bGFNOFV1VVp6WDM3Z1U5bVBi?=
 =?utf-8?B?Vk8vQVJRNFR0YmhoSHhsMFBsaHIwWWg3MkZwa3c4cHF1aUJOSjZrV011YThm?=
 =?utf-8?B?SE0xZ2I1MWpTczNQR1RWLy9UdGlnUm1lQTA2ZEJXaFErSXYwVWlxSjVETHFy?=
 =?utf-8?B?M2s2b082S1UxRUxXaVpKK3JsUWt1Z2Mva2duOVE2VkZpSTJqYlhvdVNjWDJ1?=
 =?utf-8?B?eUREb1ZpZ3pROEthTWRqdmhCN0NwVFdraFlxMTBKS0k1QWlLYlNkQk5zQ0hu?=
 =?utf-8?B?cDVZSGVrVFRvdTBkdGJBZWo2Wmt3cWNTckNqM2QwbXc4Tlo1WEo5S3VIWERY?=
 =?utf-8?B?aDN1UTU5UUJseCtaOGdFVFRBVWRVWU5PUFhPN0Z0S0YveGpIMDZvaVg1MVdz?=
 =?utf-8?B?d3ZmYlRJTVd5c1J2anNQcmhDT3JtSXI5ZkttV0NxeFRWZ2paMlc1eVNuMzcy?=
 =?utf-8?B?NXdwYTlWQng1SVF1Rk1OcVFKNUxSK3VGTGRBQjduZDQ0SkpXdHN3UE4xcUZ1?=
 =?utf-8?B?dlNtRWNieEQ0WFVmMTBsYzdSNHNjNWJ0cmZFU0ZlYnJiblRHS2cyc0FnanU0?=
 =?utf-8?B?ZG5OWE0yT2ltSjVQY1pmOUJoMGY5c24zeHAyWGQxMHN5VXhFVTNidVF4aWtM?=
 =?utf-8?B?aG85NklEcStlZDZwUUhyZFhwZndQVTl3N1dxelJJZkNrWHAxSEQzK2dWYWFU?=
 =?utf-8?Q?DtW3teszzLGEBMCaFa?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2fc36ec-1060-454f-963d-08df02d7a6cc
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 18:35:35.1104
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dA7aWum2hekle1C1HZBCrw0hCwbuiHpP6fWkzxGcWlYwiU/x//Z/HxptwlbSI5KI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7214

If some comments are added and then a review tag is placed the trailing
quote that is normally trimmed is instead retained with the trailer
landing at the end of the message. Instead place it right after the
last user comment.

Assisted-by: LLM
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 src/b4/review/_review.py | 17 ++++++++++++++---
 src/tests/test_review.py | 13 +++++++++++++
 2 files changed, 27 insertions(+), 3 deletions(-)

diff --git a/src/b4/review/_review.py b/src/b4/review/_review.py
index 7fe746bb5441c6..c303f9a1c34f8a 100644
--- a/src/b4/review/_review.py
+++ b/src/b4/review/_review.py
@@ -3283,13 +3283,24 @@ def _insert_trailer_in_reply(reply_text: str, trailer: str) -> str:
     """Append *trailer* as its own bare line in the reply buffer.
 
     The line is added at the end of the maintainer's content, before any
-    trailing ``-- `` signature, grouped with any trailers already there.  The
-    maintainer can move it afterwards — placement is just a sensible default.
+    trailing quoted context or ``-- `` signature, grouped with any trailers
+    already there.  Keeping a trailing quote below the trailer lets the
+    ordinary send-time trimming discard it.  The maintainer can move the
+    trailer afterwards — placement is just a sensible default.
     """
     lines = _normalize_line_endings(reply_text).split('\n')
     sig_idx = next((i for i, ln in enumerate(lines) if ln == '-- '), len(lines))
     head = lines[:sig_idx]
     tail = lines[sig_idx:]
+    quoted_tail: List[str] = []
+    quote_start = len(head)
+    while quote_start and (
+        head[quote_start - 1].startswith('>') or not head[quote_start - 1].strip()
+    ):
+        quote_start -= 1
+    if any(line.startswith('>') for line in head[quote_start:]):
+        quoted_tail = head[quote_start:]
+        head = head[:quote_start]
     while head and not head[-1].strip():
         head.pop()
     # Separate from non-trailer content with a blank line so the trailers
@@ -3297,7 +3308,7 @@ def _insert_trailer_in_reply(reply_text: str, trailer: str) -> str:
     if head and not _BARE_TRAILER_RE.match(head[-1]):
         head.append('')
     head.append(trailer)
-    return '\n'.join(head + tail)
+    return '\n'.join(head + quoted_tail + tail)
 
 
 def _remove_trailer_from_reply(reply_text: str, name: str) -> str:
diff --git a/src/tests/test_review.py b/src/tests/test_review.py
index 6bc2aa3edad9f2..325edccedfb784 100644
--- a/src/tests/test_review.py
+++ b/src/tests/test_review.py
@@ -856,6 +856,19 @@ class TestReplyTrailerEditing:
         # No blank line inserted between the two trailers.
         assert 'Reviewed-by: Me <me@x.com>\nTested-by: Me <me@x.com>' in out
 
+    def test_insert_before_trailing_quote(self) -> None:
+        buf = 'Please fix this.\n\n> context left below my message\n> +old code\n'
+        trailer = 'Reviewed-by: Me <me@x.com>'
+        out = review._insert_trailer_in_reply(buf, trailer)
+        assert out == (
+            'Please fix this.\n\n'
+            'Reviewed-by: Me <me@x.com>\n'
+            '\n'
+            '> context left below my message\n'
+            '> +old code\n'
+        )
+        assert review._trim_quoted_reply(out) == 'Please fix this.\n\n' + trailer
+
     def test_remove_drops_matching_bare_line(self) -> None:
         buf = 'Thanks!\n\nReviewed-by: Me <me@x.com>\nAcked-by: Me <me@x.com>'
         out = review._remove_trailer_from_reply(buf, 'reviewed-by')
-- 
2.43.0

