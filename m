Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95ED4450415
	for <tools@linux.kernel.org>; Fri, 28 Aug 2026 15:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=100.103.45.18
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787929665; cv=fail; b=A2BHjrT2v4x3pv3tHjWTX3yjTObyOoqD7wCO8W7/TJ7dzFizIDbmdm0k2vqREtQTf1tpadWNrqTeB4LHg9BSPhBfz5PYA36jLsuKjVQtgY4IIFwTQB4SR+O8Cm99hGzjRcPkVlen8zIGXd3cC3UBUICzv4iU+SpyGyeJqWSHETo=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787929665; c=relaxed/simple;
	bh=Yx4BhS1lVfJxeTuK9oaAO6rwC1zgnOcTME2YGqbIoSQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=UF/QBga8JNzYWTNbdRrIqYQgyIy8loXWLORPywgtmv2KCAQas9owfqgigKWYlHbAntnxzQblIjcBb/VAGwXxYqUEffgd/qGvV4yPaJQys79H09ZQ9wu37CkSBVFVFVXnQ2NDe8I/YyH902B3zvtIbWWGEEmOoo7HlY0JYE4DhX4=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=tk8D+QeW; arc=fail smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="tk8D+QeW"
Received: by smtp.kernel.org (Postfix)
	id 3736B1F00A3D; Fri, 28 Aug 2026 15:07:43 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.77
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1787929663;
	b=txOLb0Dmn+nO3k8dV6BwAIbI4eFs3AFFlY7a808Okxr66mfPyuNmpE5h0l03vj8+uRa6
	 Pl15hsLBdpdd1BcNPO4jeDlllD8zWESjrJUdkopQRPuR+9LW/HqK5fva78rksSOWFbCxX
	 Iz5LESx1+PN5jQf9bjnIYvtmCKHwZeM4oRB1HWPqnQmtRlNLJXq6hvCgckEJUV4iWRZwb
	 hxlZXl2upvEJKjzowTUMypsrh4VtP0gFUdQOBFM7JlHnlaqCdVTUr8wntNrq30NGNFDcB
	 2aAuyY/AVLeMcvQZRN775FZiUmSBJN7y3xpU2/lGvp3/JYN2B6Mxgwb1gFEeNZQnu2Q==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1787929663;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
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
	bh=eahyIHUf2pw5bMzP5M8smB/pIQsA4rcCHBjO3+u3GUA=;
	b=wFjZj+Ek1d+auu3Modi8jtPYIwe1Levac0dCuA7bJzEFAdTtUrEf57V2+vREfF9lVz1I
	 WeilBnZzL4mxqNioWoYkmqfVD3Z04r7nk/CA6u3VHHDhkF7XqDuloeJDSyumQp4J0qdc7
	 SPhUdJfegBEkn+DMrsKiEsz1+sJ7mv2zAK9NHJ8BMH45NChnnjxtYkHh6bWFouhxBKvTA
	 /tz/Wt4O6s7DL7qgJQbhb6yWuUjDqD0H6AnOfAv7PCq8vD0wIBOihCwRMKFaGiM0ZudE0
	 M193VgHkMClOZMY2YMY0S7nMTmrT3ZI+JDTLjgLWcQZkBiNn/bSgK6LNtKX8eXlNjQQ==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=virtuozzo.com header.i=@virtuozzo.com header.a=rsa-sha256 header.s=selector2 header.b=tk8D+QeW;
	dmarc=pass header.from=virtuozzo.com;
	spf=pass smtp.mailfrom=virtuozzo.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.77
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11023077.outbound.protection.outlook.com [52.101.83.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1BCC21F000E9
	for <tools@kernel.org>; Fri, 28 Aug 2026 15:07:41 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=virtuozzo.com header.i=@virtuozzo.com header.a=rsa-sha256 header.s=selector2 header.b=tk8D+QeW
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 1BCC21F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EbgwZxou+jz49vpEwIHqSuKGVXj31ESFQvFY9bOetVzL8w3PkNKib0cNE8jrRScgcVhuf8hyOESXEbIqSSNBvp1TPG1MvWSt3zhc+kdhx5Y/o0h6b/8e0tv/yxvaT72ehxXb07grGzNLbVa+22DeFjB5xKm4JGRg7HT/1iEAm/9FChbAQm/u8QeJu4xWWyor2nVk/jEhVuUNsVtrijCAMReReh+KWvQ4tqQSgC6H9E/L+yVShiqdW9tX1dvSkWNSKgwqTtC5XeWRXn2qt4rIAQWB1eDh63lGSpKZ8SCsZp/+GQ42+olIshI+7gkK0JGj+OqppscIcqvHaKgzafRMsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eahyIHUf2pw5bMzP5M8smB/pIQsA4rcCHBjO3+u3GUA=;
 b=yyzj83WqJzjVLF2oY4dxJNaBNLhb+/QPOUcbrrhMrxEQUlh+jTX8J3lPFnZxWdIe5NBY9jugk5KbYkTqOW8bEbIvmZ+xZVHzdEhb5y+Uqx32H574w7Zh1veMkcFrjzKiwaCgS+NTT8SRszOQZtIfBA1pvaHzPa8IP9a66OjM1Ypt9E3ZhNPGVU2+BEraCFixdRWG5sfxfmPQsoA81NdsQW+xZg2AdGrpg0FZ7l3gxHiGnTXFMtLDH21ZQNlVtwUP82iqrWH8XrrasLaxe34ntt6Is7SGAE3vYYeu9eyR95VGD9zt4EytymonQ0qHTGS3+A6pdYBx2CPpKzEReo5T0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eahyIHUf2pw5bMzP5M8smB/pIQsA4rcCHBjO3+u3GUA=;
 b=tk8D+QeWtrGJd1sxlMDG1war8vcvQuUrovi4f7VV+10eLGsSg8LY284IzKxo46PGYGJY5VSfCHjmtCUGtA7pMeZMdgLK6nwo9C5/HwmJiePoNkL+0FcbHHXZgF5dXzvFACK30F4/AtnxO6h9O/q+wBK4zOutD1hRYipPyWpH46kCHgmdf03VWhGvdvfBR24K8rtIQ+aLmhj5R63ItNiayuG2Ry1A/XBc0ZUL01RmpIid3VVVCHJmfjeb2gUCmbJ2sy2lrpyG+sV/cdVPIlc/zr7AydxQsIAy9/5ZjDkX1RKcxCj8as1qOBV8f5aoAiJC9cwPePDfLak0I6jSvGjpxw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6942.eurprd08.prod.outlook.com (2603:10a6:102:15d::17)
 by GV1PR08MB11180.eurprd08.prod.outlook.com (2603:10a6:150:1f4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.7; Fri, 28 Aug
 2026 15:07:36 +0000
Received: from PAXPR08MB6942.eurprd08.prod.outlook.com
 ([fe80::fe53:d5e4:a1c8:61e6]) by PAXPR08MB6942.eurprd08.prod.outlook.com
 ([fe80::fe53:d5e4:a1c8:61e6%5]) with mapi id 15.21.0382.007; Fri, 28 Aug 2026
 15:07:36 +0000
Message-ID: <3277fbea-d6b0-4dd4-bfa6-acbbca8cb3e9@virtuozzo.com>
Date: Fri, 28 Aug 2026 17:07:35 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] b4 review: an "inbox" view for series addressed to me
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
References: <f8ed2026-2b7b-4001-a591-0a0914b94796@virtuozzo.com>
 <20260828-enlightened-devious-chameleon-22f84a@meerkat>
Content-Language: en-US
From: Vasileios Almpanis <vasileios.almpanis@virtuozzo.com>
In-Reply-To: <20260828-enlightened-devious-chameleon-22f84a@meerkat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ZR0P278CA0055.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:21::6) To PAXPR08MB6942.eurprd08.prod.outlook.com
 (2603:10a6:102:15d::17)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR08MB6942:EE_|GV1PR08MB11180:EE_
X-MS-Office365-Filtering-Correlation-Id: 764c2c62-9ba4-43d0-c889-08df05161835
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|4143699003|56012099006|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	73u1xm27CeMV1yyNclBVDo8163t7vMY0H5t5OSIOJbl6hCEF2uLKYisw6O6RbQcgrgdyFi8pSSdJpFPtdrhUoUwiZTCCb+wUbS/sYefVEBFGJQyR9sitBQzJMM1DTpu4ZF7+nhpLZ2e2bq3TPswelkUkrXOd7S6yLZX++UFkgMbgOkCFEecs1xFLrvSCm1nHeL02gsCcUbb50ftRDfKcONFTFpE9eAlE7vRKglqphm/1Q6o00Nfy+tGi1P4EtzjgrQ4iNhTN/Bwownkp4jawVnb7LOPiuWy1eMRbAxWrFsFvL4aTIgXfddTKz2PtfR3fT4XVL3MMYYp+8yWRMgxnA+qyuRUwEGKpDF5tItw5ysZE32S2DoIKiSO7Wf4cJB7Y9knEVxkN2GSVtv+LA8qdyt3fNKp3OccNCAMlwXW3/K7UxjGeSF+X3iM6vRC6DBcZXmnH85RVo6ZNT2BXtnQs5G6kYwfBXqoU7isOqN1xLy0TVhheezaWr+NebmtmC+olu7wUBK187iLk+Gvm5fSUX6WfvyxpY5dqb1TbJc7srd+w8E/LFWmNq7cV5G6Vm30Ls/mAugjB6m3E8S/Lsj3vZIWogMdCTcMOjAsJ4S9xZ3MU8jV2t8eZWM3NbWq7F4/sR1jNrqzpDQSe5sOS1N+Xb0Z7M0ezPy04H4btCNjPem8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6942.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(4143699003)(56012099006)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L1JhV2FlblZWWS8rMER1Z1VFNGllNVNRTm4vc2FQdTBNN1hyVHZBMGpXdWV2?=
 =?utf-8?B?Mzh2cUtLODFYelU2MmMrYkp0QXZodXNEZDZ3K1RSZ3BTSFZJc1FBR1VkQUFP?=
 =?utf-8?B?UXVid3JzUFNwOGpVRWxzQVo1cHp3dEJ2bEJWRGpSdU1Temxsak1XMFM1ck1r?=
 =?utf-8?B?dk9tQnZtSXBmN2pXU3N6TkNicy9NaVJON0luL2FpZ2xNM0x2U3VsK2xuQVlS?=
 =?utf-8?B?QU9yak5JeTNBaEgraHZiY0pFR3NOYXB3SmV5TENDV0s1d29rMHRSeTVuYWNW?=
 =?utf-8?B?d2xsVkIzWTRIR1htYlptbjFURTAzbjB4TmpJbDk5UXNnUHpYVjR3VW5tc2oy?=
 =?utf-8?B?d09makppeHlDQ2tSM3JZMDJILzZLT09kYndZaVJkcW8xZ09ES3pVOU9YcW0y?=
 =?utf-8?B?S1pDWnhFdCtYUHNJcFRUN09yS1JTNlZqdW4wbEEzbmhXMSs2a3pidVNzQnBI?=
 =?utf-8?B?bnI5R2lYNzlVZXRpc1lMRnZkK2xWU3plQTNOUW9xMEJzcUh5azkvZkJMM2w4?=
 =?utf-8?B?ZlI2TCtYNzd5d1NUVEtXYU4vRWxxWmc2TVdaelhZMk01Yi9TeVRieEI1VjJw?=
 =?utf-8?B?N2JPWDlYclN2ZWllMlZ4akRnSjNWS2dRZDc4TjZscURQS0dKUXk3QUt0Q3ZI?=
 =?utf-8?B?WU5JMGM5cXVSVkZmS2ZTT1pmb251Y295c1h5WjdCTmRBeEIwVjlDYlVObUVH?=
 =?utf-8?B?eEt5emZ5bzYzSzFVNERnb08xUjB6N3ZZMGFKSDc4QjJNeVhVZUlJSStXNmh5?=
 =?utf-8?B?WVVTaTJLZnE3eHAySVFtMFYzbUNSTkVCU00wbDBnN1dFeTVjSnNmMGNWSU1u?=
 =?utf-8?B?NVZkWFVrK1VoTWtURHFPN01FU1d3dGgweXI5c1E4WDk1Z21jZFBRSEtLdmx5?=
 =?utf-8?B?cVQzZFZKMGMwK0ZRS2V3ZDk2d1FSTks2aDBsd0piSUZWblVmN2hUUFRLam91?=
 =?utf-8?B?alZUVHBXRnEvV0Z3ZVI3QzNNZVFURWV1b1o1b1V4Y3M3aVRpKzFmRDVVSTE1?=
 =?utf-8?B?blo5VzNidHFNVTV6d2lMK0ZFWXFUWmh1YlNEYjZGUVJSMnBQUGFwZk1UZFZs?=
 =?utf-8?B?NlZYODhXUnliZlFlNnlMYzMwL0dueWl5TnNNNDVKMkIzczBCU21IdUZESEVN?=
 =?utf-8?B?L2J1ZENBcU5pQVJ1NG5LMmppdy9Ib1RZdVBadC9kbjlqRFpJZnZvbndhUHpQ?=
 =?utf-8?B?UmNwQUFkOXYwemx2OE81eklCcFMwRm1sU2ljZzNFM1dHYlhNTFlVaEg3K2hS?=
 =?utf-8?B?N0E5SnVDZWJ4cERTNm10K0tKQUVobWlHYVpUWGVYL1ZpdnljTlgzSHZ4SnVn?=
 =?utf-8?B?R29WYXVmeG05ZTlycDBzV292aUd4V093ait4cFVhVmczbFNET0RlYVM2T04r?=
 =?utf-8?B?eG8raFg0V05HUThWM1VlRTZZekZqdkxJajRCKzJHUGRMaVc1dm9wL3hveWt6?=
 =?utf-8?B?djhGVWYxVC9FSGp6NGFxUENsc0hRZ21zVjJTdmlRK3poWHRmOTdFOXU3eWlv?=
 =?utf-8?B?OWU4c3ZJQ0MvVDZhZ2E4RDYwbXE0VDhxUk5VK2x3WmhsaW9HMzg1K29FVUFu?=
 =?utf-8?B?L2JyNkpnRG1JQmp5dmtBY2xHZUdUeGlZT1BVRTRyNTNrS0gxMWRwM1gzYU9a?=
 =?utf-8?B?M0gzaWRkVXNudkR5bjhvdTBRQ0YyVS9SeDBIVzRxSW5SQ3lIem95aFJSMlFn?=
 =?utf-8?B?SWxTbXpPMnR4RnJXL1Q1TnB0VWR4NDBQWlAyQWdZRmNjSXdobnhJOGdPYXlZ?=
 =?utf-8?B?V1lWSXowcTN2b3Bua3JGRnkrUExCMVhQbVdIa1M5T2piUjN6T21tbEovUDZy?=
 =?utf-8?B?RWd5Nzc5cTA2WWR3RGl3SXpvU2cvL1hFZmpzZTJTK3kyRm1YaEI1OTMxR0py?=
 =?utf-8?B?RDB5a3ZnZ3VLNnM1cXlZSEZsblZQSDEzNkpBWTEydnVuMFFpUlpBZXdpVG55?=
 =?utf-8?B?YU40bUJWZDJ4WUZHbHd5MEN4Z25CeXV1YWJxTnY0WGV3MjJ5TnNoUjErYlNn?=
 =?utf-8?B?TmdHZ05DeGtzdlRNY3MxcW5VWWZQMWpGRHN3ZVRaZFExbmpXY3ZpUUR6Z3pG?=
 =?utf-8?B?M1dmZmZFZDF5V0JBWVpzZVErRCsrOGtIU0RhZWhhSGhCUEQ1cnhTb3o1aUxa?=
 =?utf-8?B?a0owTjBpQmJOQWVuLy9kbkZEZmxMaTEvSk5yZ2NaNHovSG5jWUZvUzB2VWhx?=
 =?utf-8?B?NUhhYzVqNDVjU0tqdDBwVkkrVERmOVQ3N3A5cVZkUENRV0V3TCtWNWpaOUUw?=
 =?utf-8?B?R0Q5TTEyS2oyMkZIajFkWnNnZGhyU1R5SlFyRnBJMzRCVStpWStIeERUZWVM?=
 =?utf-8?B?OUwwc3FUY2pDWTdmMUVnQXNJdmY1Q3VubWpuM2pHQ0N0QWZBaTBwSzBGdGph?=
 =?utf-8?Q?MwA0D9NvQrxytU/w=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 764c2c62-9ba4-43d0-c889-08df05161835
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6942.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 15:07:36.5051
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vaCkOx98Baaiq4c+G8o5RKzL9o+8McSEHlOFr8+6fQKzIGFFHt2m6qBIWiU80HKoSWZjqQZTL2WO/UB6zQ/MQBLuFpPvGwQJwALB8zOWTjkkVkTpFjXqHVCG8Ml9UlV9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB11180



On 8/28/26 4:19 PM, Konstantin Ryabitsev wrote:
> On Fri, Aug 28, 2026 at 02:42:35PM +0200, Vasileios Almpanis wrote:
>> Hi all,
>>
>> I would like to propose (and implement) a discovery feature for b4 review
>> and would appreciate feedback on scope and design before I write any code.
> Hi! Happy to discuss this -- but this is already a planned feature. Check
> plan.otl, there is a large section titled "auto-consume a public-inbox
> archive".
>
>> Problem
>> ---
>>
>> b4 review tui only shows series that were explicitly added using b4 review
>> track. Finding what I'm expected to look at is still done manually. Open my
>> client, check my messages, find the message-id, run b4 review track
>> message-id.
>> For someone CC'd as a reviewer/maintainer on a handful of areas, an inbox of
>> series that were addressed to me and that I haven't dealt with yet would
>> remove
>> the above tedious work.
> Correct, though notably it's less tedious when patchwork is present. However,
> this needs to work without patchwork as well.
>
>> Proposal
>> ---
>>
>> A new b4 review command (b4 review inbox) and a keybinding in b4 review tui
>> that:
> I had a different solution in mind -- instead of extending b4 review, we have
> an entirely different tui that I was calling "b4 maintain" in my head. There
> are three main categories of things that a maintainer needs to keep an eye on
> -- incoming series, bug reports, and general correspondence. The maintainer
> tui would give an at-a-glance overview and additionally allow for agent
> integration as a background task:
>
> - analyze bug reports, check for duplicates, assign priority
> - automatically feed new and updated series into "b4 review"
> - summarize discussions and bubble up threads that clearly need a decision
>
> Basically, avoid the firehose and help maintainers not dread opening up their
> inbox in the morning.
The case I was actually interested in is a normal reviewer: someone
who gets cc'd by get_maintainer/Fixes across unrelated subsystems and
doesn't maintain any of them.

As far as I can tell from the korgalore docs, that person could
subscribe a lei saved search (tc:<me> AND NOT f:<me>) as a feed into a
pipe target running "b4 review consume". But the setup is: install
public-inbox for lei, configure a remote external, set up korgalore
and a timer, etc.
For a maintainer this makes sense. For someone who reviews a few patches
a month it is a lot compared to a single lore query at the time they want to
look.

Do you think that setup is reasonable to expect from the average
reviewer, or is there room for an on-demand query mode alongside the
korgalore path?
>
>> 1. Queries public inbox for recent series roots addressed to me:
>>     tc:<my-addr> AND NOT s:Re: AND dt:<lookback>.. filtered client-side to
>> cover
>>     letters / patch 1. The set of "my" addresses would be configurable
>>     (b4.review-inbox-days, b4.review-inbox-addrs, falling back to
>> user.email).
> This is already implemented in korgalore, so the plan is to reuse that either
> directly or by shipping a lot of this functionality into the existing "ezpi"
> library.
>
>> 2. Annotates each series with best-effort state:
>>     - "replied": a Reviewed-by/Acked-by/Tested-by or any reply from me
>>       exists in the thread;
>>     - "in tree": patch-ids found in a configured upstream ref.
>>     - patchwork state, when the project has a PW instance configured.
> Okay, these are all easy heuristics.
>
>> 3. Offers actions: track, open thread, refresh.
>>
>> Open questions
>> ---
>>
>> - Is tc: the right signal for "I'm a reviewer", or should it also
>>    consult MAINTAINERS / get_maintainer.pl?
> korgalore attempts to approach this with "kgl track-subsystem".
>
>> - Is there prior work on something like this or similar that I should
>>    align with?
> Yes, both prior work and a planned feature. :)
>
> Thanks,
> -K

-- 
Best regards, Vasileios Almpanis
Software Developer, Virtuozzo.


