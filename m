Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 089213876B3
	for <tools@linux.kernel.org>; Tue, 25 Aug 2026 21:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=100.103.45.18
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787692401; cv=fail; b=A7DXCYExAvky55/PCJxGveCr2mtmIh7PQ5Vxl0ZImWnicNkcLR5YqsP2a2tu0r3gGM5meY3EaAaWHrKHjbwC/ykLD2NWfB1RQ3t7PFI11417TrieXjXOPqhyTbqhmbQlnkDIK+zZTf8DW5xBHVWE75oQZLhibL7KasHggRVqp+o=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787692401; c=relaxed/simple;
	bh=RoENb6z0PH2NA9MTCyYkpKhim9J+R5Lw/j1A+yzorlQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nZ/iXICjg/gYI1Kx5DU1/flS237sXDcYiDQ2iSfCVjlVq6FzDn5KKeAZkCgZq0RJ0HL5NHHWAipv3nLM3KSXxDmgznGgyFgLQZ/Y9a5HpVPgVx3RDq4kh11x8t3ucjZlAfTnHwkPkUsAZcNBSXI5/k6+VNvs9pj6+RJZ88nP1Js=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=r996UCdT; arc=fail smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="r996UCdT"
Received: by smtp.kernel.org (Postfix)
	id E061B1F00A3E; Tue, 25 Aug 2026 21:13:19 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.34
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1787692399;
	b=EjKbB18hbNaEQCR+QYF67oPBPgfDs2QCjnt7BopuI2U8s8pxx4sxpyD0zMkOv0rs1j+y
	 garajTAoAfAspR81XTJ1EknalhNgVG7KEwVrcPUNBayQ1QCtXwv3yBK7iwE6l4m5ra4df
	 TMtqiMB2azq0wu+fn6zKLSK/dxeVqhWKnCDAZNY8+9ewhlBvXxYIPoezHCciq5+UueUoF
	 1KCPAK/yFdA7ynhi05aQ9rIJKIGiJJ+6I6SJan5TdvB62mj/vDP5dHypHKubmfQPEUw2I
	 j3lWwBfsTNWj/YUIg9CDNKoGygCjCilo2+xfIIgjT3qJy40sXz8FXVVh9F9Cv3Qjg5w==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1787692399;
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
	bh=VNmWBFlkIEht2wOFC+WnE0jJT2YUzGStRHH1gMiks/8=;
	b=AOOcnnMYxYdhT6Pqbg5QGRMpE9qlA8bS/9YtheS6tu6dk1FjRtGilSty/c0MYVYI6kjO
	 Kntts85Sr6l1jW68RmIMszHb9qVJmjcwNa616urx5PzaboNfSfMbTle6Nv+PnTJBlNPE/
	 CWjAcrwp0e5r+vpL9Jzpug068y3TUVeUJCX5t0D6PV6xC4HxQ+VNjyEzE5SiN6p1QnR1q
	 ZAS5eED1Le7RJfXZwqqQTYhsv59jvwv5dWO7i+QlDTYv608nM8+Z+QxKfuAjv98NigMnD
	 AGTxHRmKIm+sE9ywXFKusPPxtpQKGi/MIZ9Mar6Snmf6M+dtS6ZE1IGk7jNf1mNzqMg==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=r996UCdT;
	dmarc=fail header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.34
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010034.outbound.protection.outlook.com [52.101.85.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2BFFC1F00A3A;
	Tue, 25 Aug 2026 21:13:18 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=r996UCdT
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 2BFFC1F00A3A
Authentication-Results: smtp.kernel.org; dmarc=fail (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=suuQYLLuTQqtqzrSd1jccdNi7KCmcsVKfB3zpdcPCeG21KIWJsTBMHpgl7a5L38Q2MPaPVRmI+OaWAe5YWKvejmq9XH7UoLB9V9KiQMSbmGfsgQuf6hDh6ftmOcQY6tyVgDxXoU/8vpqU4jXq2zrO8HosOeiGADCCHjmd3jo2P3SOrbsb29oDAgT79kvnMLcqOS38Ul6ZWdMthiGZUnw9fSlXG2B1hzf1gh5vhDHM20XLUMJuR8IfUqKvwMyMRGBZgAlvwPQcCLN73Sp/t+tdnXI7LIQXi8F/qba7yneUvHVXNh1RnyH0BXE9VoOIwG3aNoJVHJuUqd/EzY90nqXBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VNmWBFlkIEht2wOFC+WnE0jJT2YUzGStRHH1gMiks/8=;
 b=IcVrUt+2FXZaW1mNzzT5YQyCYzv80Y/29C7dFU4v9lXiAOZzTBsB4Xp3QGqcQADYHPCXfGekCwRRj3jMoN5g3E6qnvYyynwCJC3r/pDQrTJlys2l+2beYkl4DEVkpC1DdEWy0AFpkaJJP3zWmqkMoyjO8k19XOYFId43CiCQlwTkZ7dptiYukIy0saxy/Wy3bhjt9/O5jpDBgBA5rAIrbp6IT8s2Pe2YFhBnQDg43VOhgMu3RP3nhIA1bvVWsM4w9+jGWGFFBpuaqIYi/PNE/+dUrDatyUKfQRhCrssONa/t82SWFo4yAETJP75em1XQ3uWri3kaZGa/O2A7byTfTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VNmWBFlkIEht2wOFC+WnE0jJT2YUzGStRHH1gMiks/8=;
 b=r996UCdT/JB7xiQQ280lBeOxV4rBK7HikNiWwG2v5qcqleyaGXcBYX9Ju5f1cMYpCDpgo405e6hptiFGxMeHpl9S6VXU74XtWOdp4IfDATzchRFVld+Y3sFtws9xthqL+hMOfp5sGqwzgHtz9fFJ/Qkvx62U6Mev0m08XCPlOa5Y8zb+8mZNIRCRUv9943SrIGWEh14bitQGXdvVBF8LDD+Rtifq+yOlNIQdipk7LtfGPhjsZdmfUE/3BfKxNLDf1Kr0uyfY3wKnqO1IdUFFkdgCTF31m/Yud/gTpGHaRcMwv0cLrQOy6e/lz+x7sOL4fI6zv3AaUcm2PVDFyYlK6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by LV9PR12MB9782.namprd12.prod.outlook.com (2603:10b6:408:2f2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 21:13:17 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%4]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 21:13:17 +0000
Date: Tue, 25 Aug 2026 18:13:15 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: tools@kernel.org
Subject: Re: b4 defered branch checkout
Message-ID: <20260825211315.GH3325090@nvidia.com>
References: <20260824164031.GQ244917@nvidia.com>
 <20260825-uncovered-cerise-rabbit-0064df@meerkat>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260825-uncovered-cerise-rabbit-0064df@meerkat>
X-ClientProxiedBy: SJ0PR05CA0019.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::24) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|LV9PR12MB9782:EE_
X-MS-Office365-Filtering-Correlation-Id: b5acb9a4-c9d3-4697-a152-08df02edaea8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|56012099006|10067099003|3023799007|22082099003|4143699003|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	N+fMePY7lpldMtdVdKSWhXuwRAjYubwxWC8X2NID+joKBBT5azAxm8Vo9qaJ/Hs4z2lB6+rI6IsqumnAm5P1k8VNc8TFFFwdvAt0S2i6+n2SN9lmUycfvwrWFirlZ2bI/y9In7XZnLuCWmhuTvQ/h8AvrZwVX+h54l7NS3uwvRbYo/bunr47fgWYXK2j7j+FbLfmS/CDtoAPvjsZ1pe7Z/ENFEZZnBg/EDSAtqLW7QPiMInCBUW0r/rGl04946346YTR9mVXtsphHH8WnydacJjlXYfG2CRtRnDvg2mdN53VsNnR4iR7e8Dkd109hKW0mWE4THR7DO96v/zqtxD4m98wo7VmxIBoi/uw2toSGeIjmp7v02/EaDc+1Tgc07LjqJ08QcKRETovtKb956NtLopFrQ05c+kcCN/XQa4ZIlwoi8syTBcMbPIweN+CccVgMQX+N9IHlofuBhPXmhSES9lgg/AGgjLeHNtnoAZdQu5NXJkNSujKItNLiYMiIfCTQp30rtB5i/IpTBQu7pQk45L6sveFO3CKjRhfbTR85taFoSLtR2ELcPd0U8Kwcpy8veGnSM53gbesUs4evLU+ycOSWU4g6jXYlM4NtS8wvdqrbLEzjHOFOPrCMD5lH0WDB5yaR/pJJZfZ4gSzSNZz/WCWwmWUWiPVPHcOV5K+kkg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(56012099006)(10067099003)(3023799007)(22082099003)(4143699003)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?niDHceHNJx+RU8dT/DQ1v8FFxzaH/DqaRgW5HUnHLJl1zn2Yxr6E4252dWbj?=
 =?us-ascii?Q?GmTUqOh4lo1QNLaXsyqWlwYlDoYKf+GTJx2SgSHgG64Zk07jwsrHaBAxclaw?=
 =?us-ascii?Q?iumnQEWEazrjo5MuT4ggdy7ULvST8n6K9MAH/qKz3qXPrm/a0wYciVdaXZCr?=
 =?us-ascii?Q?C7GnwSeCgB79qABM2WOloYN4LoksPLx4/1+4vLRpUv32PYcVx+/1IsrSKUij?=
 =?us-ascii?Q?mxGQnzp2exuH3iHpiUWyyXdt/w9WPCAAyEJA7UtHN0OFsS0EUrwvgAN2BOtL?=
 =?us-ascii?Q?pjxDoVhmIRJqWrR5ubtYyFg+55tlaiEZkUcao1fdcw6DyYbSTw4/XJu6RAuz?=
 =?us-ascii?Q?/VkG5Gx3aoYMWfEPg8e9ep7dSGoeLI0kxSO1Zn3PCl4a+cmeVTjvkhgdY9Bk?=
 =?us-ascii?Q?Dg9NM1BlxxDvJK1ADmd2mkxllDezQtSIIAljbvzMIbc1Nd0ZWnGrJ77rey91?=
 =?us-ascii?Q?Grg1QxQBnnZs6xj0D7EwyvQd2BYG8derWixE2ZkiVDAJNXQHnqdcuLJaTRPC?=
 =?us-ascii?Q?6xIVqjfWb+werXkOC8eWBvyArdxxaoVIRJUWMn/r2yFPyAKAPc1jjy5bFDw1?=
 =?us-ascii?Q?kTJin7u+CnVazeLEtAOu4uKxpC3cbYEGtZiymAZ1IwYc70qU4fW7Grlsndp8?=
 =?us-ascii?Q?z6yPLiNprlBJoW9J/p4XXqCibDd7U2oBZNn1OBQavysSaXKQJ1mdiOGf3all?=
 =?us-ascii?Q?Bjrbi+qbRGitqHmyTF1iVcWls2YqQdJzyzwkTl86QEqseyG3H3P8e+rNkW4o?=
 =?us-ascii?Q?1vDsN6ueMYpa/ElwVXPvdkQ6Hq5PkyG3CHdetzJMCsIzwfbP+teUyN88imyp?=
 =?us-ascii?Q?nUcDj2ff+G2mPn6q/rMQOdDErkIaormuPTjwDz2PZxqwWByGbW3X3J1l/Ybd?=
 =?us-ascii?Q?7wjWfY17gGrmZoHaJSTEfdGRCzHZQ/IJLnKqIhopVLrpFfgD9Hfav1m86+ql?=
 =?us-ascii?Q?Zx98mo7cmmTe0mGXBAZHGKVTL2S1+zJ3PYzijqEAX6a52vvolVo0OFi1XLlk?=
 =?us-ascii?Q?ofmqLdy+YUR6sERSBIzgWsxaHxRoDIAkPM3mNP6Eqad07rOAxLx8h8h0PPdg?=
 =?us-ascii?Q?E7EdNJkKhBSYJOtuD+GfJSDWwGUUS35jtUjwsX6eYgkJ7skQQMQ0H8onM7yI?=
 =?us-ascii?Q?yhbDzSb8gB4JPe5o6d9ziGnYirncByzRR5Pv2+0N4HBv/mJoinHkOTfWW1T6?=
 =?us-ascii?Q?DbvHvKu4WqbQCqlkCwlFHPFEuJ/YAktT1ZuORytb40QhCfbvUqIF2pRaMTS0?=
 =?us-ascii?Q?S69osrXNy5VxXHdZtYzd8D1e2X/YYjzk9czgqWelT3Jn35iygyJOBw+ejYQj?=
 =?us-ascii?Q?K4JDQLRIWJpSUG/xVgaPHKoSEI8su4ozqtnJNhT4bYLbXwI71yr4pv8ygcj/?=
 =?us-ascii?Q?Xm5kWKi1/9heU94Qf+Jqe3up/LUMW09f3A/pzC6iMZyj8gGDbe8P0tFD0ESm?=
 =?us-ascii?Q?iWhZGn2zGVQbiMrQQia3k5KC8s3FHF+41T9ZCMF/5vHEl7FgjX53BYj09ktW?=
 =?us-ascii?Q?XHjmb99xf2FanBqM3I1TFa0DZygdlmoj+GuLDQMAxQCEoLi1yfqBwleBG3Ee?=
 =?us-ascii?Q?EdcW40aILLUolBxrohVEYXXMPi84DphZlM1rl+kWA+KplxXUyUMVt6MirHn8?=
 =?us-ascii?Q?b84QNRrlySvcU71F5WGRbZZTq/fjSLDFW5oQNrH0PrS7S9ejo0TIoqs6hYlS?=
 =?us-ascii?Q?krtmnCkD5smcwdKNctdplOZPL4AHDI21leiQdt04F7dZxaog?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5acb9a4-c9d3-4697-a152-08df02edaea8
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 21:13:17.1907
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k78T3tE4tH0WsD/QimbIuGSyxdHtNx9i8zw3YJUcrXGnaXPEg81/Rj57X9J+sQPr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR12MB9782

On Tue, Aug 25, 2026 at 04:31:46PM -0400, Konstantin Ryabitsev wrote:
> On Mon, Aug 24, 2026 at 01:40:31PM -0300, Jason Gunthorpe wrote:
> > I am looking at commit ad80ce422da0 ("review: defer branch checkout to
> > shell/agent use") and think the way b4 treats the checkout is
> > inconsistent.
> > 
> > If you <enter> on a fresh series you get the series review
> > screen and the worktre is (usually?) left checked out.
> 
> It's not really intentional -- it's because we've literally just created this
> branch, so the tree is on it when we load up the series.

I thought that was done in some temporary dir though? The am
resolution was in temp dirs I thought?

> > However, I actually want to have the checkout. I want it *always*
> > checked out for review. I want to use a parallel editor window to
> > inspect the applied series in more detail that just reading the diffs,
> > while continuing to use the tui, I don't want to stop the review
> > workflow and drop to a shell.
> 
> Noted. The question is, how to make this the preferred operation for you while
> keeping churn minimal for someone who doesn't actually want their branches
> switched every time they enter a series. My immediate thought is to bind this
> to two different keys -- a regular "enter" would preserve the current light
> no-switch behaviour, while Ctrl-Enter would check out the branch for you.
> Would that be an option?

Well, I would rather have it be the default on enter.. Could there be
some easy way to make the keymap configurable? I see it has named
commands internally, so maybe that is not too big of a thing to ask
for? ie in this case I could bind enter to cmd-review-with-checkout
and you can default bind that to ctrl-enter

I have a feeling such a general functionality would help with
different workflows down the road too.

> > Further, if it doesn't get checked out what even was the point in
> > getting it applied to a branch and fixing the conflicts just to get
> > into the review screen?
> 
> Well, there are many reasons, but the primary consideration for me was to
> speed up the operation and perform the switch when we actually want to work on
> the branch (drop to shell, run an agent, etc).

I like having the branch, but I hate being forced to make the branch.

There are a pile of series in my review queue where I just cannot make
branches for them without a lot of effort. So, I can't use the series
review tui on them which defeats the purpose of using b4 review...

Yet, I don't need the branch to do most of the operations in the
review flow, right?

For b4, it would be nice to be able to not have the branch and still
use the review tui, somehow..

I would really love greater standardization on how to present a series
so it can be applied. Both for this and for sashiko.dev, but that may
be too much to hope for. Many things have git locations in the cover
letter, fetching them would help a lot.

Thanks,
Jason
