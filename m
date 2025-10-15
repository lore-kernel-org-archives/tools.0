Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A33DE23D7FD
	for <tools@linux.kernel.org>; Wed, 15 Oct 2025 13:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760536295; cv=fail; b=n53Iqfmw55ZVBoelBe3oBjcYIyr0V5Cs5GXtP+0F5dIId7ZELfUu8j+ldmhr4BVgtOssC+dGiVHSn0oIue+4cQmleY5C7eHGnXrNTGQgarFGqVvfn/hPqEVOXZUX3NjXBLhujiQzVfD5WrqxIpENwbrinP/uh49NalNZOx0HcCU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760536295; c=relaxed/simple;
	bh=ZGpouxiy1fwEoqXrDC8xnzqdbGSoHoXvUMsLN9CLZbo=;
	h=To:Cc:Subject:From:In-Reply-To:Message-ID:References:Date:
	 Content-Type:MIME-Version; b=MrJGQ8AcMYq/0fu2IAxJ7+f1FXrNN3aa5sMVZEKZWR1ZaUJte0qdKLlgMtvfouUoDF1+4F5R4tl46fIeWW13r6xxj+TgaycBBW5/DuvUYNdBBRwmkDjA0XP7kbKNDX82mGW0UYhcr3kXG6mtVsj+wsNGWzKwx6ccGHXn3NNMNUs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=DG3VXWKL; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=tnPk2dCx; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="DG3VXWKL";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="tnPk2dCx"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59FCu97n030182;
	Wed, 15 Oct 2025 13:51:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=CF9q+14tScN4RZFjxE
	ZooqTvydAIq2j+eGAyIp6WD5I=; b=DG3VXWKLJrIOqkm4bzBaS49qj1JHr/qyxi
	+nndu6ugWZnA1wBaMBWPK5JLcvyX64I1a9UiCSFXwXL/gGvSE8B2obxWhlRHGzJ0
	JNCNjfDMeIhmMDmvkniuc0c8PuRmK505Ap797pgUwxaB2aFy5KCriEYEayi63Rjt
	JvpMgWR3wchLZzk0k3m/8975sxmuUj/qTKb5H25pWBAF9jwwe6CoQkWnIr8KkIsY
	Lj4RD7SYLpudrPCZV2y9sdFfouvH9GDYBIgbyGIgwhuOpKm0LYjYq/v94OYwdaNX
	369k0Bd4l2tsVxMASC1wPcENCiqrTaY1CM30CpeWdlWJChIIPprQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49ra1qdtbb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 15 Oct 2025 13:51:27 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59FCUHUb017708;
	Wed, 15 Oct 2025 13:51:27 GMT
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010032.outbound.protection.outlook.com [52.101.61.32])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49qdpabc07-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 15 Oct 2025 13:51:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=myFSqsaOX9ku23xAdqzCXbgWMFw41ulWc2FIpZCb985QQbGCMuZ5FFj2VFAp+Ouw91ujBw0cHbx0zgWe28pvpvCfctrrUenDY1KoF9kiVeMB6JnbQoKokcyDUMYoU6yE8n8urZdcTYhXtFHI2s0g+Nueo3aXBSTD2cGBaZ66JrX/80x5UAz9rATmRTIyJT4k3o7uuq02195gVR4eYv91keReoE5qrf6uwywtrvXRih5tzdkCZ+vHNMyprr8Wg+nP7iJ+2ugyTF1ikWqjynLT1hrvbvfk2zy7H80St6LY3ZQMrK18iZZFJqmtr85NjdbpG4pSeab3tsWqs7uQqyUiFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CF9q+14tScN4RZFjxEZooqTvydAIq2j+eGAyIp6WD5I=;
 b=KqquXsvuBzFGmbXHXWFqGuWvFjAOgeFl7Y5EJi2A9RP67wDvOJ+m0Oq5xHdU55nk6zSxQX/TNpS18hCZ6RyzCmE407w3rQZM1nkJTiLSeKs0lXUuSDFo2sTbWmEgubuAE5qLLznjVdJll2AcokZ3mjkf2+WWKqf0/yeUpC+rpIEnZtixu/BgGmoLHYT8JeLQjRgIeIkTBgi70r+pVfadInQN47N48Kq500ZMo/29iqm16r1jGUHwtxjO8tp5rUcWExqTA7uDCnK9zyTRpagsNit8wYB/rRA0EyrQDaJuaOhoaWMNrw82zqc66zk5zMrM9qStQGmKEYfCvJZ+jkXq+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CF9q+14tScN4RZFjxEZooqTvydAIq2j+eGAyIp6WD5I=;
 b=tnPk2dCxIn4yFKx3Xinb437SSwzcLJSgbtqpxwCI5krn2Iv3678vGyOQZ1mhqP7I4962qpjOgk5jngkCnX4SZo02/Sbp4SyuqT+23XVMeHn47vQXDj9Ws6fo7jGrZ8y1cMDODee5jhKg9PVJcvAlQqrpMNcZ2GCm8535Fb5J7LI=
Received: from CH0PR10MB5338.namprd10.prod.outlook.com (2603:10b6:610:cb::8)
 by CO1PR10MB4419.namprd10.prod.outlook.com (2603:10b6:303:95::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Wed, 15 Oct
 2025 13:51:24 +0000
Received: from CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::5cca:2bcc:cedb:d9bf]) by CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::5cca:2bcc:cedb:d9bf%6]) with mapi id 15.20.9228.012; Wed, 15 Oct 2025
 13:51:24 +0000
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Torvalds <torvalds@linuxfoundation.org>,
        "Michael S. Tsirkin"
 <mst@redhat.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Konstantin
 Ryabitsev <konstantin@linuxfoundation.org>,
        <users@kernel.org>, <tools@linux.kernel.org>
Subject: Re: In defense of Link (was Re: [b4] initial "b4 dig" to supplant
 Link: trailers)
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <CAMuHMdWxMhM1J3zHC8OkN_fd8XsJPFA6jM_3JFU=ySKhnX6ESw@mail.gmail.com>
	(Geert Uytterhoeven's message of "Wed, 15 Oct 2025 09:33:16 +0200")
Organization: Oracle Corporation
Message-ID: <yq1qzv49yb6.fsf@ca-mkp.ca.oracle.com>
References: <CABgObfY5agTRsB-bCqCYbA0erFn5cVbujtTNBiCti8g_68nCWg@mail.gmail.com>
	<20251013081536-mutt-send-email-mst@kernel.org>
	<CAHk-=whSShtPG1_+02Cc4yDuEJxVqX=G8tAx0gW7UjA7cuBp-w@mail.gmail.com>
	<CAMuHMdWxMhM1J3zHC8OkN_fd8XsJPFA6jM_3JFU=ySKhnX6ESw@mail.gmail.com>
Date: Wed, 15 Oct 2025 09:51:20 -0400
Content-Type: text/plain
X-ClientProxiedBy: YQBPR0101CA0248.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:66::30) To CH0PR10MB5338.namprd10.prod.outlook.com
 (2603:10b6:610:cb::8)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR10MB5338:EE_|CO1PR10MB4419:EE_
X-MS-Office365-Filtering-Correlation-Id: 85de0d98-f67c-4ce5-215d-08de0bf1ed0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XtcRtV4tSYOv4P0/P2531DAcIj7EPqGglooIGe8VfTxyVaBQi31Md+SsFN2C?=
 =?us-ascii?Q?NqQmu5ICQgi8w/PQdUaIU1Y+TtpZ1UJuV7NesDBBxe2FONkRldLo/huxoU89?=
 =?us-ascii?Q?RzUCMJGGBpejf3kqiZKwS5Badf0649tLoOHYbxaFgv4UUIP6il9mCxSI8WuG?=
 =?us-ascii?Q?kQUG3ePBfZBUwq3O1DIwG+ZZqbL/eYhe2IQNQcEsvcJpc5rAFswmHYpQC1cg?=
 =?us-ascii?Q?CmM1bJvpQV46YxU7LXPwWSAddzbBuFV9V19zXg6TF3karrel7XA43hy+iKGY?=
 =?us-ascii?Q?qbW4JjGivWXwSXCMgv0CU9mYv5gYT7lq7qbwQsr6xyS5ophVJAOl07safehp?=
 =?us-ascii?Q?TxyNez/uMGTVg6rhMBmSaO1OytGgklGqIWy5Tsz1E1xqeNWY0vN51RoeQ8Qq?=
 =?us-ascii?Q?E7x6ovHUC+wchBpycSFPRztkc2Ycehy377dhCQ0IuAS09jGEwwY78NJM1JJH?=
 =?us-ascii?Q?k4/8LQzmYsnc3K4hALrbjYM6kbWXQoJqw/QGQapH8+ETfEkRI6GXK4pR0qfa?=
 =?us-ascii?Q?NM8ZLgFl0nXXMaDVI6WEaGHhL2KkbK5ZovunNzWsE/+z4DVeNfzISNMLCYVF?=
 =?us-ascii?Q?X7qIe5m6+ZK/WRsgN4Z97dkt4scnAVFk9Vge6MCIYeMl0Gqr+SaSGNlhvOpn?=
 =?us-ascii?Q?bEIoTym7Tf4NJrA2g6uuvSOK7YsYjX09cjvjZl8RjIwgZDxZOLCB+pgCNoFi?=
 =?us-ascii?Q?B99cY/5VUNx0TCgrykUdF1p5YdQtrz/a689RS2zMTCO9P1eIhNXpLwdTY2qv?=
 =?us-ascii?Q?fMYDdry2jS/pI2W5ZDfbGkVVtGHiKOwA7LQyR2nWsong6CJoBBZpFy3pRAZw?=
 =?us-ascii?Q?um/g0l1j4eiQ8q//9lHWRwZS5tQBblNttCK8spOp0K/iTe9hi0cYyP9cg8rr?=
 =?us-ascii?Q?gXBIxs7ZOAn6RD3+0LlG7ffXCx7YBas5lSTgohlOjhsF+i8wxt/2I3Q0jJK2?=
 =?us-ascii?Q?/Rrmx0oCVqvmLzzaeXeVZB71QUBfsf3G5BgtCQETaR0PXjVHmPodDSsOXfCN?=
 =?us-ascii?Q?zTluM6gwTj8tGyUQOSiTRR577YfL9qwRruhuJ5u1HsFKHhlF583Bj+OTsQW0?=
 =?us-ascii?Q?LBTH5x/AcKsJypE+UFqK+62YZA49t8Bhavg5vw++GWRH4gmVdj9V5n0Ap0BG?=
 =?us-ascii?Q?XPeQ+vxbfJEQ0WODNmKQ0YyoZnEfvkIaevSF1VhdgTMKX/16Gu1r5BpC2kuA?=
 =?us-ascii?Q?kP63gbQN1jhof+cEMZdPzcmdA5utserDuX4gznBy5+sbEKGEB9nvLMVi/YOS?=
 =?us-ascii?Q?F3rkfHbf8b+SCIrhDnV5FuqpG6I0HIYsYEY5BJJRjtwQZWfYRMgYGbtqQz/C?=
 =?us-ascii?Q?mfkaClFZ4nQErnAQpQ4XjvJiy0cP2FYFD6pGNdkw4YAhZb4VSdAiCqBOQKv7?=
 =?us-ascii?Q?7feHLvPST4kf26GP5QTS02rGmhU3s3+mPPQibchSuDXaPTonBinYcxh+7fp5?=
 =?us-ascii?Q?NbAP99aaWQ8ET8pieaJbE1pDD0VTtO8a?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR10MB5338.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lo9bH+knPg0P3rQXe+a5+aduDPABu5xifrY/xfJhqUpOps8h+Y75n85kXtdJ?=
 =?us-ascii?Q?0jJbMo2bx3B8MoEXW1ILxDWegavz3+o61uL+ex79y2rqhcqyEfygayiEBQbZ?=
 =?us-ascii?Q?MeSBNj2rdONb6JPMIC4sFTxgrs/OsW7/KwsErmZ10nthjcWQlETZjjegJzpX?=
 =?us-ascii?Q?KjV9x1L3GkG0t23G4RU6W1wOlzckupFiZqW73gsCkBDYrLpgcEjptnUrFCL6?=
 =?us-ascii?Q?8DfSaJPuzycqBqdJe1MfR3MCdw+wY1XXQWkUof09gjeoSEUg1e7Zwb3oPhMf?=
 =?us-ascii?Q?EP4SOZUCcH1Gq4ZIZnwK23hjnT1oOqWwddWmjjC9yfPoAlEy1A3Hqa0K+NlZ?=
 =?us-ascii?Q?Tcl27lrjtIlWlbfmDz0+3dNtb1Sx517xLD37cxjpQeHDJeJu4aZr/W1PVDQT?=
 =?us-ascii?Q?4gJqXdGlAwAM9nkZHohxCR9tEz65lFBKcPp6b5HcVexcHdsfqGv2L2nvQUP5?=
 =?us-ascii?Q?bwAlHoOdqtxe5cnB+nyT7hqtgKFywZA0AMPXy5yM2ZaUsN27xJIezLjtEGwM?=
 =?us-ascii?Q?EariAzAR2p5izHldFgH0DAfMSL15hzU3CK4CX+WNw6TsqKiXLQW0ZoYKdYln?=
 =?us-ascii?Q?mP0400VKKTc732XyBDsO92GQ0kpd6HZSOSaHYA5nwfLdC2GbvxbznmE16P4F?=
 =?us-ascii?Q?tAE2yxD4I+AclRQgFInXWanUJof76v04YJgjYWD86WGk6V4zdV9/j+VnrZVe?=
 =?us-ascii?Q?SyLRi/8ZePIpYSsPbrTVmITWteaqsyq3wvYeFueHu0E1aizNaHQfjU2ogCFo?=
 =?us-ascii?Q?v8m38+iMwGJsGLtGFB+ywJ0+0KqCB8ewvX/LXRzwO0l2Fvuo7hTroxwa1k55?=
 =?us-ascii?Q?Ao5TujE/ZMOF+9eIw4aCnxmkhrql/I+37XJlRttEOp8n8msOHsxsGgIS2Dlw?=
 =?us-ascii?Q?dl1W9KlxMWTWIZ4WgEiFodkDCh3FVVD3ox0nSEPSYe4BiopiupGS44ScQK/Y?=
 =?us-ascii?Q?/rjRdJcetuTn3N1hPY7ZaqhogiDdsdla37ptNZB9/ez+JC8nH75Wi8XyEV46?=
 =?us-ascii?Q?kqJQVsxO/2sGosNJTQFH/7zLGOFOPWm91ZTgjzsgdFfaHaYBtHcKHY8BMouT?=
 =?us-ascii?Q?/vVmQQF5h+ftR2J3zk8x15+GZbLRy9+fOgJ3W92iRsaKuRs3+cLnehf+oq+p?=
 =?us-ascii?Q?+8vhfDVpI5LGHDM2j5Bcduhhz0YRlGqzXljyobZuCIu6RNWtZV7fuI4lfvkz?=
 =?us-ascii?Q?BUF5fyXuk8uzf2pfhi2jMT1Qs9XP6BNOQwPutVMQckcIHNsDJ2WXtGd+dA7w?=
 =?us-ascii?Q?iFLMrTiRX2GzrFeq2bTKP+0Faz7YXj2WOdAPi2GKAXditgGnM2HR5NtIxGFN?=
 =?us-ascii?Q?JyOOJEc9Ea4aiSx+n450omI9sNq2Ccr5UkvPFUIrtL81A96RA06SlC6/2VRh?=
 =?us-ascii?Q?gAaYX7OHGbwpKLb6Tlh2nXx4vihOeN2snIswpK321SAkI4fPej7jIPPQO53V?=
 =?us-ascii?Q?4blRT+DKqb3ocbnEeDd3j6g2sEYUYk1lYZIujB9eieOWDolpdc1ie7T8NdTt?=
 =?us-ascii?Q?5BFW2j6Vi9ZID1eLJuP8iVJEpq4cOue/CmebCxDjIp0Ktx8sD/nKqqtB6Fbe?=
 =?us-ascii?Q?EU8Xfbv5MWd6AEy2/n+cNqDIzInAmrP6jx5SKlZiE7oSyggSlwTvF8lh44Oy?=
 =?us-ascii?Q?RQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	6D0ZiG+ckgW+yIjCKa3Sq02+i1UJvOzFKVgV8uHtQK9AVN6+BhsSiy+cstSKY0QLEtgj/y2lDhnt29Tgny03jw1qlH99bRgTWHK/3noLDdZqb6SbDtQyBXY3w5l3o0AOPn5dEuGOyOU6DjiaXpYrZ5NQxPhTIN/EEMBc9CJr3dQQbPbFDmwRbXGOMTXBHX8JbFw2E/BH88ZyQD0lS0EPnEneNRM7bP0t3rJ49Do3NrnyLHtmfKEZ5i/9aLLR1Tg9a1ivA3cApdcAiCy/1JHTokiiRvzrOfsenP5tIkdgaL1ef6ueQ7Eu5jj68cTOj/oZ2S89rLP8cM974WZLeEPCdA2cko9K9qxGzRGUKfDAsduHc8gYr0uTeDEO/7RePmjysBTIKV7uVxJAnJUqpW1RfAOTRha4X2Zxm+xgmi01mLObZM5dDo0lm8Svo01ZYmPTrUKsBNCNNYDvDjxdDGismD+6NWq6L63XGTmKetdrW6CLHC3UyYigfZ4mQeKrOgkkVfH31BRYsF+Ho+BH+6sBBCglItaPI6N9vtZLW8y20wBPHpqkW3MCTFbtrkflELlJ+6UkDwyvrGBo0SMvX53eyUGUisPqDvHXGpk1ZSufTTw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85de0d98-f67c-4ce5-215d-08de0bf1ed0a
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5338.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 13:51:23.9286
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 72GJFImdOwyPgmKfMkqOqJwwj+P1pPKNDBONVfBUIAAF9TTFSmtmwehOYPZWNlj3WE3XEV+Ztt/OEpEuVHk27+sDvsuwmMf5G8hcSzQKkNc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4419
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0 mlxscore=0
 suspectscore=0 spamscore=0 mlxlogscore=999 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510020000
 definitions=main-2510150107
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEyMDA1MSBTYWx0ZWRfX6/+D/F6Syl0d
 MzfG6M1yItReGc+5CwzhW4+h9Idjk8oMAnm3v0ODxm4HgeEB2Giqx7/OVd+3XT8uSt/HrMCH/M3
 Hx0x/4AcUCnEhjqVOYIdsxZo3LQPiCAYhB8ldLwBaYbweMF5k+NAUwGjLuaRlqyc9KlHkTB+62M
 J75NujUAr6OOlvPrIJmAKMf8AeX4uZ3VeXBxkan0bqbGeLmmQdbWTBuzv/yQMalsSpc+zu1yDMM
 ny0bO4bLiT4XYvhAnIIFsKkU54GfGWKvYjo6iHkuTXwDe8POIhes9T7mQZweePRocdowf/u9FlW
 Rw6/95PlYled5Imkq29H/5paq1gRhzp1nTb3F9cD865SLxOZtxOb5A//qBa7yhpYwLqhkHqEKQj
 Csa/f3xxkx3GLM/a1skNNkFijA87AQ==
X-Proofpoint-GUID: qwRxAmBYWlAx2vu8e_YKvOiumPHs2SV6
X-Proofpoint-ORIG-GUID: qwRxAmBYWlAx2vu8e_YKvOiumPHs2SV6
X-Authority-Analysis: v=2.4 cv=GL0F0+NK c=1 sm=1 tr=0 ts=68efa6e0 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8
 a=JU_iK8aH8WVgt60NrigA:9


Geert,

>>  - patch ID
>
> Patch ID is not sufficient, because maintainers change patches
> regularly, for minor improvements, or because of small conflicts.

FWIW, the success rate for patch-id --stable lookups for *unmodified*
patches downloaded directly from lore was around 25% for me during the
last cycle.

With the edits I regularly do to fix typos, add line breaks, or
otherwise fix formatting, the effective patch-id hit rate is much lower.

>>  - subject line and patch date (note: maybe from the email, maybe in
>> the body of the email)
>
> These may be edited by the maintainer, too, because of prefixes that do
> not match the subsystem style, or because of spelling/grammar/wording
> issues.

Exactly. So far, 'b4 dig' has not been able to identify very many
patches that weren't found via patch-id because of mismatched subject
lines.

I think this entire discussion misses the fact that many patch
submitters are unfamiliar with the subsystems they post patches to. So
the original subject will be "drivers: fix foo" even though it's clearly
a fix to a particular subsystem driver or component and should be tagged
accordingly. And inevitably subject lines, patch descriptions, and code
comments get tweaked as part of the commit process.

If we continue with a fuzzy searching scheme, then how do we accommodate
commits whose origin can no longer be identified? I'm sure b4 dig will
improve over time but there will always be a delta.

I tentatively added an Original-Patch-Id: <hash> tag to the patches I
had in my queue that could not currently be identified by 'b4 dig'
thanks to subject edits. But again, the existing lore patch-id hit rate
is low even for unmodified patches so I ended up with quite a few
commits which simply could not be matched up with anything on lore.

Also, why burden maintainers with all this? It really seems that we
would be much better off solving the problem of matching different
versions of the same patch or series on the kernel.org side. Patchwork
already does this. It would be appropriate for the lore archives to
maintain a similar mapping so one could easily check all versions of a
series and download an mbox of all discussions pertaining to a given
commit.

I think it would be incredibly helpful if people could reliably click on
a link in a given commit description and see everything that was ever
said on the patch in question. Both before and after the patch was
committed, any regressions reported at a later date, etc. And regardless
of which edits were made to the patch as part of the commit/merge
processes and any conflict resolutions. Also, to me there is a lot of
value in being able to see "no, there were no follow-ups or regressions
reported for this commit since I applied it N years ago". No data is
also information.

I don't have a problem with something like the commit SHA being the
principal patch UUID for lore lookups instead of Message-Id: if leaving
that in place is a deal breaker. But that still leaves the problem of
being able to establish a dependable link between a given commit SHA and
the "full history of the patch". Given how things are inevitably tweaked
as part of the development process, I really don't think patch-id is the
right tool for that job...

-- 
Martin K. Petersen
