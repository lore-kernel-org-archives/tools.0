Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB35838F940
	for <tools@linux.kernel.org>; Thu,  5 Feb 2026 09:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=10.30.226.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770283147; cv=fail; b=L3w1it23HnkUpb/MOHTdejg+uGDHmwxcfFO0GLhGQK6Ha6KBD2qQG5oCbFtC9NW1W5fjUZN8E36Ttn2rx7A5RakztPnm1VlfmDMhKZhFx8rODBfEOh5gfFMhb7MD2iwgV8Avqur/8tPn3z86k6QkF3Y6dIQh1rjAq+0BR6/6K00=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770283147; c=relaxed/simple;
	bh=hylo1EGpr7yeR2M8Qkn181a9L00JkbC3T2xS+4aK60E=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=He7ssvnFR7aCIzmLhbdZQFk+6PA2LosQE+JuAEDYOceFGwO6Cp96NtW8hQwYlYWBd7m9o5DUmO9woZI9MhPjdc58Yo8nbgTjh2UemjX6B/GHgdT/CxxH6i4uhhXMQVwD71LZxM4onvgscBz1nYyoFECw7CIxCe7TcRvpMZe3+Ds=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b=L5nYkUsS; arc=fail smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b="L5nYkUsS"
Received: by smtp.kernel.org (Postfix)
	id 978F6C16AAE; Thu,  5 Feb 2026 09:19:06 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11022082.outbound.protection.outlook.com [52.101.66.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5CD4AC4CEF7
	for <tools@kernel.org>; Thu,  5 Feb 2026 09:19:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5CD4AC4CEF7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=vaisala.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yg1zRGS9tgZZbJ4mGr+wgvzmX+vkYuoJkQpqK407dJ6VjAqJI3/L37mI/2mSQq8ZsR0+zrjGi6ooMZ0bRG0oIwaAnH34ggDYzbNZ7anarogK1MqMr4auCDinlBFhfXg19iqzIXezGl54wdeeu4GxkgP2kIHTJ2kvfyrliaPKrlTtIf7JJEIM4WN1u4AVTpG2ehDAipeaSToMgL4W/YUA4eZSkQRrCSg3AQcdCRH3nCZTY7s7T/iyrm1WtJSqBgMat3QVLnoLWdQy/KSIf74FdldACSBKaJTZCNJidOnrDN4oUAO74GFUSkcT3rpoUK0Qqife+sSwhiQLIj4y7a0hKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MLP/XZTNixaPwEJpMl5TmWuCncPtWM5ugb+3V8lNyxs=;
 b=BGB2JJ4gD0dWXPtDxJxuPfbdhqYfzvCi0MUKKLcRhuPe8ldXlxqjv+O74mdsoUA5P1J7EKd1joU8k5fFTLKGeAfxMZppcA2z1VQm3F/bCwF8ns26IKIFwZDe+UXL2g6YKR5yv/gz8UbCLDuYK5Cim1kPAAgIF/YLwimNnjhNF0p9zwQJ5/La46HcNuvreznaeeX/PbQ6nsd1Z2YaQKMjKepDll8NyseVMhjNJbFRhV5Phzkj0nt3hYHSEfXamuQ7IxiCkwAkeQ7TcNYfhzoIT5P9zUcRQrCBKQsKk228xh3r0cXmc8ogHPZDPJL9xkEa4v6ukR40ALGT4aF0rQIdSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MLP/XZTNixaPwEJpMl5TmWuCncPtWM5ugb+3V8lNyxs=;
 b=L5nYkUsSZndZU5B0pWkjVdXUKruE8kOA34GPH7Bf7+9gP9o0699epFoEyr7EkYerFwZesm3weFZporQJGQtkjMAiG4mZb+h37VLHbfb3L1OtOklXnu91+4vfWXV+sKbV7GsnHUsfEZevoH2iFAY/waQ2vDzjxFEcFjCYDRRU+yEeLFXN5I8XoVA+s0dfAdzEU6o0acGc877HiR/N4N4lST7w1Xe4Hj9+oKMjRJIehcZ1ultJ4wduhOY9GQMEhK9lBIkIOCoD4gHMc3yjDZDqFlrZoGeMa7JbWau664MvSSdG9c1R1eVlk+8sF5AoMIEdBGRNwlPTD8/tfyIIQwMeLQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AMBPR06MB10365.eurprd06.prod.outlook.com (2603:10a6:20b:6f0::7)
 by GVXPR06MB9014.eurprd06.prod.outlook.com (2603:10a6:150:122::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Thu, 5 Feb
 2026 09:18:58 +0000
Received: from AMBPR06MB10365.eurprd06.prod.outlook.com
 ([fe80::addd:5e9b:7273:8049]) by AMBPR06MB10365.eurprd06.prod.outlook.com
 ([fe80::addd:5e9b:7273:8049%6]) with mapi id 15.20.9587.010; Thu, 5 Feb 2026
 09:18:58 +0000
Message-ID: <9817b09b-2ef0-4fad-ad76-bb746a5df858@vaisala.com>
Date: Thu, 5 Feb 2026 11:18:56 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH b4 0/2] Add support for oauth2 SMTP authentication
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 "Kernel.org Tools" <tools@kernel.org>
References: <20260129-smtp-oauth2-outlook-v1-0-e8c6d1b00c03@vaisala.com>
 <176992425473.611611.15176471580489636701@lemur>
 <20260201-sceptical-resolute-curassow-43ab98@lemur>
Content-Language: en-US
From: Tomas Melin <tomas.melin@vaisala.com>
In-Reply-To: <20260201-sceptical-resolute-curassow-43ab98@lemur>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: GVX0EPF00011B53.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:8:0:d) To AMBPR06MB10365.eurprd06.prod.outlook.com
 (2603:10a6:20b:6f0::7)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBPR06MB10365:EE_|GVXPR06MB9014:EE_
X-MS-Office365-Filtering-Correlation-Id: 6947c897-082c-45c2-c78f-08de64979794
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TGN5TlBCUDNPbzVIWTQybmxyWUlMR2hGbWJFK1V0QURlY3N4NWYxQkpRTXNV?=
 =?utf-8?B?U3F6Tnp3a2hmakxkRG1SODNVZVoxdWJ0NzM2eDZMbWJ6MEJBc1hGbHpTSWZj?=
 =?utf-8?B?R2dmSVZrQkNLSGVLVlc0S2dzc2dXaFhSNDFIcVFWa2dySkgrZmJTMEFDaEIz?=
 =?utf-8?B?eUM5RHorZWphSWc5bUE4eldvUnNBZHRQaVFVbzhiN0g2RnR6QmxHWkZqYU1u?=
 =?utf-8?B?WGZyRzRWNjJrQWZLNXJXRWtQdU5DS0wvTGpVdVErTlNEKzAxT3oybmx4cmNs?=
 =?utf-8?B?c20va0c5T2FaU09hd0NrZDFyS2ZMVDdObDhVQmpUMk5USnNJcEdXMXdUT1g4?=
 =?utf-8?B?VDRoMjdRUmV6ZFVvSXlCSVM0VFQ3dG5MMUpjT3NFWjMyak5WOXlMajNFNGdL?=
 =?utf-8?B?ZUdVUXV1SFdadm43andwZkhFTVhsanYzRVd0ekhnT0JnZ25OTmducytSTzd1?=
 =?utf-8?B?Z2xRcHVDMTRDaENFdWFzb0xjRGFTbHczdys2czF0OTJnU0ZCM0NlcHNScUQ2?=
 =?utf-8?B?R1VLUTJRWG5kek1jMVdYSjRmdmIwWUhEYU1UTnBhNTl0SDZiUVpkMHAwd1lK?=
 =?utf-8?B?ZVY1cVRrbHdGbXhyOVVhdFdpN0RMYVFOWmwwNTliNkpMbmNDUkJZOXI5RWZC?=
 =?utf-8?B?cE03R3BEamQ4TnFpekV3OWh2bkZYdzg5TXlKN0FQbVJranhKdEYwNDl3Y3Fy?=
 =?utf-8?B?MWJYTFg3SFRWRkFTL2V4Z2dCVFlPODhVSzVyV3JEdVMxNmJYZjRmUlFaelpC?=
 =?utf-8?B?cWZ3Q3BSZEU5NktTVndiZ0tLaHc4NStHSzB3RUR1R1QvcHBoSWN3TDF4MDE4?=
 =?utf-8?B?SXBhWXBoZ08vVU9Md2hpY0VXb3ZIZTZoUitiREY2K016K1ZPMm5ic2phUWtG?=
 =?utf-8?B?TStSTmhFUmhGcjZoM0xkVnFIamdLQmFvZUR4d2lDbTJLQlFIQmR6cE5qb2VY?=
 =?utf-8?B?ZFYwZ0NKVjhuaTViUG5qVWUzSnZJMHI4emRSUzVkellwV1pkL3ZPOEordWpt?=
 =?utf-8?B?dU5PdTYrQW9mNy9lQ3pnM0lPMm1XSVBDRlpiV0trUk1UNVFmR1FUQXFpZzRn?=
 =?utf-8?B?TktoUWxhUmJtU095ZmhTVXp3Q3Bpc29iVWVOQUlSdUpOeXMrQWFTeCtNd2V1?=
 =?utf-8?B?TUs0V2xFWU56bmY1THNPN1Yrc2lLVFBXeUljbDJsZlNJZ0RDM1FHN3BHaU1K?=
 =?utf-8?B?cDNrUFYvTC9keDRQWmZVQ3JQRHQ1MEtvNTNKb1JOWkZGclJDWnRnYzZjN0Ru?=
 =?utf-8?B?OEZDY0NucmtXTkZVYnJlbDE5WGg2SFJxV2dHU1V0R0xweCtYUlp4SlE4bVhs?=
 =?utf-8?B?SlhhQWtUMWZuVWlvRDNmbWUzdjNaK3ZXL1hxSTJhQU9EeUhqRUZITTNMc1dB?=
 =?utf-8?B?UjNFVlVJbnU5NzhpdWI0WHJtenFSOG9DRHArc0xEYTJ6YVRJcGNYMlJGaGty?=
 =?utf-8?B?QURpYWlVenRwcDlUZ2JLVENPc2kxc0MzMUwrNGZMKzFXcm5Wczh6ZXRjZFJk?=
 =?utf-8?B?cjBzYWlQOUxUZWtUbVlrK3AvcUxnUUpOV2hCYnVCdURGRU5ZZGxVL3pybFJ3?=
 =?utf-8?B?T29wdmVjaGhrV1RPN0xjRmhtaHhZQjA5NW15cWhrUENWM0FwZXlkTjhBbU03?=
 =?utf-8?B?SmI4N2R0d2hLdFU3M3VmZmgzY2l3a1Zsb0pHUzd4WkI3b3dDMDNDZm12NE9I?=
 =?utf-8?B?MXVGNTVtQUF5K2czcXVFTVdyVHhvOFVVbG1Zbk1aWHppQW1MdDgvNWx5R2c3?=
 =?utf-8?B?YzVkNUJaTklhUmZ1K21QRFRLSVZXTHVSMkpEc29TNXpxT2s4eE5YNCtHMVN1?=
 =?utf-8?B?dzYxaWd5NE9kekJHQzQzK0ppS1ZqOGsxb1JMRHNkcnQ0OUplMHNKN3ErclJJ?=
 =?utf-8?B?RGRsTm5GU3E5RWlMd2cyRDd4WVl1WlFpL0lXeGJ4eHdGZFJQeFRVK1B6NGJH?=
 =?utf-8?B?cTJmWDVmRFVqMkNSQ3EvL1BuRlVCYURmdUZ5b0MrQkR4MmlCRksycUJFVEJ6?=
 =?utf-8?B?bGpqUHp6UC9vbFNQUXRhTXlGZXk4cHdZb1NxOGlDV0NoTUZDcXdjdW9QQXpa?=
 =?utf-8?Q?NdC6nP?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR06MB10365.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RllOUFpjQUNCUUttMEZVcG12K3lHam95V3ZKaDhIREdvNmVrQnZGeFB3Ym9H?=
 =?utf-8?B?c2VtZE9uekRTRFlhVmdwY3VxaVpOTzdBNGhRYnpjTDVubDRvd1BWU0dDbXFp?=
 =?utf-8?B?RCs1ellBUlBBb2pnQ3BLdWlJUVp2Tk5VRkIvaXVkNjg5dnR0MzNmTWZMajd2?=
 =?utf-8?B?SEx4NzNLZ21EVmhXNUtvOU9zMHhCZHNOd0VmRUpuMjlUSFNXYjRLbEpxQmpp?=
 =?utf-8?B?RUZsdGtpcDBESS9hY24xUHB1Y2FNcjhLUFZidGhRUjA3OVJDTW4wK3ozVjJx?=
 =?utf-8?B?cWQrS2NYQXgzbUh4K1Y0NHMwMEJIc2Rib283WWdGYXkvODVZTS83R3R6eUJm?=
 =?utf-8?B?VHNuTGswL0NhaVFEVmd3V29jS1JVOUNYZlhYUzNOLzZFZFRHVmRVZGdGSnVm?=
 =?utf-8?B?MEtrQ2o0MkJ3RnIyNGdmanoxRFo2SmpFNi9KY2F1dmtydW11OWRRTlNGVUJF?=
 =?utf-8?B?TUVCeHVmUDFDdmtPNGR5a2p3eG05bGw5OFhCL01NT2JhQkxnNEF1ekYrVFdO?=
 =?utf-8?B?RCtJczJvZURhS0Z3Y0RhWVhQbVZaVDByRmlyYVpIWXo4dTRURE0wOUJKT1BB?=
 =?utf-8?B?Wjlwd2NJdDExckFlZ2VUeUdSN3FsWHc5M1gxK2F4Wm5XU2J6QWZSS214V2Mw?=
 =?utf-8?B?NGNDNi9yeWxPOStXTlVscjdxKzdLenVpMFo3TFRTSWRiemI3dG12cExBbWNr?=
 =?utf-8?B?di9CaWc0RWt1Ky93SUgvd2lWVFdTdzJpQlNPRnNzRTEvcUd6NzJ2bFNoN2Rl?=
 =?utf-8?B?QlVoZTFFK2xtUHVqbGwzV0lqS0Z6NjZhNDg4bUZGQ1hqTHE3UEJIek4xSW15?=
 =?utf-8?B?UDBoUU5iQjY5U3JnT25oQU5oZUNjb2VieFFVV3Z6dUlaQVQybUNEaGovbndT?=
 =?utf-8?B?Z1h3QmV1Tk4zRFBuWndWZDdSOU5ETDdCeU11OXlGeU53Z0JzS2xSYXgwUTBV?=
 =?utf-8?B?Uzl1ZVJScDFaQ3RtYytqekxrTDhqSmQvbGRmM3ZOU0pIdDlTZkR0ZmY1NFdn?=
 =?utf-8?B?Z2RDOHZFd3ZsbTVEYW8wZy92L3gyMlh0cVpaem5WaThHNEhYV0tJVFNrdTdx?=
 =?utf-8?B?SU44YTVkaUpzdzR1NlZ3RXBMUS9vVEpDNEJGcHlqQVpXNXVXR0pwKzdGdmxi?=
 =?utf-8?B?QzhSS0cwaUEyWVNFZDEzQnRWbzRJU2YxN1h0dWFuYWhMUm8wVGxsN0dKTEFS?=
 =?utf-8?B?WXIyMEZWc2VRYWZUNWhLRnoxWG1lcmJqNm1jVXVmM3A0VklkUjljc0h4dzdK?=
 =?utf-8?B?d2w3dDMyMW92cmp0RzRScldQY1Z3QkdWUk5lcnFtNUZTbk53S2F1dWVFQk1t?=
 =?utf-8?B?ZzRQSUVxS2JGcEt4eFA4dGc4UHdxVXFuL283VHZnN2lqVGlYK3NrRHBUUUp6?=
 =?utf-8?B?Y2ZiK1p3RlYvd1JvNnNNd2pSY2toUm8vV0hVOWo4ZklSVnhNVEl1VDdPdlVl?=
 =?utf-8?B?ZXNsNDUyNk1IYkMyRDdFNUx5aE5qaldvclFySTFsNCtxTGJoQ2NnTDJvd0Rl?=
 =?utf-8?B?QWo2RExEK1BlTXlQS2RyNFFpamJ5bzU1c1ViKzFpVWNWOWVMRlNtZTcvbUsr?=
 =?utf-8?B?ejVOZE1SaldxVlBoYlpMOFNyaHhCekJIbkpxTyt0QnRNVi9qM1JtMFdZZ3Vp?=
 =?utf-8?B?VlVnSzY3c1VZRmsrQTZkb01KY09NbmN0czBWQXZIQjRlakhFeHhVWnU3aGgz?=
 =?utf-8?B?ZjNRZUV4bkErZm44ZXZRMXZuVjdWLy9ELzQzTzEwamZSSWNFSnhOSE43TXpv?=
 =?utf-8?B?NkdyUHJZN3lSVnZVSWp4d3pWRlhFM3hlRHVNWEhFTzZ2VDkwZWQwOXJLZ2FK?=
 =?utf-8?B?SjQzMVhzdGNLdmVxUTA1dVRMSHl4cTNrbzZrem90dDBQRXRBRVhVZ1RGS0JG?=
 =?utf-8?B?UW9OTUNiLzAxVUZMMkFHdkRNOS9mN3NaOTAydG9wUm03MWRhMlAwSE9aaUdJ?=
 =?utf-8?B?Vm8zMFRxcFgxOS9rTUZ4eE1YYXBiaUhOM0EwMlVZZ3hpa1JsV3hWQThHa1VU?=
 =?utf-8?B?QStPWjJjdlBCUlFtSWVZWG42RUlpa1BhS3llREtZQVNPeW8zUjFyekFCMjNy?=
 =?utf-8?B?ekwydjBWR1l0c1RRekVIWElMTk1HVC9vTjFlMzdDSDVoVVYvbzZpblBxZ1pO?=
 =?utf-8?B?WUk4bFhxcjNRVmsvempaVXhSS29Sbk10ZnhQeXY3ZHEzNDNObG0yUTllMDBy?=
 =?utf-8?B?MU92Q1VJcVphVFlhNlAwYms0RDNMQjdUbFU5cUw2MzlYa1VIR0srYnFQcjJ2?=
 =?utf-8?B?dWR1OFVPTVNxUzhYeTRUeWFVcnQ0Tm1iSGdHRzhUd3ZocHlGSEpIYk1QS2FR?=
 =?utf-8?B?T3JCQ2JKTktKWGZrOWxqTm9RRHlDNDNXai9EQlhRaENaVHdWc0QvNllwckJP?=
 =?utf-8?Q?nXGqb9cVG6qQXN2w=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6947c897-082c-45c2-c78f-08de64979794
X-MS-Exchange-CrossTenant-AuthSource: AMBPR06MB10365.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 09:18:58.0187
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OHjM2X3q0SEM+dPMTFHkMguJOf5U0IqL3/HmD27XlgLA52VMgQcGGsVTmR6Ozyu51f9hScgeYRtTSu/qVssGMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR06MB9014

Hi,

On 01/02/2026 07:52, Konstantin Ryabitsev wrote:
> On Sun, Feb 01, 2026 at 12:37:34AM -0500, Konstantin Ryabitsev wrote:
>> On Thu, 29 Jan 2026 11:10:28 +0200, Tomas Melin <tomas.melin@vaisala.com> wrote:
>>> Add support for oauth2 authentication with SMTP server, integrating
>>> with git credential helpers for retrieving tokens. With this approach,
>>> the same configuration as is needed for git send-email can be used
>>> to send patches using oauth2 with b4.
>>
>> Thank you for sending this in! I'm using this series as a guinea pig for 
>> the "b4 review" functionality, using agent-assisted reviews. I know it's 
>> not everyone's cup of tea, but there is enough interest in it to at 
>> least support it.
>>
>> I'm sending per-patch followups with the problems the agent has 
>> identified (combed by myself -- I'm not just blindly relying on the 
>> agent here).
>>
>> I am also screencasting this whole process, so hopefully this will be 
>> educational as well. :)
> 
> This is the screencast:
> https://asciinema.org/a/777545
>
Thanks for sharing! Interesting stuff and looks promising.
FYI for upcoming v2 I have also reviewed the patches with an agent, so
let's see if they agree about possible findings :)

thanks,
Tomas



> There are still lots of improvements to "b4 review" to consider it useful and
> remotely maintainer-ready, but it's at least doing useful things already.
> 
> Cheers,
> -K

