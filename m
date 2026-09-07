Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D205C4052AA
	for <tools@linux.kernel.org>; Mon,  7 Sep 2026 19:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=100.103.45.18
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788808987; cv=fail; b=P6n3RIfVJckUaqyFQ+lLvKioo8BSGSgirX4SPNYnmUKyz86jRLPOdm5k7PzOZmyjoOZRuXVMqqQQ7oSd5+YH9LVmSKTzp81LhTgPuSAYOQ6011SE9w+nxevPUMN3QGqRRO65+nTqi1+ekHw74eIDQz5jzkIW7xvHtTwcxNp3SB8=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788808987; c=relaxed/simple;
	bh=VG9QB2BNRdRHiRU0+llHlrC3a166PaTSTidzwNceyxA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=i6A+9kQ6ElbV6jn1Kg+Y3MU4WvPVdhjSs7MJcWYqbrUMoclS8zlgDQUdSFanhMQq7XyfWDmRVbYymG0BBrze84pbuGPQuXaTxqQ4nQHUEA77d0bRi6x5Jywd4QDGQbsYpg3+9HWUPpFC36HF3Lp2ss7g42PW0V/ULT4hCwnxLzk=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=K9BHwP7m; arc=fail smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="K9BHwP7m"
Received: by smtp.kernel.org (Postfix)
	id 867B51F00A3D; Mon,  7 Sep 2026 19:23:05 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.49
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1788808985;
	b=sjrbj0r5lo7NV4n/9oEBwlO84MwhJDmwlF3OHn4+3nrX6v7DQSizqxpdiEt0KyeI/SQn
	 6c6AGTDdp+qxAd1TntUIQcevylhiLMDLz6ozjhn2DF8BTQXj7MTARY3Khz5gJSTlgEwge
	 8uN2uEiRT2A+CUIAob9sLpm4cjWmuU5HfF66+CGdNSmBT8pMwrPcfSYMt0fHXmi8BJP1F
	 JHyO3mU8euHeTk/qrsRn/8oTLT6folv+qOAf8EMy1xd4jYh26FFWL05wEXapgPqndUIWZ
	 IL8wetOsdcTJRuFN9RHDSQf5ioQH9JVrlkhRFPbV5H83lmYdllO2Gnn92uefvD1EaLw==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1788808985;
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
	bh=yUb9sOJ7PEKQUYyGvSR8so6TtA3BScENl+qqFC7PWSc=;
	b=w2T2PHkpzEKW5ZigJ2x9sAYNLWg4tf10wrumHNyyvMVA/+h6kcXReKJnECsne5RR4Piq
	 vgIGT2C9FL8c2nLzBXpy56iAH6+qmrRpnWGg8nYTFf16H2u+LomT0BDYbFd09ATGToPP8
	 04tL+/jgU33eGx/Q2YMHRtltj5SJxdwU2OoYOZBhF/g7aokTvUpTOAVlQNNY3qiQAi79q
	 uzV9dmFyFaP5CD+Zm7XA1pu6VC33P14mjs7vS2BPgDJZ94zuSODFqg2ugFRhFrBvUe1fv
	 ZRdsW4WxKGS18xU/QXxb2D4V5Vchi0M4EKgnyZh1jCnpDrq+rjkPDENWmhY9QShSq/w==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=K9BHwP7m;
	dmarc=fail header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.49
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011049.outbound.protection.outlook.com [40.93.194.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 23E521F00A3A
	for <tools@kernel.org>; Mon,  7 Sep 2026 19:23:03 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=K9BHwP7m
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 23E521F00A3A
Authentication-Results: smtp.kernel.org; dmarc=fail (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ngNnzy8uTsUgDaDHM54276HhiKlOcxHHprtZNNKkQnQl89OQInD9gWRIoDFS7hEs/gyF8h7ajsEcE5UUZSoZfCGWw/4o8ydPDttAIZKyG4IeH5tKxca2JWO1s0uXkImb859DzaWNF2+3ijox6S1FoKStZ8EJJ9W1Xz+PcsGNARyMRzvlzyr67fxKoRzCLM9XsyLau3l9odBJfQ7wOA55RAUW05s3fU0zR/Z3N6kl1xRIwoSMZWBZD8sWUXkXkonwsL2Ooabk/Mlwv8HxgxsTLNYvKCS9v+DoZ52EAZWWQk59iN7YzA3G//bSB8pF8Fl2dbpvFZ1fSh77JYqGKz8y1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yUb9sOJ7PEKQUYyGvSR8so6TtA3BScENl+qqFC7PWSc=;
 b=VCo37IFLQvACkImpIZhRCSLWVKl85FFxEDsXaVZjtWcr3XGewaxhVjgTe1eEmV5w0szShwXm9v8/rLYS7QI4reU+DQZzvzatBFxjsyTJNtSg5Myo7Nrmdp4QtNvgzzwzTfjoWMohn4e0ejv3hcv7p+7/XRrWRHeQ7e2+j7LxVx8r2j0yentYDSalrpCoAs4VATDppel6Cp3pmrk0knuqo5owWBJVFTDUg8FujYEhvq/XjJaqcxj6F3eyC0iz4zlKvLrrtQyIfXtVJApiUIdZ5wQ5hmFIjlaLCEXYXSZN+HafoDDEazYnLyoFWy9xx7fpka7LfyyjZqk5+lsiGVHcrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yUb9sOJ7PEKQUYyGvSR8so6TtA3BScENl+qqFC7PWSc=;
 b=K9BHwP7mGoQEEIYhEIWZ4+AqBrHpdwCcSsd5Wbe0OCuTX38VaSzkfEKqxhd8RxFkAEXaj5klptqUmHFZYNQyy4DxoizmmHRAsfcGIOYq/eaf45gwhwjL8fmtcItDJcDSWnGsm1lqgr4sGJuYxXLw6F855JRknf+gmEJouOer2HFilO4nciqSHHQD6iXP9Ps9q5tRMVefOMODLsCsFdmcz+LXd7aXw1RSwIKPO3wPhE+1Cs714xHjm9Ym+BsOdGupa1JllkupjRd2qk+wd4vqPI2VQXd821bLOkXh4lcB33v+7F5z6rc1usSZyh+VP8Gu3OGqVfbvcFq5PT7PjLhbLw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by DM4PR12MB5844.namprd12.prod.outlook.com (2603:10b6:8:67::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 19:22:57 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%4]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 19:22:57 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: tools@kernel.org
Subject: [PATCH b4 v2 3/4] review: add >--cut-- inline marker to snip quoted reply context
Date: Mon,  7 Sep 2026 16:22:53 -0300
Message-ID: <3-v2-de162fd5fc4a+2b7-trimming_jgg@nvidia.com>
In-Reply-To: <0-v2-de162fd5fc4a+2b7-trimming_jgg@nvidia.com>
References:
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0090.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:ff::16) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|DM4PR12MB5844:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c26e546-580f-41e7-200d-08df0d156c38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|13003099007|6133799003|3023799007|10067099003|5023799004|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ypw+lqH3GVk5Euqlzk88g2srZPIxO4R4c9ZZiCLejvwJAivHyaVgS6H2Ga2AfhfzS6s/W7rY4r2/GQo23OTuQk3XKajOhV3z6FW4MQJ9YPljxG/nsbjSMFhItgBkqlXrFcY864cUwCr+rvPFHZdsvc+KVCVY91tOJmJbdefJ4zlF1koq8TSdee0CsDfFBgzgDi5RWymwGLb6V2lJIyCBGrfPH2gI+ayeTi/JggpjpUCy7mtm2I04LnrWN15jGt9v4MLgZnPFyf/3o1dxlpdDA3oq6UQoU2gpD6f3ZLuq+qcT9YuI5vwgF/4mOLV+6DJOI4i1r5EUVb0+xCuv5xF4hmncL6DsN1hpcX5l8fZSDCP0D2zlc/gsxRV0b/UM802pgIYer3rRcGaHqksvA0b7v5lsvKuvhJvKXrEFr+i8CDNR4K4pKlDUA+BxPPcOBgBEqkCJqcc3o63xDlm9+HnvMEiUtR/YuCcMJ3UiLT6reinIV3RfWu5q5Qlk9G01a0TMcVSSikY/39ozcjhN5WeCgRjRiWMg7q2eQ772FwQriXTrbKnyHPVJ45L1lqUzzBntkaGYK3C4PXUgYzoFPYNcH1LmewnNZzkHkZ/q3R8XbSw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(13003099007)(6133799003)(3023799007)(10067099003)(5023799004)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ME5NUEJBOHB5WDBWNnVOZmxNZnJnNE44RDUyZXZlZmpHMmlOOGZURTlzcnBR?=
 =?utf-8?B?MVR1QmxEYVZEUHVXQlZxVDluNFNIR3RnU2tLeFFxUkJEdVB2SlkrbDFvL05w?=
 =?utf-8?B?UmRUS3I2Q0d2M3hKWldjRWYxR1VUZlRNOXhzd2lFU2Zvc2RWRkNlUU9aWEtE?=
 =?utf-8?B?TndsYnZ5eGVDSXk4bG1TbDBvbmFnQlFqUnZFVkZqNS9EeFNjY1B4RHdETWht?=
 =?utf-8?B?c2lPaXJ0cS8wNHQwSXhLcERsbHZMbmduZ1pBT0U2ZEVodE1iWWpQRllSL05O?=
 =?utf-8?B?QkY4YlF3VUhMMk95TjRKd3pua1dIWUh4WlNEaXpIeDdEY0MvVmxnZmgybWtR?=
 =?utf-8?B?cFdVNGtaUER1YUU3T3ljYUNGMVYvOUFPQkdpakY1QnRlZmhWYStDNEhiazEw?=
 =?utf-8?B?UDdKbFo4ZWdHaEZNNmJlYTh5Ni9YMjN5a0NOZExBdVkvK1B2R0ZSSFRYSlBE?=
 =?utf-8?B?K1VmdzBiWkhyU1NIUWh4RkE5dXJQK2VBSVZmMml2VXFGYU0xZlp6b0RJU3Qx?=
 =?utf-8?B?RzkyQUhuSjRKNmxFSy9qZ204ZVArUE0xaWowY3dUYlBEZ2NaRkZRUTRRZDBn?=
 =?utf-8?B?NUVIYlhwclVOTER1ZVhIRllRU1dDcFhlMHhWYVVMUzFQTTBIby9Zd2ZMYlF1?=
 =?utf-8?B?NklJTXRWUkR4bVk0dXpROUlOK3BCRHJaMkkwOWhZcDZidjJxd0xLc0U5WnRm?=
 =?utf-8?B?SElLeTVCVmNlTndGdktmNXN3ZEdocC9yS3ZnMWp3cnJNZ2hBQXZGOVJ0RzRa?=
 =?utf-8?B?NGF2SzE0Y2hMaE9WVjkwSGlJUFBabm5uWTFjZE9KQTAxdmQzUk9NYnF6UWg5?=
 =?utf-8?B?TVdjMmtzb3ZzcFFlb213VnhDNFh0ZHo3MUFYa2pTRXNzSkl5dkFTbXJFUzZ6?=
 =?utf-8?B?L1lLVEdKZVdiSHRrK1BINGkxNmRZNVR0OWlrVWd1aXVKek0wNTNsUmhBcUxF?=
 =?utf-8?B?M3cxYjdsYnBIcFBibzVDbjc2QUM4VkxmQVptelRjSDFENWFBOGEyaFRvTjJp?=
 =?utf-8?B?UFNPd2EzYlpITlAvZ1ZsdDdVQ0plMDJyemx3Y2FGNTJsN1NBWUFmRnpKajZx?=
 =?utf-8?B?MjBVYlppanJzQnZ4NUVVMVJGUlB5SnRMcnpySWRDeEVVUXBJMGJ4OFhPUEdD?=
 =?utf-8?B?UW1GWEdZQVFpeXlvSENPUUU4Y0h2b3MzQmhPRldEZVlBYnRQSzJzcnZBRUx3?=
 =?utf-8?B?cFBRMUdYZEcwUDYvQmRmeC92SFNXcVBVa2taeTh6bDlRY3ppOEtqN0dmRlli?=
 =?utf-8?B?U2o1RTZyeFh1dmpINmVBRnZjMTBodVh0eXh2cXZKS3hjNG1GUlNMWSt6VXE4?=
 =?utf-8?B?NGluY2VHa0syZUh0TVQ1ZnBiS1BoV2FwUFlHN0pCS01ncmE4QUpPRm53dUk2?=
 =?utf-8?B?cjJlQ3dqTEszNksyQUhNaXZjcEI4cjhqVkl0czFLeDdkTFJROEFqbW4xeElS?=
 =?utf-8?B?NE9yQjc3NGcvVnBBeE1FeUJGVGxIUU5UdkRaclFnaW1wNDJFVHJ4S2tnWGps?=
 =?utf-8?B?K2wrTjJxSG1rNVpPRStFdlY0YnRReTNTSzRpc3M5VEhkdlRnWklZQXhMWlQ1?=
 =?utf-8?B?RnNGSWpBWEp4NVpyWitDOWNhR01PQU4wdG1LckU3NTBJaStZdndxS2hTTlIr?=
 =?utf-8?B?dUtjek1uL0tKcjIwU1dYQ1NuVGtkN2piOUptM1ZRL25zdmJKUWExZytpNU4w?=
 =?utf-8?B?L0piRXhaM2tOWk9NV1lubXU2bXpNb0hiOTBEOTg4WHo1djNCRXFQWVJPdVVB?=
 =?utf-8?B?TERJdEtPZnVpSjU2SXE5T0t1eXNjWFJpeWNsUk0yM2hkcThLQnY2aHNETWtK?=
 =?utf-8?B?alZ4NjEweHF0dVUyRllCeVZCZGtSbjRJRklXTXRlcmtuN21nM1NYTVhXVDlm?=
 =?utf-8?B?ZzhwdXVWZExycjNpMDlYY2F2cGhUajFmTDh1V1R6Ymw0ZlVXL2NZSnF2S0gx?=
 =?utf-8?B?NWQyTDdpYjZXRllIQVJBdFhQclNYN3IwQW0wNnQzcEt0ZWd6OGllZVNkU2pO?=
 =?utf-8?B?Vm1TbEI2Q09rY09pWG8zT1BCQ2Vydkwyc3NxMCtiVWxxcUVJVldiWm1PQ3pp?=
 =?utf-8?B?aWJYbUhsZzY4SWFnd2Z0V1JwbitwSGVWSGxoSzlCRHBDQVhzUHlaYmpCN1hP?=
 =?utf-8?B?bkEzSWw0Z0k2b1FsSWo5ejhuVmVLVkFKc1I5WHdjeGQxdXFJLzQwU2NMeGR0?=
 =?utf-8?B?dGhsYlFvV2VRdXRvUXptNWwrTFdNa1I5dnB3ZE1UQXlaamNzVFZ2RWRXNTBr?=
 =?utf-8?B?ZG41SThMbTkyRlhoK3BsWXlVZXNsS2VOQUJEdGs1SUZMZGZ4OGJ6TzBOM2Fo?=
 =?utf-8?Q?4mUzyFxNvGwGTetn7v?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c26e546-580f-41e7-200d-08df0d156c38
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 19:22:57.3325
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nc3Si1pBEpnSBlRKAT0mBKT6npPZ1f9hJcvR3VPLn+VZ7jzwSKU+7iGVSGz2sstw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5844

When adding review comments to a message it is very inconvenient to
permanently lose the quotable text. Often I will make several passes over
a series and the nice b4 behavior of keeping everything in draft
encourages coming back and making revisions and further comments.

However, if the quoted text has been erased that isn't possible.

Instead of erasing in the editor provide a full line marker '>--cut--' for
b4 to automagically do the trimming similar to how it trims unused quote
at the end. Trailing text after user lines and till the marker is removed
similar to the trailing text.

This way the message can be sliced and minimally quoted appropriately with
no loss of quoted text. Everything can be selectively undone by the user.

Assisted-by: LLM
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 docs/maintainer/review.rst       |  24 +++
 docs/releases.rst                |   9 +-
 src/b4/review/_review.py         |  82 ++++++++--
 src/b4/review_tui/_review_app.py |  10 +-
 src/tests/test_review.py         | 257 +++++++++++++++++++++++++++++++
 src/tests/test_tui_review.py     |  69 +++++++++
 6 files changed, 431 insertions(+), 20 deletions(-)

diff --git a/docs/maintainer/review.rst b/docs/maintainer/review.rst
index ca0632696b1b0b..7ac39322ea2b0c 100644
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
+    >--cut--
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
+quoted flow, ``> >--cut--`` is accepted as an equivalent spelling.
+
+Hand-typed markers and the Vim/Emacs commands produce identical output and
+coalesce with each other. If a plugin-generated breadcrumb is immediately
+above ``>--cut--``, its recorded count is absorbed into the new breadcrumb instead
+of leaving two markers. This works in both the main review reply editor and
+the follow-up quick-reply editor.
+
 *Vim*
 
 Copy or symlink the files into your Vim configuration::
diff --git a/docs/releases.rst b/docs/releases.rst
index 4bff1b05645728..2b16efb72d7ace 100644
--- a/docs/releases.rst
+++ b/docs/releases.rst
@@ -40,6 +40,14 @@ the full reference.
 Several notable improvements to the ``b4 review`` workflow shipped this
 cycle, building on the v0.15 foundation.
 
+**Inline snip markers in review replies**
+
+In any editor, put ``>--cut--`` alone on a line to discard the run of quoted
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
index 054be896053e87..0674bced0d5640 100644
--- a/src/b4/review/_review.py
+++ b/src/b4/review/_review.py
@@ -2028,6 +2028,9 @@ def _render_quoted_diff_with_comments(
         '# trailer (Reviewed-by:, etc.) you place inline. The only change made',
         '# on send is to drop quoted diff left below your last comment; quoted',
         '# context you keep above a comment is sent as-is. Trim freely.',
+        '# To discard a run of quoted context without deleting it by hand, put',
+        '# ">--cut--" alone on a line -- everything quoted above it back to your last',
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
@@ -2122,10 +2125,10 @@ def _extract_editor_comments(
 ) -> List[Dict[str, Any]]:
     """Extract comments from the quoted-diff editor format.
 
-    Strips the leading ``#`` instruction header and external reviewer
-    comments (``|`` prefix), then delegates to
-    :func:`_extract_comments_from_quoted_reply` which handles the
-    ``> ``-quoted diff with unquoted comment format.
+    Strips the leading ``#`` instruction header, resolves snip markers, and
+    then removes external reviewer comments (``|`` prefix) before delegating
+    to :func:`_extract_comments_from_quoted_reply`, which handles the ``> ``-
+    quoted diff with unquoted comment format.
 
     When *diff_text* is provided, runs :func:`_resolve_comment_positions`
     to correct diff comment positions when the user has trimmed quoted
@@ -2133,12 +2136,9 @@ def _extract_editor_comments(
     message), runs :func:`_resolve_message_positions` to re-anchor
     ``:message`` comments after editor re-wrapping of the quoted body.
     """
-    filtered: List[str] = []
-    for line in _strip_instruction_header(edited_text):
-        # Strip external reviewer comment blocks (| prefix)
-        if line.startswith('|'):
-            continue
-        filtered.append(line)
+    filtered = _strip_instruction_header(edited_text)
+    filtered = _apply_snip_markers(filtered)
+    filtered = _strip_external_reviewer_lines(filtered)
     comments = _extract_comments_from_quoted_reply(
         '\n'.join(filtered), capture_preamble=True
     )
@@ -3285,6 +3285,8 @@ def _parse_reply_trailers(buffer: str) -> List[str]:
     return [lt.as_string() for lt in found]
 
 
+_SNIP_MARKER_RE = re.compile(r'^\s*(?:> )?>--cut--\s*$')
+_SKIP_BREADCRUMB_RE = re.compile(r'^> \[ \.\.\. (\d+) lines skipped \.\.\. \]$')
 _BARE_TRAILER_RE = re.compile(r'^\s*([\w-]+):\s')
 
 # The trailer names the TUI trailer menu offers.  The menu (and
@@ -3431,19 +3433,65 @@ def _strip_external_reviewer_lines(lines: List[str]) -> List[str]:
     return result
 
 
+def _apply_snip_markers(lines: List[str]) -> List[str]:
+    """Resolve standalone ``>--cut--`` directives in a filtered reply buffer.
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
     b4's own scaffolding — the leading ``#`` instruction header (see
     :func:`_strip_instruction_header`) and ``| `` read-only external-reviewer
-    lines — and to drop the run of quoted diff at the very
-    bottom of the message that has no comment after it, the usual courtesy of
-    trimming quoted material below your last reply.  Quoted context the
-    maintainer left in place anywhere above their final comment is kept
-    exactly as written; nothing is collapsed, reordered, or relocated.
+    lines — resolve any standalone ``>--cut--`` snip markers — and drop the run
+    of quoted diff at the very bottom of the message that has no comment after
+    it, the usual courtesy of trimming quoted material below your last reply.
+    Other quoted context the maintainer left in place anywhere above their
+    final comment is kept exactly as written; nothing is collapsed, reordered,
+    or relocated.
     """
-    lines = _strip_external_reviewer_lines(_strip_instruction_header(buffer))
+    lines = _apply_snip_markers(_strip_instruction_header(buffer))
+    lines = _strip_external_reviewer_lines(lines)
     # Drop the trailing quoted/blank run below the maintainer's last comment.
     end = len(lines)
     while end > 0 and (lines[end - 1].startswith('>') or not lines[end - 1].strip()):
diff --git a/src/b4/review_tui/_review_app.py b/src/b4/review_tui/_review_app.py
index e1082e94c54f4a..d7a6bda1c3b4e5 100644
--- a/src/b4/review_tui/_review_app.py
+++ b/src/b4/review_tui/_review_app.py
@@ -1850,7 +1850,12 @@ class ReviewApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[None]):
             orig_author = entry.get('fromname', '') or entry.get('fromemail', '')
             body = entry.get('body', '')
             quoted = '\n'.join(f'> {line}' for line in body.splitlines())
-            editor_text = f'On {orig_date}, {orig_author} wrote:\n{quoted}\n\n'
+            editor_text = (
+                '# Put ">--cut--" alone on a line to discard quoted context above it\n'
+                '# back to your last note; b4 resolves it when you send.\n'
+                '#\n'
+                f'On {orig_date}, {orig_author} wrote:\n{quoted}\n\n'
+            )
 
         result = suspend_and_edit(
             self, editor_text.encode(), 'reply.eml', topdir=self._topdir
@@ -1872,7 +1877,8 @@ class ReviewApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[None]):
 
     def _send_followup_reply(self, entry: Dict[str, Any], text: str) -> None:
         """Build and immediately send a quick reply to a follow-up message."""
-        msg = entry['lmsg'].make_reply(text)
+        reply_text = b4.review._trim_quoted_reply(text)
+        msg = entry['lmsg'].make_reply(reply_text)
         try:
             with self.suspend():
                 smtp, fromaddr = b4.get_smtp(dryrun=self._email_dryrun)
diff --git a/src/tests/test_review.py b/src/tests/test_review.py
index a2c8703024674c..c8ff5136bc4595 100644
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
@@ -888,6 +894,257 @@ class TestTrimQuotedReply:
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
+            '>--cut--',
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
+            '>--cut--\n'
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
+            '>--cut--\n'
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
+            '>--cut--',
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
+            (['', '>--cut--', 'My note.'], ['', 'My note.']),
+            (
+                ['My note.', '', '>--cut--', '> quote below', 'Another note.'],
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
+            '>--cut--',
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
+            '>--cut--',
+            '> kept after first marker',
+            'Adopted reviewer comment.',
+            '> second run one',
+            '> second run two',
+            '> >--cut--',
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
+    @pytest.mark.parametrize('marker', ['>--cut--', '> >--cut--'])
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
+        lines = ['My note.', '> quoted', 'Do not treat >--cut-- here as a marker.']
+        assert _review._apply_snip_markers(lines) == lines
+
+    def test_trim_composes_scaffolding_snip_and_trailing_quote(self) -> None:
+        buffer = (
+            '# instructions\n'
+            '| External reviewer note\n'
+            'My first note.\n'
+            '> old context one\n'
+            '> old context two\n'
+            '>--cut--\n'
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
+            '>--cut--\n'
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
+            '>--cut--\n'
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
index cd808ec8b7bf63..5124842b6c914b 100644
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
+        assert editor_text.startswith('# Put ">--cut--" alone on a line')
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
+            '# Put ">--cut--" alone on a line to trim quoted context.\n'
+            'On today, Reviewer wrote:\n'
+            '> old context one\n'
+            '> old context two\n'
+            '>--cut--\n'
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

