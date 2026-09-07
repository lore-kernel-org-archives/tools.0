Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD9F3F6C3B
	for <tools@linux.kernel.org>; Mon,  7 Sep 2026 19:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=100.103.45.18
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788808981; cv=fail; b=HZMKxt/7sJ/YiwoOrYM3DdK7QDTePEpMLhmWMVPr5wK5gGK7JSW+wLO3duriK5fNVVXlzLcMPVowS8BHyRy30nx8+J1E8au5JJIPn7MiBa+uefIo9B0QrlvMRV8ZePLoxRfuA0yZO8FaF+y180p4cywgkPBYquIwRBUgIHmpqdA=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788808981; c=relaxed/simple;
	bh=6Ynef43J7slHgWdtHLM7UlMIc/TGV/P9TVHYzgvLTAE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Rsa+PgLFlrMqQDreAuy2tCYKUL6S/yHiQwn0CHE7Rt4mu6QcJqIybb1jzuHNuP4f2pnTr7UmbQ2ECn1JYqZ9Y92mBQQz3WxsE/mIBVtlBODIruN6DKOPZ9f2wJBKMm9CmlcRmga9AHQtR/Fd6fSsJGMFoVNGXkXyTjm6BGurEsE=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=TEUVZ+uW; arc=fail smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="TEUVZ+uW"
Received: by smtp.kernel.org (Postfix)
	id 4274C1F00A3E; Mon,  7 Sep 2026 19:23:00 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.23
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1788808980;
	b=oNDL5bQ0jL5ow8ohqwa6+7+BlLvfxfIiOCjEAo8KYZMwOoqzzrtEfdxUALYL1leWheNU
	 4tR+2LhgQw4+DN7U8TvhdAQfKTmKgrvECin4Oy1F37VSDDeljw/WUTH+bFRQUbtXFXteV
	 KbfMuqaKxkLYxxd17VUOjuxw++oeqJhgzpiZEZp5t5Avdvnku0lNriOdwregKxahxncDX
	 V/BZ7Ty5bBZaZyM9Dhm7F+ADmpSn7v0vbDQXLnA82V44SS9nnQWlYFAFVQQI3Q+7SQv9A
	 O0+LfUVQQOMnfRsx2C+V69PdLrjK2DV3+9wsGRg4n7lSFQCBo42g5sWa3WrGToCYlrg==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1788808980;
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
	bh=BIE8nXoNKINCJk5PXi6bVsme8uRO1arjPnymFs7TzV8=;
	b=tMgqLT1ZPJEHME60Qt5ICPB7Q05rXdLVwE8gP8IgNZehGzBTGmn5o2f9JA5n/1o1us6/
	 yQi/VIDeiAjptEEq9q6YlN8Udu8PxCQwj9TT0omJKgik/5UonA4DtBwbkJ2v6o2Bo41gq
	 uQe3G2eMseHCVap3B51NnDcl+sKLbaPWBgo8GFVrVW7LRL/IV3b+sTdVApDZ4umPCydYk
	 ztiSOfHViVfFA1T/GCqyrLJGRsqj/u3oNPqRNaSh92p8EpE62ng0yHJfdysrwPRA40V7R
	 3s1h3djgq7L9ovl8yVOa6H9VZnegDtc5MjGQ+yfUPTn3eUf5TC+OaRmWA1qzqCILJfA==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=TEUVZ+uW;
	dmarc=fail header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.23
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011023.outbound.protection.outlook.com [40.93.194.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8749C1F00A3A
	for <tools@kernel.org>; Mon,  7 Sep 2026 19:22:59 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=TEUVZ+uW
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 8749C1F00A3A
Authentication-Results: smtp.kernel.org; dmarc=fail (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QfRzsWiULz6yzIaLTW/r17Df8FQDaGhPcToXGcfK8CjU4qLZFb6KYRT4y1g15anC71C7V8E8B4F+7t8gmE8ZZHJSoUwVcLUcZs7TKNIH3y90HKrJLaOeVdwpSogtroZK6HJ/eZ2IppgB2ch94yO8jLGQCwfIn+z2gsz1DL8Nmi7OdIf/YhVcr47/mLe7WZ1IvFgDgjrMnDGU3qb177DJK0U0Hcpm6YI1c+tTIXdSClqHe2Cj8k+8IaC35J9HyStHMq6z28BWhb5dkP+993lqcZmP1yiTRI28DLSH4jIhiNekjWasK7cklKTqWfdsZm2fOR0S4Ap2jID3FPMfC89m0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BIE8nXoNKINCJk5PXi6bVsme8uRO1arjPnymFs7TzV8=;
 b=e6hcMrG04O3/SgO/zQZe7r6kT7dEhiCMFz60p+4W/7k/c5nmTvGG+JJlHmh2h6SHXolvbZcPUyxv0YaR1vHoJ87U/ublvEPi18rn+Y2NsmTTP2UEzwE5UYzkMqcXc8RK/2GG1nCl7EIU90KRMFCdZK4PdTyf7M+QC1VLuzBNTpID3jbE4e7AjJ6HJLJGVl1JXfbOKDh6UqPjit5VZwykHNKnLEVHP8V6qEGGV1XwBv9jVxvPUs/1nHkMywiP9xHqrP6ZXn/8WW+3AaPVMuGWwpvhbLdVKBRiw4ATrA7xlWCLTShxa29IfBaE74mHCFjJG6UhUZPoGMpS4Fiyet1F0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BIE8nXoNKINCJk5PXi6bVsme8uRO1arjPnymFs7TzV8=;
 b=TEUVZ+uWzpAd/IQgIaEib8ofh955T0DKcAYcIujO9Vm8szOnR/KHeuJVtLUsfus19QA1hM22QfvD/lCofJU44Va7OS5U/5DqWo/zKNIK0gN9jTU+uFQ5PlXSqAbykkl6FnuUd8JhUH2uxkBE22xYTr5LAXRFCx/nYYHY8DKegNLUaSv2lIoGegryw3j443F9ZP2WboS4wJM2VHD0cWSAys+ACtEazPAR8qIcCgTG04hNARrmVbU/c8NemaCpcV+biDvkzXqaU/BkW73eAV3vye2h+PPMoM+fpUUXWDS2Q25EBRKWRXSIj3QForSnc+O06US+dZHoG7WiA1X01Vg8Yw==
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
Subject: [PATCH b4 v2 1/4] review: trim trailing quoted when adding a tag
Date: Mon,  7 Sep 2026 16:22:51 -0300
Message-ID: <1-v2-de162fd5fc4a+2b7-trimming_jgg@nvidia.com>
In-Reply-To: <0-v2-de162fd5fc4a+2b7-trimming_jgg@nvidia.com>
References:
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4P288CA0031.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d3::9) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|DM4PR12MB5844:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d864b4c-67c5-4d9f-8a33-08df0d156b36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|3023799007|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	eMZqutzqZXgpX2ZtfOs38MF5mbfr9G7dgqsi0EhYXr3+iRiI1tds+b4YQoBXr1OClLm30TJQM8Yqxr6NwRyvqYN1MxuqoJDXwn5TlM+RnwC1NAHObUEhNe7ZNRtW8VINr2E2mlo6Wca+LJb4I2eVw/Xo5TIzqS65FvBDajAKwDvGqkfg1O49zFSUu72CeeBxhLQ7r3aRgT5sBMh45F80xHqiEnYFZreS4oDGY9rOTLFHP8aZ2qGB9C68J/ldeg8FkXHWsSMU/SouYn5Nn/ZKI+Fh0RCCT+G7Olnv/hSLQAEfhl08Wo7X4JksCg7CquxJA2+BgdX99QCVFSafJfLOmj0RdPqsqV4R5vCZMtPe7s8H7sNUvhCJt26rJpL4A4Xun593kwl2sCUj1/YqFxZuZaUPpqGGbx6vxxNFkUgRLI+xNGGmqEe7oDBiZyvL79a5KFYqgt+jMtXiArZNxJRHKFffDLtaifIN6eewgwVxwRfNkpkOQxTC+1ePEcYWUe5xQBCDLs+hBSkZaUWJ7yOhBjUjUFqrmmbXdep6TIcwD1fdaI5nj70KWpUpkaVDP4aRAZ9bVWxKGfztvlodXIPaoGslPRR11AqFeSLrxbrs/49G0vgT+dxG+/3xnGfjhvdAcqcxxs3oBSvK3CwELwNTJQCefN3jfV4ulVgS/RKhXl0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(3023799007)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dWo2QkVoSXJsVis2YlhwUlRKR2JtajJpNFdUamV0ZEV0RllzdC9MYTA0MFJy?=
 =?utf-8?B?Wmtubi9xWmRpSEhERVZEUGVOc3lSdGNBU29sS3JobER6b2dPNHYvdFpGYTB6?=
 =?utf-8?B?bXhmYzJqZmhKWXlUU0s3dHdGcHNzRmo0THZnais1Q1E3ejh1MTZBS2MwSDlH?=
 =?utf-8?B?eExLYUZPQXkzRE55Rk9aUjlWSnVUaXhZNG01RVRkM3dEdGlRelk4U2huNEVo?=
 =?utf-8?B?VlpoWUVFRUxObENSb0tkcG02NUhNcS9IUUNVbzdiemNmYVVRWi9Pa2dhREF2?=
 =?utf-8?B?OXVvS0tMQXdIV0ZnUWxQSmRiaEFnbWUrMGlpU1hZV1FyMGdKazkyNittaTRE?=
 =?utf-8?B?OWcvM0g4OXRMeUxFVGRiSS9nKzM2MVgwdVNQM0pBWmFLUzZiR1FDRkhiSnVF?=
 =?utf-8?B?YUFLR2JndXB6NmRJc1E4NVRUcVlSbk41L1dpRWl6aW1uV1hkUTF3SVdMREx3?=
 =?utf-8?B?cG41N2RxaGE2bEVrYS9NSnE3cUFYWS8rcW56dGdWaktGb05wWjJnTnI1bXZL?=
 =?utf-8?B?SnlQb1JLQ3JJTTR3aTJHdlhIQ3lkYjRRclZackNmOFB0V0FOMDg4SjZ3M1hv?=
 =?utf-8?B?a0VQRUtXVHJrdnlSaU11K0FYVzlWa3JQbGFtNmhKYnlCRGF2SVMyN3dpNm1V?=
 =?utf-8?B?eUdUNVdFZjVCWVVDNWs3SUFxL0xvVkQ2MUYvV0R4TDJqZDJwQ2Mxd0pRdGhm?=
 =?utf-8?B?N09UOHRLYVJ5ZXZLUlo3cW1iakM2Z2xHaUdzSHNZSklLU0RuczNqT1ZHUHJi?=
 =?utf-8?B?NVV0K3FBR1dYZlpQSWVETXJITGtyM3pTNnFaY2ppYmhVV1JkZXlKNTNGeE5S?=
 =?utf-8?B?R0psa3Z3WUJUdW5qemNpeFVXekhEanFlWGI4UjNqeTN6T2E2cERSbU5DdUJR?=
 =?utf-8?B?dEJaRU5KWlRHWEhsU2hVOWZkaWFaNi8rY3NzT1RIUjdOcCtRMU9Dams5em9M?=
 =?utf-8?B?ZVkvK0tzSEJkRWpxL05La2YvZGtQWmFaV3BGMVdUMmdzWmQ2Z2RwYzFtOVFW?=
 =?utf-8?B?UDVtdElXSFdCRExnS3AyMzRvMFVxeEcrVW1yMWkwUWxyMXhkSW54bkdYZk02?=
 =?utf-8?B?QUIraFVKY2ZKQ0VHdFdGdjJTQzJ2MmUwL2owZGVnVjhhU0k4NGxnRWg2OGli?=
 =?utf-8?B?ZlJvMXBOYXMrUk5MTGo1RkpCNytmY2dUaWhiQ29uakFCd3crRVQzRnkxMk8x?=
 =?utf-8?B?UXhka0h5ZnUvN0RUZmdXR3JnaTZFZCtSU3doakh5RkUwKzNCdm5rV3liS3o1?=
 =?utf-8?B?dG5FS2lEaGNQc0lidVo1YU5WWUNIeEtPQWp4eUxiMnp4WGdVYTdZOC9xRWNt?=
 =?utf-8?B?ekgzODYxMURhd2JiNCtraDBUdHg0b1lPRjRDNVZJKzlMSFlQVUdnRnMrdlhq?=
 =?utf-8?B?TVVNNzllb0x5YWJjUXlLbjV3WE9relZPYW1malR3VWJhcU1jNkdWc05aUzUv?=
 =?utf-8?B?Rit1NW5HU2g0RFAxdFA4S2pvNEt5Y1lRaFZEKzZaVnd5dnBuckNBS3orYVhl?=
 =?utf-8?B?YTlkcWFOSGUrVDg0alVtTmx3b1ZWeUZuaGwvMVdNTnBELzVqdmVOZC9KTWJq?=
 =?utf-8?B?OW1GWUtQWW9jcm1XdG1wOHZ5VmtPQ2xhSUc1MFVHZlFmeWZRWWtSOU1iaGlp?=
 =?utf-8?B?cGJhTkdlSHByTUd1aEwweFNwQWYvY0diMHdGcmJ4TFlpN0lDY0loSHF0Y1J2?=
 =?utf-8?B?N21XbFFBeEpQV0ZDeXR6U2ZlS3BBczVDSTRlTUJFT3dvQUpPcnNwbjE0VUc5?=
 =?utf-8?B?eHMwcDZMbCtuc3g1K3c4NnVpeW52SUV2d0daMDBNNVZDMDhGM0h2cW9HQ1Ux?=
 =?utf-8?B?QTBjckw2RlZTZmR3U0hFaS9sbUpSbjJDYkh1VisyMzhhb1NkdXN5WWM3M2w4?=
 =?utf-8?B?Qm9PZE9hcmRIRVgyK0VTUGRrVzQwb0paWUhsdWwzbTlCajE2cHVXc3pkUEFM?=
 =?utf-8?B?UFYyTXZHalloMzVDeG44c21rQnpaTTZ3eHNHWUp5WDh0UCtQS24yUnJTR1Bz?=
 =?utf-8?B?MWNZL2pXUXYzUkg5VzgyT3NRR0JCVGFmMUFYaWR4UUpFeXUyTXA2dFhFNnRp?=
 =?utf-8?B?ZjA0NHZMcmVTOVRhWXp5TnFQNmhRY2JadmYyRC9LRFRjZTZDakpCQTBmanZ4?=
 =?utf-8?B?eld3eVNRY3hMUFlRRTdoN1RGRGtpNExmUlltVjVzSmwydEFSMm93QmM5K3Mv?=
 =?utf-8?B?R09nOEsycUpqWVNDcnNZaXRYRTQxSTlld0ppOFZON0QydkJSOWJOWERjdHNw?=
 =?utf-8?B?ekE1bmcxWmNLSXI3WU1JVlU3dDRGbmMrM0RjcUhhczRQRDRnMlB4a05pa1F1?=
 =?utf-8?Q?sSDF5dEXqMB283YU6H?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d864b4c-67c5-4d9f-8a33-08df0d156b36
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 19:22:55.6934
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TGGOKTV8xGEd1AK9AGWBBiAVsV1z1eaze+KfuZyeAhhx+ERpmp4CTMtT+FO8nult
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5844

If some comments are added and then a review tag is placed the trailing
quote that is normally trimmed is instead retained with the trailer
landing at the end of the message. Instead place it right after the last
user comment. Skip both > and | quoted sections.

Assisted-by: LLM
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 src/b4/review/_review.py | 18 +++++++++++++++---
 src/tests/test_review.py | 34 ++++++++++++++++++++++++++++++++++
 2 files changed, 49 insertions(+), 3 deletions(-)

diff --git a/src/b4/review/_review.py b/src/b4/review/_review.py
index a37533230f484a..96f3e5bbd54130 100644
--- a/src/b4/review/_review.py
+++ b/src/b4/review/_review.py
@@ -3297,13 +3297,25 @@ def _insert_trailer_in_reply(reply_text: str, trailer: str) -> str:
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
+        head[quote_start - 1].startswith(('>', '|'))
+        or not head[quote_start - 1].strip()
+    ):
+        quote_start -= 1
+    if any(line.startswith('>') for line in head[quote_start:]):
+        quoted_tail = head[quote_start:]
+        head = head[:quote_start]
     while head and not head[-1].strip():
         head.pop()
     # Separate from non-trailer content with a blank line so the trailers
@@ -3311,7 +3323,7 @@ def _insert_trailer_in_reply(reply_text: str, trailer: str) -> str:
     if head and not _BARE_TRAILER_RE.match(head[-1]):
         head.append('')
     head.append(trailer)
-    return '\n'.join(head + tail)
+    return '\n'.join(head + quoted_tail + tail)
 
 
 def _remove_trailer_from_reply(reply_text: str, name: str) -> str:
diff --git a/src/tests/test_review.py b/src/tests/test_review.py
index 460cfb9b65196d..eb7e36c52eeebb 100644
--- a/src/tests/test_review.py
+++ b/src/tests/test_review.py
@@ -909,6 +909,40 @@ class TestReplyTrailerEditing:
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
+    def test_insert_before_trailing_quote_with_external_review(self) -> None:
+        buf = (
+            'Please fix this.\n'
+            '\n'
+            '> context before external feedback\n'
+            '\n'
+            '| Bot <bot@example.com>:\n'
+            '|\n'
+            '| An external finding.\n'
+            '\n'
+            '> context after external feedback\n'
+        )
+        trailer = 'Reviewed-by: Me <me@x.com>'
+
+        out = review._insert_trailer_in_reply(buf, trailer)
+
+        # The external-review block is scaffolding inside one trailing quoted
+        # run.  Adding a trailer must not split that run and make the quoted
+        # context before the external finding survive send-time trimming.
+        assert review._trim_quoted_reply(out) == 'Please fix this.\n\n' + trailer
+
     def test_remove_drops_matching_bare_line(self) -> None:
         buf = 'Thanks!\n\nReviewed-by: Me <me@x.com>\nAcked-by: Me <me@x.com>'
         out = review._remove_trailer_from_reply(buf, 'reviewed-by')
-- 
2.43.0

