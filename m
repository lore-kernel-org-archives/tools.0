Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FCC413D50A
	for <tools@linux.kernel.org>; Mon,  2 Sep 2024 16:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=10.30.226.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725295889; cv=fail; b=czNUi0yPdRYiq57Rb4BBnIvOpmyjWJTWyetzw6TVqsICpl2jKm3pDhKJpXeLqgvGccZlBIZOz4ymAxMggYOmIqp+EcAkHyGFiA1Ks2LNM/Q70FW9Tl9rngd8BJNSqfIO3yNMfZijsic/3aMExutWGThoIkYtUI61FB5+q/4ZoBU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725295889; c=relaxed/simple;
	bh=q5UdcKAJuG7D9P++vvqqDkJHFtS6dpENh5ZdfsSNSvg=;
	h=Message-ID:Date:To:From:Subject:Cc:Content-Type:MIME-Version; b=KWc3YwWdyt6unjECj4AgRXcFhHN7M0MfOeRNiW67mIP72ZvOISn6ZDWirQSIHPntVbhOgZNhpRsyqiDCfnuKAKvDV2Atj0f1jk51Dsy6Q4nZ+RtpAqeTG8KXDh3w+jlBgq/uX+RvCGyKjBR83Xvr9LcfhqqRfuZdfCVIL0OnHAY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=TmVJs703; arc=fail smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="TmVJs703"
Received: by smtp.kernel.org (Postfix)
	id 00716C4CEC4; Mon,  2 Sep 2024 16:51:29 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013035.outbound.protection.outlook.com [52.101.67.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8185EC4CEC2
	for <tools@kernel.org>; Mon,  2 Sep 2024 16:51:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8185EC4CEC2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=cherry.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d0m1umMpNhXHiDYAvQ1scecnaydpJjs+meE5lWJyIoV06I2QUMYE7NbxdhiOiRhCNgS3+NVSDC01JBP4XY3xLZATn8ybxYR4OdYaZFfbqs0n5cR+MFM9BHjgukELxXchpGvgT3nXhT9LQYGr5zQeOmanv8ib5oRViz6rKnSnTmH4yW2cPuo5TJar/LXx2HRf22RfHNl0Qg+VHGKK7JauaiGjHG2oevNTXDkGQ2zSt04nYWHvkBNCX18gHCB+UQmLfzDbE/TXxVst0qPTIAoqjvOAf3GGEunjcbBMktOjVtWbCViE+1fnweE6kKa1dp4Y5v5q3gkOiiSG4TZk8b3ZsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5iU66szw2Ui75G0O4htvum3mTtgWZg+SFX1bWBR31Cw=;
 b=uGtbaG1dgB4+38G8bq0Ems4Vw1Emn/poqE2gbQ5scEzZCnTLJejVaXIUC6GVrKmKpnQmokTWQbuDNOr7geBG2Bd2XrJoDM6VkmHV6rg+OMFgkiNyVhBxbseG26MH4dFsS2CSv8t+SdyaFD4ZYfp3lwzguip2xXl4o5UBrd0bF2q/z2XLte9gQlQraYC9oi/ctTopvTZDEqYnrkAuKtfJ+Jyp5I753M7BT8S8IZU4tWQBZGx73SqlmZzr6s6tb+VfsOCXNzncRJ9dQpdzetxSDsOxg5838C5U+qj4X7RNsof3wuF0B2WySQs7R7CmtBAPlfpOTj3bRE6NomD9HiNYGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5iU66szw2Ui75G0O4htvum3mTtgWZg+SFX1bWBR31Cw=;
 b=TmVJs703C+jIDw+VjwFZG9EU3wHrTvY78b1m6+RsyUWpgG2cl+TBT6CNtyzh+bIZhvK/ZRTuhHODJvc+bMaBtvGsQ/OedCKYkqhvuODRquJ67SHPtO8mFg87M1DCg1jIE98uY+667X3eK687Y1wKyp+gphwEblhIFgcXkDSGkng=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AM8PR04MB7985.eurprd04.prod.outlook.com (2603:10a6:20b:234::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Mon, 2 Sep
 2024 16:51:24 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%5]) with mapi id 15.20.7918.024; Mon, 2 Sep 2024
 16:51:24 +0000
Message-ID: <4bc5dee0-ed3a-442c-a9ee-d48050627576@cherry.de>
Date: Mon, 2 Sep 2024 18:51:22 +0200
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "Kernel.org Tools" <tools@kernel.org>
From: Quentin Schulz <quentin.schulz@cherry.de>
Subject: [b4] add notes to patch for commit with git-notes?
Cc: Farouk Bouabid <farouk.bouabid@cherry.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0314.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:85::15) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AM8PR04MB7985:EE_
X-MS-Office365-Filtering-Correlation-Id: d8b57ee4-c345-4bde-f5f7-08dccb6f7acf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UXcxVXhLUDFhaGRzSmhDSXdhT3dpMFhPQ0IyckxXZE85TG9zWFNMblhnYyto?=
 =?utf-8?B?WnZyazdLSlNyY2FaRUlnZUdXQmFab0xCWlJvS2NpZzBZY0d1TVlHTGNXR2ZU?=
 =?utf-8?B?MXZJNjk4SmxqaWhpY1oyaVdjNTl4TVlRczg5L1dEMnIvUUpRclM1eVNUei80?=
 =?utf-8?B?dzc1czdQM3Iwd1pDODJwYmdGMUxUcC9vVGYyaEk4UnBLajc0UHJTVzRZQmE0?=
 =?utf-8?B?UUlSRkROVGhzMmlpbkJRbS9TaFhFbHdHeXdVK1pQSXVIRkxuY2hDT0JkVkhs?=
 =?utf-8?B?cXN3V2NhdGxFbjF6UThUNzV6bERJRUxWTjQ5c2hIbWRScUZwTmdSemovMEdQ?=
 =?utf-8?B?N3pPZ0ZFWENmbmMxcStibk1nVWJxTU0vOVYxK0I2bS9ta0FvbGt6ZkdHKzEv?=
 =?utf-8?B?VEFPQ0cvenBDb0RQS0s2ei9ZY3ZOQk9MenNMdHZpNGxwT1V5TWYwMWh1N05w?=
 =?utf-8?B?SXFyQmNJRzh1OWpKNTk1cGpGS0lqZ255ODRXWXRYRFBGZVQ5ZmlvT1VzUTBW?=
 =?utf-8?B?WkpNZjlaSlFUakFvMitjcjl6d1lNYU9iak9tZ1IxQ010N2lKdkVjQ0sxK1VN?=
 =?utf-8?B?ME9GVU4wSExIZ3M5cGRuak9UZ01rd0hVcEVnWnRXUzdaOHNUaWRrZXBqWFFo?=
 =?utf-8?B?RmFtWlJvM2hJV1lHTkU1UGtRSXVJUW0zblpNeURPR1djamlQNXk2VWhUOWRn?=
 =?utf-8?B?MEdpVkpJUjBjelVrY3F0dkhMWGhnM3IxWW90NDA0WW1JTVdyK0hpUzhxaHNt?=
 =?utf-8?B?OGZ0eG13b1AzNThVMFVVOXkrK3NkRWtQTGpLS3VkeEJJTDhWckg5Y3hTeENY?=
 =?utf-8?B?dGMyekRUNndCdEJRanFHSlN1OUFYV2JGcG9NaXdtK2h3VWp2ajNXbFJ4U2N3?=
 =?utf-8?B?UXZ3SmRxeTVoK28rOGU4S3A2V1Mzbk5lY2VJMmdNaXcxQVE5YVpkSU1LTUg5?=
 =?utf-8?B?NTNYbE9yRWp0NjdoRUIwTDhydjNuaGMrQmw1RjFoc3FBUDlsKys0UHl0V0dL?=
 =?utf-8?B?dHFTZ1JFZ3lUVWlRYWF4UE1vbmIwVUovQSs3UEVuV01hTXA1aFpiUmorcXR0?=
 =?utf-8?B?YXg4M3BQY001bk5BR0RYTzFVTDZXTWsrZFFjcWdMTlNDa3hmOVdXdUVBci9l?=
 =?utf-8?B?UEtURzBlRnRpS3ZYbmI4QmZVSXFsbVlLQ04rTkJkaHMyUXN2alZwbitLNUFo?=
 =?utf-8?B?RUpXdmdhR3IzeFZreCt0Mm1oSTY1K1FMeHM4SGtvMmhxalNVWDUvNWd2T3pr?=
 =?utf-8?B?QjVHUW1vV0hhZ3lVTVNsMFFnUTkwUkoweFNJOGdueFVQbW1hWVZUdjcxZ0pR?=
 =?utf-8?B?b09aeXc3T09zb1FZYVF6dE13cm9RSVlyNG1mWkxCc0xRdWRSM2FVbXUyR3Mr?=
 =?utf-8?B?U29SVzZUaVhuQzVoUllTUFNtNUVWcFJ1ZG9FUFJoMDFGZ2V4RkJsZmh1d2h0?=
 =?utf-8?B?dm1JYzFHcGdBU3dtQXZ3aldOeFRNUHBPWTdDVFBvMTZJZUhpYTUvRzN6cG5F?=
 =?utf-8?B?UEtJdmw3QUt4UzlLUFppdFVJdmdUQkdNb3diUXI2ekl6bDB0WjkrandMQzVD?=
 =?utf-8?B?YnE5UG8wMWdoUDkraTZ2WXBRQ05oRkxsc3BJV1FRWG9zVUNJUFpYeTduVUY5?=
 =?utf-8?B?QzV5bEhaM3dZSGd6OE4yUjBUK2dYekVxaWlXeFNmbmQwR0dKc1p1bExiOTF0?=
 =?utf-8?B?dXpJWlR5eVpGU1BHZnNwVnFwZVYzVDlSMU8rb1lqZllnRFZaRXBrTVFOUzRL?=
 =?utf-8?Q?OnVK5eDyo/bv7Aqqew=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Um9GeUFNS0FrdCtWREo0MjVwVi8ydGdsaWo2RmwxSVlyTVlwN0VqSjJ0VDJH?=
 =?utf-8?B?V0xpbFYyOTE5RHF5SWpMRkk4SmkvY092dFFSa2NzSWhOZ1FlUGdXaytDRUsx?=
 =?utf-8?B?UkczL3ZYZUltajlkb3pCb2F6UjI1eFkrRkNrYXF1Nkp3RllmUmhuY3BiTXRC?=
 =?utf-8?B?bDBjQTdQckc3MFBEcXloaEZVZy82Tm1zcitxN0RjS0VZektKMTY2dTlsYmFa?=
 =?utf-8?B?OVNkNXFRaU9RYllKaU5SY3VPVEVOTGtqSm00QlUvZWNxZjE1TEh3akppQVNl?=
 =?utf-8?B?NnBYWXFkVHNuM0JRZnA2UzYwbTBJOVd4aktlOTBoZ2Y4cEo2NjlZdkI2ZzBN?=
 =?utf-8?B?WjRTRUNTWGdmbU5LNTVSbWtTOWlHN3hLZWtKWmVTd0MrYnl1Z1hkcmhoSHoz?=
 =?utf-8?B?WWRqMUIrMkZrNGZybEZZc21EKzE1SUlGczJFLzNjTWY1R20zeTVtczZ2bUhl?=
 =?utf-8?B?VnNqMThoZ0FFWmN1VlJ1djZoMmRQWDBlRFkyQWVTTzBlL2VodTZYajVzd0xX?=
 =?utf-8?B?a2ROK1FqUlVtVHZnN0lWdWZyckVmUG1JTk1zRlpHNFUvMUNRcGc1WEpoYjZP?=
 =?utf-8?B?T3NGUWJKWGpiRkVqRmJ4TDgxRWNYMzBsei8vTkNhdW1SaVNtM2puUkN3Z09K?=
 =?utf-8?B?akE4Rmw5NW9kNDZFK0h2VW1XeXNLcVN3dVhYUEVYeWh6V1BXbzRTWTdGN1lU?=
 =?utf-8?B?L3pCZUNUYVNFWVlpZVBpZUI0WTU5UFNhV1pjbENRVy80dDJ5aFp2V3ROWUFQ?=
 =?utf-8?B?d0ZsbG5xdHQvMlBxN0NMYkVNbmRQdlRwRzRMeUwxcWRIVWdramFsbWY1QU1Q?=
 =?utf-8?B?M05MVHhIVWhTdjhtcjIzZkQyelRZZWdOd2R3a3VVUW9oanlsbS9HbEtTZldL?=
 =?utf-8?B?dys1VmhNb1NMbmpDNVBuS1dpc2xDTW82b2NmbmJLcmZLY0dCcy94UlJXeXNM?=
 =?utf-8?B?WFlGNVgxVlF1NUcvQkhBQTZPUmdxcjhxcUJaK3FYYzM5RWFuWFdZNE82NUUz?=
 =?utf-8?B?bEZlc2dsczNLRG9QUlRnUXhrMTB0QWdjU2hEWEU5d1dBUllYUyt0TXUwQ3Uz?=
 =?utf-8?B?c2JaR0ZpRFFKK1BjUnBzMTYxRjRISWRleWs1YWcvdEZVc1VuUXU3MjRJVi9J?=
 =?utf-8?B?TmpGWUJRUEJGVmN3a2J3VXhpN2JwMk5weUVBdkRONk1RNXB0RGR3NXJhSlVi?=
 =?utf-8?B?Nmc0QUdhcjNsaXJLcDdjMjNaTEwxYkNQN1N1OUMxVGpWTktVV3JGOVJwREl4?=
 =?utf-8?B?cSsvRVJ5Wkd3NlAzeWJMOUFJSTZ1R0l6bjU4RVJpR2I3UnRuUUNvWE9KZzZs?=
 =?utf-8?B?OFVrQ0xXM3VBbmpTZXU4VzRxSTBOUkpaVjg5MGhSRmZKaFl4K0Zla3VlVWNH?=
 =?utf-8?B?NFlqekg4N3ZTTzNpQ2p1dEJxdDJHTUl6SVRRNHJjeFI5WW9CclJ2NS9OeE1C?=
 =?utf-8?B?dEdhbjIrNDk3L041bDhyclVlVHhlTEV0ZlBsMDFlcDE5dnVGZE41UVRIWkFv?=
 =?utf-8?B?cGN0ZjhyUk1FQVpBUDhRUXJqS09ocnlodHVSTFdmVU1ZUG9zNmoxV29LTTg1?=
 =?utf-8?B?WTRNWGI3NUpISGpNNnJTdFNacGNlMkZBa3ZrNU5oeXdJOVlyRVdndVFBeHVr?=
 =?utf-8?B?ejJIUW5lMGlSbGNNck1ackduNDdCaWxxK1FtTVNvZTZ4MytmYzZYVUxJTUNz?=
 =?utf-8?B?TGlqNzNGc1JFQ1V6bWd6VXdMSytIS0hmSkpUaUNkdzZqMlJzVnNaVnF5SmZq?=
 =?utf-8?B?MkRzSnhvVVlOK2w4Qm5Tb1ZReDlQbUhUREZ4dTB5bHZ5ZU4wTEpDOW84N1N4?=
 =?utf-8?B?eXI0YWc5YTdQb2xsODFYWjk1L1BRR1RaaU9CYXplb0E2ZzkrUnQ4RHc4a3do?=
 =?utf-8?B?WGhEZktWdmhkTVVRWWdSOFp3MUs3N3NLVDYvRXk4SkRITTlQZHFUd1Jackx3?=
 =?utf-8?B?WUovZHRaNWQ4SzhldjFiajJtZ2JhSTQrWkJHWnA2QnUreFYzMEJEZTV1c0NW?=
 =?utf-8?B?OG1kQXR5TFk1MStpUkdCaDkzNmwzVWlQSDZ5VE5GaFBaWEREdkJXdjdGRjZ3?=
 =?utf-8?B?VmZteUk0cnZxRjBIZndGT3Y2TXU3M0JzaTNDTm5oQTBML0xuQll1cmNTd25R?=
 =?utf-8?B?NFNQd3YzMTFva3I0Ymk5V3FSdnpBbUlNSWVLOVZNbTJTZUg2T0JteC9yTVUr?=
 =?utf-8?B?bGc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: d8b57ee4-c345-4bde-f5f7-08dccb6f7acf
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2024 16:51:24.3023
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lgUrcue6TtH14qg1mcJDPR+dYytO+46lcgsccWfw6cm6kR3ya1/xP7cbQhIsL1R7tnQBm/Rly11OvOXCgjYhj+3rJKgBovrZ5oXxfQdj8oo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7985

Hi all,

https://www.kernel.org/doc/html/latest/process/submitting-patches.html#separate-your-changes 
says that

 > If one patch depends on another patch in order for a change to be 
complete, that is OK. Simply note “this patch depends on patch X” in 
your patch description.

We forgot to add this note (we weren't aware of the rule at the time) 
and made some people unhappy due to some partial merges (one part going 
through one tree, its dependency in the same patch series still in review).

I asked some maintainer whether we should have this note in the cover 
letter or in the patch and the answer was "ideally both". I know how to 
do the former with b4, but not the latter. I would like to avoid having 
to use multiple tools to do the same job.

I think it should be possible to use git-notes for the latter?

We did a quick test and it seems it works (with a diff I'm pasting later 
in this mail), c.f. 
https://lore.kernel.org/linux-rockchip/20240902-dev-mule-i2c-mux-v7-3-bf7b8f5385ed@cherry.de/

For that we had to set notes.rewrite.rebase config to true so that b4 
prep --edit-cover wouldn't "erase" the notes (and same with 
notes.rewrite.amend just in case one does git commit --amend or reword 
with git rebase).

The diff we had for b4 to make this work is the following:

"""
diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index ec230e7..72621b8 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -3424,7 +3424,7 @@ def git_range_to_patches(gitdir: Optional[str], 
start: str, end: str,
          if commit in ignore_commits:
              logger.debug('Ignoring commit %s', commit)
              continue
-        ecode, out = git_run_command(gitdir, ['show', '--format=email', 
'--patch-with-stat', '--encoding=utf-8',
+        ecode, out = git_run_command(gitdir, ['show', '--format=email', 
'--patch-with-stat', '--encoding=utf-8', '--notes',
                                                commit], decode=False)
          if ecode > 0:
              raise RuntimeError(f'Could not get a patch out of {commit}')

"""

Now I'm wondering if we should have this always on or not, also if/how 
we should document that one needs to have notes.rewrite.rebase/amend set 
for this to work. Should we also add a knob to NOT add the notes (e.g. 
someone wants to keep notes for their use but only locally and not send 
those).

Let me know if git-notes would be fine and the direction to go for 
patches. Thanks!

Cheers,
Quentin
