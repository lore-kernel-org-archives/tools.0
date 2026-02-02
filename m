Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C3628AB0B
	for <tools@linux.kernel.org>; Mon,  2 Feb 2026 14:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=10.30.226.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770041402; cv=fail; b=CNOlPs+b9Z67M+lFwfb0rtwHgxMzhPHoICTs0FYN1uS7yA2JeYkZIsEAVGubCsiIPtclIdDQIDEQPqcvsHyQk4X/Qh42LvR0y06buqfaumST07cboGSXe6sKZlLPVRQ0TsjM2RmpC5J/qft1L3P0Tgi4d4gSwPCQcGGBCqP4yOI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770041402; c=relaxed/simple;
	bh=YbvzkKWYt35sIEH7VrS+uV8O+Zk3jIL3AtgVxqe4TRg=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=FAqVAio5lapfIuMaZnXMkwx2JWCFqRQ3EGlaAtUCK693xP/4pad1wgCZ2Nxkx8vZ/Kq+7Z5khpMVwgzObxNBhyQZudXAOGBdmSBOwbJQxFd4c2FK0iqu/wkhyvW55jgv7oGGGZ6whiyo8bKOmdsx00KoioATu3NEYU868Wh+FFI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b=g6foNUHB; arc=fail smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b="g6foNUHB"
Received: by smtp.kernel.org (Postfix)
	id C1B54C19422; Mon,  2 Feb 2026 14:10:01 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11020143.outbound.protection.outlook.com [52.101.69.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8577BC116C6
	for <tools@kernel.org>; Mon,  2 Feb 2026 14:09:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8577BC116C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=vaisala.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nuB9Z6zIe0ZQSCG4p2e/D/TehFAymjW+Yk+/kuHpoTZPa7mxxG9Iyx9KegVntpqW5M5il0UkzvOGQzlCfxGy7hdlkA6QJY+6OUkr2VhjDpjZjZFNqwyhhcADgh3ja1za5nDkw8dn4XAKizVCNYfJAvBqL2TUsboGdtUe6jBcGNm83LTxSDbPAWtxJhW+xoVRNNi4v10xi1vlGUKNMT8t2idxFWmBXOjSunLGLO8UZ2biqvMlDeZiB0S5QCWoClmHbQ+FR1JVuSAV8q6oNgHPXs3+kHX/F+QJQnhCsp5PWfVujiZh9FU8HeOPJBY9z9vBGjcmbuvRImn+iorG+HVjIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=euxmWCne9af6L32SNLH7h5GWzLxA+qYrTTk/y+dPOY4=;
 b=gfMyfa4jqxoYTHbi6YNY5PeB4At6MY3hdZIUikF9M70Drnp8HRuQjzcz/pKIrbNOeuKxWwXIXVpG/9YTicXHnyh4T0eodzc5+2kHZK857gPpGgDBN1NcRCDUDWP4qNRWswJRIY/u0A3EXoYA4PfE/uqWwDcfEX8EXj6sAp6mUHo+1Rtj683yWeqs6brQ2BKooXw3qXJuCEGfSf1qsUCFOJh6uR1a+LqbAPsVBJY9p40/yQwy5aadS/YXMzT8+nNAU4HG59gWS6SCUW3iVyNygBiqXZsBKJG1q+n0E98vLAE+sLtcgGRNcCDepZn1Duom4m7c0opa1edQybVfTcRMmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=euxmWCne9af6L32SNLH7h5GWzLxA+qYrTTk/y+dPOY4=;
 b=g6foNUHBmRQJ4N5BfwfETRVfgA081Q+TWfTO85oyRqa+fAnmD+AptS7SATYhdGDcXfzdntCMBqRFfikBtSB1l4A1FtXwOpPaTEQlpgX0uBaGENUXrqkJGbigItpddKQ9c/qM8rC7zRUhQhBZHbiz/uyfZPEeK5FPCzmq/+EN6c2y6Xr8E8PKWaYXZxEkhuJgOBZ8oAm5gEwYhWRlr2TXB0F+s7IIShcGCPmuidurcmLORk7YUmsQyLkxLBT3bU84LLIiUTRcubTbDKZ7DT8/2SxOPznYISUG5XiSeuSH9YoVOLGQba1U3Q93KbXoRYqcazL13VPdE5AXJ5IIgkqKSw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AMBPR06MB10365.eurprd06.prod.outlook.com (2603:10a6:20b:6f0::7)
 by AS5PR06MB8804.eurprd06.prod.outlook.com (2603:10a6:20b:682::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 14:09:53 +0000
Received: from AMBPR06MB10365.eurprd06.prod.outlook.com
 ([fe80::addd:5e9b:7273:8049]) by AMBPR06MB10365.eurprd06.prod.outlook.com
 ([fe80::addd:5e9b:7273:8049%6]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 14:09:52 +0000
Message-ID: <40efb93d-ee7c-4ce2-9a9f-d7e6ec8bcf14@vaisala.com>
Date: Mon, 2 Feb 2026 16:08:16 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH b4 2/2] b4: add support for oauth2 SMTP authentication
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 "Kernel.org Tools" <tools@kernel.org>
References: <20260129-smtp-oauth2-outlook-v1-0-e8c6d1b00c03@vaisala.com>
 <20260129-smtp-oauth2-outlook-v1-2-e8c6d1b00c03@vaisala.com>
 <176992425475.611611.11253371452032746350@lemur>
Content-Language: en-US
From: Tomas Melin <tomas.melin@vaisala.com>
In-Reply-To: <176992425475.611611.11253371452032746350@lemur>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV2PEPF000239D8.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::16f) To AMBPR06MB10365.eurprd06.prod.outlook.com
 (2603:10a6:20b:6f0::7)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBPR06MB10365:EE_|AS5PR06MB8804:EE_
X-MS-Office365-Filtering-Correlation-Id: 0000687e-2565-4bf1-34d6-08de6264bbfd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7142099003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dWtxY1ZsT3JKaWx4Vk0rWGlwb2l2WUcwdk9uaHp0UDlNQStlc0hUWlhSTWpr?=
 =?utf-8?B?QlZQNnc4anJna1BFME5kLys5MHIyRlBCdmxXbGJGb2s1ekdLc0wyODd5OVBJ?=
 =?utf-8?B?WDVrZStOSktLTXBscmJZWVdocHJkcGsxckpSSk8zN3kxTHM4S0NLWnpyV0VH?=
 =?utf-8?B?aktmWjBVMm5pV20xWHZ2cmpSajdrbVBGUlkrbnpyWEp0bE40bFdmbVNBTENX?=
 =?utf-8?B?UDhNRW5ZU0VNeG94cUUxZFVkbXcvdENQdTZHU3BEWkpMd1VxdE1HMFZOUmJx?=
 =?utf-8?B?Z2lpK3RJU1dYVzMwUHgrQ3RRcU50QlJaR2NJWTVhUVc3dnFhd2Y3NkNSbGd0?=
 =?utf-8?B?WHZuL0VlaTMwSy80TnRqN2FCd1JMN3M0TlRLVlVjbW11ZTlsY3laQ2lJRTl1?=
 =?utf-8?B?UFZ0c1pnYWxJVThRQTVVK2xBQmV0dE13M3Bzdk85UWxxU3MxVWhucjNOWkxk?=
 =?utf-8?B?c04vb2twMllPeVhGUk8zblJYUGNUYURtd0ZMcktOaFV6R3BEeWFPWGYycGJS?=
 =?utf-8?B?S2FUb0Q4cS9HUFpNVHlTcENabnppbnROWjVWSmRpbUo3RlZ3OUV6S05wMkUy?=
 =?utf-8?B?OFBoazhFQWRUNW1BdmxqWXlkakFrMjVzSm9QQ1Z2T0RzSUlQZ0RBdGdHNmhp?=
 =?utf-8?B?dU1POUgwRHJXUEcrQm9mUnI5SGtqL3Z1NFAxMVBVbGdBREVObjI4SE85emR1?=
 =?utf-8?B?V0UxeGYvMlBXam1yVjBpalhYdDVrNFlTMEtWUUdSSDBZUVcrMUc5NWdPZFBj?=
 =?utf-8?B?V2F2RXArUktzbHIrYWJ2bjVlVndoN2Q2S3VWVGZUbTdPNHkvczBtcWlVQXVs?=
 =?utf-8?B?Nm1ZSVJEK0xUTklDZDI5NnNJaWFMa3pLRXZlMGRyYXdiUGlVT2VqbHpaQTVU?=
 =?utf-8?B?bzlXa0I1RXZlOFJlVDlLR0Y5TGo3UEdtTGl1UGpYV29ZY0ZZMUE3UUpFMzhP?=
 =?utf-8?B?K05acUlwNFppMmVMWFJsajVxeEFFeHJVdWJqMFF2Y3hnMjFKczRwTzdTTlNI?=
 =?utf-8?B?ZjBIY0tuTmlpN1YwNFZpUmdaWEhqZm05Y1Q4R3QwQWxSL2RZaythaHFkV3Br?=
 =?utf-8?B?a01pYzBBa0xhTStIcEJFQ2N1d2Vrb1pkOHd0S2NzUTh4cVVCQm10bnJSRitu?=
 =?utf-8?B?R3NKWi85MnZHdXlFeldvT2RvcDd3M0doek5ibWhCUUJtTjUwekZ5T2NLNmRm?=
 =?utf-8?B?dVhZMEY2SjJlVjQvbHpXQTBMRDc0SGVPOWprRXNJczRWUWY4OXRiOTJPOWQx?=
 =?utf-8?B?WmJ1R2hPSG1HL2dES0NJblhvb1VPcTA1V0JuYnJVS2duTEtFQ2tXR0xGbkFj?=
 =?utf-8?B?dFc1bDhnN0xJMU5JUEt4TndnSVg3cDNTcGVuOWtKVW1adjFYemVnWkFja1FL?=
 =?utf-8?B?aERjMkxRMFgrMXN5RFRvb0hDcTJvaUh5QjhaaHVDWVN3eWVQN0Q2bDEyeFhq?=
 =?utf-8?B?eXJza0ZuS0tSaXJyZzJYK0tuTzdkdGhaSTRsTWdwRC9UODB6WmIyRnFkaEQ3?=
 =?utf-8?B?dWhkNE11cjI1ZlFoQWJYQVFWZ2JxYUhhU2g0SHBJSytOZU4wL2tpZnRnaXB1?=
 =?utf-8?B?OVVqWFJVdVF6SG9yZ045N3NZWE9GcXRIa292YlJ2MGF4c3pxcXJpanVJVVlq?=
 =?utf-8?B?Y3VpOE1MUU9lUXNDcmw5aENIRDRERWFhdytzQ2k4ejR5TFJWcWVVZ085ZjVn?=
 =?utf-8?B?N3hVT2NWS2liM1htNXdWUXg5YWU4QnpaZkJRTk5veFFvVHl3b1piRGpKUHI5?=
 =?utf-8?B?ZG9xYjVBL3JPejY1V28rVnJ1THRnQjgyMUU0eGdmbHhMeFgxeC84OFVXbVNt?=
 =?utf-8?B?dmtjK3BjbnI2TlozQkd3d1RqQXo2RS9OV1NEcXhjamU5N0wzWHFhWXlQWUdY?=
 =?utf-8?B?d3ZYYnVPSlQxb01QcmFHOHF0S2RiZ1B1SVdRek01S2lrRnp4UnRXajNmcWxF?=
 =?utf-8?B?a3A4VmM5R3A2K200TUZOdDQraElBOVJhOXJrK3VoeTUxSTN0SjhyMEIxM0tU?=
 =?utf-8?B?czRmZjNDdmwyckJRVnpseXNlRkZiNzBuQ3NIQzFDZko2YVViQ1BzSCs0bzhm?=
 =?utf-8?B?aHNrN0FnVXFJejJWVG9aeVlCRDdyaHVrbDZHYU5DUEtsRUdnak9VbkFYMWlF?=
 =?utf-8?Q?uQO8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR06MB10365.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7142099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZTJDWE83c0FwUmtyQUwvZUlad1MrYUJGZHJuaEpZQnNYcllxVHVMNlJsSVhK?=
 =?utf-8?B?YnBtMlVZVkdDVG1CKy9xbVdiajYxc0RhRWViMjVUTGVYODE0MWg4U0hiSlVY?=
 =?utf-8?B?U3hsdDljR0VHVjlwZXdHMzZIZUtlZGF1VkVUSC9PQWFscE9GeTZtdnk2Qk9k?=
 =?utf-8?B?WThKL1c2ZGdWNGdRUnc2bFpjMUlIcmhaRUVmQUlqS0ZQZzgxcWlGZWt5Q2lk?=
 =?utf-8?B?azZhRlFxK3pnKzF6NVdPWENVY3dRU0hFY002ZFFNVzdzSEJkSmdaZU9HZjBn?=
 =?utf-8?B?Uk1IT3JKMFBxOFhWOXNrTGZxYXl0aTlMdVZlRXpRdkRpZ0hySXpxY2JNT3ZC?=
 =?utf-8?B?UDdSR1hzTVR3SjdjbGNLTllOK3hKWHRXZ0RPN1NSekhYM2Iwb0tHMW93emM5?=
 =?utf-8?B?N1ZKZlcxMHVna2RNZzNoRFc0bUZxUzJGZmJwVlI1bjZlUGgvQmNFdGZQZVRi?=
 =?utf-8?B?NlZQbE5oaGhOTTNlOUV3YUxqdCsxTEhTVDI0NGlOYU4rNVV4bDkrVGN2RFc5?=
 =?utf-8?B?amZqUGpLa040TDkzcjFMWFJLeXhXc25zT21Ha0hKeFZJWngwNmMrcFdRRkNF?=
 =?utf-8?B?NVZWbVVIV1V1aVYzY0tjTXhZZTBYT1VNVzRQWTRreFNEdjR2MXphWURkZGor?=
 =?utf-8?B?b3dPQ0s2OEZ1TjNyVEMrWWtQWENodGtHMTY2S0FDdHVYa3R2Z2RITzBKUDhy?=
 =?utf-8?B?NlNlelBFMjJlZnh4YU1ra25SQ05OUWlVdFd4SklWY0FXTmk4MjNISm1pQmRH?=
 =?utf-8?B?RlRpUE1hbUowcU40aWpMZDdGSklTUllsRFdaZk9BMnh1UGJyR0ZNUHMvTStk?=
 =?utf-8?B?KzRWMDZpd1FGSExSZjVSYXRNdTZ1N3RsZjVWcVc2Ymsxa3p3SFVHcTBmZU1Q?=
 =?utf-8?B?NTZBWFJ1bjRhNUlUREh4UWo1NlV1UG5qT3lUR1A4VU9CMm5jN1J0SXpjaWU4?=
 =?utf-8?B?TUdOejRDQ211TjNMWUtrU2QxcTdpSHF0RWZ2b0c3RDYvcFhCUTltSm9NdFpq?=
 =?utf-8?B?Q2M4NHE5YmgxbjkvMWJYSkZCZzd2V3daemlEOXV0LzNoQjBwc3lqK2gwSXVa?=
 =?utf-8?B?T0ltMEpUakpJT0x5bnBpMlFvYkV0NVoySnhOV2lTMXpoNmFlaWU4d3JFMDA0?=
 =?utf-8?B?ZHpHR0lUNm5Ed3crSkVjaVEzSlM4VlJ2Skp2OU9Mc3Y2clA1YjN2eU5xNWY1?=
 =?utf-8?B?eHJFZWhYNkxjUXk5aGt2UWQ1d00yYWNvYnI3bllTNWtUZFo0dEVSUUs2bVE1?=
 =?utf-8?B?ZW4xemg4TER1aUo1NHJHYjVNTmtHcW00V1JaT3kxVU5HN1hEM2dZdkluTHlp?=
 =?utf-8?B?dzNIcFNNeFdNQ3cwa3BLd2tycS8wTTZieVNCZ3pQUXY5dm1heU9rYWw5ZDNW?=
 =?utf-8?B?bjBPcEhaeitjUi91K090UFIzTFZSUnA1VmxKNDlPa2VsbnhyQSt5Y2JWSG05?=
 =?utf-8?B?Y01pVUlyTWxtN2tBMUY3SS9MMWRPRXFGcXhmT2pMR1J3NlRmN2huc2d6em1R?=
 =?utf-8?B?NUI5aGE2bmc2OXJMTGIwNkNsbFh3N2VEa2hzMjJsbiticjFUTjI3MURkN2Z3?=
 =?utf-8?B?YXNJZS85MDBKNUFYL3preFczREROL3FBSlFIalpPWU1lODF0QjU2SjZDOVB5?=
 =?utf-8?B?K3ErbXRibGJ4a2FjOFduUWJwYnQyMzFLQi9LQXNtYSt0YjhXeU1FTTFXVTAv?=
 =?utf-8?B?eWc0c1ZtUWE0U3M5U1dsclBQQk9uU2ZKa3FORFREOFlxcXZTTzlJNG1LdDNU?=
 =?utf-8?B?Njc3WkZLUmhjcFRwZ1VoRld0NjhjYnlpOCtrdTFjMmZPWHhQUmE1V1FwY2N3?=
 =?utf-8?B?THc5VjBkNTF1QU9VU0pGc0R5a1A2cytWcDJwOUo1Wm9Rekx1MlYwOEt0K1Bm?=
 =?utf-8?B?R2FjVHNDRnY2Rzc5U29NUU0rTVF0UUpvZFZ6aXlNZFpQVVZQTlE1VkdJdktp?=
 =?utf-8?B?enFrdXJLVStMbHdSRnNCbHp6dHpwZGpjaWJoTjJyWC9MbExLRnFpSzBNdTd2?=
 =?utf-8?B?RmZKMytkaHh0ZFE3a3dvSnZnaWdFVHZPS2NRTXVpekYvNlFTeHlsRzZtNlB2?=
 =?utf-8?B?VWhyc0ZmbjFodURSdUdYRE4vb3lCVXRWTGpVL2M1WmhtOXRkZlovcUU0SkYy?=
 =?utf-8?B?Ykl4bThOREdpTkRpdTBrTlRBOGtXUE5kVG55SExTbHM5NzZuZGNtUTh4dzhO?=
 =?utf-8?B?N3duVXJGcTZmNTZSeGFjZVhlRGNPNlBLOHYvWkk0SmQvWHZZMHZISWEyV292?=
 =?utf-8?B?TWxkV1F2Rlp6c0t1aXVpZEpuYUVVZXRBTERUV1BVak9laTdJSDV6emxuejB6?=
 =?utf-8?B?SlhxbXpqN0l1YTJyUGtmQWV0MnMwRlBBSm9QY0krZjBZUFVuSkVreGx0OVZ2?=
 =?utf-8?Q?PhJcPWe169q9Im1Y=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0000687e-2565-4bf1-34d6-08de6264bbfd
X-MS-Exchange-CrossTenant-AuthSource: AMBPR06MB10365.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 14:09:52.8212
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lyx+cYGutaoDD/QCOxxIATGz/kULTwTfjg+2uDdVhPpLdrFnH95UdV0yPoRvFtK9yFayL7BIf1YUZmx4N6rTaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR06MB8804

Hi,

On 01/02/2026 07:37, Konstantin Ryabitsev wrote:
> On Thu, 29 Jan 2026 11:10:30 +0200, Tomas Melin <tomas.melin@vaisala.com> wrote:
>> diff --git a/src/b4/__init__.py b/src/b4/__init__.py
>> index 3d774f7..0adf5ca 100644
>> --- a/src/b4/__init__.py
>> +++ b/src/b4/__init__.py
>> @@ -2922,6 +2923,16 @@ def git_credential_fill(gitdir: Optional[str], protocol: str, host: str, usernam
>>      return None
>>  
>>  
>> +def git_credential_helper(name: str) -> str:
>> +    if not name:
>> +        raise ValueError("credential helper name cannot be empty")
>> +    name = 'credential-' + name
>> +    ecode, out = git_run_command(None, args=[name])
>> +    if ecode == 0:
> 
> Any reason we're not making use of git_credential_fill() here? I'm not sure we
> can expect correct return here, because credential helpers expect input on
> stdin like:
> 
>   protocol=smtp
>   host=<server>
>   username=<user>
> 
> The existing git_credential_fill() function should already handle this
> correctly, unless I'm mistaken or you have other reasons not to use it.

AFAIU basically they are kindof related but with slightly different
usage. git-credential-outlook will call out the helper and get the token.

Using 'git-credential-something' follows directly from the documented
usage for the git-credential helper
https://github.com/AdityaGarg8/git-credential-email?tab=readme-ov-file#usage
That way, the integration is seamless with git-send-email oauth2 and b4
oauth usage.



> 
>> +        return out.strip()
>> +    return ''
>> +
>> +
>>  def git_get_command_lines(gitdir: Optional[str], args: List[str]) -> List[str]:
>>      ecode, out = git_run_command(gitdir, args)
>>      lines = list()
>> @@ -4050,6 +4061,15 @@ def get_sendemail_config() -> Dict[str, Optional[Union[str, List[str]]]]:
>>      return SENDEMAIL_CONFIG
>>  
>>  
>> +def get_oauth2_token(server: str, smtpuser: str) -> str:
>> +    creds = get_config_from_git(rf'credential.*{server}*')
>> +    access_token = git_credential_helper(creds.get('helper', ''))
> 
> The regex does not look correct here. You probably want to do:
> 
>     rf'credential\.{re.escape(server)}\.*'
> 
> or something like that.
I've tested e.g. with server name smtp://smtp.office365.com:587.
Escaping does sound like correct this to do, need to test it out some more..


> 
>> +    if not access_token:
>> +        raise smtplib.SMTPException(f'Unable to get access token from git credential helper for server {server}')
>> +    auth_string = f'user={smtpuser}\x01auth=Bearer {access_token}\x01\x01'
>> +    return base64.b64encode(auth_string.encode()).decode()
>> +
>> +
>>  def get_smtp(dryrun: bool = False) -> Tuple[Union[smtplib.SMTP, smtplib.SMTP_SSL, List[str], None], str]:
>>      sconfig = get_sendemail_config()
>>      # Limited support for smtp settings to begin with, but should cover the vast majority of cases
>> @@ -4118,6 +4138,11 @@ def get_smtp(dryrun: bool = False) -> Tuple[Union[smtplib.SMTP, smtplib.SMTP_SSL
>>          if smtpauth.lower() == 'none':
>>              return smtp, fromaddr
>>  
>> +        if (sconfig.get('smtpauth').lower() == 'xoauth2'):
>> +            logger.debug('Authenticating to SMTP server using oauth2')
> 
> Two issues here:
> 
> 1. sconfig.get('smtpauth') has no default value. If smtpauth is not set
>    in the config, this returns None and .lower() raises AttributeError.
>    Two lines above, the same key is fetched with a default:
>      smtpauth = str(sconfig.get('smtpauth', ''))
>    You should use the existing `smtpauth` variable instead of re-fetching.
> 
> 2. The parentheses around the condition are unnecessary (minor Python style
>    issue).
> 
>> +            auth_b64 = get_oauth2_token(server, sconfig.get('smtpuser'))
>> +            smtp.docmd('AUTH', 'XOAUTH2 ' + auth_b64)
>> +
>>          auser = str(sconfig.get('smtpuser', ''))
>>          apass = str(sconfig.get('smtppass', ''))
> 
> This is going to not do the right thing.
> 
> After successful XOAUTH2 authentication, there is no return statement.
> Execution falls through to the basic auth block below, which will call
> smtp.login(auser, apass). This will either fail (no password configured)
> or attempt a second, unwanted authentication.

Indeed here the basic auth is a fallback operation. Certainly I can
change it to be exclusive so that it will not attempt basic auth.
But with oauth2 it currently works, if the basic credentials are
available they are autofilled and it proceeds.


> 
> Add `return smtp, fromaddr` after smtp.docmd() to prevent fall-through.

Yes, will add.

> 
> Also: smtp.docmd() returns a (code, message) tuple. The response code
> should be checked -- XOAUTH2 authentication can fail (e.g. expired
> token), and silently ignoring the response means the caller will not
> know authentication failed.
Absolutely, thanks for pointing out. Adding return value check here.


Thanks,
Tomas

> 
>>          if auser and not apass:
> 

