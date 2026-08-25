Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11C5377ABF
	for <tools@linux.kernel.org>; Tue, 25 Aug 2026 18:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=100.103.45.18
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787682946; cv=fail; b=sot2uGPOq8AiIFw02MQ7MIufpyeSXe6jjgpHcaOfdoLNUf3alcKtRrDatjxozmGQiuv6jsBrdc5RKs6f7LQ+tdDTNeQF9F9KcsBwAhZ9+1rDR0lSexKoC1Vtq24+a+q4AHfJ6RW2KiwGbf62QWlBFqg2ZN7Qd4z+jyRomIlKdUs=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787682946; c=relaxed/simple;
	bh=H4pL9YBZvtmCk2T8G+qtI1TfuKB34Xl1ToDKKIp5+wg=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=e4+2zBlNE1pMhkKg3dx7kQh7H7Hw2YyEy+Wtc9kiavd3qP19f8aQyHOrzDDzIXeeQcncct0cA/9eqGAT4C+JvxUd+vPqfxdGvOH7VKZBMxitVv/eUN3qdnF1Ge+KDttwamYM2QPYfgYNj9ioh5bDC+3K0IMwENETCZ85Mo07rFU=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=EWO1jfhK; arc=fail smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="EWO1jfhK"
Received: by smtp.kernel.org (Postfix)
	id E24AE1F00A3E; Tue, 25 Aug 2026 18:35:44 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.5
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1787682944;
	b=tuiLYGxx+W6ER+SnZSusM+8pLUh1pkqEVWCeIkaTiZLyzOKeFU16/YJQ62G4DmCj7o6q
	 xDbTTZaBs6yDiA1Q/yeZmSuP7gmef240dNdOEvuifrRuEEy1uuEePFE+0vDj1/ZS7bFY/
	 Qtv7oFxlUJiQiF41kJyYE+82cTMeoqHBUjuQrPduISiiUe2lCIOyB5SJ5mhJMhKavUsyE
	 OGGfCEArm79iiOgnw2AYskkn8XVvXrXnspsPFPvmYI3qU5cxoRIw3uJTwR24kB7G94C66
	 i2ULEWzBV6+OpkdUVob+W3nhsUJengP/HGhX4Xa2Kfokb1OlOrALJkxQpNsbIPmEqLg==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1787682944;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Subject:Date:
	 Message-ID:Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=XrXbc5zchyV/M6Amsc9iBmCqTRlc9IKPDqqzEh2M+CU=;
	b=lxFaAtcszm45/aTcVtMvQD0pJ7Um+Iu75NpFKpW9MOEYXucCemvOU980SsE18nOQSN31
	 7jMwBCWku9fk7BhhJL2RiZq61MBttFgImtltdmI12sTtJ2GWnApO9Xj1/s69u0hOsXhGn
	 yxs8VjNWAKQay9CRozr8JHSkz801Ovd1qRzIEQNut1oIC1pxPRXA3fam0oX0yGizyPvQU
	 MGixkOIj9yA6AwzIxox02BaIkKYqf7Yl0EB8ZC4ZzTyPPrwzZkkLYZY4gkRnDFIQsm7ym
	 3xUZRNHm7hbiGwlCHO+CztT3dY62zOH1FMQDvTnKTveKfExy/2Vp3nU7v875mo+irow==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=EWO1jfhK;
	dmarc=fail header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.5
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010005.outbound.protection.outlook.com [40.93.198.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 45BEC1F000E9
	for <tools@kernel.org>; Tue, 25 Aug 2026 18:35:44 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=EWO1jfhK
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 45BEC1F000E9
Authentication-Results: smtp.kernel.org; dmarc=fail (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sv5yGF57gE9VlvNmdVdEQVXA7JCypd99iXd7N2QzUVeshHEma+3sw7NE+6jiFYfLiU2T2s+44K1owNuqPNuTk6m7IL40m7XQ0mfZxdygzp0PafJnBnysxoBq2kltWdgefF7NIE0CQG6e7asr/8ipWj4FSIeb/jfrH+9zO/wHQWErKJ1SJNpbol3KgByTkpa5akhEw3F3+0H/u28pjIIoHcoNyDqWHcmnIMIoe7Eru67t50YmkA9CbQhNn1Lzv8VI021WgQU5TDRZaxwLnA3UYvT1E1VqYPTEiYjAcRN5wDoc38v4TNEQQHqbl5/5EvPNC6MZay5ehbvMeLexDHWydg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XrXbc5zchyV/M6Amsc9iBmCqTRlc9IKPDqqzEh2M+CU=;
 b=tyGqFjyEGHQzYBvrP8gLEoXl9gVCy0xR7WufjT/uKZZMP24CgYasfy/jz+57ExhvVWrUOszeVOAYHKjWjNd9lPENHubrxkmZGycfYhFYH+EiVlzuxpeoPYfMqmLqOuN8avk4Ktx5shMWbcRX78ZyDrRqamBnmuP76kYBRHWfNLgUWWWG3B7Jfek2zusbpwoiQBgndCQOaXmYQVfRlPMVsVkWgrgg0EeN5N+sUk+lAgMCFjVoqqjzXKFAsdER7eCosCl0aJR/dpg3JTcoBPAovrQVzrE8YHlFzOXOfnQDyMj3oG53qifyXyen/7MeuiIl0n1Qz1BPFofxToKsHNtV9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XrXbc5zchyV/M6Amsc9iBmCqTRlc9IKPDqqzEh2M+CU=;
 b=EWO1jfhKkzGuCriwef7Y1fPkBD2A/HCoq1pYVqeU/7dStsM2bjH+qcAf1EpUlFZE8/wbl36UhTGwyqhE6MmRB0pCdlIKnNHXF6oAmeVUQDvOmKJEbKEIYZhMlohVjsTu/oysy3VHtRZ4uW6Rkq7S20YyMGJ7K1vvBAqBQCi6P+53Trr7tkqxq0LhhZSdsY6JDdPPHnHpv33U9CJuVAB1N5GJ0Gk85GEofHqwrDyoWcBevNSfJAF3NcFXeyvL+NoeUO3Uodq/SLT8mESqRR++Qlfah+FaHIw+FelvNh/h81CXuze6kXHtqFFvWNgsiHvv44gXo+FI4I2nUFHgnZTlDQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by MW4PR12MB7214.namprd12.prod.outlook.com (2603:10b6:303:229::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 18:35:36 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%4]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 18:35:36 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: tools@kernel.org
Subject: [PATCH b4 0/3] Improve email quote trimming
Date: Tue, 25 Aug 2026 15:35:31 -0300
Message-ID: <0-v1-5f6173f1d4bf+3e9-trimming_jgg@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0106.namprd13.prod.outlook.com
 (2603:10b6:208:2b9::21) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|MW4PR12MB7214:EE_
X-MS-Office365-Filtering-Correlation-Id: 244aa3e0-f968-4a62-852e-08df02d7a6f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|56012099006|10067099003|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	PtsLK84MZbCp1mGKdbAcG+1YZI5Ky2bOqd4Bb0B5yObiGJS0GIUllGqEgSapAW6uD7ZyafhYJnXhojSKkUzVSq5HFCx5+e6fhBpqpYgOqkfSZI85TllpMKdPRkX+/UnQgyjN6GUpim1zAD7NGMgJtl0ijMBLEl9VJY/PF+G7fR+tpzrvgTQ2ZDKM/1G1z4qDYEDwtm42q4ruLM7EU+FJzlP1U/PwqGZSBomANDAZorNQybo2U8OgFapPm3QwU8gIqwSI3tHiKgbrb0ECo/LJNpbFwUrfXZklyI5G28Y9qGB3UeoUG2fyDZFQwITYRZUv1q9plXjS7B7nHsA4v6mZ+MGjwj1npgBBi3tB6bWLTS3sppV1K11G/5fW6jO9SOwdTlka80MS2/JB+DhRZHZi5ZrvIk+s/iE7NX7jgthzedabXQouc8Z7zG/VA+aXAI/ZRm5rjui2AnYWTH0+5/0eYdJDYUZ7iH2+30t5YCjN0iaXOjuX3bZZuWSsAaA3W0SKNEkXoEilhc7NdrZ5G2t9/nCcMEeJuuBF0MsC3vBMqDje+1zX3xc89gOI4TkOJlPugESthcGqLrkqbEvFTts3X2zQFyM4wkT5xFTMVeFISPhlrg86OX71+4miiyEQ/kmwVib8pck95oWCl+cPqebClYW7PlFAz4ke1KB2d8kGcKo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(56012099006)(10067099003)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0UBL9tFhcfjuUMEBrDo32bjezJudkaRJroyxAPk+F/Ntyo6ZQDmyaBah+9JR?=
 =?us-ascii?Q?BakE8Pb6sUMAjPdjCANiplxvZjgtA4L6xR3kSh7Yg0pCwIyN1eSRdLPNdbHt?=
 =?us-ascii?Q?yFPmZye31DgKU2CCFzi7PUgVypPAR9cQvXumBMCkjyy5vVJT4T/T5P6+oldP?=
 =?us-ascii?Q?ox7t+3ANb6bU9ZM0nOrbgjhP87ThWHdZ6uSDNqriOSI0cRnw9pSP+Xza6IHJ?=
 =?us-ascii?Q?dJT6NCn0tpBz+p9wybLIFN5ufdpU+FVnfFgdj2NnhwCH5tLfUvrhOhmwuf0V?=
 =?us-ascii?Q?CYe0w1VJihTKv/WwiMAzNrOT8yjP1Zp8o4IAGfGxV0zxKM0KcOXeqolbN6J7?=
 =?us-ascii?Q?igMgfJQDSkH8W9gGIJVrzTgd6qof/v6KnAcQv16dm7FcrMqr21VlWvma/iGh?=
 =?us-ascii?Q?By/qmcU9d0PBUqlF12bSLCF3eSt0tTi63CKkO1QOgdgyjls33lL0+1yNfcdO?=
 =?us-ascii?Q?9PShik9TmPkT1xVKmfWzOFjYyTW75/RrD/yI+ANlZ4yki7LLDZn8QX5bfZe7?=
 =?us-ascii?Q?O5n+aanbR0Q3AAdpVOh+mGkuYXQAO50RrlDGuimhojSYjxigQXwHmoEg3ZRn?=
 =?us-ascii?Q?KfLIUl/GL3QYyfiPsiUfxmAoW5xk7rvhIliMUs3jNn0a7mzHHbeZG+YJehlS?=
 =?us-ascii?Q?QqyCB/mQ98+WrgnqSTZNIovzYJWOG7+fBloEJ6AJVArRld6KaN/8F+wPgMGX?=
 =?us-ascii?Q?kS8ciCpA2bXJwGaSla7LCtSNMY9ZewWoCAa0m/zotq5u2lso2Qs9KBfJLJYF?=
 =?us-ascii?Q?0CbvqsGa9+1fqiDtRXtpkXM6NbRxI+CGIuOj4XbOVUpwEsZzE4mH9PG/RW8a?=
 =?us-ascii?Q?f1XZJYjYuxUSbmRCJV7bbH8pSWDDHp+6TwXfLmPhZ78UJtAbPHirTGvJJ4eo?=
 =?us-ascii?Q?A6Gf3eiA+0xGSa16NdeyYob3q/KXQUczQpwcyb5FBDSL/l20J2L61nBY4Ola?=
 =?us-ascii?Q?6EutAVsEbz/vO0qjxAPzMNg7HICbr+Gelkt+lcbXFZwwXA3zYKMsVi6EoDqQ?=
 =?us-ascii?Q?CE4cCMxbYffERgA6NvfMg2W/B0FDm2ypmcyZlyGzRwPQ+kcR4pE+yvDieVFH?=
 =?us-ascii?Q?SrzbyYsiOOZAIOgQk6Qf3Uf+K3gzVL/DiwoLcIzBVc1JbKsmm18Lw2vsymR7?=
 =?us-ascii?Q?DmGNSLDAWRDrueIk0L/No0pQ+3FQ3PY/U+IuaimeMFoby4EhYOzUCaSWeWj0?=
 =?us-ascii?Q?byquBa8439LGLPaTCCIJNTvVJ8cItM+y0JopX+onx5FYUAGwFkwWfZj94SV/?=
 =?us-ascii?Q?oSmE1qoGTcuPUeX6sxP3rkV1SjHZ/qScEFb2ZBALoB1IrZaqkTk2SU+d2Y+1?=
 =?us-ascii?Q?YmHfbmXDNS4xFQAoAjo0emE5GNoed30JKweiy3JOL3efe8qgdMMoc9RS3IHa?=
 =?us-ascii?Q?sKUP9X59eSL3F+1zNWV7WPs7aarNnqL/31ihCOl6gfFUFsaJjk2wu2DvbURV?=
 =?us-ascii?Q?eutgqx2qmxJ7oZ1ydPiV5xePv2fruaapqNaP03BERYd4PZH4LsQR8Yrelwj9?=
 =?us-ascii?Q?te93ruiK51QDe3XmbXYCvxfmYANmnH4lWkoseP7t+fM0PmKOsM3mNl2MmjBy?=
 =?us-ascii?Q?sn73VQV9AsE7r8qHxs3/DnrqqA5bo/N8j/2G4Nsh3U7TMAPOE9Y87h9tWBHG?=
 =?us-ascii?Q?Mjx6APRjjosA6a0uBRGLVkMGH1wxIWNf93rTsylJZh8EeVR6FKT/OLu5Tgmr?=
 =?us-ascii?Q?Ke4MhPnjNCQOp2JchU8ghVPpcvHHCWVddtaK8gttkFVhjBnR?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 244aa3e0-f968-4a62-852e-08df02d7a6f8
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 18:35:35.3611
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rfe8+80reS6pgDZOUdk7Oz7daTm7JpKE9x/n6/Z5z5Y3FQC5JWt1FSeq8EvUQ/r1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7214

Three patches to make the automatic trimming more versatile and work in
more cases.

I would, broadly, like to edit the messages without editing or removing
any of the existing quoting. This is because I tend to make a few passes
at things and once quoted text is deleted it is a huge PITA to bring it
back.

Introduce a >8< marker which tells b4 to cut the quoting and then b4 can
reassemble the message similarly to if the editor macros had been used.

Along the way fix a few corner cases in the email construction that
resulted in sub optimal email generation.

It took a while to get this generating emails the way I think it should,
I've included several of the cases that didn't obviously work as permanent
tests.

I've opted to leave the editor changes alone, but I think it would be much
better if it could editor fold the text the cut would select instead of
deleting it. That's far beyond me though :)

Jason Gunthorpe (3):
  review: trim trailing quoted when adding a tag
  review: discard blank lines between | and > quotes when trimming
  review: add >8< inline marker to snip quoted reply context

 docs/maintainer/review.rst       |  24 +++
 docs/releases.rst                |   9 +-
 src/b4/review/_review.py         | 144 +++++++++++++--
 src/b4/review_tui/_review_app.py |  10 +-
 src/tests/test_review.py         | 296 +++++++++++++++++++++++++++++++
 src/tests/test_tui_review.py     |  69 +++++++
 6 files changed, 532 insertions(+), 20 deletions(-)


base-commit: 0c2c3c276e0447e37f2e90da60505ec6d765ded9
-- 
2.43.0

