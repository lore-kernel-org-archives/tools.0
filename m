Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E097A2417DE
	for <tools@linux.kernel.org>; Wed, 15 Oct 2025 02:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=10.30.226.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760496774; cv=fail; b=jHlBIa/3d291KgF9ZZGKbRybUdxovmMYSTfk/WKK8SzuRPqoElRIf3oGmHLtifmkAQhxKf5xq3DcdcTwvia7bu/RFhP8X4SCkGQ+tHAs0BdvVR/dlFIC0O0L9SetEuPigrq0xuwolzltS/3aLeqnMCWz6PHvdKTb819/+Q2WpI8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760496774; c=relaxed/simple;
	bh=nd8dl/ilWbuwGY8Zh4kliB0A9NeJ0uze1ZW43nYSEUs=;
	h=To:Cc:Subject:From:In-Reply-To:Message-ID:References:Date:
	 Content-Type:MIME-Version; b=W22WrvkyCGPrMIR1ry8oNyTLcooKnHahWlVfiNOsCYqfFZ2uJ2y1Fgd3vGstCDB42kAPei3fnO4gVRAKiDRnMa1T11eymnWRVUtzWN2agajYneJHloscHywCIpk3J8nIfwevvpoYVLTljWJAj8yLo5nD2nXxqdozc7ZyoMzJJrE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=S7hAHDMW; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=FwXrJYxE; arc=fail smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="S7hAHDMW";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="FwXrJYxE"
Received: by smtp.kernel.org (Postfix)
	id 9F9F3C4CEF1; Wed, 15 Oct 2025 02:52:53 +0000 (UTC)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A3866C4CEE7;
	Wed, 15 Oct 2025 02:52:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A3866C4CEE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59F1uCMI021952;
	Wed, 15 Oct 2025 02:52:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=0GtF3aX27RH6iugxiR
	aT04GX7phZ73BLNyL7eBAfUAw=; b=S7hAHDMWdw30rGK2IwXenrCWQR5iapNQb1
	aRyXMB8yq2TKmNgqtoDO9nRoXy2fb+ZK5OF1MfeVrY2R5PJtts6TTBwb9UjeWEPD
	38ydQebu/kXopYKd9TjsKQNVL7DlXIz4wlL+H+o9stvrEDzYwVR8UtZLeMlrtXZg
	BKV1Va5OepxY077Ti1wM9sZjDJEq1NSAq3wog2ohiMcgYajhZl4TomUdBJ0m+Lky
	Ob6/JCMseif0rKoG+DAP6fydqlUUORUwzfjBTELTsYwAwEuL4/qdTaUsccdfVUwu
	6UXlp/y5C+i1DWPntKOR6tpOcxEuDjxGti9y2qnjzyGIvjrEvL6Q==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49ra1qcr21-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 15 Oct 2025 02:52:50 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59F2G2h4010020;
	Wed, 15 Oct 2025 02:52:49 GMT
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012041.outbound.protection.outlook.com [40.93.195.41])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 49qdpfr81p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 15 Oct 2025 02:52:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QvC1Y5YhisWOhk/vrAfWeZPnnVDI3Af4RkV6iUqD7QTZ8roDB7UvOpvPGvml5uq5AlAPWO4cetF8u2bCriHZCTY76II1Aa8t3r+kq4aE/Fkl6B6enN5ycSDqn2SFnszL9rNmcUAZxQR2vGRk6qjjrjIJRXAEsa2fNWZ806nl0/+Ies5A5bQnl1gMRCur9GzhOA5AG6XuEKC74ntIFiE03S2oILg7NCw9k3Q2vBNCDwxY2AM+Ej+JWck+Qiit/nKJ6krfssMMDcqTCBaIYpRGSm7btUhQW61OhSqB9xamYYASKuj9pxQ4jg3UGAUSEJT1M3UWs86EbuQLmFrNvrCjBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0GtF3aX27RH6iugxiRaT04GX7phZ73BLNyL7eBAfUAw=;
 b=UC0BM88JvCzP7evE4kJufPLFF05ey89n1zi5NdjaniyXJmSDsVcIGvDBkh014d4qpSKxRdVu/IXsg4taBusUgloO2l/J4z2NPflsXfZxSAMBi+Ro5eeSWM2hpPICnA3C1nEVfwM+8UAsJKOp35VVSqg6miXt9axgLl8kyC2DoA+rzZnQ42OwKT9+lHefmXNeWBstqh9QFTOI4tCYlqWYWm34lT8K1UBOPwEnaKASDa+Oy40ziREWhMHfPDYCgpu3cMCQa7vwJz2SVhOvwMP0huKK5fD8aRCSm5+2sfhG7HymK5jkP5NYgAeDt6Hb6YVGpb6SMK59X7lrb9M5yJQpsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0GtF3aX27RH6iugxiRaT04GX7phZ73BLNyL7eBAfUAw=;
 b=FwXrJYxExwTyBp+nKf1yznP3ktkzoQVs9Ch40FTW2lj387JVXXdSxOzc+oj5I+R1U5Pn7A7eHxXsWxKp+lGH9dX8tKczghx15IxEPY1eBVKa9XvD9ML+9Jd3WEwU78HIYVqVLUkb+pLqKSd+pRHNiFT7tmEs1b3jyBPdnik8s2c=
Received: from CH0PR10MB5338.namprd10.prod.outlook.com (2603:10b6:610:cb::8)
 by DS0PR10MB6128.namprd10.prod.outlook.com (2603:10b6:8:c4::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.13; Wed, 15 Oct 2025 02:52:45 +0000
Received: from CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::5cca:2bcc:cedb:d9bf]) by CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::5cca:2bcc:cedb:d9bf%6]) with mapi id 15.20.9228.009; Wed, 15 Oct 2025
 02:52:44 +0000
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@kernel.org, tools@kernel.org
Subject: Re: [b4] initial "b4 dig" to supplant Link: trailers
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <20251014-gorgeous-cougar-of-endeavor-0c5baa@lemur> (Konstantin
	Ryabitsev's message of "Tue, 14 Oct 2025 17:17:43 -0400")
Organization: Oracle Corporation
Message-ID: <yq1347kc3bu.fsf@ca-mkp.ca.oracle.com>
References: <20251010-muscular-camel-of-acumen-00eeaf@lemur>
	<20251014-gorgeous-cougar-of-endeavor-0c5baa@lemur>
Date: Tue, 14 Oct 2025 22:52:42 -0400
Content-Type: text/plain
X-ClientProxiedBy: YQBPR0101CA0183.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:f::26) To CH0PR10MB5338.namprd10.prod.outlook.com
 (2603:10b6:610:cb::8)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR10MB5338:EE_|DS0PR10MB6128:EE_
X-MS-Office365-Filtering-Correlation-Id: 01529acf-9c10-427d-c8fb-08de0b95ea72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+bXwwspDry0YkLU1SGgoRgOPD/mXllMMEpPUtdfVwcavNRvq6bi0RUX0Jg8S?=
 =?us-ascii?Q?lEqvd+iJ8F6ZXZX/bTy0YMz4miwpC8i1yg9PL6trYv11uoXdDHcyZo16X8lr?=
 =?us-ascii?Q?UjLIb6tVAWIZSXsz6IJuvUeN5MsocAgLnzck+y6OzzJObfRMPHL9v7FlH4Zl?=
 =?us-ascii?Q?yygF8EDwS4ppvgrczcGg6pvplBOobeJxU61qeLyoD7A/fjNxnskbdqFd7Rec?=
 =?us-ascii?Q?DQ56M5YEUyyj5tL07zQ7Nr95gG4/x5v+/IOXCe6m0zE2AjUO67l13Qv+b6gH?=
 =?us-ascii?Q?OadBL9C2uoGXy/kKGGd+b2bWlKxvohsAs70GNs/OxQhXNT/pHYlj0L/kwfgs?=
 =?us-ascii?Q?GipzzK1dexcCGw/etSfLimMDZ1fbjKwwK70Tao2p3yMvgy4YAd1yNDRxYTqs?=
 =?us-ascii?Q?2o8aZH5wKb1rxda27aOaatj1NgQt6Q6NvujFQDtY0zZoRVAOqcocDruWj9wM?=
 =?us-ascii?Q?NLeSE7w1k0lCdnsgiGsrDuDTOLiUmHR89FihBhvrAOncN3i/kt8aIoz5X4kX?=
 =?us-ascii?Q?BreYFLYBQWHWBqSAnaInkp6W5BTRhzUvOJxC1b4mbNZULJdd4KQe7QH1vAI/?=
 =?us-ascii?Q?rNjVvKXSjP4Po2O+QWiPYIxAiHntI/JGv/1vyTJkuqHYXlIuGiCRnqX+How/?=
 =?us-ascii?Q?n/rTCinrMHLbLnG+8YfbednC0OfaEYLyxbLdxGe1ujgUIuJ0PdDFR9nm81IO?=
 =?us-ascii?Q?XACfWzDx7YxJavbztdGdk+s2vb5LNppl0dTGX2abmhq6kfnv6d2oMehqIyFK?=
 =?us-ascii?Q?P2o1RIIIRduelQDhMxnjqEWpgcBTHzBKTOggaeMl5yrcTJiUGM7Jh0eWWH8Z?=
 =?us-ascii?Q?IfiaLrH5pMJnmEW55XH36qGcIYjrEnKCfMUftKwlsrR0MHDboH08hiYaJmop?=
 =?us-ascii?Q?pkKN0/IY3+Ym85ao6VPDAoXGZ1HKxqKDzuYV0Svd3aYs2icG9nvjwYkRoAJ3?=
 =?us-ascii?Q?VMcqbTUGcp00fqYoMdN0/8wFN9QrqQQHodfQWK7967YQ0r7Co6wPL4D2A1nx?=
 =?us-ascii?Q?vWZml2NMtvoqo7RK7Brad8eziGuCG+6RMIghpB0LEpxQcAVHEU+usxILUhoJ?=
 =?us-ascii?Q?/Odczj7NqkLK66st5Y1EgM+MCb6ZzLsfDP2QYsC9qmAFLOdcq5v8g0+3rVTh?=
 =?us-ascii?Q?4ZVbHk0HoYcZvTLHaAjHo2cUr7XgJLn8Fedkb/6yl9sPY7zZ7Op63SH15O/A?=
 =?us-ascii?Q?+4nT92iFZK6cD/8mm/aBhxDUr6lFvxlcy0iJA1w1XJArbTv9v3ADei2lNpl0?=
 =?us-ascii?Q?mM0HnlBKoLj+Qu7dXSKZR9dF4uzLTBgMX/2okEHf8/psLIzgdAnw5PJicIbc?=
 =?us-ascii?Q?RcP/gUSbHqfhuyEI3mUXCfNOi/PnfkN6T3Qb12AIZQm/lEu82F2vyikhDsAK?=
 =?us-ascii?Q?/e5aHZyZKEmnAe3e/XUEMBsrhZK4x+IE1Bq2BmcykCfr0jL6+2MGQiBRtBSH?=
 =?us-ascii?Q?zkl0iyD6ZMhDzyI2eFBlUo0LbLumBrBx?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR10MB5338.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0uZKF9fQyqXtyYreQu7Ny8/fAn3+wObeMxz/o3ly/H68LzUmImgEc0ajcV7X?=
 =?us-ascii?Q?Dzy68g5LbQfaBatWuUx/3TTfcL+MyLRJTkfTfcgu6to+X0Vwg+0WZq5+uqYS?=
 =?us-ascii?Q?qxinsh0oeEms68S8aGSA2TI6rov2rv1cP1si0eBDxA1Q4aG34ucBx6hB9LAN?=
 =?us-ascii?Q?mU/Ew9Mms7Xti89KRhSWyyLkXgjEU+ELCDPVEVcjD99W1asVVXouqUWEV26n?=
 =?us-ascii?Q?U2eXdHMyLR9Ap380SAnbv7N24pLDewkDJ/UkDiYnKRjsjUCfmyeG4ZQfX+Sf?=
 =?us-ascii?Q?Z3tXon4ITzcJXV2xDd0ufMvE0Pyd7vOCU51V4xvb5m+estmN62qfMy8r2/9L?=
 =?us-ascii?Q?TcuglFCfM+vGo8qTg/9KgDimMJNMlLHlfxdZ4SuHZb1Dxu4BnRO37CX3jhFR?=
 =?us-ascii?Q?ANATqipn7dJIKVgfAgGFhaQ7DWVkHvb7qbCFZmK3LqzmGlrBZbtOvwhVzxbR?=
 =?us-ascii?Q?Cme2eCtXkSPhu+EBoeigAZ3BR4LwascWB0oaXP04nBGcjsYhn9Jvi03gwycQ?=
 =?us-ascii?Q?OD0a1LR5SFGmbj5+3QzlSANBlpSGycfuPjZiUAUgdl8P/Snu5AZDcDDHRI3K?=
 =?us-ascii?Q?qyH5Pipe4pm8PuQ1fsonLMX43J49jjsvkcLf3PrVTGzZc3u9bgI33DqFMkCz?=
 =?us-ascii?Q?UyfoqtuGeoOwtzZVUrBQhgIeGXWyefzleeHR/vyv9Jezn7LLgk+t8jmjX+aL?=
 =?us-ascii?Q?y36U0X54IEJuryXwKDWGvqKiSLE1t6DyWyoPAQ2Ltv94rAbaIuC0I37dQ3JA?=
 =?us-ascii?Q?e1qHBKnAJsqeXy8gRItH7gMZQTNSxOBgFVs5KuUa62Od9s4ryo7dnESbHbjz?=
 =?us-ascii?Q?+BaVkDGDI8ciwY/KppsRk2v4Z/DDgV7Jof5VTismKUVb8OZH0+XOZnD3nDa9?=
 =?us-ascii?Q?FkTRrEWMr9au3s19kjwLgiLVnGkS1lbqWJTCBp+NBm6gbRsGJ0JN5xWF4IG/?=
 =?us-ascii?Q?mPfhcLvyC8d5AmA2ZEIKibNWB3VVzHnVchdWMxMY26+ff7S1M+X3bYdNpWol?=
 =?us-ascii?Q?5PK8AJ8w4ztTkxwU1XSbPwJxQxComGeX2H7+T507C1kif2Bjw9EoOaFS9GeW?=
 =?us-ascii?Q?xM/pW8saBg2sXjyw8iK10tSS2kit8wHkp9W98NoZqhKwD1Ef+5ZkQ5rsrkyV?=
 =?us-ascii?Q?cKiKlhej7gx05QNVOEjrG6/EB8Js0KKgTaTnaQFIBhYGkMnIghW89l3N02yI?=
 =?us-ascii?Q?yDXZKr6rh0r5wPfcQ9hr5pr+6cfwKs/LeVQyfuBQgrqjN1olcLzBjwFImXDh?=
 =?us-ascii?Q?cwLz4DvCHc07pJKH1tTd3NCZsSOV24Dpl1MTQchZp3AL2cveE2ViE7Tna96L?=
 =?us-ascii?Q?CnYYBmWoiMb1Vpty7w4jwO7SNwbMcmr3l59/WhMo9g6T/HyLBw1TZxn2LloI?=
 =?us-ascii?Q?8vsrsW626Qn6AP1MonM9YASTINt0GVUFS6jKTzSGB0Rp5lPHeAR/oF8I4EgQ?=
 =?us-ascii?Q?wUMMH3iaSVWsvpbEJvoVl1XAwrQOieUJYDr6nrpXCd5S/I/o4tjoF8GfY9WF?=
 =?us-ascii?Q?Sfl88vFbTzAcBG6oem64dGo5rdroyYD4tnha2fRZgWzTD8GuYiCIV+bgAGsH?=
 =?us-ascii?Q?vCAlj08h4kKQaT6Vuu4D99FOUcQez4khBjSakBEjAH4OJSi+Z6ErN7Tn6xSu?=
 =?us-ascii?Q?AQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	G0uKiCcAzPXjHUFytuOK8guUN1R0KkfVnrrHQD+grcXa27Q6gvRlq1OGViLRgQIDHcT5roFouMJ7eRIpX2VR/91HKoeudIU1aIwm3uj6KbRz0rBjDLQNZCO3YGUvO2CO/bqiXXlOYmoxXLpWnaxJFe80hluu7G3AOq9bYDfs8yJiYkks6agH6aCc0IOkcK9Ylu02lfsfwD4Q0WhH+YcfR8h5IjDVByrAGEXPX8NdcP0exeQBJA2wyE5JufGLEKwug7od60lh2d2Uw5h0sbbjRxvwwHxWFrw0mr4flbFbNZn4OobvPR712qgE3DNzKdopTRvdIqSLbB7E9neQtp1tJ9O6Nj9oCktQ+4A+hpQVOvH8sTWn/88+2FGByN/njlEN01OyoNka7pZoQZnarYvpapMM91msWDj5Oxr3rJxYG2y+cA3Fc+wVJ6c2CkhAD4XpepPEfwgG1Vji3F/egln1iruBXE56kOz1cmCIMPp0kQN9lwJAwHCWWOCrD6ts865uO5PhR/BqWWoMCDfG6zW+eCiZexnPVGD40veKGaMU6WPfofEtNOMcn+q+AecXWSkDRp5NFc83DZ0DH9xZZj3yAhCKUJVVatwkCLiL9Pw8DOQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01529acf-9c10-427d-c8fb-08de0b95ea72
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5338.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 02:52:44.6465
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: owzEz1qPp7YbfVypmgc9tT+9FW8130OoHNzzdmwknDkR8YegEsi33OZ/2d288Ow08Y5gnJQYMM4lMq0V5l82aDNnDzym5KbCNkjcDFpUdXI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6128
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0 phishscore=0
 adultscore=0 malwarescore=0 mlxscore=0 mlxlogscore=868 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510020000
 definitions=main-2510150019
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEyMDA1MSBTYWx0ZWRfXz16SnBE5EldS
 NYNCqNDetb844NVv6AqLtSkES94jsEYsUWeftCiEe+uWY3OTkUuzEMhXzA1LRWOSIP0JmbC+YRi
 5Rq6FIAMouPHSgwOOtxBbRdEFqGH/2UjF0jiypSq4b3fTV5AaWUoat9p26UUrqDOycrWlFH82o7
 OY8BvwlpNdTGU2SOHo/e3gDHtsANbasU+JHMtaI5cFALOd8p5t48IzHr15OtdG5SK7YyoJnFV+Q
 MUdgkXXM5k03XPE1WP4OBFkPJxVwkyTfVl/kN6fz2krGztYdG4iWBNIs7gIQCCfwf4yvK07AQEP
 Fi1KdOVGGbANJ9pvifk1u21u1IHqIvmDO2DVJLN57sJh3wMNYJHGdV6Au43oWFESnJQjvl9YOfO
 SkmMrIVDhKG7dCLkGYVILdF3/jBDTaFZT0ATl7VqS/igfahzLio=
X-Proofpoint-GUID: zAS18ujJPl-MJXybPEuUhwJrKmF6rqiV
X-Proofpoint-ORIG-GUID: zAS18ujJPl-MJXybPEuUhwJrKmF6rqiV
X-Authority-Analysis: v=2.4 cv=GL0F0+NK c=1 sm=1 tr=0 ts=68ef0c82 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8
 a=djbI8574pA3KiFL2uN0A:9 cc=ntf awl=host:12092


Hi Konstantin!

> "b4 dig -c [commitish] --all-series" will now try to find all the
> series where that patch belongs and try to get you links to all prior
> revisions, even if they don't have that very patch (e.g. because it
> only appeared in v3).

There is some funky stuff going on with the date range limit. b4 dig
currently misses some messages for which the patch-id can be queried on
lore:

    ecode, out = b4.git_run_command(
        topdir, ['show', '--no-patch', '--format=%as %ae %s', commit],
    )

The resulting %as cdate will be in the format "2025-10-07". However,
specifying a query date limit of "rt:..2025-10-07" means the patch mail
will be missed:

    Full query: patchid:3c67a3033590c511bc96819aa2fdc6376c2799e1 AND rt:..2025-10-07 (nocache=False)
    Grabbing search results from lore.kernel.org
    Nothing matching that query.

Whereas my own script finds it:

    $ check-lore 3c67a3033590c511bc96819aa2fdc6376c2799e1
    Found 3c67a3033590c511bc96819aa2fdc6376c2799e1 on lore.kernel.org

Bumping the cdate to 2025-10-08 makes b4 dig find the message.

I don't know anything about Xapian and how it indexes. But I assume
there might be some fun with time zones and DST lurking here...

-- 
Martin K. Petersen
