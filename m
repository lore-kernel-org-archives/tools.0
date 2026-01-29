Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA56B37F74E
	for <tools@linux.kernel.org>; Thu, 29 Jan 2026 09:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=10.30.226.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769677879; cv=fail; b=PecIFmTBURavWXOJnCbLtqGNvJ7f13x/7AIGU7+tt9+ZliXBrqJLDvfjEW44+27MT1L56OvM/pQBU9KAUmw8fYCfuA5i0W7RSsf8f6ruax+4Pe61ljNqqRs/9Xf3cmLOImLLj56as/tyamZ2tP9CrY/rhVtP0PCzyuiLB9BQdvE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769677879; c=relaxed/simple;
	bh=fkLHj0APSBWCAVlVgrv6t6XPrzjG58AEUI+9MHJqVo8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=gjymTeAgRVjGT2HWDMoXeDR1CscbaGmgQ8aTqlCKQckVqmy0h6Rgl6Mgh13MpbhHkkdx4/4PAhdgYpuSRSxucKzqBDONuGO/l8o7we4d/WE9nVJQ+QlbKWlt+rp4+6SPO07xFGjCh9ni8B3+sO4mjfcEhGA/N7PoB+dGDBoQ3MM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b=wNBMBOC+; arc=fail smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b="wNBMBOC+"
Received: by smtp.kernel.org (Postfix)
	id 3A035C16AAE; Thu, 29 Jan 2026 09:11:18 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11023111.outbound.protection.outlook.com [52.101.83.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3C5E0C116D0
	for <tools@kernel.org>; Thu, 29 Jan 2026 09:11:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3C5E0C116D0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=vaisala.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tTrQ7zX/YKRWm4wZ9K5ftlZS5RHMoF7sb4XYoykZGIofhBu05RdBpk7kGx6Azxu28ZJmIg+ugv1MQCIdT3aulMN1nQbO3CcFlLu1FwBik3u18QzmVrtlHWXpF8uxD8Gt3ZgTylR+HhsaZPYoGvgJhm5SG2wl8PKrOpQ66z/8R2WzegCE6jtgGtwbQa/fOIjkDsdO1A5AT+DTSIodQ2twyIkISbXc6RXohxCO4q9OOufy67TfaH9kS2nCtg5fG+3eaFjjhdDIor9+m0RJoIb3F2IvNKRVsToabKRsyfcpZhs5RZiNcti/KpN4S4iPvUsXPPXgZK/H5Dmam7+OLf46EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BbBpUbhY2YLSApu4LSf5puag+WIGBMF8NrzZv1w9Ego=;
 b=akxDbEcLRO4HDYFM18TdHY9Bsp6DzVscWc4FU3G4FgdGeA2+rFEbn5k4Dtk3vOhn51274Jnivqwrwc+mJmhJpfkCDYjv9w1c+VceL8wHO7+7KlSj5sXdHDoMRZYf2iDGozd2NwgQyyeL0BvA2Igno2f/6vd/O8ed+Is0cgc4P/P2CkPlQbWNa+FHZmxj0M3Oqdij99nm02D+m5UDjfdp+newagHeNGe6YEZSm8SeDAl90DLcqc7Tnb+Dzzk7FxkG0r4I7fxE0aoGK3encnwESZ1c8T1kSqah0SVdZo8gwsDHhz2u2YEOpfIkPKyupRgjt9XWwHQfgR/SDxK51neDTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BbBpUbhY2YLSApu4LSf5puag+WIGBMF8NrzZv1w9Ego=;
 b=wNBMBOC+2rvMm/8JGmDQjW0Pptx4239O3Mec3YoYuF3scboB3rJxVWA7VxIG5VWk+4YQP1JUgeCc0XUwV1NMUPfxFutLvfUxNQUy8DAgWY0N5lDHKs5OmyunLu8aneuUS2/uBhpXVwCD5ulEPm2vOBdVk5GF5vFw+22i0prx3OFujvGkLEN0iCBahvD3ii7tMqjeyVx+MwdF2Wr0FBjHTSvOoZKeFXQ6F2JE5bg/+cMJyemURgBC5Ov7vCRlVYtsv3ZBa6t2OgQZGT+IuQUCvnND/P+0vrX7IDyKqIZdRIx38O5nng9HkGN2ZET1gFj1uegy0U9je/NJIlLTs7goRA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AMBPR06MB10365.eurprd06.prod.outlook.com (2603:10a6:20b:6f0::7)
 by GV2PR06MB10252.eurprd06.prod.outlook.com (2603:10a6:150:2d4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 09:10:59 +0000
Received: from AMBPR06MB10365.eurprd06.prod.outlook.com
 ([fe80::addd:5e9b:7273:8049]) by AMBPR06MB10365.eurprd06.prod.outlook.com
 ([fe80::addd:5e9b:7273:8049%6]) with mapi id 15.20.9564.007; Thu, 29 Jan 2026
 09:10:59 +0000
From: Tomas Melin <tomas.melin@vaisala.com>
Date: Thu, 29 Jan 2026 11:10:30 +0200
Subject: [PATCH b4 2/2] b4: add support for oauth2 SMTP authentication
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260129-smtp-oauth2-outlook-v1-2-e8c6d1b00c03@vaisala.com>
References: <20260129-smtp-oauth2-outlook-v1-0-e8c6d1b00c03@vaisala.com>
In-Reply-To: <20260129-smtp-oauth2-outlook-v1-0-e8c6d1b00c03@vaisala.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tomas Melin <tomas.melin@vaisala.com>
X-Mailer: b4 0.15-dev-d4881
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769677857; l=3422;
 i=tomas.melin@vaisala.com; s=20251125; h=from:subject:message-id;
 bh=fkLHj0APSBWCAVlVgrv6t6XPrzjG58AEUI+9MHJqVo8=;
 b=suG+oWEiztbHQxBDem9gDxYna6gONP4PZGzKELoJEuNB7OThMMvATtn8kHu9WHL+Nou6uoSOh
 g4LbPna0t5oCy2uB4KoeE4zfCe6OZvb0my/z2nm1ljXPDuGAJD4OERY
X-Developer-Key: i=tomas.melin@vaisala.com; a=ed25519;
 pk=6lMiecjZ+OeyZuxYsDm/ADy9D1JKvYrKdsYv58PMepU=
X-ClientProxiedBy: GV3PEPF0001DDA2.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::6c9) To AMBPR06MB10365.eurprd06.prod.outlook.com
 (2603:10a6:20b:6f0::7)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBPR06MB10365:EE_|GV2PR06MB10252:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c0aa43a-6b64-40c7-dc4f-08de5f165113
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7142099003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WFRQaGZYaGVWTm53RGlsVEd1NWxtK0dpc1ZURVpJaFdMMUwvSC9naEh0aGZu?=
 =?utf-8?B?VjlMc2VnVEVraERLdGpZdktLeFpzaDFBL0JjRCs1SGtPVENsVEkvZlQ4cS9C?=
 =?utf-8?B?N0ZWSDliU2xkcE0yODlGbXo4ZGFGNVkrSXBQcjBLVUdFeFMwVkYyRFZ5WG9B?=
 =?utf-8?B?U293Mm0xclBMditTRXRUcWdyWG4yMElYelRVUEdMQnlES2JKTnlkWW9MR3Vq?=
 =?utf-8?B?Mnp2ajAyNFRHV3BvYTZuQlpkZ2xkdENWYjd5QURXanB0cjVrakE3Mm5qcXVk?=
 =?utf-8?B?Q093U0VDSWVBaktoVnQ4SkMzeUo3Y0IrcDFMSXRKT3R0ZGMyU1ZYVEc2cGQ2?=
 =?utf-8?B?cjhKTTh2QjZ0RENmdkVDN29yUW9NcTA4d1ZXMkg4eE03WXhFNzh5VFVsMmdh?=
 =?utf-8?B?anl2RTBaVVh5YzZZRXJPL2NDTFcxL2tMcndVZVJSYXRINFRxZ3RkQ3lGemhW?=
 =?utf-8?B?ZzNFK3I4ekJqbENsMW9zWkJlVzhkUFJlWXV3RHJXZTJOaWVsY0VJdldOMlE2?=
 =?utf-8?B?Z2ZtQ29pZU5ZL1dsVCtTNy9VY1B0ZmM5dVVvQktVenk1VzRoRG9tQUpEYm81?=
 =?utf-8?B?TTBDTEd5YmJiUWVmWnNaTi9BcUJFK291V1UzM2xyNFQyczhRdWV3bnA2cnNS?=
 =?utf-8?B?dmVpdERtWVJ1eVc5Ym9XVWhNYmlkdUswdkpKbVRma0tPYXZTcm9pZU1iSnhu?=
 =?utf-8?B?Zk13SWVIem5tazl3aUladFMrNHJlRTEyUlJ3NVl2UTVtWjVla3JDRDhrU1ZT?=
 =?utf-8?B?SUhjNVpLOWQzbWhPVnFMOGREQThHakZhVFdsZ2FpQXhibXZQZ0kzQjk5a1RW?=
 =?utf-8?B?UWJYTUJmRmFuZ1hIeEljRlZST1ZSWUEvbUNXalh0WklDYWE2TzhiMTdwbjg2?=
 =?utf-8?B?ZUNwRHcrcjJvMXFVbXpDdUNRT2xleDVMOElDWHU3Sy96TDZWbGRxNVhRTm5k?=
 =?utf-8?B?Y1BZQTZnblBhd1ROcVlyaC80OURsNVorZDFWbVowUmtmZ3l0VXBqOHB0Snls?=
 =?utf-8?B?azB4OWpoZ3MyYTFSVGtPNG0rZVZZQUd2WDZjSjhIK2ErT3J5WTF4Yk9wbUpJ?=
 =?utf-8?B?bTVOY2R3MGl6anBUdUR6dWlpN1JkQVNWTnpKTE9vSEpaeVJ0aVFtcWhLVFRH?=
 =?utf-8?B?blc2MFRrNUo1ek9ZVFVVeWt6aFVXbGFicTJvSXNPSThhdHkvNVRVRnBtRzlG?=
 =?utf-8?B?TWRscnExRm1GS2I1b1ZFRTE4aDBNV0NrMVl0WmVMWFNUM2NjeUNBODdNZDRF?=
 =?utf-8?B?eUdicXk4bUQ5MHp0VHBLQzBqRVlRYmd5cG1OYjhKOWVOQUNSR3R6Qi9sM29L?=
 =?utf-8?B?R3NZdlJRZTZOUC9lSFU2elVCdTB0MHJsWnkzZ1JVZUdmczU4eUJXZGp6cmQv?=
 =?utf-8?B?MC9PelhMQWdlbnFqdmJBdWhLUCtSazBYT1l0YjlmNXI4VStBazk0cVhGUEpi?=
 =?utf-8?B?Y05EOGpIWmpmWlJDRVdaNEZnb0pJTjVEbDJNdVZnSXhaTmV0WnE5YXVpdTNJ?=
 =?utf-8?B?SndseEZsY2JtUmJzNzVjNExzK2VtbnIwYkRhTGl0WVpzNVRSTURSMXhEZHh0?=
 =?utf-8?B?TzBLVlZuS01oMHM2YnpIQnJuSGUrNmJabm1uQmYwWGNmSi9nSk52QVJXWFlH?=
 =?utf-8?B?ZS9NZnhJU2tMKzkvZ1dkSmVDTFkvY25XNG1BS2Yxd3R2WWRZSXdBMGVmS29F?=
 =?utf-8?B?cmhjNUdnWU5IdkJJYWI5RGM3ZG9UMVBNUDUvQVFZQm9nL3VYdHBZVU1LL2lp?=
 =?utf-8?B?SklPOWs3UE90VllhajNPOVFFb2h4YlVid1hzbTZvTEx4czljODRCcDdEOUxR?=
 =?utf-8?B?eGhrQWIyWlZQeGE4Q0I1MzJrMEZvOWlHc0pmM0N5MVRHWkQ4SE9Eb0FPcGZK?=
 =?utf-8?B?NGgwS0FKeTVWVWR3ODV0MS9CbXV4bzN4dkdEUjdWNXVMdXJxWFR2aGVoaUxZ?=
 =?utf-8?B?eGNoVTlDQ3NETzAzRzVLUGVVKzFSWkdOT1Z4L2lJTkoyaWRPR1M4Z3VoeGVv?=
 =?utf-8?B?Q0FqNmMwUzhITGNnNVkxQm1HNlJaUmlUVmhnVitpeTlwODhDb283cWpRNG5I?=
 =?utf-8?B?OW5XWmhmN1hRNmlzeHA0a09INUpaQ2l0eVNlelVqcldsUkZZTmNpMnQrQnE5?=
 =?utf-8?Q?lC80=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR06MB10365.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7142099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bUxQSENXR3ZEY1lHdjYxUFVndXlCU3JCRHo4TDZTcmNBNnBQSytQVHV6MnVX?=
 =?utf-8?B?M28vUzFFRGN1Y0kzUW5WRkM2NGl5cTBMdkljZjhjd2xydy9kRENNRXQzNWJk?=
 =?utf-8?B?TFZiTzJveS9vU1NiUzFobVRkN0dzUE1SSUo1L2VyMFdWb01FblpPaGQ3bXdX?=
 =?utf-8?B?dU9GMXlhakZmbWpYQjltYis0cm5jWXZFN2Y3d0RRaXRnN1p6elQ4QStrUWRF?=
 =?utf-8?B?dzQwV1pPQ24ya2xGWi9MWkxOWWRkVGRKMjA5djJ6TkVsQm1GSDl4bHM5WEJw?=
 =?utf-8?B?WkhJVUJyNEVCTStlby9TTFU1MzlvNll1ank4RFM0RkZmVW1JbWFjTWhGNW5F?=
 =?utf-8?B?MUg5VFZHNkh3NVJFN3dPbE5HNFhFQ0FjalJqdG5JdzkveEhZN2lGaXFoVEV1?=
 =?utf-8?B?aHQvbDlPaXJKMm01RjlPZGxUNkVUSFdtTGpRQ2ZkUktSTGhNVTBRenJxMGpX?=
 =?utf-8?B?UkJreUpsd09oQ3pjME80SlhFNHJZd2tIZE1TZE9EWVBEdS9Gckh0eTlsY1FB?=
 =?utf-8?B?d2Y3OGZTaWN5UTVKUDVwcVh5UXlKVmVKMkJtbGlWWGxQK1NacWZYWGZBZDdx?=
 =?utf-8?B?MnRPeTFQOGpCaUkwbE5xdkxQMk51VmtOVGJNNG9HUXBsaHdGNWhIZ3NqZmd0?=
 =?utf-8?B?TGdRbmFjdStPM04vSUxVd053bFFGbHNtSWx5WUFybUpheEVQcVBVRXNGY0xZ?=
 =?utf-8?B?OERhejdRcTBCcEE4UkkwbFlsa1YrZU1Xc0QzYUFrYVljcHVnOGE5SzZjcDBR?=
 =?utf-8?B?ci9rLzVGdXpmQ0dhTFVyZE02VmpPSzlnRHJlSEZyQVlWYjhFdXo1cjJURHVD?=
 =?utf-8?B?UG5oYVVKT082aStoQWxsdy9aSWlFMTRiZkcyYzF3M2dFZUlVVGorczh0RUVQ?=
 =?utf-8?B?cEI3ZkY5ZDNkdU5XS2FlZUJRU3JDMlovM3lRSmM3cmd5RTRlUm5XaTd3T0ZX?=
 =?utf-8?B?MXdUT0YyU1VCWmlOWkYyclVsTmxNcVpUMDZjeVVaNmIrSzFNODFOSzZKYmlZ?=
 =?utf-8?B?SkIvcCt3MlF0QkVTc3dQS3lmcm9KYmg2bGRGVEw0Q3lpYXlBSmh2QlZqemhN?=
 =?utf-8?B?OWRtODk1bGg0Yi9BMWh3K2svQ3FONGUrN21DcE5HUXJqN0NGRmtMZU1xTUFS?=
 =?utf-8?B?T1JGaUJ1bnNDTWdTTHlrYmcrUzZ1anRRazA1ZWdDQjV3RkNHU1RBczlHUVlB?=
 =?utf-8?B?bDN4WE82a0t1STBJZElJUnRVbmdvc0lzQnp2S0RvSmo4aXV5NWo2TlpBengw?=
 =?utf-8?B?TERKWEkrU21mdzZqQjNIVE5HcFkwWm1tcnRpODRWQmhwNUlMMjlUSmYvMVkx?=
 =?utf-8?B?VG5ITjVMcGM4OWdxbU50aGJaUUY3TUpVL3hMcVFLRHVhaEJ3d0NkQXhsaXZV?=
 =?utf-8?B?UzlVemNkOE85Szd0L2Q3QVhoclRmUStZcGxnTmE2amE3VC9VT2lVRFdUVjRZ?=
 =?utf-8?B?YjN4VGxDZUY4UG9iSUpOajlHMDkxNnhJVzM3bFpHTXBIc2QwcVd6ZGJLbTAv?=
 =?utf-8?B?ZzRTbmtaZFpic2VnNnZzeDRKZ2U5WWh0TnQrQ0lkZkg0NzNybTh6K2hBV0xi?=
 =?utf-8?B?bHkvZDErN25wbW5UNHJZUVY4UjNXb0Z0SjdVSXdIYkxZcGNBRExDTEdLV1FQ?=
 =?utf-8?B?QlY0OFc3Qm8yQ1kyNDVkb3ZrS2s2ZjVFeXI2UFRSNFU1V3FrUFBHQjViQXg0?=
 =?utf-8?B?eUw2em1tWDBhQzhKVmtWaDZ6WW9aMHhTREpZbmprc1dLOTE0TEFmbFpXbkNo?=
 =?utf-8?B?QzFjaTAvVEg3QnFjSGNxNzh1NDFlTUFLTndlL09lRGkvMXl0MzdlYmRPZHNa?=
 =?utf-8?B?WWUyV05zTTJBUWRkRDlsRTNUdWQ5TWJXaXI3UHhuYTV3R0FvQmNQZm9pVTFD?=
 =?utf-8?B?OXRKTk5RaVR3OTJLVHhFbDBCVGsrNjMxTmozcy9KNFd5MjVYWkNOUlloeWJO?=
 =?utf-8?B?QkZXMkw4MStnZm9LbjF4NlpRZXR5N09PclhvNEkwRDZ6UE1xWlFWNUMxaCsw?=
 =?utf-8?B?SWxQZTBZV2FJa2IwTFF0bXNoNit6STNoNHY5ZWh5cTlLS1ljbm5sWC9HWjg5?=
 =?utf-8?B?OUlXOVhqZ0hpYUtlUWQzaEFkem1vdzV6cklnSkZxMmwxSVFQN29HUUNQK2Zx?=
 =?utf-8?B?YnJIRFRjd3JOc2paZmE4REFUSnp0WW44R2prbXliK1luUGx1ckNiYlBmRUdn?=
 =?utf-8?B?MmxlaGFQVmN3K2E2d3pOMjJzYjA1RENsNHFqVktKT2Zhbk54d1QxWXBKRkRY?=
 =?utf-8?B?M2Z3RUlwd1JuQnI0amVvbGhQRCtZT3VabFA1aHR0TUtOeU56c05SWU1Ha0pj?=
 =?utf-8?B?UTg5Y2FpNHhKZ2MvVitFeTAwVEoweDJva0RxTFZMcmxjUmJITmdzLzFqZmxa?=
 =?utf-8?Q?av0q4tp9dQ75GWo0=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c0aa43a-6b64-40c7-dc4f-08de5f165113
X-MS-Exchange-CrossTenant-AuthSource: AMBPR06MB10365.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 09:10:58.8574
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tJYkR5j6SY1uSTsq1bPXKg31NJ4MAXx2mTQD9uFC564OiuzDsTVfzkoa8uoRZlKrdjPaVKxTD4I+uPMA5rEUnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR06MB10252

Add support for oauth2 authentication with SMTP server. This will
transparently call a configured git credential-helper for retrieving
the required token. The helper needs to be configured in advance and
will pass the token from the keyring or other backing store.

Functionality was tested using git-credential-email [1] and in
particular the git credential-outlook helper. It works seamlessly
with mentioned helper but other oauth2 compatible tools are also expected
to work, possibly with some needs for tweaking. Helpers listed in [2] are
expected to be compatible.

To take this feature into use (replace outlook with the helper required)

1) authenticate once
$git-credential-outlook --authenticate

2) configure .gitconfig

[sendemail]
        smtpauth = XOAUTH2
...

[credential "smtp://smtp.office365.com:587"]
        helper = outlook

[1] https://github.com/AdityaGarg8/git-credential-email
[2] https://git-scm.com/docs/git-send-email

Signed-off-by: Tomas Melin <tomas.melin@vaisala.com>
---
 src/b4/__init__.py | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index 3d774f70c026..0adf5ca4e435 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -30,6 +30,7 @@ import shutil
 import mailbox
 import pwd
 import io
+import base64
 
 import requests
 
@@ -2922,6 +2923,16 @@ def git_credential_fill(gitdir: Optional[str], protocol: str, host: str, usernam
     return None
 
 
+def git_credential_helper(name: str) -> str:
+    if not name:
+        raise ValueError("credential helper name cannot be empty")
+    name = 'credential-' + name
+    ecode, out = git_run_command(None, args=[name])
+    if ecode == 0:
+        return out.strip()
+    return ''
+
+
 def git_get_command_lines(gitdir: Optional[str], args: List[str]) -> List[str]:
     ecode, out = git_run_command(gitdir, args)
     lines = list()
@@ -4050,6 +4061,15 @@ def get_sendemail_config() -> Dict[str, Optional[Union[str, List[str]]]]:
     return SENDEMAIL_CONFIG
 
 
+def get_oauth2_token(server: str, smtpuser: str) -> str:
+    creds = get_config_from_git(rf'credential.*{server}*')
+    access_token = git_credential_helper(creds.get('helper', ''))
+    if not access_token:
+        raise smtplib.SMTPException(f'Unable to get access token from git credential helper for server {server}')
+    auth_string = f'user={smtpuser}\x01auth=Bearer {access_token}\x01\x01'
+    return base64.b64encode(auth_string.encode()).decode()
+
+
 def get_smtp(dryrun: bool = False) -> Tuple[Union[smtplib.SMTP, smtplib.SMTP_SSL, List[str], None], str]:
     sconfig = get_sendemail_config()
     # Limited support for smtp settings to begin with, but should cover the vast majority of cases
@@ -4118,6 +4138,11 @@ def get_smtp(dryrun: bool = False) -> Tuple[Union[smtplib.SMTP, smtplib.SMTP_SSL
         if smtpauth.lower() == 'none':
             return smtp, fromaddr
 
+        if (sconfig.get('smtpauth').lower() == 'xoauth2'):
+            logger.debug('Authenticating to SMTP server using oauth2')
+            auth_b64 = get_oauth2_token(server, sconfig.get('smtpuser'))
+            smtp.docmd('AUTH', 'XOAUTH2 ' + auth_b64)
+
         auser = str(sconfig.get('smtpuser', ''))
         apass = str(sconfig.get('smtppass', ''))
         if auser and not apass:

-- 
2.52.0

