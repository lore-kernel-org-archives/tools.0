Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413EC2ED167
	for <tools@linux.kernel.org>; Fri, 11 Jul 2025 15:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=10.30.226.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752248658; cv=fail; b=IaagGMFozIQj2SgltBSfoNBudJ0gPDTISQQrKEZOK9QKnk5MjOOmoh77Y6L1jQYKnw42xoxQ60ssaRnVEr4QNVgHGKWXowP+wX0WBe9lJy+f5C4yN/tyaDBiN8xjtgUNUMEcuxFNazrOg/1WPXoXa4dxZAzid00ZV7tQ5Hskrr0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752248658; c=relaxed/simple;
	bh=z7uKJ0XRMdnjKcZarTp4VXB8QH+3ZfFegpV5CMydz+o=;
	h=Content-Type:From:To:Subject:Date:Message-ID:MIME-Version; b=U8XesAXIBs5vGBmCHzRDxo2Ct9oIJwoO0uVOUaDxvRiCDB7SL3dbLW5OX/4W5z7obWFerYwF3mbmiaP53NK+aaUuiS08Mior4WbSFDQcg886TQ6Db5ReL0i5Mu8w5IC8IAL2ZHBJRYRuIrPkEYjIMsZvSVqJrZSIM9sKD3uNp2Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; arc=fail smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id DB0F4C4CEF6; Fri, 11 Jul 2025 15:44:17 +0000 (UTC)
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazon11020107.outbound.protection.outlook.com [52.101.227.107])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 86F9AC4CEED
	for <tools@kernel.org>; Fri, 11 Jul 2025 15:44:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 86F9AC4CEED
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=dataprosperonline.solutions
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=dataprosperonline.solutions
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fZw8llxyA/BZeayk8Asi6uzMjvAU0KaMcmJsBlfdsNZ4MUlrVKjddrHkHxHKBucQLsGbxmUC8Mcy6kll+X87WPVRMuewtdNV2woqw3BJCk6YCqUbDve6QkSUgGmwQk0nY8HLPprF3c/9MBeloo9V+rZksACt+slxqZ09bK+cs77SDQ5VHpSpStHgNV5cdpt1L0S2cya3tV1xL9odYMqmUS3aX5eW2357ctxxRo5jFBbFyw/SLBEzWeTY76Fh8dRcIosheGfdtHd3pMuuWXYF5g4+8XNJ0C2a1mLtT24OGpqV61ugw3eBHHh+4X+bBoQU3R2sCvwi2It9Ah2megpvKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z7uKJ0XRMdnjKcZarTp4VXB8QH+3ZfFegpV5CMydz+o=;
 b=US5TxwkFoY4QDy3BPKk/wnNpNk/kiHA5KlfkPjLwId09wK+RcqMlsPZUIuf7KnNpS40cMkupg8DaLbuzE7QsumELKMZNc0d5Gw82IUUkFQMTrsHBR3nJw+nIsDTGatJvkIULmdknwE3EFKRnlPET25vJesO+WSxLOMNTsBppNTfMWsdGxCNdJH5BUsuF9nbv9tvbnh6YLm8k68O4o6QYKqvLtjHMilZpaxqYGZWX4BjyxlZLLnCCkiFTfAlFiX+QI8Q8kctfouxS59WexL+R0MMKcaah9q8Qr6dXGFR1vkZSntWqLFq2d0ONyqA2T20PlJ8TQ6pnJKDxyma16DGnhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dataprosperonline.solutions; dmarc=pass action=none
 header.from=dataprosperonline.solutions; dkim=pass
 header.d=dataprosperonline.solutions; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=dataprosperonline.solutions;
Received: from PN3PPF99651108F.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::c2)
 by PN2P287MB1001.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:155::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.25; Fri, 11 Jul
 2025 15:44:11 +0000
Received: from PN3PPF99651108F.INDP287.PROD.OUTLOOK.COM
 ([fe80::7e31:3fb4:9766:6b11]) by PN3PPF99651108F.INDP287.PROD.OUTLOOK.COM
 ([fe80::7e31:3fb4:9766:6b11%7]) with mapi id 15.20.8922.023; Fri, 11 Jul 2025
 15:44:11 +0000
Content-Type: multipart/mixed; boundary="===============5812381585835452235=="
From: Rupert Aldridge <rupert.aldridge@dataprosperonline.solutions>
To: tools@kernel.org
Subject: LIBRAMONT - Agriculture/Forestry 2025
Date: Fri, 11 Jul 2025 15:44:11 +0000
X-ClientProxiedBy: FR4P281CA0069.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::9) To PN3PPF99651108F.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c04:1::c2)
Message-ID:
 <PN3PPF99651108F418F4C845E771126CF13F64BA@PN3PPF99651108F.INDP287.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PPF99651108F:EE_|PN2P287MB1001:EE_
X-MS-Office365-Filtering-Correlation-Id: ee5e9891-2acb-4b41-f7cc-08ddc091c80e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|4022899009|366016|10070799003|376014|52116014|8096899003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OUhSZW9YYlN0aUd1ZXRKTlYxandHWGZLNEtBOWJqR2JVbmM1RXFFZ2kwa09j?=
 =?utf-8?B?MmVOZUFmcmVXVmJWT1lITGdkRm9aNkl2dDhDci9lRTFmd1VDQWlKNjl2N09G?=
 =?utf-8?B?THJLMTkzVXpaS0NWUTFPTUZlWHNrOVd6TnFCTXFBU0N6T0pVck1LSHppcWJl?=
 =?utf-8?B?c1pyUXpLbUhVK3lQVW1JK0Z4eWlISmhvSFVTTTY4SDJhbjRrbzVVSTRHMHVC?=
 =?utf-8?B?dEJOc1Bud2NIRTZkNDBYc0xhRU83MkgzQXdnSTF1YU54dWpUYWFFOFNsNVpx?=
 =?utf-8?B?VmNyTHhSZ0VvbDlHRkZCc3QzS1FuTnBrMEFSZGcrR01hQlRoc0UzL2R4ZDJO?=
 =?utf-8?B?T3JveEIzbWtIeGVzMVREaENQMkNwbHBNeXI0RjZ5OXI2STcyUWdDYW1Gb3Fj?=
 =?utf-8?B?RnVZNFdKZWZxRXhqZDFIbGpjRGtLSjhoOHo3WkNjU3daejBvOTlKcUptR3pk?=
 =?utf-8?B?UEJFRGFLa1Ryc3E5cmZFQkhPRWFCZ2hCblA0RWFZOEREdHZzSE9zc2Nha0Rp?=
 =?utf-8?B?RzFNK0oyU0lSUFpzQ1E1elpXMmZMMUtYOEhqRURvNnRycnYzZGo1djV0azBX?=
 =?utf-8?B?SkxOeHg4RytTRDdzREx3RWN4THNtWnBqa2Yxc2xSNnVQSFhRUjF6Zk1heGxv?=
 =?utf-8?B?TzBoYWZZSWVaOGVBL2tYZmhlZ3B5WTRTU1dCYjlieTU5cjNJK0RaMWg5Ylk1?=
 =?utf-8?B?MzJJeld6aUI2SDUzUkhZQmZDbEx2eXk4VWhrTm9YVWR5Z1BqU2ZzMmJDZTlE?=
 =?utf-8?B?ams0bkc2MzJxTWJ0eHREMTNQTmFIdWE4QmgyaW9CM09TNEJZeGhrUVBKNXUz?=
 =?utf-8?B?SFIxMHVNZS9TYUthcWlwTG5tNmFOZi9tQmZwVXlaQ2U3Z1hCQjM2bFhqTHNs?=
 =?utf-8?B?aGRwY0JuaWZldnFFWUJ5dDlqOHJiMWpEY1hseFJTVXNndHVEVk94VitSRmpT?=
 =?utf-8?B?Mjd0SzRFbVZVRXY1UjhYOWhjcmtCWDFodmxZTGhtWnhBSi80NkF6Rzd6c1RU?=
 =?utf-8?B?UDBJV2lrMndYTlhwN0xOeml1dWU0WW1maUZEbmxJWDlHT0lWY2pNcGlzMG5I?=
 =?utf-8?B?eFNldEcvWkx2MWFrVUxDSzBUdEZMUGNscDRIZnpIT2p1d2NzRHlZYmRNTTJq?=
 =?utf-8?B?eFp3cTVnWkhzb1o2WStYNVZpOXBRR1IzSkEwUWlMMFRIUm1Eak1JM3grOUVm?=
 =?utf-8?B?ZW5IYlhzY1cwdkU0R1dMVWpiM29uQ0x4cmY1K2dWcldkU3B5MUhBeTNTdmc0?=
 =?utf-8?B?NjB5d2FreTkybW8rRU1RajFQckpIN1lINXgxMUgyRkZ4dk83MXN6WTN6NHVs?=
 =?utf-8?B?dnN0dXhNMk4zbmFVZVlCY1lLQ1dsQ2ExNmFxYmdESDZ5aDQzVjRKZXJCVW8z?=
 =?utf-8?B?YkdxSkJpMk0renk0dTcxZWVueWlSQ1g5elF0eWNrc2RkZ3BJNWpFSWE5VXpI?=
 =?utf-8?B?YzhSNi9MYk5yRUwyK1VpTTZVQVhuMkFSdi9YbGRMNm5QK2VDYXlIMXVIS2Fl?=
 =?utf-8?B?SmpJNzVrUjBJNFVlTGpmOUd1NjdHcXo4Qjg3MkY1UUZ6UG5aVElhbUlERm1R?=
 =?utf-8?B?a1BIZUhrVE8vRlZWRDNJU2dnaytyT2dtUGlRaWJYNjkyRmdLSDliZmg0RWdC?=
 =?utf-8?B?UWJJWGdGVjNvbFVIT2VwMnVVSUYrMktYQ1JvaStjLzlVWUJlL0NjWnUzYmU5?=
 =?utf-8?B?aHduUmNOL21Gd1dUaUduMzRsaFdKZ3R3dWxvM3dwa2IxY3lLWUNmcEhMbjJQ?=
 =?utf-8?B?SUpXaDRPdjZ0Wmxpa2piWS9yN3RicThobEFQTHFDc3ZGampNYklBWkZtd1JM?=
 =?utf-8?B?UE1SMmlkYjNwNzVhazYzRnBON3NSanVpaEl3N2E2eTk5eS9sMVh4UWhBWVpN?=
 =?utf-8?B?ODYxNUJTWVZIQ0N6QkVCZ1NxL2srd1RCTGhHOElJT1Q1MGc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PPF99651108F.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(4022899009)(366016)(10070799003)(376014)(52116014)(8096899003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SllnR3pVUDZaZGUxTng1am1KTWRHb0VYQTdNRHBqZlg3SDV0Z3NuNXlBbWp6?=
 =?utf-8?B?Y3hUb1lWR3hEMHZvaUZUU3NaQkh2UWM5MDk4Zi9RWDBxcVU2SVJONFFXRHpo?=
 =?utf-8?B?UnVzMmdEZUtFNnd0NVFsREtXNjFPWW53c1RweHdseGl5ZzUraThTTkxLeE5q?=
 =?utf-8?B?NUltaS9sMHVvclJjYzZucDdRZENYSkpZKzJ3T05aM05icjMvUDgrWkdRbjZw?=
 =?utf-8?B?RE9obGJ2d2krVjYvS1RGNHl4Qnl5S0syRmNvRFdUamZRWVFhbXVWdlNsZ0la?=
 =?utf-8?B?NnlhUFRhdVJyRi81djIwVHB2TlpoRU5WTjVjcEFMa0ErRHloQWVscGEyQVB2?=
 =?utf-8?B?Sk40TmVqeURvazhBL3dxbERRMVBjc2RtOURpTkRSejJYRGcwQVJTYXpPNzY4?=
 =?utf-8?B?Yy9CVzJxN1IzZU9NTURoQkdvMHNYRmd4ZWRLOGZkN2VldjNUZkpMV29wWWxK?=
 =?utf-8?B?UEVuei9xVS9Lb3FQYm90UDVaMWpPallxK1FoRHNPdk0vNDZFQ0NXOUt1QXlV?=
 =?utf-8?B?SE5PUlNYcjBVNnIxMVBkZ3BVVjN2cmFsamF6MkFWaW11eFdYZi90bmZZRGdY?=
 =?utf-8?B?QjVFNGFhamtlS1RiM0R5RkNVWWdaNit5bVZlRkR2WndFUkZ5eGhaZmZnZXhB?=
 =?utf-8?B?cjNQekQ4RU14Z05LRGVxZHRxNUZQblpJNDRyd1RHczZxcCtCaVlocU14d0c3?=
 =?utf-8?B?RUhuVC9oalM4aDl4bWUyMmRNLytyc295eXdxOHVvWHZHWU9JMWZnM1FsMTZy?=
 =?utf-8?B?WkhsWXNPdU1mSDRPRWRZVmpGeEtibGlUeWlIdHA5OXl4RXVTUW5JeUdReVZK?=
 =?utf-8?B?Z0JhQXYrL3FEZjBsZ0gzUUJHVWEwbFhHUjJkU2poRW5HUzRpN09yRjFyVFFQ?=
 =?utf-8?B?TjhwNUpXSDJVeFdQT3M2bFR5Qjhzd3ZZaGRMbzhiaXFTYmVub1VEdEtUeFAx?=
 =?utf-8?B?amx2M1hnS1c5YS8zTXNFTmROUTQzOVJMQkpCSTEySjVMTFR6d1AvWDZOaVF0?=
 =?utf-8?B?RTZLRHNaL0VCOXZtM254dW43dTUreVJKYzRleGNpbHRYRVdzditTN2FkU2VP?=
 =?utf-8?B?ZW1vYWpYVmFucXYreTROdDV5dGQxOUhub3NJOHBrTjloRW5VWnRVdGtRVnNZ?=
 =?utf-8?B?Y3NKOG5lakxyR2h2SjJqZUsxWWZQcTIvY1hHUWc0QnVMUlg2NGJWaTlrdS81?=
 =?utf-8?B?T0c2d3BNbHBBbUpPcEtjVjBST0J5VnBPL0lTY0w3Y1hRbmZiOFV0MHgySzhq?=
 =?utf-8?B?ZzNaT05ZN0JhMmdHSVJiMGo2SGdvRzFMdHNGSU5raHdKVTNWUlJqam9hQTZP?=
 =?utf-8?B?SXh1TEZUTStZSkJGbkgwQmNQM24wdjUxZmJlbFBHakpEbG5jNW5LQjlnYkxO?=
 =?utf-8?B?UmdYZTJoL0Z3RFRlblNxVGNVQzNUalV5WS80QkZaYldyYTF4TS9MOEFOSUE5?=
 =?utf-8?B?T0phZ2x1THN5c3hLbm5rRWhKRUh3VFY1VmVPNXlNYUtnRG5zekJKTjFJRVpa?=
 =?utf-8?B?YmhuT2Z6NDcrV09PSi9QRW9OV3h0Z21JcE1LRDFOd2tVbCtVR2prYnFHNGF4?=
 =?utf-8?B?LzVUWGllTEo1d1pXdG5YK0lIM0N5ek1mcXVnUFNLY1A3YUg5aUU4SGxnVzI2?=
 =?utf-8?B?TXVVM01pTDIzbUZWTWsxSHhMRkNZRFFsNlRCckF2QXA3azJZOEU5dXJkbUJm?=
 =?utf-8?B?QTd3NmFlYXlTYUlTRlA2WmpHVmJ3U3AvbWExNTVmeXZqTWV5L3MydFNKbEpP?=
 =?utf-8?B?MnlDOCtPQUJkejViNHkvZUxNc2NLL3NkbDl1TlNpZitYNGZvNzM4VDdGcDJl?=
 =?utf-8?B?WnJWYjNvaFVRUnpOaEx5b1dzK2NvWFZtWS9sV29iTFFZRlF1eXJSYnVLOVVp?=
 =?utf-8?B?MDdHMmUyT2ZvU2VadnRrWWtVMWdYZ1pneStjZGRtQTczZVcyTlg1UXU3RDQx?=
 =?utf-8?B?clNRaG1taktVYzJEL2VDMUltN2FtbDFPVGdKakEwWkh1cVlhYjJVNEFHRm9Z?=
 =?utf-8?B?a0NLcUVoUHlQaVcxWXhxdWZUQ0Q2OWFnUk5ObytSWkF5UDA5MCt2RFlwZHVu?=
 =?utf-8?B?M2dKUWljYk5lSFZoV1hiM2tkKzF2WittOXVQbHNxKzBHWnFRK3BTMWVFTGFP?=
 =?utf-8?B?M0UrWVpsS1hXMXVyaHdIL3ArcHBLNjhuY3IvWEtLYXhZbnA1WkdBUWFCNWky?=
 =?utf-8?B?OHpyTzdGdlg2bjdheWJqZWM1akNwNXl5RzVrL3BxcWlIdFcwNXI5YU5PaUpU?=
 =?utf-8?B?MzlGVWhhcStaRmhNY29uUXNQNW5nPT0=?=
X-OriginatorOrg: dataprosperonline.solutions
X-MS-Exchange-CrossTenant-Network-Message-Id: ee5e9891-2acb-4b41-f7cc-08ddc091c80e
X-MS-Exchange-CrossTenant-AuthSource: PN3PPF99651108F.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 15:44:11.6191
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 40a21e4e-2dff-41ba-be2c-6a07eb896998
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gyBzPgmi0IdTN49CufgiXXJgIvho85fYoq0OcDXGKqvbaWckKT7f3AkLfNa+CGCfS2HpY7diiUpXKxi8tNaJXmwDMs28/TvWCTTCYHipbwuOljeEppnWX08QoTdeG5CAbD2gTBb1/AQ0RFx4+VvoyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB1001

--===============5812381585835452235==
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PG1ldGEgaHR0cC1lcXVpdj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJz
ZXQ9dXRmLTgiPkhpLDxicj48YnI+SnVzdCBmb2xsb3dpbmcgdXAgdG8gc2VlIGlmIHlvdSBtaWdo
dCBiZSBpbnRlcmVzdGVkIGluIGxlYXJuaW5nIG1vcmUgYWJvdXQgdGhlIG9wdC1pbiBjb250YWN0
IGRhdGEgYXZhaWxhYmxlIGZvciB0aGUgTElCUkFNT05UIC0gQWdyaWN1bHR1cmUvRm9yZXN0cnkg
MjAyNS48YnI+PGJyPklmIHNvLCBJ4oCZZCBiZSBoYXBweSB0byBwcm92aWRlIG1vcmUgZGV0YWls
cyBhYm91dCB0aGUgdHlwZXMgYW5kIFF1YW50aXR5IG9mIENvbnRhY3RzIGF2YWlsYWJsZSwgYWxv
bmcgd2l0aCBQcmljaW5nIEluZm9ybWF0aW9uLjxicj48YnI+RWFjaCBjb250YWN0IHJlY29yZCBp
bmNsdWRlczpCdXNpbmVzcyBOYW1lLCBDb250YWN0IE5hbWUsIEpvYiBUaXRsZSwgRW1haWwgQWRk
cmVzcywgUGhvbmUgTnVtYmVyLCBXZWIgQWRkcmVzcywgTWFpbGluZyBBZGRyZXNzL1BoeXNpY2Fs
IEFkZHJlc3MsIENvdW50cnksIENpdHksIFN0YXRlICZhbXA7IFppcCBDb2RlLjxicj48YnI+Tk9U
RTogQWxsIGRhdGEgaXMgZnVsbHkgb3B0LWluIGFuZCBjb21wbGlhbnQgd2l0aCBQcml2YWN5IFJl
Z3VsYXRpb25zLjxicj48YnI+UGxlYXNlIGxldCBtZSBrbm93IGlmIHlvdSdkIGxpa2UgbW9yZSBp
bmZvcm1hdGlvbiBvciBoYXZlIGFueSBzcGVjaWZpYyByZXF1aXJlbWVudHMuPGJyPjxicj5CZXN0
IHJlZ2FyZHMsPGJyPlJ1cGVydCBBbGRyaWRnZTxicj5NYXJrZXRpbmcgTWFuYWdlcjxicj48YnI+
VW5zdWJzY3JpYmUgfCBSZWNvbmZpcm0=

--===============5812381585835452235==--
