Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E395739D3C0
	for <tools@linux.kernel.org>; Wed, 26 Aug 2026 23:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=100.103.45.18
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787785938; cv=fail; b=uO5u0bb5Trx2385A2kh+QtkVKG7whM/Cr/tuZ1uINi0laiXJp+8heTq26IbdiuIrKAXhMErUDsYOuthZDMjXVMzGYlrLwLNZMc0cRzKzVAbzA6G2Q058zfvdhdgaGMcFjSIxqk/xVdLOFdNWt0Y21JDWKoEh+pgxMG1msQA3xg4=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787785938; c=relaxed/simple;
	bh=imC2BlKHvpnA5EUTaAsz9vDL7nfQJU69q4L40fv0B9A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JVIo97lpuVr/u1u91/IsmteXA0fAt0kxzvizviUhkXK0IdL8M/MTMaHKLj0joWiZTQ8ChoDnfTaEeA3AY/BeqFavLYqTP53T1MzL0XjJ4agErgg139FlaD2lYtEahZeTxFH5GIc8Ael5tKBzu2kTm3etv9dUHkjXb7zRY6e1o1g=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Rom6iN5C; arc=fail smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Rom6iN5C"
Received: by smtp.kernel.org (Postfix)
	id A355C1F00A3A; Wed, 26 Aug 2026 23:12:16 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.67
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1787785936;
	b=vhElxkppwposzCx33Qi8nyBpnwx9SmrUpaEGl/lChRcxahSkrMNeeq/05FsY5pQ8oE73
	 fbF19jI/THeeIs4FSYSm9a99B4ZIAFLs3dUxHOcoi46ERvD0qjYw1J8fafXkNDMzC4/pA
	 UNvP8lYX7eK5qjdy8K1H88sF993U6TOgBOIvP//RMlpSlCsfDzZSSBdVApbp9B5BnzuW2
	 /q3p/Yx5xoNspXZISBqE9bX/Ys4drDSq8DTlNqfnOul8syYqwd/DazQXsWXIFn+M1x1aN
	 tbDOESTeHKr19+nxlEAPBn3/PZoJxZAmbmazYzCsFROb4yRFJ+mDq0A67dht0nQHKcA==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1787785936;
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
	bh=oamRLA4+Wx752mQu/X/sp9/+wtLqMikDANmTT7tpQd8=;
	b=ponmR7spkMvP3SFf8nlddEKoP+GSlAXneYgufFZKMupDDYAzIgf7vDu/xUYT27LEEf1Y
	 38Kzdy1FStkQEbttkEpH3nh3eXZIetvgYfBWK+b+/9DPMRgtJY2Yc1qVB+AjOJMk8wayL
	 Hym9Hpi2r6IFPl+OhBvSicltZC0u2w6y5KdOXceU1KJtZgZIjL1Joqj5D7lByR5VwFFAL
	 2EQTe8FYQHvOhiDpSE0mq/juhTLLNZ1HypQ6QTS70DeV6BMcSHcFO/3GOxxOkCAlclV1S
	 KyaGbmE7BLsE9KDmc8KpdqL0pgZEsrfJU28Hd9YjHqV/CyIThOaJ7oUV1/+QV8hwbqw==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Rom6iN5C;
	dmarc=fail header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.67
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013067.outbound.protection.outlook.com [40.107.201.67])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E05991F000E9
	for <tools@kernel.org>; Wed, 26 Aug 2026 23:12:15 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Rom6iN5C
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org E05991F000E9
Authentication-Results: smtp.kernel.org; dmarc=fail (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vakVxx9Q0Kp8mEQW+giI5fGGbDTK6LE+bsp4Ss1yFo/dZaU5ekgilDIE3wbCgf0n4ztO9YENvVI4316OujQwWLt2+3veC6IIx37cDK0VZp4ln9fOJg7ysUiEq1tSq336wSxWCU7DrKHvZSL25Zte/tN+sq3EPR5MLDstN0PPbdGPWyHhyhE3+7cDAsLSP2SkRe/ZK+w3F/9/STi3kL79mDE5PamJJguyTJxkThr7EMtM2a+KK6PqRgdl9IR3IigpFWO5/84v2BMyc2JPKo6PM4asJ30RONUKh90ePWUkb996OlG+eWata7AbaRaHVfVeJ568omSnSukqdTseePsgYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oamRLA4+Wx752mQu/X/sp9/+wtLqMikDANmTT7tpQd8=;
 b=jrhg1V8e/KIAj0iTcauH3D6nRugwuRZQYZFpi2c8A2gV9N7lWwPrj9OxL2rwoVg1R9Vhxyq4GuxLpTmOY8gyyEg5AZr40AIYqLTUbbiZ+fyxGdTr2f4xUpt0NbZAR+JPkeOyxW5hgUEdqKx5+bLi33LY2P0cVnPipObJY7eq98eR8iRdiqjeUfEepktFF6yGCE584zJHLZn6O1fpnGHP/IM4RICXWcIJtH/OsLKlfkamM8bf2YHlwVtvJYJxkOeDbz0UpG6o3R6BlIr1RVgVl/nVqIyUcfR18ilvg5aeJynE2MSjer3XfGttN7Lv8XDbNkt6sL3aSrUnkKcMuSo87A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oamRLA4+Wx752mQu/X/sp9/+wtLqMikDANmTT7tpQd8=;
 b=Rom6iN5CyKSUJu2tmUVwoyWR5LX7oJyUTDkLRCNwCAXbSTtksGY/X0ETaRKT13GjK/Tj5A4UfbgvSS6BjTsYXbjYT8b3qR/lhYgi5yJNjjgKhrxmixY0Bs3JjUOWGTz1YLjXMwd9fdTkOX56pGNCwLhL4jTzi41uYd42Oa8Hw37e59JTp3wdu36yrcOf/yh1iHm7riw1v8kwjoyqiE0hz6y7on2H9C90kpbRpF+688MA9QGO6oWy2O526H7YpMdFKJaaXiQ+57Q1UgkJhPhkn7PR2NaLFGR4mqLvAMQNfx/3QJzggZ6OVjoxoiV96C9U1nE5Nc8LPqgeFycqIV7Ncw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by DM4PR12MB7576.namprd12.prod.outlook.com (2603:10b6:8:10c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.7; Wed, 26 Aug
 2026 23:12:10 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%4]) with mapi id 15.21.0360.006; Wed, 26 Aug 2026
 23:12:10 +0000
Date: Wed, 26 Aug 2026 20:12:07 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: Re: [PATCH b4 3/3] review: add >8< inline marker to snip quoted
 reply context
Message-ID: <20260826231207.GO3325090@nvidia.com>
References: <3-v1-5f6173f1d4bf+3e9-trimming_jgg@nvidia.com>
 <178769314159.3594992.17501322825534621353.b4-review@b4>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178769314159.3594992.17501322825534621353.b4-review@b4>
X-ClientProxiedBy: YT4PR01CA0384.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:fd::13) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|DM4PR12MB7576:EE_
X-MS-Office365-Filtering-Correlation-Id: 474ebcb6-5f2b-47f8-b6d5-08df03c774bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|10067099003|4143699003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	nJ7Z0mRfUfzl4ro35q7dg5BrgNzFDMJBElFPasf8P+hYyuSvJAAFvfnOrR7mueK51VcY0DuQqByH04omWVCj5hBiG5CJTffTcirl00o/IJ7rTxbPGk8Ab/6Vu91bBHlwX+BROKNH9U0D/DuzOQQwN2UnltoYlN8RalNCpAEu8JF50sCNG47bgTOL9+dcNZd9LAhI3xunrannCMupklNKxQ/Kx/YEOr1pNvIjGR21JGfT5CyjOH/XMWP9GCj9PNr30y1GFdrlLxm5BM1nkkl8IZRAC7bBfugCoSrx401XR+0rcAll3/UnRUOO8IkqahAGGZpp2dEpTIDoB3IEG2BjT199Un5GhfpO2wWaA3JCnUpggnsBzzCdYbi6ufNGCsrcPBkBS48PIs1aJxAq+oIza2LHzWxn2w+UOQ+mKvRxffp7v+9++hq+ANgNKMEBiwzmo1MNJBGSkW7PFUIxyxg47iBUYpqI4W2A7Vwc1AeL+F1ewF3fqD7CL3yJuoSHd5S5UbzQLoyJ04T+moHlpNwNqH0ACQCRmfUtAg7STwPJFYGoXWTiSUEqiDUKy65zcrploFov4wPb5ArsQ5q6uuNRsAYerXHSilVP5dLtzptygd4qXY1lABmyHkrfZlfRDqgM3tOGq/1Ws9dqor/tvvYr7jrHKtokF4HlLSLz+ZAHK4A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(10067099003)(4143699003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1ts3exkdyUw15kHPxojd1XGtT+TBxEKI+Em9myDYkDiHIk4wM5KXsJ/yBfK+?=
 =?us-ascii?Q?xbgx/Qpas/cHEVEHlMuJiS3D64ta+R1KxXfzV0JPNTfVHrKXlzDRccBGBhpB?=
 =?us-ascii?Q?mckBgUNcXfZ2sqeOV9MNzHNh95+aUlSb1HtLUY0b2rZCGl1snLPOr2QsX+zZ?=
 =?us-ascii?Q?sY2Otcp2C1ML5tUPjNmTx3UAwgKHLS6W4eDuhPjytdhUdhB2NtoDgxWl20MZ?=
 =?us-ascii?Q?XQfFPsL9v09cpgM4i56DX5yzJueDu+W0pYsWKEZTpga+bQU7zzNcwWmcaEK8?=
 =?us-ascii?Q?vkn33vsG5yNbS1Y+1QbvOACnZIs1F+Di36GWZOsvUx8YQpqeoX5+1SxIsiED?=
 =?us-ascii?Q?plDdISAZQf01LsUYp6wfhYbqQY/ZdEA/LLRpFjQ8o7dzRC/EszhN3M04nYAl?=
 =?us-ascii?Q?34jdo9ObU84hhdbv4Yo4WZO2epwofnxdYOjd3YhItjRntBnQ5dGtt78ryqtW?=
 =?us-ascii?Q?5uKUytVHStLT1AVCRThh0I1y/ndHuwWTme2vmDGEz+SmbbD9YDO9it8APfkJ?=
 =?us-ascii?Q?37Zn4z12pEqLfVMaeWOVwKja8REtYfvfHZWgaARWAxPuWbf24YsffBqNC6kp?=
 =?us-ascii?Q?wuP5eyt7soMys76G+9MTH6OyHxGiwI1VmkXu4v5J771AwKw3qkd/Lnre9bAn?=
 =?us-ascii?Q?6HD1FWAZntUkiyKzPurhYyrfWdbAdqy064sNfR620La9K9NYEKqZNcItVhfZ?=
 =?us-ascii?Q?U9Wond+p6r2Sz1OWn0N5vuK1/2VgYpvgQkfYLLRBPM88vR60g59NnPWCVm/8?=
 =?us-ascii?Q?z4a34NZovNrISd+mD+r+rc8DC9uoMqZnj89svc5qYCPbttcUVl4lIpv1uVSn?=
 =?us-ascii?Q?kqtUetUPF+sy2JQbb5iFIU37+kfRMwN7XNwz4hDi/4dhonn+rOjqH5cVHErr?=
 =?us-ascii?Q?PbRaiEaCitmujazchUrXckhZUdh+E2VSedaTLUVQY366HWdwJCwFMWbE1tBU?=
 =?us-ascii?Q?BFg+YAw+PfluA3IMzliUorUg9GENlidDiJP9E1/kYzdkOQr9EsqTYaneBb+B?=
 =?us-ascii?Q?4JnSOltMJ1VEsnSk0VYXZHlU6m1rinZkzxj2v/SOhVLJbMRdKOuMpBCWKvU1?=
 =?us-ascii?Q?xTam9q+EhiwbYwA0s/BbA6or+k7Mj5DENunwNHTGoQ+tpwYQ+24DN0UE1ITE?=
 =?us-ascii?Q?q26oEMDjWIn5lbr/FrpVz1ho4HpNnvyPvItJ23dnRZFtQbnB2gW9/FHXk6x3?=
 =?us-ascii?Q?/PteYPNvpxmvblxpmFhTeOZlX7pj3pYFzP7B9+sULgoPmVC8ypaOxgNqtHZ4?=
 =?us-ascii?Q?RkemV3FwsKjI9lD368so3rib6JrwZptR1i7KmShVoiGK5ChMOX11NEsousY9?=
 =?us-ascii?Q?aooWJxOFBcFjsE3fuicmjzSw9HptwaYAmwb4nR5Fsql7QmQwE0DF5ZADKwKQ?=
 =?us-ascii?Q?H3jkmjFrytT5usSCdtAQ/3hnw8sO0mJQEQ1sqeEXZMpCEBX+2zq0/39ELQop?=
 =?us-ascii?Q?EX6sD/RIAvWvQl7XqCrntr7Fx4SurzbTSkGIQk7rvXyAwRvvLNnZ1/QmVJG4?=
 =?us-ascii?Q?HcjGgcufkrkhBFxrfyBXhYtyfK0+mDu0QQMeIXiyyBQ3+cX27HkhUFUCgRcP?=
 =?us-ascii?Q?zLWXunkjZ2WVrZUluSUO4YQwXjZosLtwvbIH42bLr3Nzk7QJp27A71oYEJiW?=
 =?us-ascii?Q?4tH1uM50McOe0gbUsW2DOLhdBXDonAJIokdSrPUudGcmVfWFrIm0cnBcRESN?=
 =?us-ascii?Q?xf6ELtBFosJYVaxe25c2Wn6n+Ar3L7Ig+fVOUPu/xoljiFMb?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 474ebcb6-5f2b-47f8-b6d5-08df03c774bb
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 23:12:10.6163
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gVHlizQdfbk0wi2Bj9ByHIFanfqAXq5vR3fIOc/NOKxHobU28JwwH22T1QUA8yD2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7576

On Tue, Aug 25, 2026 at 09:25:41PM +0000, Konstantin Ryabitsev wrote:
> > When adding review comments to a message it is very inconvenient to
> > permanently loose the quotable text. Often I will make several passes over
> > a series and the nice b4 behavior of keeping everything in draft
> > encourages coming back and making revisions and further comments.
> > 
> > However, if the quoted text has been erased that isn't possible.
> > 
> > Instead of erasing in the editor provide a full line marker '>8<' for b4
> > to automagically do the trimming similar to how it trims unused quote at
> > the end. Trailing text after user lines and till the marker is removed
> > similar to the trailing text.
> 
> My only objection is that >8< doesn't say "scissors" to me, it says
> "angry bee". How about we equally recognize:

Oh, it was supposed to be > to make it a quote followed by the 8<
which kinda looks like sizzors.

In the end I bound it to an emacs macro and it turns out to be pretty
tricky to type anyhow. So.. Any of these are fine for me, lets just do
one?

>   >--cut--

How about this? It is self describing

Thanks,
Jason
