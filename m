Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5073DEAD2
	for <tools@linux.kernel.org>; Wed, 12 Aug 2026 20:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=100.103.45.18
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786568390; cv=fail; b=Bdcn7QtO5Cucvqpjc6djy6/icokKIQ1x6mSa63a85s/ASqtZnkf2jxp11A5LQJW2iUni7L2L+RsAWEUje6hrQ0IjTQ7hvryF8jSwYawD7iUtcI4HcFUpjHxKqf/Q9wh9B7x9SdhD4n2uup1XuJVE8VXqzDDkt8kMqvYVYjJaGkM=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786568390; c=relaxed/simple;
	bh=O1KbQrpaEI8GfOws3K5bA8C1zDq7C4HFgNzABCkmM8s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=iSKyPdaPvJ8pnynEWZ+a1sSjcpcJ/pxvyaBAVrPCKKTH2JDJbbrX9evAYZ9ZFJ3HIkkIfp8+hU6nzalkNXfa/03IcC3/l8lsvDXZ673gLn/qq6S+K84MKM0e55seBiIh8e3imZo+kCyKS5j6tN9+AnMqxOSd4ANBjIqjulp4FF8=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jQ1qeBqn; arc=fail smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jQ1qeBqn"
Received: by smtp.kernel.org (Postfix)
	id 3D40C1F00A3A; Wed, 12 Aug 2026 20:59:49 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.69
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1786568389;
	b=W5ID2een2YQR21fmP0sNW1HJ8bfT5MBlvdeZaFnY1mjCo3BUvufyRjovVWPkNVVikj01
	 zyR18vffJO/hGi67ARaEKqOMLwX0gxXShfK6HI72bL4DK5aQnErad+lGQ+xRrUlaec6Rl
	 6+ajrs3++7c6HIDnDfcYaWarfSEKU5vvP3FRrr7pmnB+llNzscRb3qDE6iD/y2LxOyKQw
	 vWJwFGvEpVm/BL3pANn6RLjSvKESuHzPR2M+wnrcHJtkDn94ZfTXodO+a5GscCrX6aOTK
	 3gHlzHk7QW/0QT58mfy8XsdDwTdnfXoVbjCHJU2iorVyNaKFVRGgDW6rVnjpA1i5NMA==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1786568389;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=WrQtLewDa3V8HgC63ybwGXqIVuupV4aLiz+frAy76sY=;
	b=tD9bbGg3bKukg2alq1BPrAwqmc/BoxvnaJBymWU/hz1futZgmQuz7XEEqEqmkWfJpkXc
	 2o3zIHr10SK3I+hEADpbbyZor6teK+aKHCp8tLIlaOlTKSeq/Q6Ppi+hdFGreNzvuxiIU
	 GSvwCPu0jn6cLCDac8BfGHLW4ztIekBFiUl57uBqGg5hSlOkCMyQJ0bcHFlCanVObDwgY
	 bZ0pl/at8cCT6SELGqcGD39t/ZYt3On/xD+1po1aCkNi/zCxQqKSCIkTilKjxvc/ZjjOQ
	 CsBUHszFgD+ktSGelcGHE9qeIRdA5QP3rk/m1wOJDpACSwMrClzKkrbfIAbS8/IcJLg==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=jQ1qeBqn;
	dmarc=fail header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.69
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013069.outbound.protection.outlook.com [40.107.201.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 72F811F000E9
	for <tools@kernel.org>; Wed, 12 Aug 2026 20:59:48 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=jQ1qeBqn
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 72F811F000E9
Authentication-Results: smtp.kernel.org; dmarc=fail (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A2HGO/l8Zjj+oQVMjwbDe7cMdvlyWQ1Y8yc/glZo4rP2fgMGCMwD3yQpyER2FChFawMx3uFZQF4fky/L1P4PefcZbJ7msFUtpGfh3wKDd7GPV2NlH9QtY/iAQ2cNo4nVBLO8ilsvB6U+EB5tbnWSu8cdUXddkhmmuFwPORTmU9Ovw1macY9X13HTeHUF8uIVeopiWCgFLlSbPNC/its8i5ee5CgNAGA+S1G0oXgb9+iW+f8Nbz3dmHwdmJ6LX6C5NlMJ23HElGjsdP4ubYsUn25N5GvmXQbJywglOCuDlkkj7Tw3CTvovGUx0eSyquxD14ZMFERbgZR8K1CPNSKNBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WrQtLewDa3V8HgC63ybwGXqIVuupV4aLiz+frAy76sY=;
 b=yaMV9wGLNwUsbdJeT6x0xXwnmTUPmgMgiUjwPX+fnQjUwMg4d5z8jVduihBQEDCh74BPvpZZb3XH30tLaaC3/YzcmCQ146U0tUBugKj0Z17XCn5D1zsy5OGD1jmFHmjMHYCWHRrnV9e/k4mn051vK6OSXXNOs5wD0A02jO7x8W4MsfLIaHw/YjpzVDNGVPMD822iicViejox7Xt55Vv/xva79wW8KAeghagYaknOk4CCirNeEamv4/nXp9DluPuOZcgCx32bcUMRaN2mq5N99V5fgCW5a/y/0h2t+9Vuo/ZLck4D+pmxO6Y3PG+WD0shqoiz5u6M8S6nr7lDArACOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WrQtLewDa3V8HgC63ybwGXqIVuupV4aLiz+frAy76sY=;
 b=jQ1qeBqnw01JJxYAQ6qwDhGBLlRjMYIWe7/o/w91AUIvF6zeShfmHBYXn6fe2WotSGw03Lx5VMeO0GTPlkAzNme3aPJfPgRWFH2VL6X/m994JIPPtGgeBupkVPKFd0MPZiaFkEh+9DubcbWKdFi4NgVLvAR9yJtWk2tL5Bfgo1gCrGWrMOmSKN4jFOFaEpSVte/ADEyTh2Rxhxd5dIiXGr+WEC0o1WcyOVfrc5keG+KtHAAfPYs/5cUnWzDuFoLkoe3hdGeq1w0qsos5PjXDi8r/qM0uwsbVANJmC5SSXbpZwvsWOcINzGm04xM3OvliPDZVNjkzBvl4HIcpLf7i7A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by PH7PR12MB7841.namprd12.prod.outlook.com (2603:10b6:510:273::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Wed, 12 Aug
 2026 20:59:43 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%4]) with mapi id 15.21.0315.011; Wed, 12 Aug 2026
 20:59:42 +0000
Date: Wed, 12 Aug 2026 17:59:42 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: Re: [PATCH b4] Support python argcomplete
Message-ID: <20260812205942.GA730363@nvidia.com>
References: <0-v1-fa59fc5072f8+1cf9c-argcomplete_jgg@nvidia.com>
 <178649089889.9692.12784108932720626823.b4-ty@b4>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178649089889.9692.12784108932720626823.b4-ty@b4>
X-ClientProxiedBy: BL1PR13CA0009.namprd13.prod.outlook.com
 (2603:10b6:208:256::14) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|PH7PR12MB7841:EE_
X-MS-Office365-Filtering-Correlation-Id: 824e829e-21d8-4994-7464-08def8b4a1de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|56012099006|11063799006|10067099003|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	qMqZbZBS3iyt1lnnvamyVgSUtHJqIpP2wRPZ8FpkA0WIX7qdvseMVNuROm9WhnVRWP+SPoR6WRqattoEwyTCH/9AnFeaBudS7lOD/dTr1omcGGx8OG2WI811LHdkiKRH3gChwpK8dz8zFmdp9DJRXmpvn3CgMRgbYliY/P3FW0jNTdDpkaLkl9DHqMgsM58iZmzNKEX5Pvgl1uDwVic3+cDlLtYbvk9OWoEAINyydWoB5okVgxVgXWwK2wGV7E2IfhMLmBiiksgrjGPuIi/J9y1HAAo8zifYybcTySxBWmJ54mTshxuXfHCluEnjFJ+PvD7QU1hZFT093bTXwxOmvWKVjuTUoJpL7G/sGsLq0awJfukFDjNmI+mRk0rMQmQkMbJDOzEYfgP69nih+ifyVkSd2zcJ3ARo9WAQLP6HoWxJwsPeIIcB9hfnLgjPgUnbhRad7odytaNvHWv33B/tFdD80gwJgFBfvnVu2dtSLwgqvMkOnvlMFrSAdyCHWsnPK8ADel5pDGNQ2JiwG804e0OxAgbDHg8Sc9yu2Roc4YidO5Lt4eOZRthieWIUXa2WQ8s8dg6IXcXz94qgZTYnmHcqGh/W8gN3UXVWzqhMhW9s4kBm97N1csW0+4Cco1Tf15rHdytOpsdqxjxdaYKhvQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(56012099006)(11063799006)(10067099003)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rdZkFyGaUQlCY9hJOEh+q9Oh7xxIPE3ViqYXnffC+lHzpra+1BExIF6IFIlp?=
 =?us-ascii?Q?QjGfXeEVwRI6Bu7OR5qU7j84cHaimguuHRe/azBF9hXoHpZgayoWKdzJ9DTu?=
 =?us-ascii?Q?zIgOIuatSTrXf84UJrzWU59HzxLDKI84USiSsKN9SdV6eev02Cl2lJMZC+bM?=
 =?us-ascii?Q?ULhuHDxUQMMdkpShW9SU+TjErTFnrpmStgQlNCtCpKIrr5Qq18b8poP6a4GT?=
 =?us-ascii?Q?K4mvVdJUb5B0Xs4IRvOqwYMMAp4iDf3Ip2gaPNjzpeUhzGfLGexmsZ/+kMWs?=
 =?us-ascii?Q?Ew9HrQfF9BvHNxuAEkWtoNHCWQwSj8l8LGpmcFh+pXpY/pyC/GAe39S9BYCm?=
 =?us-ascii?Q?vhdKbn05y3Alvm1hA1V3BomRxlVdo2Pqi+ZTQoRVDON170nFO3QCW1+ljqVA?=
 =?us-ascii?Q?daGkt8NnGeEXAkWFtpVr4RLm7KQYRW19bP+gmIU/Fpne5NWVfE0YpyUj+d1B?=
 =?us-ascii?Q?YXh3iWpWn1noME7u6a4+IJnv0xltSrfcBpD3tc68MSV+qsZu6K3cug+v7urv?=
 =?us-ascii?Q?QvdOnyx3RqMDGu9ZvKY948XYwiV4DECdBzJBtoJdBc388uqlsnz1UK47mMhx?=
 =?us-ascii?Q?Mv8m3JO8HEKWwf68ymTjV+5VPfGYI4HSu2NIVk33XSG3/iKGkpkRpLxGe3lu?=
 =?us-ascii?Q?szf4S21DLNyKhFnTiFiN2g8wgnqNHqwkrcniAI+PBWTckFyypbY387zrdo9W?=
 =?us-ascii?Q?tzQ8On9iwYbrpDoFPoIqB1pU+w8LcAgeBTqygILpoYn9//rggEDk/k3gMwAl?=
 =?us-ascii?Q?5PTefVvdrO/gqUB+uxCwPkyC8sPUfP8tIdGc57MpPSOPF/HswX3uNgsNcnVt?=
 =?us-ascii?Q?y2VnUU+iWn5Aw0/09rBE6tkk2gwxDw1cS0PI7EvKaxNFEPPhOSPDs7QaoO7Z?=
 =?us-ascii?Q?6pJ8JNw/jP8xqqxtaszVZLKEBtdbbY/1qIjxmyYFPkVn4wlAkv22dNsDqI2U?=
 =?us-ascii?Q?BDrASKQ+GXn2Jt3dRC5YvBXMkic90HX2gyB5SeE3rivzRwCJV9hsSslLjtw2?=
 =?us-ascii?Q?4H7xkBC3MhykaD4JTF4wj6/CPQOJIe+Ba0+UF1oWaoNEMJsosvfEEA8yfeJf?=
 =?us-ascii?Q?2y9gMUVwTp6gDgg8uudCFT3O41xndCMWvZTXMLoTI9Zc2DrMFhTpe4u12IOE?=
 =?us-ascii?Q?yBFQWdqOeTc+vanK3iv4hTQv+HAa3fMgaFIIwPmtYS76+ia/nNIL6YszdXda?=
 =?us-ascii?Q?xDxZq5bstxjlue5XT16LRXDo0Z6Z/KiGUbU4Y5rMk1hbgagyybVl2AyFiTPI?=
 =?us-ascii?Q?7hWPlc5azyTN/SCdaU27lbX2szz0oglNDhQI+XpYl5ZR19KDFk4hFvFQSdBC?=
 =?us-ascii?Q?+8X7B+hz/jL1haS5ccAC+wk9CtSReUPrVHwAX/vb5oyyy6RJvpAPGp5FLVzL?=
 =?us-ascii?Q?ibogllkP3TRgQt9XQmRAyhXYdLl3/GbQE2qx7hxxxcAt0XiB/dg9/JFXA4+K?=
 =?us-ascii?Q?bH630tb12DHwYtj6/RGgPCJRt08+RmcEb6vZW4BO53Is8O7sToAo1G7FQ9v5?=
 =?us-ascii?Q?vslrZJswCfWbpkd1e9Vhve7vPwhZ5aDp3NgMNcE+1dSit+EakAAQPHv/SsQC?=
 =?us-ascii?Q?GQKMRP/syf5fImszM6HPhDynDSC0FCaEO8OVvizj/HsRz21DFOhzVmlCNFBv?=
 =?us-ascii?Q?E4yfjIUpGcs/GcIzp1ekfLoNNfA0QwH0fBlp0HPkbYKcgSEcxhye55k0YWsO?=
 =?us-ascii?Q?9Adqxr093ya+atCxQB+GyGKmcOOzhvY21Z2HDwGBp/XnRFnWzMtPbYmO0LXt?=
 =?us-ascii?Q?iIafpXScSw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 824e829e-21d8-4994-7464-08def8b4a1de
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 20:59:42.8749
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k0f3zt2JpQGAdLeTCY1HYashOmjnD1toZ9nVd/SbkOgLqegON9mU13uM8HiN1+Fa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7841

On Tue, Aug 11, 2026 at 11:28:18PM +0000, Konstantin Ryabitsev wrote:
> 
> On Fri, 07 Aug 2026 20:17:32 -0300, Jason Gunthorpe wrote:
> > Support python argcomplete
> 
> I've applied it, but note that this immediately fails ci.sh. I'll fix it 
> up as a follow-up.

Thanks I had not discovered that! I will try it in future.

FWIW I am trying to use the b4 review to organize my unmanagable pile
of patches to look at. It seems very promising, though I have a small
list of pain points I may write up or try and fix :)

Jason
