Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=3; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795203135;
	b=XMOhH2Qyf4ap+ws0TMowKwGBYsEkDue38fHcDbxy3ZVKBCahwbrPk0CdfcSTJ54cMrtm
	 N+lQ1WgR9ul7am3FxfRN2bLeF5tSpOpbSnKypD8CiXGr2h7sLgCmGfPLj2p+UTwWoZPeE
	 zpnGHMxjmOh8bwD69ED07zsqlW1VshxYyUeHiBLb7X1ZB0d/uUraqwXnfh9ArQeW/jPiG
	 yjS0us+/316ze8AhrCDCOltxhPI9rhW5UdXvfol2kX/X4q42GxfsvMcxJhDZUUpAMs/wS
	 jcJxEyFrs12T6m/dalOMIP5uiKpCG+ENgkLnC3OSTtnHcASaBv9FE2/r/KnjOdUwIew==
ARC-Message-Signature: i=3; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795203135;
	h=Received:Delivered-To:Received:DMARC-Filter:DKIM-Signature:Received:
	 Received:From:To:Subject:Date:Message-ID:Content-Type:
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
	bh=E9+BQ03JYf74hGpJnU8xiAvr+GizT1Tk3K9iFVI1fIo=;
	b=a/wbn3Hhw6Dt3XWm5btOsxkoAwTXQ9TuDZ9tFSlfPOQxIBD+VoGKv5b8b19kAL4mevud
	 X/S53ARH5W2YN4pu5xt5AYpuwYbdBSIDfutcZn8mwmE8qLhNHC/KY3IJbIV7I13rzJP/H
	 /Y5j63ovy5VU4SRtDcjDLYCHw7mvz6rSiww9O8GwJXhZadJXJX9i0SPNGWESvcl43LuAa
	 qzUQJ0UgP6W1BwdaT3gGHsQqto7C/GAqKaCZCjc3Mik9Z4uuZEWWplDER9Id9P+dfFOGd
	 TW07dnryIWZFgUKJzwisskqPYCTQe+U8r8AbjL20iFcv7e8h5wYjKOAriL6iJaDvU3g==
ARC-Authentication-Results: i=3; smtp.subspace.kernel.org; 
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=VLg4T967;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5C3606A6DA
	for <tools@linux.kernel.org>; Fri, 20 Nov 2026 19:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=VLg4T967
Received: by smtp.kernel.org (Postfix)
	id 9FA591F000D2; Fri, 20 Nov 2026 19:32:14 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.67
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1795203134;
	b=s3SeIsnCdc2JEhIqqTDbe7+WzQrpDFbmQ1IXBeF3Z8FHP0sAPcsLd96mQfIiy1wByPTc
	 z+29Nz4jcw8xs16gg322Sxt4B12vdLmigAGtoYgoyZmKf/ps7nPSRJsg2FXgtcu18KZQJ
	 zzSkjqUrxBc2P0Z2Vw8GcQ2W3LOFXFVDQlcp4BFiGZVRiKzZImsgJaBg6hrvrL+B/tIVo
	 ElZGE0KriQMvuNHqyERSgV6FI9gaHgOEgTqCZf3GxSgLS9QQMhLru9Z/jZ//hOGIXdsGC
	 mkTy4JDuuKfvytta3wI4giyU3MD8hHCQTAUvsLQmaetPDRFBi5rnoMH5RylIAr9eojA==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795203134;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Subject:Date:
	 Message-ID:Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:
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
	bh=E9+BQ03JYf74hGpJnU8xiAvr+GizT1Tk3K9iFVI1fIo=;
	b=GdCC1lgccAon55MD/0F4g4Dj0OZs9Akp02iGRugBzY5WeVwvh6gW4bEJtpMR47I6JC0d
	 hY4hcte5qq2Se/ruJlvwEX0Zs9iI8z6MRzZT0DSHRX1XlqXzIE3O4pHefA9XtZ3qle2yS
	 oOu5pFO6z+PcWS7OjAC9xFpKMGF7iAJD8fqguM+NxpDZPYZaaSNcYmOICImFIHiMtfRaX
	 gwyDh6JeTI+LTIr8334Eysc2VnKW7+8GnI+Qta1xc8YcQl3dftUYR/1j/XnD23Q8uP7Gz
	 eahWe7llU1U3P8geWoPBaHKydY2uIYFgVqKTzhOE26tXx4RVmTQ8+ITXcO/vX7h9omw==
ARC-Authentication-Results: i=2; smtp.kernel.org; 
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=VLg4T967;
	dmarc=fail header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.67
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011067.outbound.protection.outlook.com [40.93.194.67])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 485F01F000C4
	for <tools@kernel.org>; Fri, 20 Nov 2026 19:32:02 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=VLg4T967
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 485F01F000C4
Authentication-Results: smtp.kernel.org; dmarc=fail (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IckZyAOgpMwZWay62P6BlUgAeSYQq08CyiXhSx4Kbyq2IKUXSNGiFw0dm09Nrm49EGhLyHt/7XiFvMO8qow5l9U2rsThnQd5mA3crySZiuzGqvvgxaEgn/btHNI7ynrT5Sv+c7aVGcEL2KIPCKjl0OTVLWJZjIMKyUAmHlQ6pbcH2CLYUqzRkNDUz5qcPIur4HcIc2ie75FTrOgecz8EHntYlUJC3ZB32EF2C5Ij6EAnjRN+bwQFLc/7oNvQbsKC8Ksr6wYHIj7r4SQFdqWpGZKb/VcR6a1RW71VRe2VFeSEkZUENzVzOHVFAAR7X5PDVHqSnkL+tdOMBvE8WbqVMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E9+BQ03JYf74hGpJnU8xiAvr+GizT1Tk3K9iFVI1fIo=;
 b=KXq0asxXrqio4ZUKAnmSuvz4RheECKtAqVrD7kHoaLKyBBguGyD+ehhVKxJXmHA2vcBGXMyXpWzLcPRhB5322U1QjqG1RKpWvwziiufpTYCNM8wli2cfmGMpGXVlgJAf0OgfH9yz1OzjBGLM/G3fPvXxs7omh8O6ir1M5hPVeOD7s6YanAKuDuyyzfh5L2SaTF+f5eFAdK9lL6gxEU8gXdLQhrAGjKvHn9JxH5rMLlY11+ZN+H+/5NwM8My78hvjw+mSmP84k0pySLprT00uMQAyq/IjpQkXGBQkm8kW2a8aFxHUSfgNRj5zITcImRdHLopRtr/ClYDmn8IpMueVig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E9+BQ03JYf74hGpJnU8xiAvr+GizT1Tk3K9iFVI1fIo=;
 b=VLg4T967Z/yRtMZORqgjTFkzMqj0YtcHRTOl159W523obsDaL4ZA0CqmnDM9m1d7SX5DwUi6/iRkLnoBX4IB2YRmJbMmI1JmrrG+P9EL1ESDP1d7GvCR1kLdyW66Z3xYDK8ycAvhFnZCVri7+BHEmrMMn44PUopsBqA0QaRoivCJJ/AehPIbTfxGshLpZIZQPzXR6HYv/oVuKUsbJ8hMRM354/HZwxuRtQJlk6txRaNLUiKuwqBO3KbSRuPsvBFYtTd1/xMR/uRkPqNwDMf5OMAz63DwPYi3cbmbjsEHGazA33IbOyB4bfMB3LhDR/nb9BntgIsjg7r4lPLjPs2KtQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12) by SA1PR12MB5672.namprd12.prod.outlook.com
 (2603:10b6:806:23c::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 19:31:58 +0000
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d]) by CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d%6]) with mapi id 15.21.0639.010; Fri, 20 Nov 2026
 19:31:58 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: tools@kernel.org
Subject: [PATCH b4] review-tui: add a discard_review command
Date: Fri, 20 Nov 2026 15:31:56 -0400
Message-ID: <0-v1-ae4a80b77311+75402d-discard_review_jgg@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0094.namprd13.prod.outlook.com
 (2603:10b6:208:2b9::9) To CHBPR12MB731189.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: CHBPR12MB731189:EE_|SA1PR12MB5672:EE_
X-MS-Office365-Filtering-Correlation-Id: 5768a95d-69e6-4e20-538c-08df473cf0e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|6133799003|18002099003|261009223027099003|13003099007|261022075727099003|261026121527099003|261028144727099003|261021123027099003|261021121427099003|261026140227099003|261022113327099003|261022105027099003|11063799006|56012099006|10067099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	28z8EJjO/l1G6UcfAcfXhxXGcbc9OVw9UWlU8WhEfBG8VQ3jLLggz83SGhuEHOCQq3Rcr6aXfea7sTJw26XNSnZ5rCthIzBrfI1GQMegAfm9sTO+Nbj+MenjI7i5fJHsSp9Oyr4VD2A/yrUfjjlGs6qBgMskIUsmKClSxG5rMUIoD+fx7x8wNQwVnbx6P5jgnQbQAE0gfN0MRn02tYZV9W2LH7KTmqAbC6rzkmo+7K1VHs8YAYRl1Ri0pwKjx/6ol6/eC3VH/hfROIanGhQVejkVCZ2zDLcbO6Twx7X6WQzbgHdeNZEarm4VeZZgE2b/lFWbtcDVDmNPMH3z8SPhP+8+qs6llZFgv9yh9vRU92NGOx8X0xMFVJLhNgpCnwQPFo8M7j5uu3bx1buNmvkXoTDs2kbqJnzguM0PGFP7rwo14oUv8dU4ZvBKvGHRZ02ZiOhWmSu19Djz+TVoWH5Ryzo6zmXsqFkOidMUrV0DJuXgaHYBtiGwg031aO8hY/wge/aBBh30eyZxiyN3jRKHkKc9qHM20eIPitpTcCePUIyyrvvMwfZNHLM8hLyh0fJAnfS4M4LgLMHX17ZgpAjDtRu7ZfrFAyd76h+iMrT/KY9U7yZmw8gF6iCPoSUrJN3r
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHBPR12MB731189.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(6133799003)(18002099003)(261009223027099003)(13003099007)(261022075727099003)(261026121527099003)(261028144727099003)(261021123027099003)(261021121427099003)(261026140227099003)(261022113327099003)(261022105027099003)(11063799006)(56012099006)(10067099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WW1JazMreGJZYXYrcFArS2J2cnY2d0NmQ2U1NTNlclo4ZXlFbDRDOGpNM1B0?=
 =?utf-8?B?Qzh4WFIzNkQxZFFjRUdHZ0JWS0lXZXJGdW96L2t1ZzFQcUs1VkF4cS9tK2lD?=
 =?utf-8?B?cU9LZm56VER4Q0Fmb0dDQUJXWk1xeFU1NjVHM0dac3NWdHZlWDJMMHFsWHRF?=
 =?utf-8?B?YmJBd25LMVhPZXF0VU5mMGRxWFN6WmUxTiszTWcvSnlobzJYYXRSNlQzTThl?=
 =?utf-8?B?bnRxZVgxbE1JSWRwWU9iOGFoSEFZczhmeXlvZW0zZTJzY21CYTl6UWphMElW?=
 =?utf-8?B?N0V1TVVIOWI4QXdRbUszRFIwTVRmNG02RW4xUEpqOGk0MTlabnNmRTBMcDBR?=
 =?utf-8?B?SS9hT3lmNDd4a0Yzd252eXo4aUdlY1RaYmJ0dXk0WUREc2lFays5MktPelNH?=
 =?utf-8?B?SnZWMmxTOUc5TWtHbkIvSDlTRW9xRWhnWG1NaWlkVDdkZnlKeDN5UVQxNThm?=
 =?utf-8?B?b0Nla1dUSExLdFEvTitSbTRHZ1dqcWxra0NVSTlEaUlKYjkrUFBBU3ZoYTFF?=
 =?utf-8?B?Tlh5RzRIVi8zaHJPT2hvOUo3MDZsUHdkK3lXQ2xJN1ZRbEY2Y1hZcWdPZ3F5?=
 =?utf-8?B?K3RpWHpyZnBEdzRoaDBiV0JlMDlLSjJqMjA2cnF5WU1acFFVYjN3dUVRNXky?=
 =?utf-8?B?TkRtQmxhOWx3QTIvVzM5WnhzUnowZjg3Um1zTUlJbEVoTkFsVkFJWG1yUzJS?=
 =?utf-8?B?aUdBSkJVbkNFdDRpZ3VHM2tiVkdlc3IyT1BoVHA0MnJnTEsvcVp0YVJhWFMv?=
 =?utf-8?B?SExFcnJpT1Q3ZHU3MkpwRzlvUnRMd1Q3NlZldHMzN0lDM0dSM2FJL29qbm1m?=
 =?utf-8?B?VTJsc0d2WmhDTUlFMURMV2FENHV0L1B3azc2elVyZ3BjVlRpSTBMc010K0Fh?=
 =?utf-8?B?SlhhdDNnckFNdllYQ1RIY0dTdUt2eGVucmllcngxVjBnL3ExS0JOVUx3cjNE?=
 =?utf-8?B?OGI1TG90dHBQVU9tMDQrZnM2WXJzcFJlK2xham54dVhWeVVCamR2ajNFQ2oy?=
 =?utf-8?B?enlJcUMxU096RTVObHJGVW5lMkNibkNLVXFJMVFEN3JhL3Q4L1NLV1JMZ1lV?=
 =?utf-8?B?bjZZYnIvc3RrWEVDZ01LekNScStNWXVQcXBIT09KZGdqUHVjaXZRUm9HNHBi?=
 =?utf-8?B?N2pmbU1PeXR0eTFTaWhCNnBSeTlUWWhFRGd5T09NWVFOZXVFaUQ4ZFlNUmtL?=
 =?utf-8?B?c0x2cWJKUVMxaitXOXY1NGZDWW1YWGc2aTdlVzJBaHlxemQxakx0MGRFZ3B4?=
 =?utf-8?B?azQ0S2lmLzFKcEVxVWNkTmp1UWtvVE42NllUaStYbjlhNUtpZ0sxRGx4UUN6?=
 =?utf-8?B?cGlweWFkcUk3bnNqLzBpbnRCZXNVK21MVjEra1ZFdkZOMEVwY1ZIbWc2ZFdx?=
 =?utf-8?B?VXdVcVluakRLZ3VBTnY2a0VmN3dZaTdxUnkxU3JsTVVJNTUxb3BER1BYZmp3?=
 =?utf-8?B?TnNJcGc3aXVjQkFyUU9rMmZ3VUJFaU5WbDNtSWJjcE9QbTZuT0l4TEJtYitj?=
 =?utf-8?B?YXd1cjBwaVpzWXE4RG1HZ1Jzc0JrWFZQN3ZwYmlBd1ZrYmtJTTNMUkVKMllY?=
 =?utf-8?B?bVN1WGdBMlZxN0RyQkltdnBZem52YVhOczNyZ3FrdkRheE9zUHFKcjR0ZzM3?=
 =?utf-8?B?T2JaOG1YZEJlTFZZSnVXVXROTkRvaW1GQ296N3VVUjNyeVgrSGJWYXhldHJj?=
 =?utf-8?B?NmpaKzRhUWFRTTV4NWtmbjd5cTRtY01lTSs5Rldpc3d0VVJURC83SHIzc3ly?=
 =?utf-8?B?MktTUllZY3hHeCtCa2xLWXE0b0lOdml0YmVtd1VMdGFzVjhiNkdqRWYzaHdh?=
 =?utf-8?B?L2kraFpDYk8yUWNPZXFna25YSGt5QVJVTmdKOEZBMURJd3V3SFd6NHRHNzlr?=
 =?utf-8?B?aXQxa3B0aTl5My9NeUxZQUxCVUszckx0ZUw4MUNGNHdTUEhYUEc3QzFXdVI4?=
 =?utf-8?B?N1JLZFdTY0c5UHF0ekNCZlJNUWtRRTZTbFRBNnc4Y2tIMzFaVHN3a3VFQnlj?=
 =?utf-8?B?YUdoZkw1WDd3RDdCZzlURUIrczFUbGIyVlBaeVB3bzFwaGhtYUhkNFhDLzZZ?=
 =?utf-8?B?WTZUVVNMVldhdUFjRGUyZFN1S3Mvay9nYlBURlYzUlpsTm9pR1R0QmJoRG5U?=
 =?utf-8?B?cDdNdXlucmZ5aGdYTU9SRTQxQWVndEVKVDN2MkVLZjcwdFNrT2dsbG10cndX?=
 =?utf-8?B?VlJEek10aW9meEsyNkZMQThnazRsU2xPeEdjaDVERzFTd2N1UnBoUW04d3E1?=
 =?utf-8?B?RnFWZm9QRHd6WFBRSEpCYlhDazBxcE4rWDNGd1duZFR1RStJYW1ZZjE4TmFM?=
 =?utf-8?Q?o/LFIgdrDaT1PK2oUR?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5768a95d-69e6-4e20-538c-08df473cf0e8
X-MS-Exchange-CrossTenant-AuthSource: CHBPR12MB731189.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 19:31:58.0200
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u6P5/3bUDn6rSy/Zh4qU0+kbopuVTWg89ws48IlWpZotUQpqHIi5m44LToq2WWq4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5672

On the email screen with a patch selected this will discard any review
information the user has created and set it back to the start again. It is
useful if too much quote was removed or all the remarks were later found
to be incorrect.

Bound to the R key.

Assisted-by: LLM
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 docs/maintainer/review.rst         |   7 ++
 docs/releases.rst                  |   8 ++
 liblore                            |   2 +-
 src/b4/review/_review.py           |  45 ++++++++
 src/b4/review_tui/_modals.py       |   1 +
 src/b4/review_tui/_review_app.py   |  69 ++++++++++-
 src/b4/review_tui/_tracking_app.py |   8 ++
 src/tests/test_review_tracking.py  | 157 ++++++++++++++++++++++++-
 src/tests/test_tui_review.py       | 176 +++++++++++++++++++++++++++++
 src/tests/test_tui_tracking.py     |  59 ++++++++++
 10 files changed, 527 insertions(+), 5 deletions(-)

I've found this useful a number of times. Sometimes you read further on and
realize all the comments are wrong :)

I think the LLM went a big on the tests, Konstantin I'm not really sure what
you prefer here.

diff --git a/docs/maintainer/review.rst b/docs/maintainer/review.rst
index f4603ddb065a51..92b3a06e1ce9d8 100644
--- a/docs/maintainer/review.rst
+++ b/docs/maintainer/review.rst
@@ -453,6 +453,7 @@ Key                        Action
 Key         Action
 ==========  ============================================================
 ``T``       Edit To/Cc/Bcc recipients
+``R``       Discard the selected local review draft (with confirmation)
 ``Ctrl-y``  Send review emails (``S`` still works as a legacy alias)
 ``e``       Toggle email mode
 ==========  ============================================================
@@ -489,6 +490,12 @@ bottom-right corner. Use ``.`` and ``,`` to jump between comments.
 Press ``r`` again to re-open the editor with your existing comments
 interleaved into the quoted content for further editing.
 
+To discard that local draft, first enter email preview mode with ``e``, then
+press ``R`` on the selected patch or cover letter and confirm. The next
+``r`` regenerates the editor buffer from the original quoted content. Private
+notes, external feedback, and sent history are preserved; the Git patch is
+unchanged, and mail that has already been sent cannot be recalled.
+
 When you send review emails, b4 automatically builds a standard
 quoted-reply for each patch: only hunks that contain comments are
 included, diff lines are quoted with ``>``, and your comments appear
diff --git a/docs/releases.rst b/docs/releases.rst
index 2b16efb72d7ace..03e62599915de6 100644
--- a/docs/releases.rst
+++ b/docs/releases.rst
@@ -48,6 +48,14 @@ context above it back to your last note. B4 replaces the run with the same
 review helpers. The marker also works in follow-up quick replies, and existing
 breadcrumbs coalesce into its skipped-line count.
 
+**Discarding review drafts**
+
+From email preview mode, press ``R`` to discard the selected patch or cover
+letter's local review draft after confirmation. The next reply edit starts
+again from the original quoted content while private notes, external feedback,
+and sent history remain intact; this does not change the patch or recall sent
+mail.
+
 **Manual revision linking**
 
 When automatic revision discovery fails — for example, a submitter sent
diff --git a/liblore b/liblore
index 6e8d825a12ae32..ac6e56d0b80983 160000
--- a/liblore
+++ b/liblore
@@ -1 +1 @@
-Subproject commit 6e8d825a12ae32b98e4da5348d3ade6fce12a895
+Subproject commit ac6e56d0b80983002b93ceb4640b3aafeb1a1323
diff --git a/src/b4/review/_review.py b/src/b4/review/_review.py
index e2499f8be15579..4976dffe3d1eec 100644
--- a/src/b4/review/_review.py
+++ b/src/b4/review/_review.py
@@ -1003,6 +1003,47 @@ def _cleanup_review(target: Dict[str, Any], usercfg: b4.ConfigDictT) -> None:
         del target['reviews']
 
 
+def _has_discardable_review_state(review: Dict[str, Any]) -> bool:
+    """Return whether *review* has manual state that belongs to its draft."""
+    patch_state = review.get('patch-state')
+    if patch_state in ('done', 'draft'):
+        return True
+    skip_reason = review.get('skip-reason')
+    has_skip_reason = isinstance(skip_reason, str) and bool(skip_reason.strip())
+    # Older releases auto-skipped unchanged patches whose review had already
+    # been sent, recording the explanation in skip-reason.  Current upgrades
+    # use patch-state=unchanged instead, but preserve that legacy baseline;
+    # only a reasonless skip is the manual state produced by the TUI's x action.
+    return patch_state == 'skip' and not has_skip_reason
+
+
+def _discard_review_draft(target: Dict[str, Any], usercfg: b4.ConfigDictT) -> bool:
+    """Discard the current user's outgoing draft and manual patch state.
+
+    Reply text is authoritative, while comments and trailers are derived from
+    it, so all three are removed together.  Automatic revision-upgrade state,
+    private notes, sent history, and unrecognized fields are retained.
+    """
+    review = _get_my_review(target, usercfg)
+    if not review:
+        return False
+
+    changed = False
+    for key in ('reply', 'comments', 'trailers'):
+        if key in review:
+            review.pop(key)
+            changed = True
+
+    if _has_discardable_review_state(review):
+        review.pop('patch-state', None)
+        review.pop('skip-reason', None)
+        changed = True
+
+    if changed:
+        _cleanup_review(target, usercfg)
+    return changed
+
+
 _APPROVAL_TRAILER_KEYS = frozenset({'reviewed-by', 'acked-by'})
 _NACK_TRAILER_KEY = 'nacked-by'
 
@@ -2693,6 +2734,10 @@ def update_series_tracking(
         'partial',
         'waiting',
     )
+    # Waiting can be set before importing a series, so it need not have
+    # a review branch yet.  Keep updating its database and thread data.
+    if update_branch and topdir and status == 'waiting':
+        update_branch = b4.git_branch_exists(topdir, branch)
     if update_branch and topdir and b4.git_branch_checked_out(topdir, branch):
         logger.debug('%s is checked out, leaving the branch alone', branch)
         result['checked_out'] = True
diff --git a/src/b4/review_tui/_modals.py b/src/b4/review_tui/_modals.py
index 3ad9b3d21204a1..b72c1c8dc883d2 100644
--- a/src/b4/review_tui/_modals.py
+++ b/src/b4/review_tui/_modals.py
@@ -326,6 +326,7 @@ def _review_help_lines(has_agent: bool = False) -> List[str]:
         '  [bold]t[/bold]         Trailers (↑↓ navigate, Space toggle, Enter save)\n',
         '  [bold]r[/bold]         Open $EDITOR for reply\n',
         '  [bold]T[/bold]         Edit To/Cc recipients\n',
+        '  [bold]R[/bold]         Discard selected review draft\n',
         '  [bold]Ctrl-y[/bold]    Send review emails\n',
         '  [bold]e[/bold]         Toggle email mode\n',
         '\n',
diff --git a/src/b4/review_tui/_review_app.py b/src/b4/review_tui/_review_app.py
index 97cc3e778db662..e1c56de99fa7e1 100644
--- a/src/b4/review_tui/_review_app.py
+++ b/src/b4/review_tui/_review_app.py
@@ -26,7 +26,13 @@ import b4.mbox
 import b4.review
 import b4.review.tracking
 import liblore
-from b4.review._review import BASEMENT_PATH, COMMIT_MESSAGE_PATH, NO_COVER_NOTE
+from b4.review._review import (
+    BASEMENT_PATH,
+    COMMIT_MESSAGE_PATH,
+    NO_COVER_NOTE,
+    _discard_review_draft,
+    _has_discardable_review_state,
+)
 from b4.review_tui._common import (
     PATCH_STATE_MARKERS,
     QUIT_BINDINGS,
@@ -63,6 +69,7 @@ from b4.review_tui._common import (
 )
 from b4.review_tui._modals import (
     CheckLoadingScreen,
+    ConfirmScreen,
     FollowupReplyPreviewScreen,
     HelpScreen,
     NoteScreen,
@@ -213,7 +220,7 @@ class ReviewApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[None]):
     # Actions visible only in review mode
     _REVIEW_ACTIONS = frozenset({'followups', 'agent'})
     # Actions visible only in email mode
-    _EMAIL_ACTIONS = frozenset({'edit_tocc', 'send'})
+    _EMAIL_ACTIONS = frozenset({'discard_review', 'edit_tocc', 'send'})
 
     BINDING_GROUPS = {
         'trailer': 'Review',
@@ -226,6 +233,7 @@ class ReviewApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[None]):
         'patch_skip': 'Review',
         'check': 'Review',
         'edit_tocc': 'Review',
+        'discard_review': 'Review',
         'send': 'Review',
         'toggle_preview': 'App',
         'suspend': 'App',
@@ -255,6 +263,7 @@ class ReviewApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[None]):
         Binding('comma', 'prev_comment', 'Prev comment', show=False),
         # Email mode bindings
         Binding('T', 'edit_tocc', 'edit to/cc', key_display='T'),
+        Binding('R', 'discard_review', 'discard draft', key_display='R'),
         Binding('ctrl+y', 'send', 'send'),
         # Legacy alias for maintainers used to the old binding
         Binding('S', 'send', 'send', key_display='S', show=False),
@@ -1442,6 +1451,62 @@ class ReviewApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[None]):
         else:
             self.notify('Reply saved')
 
+    def action_discard_review(self) -> None:
+        """Confirm and discard the selected patch or cover review draft."""
+        if not self._preview_mode:
+            return
+        target = self._get_current_review_target()
+        if not target:
+            return
+
+        review = b4.review._get_my_review(target, self._usercfg)
+        has_draft = any(key in review for key in ('reply', 'comments', 'trailers'))
+        if not has_draft and not _has_discardable_review_state(review):
+            self.notify('No review draft to discard')
+            return
+
+        if self._selected_idx == 0:
+            target_kind = 'cover letter'
+            subject = self._cover_subject_clean or str(self._series.get('subject', ''))
+        else:
+            target_kind = 'patch'
+            patch_idx = self._selected_idx - 1
+            subject = (
+                self._commit_subjects[patch_idx]
+                if patch_idx < len(self._commit_subjects)
+                else str(target.get('title', ''))
+            )
+
+        def _on_confirm(confirmed: Optional[bool]) -> None:
+            if not confirmed:
+                return
+            if not _discard_review_draft(target, self._usercfg):
+                return
+            self._save_tracking()
+            self._refresh_patch_item(self._selected_idx)
+            self._show_content(self._selected_idx)
+            self.refresh_bindings()
+            self.notify('Review draft discarded')
+
+        self.push_screen(
+            ConfirmScreen(
+                'Discard review draft?',
+                [
+                    f'Discard your review draft for this {target_kind}?',
+                    '',
+                    'Reply text, your inline comments, trailers, and manual review '
+                    'state will be removed.',
+                    "Private notes, other reviewers' feedback, and sent history "
+                    'are kept.',
+                    'This does not change the patch commit or recall mail already '
+                    'sent.',
+                ],
+                border='$warning',
+                subject=subject,
+            ),
+            _on_confirm,
+        )
+
     def action_prior_review(self) -> None:
         """Show prior revision review context."""
         context = self._series.get('prior-review-context', '')
diff --git a/src/b4/review_tui/_tracking_app.py b/src/b4/review_tui/_tracking_app.py
index 3b73163dd37e0a..4c997575d18d83 100644
--- a/src/b4/review_tui/_tracking_app.py
+++ b/src/b4/review_tui/_tracking_app.py
@@ -1858,6 +1858,14 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
         if not self._selected_series:
             return
         status = self._selected_series.get('status', 'new')
+        if status == 'waiting':
+            topdir = b4.git_get_toplevel()
+            change_id = self._selected_series.get('change_id', '')
+            if not topdir or not b4.git_branch_exists(topdir, f'b4/review/{change_id}'):
+                # Waiting can be set before the series has been imported.
+                # Use the normal checkout flow, keeping its stored status
+                # until checkout succeeds so cancellation leaves it waiting.
+                status = 'new'
         if status in (
             'reviewing',
             'replied',
diff --git a/src/tests/test_review_tracking.py b/src/tests/test_review_tracking.py
index 99c8bf6691036b..0d1a97526efb17 100644
--- a/src/tests/test_review_tracking.py
+++ b/src/tests/test_review_tracking.py
@@ -21,6 +21,7 @@ import liblore
 from b4.review import checks as review_checks
 from b4.review import messages as review_messages
 from b4.review import tracking as review_tracking
+from b4.review._review import _discard_review_draft
 from b4.review_tui._modals import SnoozeScreen
 from b4.review_tui._tracking_app import (
     _format_attestation,
@@ -1928,6 +1929,124 @@ class TestPatchState:
         assert b4.review._get_patch_state(target, self._USERCFG) == 'draft'
 
 
+class TestDiscardReviewDraft:
+    """Tests for resetting only the current maintainer's outgoing draft."""
+
+    _EMAIL = 'reviewer@example.com'
+    _USERCFG: b4.ConfigDictT = {'email': _EMAIL, 'name': 'Test Reviewer'}
+
+    def _target(self, review: Dict[str, Any]) -> Dict[str, Any]:
+        return {'reviews': {self._EMAIL: {'name': 'Test Reviewer', **review}}}
+
+    @pytest.mark.parametrize('state', ['draft', 'done'])
+    def test_plain_draft_is_removed_and_cleaned_up(self, state: str) -> None:
+        target = self._target(
+            {
+                'reply': 'Please fix this.',
+                'comments': [{'path': 'a.c', 'line': 3, 'text': 'Why?'}],
+                'trailers': ['Reviewed-by: Test Reviewer <reviewer@example.com>'],
+                'patch-state': state,
+            }
+        )
+
+        assert _discard_review_draft(target, self._USERCFG)
+        assert 'reviews' not in target
+
+    @pytest.mark.parametrize('reason', ['', '   ', None])
+    def test_manual_skip_is_removed_but_automatic_skip_is_preserved(
+        self, reason: Any
+    ) -> None:
+        manual = self._target({'patch-state': 'skip', 'skip-reason': reason})
+        assert _discard_review_draft(manual, self._USERCFG)
+        assert 'reviews' not in manual
+
+        automatic = self._target(
+            {'patch-state': 'skip', 'skip-reason': 'unchanged and already reviewed'}
+        )
+        before = dict(automatic['reviews'][self._EMAIL])
+        assert not _discard_review_draft(automatic, self._USERCFG)
+        assert automatic['reviews'][self._EMAIL] == before
+
+    def test_removed_manual_state_does_not_leave_skip_reason(self) -> None:
+        target = self._target(
+            {'patch-state': 'done', 'skip-reason': 'inconsistent stale reason'}
+        )
+
+        assert _discard_review_draft(target, self._USERCFG)
+        assert 'reviews' not in target
+
+    def test_unchanged_state_becomes_visible_after_draft_removal(self) -> None:
+        target = self._target(
+            {
+                'patch-state': 'unchanged',
+                'reply': 'Carried-over draft text',
+                'comments': [{'path': 'a.c', 'line': 2, 'text': 'old'}],
+            }
+        )
+        assert b4.review._get_patch_state(target, self._USERCFG) == 'draft'
+
+        assert _discard_review_draft(target, self._USERCFG)
+        assert target['reviews'][self._EMAIL]['patch-state'] == 'unchanged'
+        assert b4.review._get_patch_state(target, self._USERCFG) == 'unchanged'
+
+    def test_private_and_forward_compatible_fields_survive(self) -> None:
+        sent_revision = {'1': '2026-08-23T12:00:00+00:00'}
+        target = self._target(
+            {
+                'reply': 'Discard me',
+                'note': 'Private reminder',
+                'sent-revision': sent_revision,
+                'future-field': {'opaque': True},
+            }
+        )
+
+        assert _discard_review_draft(target, self._USERCFG)
+        review = target['reviews'][self._EMAIL]
+        assert review == {
+            'name': 'Test Reviewer',
+            'note': 'Private reminder',
+            'sent-revision': sent_revision,
+            'future-field': {'opaque': True},
+        }
+
+    def test_external_reviews_followups_and_metadata_are_untouched(self) -> None:
+        external = {
+            'name': 'Other Reviewer',
+            'comments': [{'path': 'a.c', 'line': 1, 'text': 'external'}],
+            'provenance': 'https://example.com/review',
+        }
+        followups = [{'msgid': 'followup@example.com', 'body': b'raw bytes'}]
+        header_info = {'msgid': 'patch@example.com', 'to': 'list@example.com'}
+        target = self._target({'reply': 'Discard me'})
+        target['reviews']['other@example.com'] = external
+        target['followups'] = followups
+        target['header-info'] = header_info
+
+        assert _discard_review_draft(target, self._USERCFG)
+        assert target == {
+            'reviews': {'other@example.com': external},
+            'followups': followups,
+            'header-info': header_info,
+        }
+
+    def test_no_discardable_fields_is_a_strict_noop(self) -> None:
+        target = self._target(
+            {
+                'note': 'Keep this',
+                'sent-revision': 2,
+                'patch-state': 'unchanged',
+            }
+        )
+        before = {
+            'reviews': {
+                self._EMAIL: dict(target['reviews'][self._EMAIL]),
+            }
+        }
+
+        assert not _discard_review_draft(target, self._USERCFG)
+        assert target == before
+
+
 class TestBuildReplyFromComments:
     """Tests for _build_reply_from_comments() context-limiting logic."""
 
@@ -4005,12 +4124,13 @@ class TestUpdateSeriesTrackingCodeReviewSearch:
             )
         return result, searches, check_att
 
-    def test_late_review_of_v1_lands_on_v2(self, gitdir: str) -> None:
+    @pytest.mark.parametrize('status', ['reviewing', 'waiting'])
+    def test_late_review_of_v1_lands_on_v2(self, gitdir: str, status: str) -> None:
         branch = create_review_branch(
             gitdir, 'cid-crs', tracking_data=self._tracking_data('cid-crs')
         )
 
-        result, searches, check_att = self._update('reviewing', topdir=gitdir)
+        result, searches, check_att = self._update(status, topdir=gitdir)
 
         assert result['error'] is None
         assert len(searches) == 1
@@ -4030,6 +4150,39 @@ class TestUpdateSeriesTrackingCodeReviewSearch:
         assert searches == []
         check_att.assert_called_once()
 
+    def test_waiting_without_branch_keeps_updating(self, gitdir: str) -> None:
+        conn = review_tracking.init_db('crs-proj')
+        review_tracking.add_series_to_db(
+            conn,
+            'cid-crs',
+            2,
+            'thing: do things better',
+            'Author',
+            'author@example.com',
+            '2026-03-23T00:00:00+00:00',
+            'thing-v2-p0@example.com',
+            2,
+        )
+        review_tracking.update_series_status(conn, 'cid-crs', 'waiting')
+        conn.close()
+
+        result, searches, check_att = self._update('waiting', topdir=gitdir)
+
+        assert result['error'] is None
+        assert result['counts_updated'] is True
+        assert result['new_revisions'] == 1
+        assert searches == []
+        check_att.assert_called_once()
+        assert not b4.git_branch_exists(gitdir, 'b4/review/cid-crs')
+        conn = review_tracking.get_db('crs-proj')
+        row = conn.execute(
+            'SELECT status, message_count FROM series WHERE change_id = ?',
+            ('cid-crs',),
+        ).fetchone()
+        conn.close()
+        assert row['status'] == 'waiting'
+        assert row['message_count'] == 3
+
     def test_checked_out_branch_skips_search(self, gitdir: str) -> None:
         branch = create_review_branch(
             gitdir, 'cid-crs', tracking_data=self._tracking_data('cid-crs')
diff --git a/src/tests/test_tui_review.py b/src/tests/test_tui_review.py
index e164bf646154d2..9bfd789af11403 100644
--- a/src/tests/test_tui_review.py
+++ b/src/tests/test_tui_review.py
@@ -27,6 +27,7 @@ import b4
 import b4.review
 import b4.review.tracking
 from b4.review_tui._common import filter_range_diff_for_commit
+from b4.review_tui._modals import ConfirmScreen
 from b4.review_tui._review_app import FollowupItem, PatchListItem, ReviewApp
 
 from .helpers.tracking import create_review_branch
@@ -429,6 +430,181 @@ class TestFollowupSnipMarker:
         assert send_mail.call_args.args[1] == [outgoing]
 
 
+class TestDiscardReviewDraft:
+    """The email preview exposes the core draft-discard operation."""
+
+    def _make_app(
+        self, gitdir: str, change_id: str, message: str = 'patch 1'
+    ) -> Tuple[ReviewApp, Dict[str, Any], str]:
+        branch, _shas = _create_review_branch_with_patches(gitdir, change_id, [message])
+        session = _build_session(gitdir, branch)
+        my_email = self._seed_patch_draft(session)
+        return ReviewApp(session), session, my_email
+
+    @staticmethod
+    def _seed_patch_draft(session: Dict[str, Any]) -> str:
+        my_email = str(session['usercfg']['email'])
+        session['patches'][0]['reviews'] = {
+            my_email: {
+                'name': str(session['usercfg']['name']),
+                'reply': 'Discarded maintainer prose',
+                'comments': [{'path': ':message', 'line': 0, 'text': 'mine'}],
+                'trailers': ['Reviewed-by: Maintainer <maintainer@example.com>'],
+                'patch-state': 'draft',
+            }
+        }
+        return my_email
+
+    @staticmethod
+    def _capture_confirm(app: ReviewApp, selected_idx: int = 1) -> Tuple[Any, Any]:
+        pushed: List[Tuple[Any, Any]] = []
+        app._selected_idx = selected_idx
+        app._preview_mode = True
+        with mock.patch.object(
+            app,
+            'push_screen',
+            side_effect=lambda screen, callback: pushed.append((screen, callback)),
+        ):
+            app.action_discard_review()
+        assert len(pushed) == 1
+        return pushed[0]
+
+    def test_binding_gate_and_cancel_are_non_mutating(self, gitdir: str) -> None:
+        app, _session, my_email = self._make_app(gitdir, 'discard-gate')
+        assert app.check_action('discard_review', ()) is False
+        with mock.patch.object(app, 'push_screen') as push:
+            app.action_discard_review()
+        push.assert_not_called()
+
+        assert app._patches[0]['reviews'][my_email]['reply']
+        screen, callback = self._capture_confirm(app)
+        assert app.check_action('discard_review', ()) is True
+        assert isinstance(screen, ConfirmScreen)
+        assert screen._border == '$warning'
+        assert any('recall mail already sent' in line for line in screen._body)
+        with mock.patch.object(app, '_save_tracking') as save:
+            callback(False)
+        save.assert_not_called()
+        assert app._patches[0]['reviews'][my_email]['reply']
+
+    @pytest.mark.asyncio
+    async def test_confirm_discards_saves_and_refreshes(self, gitdir: str) -> None:
+        app, _session, my_email = self._make_app(gitdir, 'discard-confirm')
+
+        async with app.run_test(size=(120, 30)) as pilot:
+            await pilot.pause()
+            app._show_content(1)
+            await pilot.press('e')
+            await pilot.press('R')
+            await pilot.pause()
+            assert isinstance(app.screen, ConfirmScreen)
+            with (
+                mock.patch.object(app, '_save_tracking', return_value=True) as save,
+                mock.patch('b4.review._review._build_review_email') as build_email,
+            ):
+                await pilot.press('y')
+                await pilot.pause()
+
+            save.assert_called_once_with()
+            build_email.assert_not_called()
+            assert my_email not in app._patches[0].get('reviews', {})
+            patch_item = next(
+                child
+                for child in app.query_one('#patch-list').children
+                if isinstance(child, PatchListItem) and child.patch_idx == 1
+            )
+            assert patch_item._state == ''
+            assert any(
+                notification.message == 'Review draft discarded'
+                for notification in app._notifications
+            )
+
+    def test_note_only_preview_and_discard_are_noops(self, gitdir: str) -> None:
+        app, _session, my_email = self._make_app(gitdir, 'discard-note')
+        app._patches[0]['reviews'][my_email] = {
+            'name': 'Maintainer',
+            'note': 'private only',
+        }
+        viewer = mock.Mock()
+        with mock.patch('b4.review._review._build_review_email') as build_email:
+            app._show_email_preview(viewer, 1)
+        build_email.assert_not_called()
+        viewer.write.assert_called_once_with(
+            '[dim]No reply will be sent for this patch.[/dim]'
+        )
+
+        app._selected_idx = 1
+        app._preview_mode = True
+        with (
+            mock.patch.object(app, 'push_screen') as push,
+            mock.patch.object(app, '_save_tracking') as save,
+            mock.patch.object(app, 'notify') as notify,
+        ):
+            app.action_discard_review()
+        push.assert_not_called()
+        save.assert_not_called()
+        notify.assert_called_once_with('No review draft to discard')
+
+    def test_cover_discard_does_not_touch_patch_review(self, gitdir: str) -> None:
+        app, _session, my_email = self._make_app(gitdir, 'discard-cover')
+        app._series['reviews'] = {
+            my_email: {'name': 'Maintainer', 'reply': 'Discard cover prose'}
+        }
+        patch_review = dict(app._patches[0]['reviews'][my_email])
+        _screen, callback = self._capture_confirm(app, selected_idx=0)
+        with (
+            mock.patch.object(app, '_save_tracking'),
+            mock.patch.object(app, '_refresh_patch_item'),
+            mock.patch.object(app, '_show_content'),
+            mock.patch.object(app, 'refresh_bindings'),
+            mock.patch.object(app, 'notify'),
+        ):
+            callback(True)
+        assert 'reviews' not in app._series
+        assert app._patches[0]['reviews'][my_email] == patch_review
+
+    def test_next_reply_is_regenerated_with_external_scaffolding(
+        self, gitdir: str
+    ) -> None:
+        app, _session, _my_email = self._make_app(
+            gitdir, 'discard-regenerate', 'patch 1\n\nOriginal commit body'
+        )
+        app._patches[0]['reviews']['other@example.com'] = {
+            'name': 'Other Reviewer',
+            'comments': [{'path': ':message', 'line': 0, 'text': 'External feedback'}],
+            'provenance': 'https://example.com/external-review',
+        }
+        editor_seeds: List[str] = []
+
+        def fake_editor(
+            _app: ReviewApp, data: bytes, *args: Any, **kwargs: Any
+        ) -> bytes:
+            editor_seeds.append(data.decode())
+            return data
+
+        _screen, callback = self._capture_confirm(app)
+        with (
+            mock.patch.object(app, '_save_tracking'),
+            mock.patch.object(app, '_refresh_patch_item'),
+            mock.patch.object(app, '_show_content'),
+            mock.patch.object(app, 'refresh_bindings'),
+            mock.patch.object(app, 'notify'),
+        ):
+            callback(True)
+            with mock.patch(
+                'b4.review_tui._review_app.suspend_and_edit',
+                side_effect=fake_editor,
+            ):
+                app.action_edit_reply()
+
+        seed = editor_seeds[-1]
+        assert '> Original commit body' in seed
+        assert 'Discarded maintainer prose' not in seed
+        assert '| Other Reviewer <other@example.com>:' in seed
+        assert '| External feedback' in seed
+        assert '| via: https://example.com/external-review' in seed
+
+
 class TestReconcileAfterShell:
     """Tests for _reconcile_after_shell tracking fixup."""
 
diff --git a/src/tests/test_tui_tracking.py b/src/tests/test_tui_tracking.py
index 92909234393145..f194b6a08c6553 100644
--- a/src/tests/test_tui_tracking.py
+++ b/src/tests/test_tui_tracking.py
@@ -50,6 +50,7 @@ from b4.review_tui._modals import (
     HelpScreen,
     LimitScreen,
     LinkRevisionScreen,
+    RevisionChoiceScreen,
     SnoozeScreen,
     TakeConfirmScreen,
     TargetBranchScreen,
@@ -720,6 +721,64 @@ class TestTrackingWithReviewBranch:
         assert tuple(row) == (10, 10)
 
 
+class TestTrackingWithoutReviewBranch:
+    """Entering review must import a branchless waiting series first."""
+
+    @pytest.mark.asyncio
+    @pytest.mark.parametrize('newer', [False, True])
+    @pytest.mark.parametrize('entry', ['r', 'menu'])
+    async def test_review_waiting_starts_checkout(
+        self, gitdir: str, newer: bool, entry: str
+    ) -> None:
+        identifier = 'test-review-waiting-no-branch'
+        change_id = 'waiting-no-branch'
+        seed_db(
+            identifier,
+            [
+                {
+                    'change_id': change_id,
+                    'status': 'waiting',
+                    'message_id': 'v1@ex.com',
+                }
+            ],
+        )
+        if newer:
+            conn = tracking.get_db(identifier)
+            tracking.add_revision(conn, change_id, 2, 'v2@ex.com')
+            conn.close()
+
+        app = TrackingApp(identifier)
+        with patch.object(app, '_checkout_new_series') as checkout:
+            async with app.run_test(size=(120, 30)) as pilot:
+                await pilot.pause()
+                if entry == 'menu':
+                    await pilot.press('a')
+                    await pilot.pause()
+                await pilot.press('r')
+                await pilot.pause()
+
+                if newer:
+                    assert isinstance(app.screen, RevisionChoiceScreen)
+                    checkout.assert_not_called()
+                    await pilot.press('escape')
+                    await pilot.pause()
+                    assert _get_db_status(identifier, change_id) == 'waiting'
+                    await pilot.press('r')
+                    await pilot.pause()
+                    await pilot.press('n')
+                    await pilot.pause()
+
+                checkout.assert_called_once_with()
+                assert not app._exit
+                assert app._selected_series is not None
+                assert app._selected_series['revision'] == (2 if newer else 1)
+                # Starting (or cancelling/failing) checkout must not promote
+                # the series before a branch has actually been created.
+                assert _get_db_status(identifier, change_id) == 'waiting'
+                assert tracking.rescan_branches(identifier, gitdir)['gone'] == 0
+                assert _get_db_status(identifier, change_id) == 'waiting'
+
+
 class TestTrackingActionMenu:
     """The context-sensitive action menu.
 

base-commit: 1b309be67793a389c65db822a109b811b89b9dcb
-- 
2.43.0

