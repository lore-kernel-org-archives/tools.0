Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6649D37E310
	for <tools@linux.kernel.org>; Mon,  2 Feb 2026 16:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=10.30.226.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770051054; cv=fail; b=FqkgK5/aCAEN460pyn/uWGHmrxkPw70aIBjJQID9K/B/o8zMDG4W/+lkWUbVjjc0PTEzRKOpoqITSEITPj+/NFqwpz1Q/I8Yjn6merBw75F7nkONEMFvFNHY19MbtpkWDpqoInrikLFHMmlTeppo+z3aRCzzY3JGbIhI/tdHLyo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770051054; c=relaxed/simple;
	bh=blcQPj0GqOwRSSadB4dbILILT//mHVTGhJQqdmKFZmM=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=JmSs1jZPfRsijn5KV6Tx11rLZ/8nZj/7JIxdju/TRNlIVuwkJSj1npJHYNNmhG6MRoYqHRAPOewssC30E7w54Ze9/hltZOoZrsz0HoFER9HMh9DURr3MQ24R/+xCZbNFROHW65KyHmBfZKwUsxlXlm8G9tLldOQAoTkAPNL+epE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b=icFKBiLp; arc=fail smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b="icFKBiLp"
Received: by smtp.kernel.org (Postfix)
	id 1D40CC116C6; Mon,  2 Feb 2026 16:50:53 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023100.outbound.protection.outlook.com [40.107.162.100])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 670D3C19425
	for <tools@kernel.org>; Mon,  2 Feb 2026 16:50:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 670D3C19425
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=vaisala.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A4skYEpoObS4GLLbqbNDGAJzyEqioOAf53b8LFR5Y4AClWb0QEEMfkMwbQxnqbZ4A6D6nhr5A4Tj7e4WM4kw5xorNOhYMnrC/SlB7tsLhXr86uX0ikyOiM2qylkEUpX7xJpowuW60WbAjPKE38mW7SC31+tEoX0VtrobIyG/PwXSayGxPqH/OR1iEBtnMkEN5eGyCPFv0BSERD7gISshLOFRi2+lxYo7MQlNcztbcqIWRnTPeKqSgTNGFpdfVCs9VF9T6zmxmpZj7mJss1eEcbgGr5/gL287htSM0fee6TAEFRddYwfUad1VKE9Z6XMeLK/l5PwphZGjuryupir9iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XGZ9ebT/IefTKplR6R11tiyi2pcKa0Bqs9S9HMEPPi0=;
 b=aUElGB3OUXy75HjOpRFwRW+muUd6dsXZpDYOikuVsJgLTJc4UXnJZLyQd8LT503SM3AYOHjAzpMFAazK+hUsmxWuQsONMlPJXtVXGQcxuG4io6EzfbD0ulAFkX2eNVzOWYamN/Xal/6oTODlGNzpBoO2tEfDsTrcXiyXi48rekF8MnEB2A5JB/M34Uys+LDB+2gDNmtUvmJ8R05ZpPVHcFFlXgqzBwI1WD090tWxtpy7RnzM/AA++6r+/YvJGgWUJS4BlosjOYlSPDXwxQCtIqJhlJrRQsrdgXs2/Z1+QRqKANDnSKKK9qVwj3obfAJhFl1f7PIrmsbypeIRgViReg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XGZ9ebT/IefTKplR6R11tiyi2pcKa0Bqs9S9HMEPPi0=;
 b=icFKBiLpLJr7D/J31W5/Ahj3u5zs2gD+oPvNlULX8etY2Phod0Uq/gAqI+usJR5WlX7H6fcCO/zRhEneEagNO+jTcOsyHYGatDEwuswZNHCgBX6XLVr7/iGEeOWoVxXcHzmk6zayd/5r0wm4IFbMEMdroAo6QbcyGgonHUI3RkCLVd5iTOTbuID5yGMfjr06SKgCg3qRV9JOnmWX810zKNg0MOPLPyg8mDMd3sDF5HrVuxkNrm/kvLRa84tpjqBUua4hUDL4M4uo+FbIiOJRfVSHJE8yZKeC6oErSH/xdcoC7QOlGCOuDoo6CCuXjuDtDWBGlpXZYAV8TcBav9DapQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AMBPR06MB10365.eurprd06.prod.outlook.com (2603:10a6:20b:6f0::7)
 by VI1PR06MB6432.eurprd06.prod.outlook.com (2603:10a6:800:11e::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 16:50:42 +0000
Received: from AMBPR06MB10365.eurprd06.prod.outlook.com
 ([fe80::addd:5e9b:7273:8049]) by AMBPR06MB10365.eurprd06.prod.outlook.com
 ([fe80::addd:5e9b:7273:8049%6]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 16:50:42 +0000
Message-ID: <c06e3173-dbec-4e05-91d5-b087e3f69b22@vaisala.com>
Date: Mon, 2 Feb 2026 18:49:09 +0200
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
X-ClientProxiedBy: GV2PEPF00007568.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::3e6) To AMBPR06MB10365.eurprd06.prod.outlook.com
 (2603:10a6:20b:6f0::7)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBPR06MB10365:EE_|VI1PR06MB6432:EE_
X-MS-Office365-Filtering-Correlation-Id: 8faed777-e915-4ad6-16a1-08de627b33f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7142099003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aVVhUCs1WmdHbkNGdlZsbzgyUWJiZEU0bzhoQ0l5MlRLajlyKzhCUkU2enlZ?=
 =?utf-8?B?ZXlkSUFJTnFKVGtTZDNCUnAzV1N4Nm5aaG9vQ3RGT0c0OWx6eHpFRHBlLzAz?=
 =?utf-8?B?US9lQlRPdVo5Y1NScUJGNm5jd0Z3SFY2cnBXR0pSaFpMNnM0YWNhY3ZkUnBj?=
 =?utf-8?B?dERZTy9Sd3JGNGJxNm1xVnFsV3lYYm1IK1EyZVNvVGRoK2RUb0NPYU1ja3k3?=
 =?utf-8?B?ZW9GaUlTSjRXajJHV2h4NXVaNFRXd3g4NzBlVEtZcTA0WU11MTFBb1dKVTFm?=
 =?utf-8?B?R0RRTTJUOE84RDE5V1hPTWt2d0o3R2RJMTZ5WGVSWHc3V0t6cC9DeG5ydkor?=
 =?utf-8?B?Y1ExakZWcTBGSDFBT2wwR2l0OGVxbDFaN296RU81MTFuK1JkeXE2a3h1bHdL?=
 =?utf-8?B?djhtdTk5WmRZQkRzR0pwVlhWUUxUVGFvNEZ2Ti83OHk3dG15d2JXUXlUa1Bx?=
 =?utf-8?B?bHQyMlo2RytHUm1keXRQUWMwbHUrWkpDdUt4bVJneGlaNk9Qb3V3a0JBQW5Z?=
 =?utf-8?B?MkZoOTR6bmV4ZCs2UzJ2ZzcwWTZCM1VuL2FrVTRYMDB1Q3NRQ1c5bzZMOS9k?=
 =?utf-8?B?b3E2ZDBNSGJhcXJaVlpnTHlJTzNoMTN6N0NzNHg3ZE5QNUpGTWxZQzR1ZCtv?=
 =?utf-8?B?bGp1b0xUeVEyMnU1ZnN6MmlJK3FtY045UlZNUTJGQ2NQcElZc2Y4aHVkTndQ?=
 =?utf-8?B?RFdpaDl6YnhYTFZsZk44YUlQNDFmNXBUS05zVXhVSWh3R1ZXcVE4aDdMbWlk?=
 =?utf-8?B?ajM5Mm8vMHFDN0RJb1JoazJEay94Ym9HRnlDRFozT3NMNTRwUjUzblJuVGFz?=
 =?utf-8?B?TDY2TUZGcCtEWVhSc285RWVKSTZhYTRJaEZyYjJDNUU3MUs0WE0vYURRZmdH?=
 =?utf-8?B?Q0picWd4aGljVmY3V3c4RGF4SG1wZXBZcGpXc0NOWERDNUdLVkJLTHJNSzAx?=
 =?utf-8?B?dW1kYktNRnJhUVc0eW5hNTFjZHJ3eXpOdWFwZUhVVWJOa0FPSXdqK3IvL2NJ?=
 =?utf-8?B?cTUxem5rOHowVHR5Q1BlR3gzREl6MDVOSVVRNzFHTk9sT3hRZkp5b1pzN09V?=
 =?utf-8?B?QlA2cXp1KzlTWFV3MlRlYUEremhCamZGSEZYN0dXeDdFUW9zQ2xxZXNvQTNp?=
 =?utf-8?B?cEZNaG45c2s5YjVyUkU3UXBDN2VRL2J2V0Mvd0tjc29hRk4zekNNZXBKbENn?=
 =?utf-8?B?VXNFMDVQKzJPeHBjQTBqWFJJMXFMVVVFTDZLd2lCeXdWZUJVVGRZM3YvZ2wv?=
 =?utf-8?B?RVNmdDVSdVRxR2p2TWUxMzBKWVhYZ0hFVUphc2x3a3FOV0QxWHpHQ3QvMU9v?=
 =?utf-8?B?U2ZUY3RWSkJjalMrQjllMTB6RFd6Q0J2dUZyN2xnWklDZGRKYUFQZDI3L0Y1?=
 =?utf-8?B?L2R1eHplS3NzNmpJeUdHNC90NFhuWEpsZ2U0MVJnaFFvSlVESFY0bGM0Nkxw?=
 =?utf-8?B?RnhTRm1LTE1Wd0hValBSLzlpcmxUZTVsK1BGdndBRlMzSE1SV3Rvck5wSFZX?=
 =?utf-8?B?ZWlRUUhOTGhYc1d6UlJVTCtjZmxNNVFSR0YrR1pLM3JQNmRCTEZKbXdiTUZ3?=
 =?utf-8?B?WmZXSlVhbTRjVE1tRTVwTk1ZbXp1ZEVuZjBqb0c0UHJGQ1h5bUxqeE1Tc3cy?=
 =?utf-8?B?cGRCdnRXZFBlLzl3VTZoT25zbThoRVJEK3VObjRVa3ViUEpEeDdOc0ZwMGRy?=
 =?utf-8?B?aWJHU0VtQ25HTHkxYWFmYklCWnRQK09YVUoxMW9zUGN5VzdVRFFIVllONmRI?=
 =?utf-8?B?ZUtJVDF6ZEZRN0hIS2pUMVNGeHVmZ0FOVDM2dXhIZG9pZlRiSS9tTmlKR2k2?=
 =?utf-8?B?RGhGeDFxZEhjSERxWkMxQjJHMGVFQUhXQjdHbzluZldLMDJDMVNSTSthUldo?=
 =?utf-8?B?QlZjVjc3WTExVjJJNHF1RXhuRnFBeXRtZk5QdTlmQnhjM3RSb25rVnpZeVBB?=
 =?utf-8?B?TjFnSFJ5cEZoRDBQcGYwREQxZngxUHRaWU9kYU9aYU82K2JXSHlsZVcvaktL?=
 =?utf-8?B?cGNwemxsRHVTSXdUcFNCb0NINVpZRHVDQzd5T1RpeFZVTHl2ZW0wbWJHSnJo?=
 =?utf-8?Q?fLuTvn?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR06MB10365.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7142099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K3NCME9pbVY2VFRJYlEyZHNvVkwzeVEyT2Z3MXdFUlVmaW5aM2d1VlN3N21x?=
 =?utf-8?B?RjdFa054SEJhOTVxYlA1VHdxcW9TWk5XbDNsRmZHaVQwVW1SblF1Y2x4MFpX?=
 =?utf-8?B?WXJNc3A0OTVMZEUzWm1NS1RjREVmR1JmaElTNU1NT2hWcEhxbTBTcFZacmFp?=
 =?utf-8?B?WlVBOEovbUF5UDhHL2FEdzJDMmdSWkljUjJ6N0owQUU1dVVwZ2ZxZkRJNVl5?=
 =?utf-8?B?NDQ1Ky9lVHd4Yml2SzNOSjdmc0xUd0c2dGdiakZpdjFFZXBkU3JVM1FReHoz?=
 =?utf-8?B?SmZYUkVDSEtZa2xidG9iWkZNZFVZZGk3Mzd5YkkwWGdMY3gzODVYVnAwdEEz?=
 =?utf-8?B?aThmNG01Q2FpNVFlK2JCTllUYldEVFIxaXFBR1JuZTh6Zyt2WlFzbXVWMXpR?=
 =?utf-8?B?M25wK01hTVVHVVRndFVCQ2Nodk5XUURGU3pYbGlDNUx2bnZJVEdXMWVtZzNu?=
 =?utf-8?B?Tys1R2lpREF0YVNBL3BQZnQ4NnJmbThnL1l4b2YrbVI2VVNhb2tCSDBtVnNu?=
 =?utf-8?B?OXM3T3luTU1qOHl4OTA2emZvejRWSlo3MzN5VUFla0ppSU5MZmo3bmgyejFY?=
 =?utf-8?B?UWNlbjRXTWk1aU1oWFY5Y1ZpanU3bExJcDdpNE5rNjExdWprZHFUUEpTMmxh?=
 =?utf-8?B?N3d3TzN1a21Ga0UrR080c1ZiQzhUWmhSWFl2VytzWjVBUzRKMVdXbXMwc3Vq?=
 =?utf-8?B?OXpaUmd0emtrRWEwQ2NWZ3lWNTdMaGl2ZVl0UG1JRW5JbUs4UWJYNEJxRm56?=
 =?utf-8?B?Q1BTUVY4Wi8rcWtRNGU5d0pBUVpyTHNYSlNQK253eFE1dDBEL1l6Szk5Snlt?=
 =?utf-8?B?UEVqTERuclJLWVgzcnRIKy9hWjIrbVlKMzNybkVGaE9LNlBuVEJLWlRsT08z?=
 =?utf-8?B?UnpYcFJnNGpSRXoyYlU0NHRPTmk0a2d4bnNBano2a1dXbXM4TCtHVG9PU1Bz?=
 =?utf-8?B?NFBkWnNkUWRaZ0VtbEZiTEthcFZYWGxNakhUd3BEaXIwYVdkL21vRUV1dU44?=
 =?utf-8?B?OGJlREMydmxXSlBZUEllZ1MvNUpPaUEydlg0QUFtVTNvc0NpUmR5TXFSQjdh?=
 =?utf-8?B?TWRJQjdPR1RIWVFJYWRDWHpJZHlmYWR0OUtxVjdCNkhRWHBUbHRLeWdPUlB4?=
 =?utf-8?B?ZWxETjZURWQrUWJZY1J3U3dFNXZtZTFieGJnd0hkK2x0SjhzbjhoRW1KTVNr?=
 =?utf-8?B?OGw0aS80UWszSjFDbWdWdXJaakg4YnY4b2tTVG02Z2RQR3pVaEg3TWRiTG1I?=
 =?utf-8?B?SURSeFRYT0ROWTgrM1R4T2hEc2w5VDRLSS9ZN0l4ZXNHZmNsYzBFNzNjdDJs?=
 =?utf-8?B?WDd3MmVSUDJsRC9mQU1pbVpYOG5JZUFXY1FZaVdlQmw2aXJrenVzYlNwSjRX?=
 =?utf-8?B?amtYOFBuVzJ6Y2I2SG0wZVhTZnZTVmovN1NZblo0b05OM0ZWTENjZ0ZPNlhz?=
 =?utf-8?B?MjNWOTU1Y01MZjEwUytQWEVUb2VxVk5ORXFXTVQ0NTJ6RUlOM0dZY2JhNTVn?=
 =?utf-8?B?KzhLU2xrTXZPRkJVSnpzQ09oN1Fnb0dTVFdNTmZUbHJKWmRVcVBTN29tNlVk?=
 =?utf-8?B?THBTamdzNFJRcTNiVCt1YzAwNTFGeDEzMGdYY0FHQ3F1dmowWlJHdEltRCs2?=
 =?utf-8?B?VjdSMTI5WHQrNStsOFN3djAxampONkM5QUc1TDFURmk0cjVoWmN1VHRvYlRC?=
 =?utf-8?B?WE9zbXgweExYUGxUNll0R3lLR2pVekZ5SUNOSitYMlZTU3BDc3dHaG5aQ3JD?=
 =?utf-8?B?ZlJWU3p3Tkc1SHI1dlQreWlkT2w2WFA2VXhMRmJMSDZJUEYxbTE1YlluS25h?=
 =?utf-8?B?RXQrOEc0MkFDUTVDTUtLaWZBNTVJZkRreUFMT1NOdXRkZWhyZmQ3dFZGUklO?=
 =?utf-8?B?cERFWERxQ3Q3aTcySzJTZ0YrQVl5dGpYN1V2N0RkQVp2L0RPakNmOVVlS3Nz?=
 =?utf-8?B?Z2RIdmdYUmRXVjBFeWRNNktkN29qVE9OZmxDUXZOVUZQUFJYbHpqMDdQWm13?=
 =?utf-8?B?QW1RVE1FMDhzQTkrcHJQZFA3b2VTZ013WHFQZ2UycDdYckJoTmdUQ0F1V2ht?=
 =?utf-8?B?YTI5VG5Ra1paSkwva0xQcEVpbENDeVd2RjYzTENXTjNkTGR3NjVhdXB5OFJ0?=
 =?utf-8?B?MDNCYUFtRnNsZGdwL0RTdEx6ZVRoZGRDNzdMVlZpUVJqTXhTMmJ4K3pLUjdM?=
 =?utf-8?B?TDA4bHB6SDB1OFhyOXMzVVZxSktWZlJxZ2VVOFZFWjFTZGxjNHlxZTRNejho?=
 =?utf-8?B?M2d2T1JMelBabjRjNlQrUk80MDRsVGJwYmtMNGRoZVJEL1Bvczh4MXdwS3hZ?=
 =?utf-8?B?emVjeTMvYms3WWNsNFF6Z0pkbkdwOUF0NlRDanE3US9vQU9tTU9iV3p6UWJN?=
 =?utf-8?Q?wb0xN6dRdiHnaLKc=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8faed777-e915-4ad6-16a1-08de627b33f0
X-MS-Exchange-CrossTenant-AuthSource: AMBPR06MB10365.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 16:50:42.6124
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1fWu6iRmLHsPbM1CykmzGlrMmOMtEYCKfHSjEOffxrX6SYY/NoFV4ssSRkmhh8VWPJYbzfjUlLQjX+lYHUCPyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR06MB6432



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

Adding to my previous reply, this integration aligns with
https://git-scm.com/docs/gitcredentials and in particular
https://git-scm.com/docs/gitcredentials#_custom_helpers

And in identical manner as git-send-email this uses external helpers
like listed here https://git-scm.com/docs/git-send-email#_sending_patches

So I don't see that git_credential_fill would be a match for it.

thanks,
Tomas



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
> 
> Add `return smtp, fromaddr` after smtp.docmd() to prevent fall-through.
> 
> Also: smtp.docmd() returns a (code, message) tuple. The response code
> should be checked -- XOAUTH2 authentication can fail (e.g. expired
> token), and silently ignoring the response means the caller will not
> know authentication failed.
> 
>>          if auser and not apass:
> 

