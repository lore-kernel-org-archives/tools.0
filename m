Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C1D22259D
	for <tools@linux.kernel.org>; Wed, 15 Oct 2025 17:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=10.30.226.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760549853; cv=fail; b=FlmDm+3QCDf08ndqGngsiQqdEseFpIrvECvob0oyrgxdN+raCur2hOLiC5DPGqZGXetp5XskiLaaTqigRT45PBJnmmh+CXAZj5tvOZl38pcJcJqXff3Q3vagPmfpY5cLtVM8gL3ISDUJQlgwNob/7HBb1V8huYCHXyEEudhIBhY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760549853; c=relaxed/simple;
	bh=wgdhA6G6pFp+vUhjE3zNv9eNLqc1CsUreQbAZB5z5bQ=;
	h=To:Cc:Subject:From:In-Reply-To:Message-ID:References:Date:
	 Content-Type:MIME-Version; b=egMV/RioaM6M4fVzFMe4NGbqmB3YNNjFmcbSod46o4d339NwlYvWpxfZKv9o5A9koDdbPKMuzaysUVedRq9UVvA8s/OIryLz3gIt/GI1gXOkox1LiZN8VPit+1JMmArsfdPChgrSUyak2JLspcKnVKKb8i5VzyvkotDgfIZwPLo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=bcRi9nFf; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=dANlaOV2; arc=fail smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="bcRi9nFf";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="dANlaOV2"
Received: by smtp.kernel.org (Postfix)
	id 070F6C4CEFB; Wed, 15 Oct 2025 17:37:33 +0000 (UTC)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2FF08C4CEF8;
	Wed, 15 Oct 2025 17:37:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2FF08C4CEF8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59FGCDhH015748;
	Wed, 15 Oct 2025 17:37:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=USYLsd3S79DaVlrFnE
	7AG9+m3eHi1KKGs9ThbVsbxD0=; b=bcRi9nFfHlxe0uLlC1f1aX8ZCrXjFUvG10
	lejQ8HOTyh7o5lr2QVTsq8VsWchdFOjdVCK2l+zHzZaFvsWWn6NWm+aBkdeIdWTv
	UY3ArfRt3ZLBilzUbbp+R3+L1GZg4yjdPddoTEHdgbWXgnj7a5Lz/o7o6k1cU70W
	rIZhMSx4czEDzBlQtOWsn5HpXVERRJVQ8nf76y/CoCvp1FePpapZXBdLc2YoeltF
	47OsF7FlCCoq23sozNZ+/bAoc28WITt2tvoCCozQC6Xl6sEDytCvNsOUx4VP90vy
	p1URCKE0Wv4proNhv4gESrOHNS8FtGJBiuSnu4hQ1LM9e8GBqBxg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49qe59f67c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 15 Oct 2025 17:37:31 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59FH9HP0037209;
	Wed, 15 Oct 2025 17:37:30 GMT
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011021.outbound.protection.outlook.com [40.107.208.21])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49qdpan6j9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 15 Oct 2025 17:37:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cfZxt8dv5W1Rlkz9bmNgLhYPSgFslcxpc6iRgb9yyPLywNiuWhLxY4d5G0ycvFlF1MO8VXaNs8UbGDlw3+lBmiRcu7+bEGOMI+utszTHjqTKorHgaEukJx53a+/597ts1O3bXkguT6y6rUDD8kLiuY5nkPV8QPHuzyqNu3Y/1tncIiTuntY++AbP8cbNAMzCX/MdLMQTfe5krJg1zn7AvGWE1PfwKE7bBAUwBl7YDXb/nZ3ok+pYP8vBS4PnWStRHpHYVEmcua8vD4a5PDv/l4vrvpY6OJgO/GTE5lb2bGKPoeJjig553xdQU+m6hZW0GNQq6g0pOnc1MX/LGMZdgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=USYLsd3S79DaVlrFnE7AG9+m3eHi1KKGs9ThbVsbxD0=;
 b=E3TyaiFlPp7vBD/A0Dupveypzw829j+m7pWwLVo88UkaVZ3YiK6sa3U5zy6PsYO0KCwUdjRN4slPi+H9N7Wg1lodyiUPCLb+HySUkIO0SijouUee532KHEclRXx/6bTjjQduf9nAKt+NPgp8pgFEgMwo+mHYlDUAHyiIqwUHljS5IevsSbC1d5+TF3tondl1WRs1e0NFwrAgGt2T7/TQC4csUy4n3GeD0DiAF8ls73lpeAptTBVF0+ohHOHzCliPJdg8j4enLHQAP8q4+SeFvUGXprNpDSh7y29zrcaiIiJbt+kadCGlqCcmGoVR2m5u7Lb89A0LCoruZksSynus9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=USYLsd3S79DaVlrFnE7AG9+m3eHi1KKGs9ThbVsbxD0=;
 b=dANlaOV29e1GBgO9YC+tXEJiKJc6YkF1kiPr6kF7MJ1Yl7BB/0JO9CA+W1y/+Jp8q0kdiMSf/1U6w6a7HvN9SP4jE8prQqfxufT9mNLZH+KM0j3alW2jALXDknPem87Fym3zwehEF0RcS7Kmjf7umNwJVq8C9BaLxaq2oq+We9w=
Received: from CH0PR10MB5338.namprd10.prod.outlook.com (2603:10b6:610:cb::8)
 by IA1PR10MB7358.namprd10.prod.outlook.com (2603:10b6:208:3fa::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Wed, 15 Oct
 2025 17:37:28 +0000
Received: from CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::5cca:2bcc:cedb:d9bf]) by CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::5cca:2bcc:cedb:d9bf%6]) with mapi id 15.20.9228.012; Wed, 15 Oct 2025
 17:37:27 +0000
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>, users@kernel.org,
        tools@kernel.org
Subject: Re: [b4] initial "b4 dig" to supplant Link: trailers
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <20251015-screeching-porcelain-chupacabra-4d8c0a@lemur>
	(Konstantin Ryabitsev's message of "Wed, 15 Oct 2025 09:43:00 -0400")
Organization: Oracle Corporation
Message-ID: <yq1ecr49ien.fsf@ca-mkp.ca.oracle.com>
References: <20251010-muscular-camel-of-acumen-00eeaf@lemur>
	<20251014-gorgeous-cougar-of-endeavor-0c5baa@lemur>
	<yq1347kc3bu.fsf@ca-mkp.ca.oracle.com>
	<20251015-screeching-porcelain-chupacabra-4d8c0a@lemur>
Date: Wed, 15 Oct 2025 13:37:25 -0400
Content-Type: text/plain
X-ClientProxiedBy: YQBPR0101CA0140.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:e::13) To CH0PR10MB5338.namprd10.prod.outlook.com
 (2603:10b6:610:cb::8)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR10MB5338:EE_|IA1PR10MB7358:EE_
X-MS-Office365-Filtering-Correlation-Id: 43947681-2296-40e7-2e48-08de0c118291
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WTvI6FlaQCRqfZL9cHqVK19Knv2JC5ZYWySWqBksx3NGiwKRglPNBnIdcVvR?=
 =?us-ascii?Q?nXkknEIe+j31YgBMXYHXWRQ78VlQQwDGNJmWZ7lrilF8BkvunfrV8Pxl/dmk?=
 =?us-ascii?Q?3CcDxt272RGI/iFk1ySnujuo6cak9EBurnLBIKB9KTRMpEhlqaSCUabUlVNR?=
 =?us-ascii?Q?PHJnJZg/ZcMjK+pgetPok5mKHikJFy6JAEW7oIWUV+fUP3X7BxbZNqvqS8ed?=
 =?us-ascii?Q?YbraXb9lERZcaApkWczpmk1UMWq3qJq3AVa25WSRMgDdjpxhbRaT3Ul+27qV?=
 =?us-ascii?Q?KyWBl1hqiNnvNEul09tJq28/k7rSOpeEmrnFIyW3UU97+ZU3PaRC3T1a0Xun?=
 =?us-ascii?Q?Q0g9JHZetFUT9hsp1lvT4TWaJgRx0D+8cSA1+1PrUmudmNOEwmw69YAhUoMy?=
 =?us-ascii?Q?CnYE31EAVnQEbikBcZpAG00XORdyTZiFy6sVxxeAe3RUkUH34hcBt4YCM+/b?=
 =?us-ascii?Q?nJzCHpI5iAVVyqhPCFMyTc6VHjR7UhanrFwyA2UuC5SprPi7jEJ/JrQabgj3?=
 =?us-ascii?Q?u2PCjlnGl4y/eK2dMN7+SfwM0nmm6JdNVZ93a5SxQpqcDiTDB4MveAhthukq?=
 =?us-ascii?Q?557mKWq9hdcHuCQOsUoSM9KM/1FDtBvOBoV1HsbgYDLYmGVkYyYf99DNm1pN?=
 =?us-ascii?Q?l8ciSUbJHDwkj9o2ws/CFoPu+8eZCitnTolrLfi1Wny+H7rTPwWcQOkoQMBe?=
 =?us-ascii?Q?2tBoPAenCf4HIjvHIsNbIhezG9Eb+WHx9M/HnngHV1wavAhwQ+kwa4Vf+crN?=
 =?us-ascii?Q?JyCYkgomRoRFqdEAlSAEcFzhJN3F+WYIobjRF6o17t0zCLW1Bkwh1WL8MiEs?=
 =?us-ascii?Q?hCWmD1/NmEC9cmoA0w1QbDAo/AZuc9klZOD8MDJCbAY3OHHy0DdxhNIuJtWl?=
 =?us-ascii?Q?0hWi380Wh+ju6RIFbAjK49MiiQN0JLpC5gB/rmTtJhkquC6C33FkZt7GDE8m?=
 =?us-ascii?Q?H4XnVZRXpm/mP38oRFltjnUkzNQPDl3P9WIVutPHmn/Tn/s+H+tdDbozHZlj?=
 =?us-ascii?Q?0bztt39QGxQSq/NnnIztdipWZtreBZwyCcDC02l0OuwYkqqJJ3y/dEHP11lp?=
 =?us-ascii?Q?+azuTjl7HQCLtEY0XssMes0h59DdGiiRv2fsb7TXM9vt26ag6pBIYqSkL93l?=
 =?us-ascii?Q?Rmp5GVDhtWSHrdRPdg8Jf15qBpbLtrbolOSqqd9NoFeWJQYExhFhHRjeudb5?=
 =?us-ascii?Q?dn0mWm/mSCNBwzCKOznaMnt2H8txxJo2+1R4+OrgK0PFXne2sDcsciEqQw1/?=
 =?us-ascii?Q?pNUeY7ifMmHLRlxHB0S6fHopAkt1XxwEZoNVsF765CSR319q+GS/WS1mgNg5?=
 =?us-ascii?Q?kzNATlb45vdWCl1AGDUuOTf7GSshfR6GFe8rf4lSSmJ3ApsIr5Kq/Vus3BOQ?=
 =?us-ascii?Q?sAioOIbd6kMDNue9WUIwjwlN34AiMFdp1OXVjOiO3kt83rgO/bGHQmvB9KMM?=
 =?us-ascii?Q?iMf44+n7SYHxjvjlKcp6D4fj/+UOJcLj?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR10MB5338.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+cASs+vtIppIcuAqFPNGOWN9bBppQdolrNDALa8ivVu+G5l7SBz2Rv5e9SQO?=
 =?us-ascii?Q?sM+oIHIvBaMib1rcVSTDyt6AWa5SaMZitrh0XSv910YsVnmtONqbFbLb5vFh?=
 =?us-ascii?Q?HBVQRbJaWU5tSmSw0IShCnVIx3vkfk/oScQ9kmYsc8/oEe/TIUjjsbl4U2zJ?=
 =?us-ascii?Q?nFarcgKiNwrcGvD8fuh1Kg1NMUnu4hlr9jJpVQC2DwbL5jfdXlrmS0pMPoml?=
 =?us-ascii?Q?2RtkHKX094HBOb5IVIzexPrO82I1aDQwA+ULaAKzV+98yPeK7koc53VInNrk?=
 =?us-ascii?Q?+7ZCM5v8/r6zEQW07JQV6qojSYRMiKmxeL1a+HiLCbbEohT/CK+aeniCmymi?=
 =?us-ascii?Q?yMuqbrFuNOBnootDcxh2o2ZA7noN4W7xK8o8dX2hF/bg4NgV2rYZIq/NTDSf?=
 =?us-ascii?Q?X26WWx1rBJSdV9/Oc6NWdst7K3OQ82n8xX1Les2hx1T5vkUWKUSVljVGuoe7?=
 =?us-ascii?Q?ykgw5bOPGXICFx+O4M4DjFaNGPJ68MBO8+CWMKtA7RbUU/U8uhEkmbWK9IP6?=
 =?us-ascii?Q?2GT4t2Mxc5BphQ8S/lJhUoi+PT6neN8rQV2xrKzVo+pBwnvA7AZ7Nl35ArlM?=
 =?us-ascii?Q?Cft+Gp6srHcDuezcf21eu4bmlhLqFw0/eq77FxKWQDYKHEiCl7HDDRaHqSf2?=
 =?us-ascii?Q?461HGym+D2mupNrFbkSALaK/6PqSmrgx6joXerrxhKfbdGIg2Hwftei1iFLz?=
 =?us-ascii?Q?WMLjPoJuTxRnsEU2XMciOrpDJYGX6Xt8qye7SRsZJ1S2yoS9052E/Al+He7q?=
 =?us-ascii?Q?ke8mmLAHk61jRKWkJfm4mE68BOKRTwNvDGDIw2LpCOwnXNEH345pYyKSulEp?=
 =?us-ascii?Q?yZ8cLQVbi7+1eq9Rgv+z5O+fmUsvGG/p8/YLGsrnsmfyOKURo4Q34gIeKG1M?=
 =?us-ascii?Q?2rzeEMCEqSnSuCrHBxaAS13P7dVz3oK0imPaBsNloIwBu27rHpxo3waZ9kuc?=
 =?us-ascii?Q?xQPh394zDPaVYC415REmFKmRP2693P0hm1vzvxzSz32XlM4RmKgIkAkycoty?=
 =?us-ascii?Q?iRdAJ/pb0BPQ/a4ajwyPWOHKHm7U2k/1sSCaAerGlupE3wwdSHU3WZPvTk+f?=
 =?us-ascii?Q?XZay3XQYs/5RBPeqjCB3WD9WReRxlkbJggUyQPoCuxUQ9Fq/RcrlR1NBQl7c?=
 =?us-ascii?Q?0qyEPc64QLpe1UETP6Gz/k/yn2k+mvheAViaHUcsBm5UjwZV0TUUg6VEM74b?=
 =?us-ascii?Q?Gh4S12LmEF/MQy6YIIkZNEetzlJA829FyDU3C/mItNwevgXjlRgoprZm2LMx?=
 =?us-ascii?Q?98dzociAqNvbkuhp54RI9ighHgbIXwkj8jYgNwAHyiINPnhTUQOtXMtsmeir?=
 =?us-ascii?Q?aiX1wxADYItXkqfsOlPSHsaH51e/WZY/c/v6zHIvIeFrTRDSj7JIsC1V4p+U?=
 =?us-ascii?Q?vEcS4c5WNofcg4oKJMGqF9n+X3Hf/DYkbih3hDCyoJAyNYEaXQ+IQU0NtC4w?=
 =?us-ascii?Q?bEzD7bwaMkKbUt/bxsxS8CUaTXgkPO8ITs8ycCWijqQFU1N+qwEqVzgXs2D0?=
 =?us-ascii?Q?845vhK7rm55pHhMgeg+Uo9n6n2SzBGCXrYJrXub2MHrpMQC7H8E0nouaz5pl?=
 =?us-ascii?Q?5tkFSn0/TroSVw6MldKkZ3Eaefr1n66kJSS3OoQ22ZX1rASkiTc1drmjRu4R?=
 =?us-ascii?Q?iA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	g/GQY7ToS+Y7xhs1a9dihtFO4HpdWeciPB5E0OCCqD1zGhijxx47Nb5+qEgOrVNGZbaB6aFqQ+WppkmV6HyR2Cu/9QK1nvTJTTCrqhTW1QcJhTED8lWew6BUC+WmXOvY5uWS0KzLo00g9MHN/bMetf4PC9bTNNPvKfH74XpjgIftcIe7eRSKiUxbFIWt6drR8Ey5zpbIpu0xkXWm+qNogD6OYX3GS3OwugjSBxNSI7DZWnX3gSI5Qb8tEbKUi2qVN1zu6nppGp3L0VKloYZSv5zrBKWfSnb+ITGILhUGeq8Rvunq7vq/lRmWbZ33CCANUSIxPvclAOXBwdB3QJYeWvu64bGRA0o23bijSyaPaQOWVEORQu43z+uzgjqUw7bDqun78jta+aM9eHZJTIZ9yTbQ+sHGbSj+vw+6KunNxM1zmnAjN1dckDJxq2Qe3WBfuJJVcx5IljmDfj6vAxO65QIZo+LlmvszzkXG0CFrXGZjq1DqELix5hju1e24kPHivPfLd3ovtDbekBydq13zAm5KuxA4gTkSUkJ83uqHyQsAhUUpJygBmj0CnOnOQOU61h8DnSP3Ymjf6/KPxD1CFqqt4N/BvE7112d+qai+3UI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43947681-2296-40e7-2e48-08de0c118291
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5338.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 17:37:27.9014
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PiZy2ZbNCUPWKLAPabi3ksl01CdCFS7OUuWY7/V7r5LEy9JInsI0sBc8Uw4j/1ULy4NKf1NoyUMjdVFhFKELSlJH+jkFiI5Dcp+v3E7XFD4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7358
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 mlxscore=0
 adultscore=0 phishscore=0 bulkscore=0 mlxlogscore=812 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510020000
 definitions=main-2510150128
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxMCBTYWx0ZWRfX+87xI/DrnmP0
 vjvAmEhoqZWFBvsSJ6a+mFd8FubgmCTdmv9NpHDG7OzUKVCLeLPL2fqNtSkISk7a2WKuWw/zSKO
 qRRrYvQVnov2Jh5w38AX6MYFAESzcXMr+eTNN+qTVl4gJ38zRMgZDIqufrRKAXPnawPg5i1dWJn
 wkyzg8jHo0YA7fkVqJY8KakzjG8FTY546K4K/WMIi2qPzqyFC/yqZAqCoZRt9PYciHXqgw0dm0V
 vR+BFq1UL8K1IaDPwb8drgonM07AVkqolYXwBc64DaTrAupw9yERD735WtlRprMrlF26AKnCpPP
 QZC4XlLj5IepyggpgvqYZl9E7lqXTMP9wMie5TFJhxPsuGmzBTjdMZuBT1QSDleq/OE2jxYXaIV
 gUHL9rj6h2qNJJ+E07gclBqOKSPVow==
X-Authority-Analysis: v=2.4 cv=V7JwEOni c=1 sm=1 tr=0 ts=68efdbdb cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=wQJ2yKgQHJ1vOrS6vvYA:9
X-Proofpoint-ORIG-GUID: GgndnWnSs6uIZfRjUJ06DKyekGgBHGSZ
X-Proofpoint-GUID: GgndnWnSs6uIZfRjUJ06DKyekGgBHGSZ


Hi Konstantin!

>> I don't know anything about Xapian and how it indexes. But I assume
>> there might be some fun with time zones and DST lurking here...
>
> Yes, this is probably what's going on. I tweaked the filtering to add
> 24 hours to the author date just so we don't bump into timezone
> shenanigans.

OK. That fixed some of my false negatives.

Thanks!

-- 
Martin K. Petersen
