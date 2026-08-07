Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5272B640
	for <tools@linux.kernel.org>; Fri,  7 Aug 2026 23:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=100.103.45.18
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786144660; cv=fail; b=ICbph3HVv+OrD0xQyklyUn+7ULuM0Gx6GHnruKPioqDBpYHcYWL3P6dbUuyKcFedlQnADFRpEK0ZcNVc29Ia+3/2immLgB8DAFfToT/BioZWHMZtMnzM+nzigalK2QTBMKoc3tw5s2iqLZpxsKt5iXgfp9WdKrpXzbhEvPFoqeI=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786144660; c=relaxed/simple;
	bh=OdyElhBchJKaMTX/bNJqY5V50hsB1OyXC0cSXeLibGA=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=pncycoWeXonubvkVAV6R2Lj02OSxHZKqbWCLwJa3uLkSG2L8zLrZY7NZNLAyAuB95IvT1m/ZSqE6whULuEHV9QxlaqUnY0b3Ws9b5Kla5PwHetHl9rvMGdfuX4+RPcZie1RmxhVzbvCWCz0WBu05dypxs2Jy19fKSOEt7vZagkE=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=IQx7a+6Y; arc=fail smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="IQx7a+6Y"
Received: by smtp.kernel.org (Postfix)
	id 66F561F00A3A; Fri,  7 Aug 2026 23:17:39 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.47
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1786144659;
	b=Xju3AjETP6np6edC3JQoE4GJynnJujWeXBSom4uhrDKho6U7ak2mzGuEpuBIKNtSwOVH
	 R+74euccyXWhhD/R6e9FAJhxyGOC1uKCctJt+Yfq4au9LBnSw0vgnHVxryTm0YleW4OjX
	 tWXBROb0GA1FyAFCMNjWS1Xz7UNuvUv0Y+5mDBbGHHGb3TgUeXckRGe3eKtp+dUpAqYst
	 1XxJwb52+amP5am/nmx9En2ponhavuED7FePlzHUZUt60cK/venS5X+2wFyDcf3JJdCrx
	 NfF/lPrimPpmq27D9SafsZucRnQW0AbNN5BTEkDQROwPBMocfY1yUbiA3MO/9RtREUg==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1786144659;
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
	bh=5/o4q2H+PNaCP4BtMD0LIT6YInll0hwely1s7xDwEJM=;
	b=02u4NmoTxw6ZrRZgYnvfoBVzsr63m0NtawkAcPjmz849QwBa903F5tHZViY2A+R6DeR4
	 QeXfE2tdigfy2u/VCvYRfaD6RFxGPopzF/PxCkAj8cF+pe9gSOBl1UZZwWiBkOOTduC0v
	 acvAyDDL9oGxgHvO0YiW6+M180KwlOwKfAfLohUJRj8JOfj+LU2o+inEICbYWnctuxWA8
	 mPb7xHMH6OfSIuoPIiZsVqhHUGBywy2TCh0tWRQw4RJtrQV+c7sob2J2bYXty3zToMj/Q
	 qpBhFbBBKxs+W++aKdmJA5iBsXVNqLm5Ty2Pgfi2cR1Z9jg31x1NpfFq7+BoUFppmEg==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=IQx7a+6Y;
	dmarc=fail header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.47
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011047.outbound.protection.outlook.com [52.101.57.47])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A767D1F000E9
	for <tools@kernel.org>; Fri,  7 Aug 2026 23:17:38 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=IQx7a+6Y
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org A767D1F000E9
Authentication-Results: smtp.kernel.org; dmarc=fail (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=scIr5QFlf3JifBZwKKiFql2rjB6H3rNsMqlgby8LOa3o+Nk54YhpBysalsSYfodYTznwkiMVWOvGXNId7S8FB/WqSPPMyROz+yqyxwwxFnwAVm86hAWu+Y6gQTgecmrue2NWe0PwiL8Sq/3NIqt6IWhhWRHWBr5DeIUdhAG+Ci3GIxDLCnMxrkNnk+Sa+2mWA6Na1yTLa0/DYrVdglyCrRN4548g0PjC/fnbUPzM+5hd/PGYJ21cnyzFnUmKn4aFug+JWP/s9neprksDS22/BmFDI4Y3lbrwQmCendjtTR58l0MVoYQ0yfsA0wNc3zRumeh+OCSm19eiS/qDQwgCZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5/o4q2H+PNaCP4BtMD0LIT6YInll0hwely1s7xDwEJM=;
 b=n6C2hXByWXqEymLkyM34d9Si6GA0u05tbewYcTOgajr3ShPzT+wFk5l5Jc/DLh3Y1zls6yS3dUnZSuA+25j1TMlwOfU/BZvoLRwgDkPBwFZmZYPbanE+D9uEOUZT1P7Q0gw0flHSBKf5ivMRuZ6AVjWQ/YOcuGkJMTG870kcQOAPGaPa2DvFk7vEkh6kC64dpB4K4jVTQTnLECt+o6Rj1xLSdFyOB/BbaW56zg+KiP50f17qSbEFfLekTW/pi8ijvMtaMVhPdX6RlAZm0beeauI1j0pYNDCJXzz3Nh2xZ3DTvTcRZohGb1E2IMnjt4SP+nhUIo+8OLkVLJLhR2ZZdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5/o4q2H+PNaCP4BtMD0LIT6YInll0hwely1s7xDwEJM=;
 b=IQx7a+6YnZVxBTiZ3uT/K4atr1S1H77+UsMzOxQtThQst/X33J54OivBIZuOW28YaRp8Gglq+DCrzZ4y2M5TbRgcf23/0adP7nM6QTmc13aXBpBRnKXur+aVnx0Ta4pC2VzJHUuzuGG03xX8y0+PFZUvoELIFoKt8aLl+aLAgLVLKtBgCio9J7TY5FWP2yvdQbpPy89+Zggb8vEm9QW+RcimVcFhv9bll99YgiwQU+YOE7a5N19Xgs6yBm8tFntR0vPrBnoBqcRtRA9lIHDydkQny/6yIfGRA390lI0bHCuASgQ4hKC/ukPpNPJ3GgBsRf1HOW0VND2/Z8CNbBrawA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by DS7PR12MB8229.namprd12.prod.outlook.com (2603:10b6:8:ea::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Fri, 7 Aug
 2026 23:17:34 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%4]) with mapi id 15.21.0292.022; Fri, 7 Aug 2026
 23:17:34 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: tools@kernel.org
Subject: [PATCH b4] Support python argcomplete
Date: Fri,  7 Aug 2026 20:17:32 -0300
Message-ID: <0-v1-fa59fc5072f8+1cf9c-argcomplete_jgg@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YT1PR01CA0056.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::25) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|DS7PR12MB8229:EE_
X-MS-Office365-Filtering-Correlation-Id: 595b7fd8-64e2-4593-9a27-08def4da0fc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|56012099006|11063799006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	/Arb6/yqMoCjwLJ/CUYCkwiKKtOUcl0XaL9VZBxC9r58bb+5oN3racuKJv2BddKR7nnJUcKCINzPzpYMHfDBtZzsM8kZRu5n6uyZ0iqCl8HDGbU7ifnQiFwTmBnS8580sHZ0teZjqeIzkguEe6E4/Bf+fGDHlYVMBK2w9NA+1BenLIZo/9ejmE1NmG5bMO83ljomg36FiQCa/6qB3Zz2+5Z0lH07Mh1Ntmbdl+8LRQnAoydULA88h2YgX4jcw+kHDb8gpos7jB1ANrP89b4jOPopOknFOLf81ZmjEWPbK1KWHpOy0l08MdAB+Lryiuxi90XT65R+GYQU9W2eVu+VS6Df9UHQhscbuFd5xKfhWyeiVtWnwrQtFHCm2B5UTG4DQR8PCctJ8ly18VsJ0vsFG6ZRImXYUCMG6wtD12pfuYjIH7JXpdXOdG9sR32rvIbajpWwuHVA4uTG5F6xEcz5XhYvE4RQC2UqfVnTUTs15kfOZ0j6hUaYK5duCaMO+ZRJ05K8bi0NLd76nJKXMppa/DAfBWAD9N2Zr/zTvokgqBL4vP5OvQ3lAF7/2KLlyuwHrkcJafE4Se9Zti7Qd5Fd4Id+NkvL90dPtqQMwTfOBCcFsz8WPJt03NXqAKk0jXIB2a0w7a55/enYP8iNdnn+Ygc8c11B3Y5sgSxDNV58v5E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(56012099006)(11063799006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?swTK+NutcoXAqLQwi8go4i7qzmjTrN83UuPltZGHD4v8K2wb4phH5vZ884mW?=
 =?us-ascii?Q?6NldjqJeFNUGr92Q+ptgwlo6A59cCNzKlpRupFw+dOH/Ja8FeCeE3FK5gAyy?=
 =?us-ascii?Q?ZBc0UsuvDJ4/ezSZI1hDN2+SAQe6XiU/uITxw24FLKwG6AuSFdpIRGx7TSSF?=
 =?us-ascii?Q?OPjvbsYFJ3Z48NmWodkliEBN9BCbe8KficGF2Ee0f41mh9t+7jLggZ6LEQRq?=
 =?us-ascii?Q?8ntI7BSH2hCA+PXoBS0lCHdJM6OdJXBK9DozW5/HBmkr2uybpjSxRecodEGz?=
 =?us-ascii?Q?RGzbLYU5ddgOe+lotTahJsGmWtPbllqqBv4RS6YIyh8ouRe1c3pLbpIUwMWQ?=
 =?us-ascii?Q?whI72ZQ8tcp8qNyHWlC+YCoi89coABpYclWJByKY5DBdC/2oKoddfEASMK++?=
 =?us-ascii?Q?erHEemgLKT4EUxNmkldV+fFej/L6r4NNcN/IERGHlVtqDhNOaMeGHv/E6ciD?=
 =?us-ascii?Q?rmyiFW0BKWmT3176jxN8ztJxzPS0aAPmjoRjD1EZYF8WM1IB6NqKRQA8avId?=
 =?us-ascii?Q?XuklOstTXZEEU2cgkobaXywgWzsXOc5g3nZ99PdYfvcjBh7YWR/eSTLg5o2j?=
 =?us-ascii?Q?aVhvKKUyvCU1vgOMPolhHxVkDSXSCKPwtg0Qxo1Z944Ys6jUlXPKB5sIIuCZ?=
 =?us-ascii?Q?7Y7jOLiVXJydlja3R/vf5mhJXhCz/oRaja0QTjQWhWNRMeBpO+k4zI4spWTh?=
 =?us-ascii?Q?CkzUMiwwQekfBpJiwbeXj+/LHP/2KoNopIvU938H9fC9b+qoZFtEwMXHtMPS?=
 =?us-ascii?Q?qf/9FIz9sKh9KgQRn01GomXh4tueKxFz4Rb4Yck0LkiamGzdFsOV0bb3E4Ft?=
 =?us-ascii?Q?7sSs5wAdEjJaofie2IktSqESZYnuza7qiFbCKQLUe2IvjcCFvbgYSuLJ1OMc?=
 =?us-ascii?Q?CkOxTmyXCM3TC0WEffS9w0TRjSbH3CE4hqSlqJq6UH036mZfHCN8nFf4pdoo?=
 =?us-ascii?Q?epW6zP9mKs52N7d8BNcI24RrtVS5k27x/WAwDTK1UoF/O8rv1VIQDI3ylP5Z?=
 =?us-ascii?Q?tdpH94PknbwblyAfCo+xxKQLU53mvf0nPSrgMF35BFauBA6R49/gb6pTmjMt?=
 =?us-ascii?Q?/R1nvqEXHsvsUetP4+Fr290rGz2kV7ZJgUfmLyb49XkP/HMjJGBsLajxtVWq?=
 =?us-ascii?Q?KGV0AiNqZADXW4yo13T8Fsu16FPZaLYp+Qa7U9Yuy3vVV2B4U1/nwNjJEeE+?=
 =?us-ascii?Q?j8w0NU0lk49nAV26P8PiUv1HmPq04yC7yLwR10pXzQgYi7v0YfxptwrGvJhb?=
 =?us-ascii?Q?hxNOoBUUAE6iy0pvvRAqNJviVERrrNHWw+Fmrh1EUYbGJvSscHSZWs1hgLV/?=
 =?us-ascii?Q?iBmMQ35JaKsA+UJf0XpUyhDnNmxzNqEPlzZeOx0bJ4fRss9SBf4ANM8eb/OH?=
 =?us-ascii?Q?47AhcfNzwUKXRZIMclPNml2hiFrQk+5kfLBKBaNjY4z2w0nBvvShVCNiGSqI?=
 =?us-ascii?Q?8GQMZYzzqsraJSRNoyzHWrXsnzZBOFclybo+bNItTcU4yly4Fqv5nUlxJP0B?=
 =?us-ascii?Q?SKmCbfEomYenlaXseEH03xZzYxoHaRcctYYyYkabCSKCyXR32qXtWuzYlrbS?=
 =?us-ascii?Q?veWDnW0vj54jUUplR8+UGxfK2xdzIZ1rGsZL7GcGQXYODJ8i8GzMF5g+/QNi?=
 =?us-ascii?Q?jPO/fjwkw4rU9oRSeaJJkakJbv9dJvs82qNLI8o0vefIlZVgBguFIBwH0LrK?=
 =?us-ascii?Q?sHwxnlT3I40LxsBAtAFrTihJ1/Sxk2verKdQ3Mq/5BT/KcAu?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 595b7fd8-64e2-4593-9a27-08def4da0fc5
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 23:17:33.9414
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9p1HbcJ5elHeMpBt80JDlMKeWfvEZ+uzTa9O8zcjQYMTbrd/C6SPVMBGhvnkReLA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8229

argcomplete is a alternative to shtab. While shtab provides an option to
generate unique matching patterns for each program, argcomplete has a
general completion hook that identifies compatible programs and
dynamically pulls the completion out of the program itself.

This means that once argcomplete is enabled in the shell every compatible
program automatically and effortlessly gets full shell completions that
are perfectly up to date with the active version. When running out of a
git check out this is a big improvement over shtab since completions Just
Work with no need to specially manage the shtab files.

The boilerplate is setup so the argcomplete module is optional, if the
user has it installed (and presumably enabled it for their shell) then it
is activated.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 b4.sh             | 1 +
 src/b4/command.py | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/b4.sh b/b4.sh
index e3fbb100be0f98..e47c5b68dbe6da 100755
--- a/b4.sh
+++ b/b4.sh
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# PYTHON_ARGCOMPLETE_OK
 #
 # Run b4 from a git checkout.
 #
diff --git a/src/b4/command.py b/src/b4/command.py
index 8a8c96f635af67..803ed333346372 100644
--- a/src/b4/command.py
+++ b/src/b4/command.py
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# PYTHON_ARGCOMPLETE_OK
 # -*- coding: utf-8 -*-
 # SPDX-License-Identifier: GPL-2.0-or-later
 # Copyright (C) 2020 by the Linux Foundation
@@ -1331,6 +1332,12 @@ def setup_parser() -> argparse.ArgumentParser:
 
 def cmd() -> None:
     parser = setup_parser()
+    try:
+        import argcomplete
+        argcomplete.autocomplete(parser)
+    except ImportError:
+        pass
+
     cmdargs = parser.parse_args()
     logger.setLevel(logging.DEBUG)
 

base-commit: 362b87aa4d036884c36e4bfb9cdbdee626aba3bf
-- 
2.43.0

