Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=3; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795203007;
	b=TUXV1A5XP6l1MtGh3IIAs4pkmKlH1ZO2PFu0ac34XNn0JyEIDrgjdZVr4bd6P0i9fKnq
	 IcuoxfY7ceIP/cknSgRSHsF5IsqUjhtFRj2zPV2lUm2+YIPCr4vj824mrCiLXoTxVyQgx
	 clEBKUAnLQTn4kMtfw7m7scl74+z+QUgAEsv7cUvuPPqUMyhcE22Qw0P7mUZXCeLZhlZe
	 X7VM94iQ0MTE0AxIAlGA3j4zgtntGaV5JNmh44l3pHAddWMTOUNu8Tlo1AoxT03RkzDMg
	 rl713TwAdpp7ybIwjKANCvSrwtMbpYILKBOPTgQ9h3Zho3orY/Fsb8wejJQP36DJQPQ==
ARC-Message-Signature: i=3; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795203007;
	h=Received:Delivered-To:Received:DMARC-Filter:DKIM-Signature:Received:
	 Received:From:To:Subject:Date:Message-ID:Content-Transfer-Encoding:
	 Content-Type:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=XdmSm0rAGXUT8iTJxr6J/gz9tJkN2UZPOe1WkNuIiCI=;
	b=jVDdvyVyKtp2RagMwzcoYpPu7oqoC9oQ2x/aVuqXBvwiVIZwNTJlLeojA73v8l14mn1o
	 wqcAt0JpXAqajHLnehMEP7WyeTEx4Eq9lNbsHQQbEwxRkJO4cR3lVSVvkw7gtAUzLCX3v
	 j/QcnMiSON2tDMUjiGmwG7HC6x5hZVqLodk6f8lQBLtsEdP5PBHKjRhicq0mLDZ4Hdw2j
	 RovWiVe99Xh98w18ngM1QNxiuVaIcG+hPnyK4b+1IqGmlr1egy16q4+JPSiuezjU3jdqu
	 coxQz8waIKd9mQw7wKAd1+RTHmm1EPJTXFy1dMxH98cqDVEgDk8Z2xoiTXXBeLf3PSg==
ARC-Authentication-Results: i=3; smtp.subspace.kernel.org; 
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=K7KLlCHB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D8160A2610
	for <tools@linux.kernel.org>; Fri, 20 Nov 2026 19:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=K7KLlCHB
Received: by smtp.kernel.org (Postfix)
	id 627D51F000E1; Fri, 20 Nov 2026 19:30:06 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.21
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1795203006;
	b=vVNHu8Clnn2OOH9W/E1N9Zfjqz+psZnz4nBg1c4aCGbHpOxnhIzzLFiV86rLEs305Os/
	 7Quwl49uNCOk3EWmH34qGPT5rn+GEZpsJBn9pj7oB4d0EewxChNgRWWs/oeHTfLuMpYno
	 gxxvdZr1BrGxyprw9V4PGRb2yeU57endDBu/hFwxdwCn8KT4qtpnHADf8ww/8fxn+M2N2
	 U7ZMKPm85TAmsWVlZ5bwLgMlNR5yvUjaSiG7TcjU9d4xt6xiMDn81p/9XQO9pgRPct9Of
	 xZTb484ZXKsP1B16NO3ZzMpu8pRuqirv4m5u01gdMB5Csh6ZaacrphUqL0369W7rj3w==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795203006;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Subject:Date:
	 Message-ID:Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
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
	bh=XdmSm0rAGXUT8iTJxr6J/gz9tJkN2UZPOe1WkNuIiCI=;
	b=X8r76/3/rmN5eGL76Cg/meeL9zJe7qYe8FOXawV6+JkT51phq+SewAWRSAq9opKKoiCf
	 EIt4eVSOr0jc0FrTL9e0cxZmP9Wck2kdoq4GA2hJpze0gr0ngrtTBNIl7mNbwPfVM0PMF
	 7nynbAiUZYXr6A5ZP3ZM/pzocPqEKpQRtajr0KQr41WJCEv24awKIiSo9TQ1qouDo6pOK
	 QdcXq2QvmoDJyVAcnxpm/ILDMvOe1d/LjUQ0ubxmnsxCrSjvNjrmvkpOweYsux+L4S+X3
	 u81BOT/UqudqLditfz3JL1Ogyb3gEPigxpZeSGOKI52CqKCpP7lmh1w1t3t1ong/DOQ==
ARC-Authentication-Results: i=2; smtp.kernel.org; 
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=K7KLlCHB;
	dmarc=fail header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.21
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011021.outbound.protection.outlook.com [52.101.57.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A4B341F000D3
	for <tools@kernel.org>; Fri, 20 Nov 2026 19:29:49 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=K7KLlCHB
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org A4B341F000D3
Authentication-Results: smtp.kernel.org; dmarc=fail (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H0FZK+ALRhpIK4Pr/AW/BHkZ/ZQXltPdJBjwtx/9bBZDx8RjrjpyajWpoRAicN2bZt9QG2cMQgAbhaRN+Y5snfHSywceOVDqdAQhvbNBKX1onBOoci/i6lVw/SVwMkPUiHErjC4i2SIW2QJbtUV+1GhTkxT4kByrBvhIkRxCz6SSeOD4bYjV1F+CvOJNaNlceFvTdE30BHl+3k2BtE5/O4CIdpIBe2jJMy+1fn+7Ct0gxzaRg4oDGzLgaGXWZg7KWHDfhp0t3vrPILPN0nx8pEkOJsZ90wTJILpN5hYxSQT0QAIcpLoPQIflxpJfLc8BkCx1vIhoWmmYFz0McuCDXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XdmSm0rAGXUT8iTJxr6J/gz9tJkN2UZPOe1WkNuIiCI=;
 b=wL+fhUlj5Uu+D4b9KiwGEUw77LmUqlX0FCyrXvf0Okl5AOIHqw65OUgAoy+Dz4T2J7zjCHve67ylotch9/gKPyHxtXlRjcZ1p3ZnT9zlgm8t5JvMg6i40uAnG456pALDWhed5XowMbmHAlnQtftnQrgeDFv72VFYA+7U1LQrR/sk5xN/bDCgb1OD4ThROslEl4mpdhX4jaGoPjHZER0MCui5+cTQqBglZzp/8g6K1xAvQ8jUd39liAbmNQDHd5xf3ZtFvooCyxeyIPuQrV7COs4cX0wiBU1UJdgOSCU+otvOSepp+gs4iAGnM3rv/vLN/xLGskLNJf/W98KyMtxqBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XdmSm0rAGXUT8iTJxr6J/gz9tJkN2UZPOe1WkNuIiCI=;
 b=K7KLlCHB5Apw+MtZ4vv6NTaO50xvUv5dbXlMWwlcidrBCnU61ErcDqNIJ+FG00hUdzX57bvZXFZohnIOrUBXq0h3TBGQ3JAzaSo+zIYlzBIYTp1VpaN4dhucYlPPasXQ8OrRkORd9BbCBulkbvffjZBTZYbiKicJeqoISu/gKrSVClQ20QCWDwPLt9DOOpdCeb20PAlf3RSiseKiF8cwFQns3Sblerq5qv9Au6bRlMBw3y4e1no9l5ANHZL62iHnZTnf+/qeXae5CrOU8kVKzZ32IbLQxalsX11O3sY1/G4+vKKrBUOUSAgwXUJY7mCaIlonLv8GP1cS9vJyVoZ+xg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12) by LV8PR12MB9667.namprd12.prod.outlook.com
 (2603:10b6:408:297::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 19:29:46 +0000
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d]) by CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d%6]) with mapi id 15.21.0639.010; Fri, 20 Nov 2026
 19:29:45 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: tools@kernel.org
Subject: [PATCH b4] review: Preserve waiting series without a review branch
Date: Fri, 20 Nov 2026 15:29:44 -0400
Message-ID: <0-v1-e6b4f8140fd7+20c192-gone_fix_jgg@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN0P221CA0030.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:52a::13) To CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12)
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Post: <mailto:tools@linux.kernel.org>
List-Help: <mailto:tools+help@linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
List-Owner: <mailto:tools+owner@linux.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CHBPR12MB731189:EE_|LV8PR12MB9667:EE_
X-MS-Office365-Filtering-Correlation-Id: 68aa50f7-0660-4bae-f34b-08df473ca249
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|261028144727099003|261026121527099003|261102123227099003|261026140227099003|261021123027099003|261021121427099003|261022105027099003|11063799006|56012099006|10067099003|261009223027099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	o/U9RSWfe5A2oU1la2herBsknNVDoTLraWQX3FpfP08r1dDsIEUWj6v/urPX3uO4l7xVk3dXsSVTtywS0rAZNfswhcWbwqRloV0kstdHnl5o4AWN/zs4PQfku7eKy8hBeHhtylUCpafcEDDj16mk3ctmk0k2YoZMUyRJNSyFduGpRJovLH/VuL2j/84/KHguHj6kfOtr+9sRVzZXvlIL5EfdpFZtQukh7+W87Yrheey8Ut0GT8NU0oBBxGkREq/4SyMODs/rPuFqGwcdk8ZriduyrktpodvIjWsoaLHT0xC/5XPhStrYok0rE7kRGNXC/vgs66MmljyCCHt9Uer8zbTdTEB1yHwswkcBcevodPMi3f88y+T8ilkxjOvmECfCNHBDD/y8HOTyznbN1dNPfJbL/N6/iilcJpGbatjbo83uC19SzQK2uxZdAS+oPAtmVdkrzMqigOHImND1vemlkm6WQtOCroLwHC6s4qEHhQx1XSslghUOc97zeXA/DhRwGF74ahstvNV9E6wVDIzcwPFRDLAUhpWtaUrBgdV1j2LZTFYshq04cyHfgiesA9OxfituPia8C40RJipjHTJ3s2Rpn5wCFv/03cGnG/Je/q1EVdeOZ2h9KTBSI1yaFoz4VzKKdMCFR+FT+EIFWL8vtoqLEI/jjnM0Ep2b5BRTVOg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHBPR12MB731189.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(261028144727099003)(261026121527099003)(261102123227099003)(261026140227099003)(261021123027099003)(261021121427099003)(261022105027099003)(11063799006)(56012099006)(10067099003)(261009223027099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?k/AFMDvRK+nsS4lz2/Kvm9AgOlSgpmJxHYgwP09b/E9LJfwoyEQRheJHx94z?=
 =?us-ascii?Q?exc7lQlhY55ptNeDsZVgtO8YizgQZQEvg5au2Z1ngloC4uHHl9qDKFZ8BDw6?=
 =?us-ascii?Q?XrpzFahx4CuHShswP1htuImYaXvPr5PfviDM8nXDXUwt9wWb36m8GXf8WFjS?=
 =?us-ascii?Q?QdKVxoZbCmtDW1WsDE7HhhE7kky8+eYARqfEBQkMdoKLuRhdbBtz/43lhVtb?=
 =?us-ascii?Q?QLzh+b1EENRPxMHnfoOI0ANNnnyXbNZdZ1sGa4MG/UuRiCB35vjYuo2D4kAo?=
 =?us-ascii?Q?vfKTQagTxu8de7iKsel/2wrJiEYr/vPpqx9X/0/eNUHWnGLZXIvvOpcL9ut5?=
 =?us-ascii?Q?RJnlSkjMPxEXvB2cy+b9jBjkcXrkUlPc+v40VWQig4tv6cFrmt6YCpNhwvYF?=
 =?us-ascii?Q?AEYIJyUxv8SKChuqyMIMfZ07sk9ea8b69D9FnHyOUk4B0nKNjrgSSOPEKZlL?=
 =?us-ascii?Q?B+29wDQJ6VSQGrlqRmvPPPSag7BDUKAUybtwlrcXceWLnFbv4rg9u9Cr2Kqm?=
 =?us-ascii?Q?1SOfvifcwfzVw+Yvwq7Q4JfYr+ccMJdvnN7E0TzAY6pcoeV90YF+g6HTJ17d?=
 =?us-ascii?Q?b6sey9/neKF2ACW8jvnkvAVGfxdZfMW7/iqsUaXPRD9uK5c1WB9bR2Mx/z2h?=
 =?us-ascii?Q?6MOWHe8sSDCVk5+oR9v939e8lR388qNKUQ2JlBO7pJ2ne7R4ZczsMc8u1ae0?=
 =?us-ascii?Q?/pqj91cI2dAYpluzmnRgEDrJmZg8mSRYLpqLD7OE8VwqzQGKQE0pCZxjtTIh?=
 =?us-ascii?Q?Uc2Zsiz8ja8R4A3f76+aYImRbR4U0fpjGpBnQM92trYK/5Jpue1aGZ5u+E0S?=
 =?us-ascii?Q?ju23G0iQki6DfLkghKMTx+MWWKDqhSckb9rVaZFipm3nzpljH/f+P7qT2Uxw?=
 =?us-ascii?Q?DqCYS3l0SPcDVmDi01C5wUVp+q+Td4yO6kK7Q4pZ2mKV6O1CWaJQOU/hHjZj?=
 =?us-ascii?Q?rQ1VV/GJK41CIrFRrXcLwmaEH2cKqvNxrrndEkliTPJezxFKqatusXG/HAR6?=
 =?us-ascii?Q?gx/Nq6Drbc3piWaGJ1sI5U2Kfq9+MZeJzhzHAoTWeCZO19TBguIGv+m29rm2?=
 =?us-ascii?Q?lAU43HLLCovbQzo8s0AJxNHlaacTX3PkfGpLNERRKjpoyUX98arlIJAl+JnS?=
 =?us-ascii?Q?675wUicjxDwtBFq74F5ZNakVId2KWXy5eXrv+vpCGJTvMJ+u3u5E4R6cx7pY?=
 =?us-ascii?Q?Cc7dtVoOLG5gJP9I0ptbOfAKQgm/OUV9KnSRX+z5PbbIfLwXvF6LqiQPhOpp?=
 =?us-ascii?Q?AVpO8WkpLJEiSyzO4PuXH7B3ocKa+yT4j80AlfCwfrvKDJYu9v+1KwoAyw11?=
 =?us-ascii?Q?DpATCLmViQcoF032gtHy8kkAoo36KE//sakQoY8tVoH9BVzuGh26Ee3mBkDI?=
 =?us-ascii?Q?Q2cR59PZ7XAg/IO8E8LWRLtp+xewBo0khjYfMcovRM5RqvXjXnp3it2Dhtai?=
 =?us-ascii?Q?/r1+K834jXoCDP+jFHCXgyPghXfivy05M4l7mjxmRgynrlKfKABOt5ULW4ZP?=
 =?us-ascii?Q?LK5Yjlz5hsENbVtzWNWeUZ7WxixKC0l/6xfCMQvP03OEzXEMB3XwxVSocWAQ?=
 =?us-ascii?Q?KeAi7zKC0BTWYACKv+nJlGZdB/maXfpL4NLiG3n2jouiJs8gwVxRJbj5NzxV?=
 =?us-ascii?Q?iHlKwEzU8wRqCs6plxVUjDcy5Qwg/UFEWNfH0TENGSolKR1G75JMv0YOWF+X?=
 =?us-ascii?Q?2wC/5tsvJGmly6nvndR7OujGIPZy1YOtSfPbmq2tbjtPRxN6udBd2fuC7ejT?=
 =?us-ascii?Q?z80GUPoQHA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68aa50f7-0660-4bae-f34b-08df473ca249
X-MS-Exchange-CrossTenant-AuthSource: CHBPR12MB731189.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 19:29:45.8996
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +G7XrNYsY/VFhbP9PVf6rUjxOJw4dai1UzQF6J8yVOrSjrVfsNjXz6nZBQzj0jVO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9667

A new series can be marked waiting before a review branch is created. For
example if something happened on the mailing list that warrants deferring
reviewing it until a new version.  Full rescans currently treat that
absent branch as deleted and mark the series gone.

Require a previously recorded branch SHA before marking a waiting series
gone. Keep detecting deleted branches for waiting series that have been
scanned, and cover both cases with regression tests.

Assisted-by: LLM
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 src/b4/review/tracking.py         | 16 ++++++---
 src/tests/test_review_tracking.py | 54 +++++++++++++++++++++++++++++++
 2 files changed, 65 insertions(+), 5 deletions(-)

I've been testing this for a little while here and it seems to be solving the
problem I hit.

diff --git a/src/b4/review/tracking.py b/src/b4/review/tracking.py
index 4d2cc2fdd3120c..c887c798395fbc 100644
--- a/src/b4/review/tracking.py
+++ b/src/b4/review/tracking.py
@@ -3362,16 +3362,22 @@ def rescan_branches(
     # Full rescan: mark missing branches as "gone"
     gone = 0
     if not branch:
-        all_series = get_all_tracked_series(identifier)
-        active_statuses = ('reviewing', 'replied', 'partial', 'waiting')
+        # Waiting can be set directly from new, without creating a branch.
+        # Only treat a waiting series as missing if a prior scan recorded
+        # its branch SHA; otherwise there is no evidence of a deleted branch.
+        all_series = conn.execute(
+            'SELECT change_id, revision FROM series'
+            " WHERE status IN ('reviewing', 'replied', 'partial', 'waiting')"
+            " AND (status != 'waiting' OR branch_sha IS NOT NULL)"
+        ).fetchall()
         for s in all_series:
-            sid = s.get('change_id')
+            sid = s['change_id']
             if not sid:
                 continue
-            if s.get('status') in active_statuses and sid not in scanned_change_ids:
+            if sid not in scanned_change_ids:
                 branch_name = f'b4/review/{sid}'
                 if not b4.git_branch_exists(topdir, branch_name):
-                    update_series_status(conn, sid, 'gone', revision=s.get('revision'))
+                    update_series_status(conn, sid, 'gone', revision=s['revision'])
                     logger.info('Marked as gone: %s', sid)
                     gone += 1
 
diff --git a/src/tests/test_review_tracking.py b/src/tests/test_review_tracking.py
index 99c8bf6691036b..92cfc98a2e3258 100644
--- a/src/tests/test_review_tracking.py
+++ b/src/tests/test_review_tracking.py
@@ -1318,6 +1318,60 @@ class TestRescanBranches:
         assert row is None
         conn.close()
 
+    def test_rescan_preserves_waiting_without_branch(self, gitdir: str) -> None:
+        """Parking a new series as waiting does not imply it had a branch."""
+        identifier = 'rescan-waiting-new'
+        conn = review_tracking.init_db(identifier)
+        review_tracking.add_series_to_db(
+            conn,
+            'waiting-change',
+            1,
+            'Waiting series',
+            'Author',
+            'a@example.com',
+            None,
+            'waiting@example.com',
+            3,
+        )
+        assert review_tracking.get_series_status(conn, 'waiting-change', 1) == 'new'
+        review_tracking.update_series_status(
+            conn, 'waiting-change', 'waiting', revision=1
+        )
+        conn.close()
+
+        assert not b4.git_branch_exists(gitdir, 'b4/review/waiting-change')
+        for _ in range(2):
+            result = review_tracking.rescan_branches(identifier, gitdir)
+            assert result['gone'] == 0
+            conn = review_tracking.get_db(identifier)
+            assert (
+                review_tracking.get_series_status(conn, 'waiting-change', 1)
+                == 'waiting'
+            )
+            conn.close()
+
+    def test_rescan_marks_waiting_with_deleted_branch_gone(self, gitdir: str) -> None:
+        """A waiting series with a previously scanned branch still becomes gone."""
+        identifier = 'rescan-waiting-deleted'
+        review_tracking.init_db(identifier).close()
+        tracking_data = self._make_tracking_data(
+            'waiting-deleted', identifier=identifier, status='waiting'
+        )
+        branch = create_review_branch(
+            gitdir, 'waiting-deleted', tracking_data=tracking_data
+        )
+        result = review_tracking.rescan_branches(identifier, gitdir)
+        assert result['changed'] == 1
+        assert result['gone'] == 0
+
+        ecode, _ = b4.git_run_command(gitdir, ['branch', '-D', branch])
+        assert ecode == 0
+        result = review_tracking.rescan_branches(identifier, gitdir)
+        assert result['gone'] == 1
+        conn = review_tracking.get_db(identifier)
+        assert review_tracking.get_series_status(conn, 'waiting-deleted', 1) == 'gone'
+        conn.close()
+
     def test_rescan_preserves_non_active_statuses(self, gitdir: str) -> None:
         """Verify full rescan does not mark accepted/thanked series as gone."""
         identifier = 'rescan-preserve'

base-commit: 1b309be67793a389c65db822a109b811b89b9dcb
-- 
2.43.0

