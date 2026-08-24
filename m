Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09ED1371867
	for <tools@linux.kernel.org>; Mon, 24 Aug 2026 16:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=100.103.45.18
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787589642; cv=fail; b=oEY3GP49uWQ1lBz2nZpzwe4ZCGf7CJxyhdRUYrCFIjF1GyqzL4b+VPYuyv77YYaTVeX23RtBNXpaq8XJmAWfTFbGXQB8EmxEx2OtApOI6Bs5pDoQOpl/KTbO+pawv5WQPBTLCi19TxY0pxB1I/XsApkd0KDNZEmgnD8hHLJFx70=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787589642; c=relaxed/simple;
	bh=lybWRR4fQn+7hm31X/seSRFJHoXxJjERwPbyBdjBolw=;
	h=Date:From:To:Cc:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=A0OLDd9zqSTkhUTs+LBOpoujsR5Yb05eDmHq7BEBHq4OPwrc6hVc+cZdi5F7FjBdnF7P1IfNV0HA6Igbiuf6aXV3pxPoRk3V5TEwG1bqdzxzH4uIv8Ypp2d3hOdySkorZvJ7s16DG8XumZcSwnDt0QYkHDHjKHm4Jwn/GKcN9zs=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=F5xaBpXG; arc=fail smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="F5xaBpXG"
Received: by smtp.kernel.org (Postfix)
	id C73AA1F00A3A; Mon, 24 Aug 2026 16:40:40 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.46
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1787589640;
	b=HTs5RjNnunb5F7quQfbjZ2jmbHsjO3SkQ4qr+D6p0gNPbc/cy9rhIo40Q0XVh+KfF8ge
	 Fk7y1N4Q+d8uE5NdoOVwykjf0PzBzOVlbwE8cbuXfmNulaWk3odo9iu8iNcQeVnlaItfG
	 +nxHkFGLI3VT/Sv3/BCkTDx8+WJurSBULFdYVvThXt5sRagdb71Sni4nSHsapRG4R2gt1
	 qYVFwnNgeHxNv5ADh9DJDKkiOT0y/yR6Gl7e0tdIuWhd1N3+p6iNO064hpP1ST5Kb0i2/
	 qcAlRpsHL7MAo12vC63Zfz4Tr8QFFvmAWQuQptBSVuA5goHT+GFFEk47IGiZ3PM9fYQ==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1787589640;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:Content-Type:Content-Disposition:X-ClientProxiedBy:
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
	bh=lybWRR4fQn+7hm31X/seSRFJHoXxJjERwPbyBdjBolw=;
	b=Qno6GcwluBv7+RB91idDjt5AfgjTmTce3kn9/5GbfGzlJR6mXVQutfjGNKvqT4ZvbJji
	 z6aaKfpfP7tvODYQdVR6Z4Xc4pLzOQb3Oey6gmuHn+MR6dbfW8mg4KYKqTIy7OBlT8tq7
	 yax7u/IjTmwwcqyy9IR52wM2r8YU8iKPzVhPZjjAnDzOZkOyYwj5GyWnFE7ou8oXz30Qc
	 LGaNfMMIuNFwtMMgtg3nQXEiUMl1cvMCVdFN67/jbaClpl5FA+iial0IJpcBSwYRgb7+c
	 GZ0FqSgtgEQlc4Fe9UeY1u0gggn6WJspzYsswFApqCxWYQZNWSplpo2yRJ0nG+EXs/w==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=F5xaBpXG;
	dmarc=fail header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.46
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011046.outbound.protection.outlook.com [40.93.194.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 29B571F000E9;
	Mon, 24 Aug 2026 16:40:39 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=F5xaBpXG
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 29B571F000E9
Authentication-Results: smtp.kernel.org; dmarc=fail (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wl9u3MPGhGEHWT5I5t/yqDaaUN0/ElJeGV/IxELskhOmeJCol6VMuRRz0BMI7dqk1mn2lsylaaaw2ce8VoNM2HEVdjRgvtJzW898zz+3PjsbMW6oJ4e8GoR0/axSevboSTMKsGo+gNEX9l9h0MQp3IKrUz3dbCKvP5weCQXyIAbTxylNbggclr1AzDFnPg5lfxNmHeYbeuCiIRiSk01iHU7CjSwCQipw5s2IXGJjgLpLNg1XjhPUgPXJIimjcgWuAR/OKd2aClqbPo7ooWTcjXBiIDai8vIoItuMspeo6PWUh2a9NFo5EnwjaaSwILc1sFtf1adntZDXOmXUaQjR0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lybWRR4fQn+7hm31X/seSRFJHoXxJjERwPbyBdjBolw=;
 b=jFU6gGajOYBLU4kMem8V46dtbv5Kd5huhMkGIND0gAyHjBh3EHa78kVcL6C6CpkGNmegjVvkjLUGkBLap2rqE1zl2QT5Ct4jHqVX+LyeXIakhxxLQFUBmMj0VSBKMNuFOcRvfe7xpuARF2KQM2Q0NfHxhGr4FUH6bQer9WwuibHg3qamP4bwrFRzN3AQW0/1PEugOl7jNGpVRGbp8xsMRrOf6TWSyYL9MzSxmVzzFIcaoOzDzM5W5B46+9nuPhqCWxNwYpUOBlbVNsosNCj3SMGZ74J3mqkCHP6+56G5QVOhiOLcljjkLCXRKKYRxQiOh3RjqlnWDgitVNosbg+Peg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lybWRR4fQn+7hm31X/seSRFJHoXxJjERwPbyBdjBolw=;
 b=F5xaBpXGxVVGkt2KFGJEpFbkixBvGuSaq7sszukKOkmBUSGFygQ4qmARC5khM3kx0nimgl0+qhU+g59WBuV8yMS35AcxQR5DycZjFkJVr8hMYQOi0JTpVqiPT4Ps8cqC6R9fsRW2p7FuxVY6n7Uf2IiF6PORzoDJHb0lcqM6Gb1K+N67a59jyWMFatWTacvJrv9Ian9pdX+heKKOokAI19uXw6ZzfJUi5B8MIoB0/6PSV64O38PEFeQHkkBq8OK7veDTJYXiGhneWZjjPN1gW7LmXSZ92Z9uqyk3WuAv4sZ8dlhuG45dSAnwzjvzJwEsef6VMh1GOe6JQUYj5PVXGg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by SA3PR12MB8440.namprd12.prod.outlook.com (2603:10b6:806:2f8::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 16:40:35 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%4]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 16:40:32 +0000
Date: Mon, 24 Aug 2026 13:40:31 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: tools@kernel.org
Subject: b4 defered branch checkout
Message-ID: <20260824164031.GQ244917@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: YT2PR01CA0001.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::6) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|SA3PR12MB8440:EE_
X-MS-Office365-Filtering-Correlation-Id: 337c2c19-dfa0-400d-2524-08df01fe69ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	A4PEkhIqEC0jY2fxyh3UoIxKPH009apq6gm4hQExqym34EBDz9wRoaizpLlSERS57VV3475rQjaFDdGwTDvoswZV5URmFOlw4B3Ha+T1IoSNMulSoBk/Xzmn2ooTnJD8mWhqwweSwtvrEVKc7XfXUENvkb2K1QWzxKgp/F8a2pJZMD0mAcnPk8Xd3uQOfnVKGbEGZT8KEVRNoSK5/huuVGeNw78wNuiarMinZiBL0BDPTzWLXM98LOE2WD4D9DBZ2P3KtkGSJ9oZ2uU+2/VgxHDcZUoA69SNLo0aslYqh1w63pxzpuCEqHhbP559lUmNw6N/b28sJZwdPt9ZDjAstgCBOVsTMsz0XJlEId7RkELJWzNV/zQKgC4qdeDEhd6Auv4VvjKpZVZqevuVd81CrfZiikH2WjUS3BzeGcaJu3nyiD8Ahy44hw2SsK8EuYAG/7ngBDoPnLxpuC9J7LOBBqcTiB3iZjWm67nQYRlXNJmCtiGtyEm9ZH2CKy3EG9FGpZvrY0WaE8iddQu05KE3Dn1ODcvOXU3spJWWXCVrDuuSoWKj3DregfY6Si/FJNvR7gdiYfsMKwwtaBcUDB0z0Vf1fqtIBuVveuURhmnOegg1yVKV/c+q/kRpkvTEIObAp/pSSv+V7m57uAEzYOvvJQ0WImC3fy34uo71ZFoWpUc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Vxd2uUaBFppXoFhHcs/T5/l3Ea6kcakucWPhtT7QtBHyQ9vi9nPuErrlFQit?=
 =?us-ascii?Q?0YmAEtZM8FmBlT+uz/Xccwh8WWeEgBzVJ4aQPEbttMSQCi7AqV1R9bzggsf2?=
 =?us-ascii?Q?gFEZz+RrNKGHSzqUG35WarrcwtniwWSJ7QL2IapnnPDXftBGtNnPZjHWyztM?=
 =?us-ascii?Q?WpPYv7hxTlz6WtoeP50E35lMIJAU6z6gR8GOTlnsv3o35VbdY+uZYRWj2qeh?=
 =?us-ascii?Q?awWSxCBdsWsb419WEtxCZ/vnsKt9vdTJ9ycZMeNEgX0uxXZpjmjiRTn4UbyB?=
 =?us-ascii?Q?BxAhIMqUFUTNcgcu4dW9mfghpmpcP/Jh1YMyvb+cL4lSO3XDJSR8R4D84Nn4?=
 =?us-ascii?Q?rStT1hQbdIlXYapqs+sFMfeWA8cgT990f2n59a403C9QUXHqCLi/Ns0hmPb0?=
 =?us-ascii?Q?N0v79AiXenN5LoFW7VSU1/bjVULy3wWGGR8F6G9BI+jzgB4/6c4/IUC44OxA?=
 =?us-ascii?Q?zvpyx0P+TVa4Dj2AC8wHOxB2uQWel0sWCejiFyVNc5qRQgd9Yx7vzUHl93u0?=
 =?us-ascii?Q?WJR5erDeFLIQwdZ8pBNDReCA4QKcfCpCSo5T/puR0eP+H5nQPtmej1IS1CNv?=
 =?us-ascii?Q?fV4DXCjOjrxWQdz/2RagpLuZBWYOsDz/y5jtSn6TVh1XLEd6gyfxH2k5mc1j?=
 =?us-ascii?Q?OrcRtudRUc64HKye6bHWG9I4Glj87XUSRw/bB26Tn0AKTK5tnUUyw8GAaolT?=
 =?us-ascii?Q?KEc8bF0sFc1mkXgSSqW0oTescQfmya0GSTZF5CvqS+Ifp5XwmgehtS0mqqJY?=
 =?us-ascii?Q?zFsZjSB1EMv9X/hFiA/VZZNWeKO0kifQ1pCZL+c2QVIotESYgL7dIXlJM/vi?=
 =?us-ascii?Q?P95nc/ohLuRpFqF2umnM0CF2AvCVyg6fyKdttX8K3eikJ5nfpEar+jmaU0Jc?=
 =?us-ascii?Q?9oy3VgbxXv0ssxxtgyrPVXxo0tbls2Ok/wQvBJodOcpvKA8EAxTvPnqktISb?=
 =?us-ascii?Q?V0EXBiCKyKkRDRboM6tm7GfdBVrwSGna6+ZVej0S9Vei/b7ExMiCWCOTgKoi?=
 =?us-ascii?Q?yN5pyzDRQRcI+otNz0OAxhD9MFlWR1UCAyUwTKpnqQJ2VFW/WdJgSBvI+Z2y?=
 =?us-ascii?Q?6+B5NYkGYnB4fuO1RkkHsGZyi3FoFmbs8GUUF2647GmtMGShCtZiL6NK1JsQ?=
 =?us-ascii?Q?m+3CuGXCakSjtqNR/jrNxN0ueBAhBLEycPX5M04J4xyFQoZDFvtal//Qmi9L?=
 =?us-ascii?Q?+Y54mBeE5Z22mbFgX+1n9nXvh76uu1VfvPO2eM6x9SLe8IwgZ91Y81VpNiKN?=
 =?us-ascii?Q?mwp9cYvll1Grzsb5gwBXU7BNm+ff+idYqFrjcmdx3KUWHdbrLn2q1SMB4fEI?=
 =?us-ascii?Q?bzlomP9oB8mX0locjZpm4TsQQUKliOZ2WV/7sSQhvMEzD92WpH5LYVErjmnu?=
 =?us-ascii?Q?JDok6beLvz17z0bCMGolNO46TZ4MqAdp7ZqMnyT8k9Ni4vQAjYxUyEW0/Emn?=
 =?us-ascii?Q?ScbXmQ/exsyk+PTjvjOUwFHNmZHoK9jvulTEJRwlM3h7VPpdrj6Lhda9o2fW?=
 =?us-ascii?Q?n0mwIWWx/EXsAVA2XAKTWYMxGQnMR0MJPAvhkx1LLsJcSUd0qXSjNW8sm0EF?=
 =?us-ascii?Q?YxKNStbV+U34+mq6eZ2Q273vJ/6D6sWBcmBLa4BwB1MD8cCSHM6R+NnJHpG5?=
 =?us-ascii?Q?BJOyHIundNQ+EdXSNJ/t931fgy1NWssIQ5HQuIk0lueTMd0f9KJoRjkg3zjT?=
 =?us-ascii?Q?qRLLVBYZ2hHR90Qmf5EK5Dz4TpNzRh7ZQWpNRgm1Ekf7l+e/?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 337c2c19-dfa0-400d-2524-08df01fe69ee
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 16:40:32.2388
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sz/olVYwaxgQ+qmhq3kjjT8fvUb9bmcs0xPqmcPVO6pabMP/QcEys/HcF9mv507p
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8440

I am looking at commit ad80ce422da0 ("review: defer branch checkout to
shell/agent use") and think the way b4 treats the checkout is
inconsistent.

If you <enter> on a fresh series you get the series review
screen and the worktre is (usually?) left checked out.

If you go back with Q then <enter> again, now it isn't checked out.

The above commit make it seem like no checkout is the preferd design
and the residual checkout on the initial open is a bug?

However, I actually want to have the checkout. I want it *always*
checked out for review. I want to use a parallel editor window to
inspect the applied series in more detail that just reading the diffs,
while continuing to use the tui, I don't want to stop the review
workflow and drop to a shell.

From that angle I view the above as a regression.

Further, if it doesn't get checked out what even was the point in
getting it applied to a branch and fixing the conflicts just to get
into the review screen?

I get that other people may not use a dedicated git tree just to run
the review UI with, but could b4 support two workflow options:
 a) never change the checkout work tree
 b) always set the checkout work tree to the current review

?

Thanks,
Jason
