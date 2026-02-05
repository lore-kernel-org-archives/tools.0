Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC14CA6B
	for <tools@linux.kernel.org>; Thu,  5 Feb 2026 09:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=10.30.226.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770283589; cv=fail; b=pe2qoTofMrPfHYfzXsF1K+t1elmgkLtKpFD41Ekj6pR7PY3+J3LcCnHdjJIy4MzsZhKQGMgOr2PoIMUWn35rbn3lgcAZRoktmwHU8IfqyCYFwMn/XAL/SMejJDX0805AiOxsIiF1K8paKOuZh3v3BaqMcveKbb5JS4SHBZ41oWo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770283589; c=relaxed/simple;
	bh=y92PVZT8LnyvhdVFG+KAN3ypBWIln9qQnvixjVdNysQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Qtf+T2RskknJXoUVrBKBQZXy1rlVUrZQBY13k2B+1HlpZux+KA225wS12ZjcBTY63KxrJK6EbpJCXOwOhd67EML19E3kt4sxrE9mJhx+dM5A9ge+Q4hj9RU8RDGY8LUEay4Lx5MVB8nG+oFaEHCvCaRiIUu3KfiLXvmgUwvTitQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b=0ql/5TEh; arc=fail smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b="0ql/5TEh"
Received: by smtp.kernel.org (Postfix)
	id E1F31C16AAE; Thu,  5 Feb 2026 09:26:28 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11023118.outbound.protection.outlook.com [52.101.83.118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 25B1EC19423
	for <tools@kernel.org>; Thu,  5 Feb 2026 09:26:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 25B1EC19423
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=vaisala.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jR64eF6okymf8b5JfWwCjLKFF6RNYgwD2c+MG6atYBrwS3mQGH7GdbLLKZZrf0QfbwwXM9+FuRTARplCpTxmqIARqcAMcFojtaXxBgCnFGBE7YqrRoSAd0+QZjqGpyWr7ZnMjkCp3NQ8q+KAzJ92rBMcyqwZEgAdFa3aevj+XdRLBuxnvJin/SwgBMpu+Fy/EL1f+FxDVppg6LCehIqjr59BgYGFJjqMN1WrfHM1gX/4sxki+SWSEpT0oxqT3ZklTAmN6uBgiKMT9KHup4dzK6COUilm4AdvmavD5/QpCewI5rPdtaELNlbb1F3V6o7JUoHCkzDKWVdqtkJLRS/TLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IzkjHYNriAsqxKP+VkGoFP+j2Z9aR2LczVscB2i0RfI=;
 b=FAXtYBNFcenpTeCGqaTmHkhzkFOOrVLVBp92QxOsYZKc03OGE0AeEJJW6EN/uWjMxR1LZ/8FMJvdoXCLTyofqgG0Olsw9CbREKXbfseq2+1k6vwhd6Rzao//hlecoXv0dBtrD1rRnF6iq9uMkhf+2mjrXTnqLJky8u72RCVcll9R5Ts3GV6DGhvvlh4E90oEUCU9+P/2jt+n23xHA9rUu4iputfDG54CwN2chp/9HUoyuLPC7ZAJwREErCbQj4WcxfUvXN3F9kKpECC3Z6bHr3id2l0vKcKf6A5NWt7aaJ00l2uHi48MfENX0TauuowZWGU/L/fqT6yZ0uWME/wJDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IzkjHYNriAsqxKP+VkGoFP+j2Z9aR2LczVscB2i0RfI=;
 b=0ql/5TEhZUXX/3VVC6J273HsjPPoFT73ROnlJ5AbZTlZbxSxvrvrobZ9q5plNewzVFbLTDSo8dbUWrN+y4+65EvDqPeyP7IOYkfbzuGz2wwY5qjcRsH4TOn4ZlVHYorD4HyLtx/4RpyBsR+x+dfL9cbKsJnPL8NosAzBP/IkfVW7mFX/vAjwIA1SMhQUL+DiRi6s8pdeXvcsActP0aKNOQEcBdly5D8a7foto7idF0lXDDfeRv4NWWVoD/yeFBdmQX8jx54f76JJYQGiVM85Wxbgz8xYly7rAWmvxR1SmSPM19YhORKLI7G5TMTW/4igkp9Aq4bsAXJLyAYncRHxTg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AMBPR06MB10365.eurprd06.prod.outlook.com (2603:10a6:20b:6f0::7)
 by AS5PR06MB8597.eurprd06.prod.outlook.com (2603:10a6:20b:679::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Thu, 5 Feb
 2026 09:26:15 +0000
Received: from AMBPR06MB10365.eurprd06.prod.outlook.com
 ([fe80::addd:5e9b:7273:8049]) by AMBPR06MB10365.eurprd06.prod.outlook.com
 ([fe80::addd:5e9b:7273:8049%6]) with mapi id 15.20.9587.010; Thu, 5 Feb 2026
 09:26:14 +0000
From: Tomas Melin <tomas.melin@vaisala.com>
Date: Thu, 05 Feb 2026 11:26:02 +0200
Subject: [PATCH b4 v2 2/2] b4: add support for xoauth2 SMTP authentication
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260205-smtp-oauth2-outlook-v2-2-6a5eb233b285@vaisala.com>
References: <20260205-smtp-oauth2-outlook-v2-0-6a5eb233b285@vaisala.com>
In-Reply-To: <20260205-smtp-oauth2-outlook-v2-0-6a5eb233b285@vaisala.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tomas Melin <tomas.melin@vaisala.com>
X-Mailer: b4 0.15-dev-a0347
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770283571; l=5348;
 i=tomas.melin@vaisala.com; s=20251125; h=from:subject:message-id;
 bh=y92PVZT8LnyvhdVFG+KAN3ypBWIln9qQnvixjVdNysQ=;
 b=vvnY/P9mpxAaDfuFqNtMPWxIEV7mpRcChFXd6AfgkFBKd8WOwY53bXjkwudlv0ZRJuoioYWXE
 KBlBvZemdFvDMwn/rA7EHLOa19P0mZu963RHlCfd4z2zL+9dj+2gC8T
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
X-MS-Office365-Filtering-Correlation-Id: bfc4c00b-3176-4376-9727-08de64989b2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7142099003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eXdDQ1hvcUNBUW8xZFhxQWtYWllQUTZVZUdJRmlOeDVsRmszTWtla1RVaUJZ?=
 =?utf-8?B?Rk5TSmpnQTJIa3NpaStxeEZqNTZQV09Md0dPZWVmeWUyNTlwMC90a1hGYWg5?=
 =?utf-8?B?YVRLZHJDRDJkR0pCdjFQdU9tUHh3OFBoSTlnalk0cnpDM2EyZUE3a29Yak45?=
 =?utf-8?B?WnN2aHJGaTFTVHVIRi9qWVBKZ0dIUVJXRVpuS2tlS0JFdzRQQnQzM05sWTNx?=
 =?utf-8?B?VTJ3K2ZVb2RwWjc0d1BYWWZZdmZzQ3pqMDB5ZVBGYldqM2wwb3luYWFIYVdL?=
 =?utf-8?B?Mm9MVitMVmNsb2xTd0tWQVpwSnFOUmhYdk1Qb1poZ2hKOWtBZ1AzN1NqQWti?=
 =?utf-8?B?cjZWU0hpM1puTjhVbHNiU3V3YUtSeENoTnMyYitySVUvWDY0Y1lzcURqUExQ?=
 =?utf-8?B?clc5eFNLd3dWYldnMTRaWW9zYlRPYmhKU0g5YW0zY3NRM2JDVmdqM0VQOTd3?=
 =?utf-8?B?T3lRZFgxaU9BNEd6VW1sU3pKOHFLZlV6QzcyZFhnRmt0WTVGK0p4SnpIVW8r?=
 =?utf-8?B?cWFJU3VjL0EyRHVPem01UGxDQXNmMk1UWlozRUFxMXFvOHBCYWZhY0twTlBk?=
 =?utf-8?B?ZTkyYXNUaHAvMzgyZWpHbUYrKzRtYlhjckdmYnVlam8zbmFhV3gzbnhvUFRK?=
 =?utf-8?B?WGRxUkVoNWNkbnBXOWU5Y1REQTVvU1VzTzd2MWFTR3RueFlQQUlDdCtqY0sz?=
 =?utf-8?B?SUUzWnVUUWVPR1lTWEhoUmpEMjZaaC9iTTdaRi95cm42Ylg0Z0F2cVFvWk8x?=
 =?utf-8?B?ZWliUFI5TU03RExvQ2F3WFhtcHk3NFl2a0UzK0R5R2tzd2d4Tzlib1pHekp4?=
 =?utf-8?B?TTRiUTIyY2M5aVY4RHZMSWtlMm5QV0NlcU5lSUY2OHFXU1BZNGgwcG11TWlE?=
 =?utf-8?B?T2E1emhyNTk5K3JTOUZMQ2NXaGpJQ3Vid0FiQjdQVFhWSnN4d3hlMHRHTzVX?=
 =?utf-8?B?ejU2M2cwUzdDQ1pETEE5MDFyU3N2WHpsczJPZ1poN2g1c1ZUTnpVdEo4a3Zt?=
 =?utf-8?B?VytkbkxUL3NoMTV3RkJaekJGbDJZa203YjhDK2oyR0d0anVrVW5DaFhYWVlh?=
 =?utf-8?B?ODR1VHIyYTRiL2tiNUpCRzRVN1RFUXAzMFp6enFMVGhIbmF5Z0Nlb3JSZEls?=
 =?utf-8?B?ejJhSTREZm1TcmZwTzV3OGplczduV3RZUlVmRUIxY2hPZ1lkVlczOFVETUt2?=
 =?utf-8?B?T1NkNG5hZ2lFY1NWZ25LNVh1US8zR25ZemI4aEJxY3BHbTRkY3ovMXl5MnY3?=
 =?utf-8?B?TTQ4R0V2L0hhUTRTVHNIb1kxQkdWbld1SS9oemtoeWFQOVU1REpQV09LUC9Q?=
 =?utf-8?B?YzNxS1U5T1RIK1Y0N2pOcm56U2xZek9MMlU1OE92ZmhqVEQzZmhHaHRYMHZa?=
 =?utf-8?B?cWpjK0JjOUJvSzl0bmp0Z1ErK2hvcU9pRWxZNnllVU5zcnRWcUdYaVl4bmJR?=
 =?utf-8?B?RDBqcEI3S1dieWZBOTE5RUFHRUp6c0MxeThKMDBMOTFtdTgvZmljUkdpcUla?=
 =?utf-8?B?Nkk0NlQwYUVxMlJlMHY4aVdPNkZUYVFNcVdSdlVqYjBSRkNJSGJ2QzRReUhj?=
 =?utf-8?B?bHlpSHBwSzFnQXVRZDhBQmZDWlJUNFVHV3I3bThLTUFoOWFSM3dGUW1aVGc0?=
 =?utf-8?B?M2ExYldPQXdaQ0NISHlHYVB6QmhXLzZlRDl6ems0TEFpUUJzVHh5TmRBQUd1?=
 =?utf-8?B?MExZbEJCSkJ2Tk80b3VBcXQ4RVBIb21ENElEbmZMV1FjZlZidTh5SFoxdWhS?=
 =?utf-8?B?S1lLUCtDSXdONWxLVWp3TXdEMXBQYURpODRUNklvVi9HSnFzL0tRa2J6K0Ru?=
 =?utf-8?B?aGRZZU1hYWdVV2ErdENFNzdJOEhuejh4d2hvN1BKb1dqTVZLZkNQampSRkVr?=
 =?utf-8?B?cVRpUjE2TjFIdWJxVENscVp6cWQ3TTVhdWhsWmFjNmdOdEZsVmpjN2lIcmg0?=
 =?utf-8?B?VFg4bnJCZ2JTdFJ2Q1NWSEpVeUFPdnVaeWw1WTdVdHE0OEVvN0Y0VFQwQ284?=
 =?utf-8?B?UHdSTWxSMCtrUHczTFUzTXduZW9MNXZHR1JWbDRIRm1oOVBHRGYreE5IMzBp?=
 =?utf-8?B?SkpWZ0RxTUhnek5jNC9IMkNPTWFOS1hIeDF0QmpUcmllc3pLR0tuZEdYUGVr?=
 =?utf-8?Q?u/eFF8dA+Oe3EqTRHMjPirSZ/?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR06MB10365.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7142099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z1YzWFVQcSs5Z2NUODZkNUlFcHhFUGhDZTY4RG9udDJBYm1xd1QvSjc3QnpK?=
 =?utf-8?B?OE9uN0tJMGIzTFNudGhuYmJMQU9SVENPOUFJdEd4Z0JhYSt5alRYaDlwbTVC?=
 =?utf-8?B?Z0V6NWZnVzVVL0ZnMnZPdDg2eEc3QzZ0eHA2S0JXUHJQZWJtUHY5dXhuRmVO?=
 =?utf-8?B?OXNPVHRWcTg5K3ZlZmozK1g4YVpkSUYvUlpsSW1qY0ZnamN5dWNoM043UGtu?=
 =?utf-8?B?a3RtODlmRlVZdXFZZXAxclZkMG0xN3Z5czU2dVdlR1ZrWVBMM2pXZ1VzSzUr?=
 =?utf-8?B?VzZIdlBXR2xhY3NNcVpCT3pObGRnR0NzZmZudHh2cE5nMW9PMXcxM1M4MHpy?=
 =?utf-8?B?VFJkRTFTKzZkRFIyakI5dU1wY2hRaE0ySDExeDZSTjIydCtGL2dtY0tDRDdJ?=
 =?utf-8?B?UlNBMEt4ZkFKWlVuUVAwakFoaUZjbWNleWg1c3NWSkU4eVM5KzdMTzBPdWU0?=
 =?utf-8?B?cjNpb0tZVHNPenVORkJNd2NCWjRMdWliUkFrVVFwakY4NGplb3ZQSVhWam1x?=
 =?utf-8?B?SjBnd2Rkc2tMV3Eyc2JZZjdqYS9LZllGT2dzdVVVaDhUVVRUM2hYdVV1VkhL?=
 =?utf-8?B?TUhyeXdJclJIUEtkNEtHV1ZQZHZDVzB3RFZndXk4MUl6YlMxemxKZmZMTEJp?=
 =?utf-8?B?THp3d1A3OWtwNjh2eUsrM0pHQ3pqOStVelFTdm92dDlCTGtmSUN2anRKZ0JW?=
 =?utf-8?B?YW5TM3hXU0hyUUFVQUo2TWFaTjd2eEU3ODV2dWU5QlNhWjIrT2hTMHpEZmww?=
 =?utf-8?B?ai9JQkJZdWJ2UWV2UGd6VGZPM2s5MWM2QmR3bEFzaHRGVmErZmUxNGtjVDhj?=
 =?utf-8?B?VnFWZkRrd0pOMWd4Z0Y4WjFMRmlyS283Yk54TGhEVnJveU5QeFRFYUhuL3JI?=
 =?utf-8?B?YTRLVDM0aHJ5R2ZJQzJ6OURPbFdRYUVHUjhuMjhKeGl5WEE4UTlMYlRkL1Ra?=
 =?utf-8?B?ZktJUER5U3REWnU2My9HNm9RdHF3TUlmanlELzhYdzB6eHlldk9JYStyQ0gz?=
 =?utf-8?B?dVlSM3RSWjlNMTN2WkF4RHpJbll4YjFtV0hORENiamlmL0NCd2g4eTgxNmdp?=
 =?utf-8?B?b1Q5Mk10cS9GQ3dpckhtZEh4YkRLbUFZdXJydWVYcVhlcUorcldCeVcxUk9N?=
 =?utf-8?B?YVViNVFsRWNUd3Bta1lteW5CUlFSS1QwaGdTc0hwTVA1UWlrYURtdGFTUmJx?=
 =?utf-8?B?VVh5NWpUbnF4cGNnM0M4SFRUbmZIa25pcVhWSHBWaXlYdWRIWVhyYWVvMlEr?=
 =?utf-8?B?UTlWVm5IV0xWcnZWMzN5NHNKcS9maTlHTHB5OHFqdzNucVJrbFRGb241WElz?=
 =?utf-8?B?TDlNajhrRU40ZTRFbDR1SUZ3UER1dmxDUXhBWjFRT2pqMGwzb21qZUpoUTlz?=
 =?utf-8?B?TnJBdG1EUkMrU1FzQXBzd3Y3MjlBQmxZRXlhd3lvNmUwVHlaWld2TU9yV0xs?=
 =?utf-8?B?Wkk0MDRCVU0zTzF1V2VtOHhqSVFCbU1zMXNKcEZ1R2JUR09sNTU0NGxNSWo5?=
 =?utf-8?B?ZXFqOXpaQ09CeUxMbGdoTHc3dHEybmtQbUtyUDVIQ2pMc0xINHQwUjZCbFpo?=
 =?utf-8?B?bnhkT1A5OGlsc0hERlBLYUsrNS9LMGpQRCtMTVNsM0E4Tkx6Y0hoc1JRZnlP?=
 =?utf-8?B?d2huaDgrL2ozRE5veFZOc3h5UFJyUW54MG1YaHNHdFQrdE53WitPYURZcFdR?=
 =?utf-8?B?cVViTG1DQjYxeXdqZnI2a0drcFZoKzZUb3lIYk9pb09zS0svVDJ5S2RyK1hG?=
 =?utf-8?B?RTVBaTMvcHI1d2NoWFpzckFHcHFUdVArc1A5S2kxdkVpUTZieHpUWXdiS1A4?=
 =?utf-8?B?ZWl6OWc5blB2MEFJSmNiN1ltODlnVGlxd2FXNEtWeHRINFhLUENQa0pZTWhi?=
 =?utf-8?B?eDhHQ25MZ053N29Oa2dub1ZtOHdlUU1GbFR5ZTcyZ2dONE5DY1NlOG9HOThW?=
 =?utf-8?B?Z1Q3T2RVL2VRWWNLeHlkWEYwNHlmcFhzZytITEVnaWFuaFovZHBGeXA5bnlv?=
 =?utf-8?B?TWg4dTByWUN0YVY1MHFKQ2VKV1hBUGdTMW5hSWlZWTFrcitxeG5yQ2xqMmIy?=
 =?utf-8?B?RUErdm5ocVJYUm85U3BURkFYNjJSNk1vbGJKN292bER3UUh5bGMwU0RkeHdV?=
 =?utf-8?B?ajltaFc5dDR4NGtsaE9TbjB6eElaaUFSRkxYWjZaRnh2MExRTk4xdWhLSU1Q?=
 =?utf-8?B?QUNPaWN4UFcwelArMm43TlphZ3NSZHZ4alFacXVXSG5zY0ZPdm0wMUF5VFBL?=
 =?utf-8?B?WTlWNnI1R2RFUWp1UThSVElGdjFRWUt6aUVVVnhFQklNUy9tOFhaQmtvYVZG?=
 =?utf-8?B?VXh3YWFqc1R5ZVJSZWlabGNIcnJpVm9Gek9jTlltL29EZXpWZFNTN0V1T2k2?=
 =?utf-8?Q?HLqTOKmTQACtXgdE=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfc4c00b-3176-4376-9727-08de64989b2a
X-MS-Exchange-CrossTenant-AuthSource: AMBPR06MB10365.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 09:26:13.5142
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f6tNOa8sXOfiSjSIcFaveiRxJHqzNk6+Fpid4TLMgQ8RYVNQRTomxwgO2gDnJeBPFl0f/X0y28oyXjZ89qiBWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR06MB8597

Add support for xoauth2 authentication with SMTP server. This will
transparently call a configured git credential-helper for retrieving
the required token. The helper needs to be configured in advance and
will pass the token from the keyring or other backing store.

Functionality was tested using git-credential-email [1] and in
particular the git credential-outlook helper. It works seamlessly
with mentioned helper but other oauth2 compatible tools are also expected
to work, possibly with some needs for tweaking. Helpers listed in [2] are
expected to be compatible.

To take this feature into use (replace outlook with the helper required)

1.
$git-credential-outlook --authenticate

2. modify .gitconfig
[sendemail]
        smtpauth = XOAUTH2
...

[credential "smtp://smtp.office365.com:587"]
        helper = outlook

[1] https://github.com/AdityaGarg8/git-credential-email
[2] https://git-scm.com/docs/git-send-email

Signed-off-by: Tomas Melin <tomas.melin@vaisala.com>
---
 src/b4/__init__.py | 51 +++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 49 insertions(+), 2 deletions(-)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index 3d774f70c026..645659c985d0 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -30,6 +30,7 @@ import shutil
 import mailbox
 import pwd
 import io
+import base64
 
 import requests
 
@@ -2826,7 +2827,7 @@ class LoreAttestorPatatt(LoreAttestor):
 
 
 def _run_command(cmdargs: List[str], stdin: Optional[bytes] = None,
-                 rundir: Optional[str] = None) -> Tuple[int, bytes, bytes]:
+                 rundir: Optional[str] = None, shell: Optional[bool] = False) -> Tuple[int, bytes, bytes]:
     if rundir:
         logger.debug('Changing dir to %s', rundir)
         curdir = os.getcwd()
@@ -2835,7 +2836,7 @@ def _run_command(cmdargs: List[str], stdin: Optional[bytes] = None,
         curdir = None
 
     logger.debug('Running %s' % ' '.join(cmdargs))
-    sp = subprocess.Popen(cmdargs, stdout=subprocess.PIPE, stdin=subprocess.PIPE, stderr=subprocess.PIPE)
+    sp = subprocess.Popen(cmdargs, stdout=subprocess.PIPE, stdin=subprocess.PIPE, stderr=subprocess.PIPE, shell=shell)
     (output, error) = sp.communicate(input=stdin)
     if curdir:
         logger.debug('Changing back into %s', curdir)
@@ -2922,6 +2923,29 @@ def git_credential_fill(gitdir: Optional[str], protocol: str, host: str, usernam
     return None
 
 
+def git_credential_helper(name: str) -> str:
+    """ Run a custom helper to retrieve credentials
+    https://git-scm.com/docs/gitcredentials#_custom_helpers"""
+    if not name:
+        raise ValueError("Credential helper name cannot be empty")
+    if name.startswith('/'):
+        args = name.split()
+        ecode, out, _ = _run_command(cmdargs=args)
+        out = out.decode()
+    elif name.startswith('!'):
+        # drop initial ! before passing on
+        ecode, out, _ = _run_command(cmdargs=[name[1:]], shell=True)
+        out = out.decode()
+    else:
+        args = name.split()
+        args[0] = 'credential-' + args[0]
+        ecode, out = git_run_command(None, args=args)
+
+    if ecode == 0:
+        return out.strip()
+    return ''
+
+
 def git_get_command_lines(gitdir: Optional[str], args: List[str]) -> List[str]:
     ecode, out = git_run_command(gitdir, args)
     lines = list()
@@ -4050,6 +4074,18 @@ def get_sendemail_config() -> Dict[str, Optional[Union[str, List[str]]]]:
     return SENDEMAIL_CONFIG
 
 
+def get_oauth2_token(server: str, smtpuser: str) -> str:
+    creds = get_config_from_git(rf'credential\..*{re.escape(server)}.*')
+    helper = creds.get('helper', '')
+    if not helper:
+        raise smtplib.SMTPException(f'No git credential helper defined for server {server}')
+    access_token = git_credential_helper(helper)
+    if not access_token:
+        raise smtplib.SMTPException(f'Unable to get access token from git credential helper for server {server}')
+    auth_string = f'user={smtpuser}\x01auth=Bearer {access_token}\x01\x01'
+    return base64.b64encode(auth_string.encode()).decode()
+
+
 def get_smtp(dryrun: bool = False) -> Tuple[Union[smtplib.SMTP, smtplib.SMTP_SSL, List[str], None], str]:
     sconfig = get_sendemail_config()
     # Limited support for smtp settings to begin with, but should cover the vast majority of cases
@@ -4118,6 +4154,17 @@ def get_smtp(dryrun: bool = False) -> Tuple[Union[smtplib.SMTP, smtplib.SMTP_SSL
         if smtpauth.lower() == 'none':
             return smtp, fromaddr
 
+        if smtpauth.lower() == 'xoauth2':
+            logger.debug('Authenticating to SMTP server using xoauth2')
+            smtpuser = sconfig.get('smtpuser')
+            if not smtpuser:
+                raise smtplib.SMTPException('No \'smtpuser\' specified for xoauth2 authentication')
+            auth_b64 = get_oauth2_token(server, smtpuser)
+            (ecode, msg) = smtp.docmd('AUTH', 'XOAUTH2 ' + auth_b64)
+            if ecode != 235:
+                raise smtplib.SMTPException(f'Error: {ecode}: {msg}')
+            return smtp, fromaddr
+
         auser = str(sconfig.get('smtpuser', ''))
         apass = str(sconfig.get('smtppass', ''))
         if auser and not apass:

-- 
2.52.0

