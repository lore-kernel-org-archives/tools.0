Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3DE62931F5
	for <tools@linux.kernel.org>; Tue, 25 Aug 2026 18:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=100.103.45.18
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787681326; cv=fail; b=E9einHfaCFX0qGsk7O0JeVaUp1SVBR38pzPZVfpBN26HyICoV1mydpD/f7kVdimqhM8nS2zpSZuFj5ipoa79J6Y3/t2dtE6jKeQCBPHAKQUTFW+ypdGB8zbj87VlCrVOIv97TsGyeqgXCkCxKfr2pfsDq+fWXLj86feljTPGHAo=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787681326; c=relaxed/simple;
	bh=Y0egVZgMXuTC+tvDb4pGUHANpqBsoZnz9aRkDKXFtuc=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=MgtXzZJju1g+OSqZOJsDNg+TcwlSkipbDNKVNAEE+buX3BL5VslLzVqieh3lF7jB3qz1gkLqEHjDeVNdWRZTwoGcIWrf2CV6ez6vgxfxh1Mtlu9623iRnuTioKaZjNk0ZL9oZqJEBECqrgo2GjaEksZFYLrme7x3WnbXkmvBTgY=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=C2xQEfj/; arc=fail smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="C2xQEfj/"
Received: by smtp.kernel.org (Postfix)
	id 62B7A1F00A3A; Tue, 25 Aug 2026 18:08:45 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.17
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1787681325;
	b=QH7tUF8bRjhiiFAXxIpO6JlEI1BhLH3G/31YjnR2xiCNDb4ITfJ9oIFc3tlL6efSVz2G
	 im2G1gQrDFmi3vzfJ36GSW927ThvGw6VMKAcmoXFXMm/EqlLVekozbq8pGx0S4hGY4ZA2
	 GAb6KYHNt7xnM3qnsWelY6sjSFu0fUbV/8CKHZYtp0ZUdsD/Z7qXnQxYx6zBP5UTBgH6j
	 C5aqDqDVFKK5/CVc+8UkF3xuJMNN/XHAcjIf3bjXJDu9eEDcCrcJpftmPSNerXy5U7a3y
	 9noq7Wkorkt2H3zLOk6+ekV4mtGchpykyyeHAUKf3ZGIEw23n47dpZhRiPlHj22ih/A==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1787681325;
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
	bh=ePWykjWdrmOjhvWYQeBugN6//9J6cgfjfrdSrQrAgpA=;
	b=YiZTaurmSRADUMU6H8hMTZk3dCRCJnqGgoTBODhPyzLR20EHGM1178Mh4cW25UsOsu3u
	 63Y+yLnBPOkxZZ75RxmJe5Q9SONbSgnvFbQQOQyirnhrL8VHq+dGOR2U4DhVDFvOw5oWU
	 E0s3LMnhnfaN5/KEG4l7FB1KG3v12XbXZFhjePstdAvr7DgoYd43Pj/VVLYHqBoF+Gao5
	 sTWpN8UMFF51X7B9m1SG/yaA3LHLTmX3OTo6z7AAHHRxcpY42F5o6VVurUPPgZPbKv9T0
	 gTrUp+Vhtur+57VUEOtsoBhTds+dMOKXZ/MiTjLLAHGIvmcRAEEdyznwKwi9oQ03ANw==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b="C2xQEfj/";
	dmarc=fail header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.17
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012017.outbound.protection.outlook.com [40.107.209.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E99D11F000E9
	for <tools@kernel.org>; Tue, 25 Aug 2026 18:08:43 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=C2xQEfj/
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org E99D11F000E9
Authentication-Results: smtp.kernel.org; dmarc=fail (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DEUAsnanaxUSrOkfeJs2DE1AaMcxORWiHFfJtbSZHhPvT1u5k8C0UGU++G+uGe7wbDsBchVDb73kWE6sECkDCSzNPoht5J0Y+Gy4H7NT9Tyh0lDC2gtK/+pA+sTNxUL0UsOpv4P+qqd1E38BU9YYH8eqyauajNF1pWbOkDueQsR5AVQ5Av3py+ypJ1AzkpHv56fFKFpJyOaEuah3KUQ+5H2F/p89oNUqHIS9v3KJODzXhuuHXbcB5kxC3QxHPbIkgjo3kfEa9DlxyTTsJCh6LIbN6VLNA90LUAtqJRFEgdDSUCg6Zh0WYBB7QOKPDURxITBaoRVaiztbozmGd5rZEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ePWykjWdrmOjhvWYQeBugN6//9J6cgfjfrdSrQrAgpA=;
 b=d0y2ai57sQLhggSWZ/vBdSIcjFSfDcAiXHvetUUyr131iKpyvR7ekUSG1MDohgFfp3XU91ai5vMACigINd6qyLJVHVIjDKopqMw+lN7psHjHargQmODTXibT2XwWkVn1UH5tUYerx2TTLGM1g8YIw5zc2jZwYtt1NPJ3l2+gxGVrBi9cvFrSdP9tyBLo9m/dUNl7fi/T/une26yzEoG3otTjymXYwVfUBzKE3cDa4jO1jXlBJ1tlEmdfsl3/Qz6QjIWHVJSVgQPeAXWIc7G1d40NJwg3dm8WqeGLK37Nj2ZJqa5fQrBbKj/Uvi3sCr5zNimaEcZUqiiqS01id2xqww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ePWykjWdrmOjhvWYQeBugN6//9J6cgfjfrdSrQrAgpA=;
 b=C2xQEfj/YSc6NxGsfatFQkfVeITAsP3BxyWB9nHJv/5ONNJDhHWe8rJWiPo6Q6PPQaiNi+zeFoflZrGUG8OlHQOMhl7e7vnId8AiYiChmF8XjaJGLgE4Gve/1TobxypkJTdcFBofZBYFAh+DXbt5sEKJvdKFGP5O2FCEVNxtEozGnxLLe6cpgPBP6UMmPbn2iMIfI307pZyRD3hMv3/19gUnO2v+SxmnFmCZIMFVVlK8NYwEZv2t29yGWTELizOF+qPnLd4fDeZwE+1s2hs1Bri6eKrg5MGMkwTNggXRMnzqrKeVkLKYmpfeZ0HIKzwQawAPVGRlF7HHP76eVc4T3g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by SN7PR12MB8003.namprd12.prod.outlook.com (2603:10b6:806:32a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 18:08:40 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%4]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 18:08:40 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: tools@kernel.org
Subject: [PATCH b4] review-tui: show no-reply preview for note-only reviews
Date: Tue, 25 Aug 2026 15:08:38 -0300
Message-ID: <0-v1-0c2c3c276e04+ce2-note_email_jgg@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA1P222CA0157.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c3::24) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|SN7PR12MB8003:EE_
X-MS-Office365-Filtering-Correlation-Id: a180727c-e0c9-4cf3-9fad-08df02d3e424
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|10067099003|5023799004|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	pmKbjQYsfIQnpG9+LcDKz1WIu8xBAC4HjlIHLBsaotvbmhTx8LHgDZH9rkrRrMJ9jwcF4gqrrr7mGiX6btDfde0KN1b2witCaiaClioQP/mwFVHyrEtI/vGEJjCDK8twaz6qCXDO9vE/DcIsm/PEC6V5b/n2YT97pmLmp+DVysw7YjHUsBt4K5qy5ZectDmXT0WO8LTcwESVj/nDxPGYm7zcYOZtQKU6kizXLDW2ykVlt0oL+zhUUvVdcvubEmv4C9tEKpjcUns5Cp7GOBGGCJGAMr/B1rgNKBqJIR/eLygEsI7BMW+lyPGOrTrkzu5ajGu6quQ9ORsk6yqlG1xv4Lq8ne0ALrEt2vV2g+e1ileQFlGDELfxPqGOhzc7+rR8fB39ql6i3JETxSsqTYc62qa4lVhtJtIT1eKPtPVHvz3qRvjwBOzIxq3A43QEh3JHPUMU8DGDSLqHTK2KtPP2PzW7rDqwf9p9y5tvBd1/5T8akCt0LYFK3ZHQm48Kq/dE9qIvvWdAS+ZZVVKdS5uK0jT+BA/EdfmTg9ltpvlS0U2nAkCFtmAGPzuqUPr7C35AVQw/FXuUxUuELaN3Qu/I7pKNo6AGMCE0cypizUFJP4AJTj+Lne09pmb6GoMdeUo5agvQBGfr55ghgrOVuE/9lolr1BXy1h9Gxj3hqCz26Hw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(10067099003)(5023799004)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ft5EvC/Op7XWtmG/osppYPi2WADQ39K1OEfA5u/ZvQ0xPyNS3esqRmE1Kw7P?=
 =?us-ascii?Q?3Dvu0jS5zn61PSpL9RTekoDbszYL2TAAcXZuJey6x4dYE1CqMr+y3ySpHt26?=
 =?us-ascii?Q?DltPvPA/bMq3XBRA4TMPwnrAdjeYuGi7G019yTtst9zkHCTEte9Z0mN1b4cW?=
 =?us-ascii?Q?HYea1POrlpoXuA7MnEMqIhmHJJmxHAu3vfeKNPDkAWOko1OhEbbE6p5o2I3P?=
 =?us-ascii?Q?AAHv6Wd6nwO5ovBYSN+pp1gz6qORPh/xZRX9Lh8+IPrOQW5Lx3Tv62ybjE6G?=
 =?us-ascii?Q?1EeRMAGqRuIJVrbskB+1VisGUx1UsWTW6OzYoQaz63S0VwkIwiw7lubL2/lS?=
 =?us-ascii?Q?1JYaNBb3KIWkeke7Hs/3EvQBfIGsrOBGCqDyVC3ByG5ou6gLd5eslM86D2kf?=
 =?us-ascii?Q?d7s1tb7F+XEwchTvNtmZllT3AiNlD0YQmUEtulwJo+Z51QSlpd80V/dV0B2Z?=
 =?us-ascii?Q?tuBitsW5o8nr+p4GLfkgGiG2LMa07uImDYXqFpKzKhvruJCxVJMX7PbaXvce?=
 =?us-ascii?Q?pk2zT3iVGT1azvKA4uF7V3H/raPfChcYD4GNAXkAuHnRtdQYFLYjkPsHcTOE?=
 =?us-ascii?Q?lzZm+zADcS/NPFO6l13HiVtgc3d2GUInpZ8h+Vsl43to99oxDTcu4KohPrmz?=
 =?us-ascii?Q?mKYCfN0zramdyVuGp1Aoe8GdkN6vO7YwdkTNTQIc0RVgNZd11336ekmxY5sG?=
 =?us-ascii?Q?E8IatkQ/Vj9MbOOWWqqMc93q+Q6KHHrJD7/RPPECJ8YgMckipoiibiUIXO1W?=
 =?us-ascii?Q?rjNuptCR+o6anfq4pDBTtUDQQ2LpnAv5vOLrajwtpCGapSJ9c8HedVBfM97C?=
 =?us-ascii?Q?skO+X//43hnNSJTj6N2kO2HjUIkDBmzM6kJlH3nbK67Vjy0R253Kq2xsH5rD?=
 =?us-ascii?Q?UmrZy8nHpO9NyVbxlqA7TsCPOXflDlgEk4okkGjrdQCWRZBa/ajn7i9xNk6c?=
 =?us-ascii?Q?3fSfp4tfjJCxz7yZpiPULCbBM2cvzVQwvUisnA+87xFVB0UlVsFgTGtUDAn+?=
 =?us-ascii?Q?43Gnbew5yxj9pGK2CgXKEbenaTSUiyf+iaPc+XZ5H7uIVB78gXdbwhD9mI/3?=
 =?us-ascii?Q?INEIztQVeOL1aGhUwea/oNnpSi7gcxBFaOCMJSwS2ZvUoMdn2anuTbnwqNBI?=
 =?us-ascii?Q?IumYGb2vXxG5hPQBc9wekDqRhDVvju0Js9z3e/sE7luJM7Fum2wdW/f8ivrk?=
 =?us-ascii?Q?yOvImbEH03sOBOpaMqCpDxRgaR+2PWGpthwJtvADw7HK0lBaWpdKUomWi3WM?=
 =?us-ascii?Q?7U8z83OOlA7IFKRIkuxfIns20VOJwX6iunF0MuWEhK30WjcOthlfNzP/69Lm?=
 =?us-ascii?Q?hvmBxamv9rIdNu14VD1awV/BrwCVdQDeK+8W2jvyL32XY/FAEMiTKup4wjnD?=
 =?us-ascii?Q?snvtBDwyvQXugx9yGNbdzv7Sdlkxex0dgKZSP1Xig3gzq2zY9R4dHCFJVy6V?=
 =?us-ascii?Q?Nbng6f6puXxGdPn0E1NXM3KwiPEeeNnHeNkjlKUA6OU+YhYxDGSXY4SwEEk0?=
 =?us-ascii?Q?/EUAysevXpoLRoe15WoV8weQl5xYdQaAxNEcvM6gjpF7qYAxhCbIs5TW7e2p?=
 =?us-ascii?Q?hngcFQYvslWh3t6b28jULlJrcyMb6vHDJwqy8HpmbKY8cAFmRlGSzWm1Kiqx?=
 =?us-ascii?Q?+9etj+UxrebkMzEEupxjEZUrFWqoATB9133fY/CPzejJyAUgmRe8PzKHuV9W?=
 =?us-ascii?Q?g74o5goskJsVIqzNjmg3+ITZ8Un2JCo0LVtMrkYldrze8s0F?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a180727c-e0c9-4cf3-9fad-08df02d3e424
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 18:08:40.0349
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g2Zi1bN1uxLznAVN1XuCeZ+kNqkZlw8tzZZGFh4+i/GuXi1qN42Fvt7DFef825h6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8003

If a note is attached and nothing else is placed in the review then the
email screen says:

   No email to preview (missing message-id?).

Which sounds like an error, really there is no message to send so it
should say:

   No reply will be sent for this patch.

Remove note from the condition.

Assisted-by: LLM
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 src/b4/review_tui/_review_app.py | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/src/b4/review_tui/_review_app.py b/src/b4/review_tui/_review_app.py
index 7fe707bb8995f1..d73fe057b5d499 100644
--- a/src/b4/review_tui/_review_app.py
+++ b/src/b4/review_tui/_review_app.py
@@ -854,10 +854,7 @@ class ReviewApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[None]):
             return
 
         if not review or not (
-            review.get('trailers')
-            or review.get('reply', '')
-            or review.get('comments')
-            or review.get('note', '')
+            review.get('trailers') or review.get('reply', '') or review.get('comments')
         ):
             viewer.write('[dim]No reply will be sent for this patch.[/dim]')
             return

base-commit: 064bdaa79218f23790cf5792ed87f961e8681555
-- 
2.43.0

