Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7C0166F29
	for <tools@linux.kernel.org>; Fri, 17 Jan 2025 16:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=10.30.226.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737130913; cv=fail; b=opVMUY7lSaBl4VYnnRX7WwkZAyHu1FG/aBkseA0HD7gL4h0KTTn2pepgbDEY9C4RHX6taGB7gWgyqmb2AaDZ+IcCMMn+dHW0cJ8G4VleaGBuYX7kpRJIMq8k0NqgX9aYWOrvL5NNCAJbbLnqzkrDFcv10PnvCv8kMnowiNtDpDY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737130913; c=relaxed/simple;
	bh=Th0x1LIDJI8uBnSM4Ws3cQ4/oAkM674MUMbUdQHBDn0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=fmzMfh7opTncv8nThtAB2Q25nygX1SZGjkcSybmx+9YkBgvVk+HHf/HcX4AT5BZf9U1d5NwyDZHEck0N/6XUXpnEZtOtfwatWVX7xKegdqI+mUh321iur/vUhxKNkhgVaPpLWiqXzrsUbS5yVcZHhYkyZg2LYf2QwcMyFpT0jw4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=TJtvBmDp; arc=fail smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="TJtvBmDp"
Received: by smtp.kernel.org (Postfix)
	id 7B669C4CEE0; Fri, 17 Jan 2025 16:21:53 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2056.outbound.protection.outlook.com [40.107.241.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 13C78C4CEDD
	for <tools@kernel.org>; Fri, 17 Jan 2025 16:21:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 13C78C4CEDD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=cherry.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MaVCPgJwLTGhmMdOhnBNfq3goJTJ3WWrp83RleGGCCV/U7/15fe7s4JMlk3G+N46bId/LAxLuXmIulLizCYkrgOBduwe9VGDnP2ZXiYH+mi4+eKZTBzes6pmmHjafHbaaauT9HTRNpS+XmUAMEDYRXxdTIPMvs1nioBstrMtygpmU6TPTCcThr7Lyo+y4/9zY5Ba5T0FUsG0iG+shSZZg+YmXhn1SEurmjlzC4B6MwVcN2bm0i0LWTgtel94mGb5yzL7ItTORnWMXTXk+6TfKlkzs3fltBS6EgN4KTNVSf/3E8R3GGmKWFL8topCuMinsYx267G9TUwO9OMrRcDn+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u3JVADk6Y+bJIwgbJ7MNmAUkOa+o1o5H26MWDshx5mo=;
 b=fNACxb+Sv31RQGiXq+g9QkO3xKADyrOHhvi6WYJSXSBPMEHlUYk5h9oUMRjBh54+43awmQrmiJOg8u24yO3EoobEMHyO/sQnGGdtGrYMl7Y/JonaC/W8IY1FJI2oYWTmaHcqZ9aomHTsTF8D8DHdVpzRKISqWuXfU4Ka4CwFn71Y3cmIzafieKDIc26faaP+0WYV+gfHu0v2qOZY2WuGGPXkPIPzqFwKqs81sS80h/ubJN7WCAQa3Yb8zrCbawCC8m62gGzR/Aa3p0wWPk69Wh/piAyT1bytlv5Gjca9B0/IjPZxQdCZRhyGa3iX5/QRSAGv+L4W/zl5NdCJxhBfIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u3JVADk6Y+bJIwgbJ7MNmAUkOa+o1o5H26MWDshx5mo=;
 b=TJtvBmDpKgahcGcBwNJIhiWH8B9bFu+yynEhfUmVkvI7ybCW5yutt2vbZaTr7U8XQc9yBuZU7YlJi2BMOl5/QrVUds/7/3Jfuw4jo7369j7CTZiQ8c5nNrmn1i4dhVS66ds+4a/o+NqWO2C1TANNOXAxcX/S2xUH9Rnnv+t/nwk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PAXPR04MB8798.eurprd04.prod.outlook.com (2603:10a6:102:20d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.16; Fri, 17 Jan
 2025 16:21:48 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%3]) with mapi id 15.20.8335.015; Fri, 17 Jan 2025
 16:21:48 +0000
Message-ID: <2a35c1d6-3e6f-44c9-8938-4fd77a3be7b5@cherry.de>
Date: Fri, 17 Jan 2025 17:21:47 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [b4] prep-pre-flight-checks doesn't seem to work
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "Kernel.org Tools" <tools@kernel.org>
References: <a8bc0958-6c46-4622-96ef-b1e55c15f30f@cherry.de>
 <20250117-ambrosial-interesting-trogon-a67628@lemur>
 <8f22b90c-3216-4eaa-abf5-85dc29625e4f@cherry.de>
 <20250117-practical-avocet-of-novelty-9dff8b@lemur>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250117-practical-avocet-of-novelty-9dff8b@lemur>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0037.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::19) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PAXPR04MB8798:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b8f2de9-d2a2-4606-1e37-08dd37130aab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q0h2bTNNN3JzcjE3ZzVpQzcvcUVnN2gxZUUyODl3cyt6aW44WTE4bVJoOTlT?=
 =?utf-8?B?cUFBb0dzbXRjakpNZWxCZWQySUZ0VXY3SFJ3cUN0S0t4ZnJtWUJPTEdiaWRH?=
 =?utf-8?B?THpwZE5qVGwwczREV0NCQURhTU9uV09iYnN6S015VlBCcDJpOVMyUTVDbDQ2?=
 =?utf-8?B?NDJnYUF0TkZ3a29OSGMrL0Rlbjk0QnU5aWFxcmprb1hGMk9aV2ZZUHZZRmhT?=
 =?utf-8?B?MFR5YVo3TXJzMnNYeE1EZ2JyN1BqMCtkbklhZVlDTDRZdzZUL3UvV2hZNm95?=
 =?utf-8?B?NkVuSUdETnVlL3BiTzFQbnU2cms3VjFiVUJtQUhXWTR2bEtSSUFsTEpuNlV6?=
 =?utf-8?B?VngzV3BodEpBZlZSM0NPMHBhWm1Ta3EzaCs3M0NaM2JoNWZvRk1wbk1aTzls?=
 =?utf-8?B?Ly9wdml2R0t2WUtNeThLc2QvL081c0Yza0szOVAxVHVJSmJ4MzcxVGV4RFVj?=
 =?utf-8?B?eUxRY01hc21pVjZSRXIwZVZqOEVteERJMHhoWFp0NnJEWVlDMHhlRnNkeDNI?=
 =?utf-8?B?R1Fvc0Z4aEN2OHRYOHBxSnVJcnlOM0F3RHp5VW1SZVhKTC8zdncxUUV4TEIw?=
 =?utf-8?B?RU1lbmRzR2xhS3FWRWVxTzRDQ3F2eUpvNWFRRU1nQytseWhoQ2w3am85Q2py?=
 =?utf-8?B?UkdlTStLTGNlOUlkdGV0S3Z6R3VFazZxSS8xUW5ZWHo3SjlZbjVtTGJXV0oy?=
 =?utf-8?B?YTZxbXhjT3QyYjlBdkNNTXp6NzgxZTlvcnpWaTRzejhaTG5lMkZkcU1YaUI1?=
 =?utf-8?B?S0F5SGg4dzluc24yRkI4MTJtU3UzbVZnRXpzaUl6Rk5jWmVBcGVIK29XenVY?=
 =?utf-8?B?TXVPUjdBc0dsMFNXUCtGeHpKZGY1cFNwOUxxTWpOZWNYNlN3MXpOV2Y5TGwx?=
 =?utf-8?B?a3VVZmxHZDVZRStVVjl1clcvbmVOdW9yb3VoZ1JHU3BjVVJHLzFWS2RFZENS?=
 =?utf-8?B?dTE4VDBRcVQ4SVNUTWVBQmwxY0NIdHJrTVNMTnkzN2VGZXhJekJ5V1JqOUpq?=
 =?utf-8?B?NkFOSWpRRitUVjdTaWZjMW10blJWVWoyREo4d09IdWYrRWVuOUZqN3pabDBN?=
 =?utf-8?B?elFLL0x0cnFwRlNXeldQczU1MFRkWS9BNVFPeGtTUFFySXJiU0gxVTdUZVY1?=
 =?utf-8?B?WUhTanFDcFFNY0E1d3BydXlkVHJETnNteXE0M0ZOQ0ZtM1lBOENIS1NjZnlD?=
 =?utf-8?B?YVo0RmtpbGpqZ0hTOFZmZzRHKzdIdzh4MG95eVIwZ1RtQ1h3TGJZRHdHRHV0?=
 =?utf-8?B?Z0tLMFBlZ1BLcm5mczJ6eFBadFplOGNpZWdOUlVyT2lkQW9CRG9rSllXMW0z?=
 =?utf-8?B?MjF6c3czbHpST3hEU3JkQ1ZLWXpXd05lWGw0MEV4SGYzWEtjR0FuWGxmMmpO?=
 =?utf-8?B?WFlaN2NpVXFWVWJrYWFGbnNHS0hhbnp1UUR1RlJsSzRnY2ZuVXFkTXhadkor?=
 =?utf-8?B?S3BDdFJJdlpXWndwcEFwemxvemhVUG1PcGFrTXF1SVIzSDFJUlNobStIc2ZD?=
 =?utf-8?B?di9kbkZYSUd4UE1ZTkUySWY0cmF1RVcvNDdYdm5hNjg1QU1MaXVsZWw3ZG9z?=
 =?utf-8?B?UmxySTJndTkrY21QZkFCc2gyZnY1S2VQeHlZTjFra0wxMWV5WXdzamd4RkZv?=
 =?utf-8?B?RmV4S1N6dXJpNHhOQVNxZW94aTl3TjNBYkpBUE1aSStpakN3MTcwb0sreHph?=
 =?utf-8?B?MHhlZTVPS1ZiYlpreWZjUjdpUHdZaXNEMHNWWXN5RnVNY3NHZkQ3RjFTano3?=
 =?utf-8?B?U3FDVk9wcStOcXZOeGp5N0VXSnJGQS8vbnBCSWVselhrbjJtTUgyQVl1TjdD?=
 =?utf-8?B?UmhGRklwckwvVEZ4STVlaXdBNytucm5qdy9iQjJPK050TVU5TEdpRjFHcFQ3?=
 =?utf-8?Q?cSR6C6UEG2FSo?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N2JUek9RSnVlZEl4L0dYZlVaMU5GODhPY3VUQTl3UHo0Q21kb2h5bkphYnBJ?=
 =?utf-8?B?YVkrNmRybXFsR2pRT28xeWdrVnNZcENxNzNicW9rOVIwb0VQZE1mTmZlNXB2?=
 =?utf-8?B?UzhGd0hRQmw3WW5VWWszSURiTVk2dWN0QjlBZzZ4WnlmMnZPNWpWSDBVZjcz?=
 =?utf-8?B?R016amVMRVFYaXZ0dG9uaUtNdnh2ejdWVHhXNWVNNTVtYlR3SzVBdDRxVU5i?=
 =?utf-8?B?OUJyOWU4Sm9uUDh0ZTJhZGV2V2ptUExkTGRKY0IrVUV5aExKTVF2ZUNyTmIr?=
 =?utf-8?B?NVVXRWRSVXNqZGxxdXNJVGhEUEp5Vm9nVDF5SUdhOVpDRXUrajBlSVpVYVRP?=
 =?utf-8?B?R0VNbW5OdXZvSlI3aVpZM2VxMWRGMjlDamJwdUVFa01mRHZ6bDVtK1lDRXYx?=
 =?utf-8?B?UEZuRFhWazVTL3A5TS9LVDhBY3RiWC9zZm1PbVFweW91c0VQVXN1V0hUSVdr?=
 =?utf-8?B?a2hxQ3k1R29Vc0VtUUdwcTFmUEp4YTJpWWl4bEJaSmd2NHBZb0JId2JvMTZl?=
 =?utf-8?B?dFZyZHdTQXA2VjhjTjhMd1dxeThyd2FKRnNEdVpGTGxubmVib2Rzai94N2p2?=
 =?utf-8?B?bjJ0WG51cnhzdUZQdnhXVFVCN1MwRW5xZ2hwV3R1aGFCMWxSQ29vbGtYMGw4?=
 =?utf-8?B?ZDJUaWRsSlBNNCsvTjducks0UVBBa2NKN2wvSzJEK0tpK0c5Slp4YklRWGkx?=
 =?utf-8?B?SElIcnJhcVM3Wk1sTnZzWmNNcGR1ekh0SDB4ZitoNm1iL0R0bVNKM0hnY1BE?=
 =?utf-8?B?SkFFSjJsSXdTMkRDNTRkbEtCSWo2WE9od0hRajNQOUUzbEkxUWM5djVONW84?=
 =?utf-8?B?SWp6ajU3SlMyUElxOWV6SFkrSEs3RjU0MWdCam01dm43bUo1RzM4K0NrWlBS?=
 =?utf-8?B?KzN0QnlpTldXemVRMmVwQm1qY2RwZndWQXF3WDZjL0x2U2Vnalg2S0tzSHdk?=
 =?utf-8?B?bEw2SUdKZmkwdlBDOExpL1VDZk9rYVY4RTVwNWE1dUs3aVlqQTJYaXZHZDEx?=
 =?utf-8?B?SUNtMTVrZmlsMGhnRzlYbUZNTXpjWHRTemRrWDYxcEVwbXhIbnhwQTRqbGZ5?=
 =?utf-8?B?aldtUnc3ZHJWcHR2R0FxWmRpK05KZ3RpVjhzTWd4Njh6b3FOMG4zb09hTnRu?=
 =?utf-8?B?TlVIS0FRdFB5dk5kWk1OQ1NEU0RRQXRHTWIzTDFqQnAzZTBrNXRJa3YybjNu?=
 =?utf-8?B?OWlFZFZucEVVdlRvTjVUeUpIUEV1ZFNXY3phK1ZXWnF3d0JCZ3pzbmxOTHdZ?=
 =?utf-8?B?YjFMcnZPbWVLNEZqOVZVOGFzN3Yyby9XTHZIS2M1MTc4aDYzMGhqQXVjaXJi?=
 =?utf-8?B?dlpyS1hjSzBDNzZ5UjJWZW5sS2Nick5zOVMrY0VEWnVBNWhXb2xRK213S2I1?=
 =?utf-8?B?SEJFQzhnaUJjNFAyUU52QWtlWVAzYlBKSGxWQTV6MmdyRkVQaUFnaFlqeldv?=
 =?utf-8?B?UFNaOUh6UmJiUC8rNUc5NnNhZHRYRjlUWWNGd2szMmNtVzVlVi9CMUk0a1lk?=
 =?utf-8?B?dXFpcUlNejdibHNnRWw4dzR5MTlUdGwveDBUL2tCbFZ0b3QxS3BNSUZMTjhN?=
 =?utf-8?B?Z3pLME5OdmdwNjEyTGErV2NBZ1J4cVFnVzAzYXE4bHE2MkM4WkVBaVBSdFNW?=
 =?utf-8?B?eC9GSisxT2ZIZGl4RDZmR1VGVUtzNGExcVh3VVg5S1VGVmRzQnBSMDJPdmp3?=
 =?utf-8?B?NVU0SFcxQXUraXlzSU9BemNPZjIxaG1jMXRaZDVKSGFJNUFXeWhsbklxMm5X?=
 =?utf-8?B?TC9OclkvU1IyUlc2OVRINlhHMC93K2sremgrMUg3TlBJS2gzZEZ5OHBvNnZD?=
 =?utf-8?B?UDVaUHdQaDhrckZ1eWZleWlMRlV3dlpqTHprV2Y2RHgzMXBhc3ZWYnEvR1Fz?=
 =?utf-8?B?bHVwVFJqVmVscVdKTDRaZ0xuUXNwUk9nMWh2MWdrT0RjVmcwNDhQcm1YRHFN?=
 =?utf-8?B?S2QyMmE4Zkh5cERnQk9pc005QzRNWFNkSWtWS1REclpSWUJHUTdnVFUrOTJF?=
 =?utf-8?B?V1BqV2Yrczh6Ym9ESTkwOU04QnpBQ1FxT2pSdXUvRFFGQ2RCeW9BUlFaUE5s?=
 =?utf-8?B?R2YxRnBMSVhWYzFWNnRRaklUNjQ4a3M3WlUrQUV3SnBBY1FDTml2dS9aMVdL?=
 =?utf-8?B?TTFSV1VOZjBkbFg4TlRMYjl5cmhEZW1aWkZoVjZpdVRndmFhcHJOLzRQeDRV?=
 =?utf-8?B?bnc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b8f2de9-d2a2-4606-1e37-08dd37130aab
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2025 16:21:48.0498
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JUQ1edIGmqF5capFLyKqysnmTdJBMXMQcMu/vQ+IpPvqQ+oYefWYDoa+j6B91+ColydoJVvStV418OERZ94RQ4n4IJ2Izj1T1dj2DAy4Cqw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8798

Hi Konstantin,

On 1/17/25 5:17 PM, Konstantin Ryabitsev wrote:
> On Fri, Jan 17, 2025 at 04:49:36PM +0100, Quentin Schulz wrote:
>>> What problems are you seeing that makes you want to disable pre-flight checks
>>> for everyone?
>>>
>>
>> We do not have checks nor auto-to-cc commands, so there's no point in
>> telling the user to run b4 prep --auto-to-cc and b4 prep --check before
>> sending the patches as they'll do nothing.
> 
> Okay, I'm more inclined to treat this as a bug, because we shouldn't be
> invoking obviously irrelevant pre-flight checks. I don't advise turning it off
> entirely, because some pre-flight checks (like the dependency checker) are
> still valid in your case.
> 

Indeed, I actually only disable needs-checking or needs-auto-to-cc 
wherever appropriate. It's just that disable-all was shorter to write 
and check if things were happening the way I expected them to :)

> I'll work to better recognize when certain pre-flight checks are irrelevant
> and disable them automatically.
> 

Thanks!

Cheers,
Quentin
