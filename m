Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6B440F730
	for <tools@linux.kernel.org>; Mon,  7 Sep 2026 19:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=100.103.45.18
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788808983; cv=fail; b=aRw+hADPSt16YPDKx5r8Npl+H1iCN2DmwsplzM/y4z5zZZyysrTlAb0pZG0Gr/mPrQulfo0LlBnx5a/1TvrWEZ0F2gHDSJpuTuGwKQnILLCUARGcqFIZQtCq0NiKT7nqmzPn3p47NVFyjDdXzdkW/vmM0G8ZBNA3gxNu1ggen7g=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788808983; c=relaxed/simple;
	bh=GTzyJASEa40PX1kZPSu2SQoOguJRtNLyVibGznpGLUo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hmRnDjht8PMzIRfv25FUugryZ7qNqZO/ocs0xk8H/V+z+OwKeI8dWjT5To4Z+M2FKtEcwTVMGdwbde2brWfm+N/lo0tdGVX4XA8PDSYe/rhXi6toAYg5v+FEOLJImZtIHxFV7SMnrbkaCLDMw/uQSUlw6alhDblrxI+8IFBuliA=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=aGvSuT7H; arc=fail smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="aGvSuT7H"
Received: by smtp.kernel.org (Postfix)
	id CBFDC1F00A3D; Mon,  7 Sep 2026 19:23:01 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.23
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1788808981;
	b=duT8/pxCvgptAjZ085YmBAhxNmCUI91rcuVpKtgXp97gn8hwXZhpNO+djCRKGEr2feIY
	 yFFUD1N9LLy2wCheMA+ft2LTm8QcMUNKBfMMreyPmTDdcplQLBCdRNWIKHkg/nBRKFL8Q
	 E9JbtiN8MmBnL+/SgzGUVtg8flenqpT1prU+t92wW28DRbCaEIJQc/9DWPnlHV1pTWCAh
	 agY6NQrno/23qALsDyxm4kXTcIM3czOtFg3potzWEXYYUi4u2LM1k1ZSkXey2Lf/dAasu
	 sNMuJqBvPTfqt938oByyaimoKc5oEKR27UyFGzvH2rKb+uoCncpgmHMJzkVbISLkkNA==
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
	bh=waXthDRexDpF8PA950Dkfsfs8f3hSVvXSHXj7+yvFU4=;
	b=THtygo024wpRvbp4TWxCIMXrMh+KNNLXIqqrpH9upxAY+5YTxWypVzhoUv7U2oGFetIw
	 gnactVS8li0upMB4KGnGKeFD3X/HBroAM2HrIWIegK8JkN7hbWAvVkjD00kQdNaW1YAAu
	 ncnOTkbmMHXz+PIaPC8TSJgRZN21NJnldu/yn/eUzbvyUA3Fexk1TxH+Pdpw+S9/zuVnC
	 OO74YqlF4iFfBW5PsgXdiEDlmVby3GNaUgt00DX/X7sQtGyNrN4gOExFkK3aeV3wPxRzn
	 Q5IslXd04i12z0abIGbWlg+LVDjv6WS8fmzSdS8QROp2Q5NOmf3yGxifqnAODK/h4jg==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=aGvSuT7H;
	dmarc=fail header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.23
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011023.outbound.protection.outlook.com [40.93.194.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2C64C1F00A3A
	for <tools@kernel.org>; Mon,  7 Sep 2026 19:23:01 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=aGvSuT7H
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 2C64C1F00A3A
Authentication-Results: smtp.kernel.org; dmarc=fail (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bzqWVp8pi/aH+tjuf448ipYt7Ll4qHiIgHYoucbgPIFZxgathmN6L79iQnV0SP3s61wEj1ooyeU5O9IqKXZelWErajqhw8vvVyhTl5gsZTY5SqwgW25H1pLaye1QLew35aNCoMBA2abxzzv2H4QFxl45qX8uAoREvsrANSPjYp+cabDY9lFqKQVj2a1Xw8Esjxj6mzfZUAHd/FLCUWtxQQcWQxo82C4NEQ5cP5Ulj+tIMShpBvpcDayQOllrBSPWbWcMdUyqWllXomGomPMr5r+/TCtKvnyEOCYn4X1xUYaqb9CY1um73Vh6qm8MHiZsr4FirK/5i31KiYX/3obyyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=waXthDRexDpF8PA950Dkfsfs8f3hSVvXSHXj7+yvFU4=;
 b=ODinY9QPcB7muQRsIyOi3h407YesHnRuYDBX80c0Iz5zHKoHe7cEAHIBnL2oxaFFzJJtm7Ac1YMsuDQGn205DBQj7uTpdwoShLUKrDWYCU0Cvv/fp107qtn0NhcZwyoJUSlWIkN30YGp2Uvt3P+Sy1gcgv9DGkFTaZqQLmy+JRZgI26JW0yvcUdAg5+Nk8s1oCSU5iYCys5bMzo2AX/pACIsO40jr+E6nQAUn6LhBFFa9y8Zg2ir7mJ3tswl/0Ncc5FOQ+WyMCGXdgwEyJcMkBWq+zc58Aqh2e8tHHl1FKWXjo/IUo3NGodIvcKcBFaCAfNtmvEJvqecLXoX6ZZDLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=waXthDRexDpF8PA950Dkfsfs8f3hSVvXSHXj7+yvFU4=;
 b=aGvSuT7HNnBWUNYqyJUS6hyJcyL9WzPXJp+2H8rwqmOeeMlMHREKdM8SYwIGEU+NnPDdOQxjEwZm3LuZJkh9e3NIj9DBp5vyTIMNxHynOjs6q84O3R3ShbCm8bs3TLPbnJc8isJE6p5opA+W9rlZBqxq1tAICeSQYpRLBMl8HOZvnm3A/Q2Aif3xqpYs3fAl8QuegWMxegdya/suzjKBGDWxQ9GVqU8Jk67UZfnB7raV37/C5/qG8nq4XHYDRUV4mAlEa79HGRTNUiz7YGeZXKK6NTyOQV1xWr3/z2dI/k/tiU0BXUmWTjKMnmU2Y/lxMP4gYkYFdDfIcxsUbFFt8g==
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
Subject: [PATCH b4 v2 4/4] review: emacs: highlighting and keystroke for >--cut--
Date: Mon,  7 Sep 2026 16:22:54 -0300
Message-ID: <4-v2-de162fd5fc4a+2b7-trimming_jgg@nvidia.com>
In-Reply-To: <0-v2-de162fd5fc4a+2b7-trimming_jgg@nvidia.com>
References:
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0012.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d1::13) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|DM4PR12MB5844:EE_
X-MS-Office365-Filtering-Correlation-Id: 49a5a86f-fba0-4302-90fa-08df0d156be2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|3023799007|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	PjsGrBMqiufH6xbBi4dCKCadJBWScoLBfsHEE2PCs2s5fFhFhCWwwH1tIIjjsN/2i0Um/lEE4+uIfyQOC/RJMZvh5CHPgGwRYxD3nJQlZx7GWr8yLG2nqvFOF/1Anpm1ancuyzbpn97AG9JrN+WG8IvYRBNRxQm5cGQhQpP2jqPM6zvSwCM60dxZJU7KJE2vqm7HEZfVuGeCfxVF3gdOgrUyhXqWqgjFML5HKtviJlLKGs8J/o089mVLkVkOzI3ZCDPWric9v73VbB/L7ClV56VGFRENgkB31k2G+3yXfH+rGfYDGqtN13wnqP5zNi0SsAKtc554u2tvm6gcY/O0qvlH2/+1sWtA+Am5gXDAmVDpYkToW3yoOHRORTk3nCZ8yHP1PqOfpHOwjXNhK0pN2GwdcaLJHycf7cr84PXTBx5tseL5JV2nbKdwx+eNhAAX0dx6b9MtawskbuuHam0vFrrcyWksNx+gt4SmM7ZaKuj66VjZYY+YDarOpJvbFAnSJKweCX6Mbe9S9KmTAQ5c6VbJLKOo/EcdSJ1joJlryauUtCE2Gdc5KJ5IQmt416e2Lhuz01jTyXbj2z7Vfg0jga6cS/WgW2wRaip6Q/AD62EFbfuprqma+igNHPvgZ7jVc3BGWAYOxhW+zeuFgSKAsAa1NkD2Mbi1unuYdbp9OTY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(3023799007)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UVkvN1dBRVpXV0VPTFhYMWNlSE9oSmczbzdBSmJaZ1JxOHJ3aDlsUThVbWgz?=
 =?utf-8?B?RHIwZlBMNTFOY0lZWU9OWVp2Mktubm1scE5waVR6czFZRWZBU3JGWDdEYkoz?=
 =?utf-8?B?RStSbXpobmxsbCtzSnVEREZaTnBJQXhsNEF5cnpkbWJxTlQ5VGR0akpqYXVw?=
 =?utf-8?B?YTFMNldLOUR1R1VGTWtkU1MzTWQ3SnhGeTd5aXBOdEF2aGlNU1dZbUJQUis3?=
 =?utf-8?B?Y1hrWFk0akMwNEtLTVBod3RNRC9lMFJDWGwzaGttQ0daVlN5RzRucGNXSVBJ?=
 =?utf-8?B?NEMxT2lyeHZJeUlabEFxTDd6QXBNMG53b3FJdzNhNk1lRzFCcjg4NFBNbjBh?=
 =?utf-8?B?eG5qY1BpZ2NXM2lvSmFHOGhlNHRDYVNhTFNPQlBHNmYxN1BpWHRZODhjN2o1?=
 =?utf-8?B?VWJNS3NkSWJmdy9yc3dxY1RJT2ttSFIxNlhjL3Z2T3JFTHFIWExYZEZLQ3Nk?=
 =?utf-8?B?TDhMcklJSitmcFVQbTJtM2NsU3lxbFlpVzc0N09Hc2NWcG5SR29VdTFMclY5?=
 =?utf-8?B?Q1crS2xJWFVtU01aRHdTNldYNWZ0MXRBRUFxMkdxSW52VHdLeldUc2FQaHQ1?=
 =?utf-8?B?K2Y0OG1lZEFQekczQlNGOVI3c3pjRlMveFBKV0FLTlVsOTBKZm5wVlFXQXhu?=
 =?utf-8?B?ZjRCSnYycm5QMmlRQ2JJdE1VdHdPWTNRNGNMaHp1TUo1N2VFSFBkTjdGRHU4?=
 =?utf-8?B?emcySk9teGx0VTFDaHFQY245M3pPR1lMZmJqYkdxaHpIdkdHb3o3OTNwSHZE?=
 =?utf-8?B?N3drRXBHYmM4RS82bm15ajFOajN4cXVsa2tNamFMVGRlTDVNcU9rQlVsdU8z?=
 =?utf-8?B?R3VsU283S05EOEw2MDlka3Vud0xHbVdERXVJK0lIUGdiM0dDajZxYXpmSUJj?=
 =?utf-8?B?dnFnbVp0SGVqai9iY2VtcE5WME03TVQyTmZHRmxrbklCRzRrZWYyRXZ1ZEl0?=
 =?utf-8?B?SDBIOWQrbEt3Qm0wSVJKcEVaZkhSL0NrOVQxazJVNHUzMmpMM2NodzFMOWkw?=
 =?utf-8?B?SHN1YWJKK2tZbXROMFQ3VnNmSWRtMEF2ei9NdnhoMHhlbE8vdVU3MlJwWkV3?=
 =?utf-8?B?RFpwTVAzcFk4ZzdETFErSkJxbzBONkc1MHBvTjR5eTlzQktwV2ZnajErRklJ?=
 =?utf-8?B?eGVJdDliQ3ZlSHVWWTRKc2dsNGs4RmU4eHM1VkR3UVRYVXg4bnh2SXM4djIw?=
 =?utf-8?B?b3VRZEUrVkU0dXppNjFjYVh5emZzQUxMY1FBcWFzNGF4NW55ellZem5nTVdj?=
 =?utf-8?B?OHBnMUE4eUZuamtGakxiSnViSVdpSHdaQ0pXRm9IVUg1MDdDTUVQS2tQLzU2?=
 =?utf-8?B?SXZnK2JDVTUzekxjRWwzY1UvWEpWV3UxUnlJWG50QkxQcGdmZCs3dld4RFIr?=
 =?utf-8?B?dUwySlVTbExFbWRNZCtKY2w2OGFsRm1RTEFTdHdUTVhhamRTZ2xrVFJ0anQz?=
 =?utf-8?B?NjJlSUlLaTlGNjVqdHZnaFJFa01TYTFjN3ptS2c3OHhLNjMzU1NKbnI3MDBa?=
 =?utf-8?B?YnM0alJGQUl6aDhjRXRSZDZEL1RnVmNDbWVZQjVOMVJtVlJML0pSazlUcTB0?=
 =?utf-8?B?MDdHOTNXbVdlVHNsR2VEVVBCa1VmRlVHZHVQZFd2alVXRlZLaitBbi9KemNp?=
 =?utf-8?B?ZHBCbEVQSTB0QkMrSmRmakloOXdrelJZTFF3U0VHdHkzL1NhRDl3cENmU0Jy?=
 =?utf-8?B?T01NR3dhTXVFQjNPN2JxZElVc0VPSG5vbVpoU09jbjh3b0MybW9VN1ZaMDFw?=
 =?utf-8?B?OTdkTGZiUkdVblMwclc4WldRcXczTExRaUQwWnZzRHhaa2lNekROVGVJdk52?=
 =?utf-8?B?RHVTRUM5SDRRZ2xRQjB6d0RvMTU5cFk1QnpjRDZmclVwSGZDUm1EVGx1L0l0?=
 =?utf-8?B?NVMyQmdlNHg0KzdVb2NMSVNRc1FWT0d0STJkOUMwdVBvdlNwdTZEVG1yME8v?=
 =?utf-8?B?Q0pMK3VNdTFIWEtVSm9OUTlWVVNuSXFwaHR1VGg4cklLRnBEckNvaU9qNXpF?=
 =?utf-8?B?U1IwMDYzeGFrbllNbFhxZk9obHlURzd5S0VKaDRGQVFRNFB0SkFGL0JxamhJ?=
 =?utf-8?B?K3g4OTR3YlM5UUM0MWQyR2swTHpPcjdXQTdpWmZWRE52ZHM1akczWkd6SUtx?=
 =?utf-8?B?L295OFhVcDZJYlF5cU9ETnJMMjJXenN0cUgwSlNzSXlzYXF4R0Y3VjVkenAz?=
 =?utf-8?B?eGF4U2wwcThzcEpxd2RjbXdKNHg2cUlORlFMbEhZdUNGb09LREZib0VwQyt4?=
 =?utf-8?B?MFB1RWRoRmc5VHpnQTVnZUVXNzJvTWdWYlBVZ3d6bEg4UHRrcE5qbHQ0U2pF?=
 =?utf-8?Q?bZwI+b3nO9GlyU5hlK?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49a5a86f-fba0-4302-90fa-08df0d156be2
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 19:22:56.6613
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L8tWB01cvKAOnKf6Ulm4XKZYXHuM9N2VB22FFvPDyC4EkTXoUy6pQfgvGwDPzJsS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5844

Add a default highlighting in yellow for the cut marker and bind an
automatic insertion to C-c C-x.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 misc/emacs/b4-review-mode.el | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/misc/emacs/b4-review-mode.el b/misc/emacs/b4-review-mode.el
index c2342ff29bdf4b..81b49079efd630 100644
--- a/misc/emacs/b4-review-mode.el
+++ b/misc/emacs/b4-review-mode.el
@@ -111,6 +111,11 @@ whole-line deletion worth a breadcrumb.")
   "Face for instruction lines (# ...)."
   :group 'b4-review)
 
+(defface b4-review-cut-marker
+  '((t :foreground "yellow" :weight bold))
+  "Face for a \">--cut--\" snip marker line."
+  :group 'b4-review)
+
 (defface b4-review-quote-background
   '((t :inherit default :extend t))
   "Background face for prefixed lines (`> ' quotes, `| ' external comments,
@@ -125,6 +130,17 @@ on every line — without it, the fill stops at the last character."
   "Background face for the reviewer's own, unprefixed comment lines."
   :group 'b4-review)
 
+(defface b4-review-cut-background
+  '((t :inherit default :extend t))
+  "Background face for a \">--cut--\" snip marker line.
+Applied the same way as `b4-review-quote-background' /
+`b4-review-own-background' so the marker line can be set off with its own
+background, e.g.:
+
+  (custom-set-faces
+   \\='(b4-review-cut-background ((t :background \"dark red\"))))"
+  :group 'b4-review)
+
 (defvar b4-review-font-lock-keywords
   `(
     ;; Order matters — earlier rules take priority in Emacs font-lock
@@ -153,6 +169,10 @@ on every line — without it, the fill stops at the last character."
      (2 'b4-review-diff-file)
      (3 'b4-review-diff-file))
 
+    ;; Snip marker, quoted or bare — checked before the plain-quoted catch-all
+    ;; below so it isn't swallowed by that more general rule.
+    ("^\\(?:> \\)?>--cut--[ \t]*$" (0 'b4-review-cut-marker))
+
     ;; Plain quoted lines (catch-all for > lines not matched above)
     ("^\\(> \\)\\(.*\\)$"
      (1 'b4-review-quote-prefix)
@@ -173,6 +193,9 @@ on every line — without it, the fill stops at the last character."
     ;; itself, and `:extend t' on these two faces (see their defface above)
     ;; is what makes the display fill the rest of the line's width with that
     ;; face's background instead of stopping at the last glyph.
+    ;; Checked ahead of the general quote-background rule below so its
+    ;; :background wins over `b4-review-quote-background' on the marker line.
+    ("^\\(?:> \\)?>--cut--[ \t]*\n?" (0 'b4-review-cut-background append))
     ("^>.*\n?" (0 'b4-review-quote-background append))
     ("^|.*\n?" (0 'b4-review-quote-background append))
     ("^#.*\n?" (0 'b4-review-quote-background append))
@@ -419,11 +442,20 @@ the comment text in place under the same diff line, ready to edit."
       (when lines
         (insert (mapconcat #'identity lines "\n") "\n")))))
 
+(defun b4-review-add-cut ()
+  "Insert a cut marker that will remove itself and everything
+before until the previous user comment. The current line is
+placed in the removed area before the cut marker."
+  (interactive)
+  (end-of-line)
+  (insert "\n>--cut--"))
+
 (defvar b4-review-mode-map
   (let ((map (make-sparse-keymap)))
     (define-key map (kbd "C-c C-k") #'b4-review-delete-hunk)
     (define-key map (kbd "C-c C-b") #'b4-review-delete-hunks-before)
     (define-key map (kbd "C-c C-a") #'b4-review-adopt-comment)
+    (define-key map (kbd "C-c C-x") #'b4-review-add-cut)
     map)
   "Keymap for `b4-review-mode'.")
 
-- 
2.43.0

