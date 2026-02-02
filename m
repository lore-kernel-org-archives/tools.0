Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 158641EBA19
	for <tools@linux.kernel.org>; Mon,  2 Feb 2026 14:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=10.30.226.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770042692; cv=fail; b=YntuIUESKjcv7ZtpTZ5TznkzeMDyYVwsYNxLv3ZUMdDHRzn0z7ZhoqGyF29vbSfdxEavtJcUV66XYWC045zSHPKI4TR2bCPCtXxikVcIPaxnUGpk4N0tGbfL4Ybs7Dd7AnmcJTKLrPUrzE2D1/xqM2OdB/ok4DxLieFHnh+ZswU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770042692; c=relaxed/simple;
	bh=z50uNOkd+wQC6NMdU5pJunIIhkZONgQ8ED/VpD1otHU=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=FtoY/CwW4rRPz10rVzAoo3K3i3I+9UXSGstiOzeL7r4IGV5krWBPOGD/motTW17iwRMHALsrCBuPM14gzPN9o9S6J6f7JgTa1GtpTZ2Vw46cjzX5pMAUot7kpD8PBRpl5dtT1f9mn/m+J83vQMEPX1+GO1+byVh8PbSIKv3OpGw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b=2qUMUdDx; arc=fail smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b="2qUMUdDx"
Received: by smtp.kernel.org (Postfix)
	id BACD9C19422; Mon,  2 Feb 2026 14:31:31 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11020120.outbound.protection.outlook.com [52.101.69.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A3B0BC116C6
	for <tools@kernel.org>; Mon,  2 Feb 2026 14:31:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A3B0BC116C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=vaisala.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=doOge0cImT8CCsRCzH+f7xiJ6uOnk9IN9TRtlXroDbwuOdX6uhj0Xz9Ul49bfOrw+2/rIAEyTJIbLLlsa+FtwiU5FA252JYopGTVVwfiae+uUGZyxHz/mOdgmqzdOVQbvfyloIdzz900Rmnm7SWwDma/2J/vuMIJm72isNudEM4iIg64nQJPAq082upXmwWK3mj51TDzS2LQbRbYUHxkvkPBUr4Vi2OrVSGVu5OqObwKECNmO7vaY1V0Wma1z2kZhg1rNV4o5jXVSWmTC8OC51KijrPEiRYQmuKqY8hL83NwRx9FVaWxvuKbNceKl2jvFRXavkPhWgtb1eefz73Jtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OzdCWuoThOPhsrc/zEA4FV7onO71IunPeb6Pl7tgdkk=;
 b=P4ql2pIcDqAR5BTMGPhfO1+Yx6mPxvZ5cdRmffBmffrE6+EjJswTJW90eR7u2j/4QAcf1lOIUh4AqyhCJtRG220V54tCSvUtiLtpkOrdHqitSIcqHBc672TzDBdHGIFChedCjPwCzDCdnKW6yLDbI5NPkvPXADvGahgr41PJX+lhjcWR75AABkjAqrJiqMATTUUvoJCBiQQKunGsxFwVp9R3XGT7lU4cJQsFbn11mWHDjI/Xso49dHfibbfKJjPBuMFpFKUhqGZ5A3kM++0o2MME/17zwbqWXFh7BGYe20s+ZaGTjY2/8lP9Ddx18vqqPZcpRU46PdDx+8itZ6g6FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OzdCWuoThOPhsrc/zEA4FV7onO71IunPeb6Pl7tgdkk=;
 b=2qUMUdDxLzBvhPWqoNi6Cv+094uLcTZf6uq2ZHTqo9ALRRd+WbqD2xbwRwnlnwUndvytR4nq0ZX7n1m5lPgBigWDzfdUXcioKG9q3RlOhwnFJSGHCJuwhQEU3PGC1UCBCwGuYdpB3Ivyp0/Hk24iei+LXcH+0JzP9T00LHbuJ0U6toBCyZhMAYszekxUAReqtOeGECtd3dzLEjAkZFbdXLcyUtTzUZtymTPQosfKexM4XOotEa9lNAorF6bcABLbIhzsHTAz20idJa0d7tzxzySdqXnd90U5eFy8ypjtlwHaErAa/7rkSwUIkz3NPKI0goxD0k1tfMou9wG1agKslw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AMBPR06MB10365.eurprd06.prod.outlook.com (2603:10a6:20b:6f0::7)
 by DB8PR06MB6362.eurprd06.prod.outlook.com (2603:10a6:10:12c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 14:31:23 +0000
Received: from AMBPR06MB10365.eurprd06.prod.outlook.com
 ([fe80::addd:5e9b:7273:8049]) by AMBPR06MB10365.eurprd06.prod.outlook.com
 ([fe80::addd:5e9b:7273:8049%6]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 14:31:23 +0000
Message-ID: <43054d10-388a-4414-966f-785d46f88e36@vaisala.com>
Date: Mon, 2 Feb 2026 16:31:19 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH b4 1/2] ez: add SMTP authentication method to printed
 information
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 "Kernel.org Tools" <tools@kernel.org>
References: <20260129-smtp-oauth2-outlook-v1-0-e8c6d1b00c03@vaisala.com>
 <20260129-smtp-oauth2-outlook-v1-1-e8c6d1b00c03@vaisala.com>
 <176992425474.611611.3433768227265573567@lemur>
Content-Language: en-US
From: Tomas Melin <tomas.melin@vaisala.com>
In-Reply-To: <176992425474.611611.3433768227265573567@lemur>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV3PEPF0001DBAC.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::6ec) To AMBPR06MB10365.eurprd06.prod.outlook.com
 (2603:10a6:20b:6f0::7)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBPR06MB10365:EE_|DB8PR06MB6362:EE_
X-MS-Office365-Filtering-Correlation-Id: bdf31a02-d11b-418a-2f16-08de6267bd74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R3lwa2ZJL05jV2F6WTV2MnJNd1o4enY4amhMQ2szaVlkaThLa2dBS05obUZF?=
 =?utf-8?B?VkFpNGxyM2xJQ2xncFZpaGx3b2dCRHloaUhWRGhSV2NkSURhK0NBbmlwVDNX?=
 =?utf-8?B?T1BoazdqRjRjQzkxc0NyVFJrMjE0UGJ1VURZL1gvWjMrMGd0YXhvR1BhcCtj?=
 =?utf-8?B?RHdwNXhUNGpiWHoxVHR6ZjBHT2ZKeWp6VFVla0E1eXErMXRMTkxWOTloeUVN?=
 =?utf-8?B?ZDVzRFZGU203ZDNIS1VZT1hpUFJNTThURkpnaTNJNUJuZ2YwcExMb3ZPNXhJ?=
 =?utf-8?B?YUFoZXBYMWpRdllnVUJhYWpEdlV0SWVwTkxyNG5hNFFqRHJKOFZ5Z3kwWXox?=
 =?utf-8?B?eW03MzNSUTdZaDhvdHJwNHRPcy9Za01vc3lwUGgwTGF3MW1KdkRhUitLclF2?=
 =?utf-8?B?RHN0ekN0TjV0ZHQzYUNESEY5OUpqcnQxendHMCtCYTZDSmtFdFZSaUJHR3lV?=
 =?utf-8?B?MDloVVczRlMwUDFxSWlyU1ZDTDk0SHJpZXp1enZSYWZQNWZNVG5vT0k1NVRq?=
 =?utf-8?B?Qis4UzZGUkNhNDRFN29WNlBiK2pRVVY3ZGV0RVBBbkpLME9pR2hJY0ZQZ09q?=
 =?utf-8?B?Mkc0ZEplREp5UmZwS1lDMVVIMDdlSitFSlFZaUNQZUhhV2xXNGtoa0I2TnRy?=
 =?utf-8?B?a1k0cTV5VURzYWt0K1VrN0tTcFdpalJDZm1vYzk0cTNleGg0d3I2Z1F3c1l2?=
 =?utf-8?B?OFlVb1EwSnhiM09yenFKd2RsQlg0RVVpYzhHcDFvWWJSTFJoTW1VajhtQVp0?=
 =?utf-8?B?Ymw0L25mRysrbUszcmk1eUhqYmdlQjMyS3NrL09mUXc3V0FPbjRUaVFGWVd1?=
 =?utf-8?B?VE5BL1ZocFdQZWlsaVhkWmxqM0lZUlk1R3VRellyb3VESFBQOVFJUll5TjNY?=
 =?utf-8?B?dm1DZEpmWmRZN3RncDdORWJZM2lrWjVZelNFZ2FNK1VmcmJEVUEyWlJzbzhj?=
 =?utf-8?B?T08rMnYzdmMrUVZtd0phQVQ4QVFWczljUjBueE02T25WSzRTZjdubTVmckhN?=
 =?utf-8?B?dXk0VURUM0o3Q2lPK3ppZjIzcGMzd1pQeFo0UzFNdnVBREUrNUJ5UTA0LzlV?=
 =?utf-8?B?eHZzSkRxdnhtM1ZVci9VNkZtb081Q255U3o2ejRNQWhjSVM5Y2ZORjRBQTBz?=
 =?utf-8?B?aUdwbXlWUVhtNWNUa1BFTUpCUFVVOGFkZDJnL2JDMUFJNWM2K3FjeFRJeDhZ?=
 =?utf-8?B?MTBUQncrQUN5NHYxWlpVZm81aFc3VENSdWpIVWZLcncxTzZNeno0NHBCblVi?=
 =?utf-8?B?aUk0RWk0M2FEUFNnVUdFVmtrQitEUnpCd2tpSnJpY3ZNQ3F4bEFVc0NnVEcx?=
 =?utf-8?B?ZEN1dVlPTk9saE1YeDJRRS9qYUhnZm05TG9XY3dleitmVVVUaG93bVFUWkJT?=
 =?utf-8?B?dmZ5Q3BrOCtkNjZ3OWhvOEc4OWRub3pDcGdLb0JZNG9zeEtuNHRydXBSaXRO?=
 =?utf-8?B?R0lNYkliNW53eFltU2ZpdTdwMzRtSm44M0Rud2hpTE5vSTVxTTA3clpXandC?=
 =?utf-8?B?a3E3ZkUydWExdTlCUE9sUlBIemdOS0pZcmx0MityQTZtZmdCOUw1OEtyNkpI?=
 =?utf-8?B?WUZqYlVvQjh5SSszblh3Wm93enVaRU5XM3hkYlYwVi9LNFZReklQYnpuQUtj?=
 =?utf-8?B?Z1NDOGp4NWFuZVI5SEtFSFZMTDhWOWtYbFdaQlZMRERvL21TR01DQmN6c1o0?=
 =?utf-8?B?RHF6UXhkSEI5QTJHRzl3ZWs1dEo3QXJSTU1Ub3FqRWI3a2FYMGdXMXR2OVhX?=
 =?utf-8?B?bHJJQ2pnOFQyK2oyV2FmdnpzV3B6a3cxaTRjSDhIOWxtQ2ZPQzBZM2NmR0xP?=
 =?utf-8?B?REYzcGpwbjQ2WmY2R1N3TG53Q0xwTWcwSnRab09JMzhmZFk3Y0pnalFiT1FT?=
 =?utf-8?B?YXRQR3BaelFCQTVFV0x1TFJBdmhnYjkxRHhDU3ZyUi9OblVJdkFZbkdyZ3hu?=
 =?utf-8?B?cnhZYXpxcTVWai9lYklUTHVnYmtPbmN6WTFBcWp4TFFlSm5NdzZOV2pMc3JT?=
 =?utf-8?B?OGV5cTRlL0tGSmJ0MGk4b2EzTXhwUEllOXBaRk41bFBscFdqZC9GZk43UW8y?=
 =?utf-8?B?TzcveDRGd1lSOXdkWnlaWEJZZVNrUDlzMUlKZHBGVWRWTFNyWGsranltK2Ji?=
 =?utf-8?Q?os7c=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR06MB10365.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UDE1QkxmeU1RdU96N0lyNllhWDU4cVpXMThBNkMrMjBLZ3lFakVmMGZNRExZ?=
 =?utf-8?B?elJmUFhtTVZQdHZGbTZHRnk2eG1EQUlTNkd1ZkZQbGlORmk3WWptVkx5OUxl?=
 =?utf-8?B?bXNTUTc0cXBYUUJOL3E3QVJIT0tpcHRsWm14ODNDK1B2b2lUakdpNUFWOWUw?=
 =?utf-8?B?OEdSTW1nVjcxallzMXQ0cHNPNUZ0dU53WUxnMzVpYjFYRWxxdFJHOEJxSGNz?=
 =?utf-8?B?L1l2OTUwRGd1WVpBbzcvODdJY25DazJVcVdIRlRGMU1QZXJrbDlvMlBHdXcy?=
 =?utf-8?B?M3JzbnJxa25SUFIzUUtuaThKci9FbjRSSVd4dEZLaUQ4SjB0MXNqS3U5Wm5B?=
 =?utf-8?B?NU9UTG85RHovOUxyUDN2dFF1dWFjYUNHalgrbmFITkFwTkpwcUZTN0hRUk01?=
 =?utf-8?B?eTFPc2RVK2c5UTA5bk10UXIxb1JRZ04rYjdQWWhjRSt1UzRDYTdGZk91d3F2?=
 =?utf-8?B?TGJva2w1c3lhVHBJajhuMjI2UFB1WUVvTW0zN0M2YlBEeDdWRUtlQW9EUFdi?=
 =?utf-8?B?N3FLRjEwMXA4MU1xZGRFcXMyOVlLUnRmL1VKRVZuelU4SnR2RFR5N1k5Wi9H?=
 =?utf-8?B?NFFQaHhwL0gxVmliWjdyWDYwUWpFWmR0R1NiaTQ4YVVhaEZsRG1QU1Z0c00x?=
 =?utf-8?B?NS94a3ZMZkNRWkJFQlRDamVaa0pDNmF3aVU5TUtXeE1uWkdSb3NleEZDa0Zt?=
 =?utf-8?B?VWxLVy9keTF4VmtxZEJ0eEduTC9CeFFrZE1BeHNXVzR6MGFYM3ZRU3ZEZVdr?=
 =?utf-8?B?a0huVUNOSytrUVVXMSsxVGtYSytFcTRRLzUrU1prZ29YZ0tnM3RDckZyWXZk?=
 =?utf-8?B?Nk44UDFwS0xuY0x4azJwM1ZXK1NDUGUyLytqZytoaEsySis0K3VELzdncGxN?=
 =?utf-8?B?TnFsODN2dUhsdDJWalF2YmpZa1VIcmRWaVVRS0VrTzZaRzRtK2hJUjJjS1Qz?=
 =?utf-8?B?YzBUaWJxNEk2Vmtyc2JCdHVwNVFadHZ5SlAzMXdsR0dFUDBCakI5ZEw1aHRs?=
 =?utf-8?B?RGd1aVBwOVZ6RHgxa2RVTWYrbG91alQyWDRoaVM0eVg2MnJSUG91T1F2TnlT?=
 =?utf-8?B?MHFTdzRHZTJKWWJTbVZhdCtGQ2x4YXRabFErS0Uxeng2Ky92VkV6akdScllu?=
 =?utf-8?B?OHZjcUJpcWp4VWk1RVo2ODNVVExWamxEaThNTGdQV2ZMVzE4VWEzU2p0SGVR?=
 =?utf-8?B?YllWSk5KajBUNHNiZE9wdzBJM2JkVTZOY1FkbEVWdzgwMkJKaWNtV1VLVTk0?=
 =?utf-8?B?Vm5yZzJMOTVkdmZObTljbjc3YjNTUEVObEY4UEVhMGxQYk9hMVBqNzByMGNE?=
 =?utf-8?B?YjgwU2ZVWTZiLzVTcHp6cHN3aGlIelN0OGZnSzlHN2NrcE53VXVLWWpIcm4w?=
 =?utf-8?B?eEwwQmJMYy9raVdJQ3E5WjI1M2pmVFNXbnJ4YktzSy9uVUZRbGhqU1E4dGdy?=
 =?utf-8?B?K2lLeVlCYXN2bUNGVmFEc21BVHY5TnZBKzJrOWJ1b3QwdENKYzI3ZW9QSlh0?=
 =?utf-8?B?a1ltNFlJdGVBVTdMSU9LeEhIZEtRUk9rRTZJYzZnazhqNXdlSVQrbnlkVkE5?=
 =?utf-8?B?YXZxaUdzTlhTRWF3WXJ2bjhzcFJ0UlRualY3K3JBQmtqUjZhc1RKaTZuK0hl?=
 =?utf-8?B?NkVBeVRnZlEzL1Z0V1JZamxVdmRRRkRKVCs3K3pZYXV4a2VRZ1NXcVFKa0xo?=
 =?utf-8?B?SVVrL1NmTkhUNFd4Kzg2R3JKdmhGeWRwaDFFeUxkeitHV2JJY2xtUmVjaVNK?=
 =?utf-8?B?cldGL3Z3Wk0vQktJV244VjV0UzF5NXhHUFRjeFcrNmNrUEZJZy9PazBRbGlr?=
 =?utf-8?B?Mi9tNk15UXBFTEpIeTNLZVlxeDFKcmcvMGwvODVOOTJxZEJ0ZEh2SXlkMUhF?=
 =?utf-8?B?czlCdERXQVB4RlpDc09jSHo2eGxWVkVON1B3T2lrbU1oQUFhUTU4T3VwMk5z?=
 =?utf-8?B?U1BnNnRHNFAzZXVTeTExeE4vL0k3Mk13aTh6a050TVVBY2k1SkZLK2FmdVlz?=
 =?utf-8?B?SUFhenlPamd2TzRqYzJiODhZclNIcWhBZzdpSXlxL2Nwc3RrZTY4WjdYK0ZQ?=
 =?utf-8?B?SUdGUVJieU1JNC9RU1RZNHFjVGlEc0VGWTQvRWY1aWdITWVySldNTk9taHNy?=
 =?utf-8?B?YnNuYUZSejl4QTZRTXBTbVFFM2hLOTdLalcvMVF4bkNnTm5Rb0lFMGdiUkZI?=
 =?utf-8?B?RkRnY3I5d1J6MlR4cHRTU2hNZ0xocXhNcFdzZlFoZVBzVTlXSHNmNGphY0Rr?=
 =?utf-8?B?K1JndzNCNW4weWFTVEM3WUFnU1Nmc1RzYTYydFBWTDhWb0FnK01uL0dEdUxi?=
 =?utf-8?B?a0QzNUhQU3VqU3ZWSTFMbXI5OUwxRGEzUE80MjVya1dVakpCblB6TVg0bTJt?=
 =?utf-8?Q?laN73SKb6FyX9K0g=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdf31a02-d11b-418a-2f16-08de6267bd74
X-MS-Exchange-CrossTenant-AuthSource: AMBPR06MB10365.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 14:31:23.4364
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oo9BMtOMMzTqAQhAQVQ6ptNvyd55jtl5XlQAQE6XwaIaXfnBLlxuITKrjargCyuuM/ihsCwm4mj3E3sg3qiWqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR06MB6362

Hi,

On 01/02/2026 07:37, Konstantin Ryabitsev wrote:
> On Thu, 29 Jan 2026 11:10:29 +0200, Tomas Melin <tomas.melin@vaisala.com> wrote:
>> diff --git a/src/b4/ez.py b/src/b4/ez.py
>> index 298e382..581d513 100644
>> --- a/src/b4/ez.py
>> +++ b/src/b4/ez.py
>> @@ -2193,7 +2193,7 @@ def cmd_send(cmdargs: argparse.Namespace) -> None:
>>                      sys.exit(1)
>>  
>>              else:
>> -                logger.info('  - via SMTP server %s', smtpserver)
>> +                logger.info('  - via SMTP server %s using %s auth', smtpserver, sconfig.get('smtpauth', 'basic'))
>>  
> 
> This is a nit, but the default value 'basic' is displayed when smtpauth is not
> configured, but the actual auth mechanism used by get_smtp() is login-based
> (smtp.login()), not "basic". Consider 'login' as a more accurate default label,
> or only display the auth method when smtpauth is explicitly set.

AFAIS, login() and basic auth are in this context the same. Basic in
contrast to oauth2.
But, indeed to avoid any confusion, it can be best to print the auth
value only when smtpauth has been set.

Thanks,
Tomas

> 
>>          if not (cmdargs.reflect or cmdargs.resend or cmdargs.preview_to):
>>              logger.info('  - tag and reroll the series to the next revision')
> 

