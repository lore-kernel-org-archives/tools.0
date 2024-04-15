Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDCA9156F57
	for <tools@linux.kernel.org>; Mon, 15 Apr 2024 21:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=10.30.226.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713216821; cv=fail; b=Ylwa1ErWwwPJlMgcrEBVSTLSfLcegd0VBUx3+frxJV73ON+XNVHOPU+0jhIr6abM7rGi5zTE5R3WGvuzR19mwsTT5ifF+S+Eo/L4SvyWjzfRhClocEQJWAeavASQNdkw+cv0dstCywwJ3fECFQ/NT83CI7SE60Ww7SPmQTn3VjQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713216821; c=relaxed/simple;
	bh=ZIWw5X9uJyei3ZBTTyBb8HXpbtx/zHBl46RLGhh1UIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=cT1W/kPHWApH3861MyrZD5OOAUis4CWD+qMCPZnZH8vKOvoDHQ02n3zhhHuHGCGkDbrXOmZ9WxwPcBECYOWywgPhUy8mXqYZKI2MJbqu/q+77DE7l0lfnPk2x0UgpI6WlxKznRe5NcXpe4gKbKxbWi1BWIZJY7LNTFYEFs3NEmI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=BYTReJz+; arc=fail smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="BYTReJz+"
Received: by smtp.kernel.org (Postfix)
	id 4B7DDC2BD11; Mon, 15 Apr 2024 21:33:41 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-db5eur01on2088.outbound.protection.outlook.com [40.107.15.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7CBD0C113CC;
	Mon, 15 Apr 2024 21:33:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7CBD0C113CC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=igyc3OfgfRrqLYGPjJ83mW4geZVfZFaJgm/PEf9+ZBp/Fz7JtELDMTZYd2OgTv/sskV16GG/pztko4zqCeDHJQBotVxWahKPUxSah3ikSqduqFOIAY+WzXeO3q8TMClMVyK0lav/xS044dhWaZFoGmaZRqZtvn/oWKU/QBNnCQOsDkInE+4vciJPNKIXBOiOSd6OGcswKnd6wVMW2jxNLxHlxf0DpIpqG2wQsR03kXFXZYkmowzjHpafRSLYWX1I1J7ZD1HrfeSz6xY/buaoaWgfOVaWE72XWS+xSLL9xHmHTDsDP6iB3FGDEWMiJlLIv1kAVD4xTsKmtacsLTuvnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xMYIinJget8cSbQj15+MqIgTlWCuaywIs7pGttABSdA=;
 b=oKk6C7Q29Zjsd7b4pQfkUt6u4rUSzi2qfBVzzduZ2KJAANqdz4B7ifgH81tqw+Ts5lazDn015EtOgNe0/zWcUFwHLBJAKMrSlpLxo4Qa2iG+n8WqG4CzBj5fYrxgqaRz6+tqTBtpnEBxyqca3WuAQgvDxJ9Js+QHA7uhsCVbve+uKTGlfjikOaPXKUZ1+DFwKyMeBAH0jOI2zD118K4/I3KwhA9s5zoGzu9ghTvH9irXv13m7od8s+BGdTju5fF+/mUVXsy4jbFBv5K8pqzwnXWJe0LUxQx66Vf7aDIymr+5fenjidGvChfHruwde/+Bt5sUNr/Ze+jXm3+7YM/G2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xMYIinJget8cSbQj15+MqIgTlWCuaywIs7pGttABSdA=;
 b=BYTReJz+cbxWYVWnPWEVU82WN8ZNd3jVX9P7ZL3PWkBZqrhrMm/5hzecercuGlar/KLDdPzJ7HTIaZePrlC36faLCA2FOXi7zBtCR3Ew3jMBYRaVFMpono/jT4zmiQVBdMb37dMu7nUn8DGeJ6n5q6SC7LKyCiYE1D3wt5TfqeM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by GV1PR04MB9514.eurprd04.prod.outlook.com (2603:10a6:150:20::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.43; Mon, 15 Apr
 2024 21:33:36 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::1e67:dfc9:d0c1:fe58]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::1e67:dfc9:d0c1:fe58%7]) with mapi id 15.20.7452.049; Mon, 15 Apr 2024
 21:33:36 +0000
Date: Mon, 15 Apr 2024 17:33:29 -0400
From: Frank Li <Frank.li@nxp.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org
Subject: Re: [PATCH 1/2] prep: add --check option to run necessary patch check
Message-ID: <Zh2dKbscKTNgC5dW@lizhi-Precision-Tower-5810>
References: <20240319045332.2304950-1-Frank.Li@nxp.com>
 <20240412-shaggy-pristine-walrus-319fe3@lemur>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240412-shaggy-pristine-walrus-319fe3@lemur>
X-ClientProxiedBy: BYAPR05CA0021.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::34) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|GV1PR04MB9514:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a8f0f82-fb26-43bb-6fce-08dc5d93b51d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HK4GhXDQ9UJ/MA/Uyqc25E7HrgB46914NhnD+jWW3QVsjx/7HFEiN9qU13O30qo0bKjBiY1cWYW3ecueMNQezlFZZieMHqiS+dzYzqcxSVul7h9xt1rN+o3BAsfWMuMzUtiG7NpeifRKkjbB8o6y2giwVbPLe98REDe35YYmtxJ4qSbnt9t5TEkzx9SYtise7YT5YZtnZthoSUrn23heuMZhbVEbl0uvQVsZV5pA1dXZ7Jnuy3EoMgAC48JXVfs2jZRuyaOnQX660LXS0Jg465wD/WLmBEl43p4uBzevwALJpg4RD++ZVM9QxlqTiWYlL3x6qJNf0bnVb526LArSj9PLunDkWj+BCyXyhQ8Dq6s1ll7cDJdh156B0lTf8cLHIOFLeHTaj7KLF0GMlMDERHZTf8xKd+CAwJ4DvycCS0r+Wd/b6tkx8BIT8AxKxYPPUItntEOuEgRz+qvd4X+JQS7pBT4D7pQPFMOV0ZzznO+unDQc7+Ef6ISU3jumtGLFD2PqLbF4y2QpfRwM9tK0PZZoqJRTQUWV1yNWS91uwKOP7eeWMfgW4cZtkIDAAi9KUZ8ilEnSKnKxaeDWomBOl1UB11VyQyqFqpt82bU4PV6BUbfDI2VqIdEht5wVj2IlGjTk6lCQn34sg7Neq48nc6BrPxxL8BuWkXv/8X4IOzfPNcNadU1ubHhhGUvBoOzCOkToeGdkSUr/mBTV5D2+gqBuFfPRKWdIJ45f06NDt4E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(52116005)(1800799015)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YEq7YxeLg08M61Z1eU8ZMHzz4TOjkzHTQsynu6Lbv3A1SmyafANcQw1ipO5c?=
 =?us-ascii?Q?kVtuZdl5qsPeavnRbl38fkh75E+VJ7m9Kmxi8CkEDGPF7JUe2boZLaw4zS+U?=
 =?us-ascii?Q?JuXqrjkMIJR69dLyqwQ+Ggh839YdlgqHHOYOYnhlIE5bM9ejMNWr63ZoQ9k6?=
 =?us-ascii?Q?bdKDQY9v+7MHgjsYST8b61s7ErZ/772ZuPhIp4/NLyCtqZ+z3hJf1CYGk3D8?=
 =?us-ascii?Q?P9J4W9gfxWSklmeNscQwvvTq+JGgv8fFGLZVGDAsWOC0XKkgBe7LqT90yc5s?=
 =?us-ascii?Q?WzyAaCkeW7L3/uluMSk3GmpsHxM/Y+ayYcYMPw6zNWEOF+r1qrdKIY56K0p0?=
 =?us-ascii?Q?3tfMw3kGpXY4ElnpdYBa2WSUL0LdH42Rx+FzA7PXVv/eYk2dheAYE9Pzt6H2?=
 =?us-ascii?Q?qQlbQIi1QPn65ts4fHmRx9DXfO04Tr69EE+4wkPEb25iMC9xxrsoav11Rtu1?=
 =?us-ascii?Q?jKKV5TYSwZtZXTrNXg17NmAIdHzS5C+w5NA7831VoJNoZpkwXnkqGxt8tED9?=
 =?us-ascii?Q?4DE5yKevvVf4rhbT8h6/0UKIkypqJG4E2Yo5P4cDQI1lj7SdqtoQCh2+MFsX?=
 =?us-ascii?Q?P9IXzs2n3fte9VXO/b2pdWx7s3pQpB/r1epbCNl1pp37RMSe7EOZTgo3vkQo?=
 =?us-ascii?Q?sHOb8L6RyaIZyQdb3plPlQlC7wwPLM+BipjEtTny4ngeuXjeUtu68WDMPmtR?=
 =?us-ascii?Q?eo50BBc1hdKrpcU1frovKZwZohuaz2rn9WR9vDat2x5gEpuovivq8oYoY8F4?=
 =?us-ascii?Q?qKBgvaI8GuMqWofD14H5/5Ekzcqu8tbcQ4JSeoMrgNovE9AnHnLx001IQjCg?=
 =?us-ascii?Q?Z0XAjxAjSdkaQU6pJYo8pJ2erXRCq0od94qvtUQ/v9taF/ANuamcmDdVwI9c?=
 =?us-ascii?Q?LfAYixwgFkhFrS+r1u9NBZFgIbae307rE62V1otW2L29usnQSTBH3NN93lPV?=
 =?us-ascii?Q?LtRaiu5CX/uH9XXsXdy5S1ZheXk1WdPR0vd9a42MTjN4DoBuHsLVexsJb8W5?=
 =?us-ascii?Q?WdU8CITrVQIKrUL7p3J0yAnVRi1x6lb7KHh+kHmpEciejOJ6UrvJkLeXxFyn?=
 =?us-ascii?Q?LNYt6lwB+dCMxmrawKxQiRNP7VO1ZdoB4E+6Un3Uhp5jhMYoJsUcE/hfXBXl?=
 =?us-ascii?Q?cjWfpIRe1+kGX+RMfFpreGeKzSlNiBl7NJUDug9Kpbx45nF86BBSkcL6iUad?=
 =?us-ascii?Q?GR+L2uOObqP+8QO4gMI87Q5dPSLWvxw+Tb6Nr0R1uynRlxXhdD4I5CL4SAZ+?=
 =?us-ascii?Q?gzt4tzFcVlil4sSQ9izrhy4MKUxjispPG2i8SSDzgLDDAaUO9eS6X0sNwZrR?=
 =?us-ascii?Q?QJ6uflFaxeXniDudub9MLG4BBdlAE79MBIolozUl67Gne9LI5MmWnFd43WRo?=
 =?us-ascii?Q?7c0AmtfoKSuUVrwOmPNWVLp5OVfve1oLeJVNS1+02OZGKac+3OnnvAW90a3Z?=
 =?us-ascii?Q?sevp1+R+pIhJeJ1tMdqlQuv1omjjMPo65XD7s3uTYJ8qK/YWPpbWnXD+IrsZ?=
 =?us-ascii?Q?Fgy0+itFAXJBhhJjR/TeVVmmhlhatAbyy8U4spVnbK6+6KL6JZY99RiiHQVG?=
 =?us-ascii?Q?7cAE73aX8XCPKqZ6Wz4efJxMwQ1hpoGuDkHn4s/+?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a8f0f82-fb26-43bb-6fce-08dc5d93b51d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2024 21:33:36.1315
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DsMJvgXlYOQXkgMU9BQVSknNaWUg6f8n9LBTL4TuIxDUdBrfz1IyPErb9Xh3+wp3SodYnwWLEFcj/O8b1t3kug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9514

On Fri, Apr 12, 2024 at 05:09:43PM -0400, Konstantin Ryabitsev wrote:
> On Tue, Mar 19, 2024 at 12:53:31AM -0400, Frank Li wrote:
> > This just run script/tools/checkpatch.pl
> 
> Hello:
> 
> Thank you for your contribution. I didn't end up taking it, because I 
> wanted to make it more generic and less tied to the kernel. However, 
> there is now very similar functionality in the current master that can 
> be invoked with "b4 prep --check".

Can you point me the functionality name?

Frank

> 
> It's not yet a complete feature, but any feedback is welcome.
> 
> -K
