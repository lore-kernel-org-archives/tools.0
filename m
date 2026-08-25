Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06104377ABF
	for <tools@linux.kernel.org>; Tue, 25 Aug 2026 18:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=100.103.45.18
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787682952; cv=fail; b=RYziFX6cS04yQVxnGOhaYthBO58dpKeUYeRIWTkVnLozQ6IzgzK//65FTHdcDpMKecFfIX7Wv02g4TfeJ9Amjm/5u1K7QN6bJ2I4zes2or674t59Y7JCeevnVZmYM6a8scnn9Jo7V2NSG0jbzzqvWYdpAEYTSh6/Rm4yOjFFTv8=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787682952; c=relaxed/simple;
	bh=YJG3r4XJy3ejunIEI9FhgbrrSYEfyJH94oZghl7Arsw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QnA50qiL5w/1jA+ROgYwGWBWahnLtpYBLlO4ow7PAgN9FISmhxc5A+diKerNtplul4DhvGkwOAmAsxMHDe37yHJ0hpylKoXbOP7yMTWja1tutw9gd+RFH/NiJ4Lz9T7kyaVfHNL5HrXeRDcLC/2ilnuqY4/6lnQ/J8u9SsY9L3A=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=AfBeiR/9; arc=fail smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="AfBeiR/9"
Received: by smtp.kernel.org (Postfix)
	id 0335D1F00A3A; Tue, 25 Aug 2026 18:35:51 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.55
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1787682950;
	b=qkThU2FWgyozH9ZeHi4BU0SLgnnx4+j0Ik5fJpo3pmNE3coY30sqcQ7n7VF7XII9esk9
	 JyZ6c5DzZSTw/vbs8BNB4DnXS/B7j/2wPsiO/WUrp4maEhmhhKXp5+koXZCoid8n+FgbG
	 bB2Yvo/0+0PNprthYOF70rpLKLlgJZTh8ZPrZiOMckX4hvO35Xf3en0celpnmrZNfUrKU
	 Xw5fTm/bC+2/TVAVCDTxTUSw4om/427ABr1uRISTDQTO3oh4B/pYqwgQe+W/z0FuCRGgH
	 KmQcZhgb/5g7jYBPY29ByWsPCO8XB3fYKiL5FNlcvlEv6B2r+rahHYiD0KBTElb/rJg==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1787682950;
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
	bh=9CSJJxb+aEKSKJeW9tzvqMtEQvIFVReX2zZR1M1asSU=;
	b=HNGttiPRL/N846l1zkwY+EIicdnAK0vs5Wd1UmTSQVmWqHtghzajFBf826DK/m9g/D0T
	 I+yQ/yhFcB8VNFwNv2loVQslETobm3HUc+khb3BCH6ZSOzndT4IRDniHBuIS4eOcVHPG3
	 R4rpezf7MWm9IYHxzc4D49y5cUVCTr4jLpiZro5AXjjxz2NZu7wGwbfomGbe+cuPKAz0T
	 ubMpsTdcmY9ZQEqmR0kiSq6W+Qt+lKC79XzSLdKyPmu8KBfOdXQOha9nk7j+u367cDp6g
	 FaHVJ/YwMQcxpDM0+NfECgqQc7/2kVuObA9G8oED8DXh7cJcHaFMZdNoiDclpRJbIVw==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b="AfBeiR/9";
	dmarc=fail header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.55
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013055.outbound.protection.outlook.com [40.107.201.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8634B1F000E9
	for <tools@kernel.org>; Tue, 25 Aug 2026 18:35:49 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=AfBeiR/9
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 8634B1F000E9
Authentication-Results: smtp.kernel.org; dmarc=fail (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VOT+uM0JpvAyIQ0Dq5v7jfeFOJgaBOKou0/z8Do9F8Pje+uA796S+Yhjkvg8QhIQxB35O9TyWa+XekLRZg5FW8yI8Yz+ZF9rwthAvi79xAuG+qJcy/oT/yj/tgipfqncAD2Ej7jLol9RzedCVn9kOtdF+5MGm3wuZU5cmqS1bVrKfZ6iwZ98F36WFN/DR8VIKMoDQD80pBp/Ouym5roPBDU0mfMEMlsGYk06W/+dby46iGO48Y6xV1jfRqm+RsJU/UQtykC6eezByd9iTHWpopleQ1aDqhVod50bS2tBvDBPDNuEbqYCdlgB9NcC2TRrQrBAEXI0CBon2+UGDlRlHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9CSJJxb+aEKSKJeW9tzvqMtEQvIFVReX2zZR1M1asSU=;
 b=LAkM+xbFkcWHs72Q1gEC80IOJeK5LHrUhPyAGeQVRYcBYVUVjbMgKpRIbY1VFZEt7MIOuJV2fditBBDm+1mzFvk8wbRcHtQzrTaCN7H8lwaIQKg9mQOqQpEUqtNNUctFJwJOoZNr7giq1ly87iZX5x2VgkrXbrbcFjHrilihZXC5ZQavdKNQGSMSfrklxkhmytBjF9+HLpU+pP6vKWdUh28p5ZY0EEVAoOLfY5OsisIyjQHIL2YtAfDqSXTt1DrjkcTansAuBmvNR3dZ/zBck5gcx9K8alViC51ivJ8D9htQcHQuCwSebpuoXvztmMPc0Zsejm3NOP1YtfiazrDOcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9CSJJxb+aEKSKJeW9tzvqMtEQvIFVReX2zZR1M1asSU=;
 b=AfBeiR/9AMfx6BIFYr8MEnRG3eBAj7LPh6A1MG+/Fc3pUwTKvg0GVoEPCBmVjNAVDXsORjWiLdKZWvOaJy0c7z/RjqoqLjuz0tZIJXZlpYiXw+USVqJ2ZSppz1fQv610aeLCO0XX1Zja3QUvj2PloRu64qwI2el+xftafpScXaqRAuNEiCKy2Lxd22xy960krE14bBB2+a11DXC12G51x+hnTS7c9NHtPjKpmrxDAS70EhhaOlzpqfRjG8D4oZiNAHjSR/e8jQyDZ2lEuApkoWHHKJupdeqFmrBSBVczsfn3XLthEBZzAVJoF6cUhTG54QwhsFwpztfzbmDkwumUzQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by SJ0PR12MB5674.namprd12.prod.outlook.com (2603:10b6:a03:42c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.16; Tue, 25 Aug
 2026 18:35:39 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%4]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 18:35:39 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: tools@kernel.org
Subject: [PATCH b4 3/3] review: add >8< inline marker to snip quoted reply context
Date: Tue, 25 Aug 2026 15:35:34 -0300
Message-ID: <3-v1-5f6173f1d4bf+3e9-trimming_jgg@nvidia.com>
In-Reply-To: <0-v1-5f6173f1d4bf+3e9-trimming_jgg@nvidia.com>
References:
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0116.namprd13.prod.outlook.com
 (2603:10b6:208:2b9::31) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|SJ0PR12MB5674:EE_
X-MS-Office365-Filtering-Correlation-Id: b767c82d-484c-45bf-58ed-08df02d7a71c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|13003099007|10067099003|6133799003|11063799006|5023799004|22082099003|18002099003|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info:
	RyGNhnowr2KQ3280ZZ/w9HgpTAGikKOAX2AoEmK99fMgW+hewJJ1fxbgultgEMs2mLfLrBXYGB1ogm9B81TYXnGmi3PgxX2FBm30Kbc32HhT/PHbALaq+VAgm3bGgSVUsBBzq9LvWnhEgsK3JYUiGZgQfEl+8eh8c44U/wuTC7AUmoJMejZYJCL5o6efsiBV1/ofr4G1eySsVYGXYX4Ohp+/J356/yUuKe8ebFY+SxiMSU3lmgKwLhzvcOgc2S0L2bhMtbSQqr1swBPefwxiL+YrmVXl0ek+e/dEg53u6eXulzJ6mSm6RkkhBGkWQSbtzvEouHezxnRI7UdrHPOeTu2W1gowGE4Hv/NastSxj0tbllvZxZwQCfBrvgAECLfC8DXOnUFVpgG/fot/UjzhTcY/UVG43yR6TqHKwugLYIZlWcXj4QTc2oqj1J9FMkbyow39Gz9dvJlPJCaWePpY23T2xUPpqT+sOi9+aI21vGTH/isvJQ3sxmcEhvDxknRY/VFrMJ2EA7wyl5A0pGnzMdy+2snDavoeUOOyznNw97owgr3WDVLcd2MJYfzcu6WXO3RIqzC9YMXw9wGpM4zHV+uK9Qeu8VBvGbzgkOVgb1o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(13003099007)(10067099003)(6133799003)(11063799006)(5023799004)(22082099003)(18002099003)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QmFiWDVhdGQ0ZWJqTEg0aVgxRjNuTUFVd0Z6bUhUOVhwWHByS3Q0TDFMcDNV?=
 =?utf-8?B?MDJybGt6OUZzUmdjK2NQYWdZVUhlUTZBYTNsYUQ3aFZFWWU4Qno0NGxXL2p2?=
 =?utf-8?B?YUw0T1NLNTdINC92Tkx3UmF2WDZ5bi9WeVFTekl0V3Q3U3V6STdhOTdDazNa?=
 =?utf-8?B?Y1FQL2p4OU9FNTVTVXVIOEZZekVwMStHZUpHMGczMS9oaFNaOEhrd1ZzZmFm?=
 =?utf-8?B?cFVhbzVPTXpQZW9KU0RXdjlWZm1jWi9ScWNadzRwaXBmdHJpS0xCcnV6YWFt?=
 =?utf-8?B?WmYxYis5NVF0Wi9oZDlVM2xQYlhidnRQcTA5cWo5RXpzUlc3NWJKYnlTZCtX?=
 =?utf-8?B?QU5CS01keEI0enNQTVJvNXBKcCtqWDkycGoxNEtubFN4RnVZT1pnNzV4Nm9o?=
 =?utf-8?B?U0hoS3l6a3Urd3RrRDdnUUtiZjdXaWlKc1FHbkhCWjBRdkdvWU9PdDIzaGtM?=
 =?utf-8?B?RzNWSEE5TzdPc1ZZT0JDODdneTNlQ1JYMTlDcjd2UlZnbjl2cWQwbjlpSERy?=
 =?utf-8?B?RDIzQjhDUFdDWC9lMCs2U2JadE1uOVZmRk8xa0todXhWM0MycTdNVmxqTTNY?=
 =?utf-8?B?elF4YXY3SFFjUnBnZVMzdm5qdE4yY1R3cWlEK05GQ0NpWmZGUmcwTFY1NHNH?=
 =?utf-8?B?YmpLY2xHTU1hQnZsM1Z0TkZVVlNxaEhMWDVnUUh3R2VzT0t2bk9nNUFVeVJ4?=
 =?utf-8?B?cVpUb0J5cFdJellCRUZXK2dEeEFiSVptd1BPQzluZFBaTUNaZVpLVWwrR3VW?=
 =?utf-8?B?VUVvRnIyVTZ0dGJzcDBoNFV6Mko4N2NRb3d0c3QxN1dVSVZtSjNhY2hKdkJ2?=
 =?utf-8?B?WUNkQjdRRW1oME1LQ1FpU3lQSnpTd1A1ZUtiaE0zbEd2Y0UyelNIU001aXRS?=
 =?utf-8?B?Mmk5OE5td2hJMnlRSHJ1WEtqWnRLRVBiSHMrbEtUZFkrbnNMb2lLSVIwZWtH?=
 =?utf-8?B?T2pWVHhVR1RCRDdjYWR3OVNOVEpOejVGNG0rUi9LVWhieHRObnQxMU1rNnR4?=
 =?utf-8?B?U2xyVlRlS1hjbXVxK0xOS3VwK1AxWDRGSFg5WUJOWmE5bjJPamFDcEZBZy9p?=
 =?utf-8?B?UGxlYm5UVHpoeWhKVllqSllBaGlSL1JYa1lHU0RrTElMYUJyNjltamlmbTk4?=
 =?utf-8?B?c0trcHpDWnpWV3c4NkxVT0t0TmJINzFrMWtueXVaZm1JVldBS0hNakJuWHRh?=
 =?utf-8?B?by9YVExTMjdFOUROQ3IrUExvUUc4d1luV3pvZEV4RmZxb3hZaE5HaUU2UWt4?=
 =?utf-8?B?bElLYWJoclZqRW9QMzFPczg4UnlUelF0UHpzSmdQL3NiR1RaSmlQaTBLUG83?=
 =?utf-8?B?cUdMTEowakhKbXhOcG5YSW1aYVNKQ0pWNXFjNlB1U2dYSWl5M0NnbHBRN3hI?=
 =?utf-8?B?UWFRYUZqelMrelpLMEFUUG5GeXhnRysrdEc5V1E2V0pXazh6QTZEOVV2Q0Z3?=
 =?utf-8?B?bDJqc0ZUZHBCTE1JSGxPK09UWEg1Q2lQcXU3YVhmMVhxcWwzOGF0VDVMRWc4?=
 =?utf-8?B?STg3cFRESEdhYWVVTk5jRFk2a0lxazd1U2d3SEFXME4xazNlVDNQaVo1STRu?=
 =?utf-8?B?MzA3U1pmMlByU053SW5xQU9hRnJMS2JMYVIxcDhtQUJvbUg5RHpVcEFTcnRm?=
 =?utf-8?B?VmtKeTljYzA0WkNBbkliRERUYkhVdXg4T1A0WFJXTmVMS0wwZFp4a0xDbHF6?=
 =?utf-8?B?bjNvYVJoMjBFY25UMUxBQ2d4ZlN5QUdvcFpodVY4RXViUVFKNld1c1NLd3Rn?=
 =?utf-8?B?aUNEa1hLcGdFMy9qWlNYSW9iSjVHVGxxdnYrKys4SitjVFFTaW5jTWxqalJP?=
 =?utf-8?B?aUlIbkd1WnVjVzI1Y2loODdlMUdQV1FocTZWaW1wdURDS3FZZ2RtZXZ6VzF6?=
 =?utf-8?B?MFg0aXJMcGtMNEJ1azBTazBXOEpwbUxMakZNc2d1d290U1hmT3Y1SC8vOEVN?=
 =?utf-8?B?bE9vSzNiZmpTVkJHUGNQcnQzYVRZU3ljSVR0R0ZudndKMXV6bE9BaWdnOVgw?=
 =?utf-8?B?UXNFeGcrUktiQStDdHhRSHRxdlhmSkl2QjF6d3dxNDh4N0NuUVFIUEVQVFFq?=
 =?utf-8?B?ZWxsT0hITFRhUXRLMlFWRjRmc29UNVpCeC9nSVJMUVdWeXBBZGUzek50b01o?=
 =?utf-8?B?ZDJyZmJxak43ZlgwUkxPRmRueTQyTDl0MUZVS2ltVURvZHo1SHlFNG0xZDU5?=
 =?utf-8?B?MkhudkVHTmh1RUtVdDcyTmg4NUdQcFBkbWp1L2hMaEJhSldLYU1iSzc5Zjd3?=
 =?utf-8?B?VUpTaHRST2N6dXh0U2tVc3BzUkh5bm1SLzAvUTJHOUR0K2UwRENPSFEvQVNn?=
 =?utf-8?Q?UHoVmPUOk79BV7d0T/?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b767c82d-484c-45bf-58ed-08df02d7a71c
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 18:35:35.7849
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9vYOxa3MixtNmSytg55QCqLK73kg+scgrcBjhl8yzOrSwJ8J+tcm7AKfZLxAweu2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5674

When adding review comments to a message it is very inconvenient to
permanently loose the quotable text. Often I will make several passes over
a series and the nice b4 behavior of keeping everything in draft
encourages coming back and making revisions and further comments.

However, if the quoted text has been erased that isn't possible.

Instead of erasing in the editor provide a full line marker '>8<' for b4
to automagically do the trimming similar to how it trims unused quote at
the end. Trailing text after user lines and till the marker is removed
similar to the trailing text.

This way the message can be sliced and minimally quoted appropriately with
no loss of quoted text. Everything can be selectively undone by the user.

The string is selected because it is similar to 'scissors' in git commit.

Assisted-by: LLM
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 docs/maintainer/review.rst       |  24 +++
 docs/releases.rst                |   9 +-
 src/b4/review/_review.py         |  76 +++++++--
 src/b4/review_tui/_review_app.py |  10 +-
 src/tests/test_review.py         | 257 +++++++++++++++++++++++++++++++
 src/tests/test_tui_review.py     |  69 +++++++++
 6 files changed, 429 insertions(+), 16 deletions(-)

diff --git a/docs/maintainer/review.rst b/docs/maintainer/review.rst
index ca0632696b1b0b..985b699b3a8a7b 100644
--- a/docs/maintainer/review.rst
+++ b/docs/maintainer/review.rst
@@ -584,6 +584,30 @@ cyan, external ``|`` comments visually bracketed, and your own comments
 in the default foreground. Spell checking is limited to your own
 comment lines.
 
+**Trimming quoted context (any editor)**
+
+No editor plugin is required to prune a run of quoted context. Put the
+following marker alone on a line after the quoted lines you want to discard::
+
+    >8<
+
+When the reply is sent, b4 removes the contiguous run of quoted lines above
+the marker, stopping at your last unquoted note, and replaces it with the
+same breadcrumb used by the Vim and Emacs trimming commands::
+
+    > [ ... 42 lines skipped ... ]
+
+Quoted context below the marker is left untouched. Only ``>``-quoted lines
+contribute to the count, so your own notes are always boundaries and can
+never be discarded. If you type the marker while the cursor is still in the
+quoted flow, ``> >8<`` is accepted as an equivalent spelling.
+
+Hand-typed markers and the Vim/Emacs commands produce identical output and
+coalesce with each other. If a plugin-generated breadcrumb is immediately
+above ``>8<``, its recorded count is absorbed into the new breadcrumb instead
+of leaving two markers. This works in both the main review reply editor and
+the follow-up quick-reply editor.
+
 *Vim*
 
 Copy or symlink the files into your Vim configuration::
diff --git a/docs/releases.rst b/docs/releases.rst
index 4bff1b05645728..13ff732fb3683f 100644
--- a/docs/releases.rst
+++ b/docs/releases.rst
@@ -40,6 +40,14 @@ the full reference.
 Several notable improvements to the ``b4 review`` workflow shipped this
 cycle, building on the v0.15 foundation.
 
+**Inline snip markers in review replies**
+
+In any editor, put ``>8<`` alone on a line to discard the run of quoted
+context above it back to your last note. B4 replaces the run with the same
+``> [ ... NN lines skipped ... ]`` breadcrumb produced by the Vim and Emacs
+review helpers. The marker also works in follow-up quick replies, and existing
+breadcrumbs coalesce into its skipped-line count.
+
 **Manual revision linking**
 
 When automatic revision discovery fails — for example, a submitter sent
@@ -628,4 +636,3 @@ reviewing patches, testing, and contributing code:
 - Rob Herring
 - Tamir Duberstein
 - Toke Høiland-Jørgensen
-
diff --git a/src/b4/review/_review.py b/src/b4/review/_review.py
index 5a03e1667dc1b2..06e48dbd704dbb 100644
--- a/src/b4/review/_review.py
+++ b/src/b4/review/_review.py
@@ -2028,6 +2028,9 @@ def _render_quoted_diff_with_comments(
         '# trailer (Reviewed-by:, etc.) you place inline. The only change made',
         '# on send is to drop quoted diff left below your last comment; quoted',
         '# context you keep above a comment is sent as-is. Trim freely.',
+        '# To discard a run of quoted context without deleting it by hand, put',
+        '# ">8<" alone on a line -- everything quoted above it back to your last',
+        '# note is dropped when you send.',
         '#',
     ]
     current_a_file = ''
@@ -2038,7 +2041,7 @@ def _render_quoted_diff_with_comments(
 
     def _insert(key: Tuple[str, int]) -> None:
         for text, attr, prov in comment_map.pop(key, []):
-            if result:
+            if result and result[-1]:
                 result.append('')
             if attr:
                 # External reviewer comment — render with | prefix
@@ -2105,10 +2108,10 @@ def _extract_editor_comments(
 ) -> List[Dict[str, Any]]:
     """Extract comments from the quoted-diff editor format.
 
-    Strips instruction lines (``#`` prefix) and external reviewer
-    comments (``|`` prefix), then delegates to
-    :func:`_extract_comments_from_quoted_reply` which handles the
-    ``> ``-quoted diff with unquoted comment format.
+    Strips instruction lines (``#`` prefix), resolves snip markers, and then
+    removes external reviewer comments (``|`` prefix) before delegating to
+    :func:`_extract_comments_from_quoted_reply`, which handles the ``> ``-
+    quoted diff with unquoted comment format.
 
     When *diff_text* is provided, runs :func:`_resolve_comment_positions`
     to correct diff comment positions when the user has trimmed quoted
@@ -2121,10 +2124,9 @@ def _extract_editor_comments(
         # Strip editor instruction lines
         if line.startswith('#'):
             continue
-        # Strip external reviewer comment blocks (| prefix)
-        if line.startswith('|'):
-            continue
         filtered.append(line)
+    filtered = _apply_snip_markers(filtered)
+    filtered = _strip_external_reviewer_lines(filtered)
     comments = _extract_comments_from_quoted_reply(
         '\n'.join(filtered), capture_preamble=True
     )
@@ -3271,6 +3273,8 @@ def _parse_reply_trailers(buffer: str) -> List[str]:
     return [lt.as_string() for lt in found]
 
 
+_SNIP_MARKER_RE = re.compile(r'^\s*(?:> )?>8<\s*$')
+_SKIP_BREADCRUMB_RE = re.compile(r'^> \[ \.\.\. (\d+) lines skipped \.\.\. \]$')
 _BARE_TRAILER_RE = re.compile(r'^\s*([\w-]+):\s')
 
 # The trailer names the TUI trailer menu offers.  The menu (and
@@ -3416,18 +3420,64 @@ def _strip_external_reviewer_lines(lines: List[str]) -> List[str]:
     return result
 
 
+def _apply_snip_markers(lines: List[str]) -> List[str]:
+    """Resolve standalone ``>8<`` directives in a filtered reply buffer.
+
+    Each marker replaces the contiguous quoted/external-review/blank run
+    immediately above it with the same breadcrumb emitted by the Vim and
+    Emacs review helpers.  The external-review blocks are snippable so their
+    surrounding separators can be removed without touching maintainer
+    spacing.  Unquoted lines are hard boundaries, so maintainer comments can
+    never be consumed.  Existing breadcrumbs contribute their recorded count,
+    allowing editor-generated and hand-typed trims to coalesce.
+    """
+    result: List[str] = []
+    for line in lines:
+        if not _SNIP_MARKER_RE.fullmatch(line):
+            result.append(line)
+            continue
+
+        boundary = len(result) - 1
+        while boundary >= 0 and (
+            not result[boundary].strip() or result[boundary].startswith(('>', '|'))
+        ):
+            boundary -= 1
+
+        snipped = result[boundary + 1 :]
+        skipped = 0
+        for quoted in snipped:
+            if not quoted.startswith('>'):
+                continue
+            breadcrumb = _SKIP_BREADCRUMB_RE.fullmatch(quoted)
+            skipped += int(breadcrumb.group(1)) if breadcrumb else 1
+
+        if skipped:
+            del result[boundary + 1 :]
+            first_snippable = next(
+                index
+                for index, snipped_line in enumerate(snipped)
+                if snipped_line.startswith(('>', '|'))
+            )
+            result.extend(snipped[:first_snippable])
+            result.append(f'> [ ... {skipped} lines skipped ... ]')
+
+    return result
+
+
 def _trim_quoted_reply(buffer: str) -> str:
     """Prepare a hand-edited reply buffer for sending.
 
     The maintainer's text is sent as written.  The only changes are to strip
     b4's own scaffolding — the ``#`` instruction header and ``| `` read-only
-    external-reviewer lines — and to drop the run of quoted diff at the very
-    bottom of the message that has no comment after it, the usual courtesy of
-    trimming quoted material below your last reply.  Quoted context the
-    maintainer left in place anywhere above their final comment is kept
-    exactly as written; nothing is collapsed, reordered, or relocated.
+    external-reviewer lines — resolve any standalone ``>8<`` snip markers —
+    and drop the run of quoted diff at the very bottom of the message that has
+    no comment after it, the usual courtesy of trimming quoted material below
+    your last reply.  Other quoted context the maintainer left in place
+    anywhere above their final comment is kept exactly as written; nothing is
+    collapsed, reordered, or relocated.
     """
     lines = [line for line in buffer.splitlines() if not line.startswith('#')]
+    lines = _apply_snip_markers(lines)
     lines = _strip_external_reviewer_lines(lines)
     # Drop the trailing quoted/blank run below the maintainer's last comment.
     end = len(lines)
diff --git a/src/b4/review_tui/_review_app.py b/src/b4/review_tui/_review_app.py
index d73fe057b5d499..2e312ca0e5bb93 100644
--- a/src/b4/review_tui/_review_app.py
+++ b/src/b4/review_tui/_review_app.py
@@ -1837,7 +1837,12 @@ class ReviewApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[None]):
             orig_author = entry.get('fromname', '') or entry.get('fromemail', '')
             body = entry.get('body', '')
             quoted = '\n'.join(f'> {line}' for line in body.splitlines())
-            editor_text = f'On {orig_date}, {orig_author} wrote:\n{quoted}\n\n'
+            editor_text = (
+                '# Put ">8<" alone on a line to discard quoted context above it\n'
+                '# back to your last note; b4 resolves it when you send.\n'
+                '#\n'
+                f'On {orig_date}, {orig_author} wrote:\n{quoted}\n\n'
+            )
 
         result = suspend_and_edit(
             self, editor_text.encode(), 'reply.eml', topdir=self._topdir
@@ -1859,7 +1864,8 @@ class ReviewApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[None]):
 
     def _send_followup_reply(self, entry: Dict[str, Any], text: str) -> None:
         """Build and immediately send a quick reply to a follow-up message."""
-        msg = entry['lmsg'].make_reply(text)
+        reply_text = b4.review._trim_quoted_reply(text)
+        msg = entry['lmsg'].make_reply(reply_text)
         try:
             with self.suspend():
                 smtp, fromaddr = b4.get_smtp(dryrun=self._email_dryrun)
diff --git a/src/tests/test_review.py b/src/tests/test_review.py
index d8a10709386c85..ccd6d5d1862e3c 100644
--- a/src/tests/test_review.py
+++ b/src/tests/test_review.py
@@ -136,6 +136,12 @@ class TestRenderQuotedDiffWithComments:
         )
         assert 'My comment' in result
         assert '| Ext comment' in result
+        lines = result.splitlines()
+        own_index = lines.index('My comment')
+        external_index = lines.index('| Ext <ext@example.com>:')
+        # _insert() terminates the own comment with one blank line, which is
+        # already enough to separate it from the external review.
+        assert lines[own_index + 1 : external_index] == ['']
 
     def test_cross_file_comments(self) -> None:
         """Comments in different files render correctly."""
@@ -835,6 +841,257 @@ class TestTrimQuotedReply:
         )
 
 
+class TestSnipMarker:
+    """Tests for resolving hand-typed quoted-context snip markers."""
+
+    def test_discards_quote_run_above_and_keeps_quote_below(self) -> None:
+        lines = [
+            'My first note.',
+            '> first quoted line',
+            '> second quoted line',
+            '',
+            '>8<',
+            '> quoted context below the marker',
+            'My second note.',
+        ]
+        assert _review._apply_snip_markers(lines) == [
+            'My first note.',
+            '> [ ... 2 lines skipped ... ]',
+            '> quoted context below the marker',
+            'My second note.',
+        ]
+
+    def test_snip_removes_external_comment_separators(self) -> None:
+        buffer = (
+            'My first note.\n'
+            '\n'
+            '> quoted context before the external review\n'
+            '\n'
+            '| sashiko.dev <sashiko@sashiko.dev>:\n'
+            '|\n'
+            '| An external finding.\n'
+            '|\n'
+            '| via: https://sashiko.dev/#/message/example\n'
+            '\n'
+            '> quoted context after the external review\n'
+            '>8<\n'
+            '> quoted context below the marker\n'
+            'My second note.\n'
+        )
+        assert review._trim_quoted_reply(buffer) == (
+            'My first note.\n'
+            '\n'
+            '> [ ... 2 lines skipped ... ]\n'
+            '> quoted context below the marker\n'
+            'My second note.'
+        )
+
+    def test_snip_keeps_spacing_before_external_review(self) -> None:
+        buffer = (
+            'My maintainer comment.\n'
+            '\n'
+            '| sashiko.dev <sashiko@sashiko.dev>:\n'
+            '|\n'
+            '| An external finding.\n'
+            '|\n'
+            '| via: https://sashiko.dev/#/message/example\n'
+            '\n'
+            '> quoted context after the external review\n'
+            '>8<\n'
+            '> quoted context below the marker\n'
+            'My second note.\n'
+        )
+        assert review._trim_quoted_reply(buffer) == (
+            'My maintainer comment.\n'
+            '\n'
+            '> [ ... 1 lines skipped ... ]\n'
+            '> quoted context below the marker\n'
+            'My second note.'
+        )
+
+    def test_snip_keeps_maintainer_spacing_before_first_quote(self) -> None:
+        lines = [
+            'My first paragraph.',
+            'My second paragraph.',
+            '',
+            '> first quoted line',
+            '',
+            '> second quoted line',
+            '>8<',
+            '> quoted context below the marker',
+            'My later note.',
+        ]
+        assert _review._apply_snip_markers(lines) == [
+            'My first paragraph.',
+            'My second paragraph.',
+            '',
+            '> [ ... 2 lines skipped ... ]',
+            '> quoted context below the marker',
+            'My later note.',
+        ]
+
+    @pytest.mark.parametrize(
+        ('lines', 'expected'),
+        [
+            (['', '>8<', 'My note.'], ['', 'My note.']),
+            (
+                ['My note.', '', '>8<', '> quote below', 'Another note.'],
+                ['My note.', '', '> quote below', 'Another note.'],
+            ),
+        ],
+    )
+    def test_marker_with_nothing_to_discard(
+        self, lines: List[str], expected: List[str]
+    ) -> None:
+        assert _review._apply_snip_markers(lines) == expected
+
+    def test_coalesces_existing_breadcrumb_count(self) -> None:
+        lines = [
+            'My note.',
+            '> one more quoted line',
+            '> [ ... 42 lines skipped ... ]',
+            '>8<',
+            '> kept below',
+            'Later note.',
+        ]
+        assert _review._apply_snip_markers(lines) == [
+            'My note.',
+            '> [ ... 43 lines skipped ... ]',
+            '> kept below',
+            'Later note.',
+        ]
+
+    def test_multiple_markers_never_cross_comment_boundaries(self) -> None:
+        lines = [
+            'First comment.',
+            '> first run',
+            '>8<',
+            '> kept after first marker',
+            'Adopted reviewer comment.',
+            '> second run one',
+            '> second run two',
+            '> >8<',
+            '> kept after second marker',
+            'Final comment.',
+        ]
+        assert _review._apply_snip_markers(lines) == [
+            'First comment.',
+            '> [ ... 1 lines skipped ... ]',
+            '> kept after first marker',
+            'Adopted reviewer comment.',
+            '> [ ... 2 lines skipped ... ]',
+            '> kept after second marker',
+            'Final comment.',
+        ]
+
+    @pytest.mark.parametrize('marker', ['>8<', '> >8<'])
+    def test_accepted_spellings_resolve_identically(self, marker: str) -> None:
+        lines = ['My note.', '> one', '> two', marker, '> kept', 'Later note.']
+        assert _review._apply_snip_markers(lines) == [
+            'My note.',
+            '> [ ... 2 lines skipped ... ]',
+            '> kept',
+            'Later note.',
+        ]
+
+    def test_marker_substring_is_not_a_directive(self) -> None:
+        lines = ['My note.', '> quoted', 'Do not treat >8< here as a marker.']
+        assert _review._apply_snip_markers(lines) == lines
+
+    def test_trim_composes_scaffolding_snip_and_trailing_quote(self) -> None:
+        buffer = (
+            '# instructions\n'
+            '| External reviewer note\n'
+            'My first note.\n'
+            '> old context one\n'
+            '> old context two\n'
+            '>8<\n'
+            '> context kept below the marker\n'
+            'My second note.\n'
+            '> trailing untouched quote\n'
+        )
+        assert review._trim_quoted_reply(buffer) == (
+            'My first note.\n'
+            '> [ ... 2 lines skipped ... ]\n'
+            '> context kept below the marker\n'
+            'My second note.'
+        )
+
+    def test_diff_comment_after_marker_resolves_against_real_diff(self) -> None:
+        edited = (
+            '# instructions\n'
+            'On today, Author wrote:\n'
+            '> diff --git a/f.c b/f.c\n'
+            '> index 1111111..2222222 100644\n'
+            '> --- a/f.c\n'
+            '> +++ b/f.c\n'
+            '> @@ -1,2 +1,2 @@\n'
+            '> -old first\n'
+            '> +new first\n'
+            '>  keep first\n'
+            '>8<\n'
+            '> @@ -10,2 +10,2 @@\n'
+            '> -old target\n'
+            '> +new target\n'
+            '\n'
+            'Fix the target.\n'
+            '>  keep target\n'
+        )
+        real_diff = (
+            'diff --git a/f.c b/f.c\n'
+            'index 1111111..2222222 100644\n'
+            '--- a/f.c\n'
+            '+++ b/f.c\n'
+            '@@ -1,2 +1,2 @@\n'
+            '-old first\n'
+            '+new first\n'
+            ' keep first\n'
+            '@@ -10,2 +10,2 @@\n'
+            '-old target\n'
+            '+new target\n'
+            ' keep target\n'
+        )
+        comments = review._extract_editor_comments(edited, diff_text=real_diff)
+        assert comments == [
+            {
+                'path': 'b/f.c',
+                'line': 10,
+                'text': 'Fix the target.',
+                'content': '+new target',
+            }
+        ]
+
+    def test_message_comment_after_marker_resolves_against_real_text(self) -> None:
+        edited = (
+            '# instructions\n'
+            'On today, Author wrote:\n'
+            '> First body line.\n'
+            '> Second body line.\n'
+            '>8<\n'
+            '> Target body line.\n'
+            '\n'
+            'Comment on the target.\n'
+            '> Last body line.\n'
+        )
+        message = (
+            'Subject\n'
+            '\n'
+            'First body line.\n'
+            'Second body line.\n'
+            'Target body line.\n'
+            'Last body line.\n'
+        )
+        comments = review._extract_editor_comments(edited, message_text=message)
+        assert comments == [
+            {
+                'path': review.COMMIT_MESSAGE_PATH,
+                'line': 3,
+                'text': 'Comment on the target.',
+                'content': 'Target body line.',
+            }
+        ]
+
+
 class TestParseReplyTrailers:
     """Tests for _parse_reply_trailers() — derived trailer display index."""
 
diff --git a/src/tests/test_tui_review.py b/src/tests/test_tui_review.py
index cd808ec8b7bf63..3787881e7070d5 100644
--- a/src/tests/test_tui_review.py
+++ b/src/tests/test_tui_review.py
@@ -9,6 +9,7 @@ Tests the shell-return reconciliation logic that detects and handles
 cosmetic commit edits (e.g. reworded subjects via git rebase -i).
 """
 
+import email.message
 import json
 from typing import Any, Dict, List, Tuple
 from unittest import mock
@@ -362,6 +363,74 @@ class TestReplyVerbatim:
             )
 
 
+class TestFollowupSnipMarker:
+    """Quick follow-up replies expose and resolve the snip marker."""
+
+    def test_compose_includes_marker_instructions(self, gitdir: str) -> None:
+        branch, _shas = _create_review_branch_with_patches(
+            gitdir, 'followup-snip-instructions', ['patch 1']
+        )
+        app = ReviewApp(_build_session(gitdir, branch))
+        entry = {
+            'date': 'Thu, 1 Jan 2026 12:00:00 +0000',
+            'fromname': 'Reviewer',
+            'fromemail': 'reviewer@example.com',
+            'body': 'First line.\nSecond line.',
+        }
+
+        with mock.patch(
+            'b4.review_tui._review_app.suspend_and_edit', return_value=None
+        ) as edit:
+            app._compose_followup_reply(entry)
+
+        editor_text = edit.call_args.args[1].decode()
+        assert editor_text.startswith('# Put ">8<" alone on a line')
+        assert '# back to your last note; b4 resolves it when you send.' in editor_text
+        assert '> First line.\n> Second line.' in editor_text
+
+    def test_send_resolves_marker_and_drops_trailing_quote(self, gitdir: str) -> None:
+        import contextlib
+
+        branch, _shas = _create_review_branch_with_patches(
+            gitdir, 'followup-snip-send', ['patch 1']
+        )
+        session = _build_session(gitdir, branch)
+        session['email_dryrun'] = True
+        app = ReviewApp(session)
+        lmsg = mock.Mock()
+        outgoing = email.message.EmailMessage()
+        lmsg.make_reply.return_value = outgoing
+        entry = {'lmsg': lmsg, 'fromemail': 'reviewer@example.com'}
+        buffer = (
+            '# Put ">8<" alone on a line to trim quoted context.\n'
+            'On today, Reviewer wrote:\n'
+            '> old context one\n'
+            '> old context two\n'
+            '>8<\n'
+            '> context kept below the marker\n'
+            'My reply.\n'
+            '> trailing untouched quote\n'
+        )
+
+        with (
+            mock.patch.object(
+                app, 'suspend', side_effect=lambda: contextlib.nullcontext()
+            ),
+            mock.patch.object(app, 'notify'),
+            mock.patch('b4.get_smtp', return_value=(None, 'me@example.com')),
+            mock.patch('b4.send_mail', return_value=0) as send_mail,
+        ):
+            app._send_followup_reply(entry, buffer)
+
+        lmsg.make_reply.assert_called_once_with(
+            'On today, Reviewer wrote:\n'
+            '> [ ... 2 lines skipped ... ]\n'
+            '> context kept below the marker\n'
+            'My reply.'
+        )
+        assert send_mail.call_args.args[1] == [outgoing]
+
+
 class TestReconcileAfterShell:
     """Tests for _reconcile_after_shell tracking fixup."""
 
-- 
2.43.0

