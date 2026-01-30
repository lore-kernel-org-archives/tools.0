Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F07D87080E
	for <tools@linux.kernel.org>; Fri, 30 Jan 2026 12:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=10.30.226.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769775020; cv=fail; b=nMZrG18wbbcjRrtCy7OeiAPyYLz9xMivxBUZaUUZ6mh3fqAf6JdgT2mfgSLJCWFl6ukjtFQD+0w827+cqCQuB1B/O25JL1WVJEYTJ5HoCwvbN88Z69tNA7+lhxx5HAcuVeR1ik3XRPTw/Z66MyTRo5z91y2u6/RDqezjk4Mj7sI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769775020; c=relaxed/simple;
	bh=FPiXNSutwx4E6cuIcdnEksTYKd07tvEK5bNTbZVPff0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=EWFXONR0AOnWhdPwFAT7i77+cECCBjNzS7v7uEfWMFG74Z8UBLs75FO4uzdRaHuvNvn80Aw0pmlW/7RUbAHywEtBUiLAbAGCz87EhVax6/LiWRST4TM/CV9Q9RhMb676SXexOKKZXukRak3JjPx7iCXWw7US19O+iEbofPeltgk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b=fIbwXqah; arc=fail smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b="fIbwXqah"
Received: by smtp.kernel.org (Postfix)
	id 957BFC116D0; Fri, 30 Jan 2026 12:10:19 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021109.outbound.protection.outlook.com [52.101.70.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A3A7BC4CEF7
	for <tools@kernel.org>; Fri, 30 Jan 2026 12:10:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A3A7BC4CEF7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=vaisala.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y+eVtmDxDGm67n9p0wH4L7uML11O/HXc33iv4NDYMZj85zetV2rKN9NWbs59tfwRvzSa/NUh7kGjP1KkANcyTr9AZl9yaC/YOsimS1X1OmNNMeYw3fcFcmUXkKJPBf+El+JVRF+Y9DbctN8yj3z3q2BXvZnzRXi1eiFBt12q9LuyXu3lLWQzMwZJuV1+Qj8pro3F0NWJ7Ncx8T45e87WJw0wZAfSRe0lBDc/+7LvCUa/ugiH1rKZFAGAnFZm9aDOaPhfbQuy//UbMnRKpcfR64cn1KMh4kHIKhDoGI+gGoaLaw7wQpxQ+ABKDXYcFgwfQw5r7PXyvze2oXWQJo5Kgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XIPL0nL3lGyGMLSKI5QypTVbw4Wzg+XY3GXAkhNbOr0=;
 b=BcuFf40aIeftLqntwOKFVmnUG7pfGLWOuUmFzOvfPFzoTJTd1ZJYNgBksO8+yIQlaB8H3gYpmhPICw00MNub5iT7srgWzcEfOEOrRNRygNiYppNCA6jY/OPP6EwnZoSl9nxBbiYqkgy05UHp0y51le8KYZWHmv1iygBvGQKJI9jTSBrQ3PC82B0kLptKWdKaU4Olw4Xao9jrriqCmYWcbpdh7ufKmmArs5s+uKSY1JLV9C5FiGAzSjtYK1G0D2IDjmvJxVKjQToIswQzvIx72H0TCS7ZZhypxTgTqHLrEEapiSuB/d3hirWA6z5t1vbyTuHwVFxjvWzRCsFol60DWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XIPL0nL3lGyGMLSKI5QypTVbw4Wzg+XY3GXAkhNbOr0=;
 b=fIbwXqaho2wUzq98f2H/rpzfhVTgijbj5psE6YZfrO7toR1+N+hD8G18dnAiDRyA/wZgRw/G02Ij8RIYvDh/gyaGBScIkm2FIj6lUL7Dnr6ogrUChAslKzoe0n3cEkL9hqQslsz0ovH/gOiKMDoplZRs0gLISQz8F1r7wLmJSj8OFqEMoYVMb+6kt7n4O3Mt+TFS337lkBGGZVyffO5Ki5pNErIWO0xVrsAvoRIErELM8zs2RlnIps/mfqPUhFLGmgR7p9rOxKKDeplU4joZuUWihvaYXePa6NO3m5dFCqxkwYajBd4QVGN2Oa/YeOY8w2QiWi3DbOft/JeJmrimig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AMBPR06MB10365.eurprd06.prod.outlook.com (2603:10a6:20b:6f0::7)
 by GV2PR06MB10197.eurprd06.prod.outlook.com (2603:10a6:150:2cd::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Fri, 30 Jan
 2026 12:10:11 +0000
Received: from AMBPR06MB10365.eurprd06.prod.outlook.com
 ([fe80::addd:5e9b:7273:8049]) by AMBPR06MB10365.eurprd06.prod.outlook.com
 ([fe80::addd:5e9b:7273:8049%6]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 12:10:11 +0000
Message-ID: <8c95aeb9-d366-4d83-80aa-a0a60c2fed73@vaisala.com>
Date: Fri, 30 Jan 2026 14:09:55 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH b4 2/2] b4: add support for oauth2 SMTP authentication
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
References: <20260129-smtp-oauth2-outlook-v1-0-e8c6d1b00c03@vaisala.com>
 <20260129-smtp-oauth2-outlook-v1-2-e8c6d1b00c03@vaisala.com>
Content-Language: en-US
From: Tomas Melin <tomas.melin@vaisala.com>
In-Reply-To: <20260129-smtp-oauth2-outlook-v1-2-e8c6d1b00c03@vaisala.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GVX0EPF0005F730.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::2d0) To AMBPR06MB10365.eurprd06.prod.outlook.com
 (2603:10a6:20b:6f0::7)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBPR06MB10365:EE_|GV2PR06MB10197:EE_
X-MS-Office365-Filtering-Correlation-Id: f6f4ff72-c2e0-4a47-bef5-08de5ff8845d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7142099003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RCtQRFoyOTljTWRDbkxXOTh1S3BnbHJRanliblhhY0ZWUjFFZUp4cVVMSitJ?=
 =?utf-8?B?TnNUcHhmazU5blFNUDNSazVodzJnbUZ4TkNmNmlFaC9mUzJCSHpBNENXa2VV?=
 =?utf-8?B?dDlFQm1YV1ZkVjZxN21HdWtsWGlMdzJwTDZ5b2tNQkZCTldwL0srVkJXTFJo?=
 =?utf-8?B?cXZ4dmI0a3MyZmwwTzBrdlpMc0pJRkU2b2RGMU5PK3hDam9ycWU5aEJKeFpW?=
 =?utf-8?B?R1A2RWdnL1ZCZ3RLWU5zQ1Flc2FsY3VrNzl1b0hEOHdDUS9NRVNWVitQN1Z4?=
 =?utf-8?B?V3hERFFndzhXQ29Bc0pBbkU5SmdiME1wMFMyVXA4bVVkdTg0OUtFQk1KTEFR?=
 =?utf-8?B?SDdpalgzNU1vQzhWc3I5S0hYbHNwRWkxMnNKRERmVVFhWjQ2WEVTTUU5cUg4?=
 =?utf-8?B?cHlHbkp1SkptV0FEVkQ2aW01MnJzOVNjTkJqU25sNllkVWhvZUpCMjdEM1p0?=
 =?utf-8?B?Tm1KYmJqNEkzbnBDdm1WcDlGR0p0S2s4VWlvN1J4ZXZzRTdJQkN0U3paNWdN?=
 =?utf-8?B?clBQL2dZZE5EMDNKWHFHSFhSeTZkOWg3cWFtbUQ5RVJPNDJjUGM5U2VIU1Ay?=
 =?utf-8?B?bjI4UzRLbFJFeFQvaUhib1VrUlpzVXMwVnZ3WUZNNGFRUHJLdTArS2t5ejUy?=
 =?utf-8?B?TWNJTmRrNTNQTkh3REd2TnkyTnZ5RVZBQUg5VlZTTW5rMjNzOUhVUVdSSEFl?=
 =?utf-8?B?Tlg3STFtcHJRamRaRld2QVFZSmRsR3B1SWtiOU4vTlg2YVpQTGFkazFTbDVF?=
 =?utf-8?B?NU9VS0xmMHZUeUJQVnRuQVYrbVplanlJbjRoOXJHcDhQTTBwNi9YYUxSUVpn?=
 =?utf-8?B?V2RIbWZOckNJY29VbVh6Zm81ZVYyZm9pbkIyMmE3Zi8yZzRIZ1NhdlZrdllE?=
 =?utf-8?B?eEp0QXJRcUZZMXBqRXRodXBIejY2OHM2NTh0R0R6eVFDK2phV2crSEloQnNk?=
 =?utf-8?B?dkVTSGhsZnJTVkpyL3FqMTBQbDk3UW5FLzlUVVZybzNtbkkyTWlQS1Zkd0tX?=
 =?utf-8?B?a0k1Q25FUDlRWUl5TDRybzkwZzAvSGJhQ2xNeUlJc1dqanlCNjBtOXJmUzhJ?=
 =?utf-8?B?VjdjSGE5MnRKbFhxZnNxWkxHQzBsY09IQlllWkFJQTlhTWRaQ0dnV3Z0V3Vs?=
 =?utf-8?B?VjN5aUs3S05NQmhkZjMvZG51cVY3UmU2VlJUVDJxd0xWWlNqY01sQXhtd0RU?=
 =?utf-8?B?RFJSV2VDWHRHa29icFJZRFZ6R0VMcnFQcFRGTmVRdldiNlRpd0JFM2p6OElU?=
 =?utf-8?B?ek1zZHFtWXRBS3dXdXZQTXpISFdpa1dSM082bXMydzMrSnRZem01L2k2emtT?=
 =?utf-8?B?MGZiSldsazdXYVBZeUZxa1dYS1o1TXdBVERVNElNZWczVWxwdDhBcUFCYm9C?=
 =?utf-8?B?UHFxOEpOUG1iNEdSY2puVUtsK1BydWQvdkNlc2tSMFRFOW5Eak1mVkVLd0ZP?=
 =?utf-8?B?SlAzN01meDQ0eHFQMVBPS3RKdFE1d0xZSE5SL3VWZzVJU1hPdklRSFlTeHBJ?=
 =?utf-8?B?SHNCNUxKWUJWV1hyV3V1bjNONnBWKzBWMnZMTDVVd2NKV0tTUGVsUkRDaWdh?=
 =?utf-8?B?aDd6VWJMa3JUZ2YwaGZzYVp6ZXdXN01qS3NXYW9oTFNycXVYd3V2VnU1ZEh0?=
 =?utf-8?B?RklyTGs0MWp1MDNNMWM0aFdxYUpocDJ1T2R5NWdvcjA0Vmt2WHVuOUw1TzhH?=
 =?utf-8?B?eTVGK0FPVFZmWlJOUG1nNTZkVVNLUXlWSyttdlJiV21XZDd3RDcxdkRnYTlJ?=
 =?utf-8?B?aDVaQjhUMWNtQmZPcFRDd3NWYkVqTFVkRjd5amJSdlBGVzFBR21qVnZqVXNY?=
 =?utf-8?B?VC9zOW9hNzV2ZVdBNTYzNDB4Z3VLZnBVRHp4MHhFZUZjckFYNVN6L24wYk1H?=
 =?utf-8?B?WFJvQkVzTHdtWnZycXdvaGdkbFZENjVBRDVkRlY3U3cxUHdZK2IxWnczTTB6?=
 =?utf-8?B?YUQ3L21vQ2RmVDVRYnl0SkJjaHp6dDlmblNPUjRGMWxpQjFyeHFUN3Rlc21t?=
 =?utf-8?B?NGRVL1U0bFY4cFJ5aHFrOWtpcjF2UTN3UzBHb3BtV2RlTUMrNjN5UFRiU202?=
 =?utf-8?B?UHRQZTJrcldvcnV6N3Zab0c2TS9ScjQzeWNOKy85L0pHOEpzeVBjTnJ6OWJs?=
 =?utf-8?Q?pYRvwl9Ov+e4/feTNB+Uhm7yD?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR06MB10365.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7142099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RVNKaEJjTk9ldi8zRXczdnpGLy91aHhTamNJZUZJN01DTkV3TDZlbjByd256?=
 =?utf-8?B?Qm04Q1h5eTJXY29xVlNseCtpc3ZwcE8zTlVIZkxqTHhqeTlTMUJRWTI0cWMr?=
 =?utf-8?B?M2tjR0V0dnR0SlI4ZVNDQ3plT3lsL2lQNnF6TXBtTjI2TE9pdXgwTlNwVENo?=
 =?utf-8?B?N2J1U0srY2NqSlhhVndUMmhWNTlOaEw5WFlYK0hwZ1Z5ZytpZm40d0pOeEhZ?=
 =?utf-8?B?NE9URVdsOUE0V3dGamxCTFlNOTlwcHRYSG10S242a0VxckNEZ3NicVpKSmU4?=
 =?utf-8?B?VWdIdFRLLzgxL2h5S29NcVQ0ZjlEM29hc1Y2Ri80Wk1CK3Y1M2JWanl5d2pU?=
 =?utf-8?B?cUF4QUp6WHBLYTd1SXorQkE1T2JUYWxTYzhJVnprTFo3VUl3Y2p3ZzhXZ2lq?=
 =?utf-8?B?VEpXQ3RkSUtzR1NZU3pnL0JWVzY1VVVpeTNrZTZtN0d6eVdMRGpEN3RyUzRI?=
 =?utf-8?B?dC9GQlk1ZlZ4ZE1NejVpWTk0Ylh1WjVvZlFJcU9DRkNNTWJHVkRRMlorOWNL?=
 =?utf-8?B?QmJaM0duNFkxTEVVUDZNWTM1ZmRUaTQva0tkOFlYYkpoKzdFZWMxZkhBdG5T?=
 =?utf-8?B?S2YzWnRlUEE1OE5qeE9DcFVFbmlkRW5MVnBjenoyVEVXMjhKWDMyZUk1K0pL?=
 =?utf-8?B?K2FXN0hmSHNaMDdoVzgyZEtGZHpkNWNPRHdPQVJzZk9kZ3FmWWJXU3UwRG5u?=
 =?utf-8?B?NGswdWlXRzIybG10VVlCdlhiS1lEc2JiRWdBMlI0ZnFNdFJ2WjBmczF4aGda?=
 =?utf-8?B?ZFZleGplZ2IzY0FldnQrV0FielRiYWc3SDlvUHIzWmlGd0xETjBEUzRrWjdW?=
 =?utf-8?B?WVVrTVhwSnJDSEVmSlRQa0xldklJdlNWMnVhM3VKU05vMjI2ZUN0cGJQMkV1?=
 =?utf-8?B?c2Fhc2gwczV4VXFqM05CR3h3cVVDQzVXVVVsb09nSXM1OXA2M1dVZ2dxc0NT?=
 =?utf-8?B?dURoenpJcVR6QUFXUnExeW5wS013ZnVyT1pYRVptMjhDbCs0eSsvVmpRR0Va?=
 =?utf-8?B?UUllVkVNQ2kvTUhnZ0FjQUYzY09YTENSVWRKdVRsdEpLM0NOR2xmY3p1Wld5?=
 =?utf-8?B?R0J1V1QxNDJwcDlXVitLRjZjQ1cvUk8yZzBQdnIvYXV1Q05NaDR2Y29xU0x3?=
 =?utf-8?B?VXo4ZDJvZGVNR0laUW92L09HUVBldEhhd0t0UGlNK091Y0JaUVNTY2kvM2ZK?=
 =?utf-8?B?Qmg2V2RHSWR5VTBSaS81WWdNZDBhS3hHdU9nbjdINzU2ZFM4bDlxNFFvbHlI?=
 =?utf-8?B?bk9xaExXMWc5OHVadUxoRG5CaEdNQk8wRjJ2dUw1aTFPU2JleEVjTitQWFJm?=
 =?utf-8?B?VVNFcmJNMmNLZGNJR3FtaHRXQ0g1ZG0wVlU4NHVxaU51ZlUvOHRTL2RCVGNY?=
 =?utf-8?B?RmlvVUtLOGd0bTh5SHlZeXRVdUlnaEMvVlBDamhYOW1zdTJEd0c5ckhvdUt1?=
 =?utf-8?B?Ni9sZUFiUDg0VWUxLzF3YWV3MDRZQW1MdFNDaEVCM0dPR3NJemhIZTM0S3U3?=
 =?utf-8?B?TUJaU01QZ1VpbVVxQjFYaVVOQmU4TXdOdGVxdTZnNmVwemVmY053OWdMZzVR?=
 =?utf-8?B?NS94UHEvVnV3WkhYOERGZHpTN3B1U2JmdUdzWDREK0NIdkRCczJEdTB4Mys4?=
 =?utf-8?B?bjg4Q3UzTXN0dTd6Yk0zMVFpeGlVNkFCRC9zRHNWNkZLaXExaVhGMGV3cFFX?=
 =?utf-8?B?VW5CUUo5R3NJc1hQM1F0eGdkRHZWaGZ3bU5Oejh2Um5kdVE0QitNZTVlZ2Rj?=
 =?utf-8?B?L09MelhnQVhCbWtXWmh5TjVGaEZnS09SbExHV3ZvajRkN29xWmQ0Mms1VkZY?=
 =?utf-8?B?ajdLU3ByV24vZUF4QzN3WFNBSmtoZEtBTVJ2STlDcVlGWWx0Y0s4Z1NkNnhE?=
 =?utf-8?B?VUp4QmFURVoxTjJZMlhac2Zlay9yaCtXemh3Rkh1QjVEOGZCZGU4RnNzQTNE?=
 =?utf-8?B?ZHZpSDIyd1NocTdqT1U1am5zdnEyeHBVOGNtVWtDanZGZGQ1d2VmRU9tUEUz?=
 =?utf-8?B?eVJQNWdEZ2lJaVYxZzBtcFJqQkE4MmxSYVRBNW0ySFkzOTNvTWlnU0daZ1Js?=
 =?utf-8?B?NEE0dW12bFBpZWN5WWxMdExNRmZ6eVZtMk4wbGZSVzlGcTBXWEJhV05GbCt1?=
 =?utf-8?B?bUQraWtWdE9DSE4vWG03V2g5VHNOT2Z4T0lCMGxLSlB6OUo5UEZleWpPM1Yv?=
 =?utf-8?B?NjByODV3NG4vQTNCUmxzUzlUZW1kQWpld3N5YzF3SVpsQWQxZUpCVFZjdHV3?=
 =?utf-8?B?OHVScUM4cWRodENJNWhDc2pFOFRiSEtyRUppQlRZZ2tBaDNTUjcwQUJxdk8z?=
 =?utf-8?B?bllTVGF6b3dkQU9sVTViMWk0a0tZUnhzaVhNbHFZZVJBNlV0Q0c1d3NkcExV?=
 =?utf-8?Q?Wb2pn5RlB0sVUkLc=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6f4ff72-c2e0-4a47-bef5-08de5ff8845d
X-MS-Exchange-CrossTenant-AuthSource: AMBPR06MB10365.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 12:10:11.1717
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7KLFcPkNnQckK0eGrvDvO7ZIEm2qVERj+GMoJPbij3Wd21Cc57GYUOr1I6Ni6B4cBKSXGG3UKWVCj1T4+o8+TQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR06MB10197

Hi,

On 29/01/2026 11:10, Tomas Melin wrote:

> 
> diff --git a/src/b4/__init__.py b/src/b4/__init__.py
> index 3d774f70c026..0adf5ca4e435 100644
> --- a/src/b4/__init__.py
> +++ b/src/b4/__init__.py
> @@ -30,6 +30,7 @@ import shutil
>  import mailbox
>  import pwd
>  import io
> +import base64
>  
>  import requests
>  
> @@ -2922,6 +2923,16 @@ def git_credential_fill(gitdir: Optional[str], protocol: str, host: str, usernam
>      return None
>  
>  
> +def git_credential_helper(name: str) -> str:
> +    if not name:
> +        raise ValueError("credential helper name cannot be empty")
> +    name = 'credential-' + name
> +    ecode, out = git_run_command(None, args=[name])
> +    if ecode == 0:
> +        return out.strip()
> +    return ''

For V2 I will expand this function to work for general case with custom
command syntax, as is the case with git credentials.
(https://git-scm.com/docs/gitcredentials)

Before preparing V2 I would also appreciate any other feedback.

Thanks,
Tomas



> +
> +
>  def git_get_command_lines(gitdir: Optional[str], args: List[str]) -> List[str]:
>      ecode, out = git_run_command(gitdir, args)
>      lines = list()
> @@ -4050,6 +4061,15 @@ def get_sendemail_config() -> Dict[str, Optional[Union[str, List[str]]]]:
>      return SENDEMAIL_CONFIG
>  
>  
> +def get_oauth2_token(server: str, smtpuser: str) -> str:
> +    creds = get_config_from_git(rf'credential.*{server}*')
> +    access_token = git_credential_helper(creds.get('helper', ''))
> +    if not access_token:
> +        raise smtplib.SMTPException(f'Unable to get access token from git credential helper for server {server}')
> +    auth_string = f'user={smtpuser}\x01auth=Bearer {access_token}\x01\x01'
> +    return base64.b64encode(auth_string.encode()).decode()
> +
> +
>  def get_smtp(dryrun: bool = False) -> Tuple[Union[smtplib.SMTP, smtplib.SMTP_SSL, List[str], None], str]:
>      sconfig = get_sendemail_config()
>      # Limited support for smtp settings to begin with, but should cover the vast majority of cases
> @@ -4118,6 +4138,11 @@ def get_smtp(dryrun: bool = False) -> Tuple[Union[smtplib.SMTP, smtplib.SMTP_SSL
>          if smtpauth.lower() == 'none':
>              return smtp, fromaddr
>  
> +        if (sconfig.get('smtpauth').lower() == 'xoauth2'):
> +            logger.debug('Authenticating to SMTP server using oauth2')
> +            auth_b64 = get_oauth2_token(server, sconfig.get('smtpuser'))
> +            smtp.docmd('AUTH', 'XOAUTH2 ' + auth_b64)
> +
>          auser = str(sconfig.get('smtpuser', ''))
>          apass = str(sconfig.get('smtppass', ''))
>          if auser and not apass:
> 

