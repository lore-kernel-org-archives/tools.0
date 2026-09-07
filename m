Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59BAD3F1653
	for <tools@linux.kernel.org>; Mon,  7 Sep 2026 19:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=100.103.45.18
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788808982; cv=fail; b=DeCIHOij65u7BEm+Y65fh/1OAIi//yIYPqfX9K8syiijAK64Xt6/N+x2sXrB0CWS1w2hGAdNz5x0U7+O6JKspRo1X7UECrYW06ywh6LQ4fbw88Gs0JFpdT4EMyWw/qJhxAfPp3S0UYj1EmZ3fBpBQY2vJ3QH+NYbNaQDYdD4XB0=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788808982; c=relaxed/simple;
	bh=mCSg1Aw6llbhVYgrTw/xIqY6y7H6Z6G+f+XZyeydsVg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jRiwgW2s2H0NMydjHUxnJfLIPJUGUOvIiSFi31U0M3EWlXL+gKZg26umQNpHKS58oMDUBAxzZNqD8Lpd7meksC2cvc0XCmTaTda0bBIfuW4VMbKeYI4tmcTW2iOuMAsQlYntryCeU0A1Wziib7JF+UHIIfDFKCdGEQonYQQE+ks=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=QY9dLd1m; arc=fail smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="QY9dLd1m"
Received: by smtp.kernel.org (Postfix)
	id 14B1C1F00A3F; Mon,  7 Sep 2026 19:23:01 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.23
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1788808981;
	b=cnlmnqi95/Vjeu45r2ulTrp+3KRdHSGN36w/zC0C1vLuy3RdBWdknVdYOYocvsDtxCEY
	 tTA5tFs5qYQ35d6HoXBTQM70Tjn/aOEojtN/IjiuFVzKsx5lulvRrvQDDmwT91T4ZJVx5
	 uwdF8VK3UMjs9/efkg9PdYAm3Zph8uYF5qZ82A3dFMAmUuh//Cil11RCA/PcNVPahkNyj
	 UOu7ncGFxLCs1qzttjcxBRa55Ax8nAFGQLmZGdyJ/8JCFoCHY51yOvZjlP5a5QNSDavkN
	 xLJCwttKRCmm7FtvfH789V0FHgHw9nLE+uP+OP7e8wrN6OOD3BfnWNGcnklavVwhbow==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1788808981;
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
	bh=K8MktOqC4quToPqgHS5VdjWP2yYxOCPNOSqaM8E4rf8=;
	b=A0Fes2fQFKBqzzWkgxmv5TsNVtgiBP0eeHQJ+FUW7qzoWDb/LU9hBxif6KT69QIt9yY0
	 cjxTJIuBTu/3D9xXmpU8syaRGIpopIgfs+6yplVHaCi+tSwTkE1cROpnwb0SsMqumLfrv
	 5LeBh+EazHS3ptCZg4tZUpoBos7hOEIp1yYNOt8t6dRd05aTH40MO3a+9R5f8o7pLNBhY
	 zIBgRDty+gYoC80kpwt6zfnv6tSWyF3LH5nkEi10uYaHqfm25MwtuHDRzt/9jWpVbOgd2
	 3vphsf+/DjFyU5bwcoQsrWNxzdMtoK1KFzc6/xn/j5XXHYr7ZMG9pNYJUYBQD8vmiJQ==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=QY9dLd1m;
	dmarc=fail header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.23
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011023.outbound.protection.outlook.com [40.93.194.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5AEFA1F00A3A
	for <tools@kernel.org>; Mon,  7 Sep 2026 19:23:00 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=QY9dLd1m
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 5AEFA1F00A3A
Authentication-Results: smtp.kernel.org; dmarc=fail (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QkUw0m39ePBORUSRMF7yTYfw6e3unC0GE+0mWE1e7IMPuER2li89hzLHQyVPWB2tefInMKslrqCoewWx7NFnqjpsDeJ+fa1T+Fk3WuxLW+mviWGZ/CRRREkAHKkOTf27UWRnGWfS9+C9n2HzbtKuBQ+vwpBLGEJ7/sL09m9eSJog5WHH2i5XLKuSK2AcPtrJHUs+qa3w5g5dVjT+JxLUhN8jEsW8sUs14GNtnmEnzkB70iGXup0grkKIvyTZLqWThW9j5RktCptPkUq/1g2S1WfyFPZ79P4LNusoS1dxgZMouhGlu4WoPGbPQM5XLVZyEEwF+GxkAAJXmKfyxOpJvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K8MktOqC4quToPqgHS5VdjWP2yYxOCPNOSqaM8E4rf8=;
 b=WeDI93loiGDHW2nY6yEuKSvxE9NYqfGP/oqbfjhzE2JLmTTVFs3vnn6YAeheTBM7FH7tc39bStuGnR4HeHG0chV3GQwLhSybdde1QrgsXX2yGHaFme3dafdPzI/FeeR6FXW/lr4LM5Hd/xlnzVKkSkVE5dRswY7+mC8Cf/bOuj/e52AiuwvlWOxy7CFIy8cDCjdjruWlTdQl/86YLwwOHV2L+MkC5IrSSHxENtVOA46uqS2PQ9ZQOMjgHknioDY1q3lTroE3+sdjUrD+HC4y3KuM/hXIaK2UNxgHm8xScQzR6TklDXDa+R5aXEcNYCUy139zcy3DVkmxilW6Zk70aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K8MktOqC4quToPqgHS5VdjWP2yYxOCPNOSqaM8E4rf8=;
 b=QY9dLd1mp0kU9b4ojwLfOWE++t1N+nAo7+hs227riVohQSaLLDSryEFj2hdb0F+rngISOhNHbNDOL8ozr+r/QTP5mpckdsODoonnPmuCjS7vxDzQ6nrmtb0fofW/boNt+A+R59yJUJ0nw3OOVzE+WGUrNIfBkU+xBbR+foRIqoe5RQww19UwanTYmPEBvYUv8OT9wJFXsxQdHkFmr/6RgRGQ96+q16b2bSybjvUoNBUlztK0hcJ93PQNam17WhqMJ9GV89BSBInECR2euZYG5O1btriFVyKVEGvX1NZu9wvFwpox/VZmBXBJMuh1viiosswItAQXHSt5IMRRosnxkg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by DM4PR12MB5844.namprd12.prod.outlook.com (2603:10b6:8:67::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 19:22:56 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%4]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 19:22:56 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: tools@kernel.org
Subject: [PATCH b4 v2 2/4] review: discard blank lines between | and > quotes when trimming
Date: Mon,  7 Sep 2026 16:22:52 -0300
Message-ID: <2-v2-de162fd5fc4a+2b7-trimming_jgg@nvidia.com>
In-Reply-To: <0-v2-de162fd5fc4a+2b7-trimming_jgg@nvidia.com>
References:
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0006.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d1::8) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|DM4PR12MB5844:EE_
X-MS-Office365-Filtering-Correlation-Id: 51b5f0ba-c222-45ad-5014-08df0d156b46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|3023799007|10067099003|5023799004|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	s9J+Q9Fsqub68jWxFeR8lgMriJePN4a7wFipPCJOWB+IrbDeB1rETHTXBUSpbjgs7s9mBsWoVxBbaq2F8XfS+c9D22ZUXMSc3vEw91IcYdvIOK/+S5UpVWJUbX6Kt+y4XlwYy8P9ZeSdIqzPP4anTkisOYNHaq0jmnLOvgO9VskSRkKRmgsaAfUEH+F7GIdqhd8UpeZgzzdVeoF1YQUo4Zqn6mwMA8TWar1rJgdxH/Y3mpc0JYvvSmSSNL26ivWu+Kh3PzXlvkBcxWiag0nvw6jKXw7Tug1lconDdOc49uVJzfIhKhqUjf0c5Mfe3yvXPkiOBltcOJzj6992SmWxWlBSv/YdKO6Wn7ctkbM+hHVn4UmwkOWUQYv5saLpk3lUoNfuzn/rcx6Yy93NSx2KjmzLoKrho++0Bf11NuGZNlGeAG/qMzGbKQPAReb1dsF+iffMyfGRAtdlU9/lfOGC9HhQThJyHLHwNd3pDHePboozhLks/dtYq1mexVXau5sQ36SXlCgujLvKQm3+rQ8r+N+066HR/8uZOt3t3aV1e3owjMgvg4GaY0/Z1wQDrEkmihtOlIlkmMIZ/Os70J2VnKElZQWcPs4/+/670nCqKOU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(3023799007)(10067099003)(5023799004)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZFAwZ1NWV0xES0krMEU3UExHVkVaRzdweC9zcEt1RUFrcmNYTnRQYXZsTGZn?=
 =?utf-8?B?eDhvOGxuQTFXVlE0Wkx4bnNzN0FLRm1ocGdYUExvRVlXVzE3YkVCMVNHY0Zr?=
 =?utf-8?B?Q0lxWkYza3VidUY4T3pOMmdJSm5jS1RNcldqNys3amhGRjBpS2crSnJoQ1E4?=
 =?utf-8?B?WnFzZTNGa3lYNm5CVWxMaEsvTVBKakJxcVc4Vlo4d2pRblphUlpMSFdMaEh3?=
 =?utf-8?B?eE54ZkN4eEJnRnNXKzVrV2NZczZMeW03aVltRHF3ZXhGM2RneGZtdExJVGNM?=
 =?utf-8?B?b0szWUZ3N0lKV3IzSVo2a3hZSk52RDcwSVNERm1nR0d5YktwMVdnbHVzOCt5?=
 =?utf-8?B?TnNrNitKdkhOUDZQMXlybmtkZ2JHV20rV3pVTGFESWRnbEpNNDFOeGFPSzZL?=
 =?utf-8?B?Y0lZbnZ2amJ3b3ZkZTlNQThtTHhRMVcyVE0weEJzZFc4SXpYb3k5Q1VNb2lY?=
 =?utf-8?B?eWdPUTlYWitzenh6dTVEV2dVK1VyN0R4RjltL1dtS2FNLzBHdlJVNWQ2WjFs?=
 =?utf-8?B?dHNIUVZ2ZlVCTjZFb0FFS0pMbXQ2QTV6S1hGWkh2R2I4YW9odDF6L3dTTWhG?=
 =?utf-8?B?WXRrcEd6L0x5NDMrVnQyenZDZmprS3N3ZExUR1FDaTdkYzJxTFZnelB1VGZR?=
 =?utf-8?B?ZHhFNHZGQjFCSnRTM1V0NnQxZXVyWkFDOWVCNEpHQWtreTlFaUdpUCswVk9Z?=
 =?utf-8?B?T1JoVlBNUmdpRStHbEFoNGIxNDNSbnd5MkU3VlU1dVQ2UGFIdnJiM2FLb1Zw?=
 =?utf-8?B?bU05TGN2cWN1YW93S2grdWdYNjdkSU5ZdC9JTXpwaFRGV0pDYzRRZ2VGWi9L?=
 =?utf-8?B?bnNvV3BHdzlDWWNvTC9rTzRmS28wMnBVR1gxL1FlTkdSNW9XaktHeFd5V3dV?=
 =?utf-8?B?d1NtQ2JPSE9pV2lzcGtzL1hnN0NhdUI4S0VvS2F0R1VmYlZSTVNTd3Z5TUpX?=
 =?utf-8?B?dFhYaGdDSzhJeEdzbkU0cUtndkV2Q0JVSnpFTjZMR2poVDNndmNTdW9BR2U5?=
 =?utf-8?B?NzA0YmlUM2wxR1lTV21RbzdOcjdRa3hERXc1cWtrbHhoMlBJNWw5eWlyNERt?=
 =?utf-8?B?Q2x5Yjl3SHBpVTNXK1FXbTVoOU02bnlJcS9aVWdhYVBLRE9qVkFMam9OWVQ1?=
 =?utf-8?B?Um9ZM3dHNlhsWnd2L1EwOXlWZ0JKcGc4SUJ1emkwaGxjbEpFRzNnaERiN0dB?=
 =?utf-8?B?azV4RGhVSEZ6bVBQRVRJYXkvZlQ4dFhTY1dPbUpvN3lXYXdFZythd1JlT0hD?=
 =?utf-8?B?NDVGUkVJVENxaW5SRUxidTJZWUdEdExzUWJrQVhOYzZDYTh6dWpMdVhwa245?=
 =?utf-8?B?N0JtckxuWjVuZ0loUll6Sk5xVy9aSE5zUUxXZzhRdWFybEowT1c3RTRiRldE?=
 =?utf-8?B?OUhKNHFyakNJbmpFZUFpZ0tvczRjZWxscklzNjFUWXdILzAyKy81VTUyeGpx?=
 =?utf-8?B?bmdSVnpyRU12WlFrbEdIeUpPa1FmdTAxR21Pa0FzRDBKRDZaZVM2d0VOMGxv?=
 =?utf-8?B?dXRZRjE4SWJEL2E5VUNPVGcxN0tUa200SGhoUUFFRVBua05VbFEzR3diMU9T?=
 =?utf-8?B?ZXZWbGx5S1ZkNVBQOFFzS1JPREFiVWlOZGJSei9YOTRoM2t5YllOQ2RFOFFV?=
 =?utf-8?B?Tmt3anpmRnZHckZnM3hSdUxkbXNkSHR3UVBUWlBoNnNHaG56eUNOa3hZUGFK?=
 =?utf-8?B?bldxWUd4dGd1QWNlemY2ZWJMaEFqMUo3Q3NxWGRZbjNqTE9tWE81eUZoOVpx?=
 =?utf-8?B?TFY5U01ldk02d1NVUTdqYTZIb2cvMjNWQjNxZnF6RGg0VXMvUk42WVVockd1?=
 =?utf-8?B?RlBua3B3SFlicmlVSUNTN1FRUUNzMnRRbjFXRGZVV2k1a2V0a3lMZEtMekhW?=
 =?utf-8?B?NStCZDF0TWJUU3hmUlk4QmpxanpXV3JLK0RJTUdZbUZrUEY5ZnR4MlZXd0lG?=
 =?utf-8?B?THh2M3l1ekYyeVVTWGxEditQYzdVbzNzRUFDcWY2enRlOHRBa1BPYUNGbDc2?=
 =?utf-8?B?Q21tZ0MxZ0xrdGthbUdvT1hJSEIwczlncE81a25ycjBaY2ZmSHcySmRhTkhX?=
 =?utf-8?B?WlpqbE9aZ2lkZk9VaFZQWC9vb1JGVVRFbnlQeXVheFhoTTV4TnI1Q2I2KzdT?=
 =?utf-8?B?Q2tiUTZpRllublFmU3ZscXRjTFhNdlVkSFFUbnhnUVVEMUl1RXYzaERrQmJr?=
 =?utf-8?B?aFV4cnRMdjJTKzV1b2xNcTJaeGRwWWhIcG8yOWxGNEtONDY5ek11T01DYXcw?=
 =?utf-8?B?cTRkRk1GWWFPZTk2b2o4TVB6NTluUnZyMXQyUm9WMmRMUXl6RXlyS0ZIWjkw?=
 =?utf-8?Q?YrR8L8t9wa3oNvmaqe?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51b5f0ba-c222-45ad-5014-08df0d156b46
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 19:22:55.8116
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NqjXkoEwl27XAB4GPD4jVB4K/OG5jvRFNKxF7gh/jnMI7v7X8B8FaK4NyKJ20wBL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5844

When b4 constructs the email to respond to it inserts the | quoted (eg
sashiko) text in the > flow with blank lines between sections. When it
generates the final email it strips the | quoted text but retains the
blank lines it added. Thus the email ends up with random blank lines
inside the quoted text blocks.

Remove the blank lines along with the | blocks, being careful not to
disturb user text.

Assisted-by: LLM
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 src/b4/review/_review.py | 52 +++++++++++++++++++++++++++++++++++++---
 src/tests/test_review.py | 26 ++++++++++++++++++++
 2 files changed, 75 insertions(+), 3 deletions(-)

diff --git a/src/b4/review/_review.py b/src/b4/review/_review.py
index 96f3e5bbd54130..054be896053e87 100644
--- a/src/b4/review/_review.py
+++ b/src/b4/review/_review.py
@@ -3383,6 +3383,54 @@ def _sync_reply_trailers(reply_text: str, selected: List[str], identity: str) ->
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
 
@@ -3395,9 +3443,7 @@ def _trim_quoted_reply(buffer: str) -> str:
     maintainer left in place anywhere above their final comment is kept
     exactly as written; nothing is collapsed, reordered, or relocated.
     """
-    lines = [
-        line for line in _strip_instruction_header(buffer) if not line.startswith('|')
-    ]
+    lines = _strip_external_reviewer_lines(_strip_instruction_header(buffer))
     # Drop the trailing quoted/blank run below the maintainer's last comment.
     end = len(lines)
     while end > 0 and (lines[end - 1].startswith('>') or not lines[end - 1].strip()):
diff --git a/src/tests/test_review.py b/src/tests/test_review.py
index eb7e36c52eeebb..a2c8703024674c 100644
--- a/src/tests/test_review.py
+++ b/src/tests/test_review.py
@@ -861,6 +861,32 @@ class TestTrimQuotedReply:
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

