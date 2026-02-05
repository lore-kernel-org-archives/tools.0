Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8DF2D593E
	for <tools@linux.kernel.org>; Thu,  5 Feb 2026 09:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=10.30.226.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770283586; cv=fail; b=RsTN0Z61H7VXTr5E+uh1Ms6bPjfOa/HqrLjbP9z+AjJML3FC0bU9QgcVV+1cUmYUK9qXBuUgia2j5itpMZEKhlSbjt0y5JKnWbAQqRVtk3zCErqAgR4rQm4gvb5sm1/oHe8Mah+Zoc6HHsEklumdNXJK2m9fGOPE0HO/PZdvDqs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770283586; c=relaxed/simple;
	bh=77/pNFcUyRS5dHbcG4SThtNzw9qICI1LRU01bA4EPcE=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=Rngkg/rPkYl35x9VbCdoJ5UqXK8cq/Cz23PPiCHMcSoG/QS1eXarcOKEbr5EQQ5896u5W/W7RTWsjI06yc6O8NhBgfiHAUo05rh1NNpzhS0FQIwhnjSWkDEQSGhbGZovHaM3eX+EnWXx9fyjlUoufewdguLcqfGQ1B/Oeg4Ns8k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b=Kjj1TXt8; arc=fail smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b="Kjj1TXt8"
Received: by smtp.kernel.org (Postfix)
	id BAAC5C4CEF7; Thu,  5 Feb 2026 09:26:25 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11023118.outbound.protection.outlook.com [52.101.83.118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8967EC2BC86
	for <tools@kernel.org>; Thu,  5 Feb 2026 09:26:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8967EC2BC86
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=vaisala.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YCetVZM5ZzqTybNKhqQuDoKw2tzC1vzH1RFEX4V5HOilCkQVYI5Ivr3MQyM7ryQ/t4TQi8fo1oKs713+DR07jg46Cye9BFZ9gYseYpr3casbMj0AgeMBdQo8INyt11MQJKVdw/ANrUokoY67DRpk/S0Eoa1ZgXem7uXYb9wsip/wYUhb6w/06NfyPc2XsizLmRHwtmlye57nSBlsiRF2Oa6RAMofPqJgjg4aI+rw1CREaMkxI9Di6Z/XA3gWRZmtfJEuDLJ1LDlbzJM3xgBRanlO4gd6+hY3nPYH6fWsiFvNw8f2mEvhELlaK5RwkhDRvBJAMFVf9UBineK3WOA8kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AFnqHmwe/M8MYdHx+exAfNjt95ZAYpo9Aazz6fCFYck=;
 b=zTEeocZunOoPq93UzLn+R7GrPmpqDDuMFViicIf1ilF89IhuCuYVjxfNzoxqjdYAA+/mlixj0wFt3hMFy6xP2Y8Rij+ZdPsURLFKAD/HmFmOrQ8T1LZVGHewx9zxfRJF63aCi6XjbiDDHg4l/OH9QxsrOghATMifykZp4mnvd4tMIMEqBqE+BEBAr4ncqPpAuB4qfGE0j5GUoFas2lPQReX0dRzYjIMzpMLQCyeKg7+6ac/fVsIdXSoXPXO7N/5gA8rPXguuIScsLfmDDw2SnPPotla41b9KsUwldsn0jviFWRBYvVR7Z0z1tOM2vQ6KjbprjroLn3gCgbN7+4qlDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AFnqHmwe/M8MYdHx+exAfNjt95ZAYpo9Aazz6fCFYck=;
 b=Kjj1TXt8MinD9ys42/nZFYnJPPVwu/RAJiT+MZ3vosZd0Z0FY8gm8HQSaPmsACXlp5+RKDMDmiVeASMj4wDctQ05sXetLhOUBwpvsNvblCW2WNPIUicLLwL3qq1IR5dGMnEBn1eDhuk4ooLKEdOT6pWGidBAVq/p2WMs/DNGe0c6dBJm8b/kzvOHPul3EOtYlztzRlGdhhL+eb0y8bJyygwYppZtNS1JKfVyzdWZuiDdwG9uqnSISUWKfrugSOHNE2uCNjPPj/SBYGrxhpPe0yabE58/x7r6rlu1r/RqFMH07QG1cqevQwVXLFY1vHzyU/pEFqEavT6+CQfVODkEZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AMBPR06MB10365.eurprd06.prod.outlook.com (2603:10a6:20b:6f0::7)
 by AS5PR06MB8597.eurprd06.prod.outlook.com (2603:10a6:20b:679::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Thu, 5 Feb
 2026 09:26:12 +0000
Received: from AMBPR06MB10365.eurprd06.prod.outlook.com
 ([fe80::addd:5e9b:7273:8049]) by AMBPR06MB10365.eurprd06.prod.outlook.com
 ([fe80::addd:5e9b:7273:8049%6]) with mapi id 15.20.9587.010; Thu, 5 Feb 2026
 09:26:12 +0000
From: Tomas Melin <tomas.melin@vaisala.com>
Subject: [PATCH b4 v2 0/2] Add support for xoauth2 SMTP authentication
Date: Thu, 05 Feb 2026 11:26:00 +0200
Message-Id: <20260205-smtp-oauth2-outlook-v2-0-6a5eb233b285@vaisala.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NQQ6CMBREr0L+2prfggRccQ/Doi1FqsAnbWk0h
 LsL6NLlm8zMW8AbZ42Ha7KAM9F6S+MG4pSA7uR4N8w2G4NAkSMXKfNDmBjJOXSC0Rx6oidrsWw
 yVPml5QVsy8mZ1r6O1xuoDOpv5mf1MDrsd3ursz6Qex/qyI/uz1L+tUTOkJlC5w1XiBrTKkrrZ
 S/Pmgao13X9AJvZbdTOAAAA
X-Change-ID: 20260123-smtp-oauth2-outlook-f09d40b65f18
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tomas Melin <tomas.melin@vaisala.com>
X-Mailer: b4 0.15-dev-a0347
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770283571; l=1277;
 i=tomas.melin@vaisala.com; s=20251125; h=from:subject:message-id;
 bh=77/pNFcUyRS5dHbcG4SThtNzw9qICI1LRU01bA4EPcE=;
 b=wxtk4BXQHBi4I0L+UhfOptI9bKrjNGeR2ONkvw39tJ6pc09ai4566YiVSUjS1N3e5K6NHWL5y
 uwUqsEuNYhrBAiw/5qGGMAWjUmrxzrrNcqzggfuFqGCYvfGitAnXoon
X-Developer-Key: i=tomas.melin@vaisala.com; a=ed25519;
 pk=6lMiecjZ+OeyZuxYsDm/ADy9D1JKvYrKdsYv58PMepU=
X-ClientProxiedBy: GV2PEPF00023992.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::19a) To AMBPR06MB10365.eurprd06.prod.outlook.com
 (2603:10a6:20b:6f0::7)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBPR06MB10365:EE_|AS5PR06MB8597:EE_
X-MS-Office365-Filtering-Correlation-Id: e815999a-be3a-4f3f-41e7-08de64989a78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7142099003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YlhtaTR2TVJUT1BweUo4RHpsd04vZTIzM291MlNhNlV5eWUweHZRYUFKRE90?=
 =?utf-8?B?QW9YQ1VZT2ZlbFJUTEI5TGZYUTlWM1FSR29TN3ZPZUU4UG9uQTlEcHdGQmZS?=
 =?utf-8?B?bFRtSTlyWXl0eml4bHM2c040TDNLZnpIcml1NUZnQWQ3Q3BqdldLSFljM2xi?=
 =?utf-8?B?OHp2YTc1Nm13b2hJbFkzYm4wSlVVYmd2YTA4K1ZFWE4ydllnSVZRR0Q3OHQ1?=
 =?utf-8?B?QU8yTlVLMnRoS0w1R3dvUEZyeDdUZmlRZ3NCQ1VMU016V1BIcnpkUlRNN0pp?=
 =?utf-8?B?TGlYeUtCVEVodjA2cUxwZG1JSE9uZDhUbFBqN1hTaFBINGE5T3ZTcGd1eWFh?=
 =?utf-8?B?dHNPRVZXYThtbUMwaXkzK202NVl3REdOb1N6Wis0UkI3YmZla1BOOW02Sksz?=
 =?utf-8?B?Y2ZEVlk4SXNUWGNOVk9oblZKcXY3UVVTOXEzL0hZNEZzRUtEVFhDUHh6U2xL?=
 =?utf-8?B?N01IK3Y1NHdiNFdKWjFaWHVSbHBtd294ZlFIekpGekJ0TGRHK1ZRZG1uQUxt?=
 =?utf-8?B?S2x2djZQcVpMUngrWmpWMm15WEswUFlVZFFWYzFacjBOTzFsSDlnQTFmUFpV?=
 =?utf-8?B?VlVTUWwzelMweGZjMzQxNEV0UEFmTGxoSnBESmxlSmZWdEJKcENqWmFYd21z?=
 =?utf-8?B?dXhkdHpnN1hQZCtDWVQzQU9DOW9JeXZRQWp5QWJ5V0F1cjUzVFoxZ08wTFdo?=
 =?utf-8?B?cTBFcko2bjlmdXVyUVo0ZmlnRVhTYUpZeEp0Rzl3elIvVzd5ZHhIK3QrZDBr?=
 =?utf-8?B?OWZzZEVtSk5VV3ZyeUpBZWRndXIwRVUwRWliUkRvdkFSU01LbldxRWJ0TWFK?=
 =?utf-8?B?eXQ0bmVQSVlXMHZSYW5pYTBDekNlZVI5UTF6SGJNQ1ZRaXd1dlNxVW9mc05r?=
 =?utf-8?B?L3dTelh6SUJpYVBkcUZFcldrRDlEWWdFS2JkR0RqTE1XbUNobm80cEl1WlY1?=
 =?utf-8?B?b0ZKZFFNaDdFMjlZTXl0eW9DSlB5Q0tqNHNVSXl0bEpaRTJGREdzd0NnNmFZ?=
 =?utf-8?B?VDV0UlRwam9EcEhiU0llWnAyUGZqRnNoSjQ0VEFlc0M1YnpmWllJK0JVMVRi?=
 =?utf-8?B?aGtJNmpXWnFsbzV4VzJzYzVHTkRJdW1tcE5TQytvQUY2bkVmYTRWVmNOUHZH?=
 =?utf-8?B?WjVzL2dSaGhSamh0Z1E5MlYwQnViWktnZThadFMwYWVsSVgyclQ4VkVUdFFR?=
 =?utf-8?B?NU53ZWpGVDJyTFRSMXRqWEc0U2F3eDB3V0ovVFN4VGF6MmRSRHZSUEFxZ0py?=
 =?utf-8?B?dWpqZS9zTXgwM3lUWDh6Q3phQmc1d2MzdmNXbUNJcHdLNm44VnBwYncraUtz?=
 =?utf-8?B?VEVSQWE0OVpUN1hlbTZDeW9WVUFjRlI1Z1Q0UUFjTEZFZUF3ZFhtSEU0aGpQ?=
 =?utf-8?B?T0QveWExZmdzTitNOU1sUitDd3FvMVJiZjFWTnhsV1JudG1iNnhKU04rUjAr?=
 =?utf-8?B?UEowdUJxRVUwMktkYnJ2QlYrVzM5UHZBZXZqTklFZnV4cXZIWVBvYjFLeDIx?=
 =?utf-8?B?Mmc1b1VGdlpXLzZXN3gvQ1RkYTZJMlJxOExlSHNwbGNERWhPLzYrOC9JdjVN?=
 =?utf-8?B?ZmNLWUpnSS9ENXQ5blg5UWJkM1phaDR4MEIwakcyYTFva3dhSUVyMm1BZXRF?=
 =?utf-8?B?SkN1eWtSK29HMENjN0dLOEhmRXlxNDBlY2c4VEExS3JPVnhOQVY1RlN0eXJ2?=
 =?utf-8?B?MkIzeVFDOHFnN09TZURHKytHVzl2cUxOMStCZUVFaGFkSm0rUDBkeGsyZXly?=
 =?utf-8?B?MG50VG9HM0N3clFSQVFPWVgwMW5XSUpqZVdUVXRJZG1Xd3lMVFNaMUovd3Br?=
 =?utf-8?B?dGs5SnhMVll0ZGJBbjdlOHVWMW1kYWFOT0llWW12YXN3YW9mWjlsQlVMWmtD?=
 =?utf-8?B?OCtBNW4rbUJTMkVEcWxyMWpPOUNBWk1nSEc2VDAycnFNRzBXVk1Bekl2dDND?=
 =?utf-8?B?V0Vlc3NvSWI3ei9xelBhWGx2eGlaUjFybmFnQVBLQjRNc1pRa2FGMDYyTnMy?=
 =?utf-8?B?U0ZUU0I1RVQxcUpjeWM1NDVYbEVEemEva1puSW84dzZVOWxxVTlzZnlwOEkx?=
 =?utf-8?Q?L9D6GT?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR06MB10365.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7142099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dG5BTnB3R2ZFdGsySDJ4YmZ5TS9YekJ5V1YwSE1zTzNnNk9CajFsVm94SjhM?=
 =?utf-8?B?WmRuMjNBVFZ4YUNHSzZGSkNZWU1zOTMzUmsvWXlRZDZUK0NwT0VBOE9yR01j?=
 =?utf-8?B?b0l4SjcwaS9qSU1YYTNWdGNQb2J1ZFMvWmFmdVVvY0ZQUW91K1hnam1uc1RG?=
 =?utf-8?B?VjlSSkRielA4T0FBNjlzdXJVMjdiV1FuREV5SUVCLzhhcExhTytkZi9PODN2?=
 =?utf-8?B?NmdQR0hwUGpZSGErK2l0Z2ZBZVlrc0V0L01hRmovUFhXZ0FyT0FNL0NDM3BY?=
 =?utf-8?B?VjZ6OGpBOWhlUHRMTUUyUmc1MWppSC9oMGlVVEt3NlRKeS92NTAvN2JoYmUw?=
 =?utf-8?B?ZjlIM0t4Ymw1QjNHNnRhek1BOWxaS29wZjREMklENFE4UVFqUFhJa2NORHBC?=
 =?utf-8?B?TFZVamUrc1JOc0J5RGVkS0MrZmNIV1FmR3pxcUttbk1kQzRSMm9jeGdKRjVw?=
 =?utf-8?B?aUNlbVR2dU1kNk9ZRjNVMU1FcWVCak5GeVNrQ0dzeDE2eHNjK0QrK3c5aVJx?=
 =?utf-8?B?QTYvVzlKK0ladHJRTHdKQzFSUHBZN1Q5QzU1WFBtSmZlUFRMNE5OaWM0WnFN?=
 =?utf-8?B?V0ZjVDhjSGttWG9VNTIxV0t6UHZiaWNpZ0hEQmhKQk5FVFAxMld5UTlhcFJI?=
 =?utf-8?B?L2tYaERRbUJPK0xsaGVNb3luaWsvL0xGY0h3cExXN0VPWS9LWFcraWZBVzNp?=
 =?utf-8?B?cXMzTkJyNytkdGU3dGwwQW5OMGl5UXRuRXp0Z2Y1RkZCWGp2QXJBeEJGUXRo?=
 =?utf-8?B?OHB2NmdRMEJ3SDBHTzFSNXE2Sk11TkhOS0ZPOTdScnQ2dmNBd010KzQ1TnNN?=
 =?utf-8?B?OE1UV2s4cTU3YnkzNzRvRXhsRFVPbjN2ZVFqV1E3cjJkaTQ3MS9OUjBiaTFZ?=
 =?utf-8?B?WkNUWFFKTGpBM3hOcnExVjFsNEZnRG02eXlna0wwT2pXL3BKVFpFb2pqaUsv?=
 =?utf-8?B?RkEvVFFUUVRxekhrdXc2aHRDQkljK2JzNU1Hb2swWDRqMm1RM2hvVXZaVkV2?=
 =?utf-8?B?MmJtZExlM3ZqcFVqMlBkTldwazhSaGtER1U2aXg2Zkk1MGJPMjdDTHF2S2k4?=
 =?utf-8?B?NnBJOWNmTG1pakpKQ29qNEozVWtxSTZNS0xjeEJVY3NkUzhndW5lSVNaUVh1?=
 =?utf-8?B?RmtwWjBHOUNpL1poUEd4OWlhc1EyRXprQ2t1cmhPRGRVZGpjZUdwR1lPZTB2?=
 =?utf-8?B?TWpVVmZQRENyeklQTytVdWpUeEdnNlJWcG5jRS8zTXBQb2JGV0kwQ25FSHky?=
 =?utf-8?B?TEYyWlBGcEg0bllLN0JPeWhXa01QNVdRUTJSU3dNLytXWUN1azRsVVlKdmtj?=
 =?utf-8?B?SndiYzA0TWd0Zkt0NTcvWmRkZXl6REUrckRPVEErYlBRM2ZKcVk3Ky9UOGZY?=
 =?utf-8?B?ZlNFbDlHMGtJdlJRcUdVTy9YdTg0cHpMS1hNdXhsSHFZQTh3bG42ME1RbWhE?=
 =?utf-8?B?VUxac3lHWStKVkJ6SnRqcWIyWW5PZHVWSzVnekk3Ylc2bHhyK0x6SVlvckIr?=
 =?utf-8?B?cUQ5Z3NiRkkydGZxdGJZWndwakk2NVJ2NlN5dTZXOEE3aCtxcXgxakRJNFl2?=
 =?utf-8?B?WHpFWXdFYnJoayt3T1FyWmJsRlE1MHFEdmx5a1JXUEYvYTJ4VEh1NGlrUHVt?=
 =?utf-8?B?UkhTMFB4Vnk2K1dZNElHYWt4Q1o1RUNnVUZ5TktEVjFvSWgrRzBYSXg3eUx6?=
 =?utf-8?B?QjJpRmxvVnMxUUo0SmlzczB1L2RxUFpVdmI0Z212RzIyeHZtZEQydW1yL3A3?=
 =?utf-8?B?cjh5MXFnanBldW5aQzBLR1J3eDR6TzFtSkNWcHBQdHI3WjR0WWhseWtUakxa?=
 =?utf-8?B?b2R1N0VaTmk4a20wSzZDN0U4azkrVEJlK1FLTnF6S1lHSWhKTXh1ZTloNWdt?=
 =?utf-8?B?QlVERWN5UWhBTTBuNUxzalNVMlFjc0F2RXRvNlNjNmNlYit0RS9TL3Z1Vllw?=
 =?utf-8?B?cmlQd0cvSVFoSUlrSFllcU92bTRnQ3Nid1hLZHF2dDR5Y3RDaHA2ekhQY0Nk?=
 =?utf-8?B?enJnVEQ2OUJWSkNzZHp6S3B4djlnaU5ZMXJRMGREV1FNa2w5TlpVY0VYWEFW?=
 =?utf-8?B?aHB0Nk43VTNDUHVGSGUxTHpvUWJOeFZKeFp3NXN1b28zSHhlTzFRNVpDNzN6?=
 =?utf-8?B?U0hwdC9Jd1ZtUktxY0pFV3lPVjhKWXgxcEJkMkFaSkM2dFZnRWF5Zk84czVv?=
 =?utf-8?B?VGVUMUxReDV3bHovaWs3aXFRWWdHZ0tBdWNGRlJ0eUU0NnRjZWNHU2cyWnls?=
 =?utf-8?B?WWI3UEFqelozazhhUEtEbHpyWTQvMUVML1Y5Wkc4bFA5eXhHdlVLamI0R2t6?=
 =?utf-8?B?YlBVYi9LSUx1b1E3TVo2NFhVaVBsODNtMHVUU3RPVzdDcVlDbXdtejYrTTVH?=
 =?utf-8?Q?DLiPBIsRCJw7F60o=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e815999a-be3a-4f3f-41e7-08de64989a78
X-MS-Exchange-CrossTenant-AuthSource: AMBPR06MB10365.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 09:26:12.4052
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j687PWzw77Qq78sqxh3kPGfyvPJsObu+TLq+sH95bUp/iaxHgYLxrDZmY+3kDwtosFEdrj6fqjG1Shdx9vMlrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR06MB8597

Add support for xoauth2 authentication with SMTP server, integrating
with git credential helpers for retrieving tokens. With this approach,
the same configuration as is needed for git send-email can be used
to send patches using oauth2 with b4.

Signed-off-by: Tomas Melin <tomas.melin@vaisala.com>
---
Changes in v2:
- Extend git_credential_helper to support same modes as described in
  gitcredentials
- Modify regex operation when searching for credentials from gitconfig
- Do not fallback to basic login when xoauth2 is in use
- Improve error handling for getting config values
- Improve error handling for docmd command
- Print auth method only when smtpauth is defined

- Link to v1: https://patch.msgid.link/20260129-smtp-oauth2-outlook-v1-0-e8c6d1b00c03@vaisala.com

---
Tomas Melin (2):
      ez: add SMTP authentication method to printed information
      b4: add support for xoauth2 SMTP authentication

 src/b4/__init__.py | 51 +++++++++++++++++++++++++++++++++++++++++++++++++--
 src/b4/ez.py       |  6 +++++-
 2 files changed, 54 insertions(+), 3 deletions(-)
---
base-commit: 477734000555ffc24bf873952e40367deee26f17
change-id: 20260123-smtp-oauth2-outlook-f09d40b65f18

Best regards,
--  
Tomas Melin <tomas.melin@vaisala.com>

