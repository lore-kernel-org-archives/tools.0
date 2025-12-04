Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EBA13328EA
	for <tools@linux.kernel.org>; Thu,  4 Dec 2025 12:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=10.30.226.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764851457; cv=fail; b=TabNtFWQz02cjHWHW25W5SotHKiGtB/Banwps4MsUaqqIzfMmQ3Io+B0Jm6uYhc9dOQrai75GhkJ4aLB5s967p4SUXIZWJUs1N+Rv5AuVegegZlw3Q9/BiSK83fo4QDBSuUW7vbnqzxYUKgmn6lcCaa5rR3UbJILRCZsbbmCRaA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764851457; c=relaxed/simple;
	bh=16L3I488MgWrMMbxZCFgVDz2BKaOlO3M4vx/+3jhDfg=;
	h=Message-ID:Date:To:From:Subject:Content-Type:MIME-Version; b=NhhXXBIc5zlANtpeDEKa6gpTrIozPQDDXGOGWWQk/nOklwd9bioAVLRjF3M9RpFTxDQnYffsvm5B+1/5cBhow65OxG9nOdTbQeN9KLTiaVi25YleBU9KxBagiOUjdb7fKRaSfcrQUQLciumI1GVwHxTwz4/KY1lKE0R+kC+7xPE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=UpI3u21o; arc=fail smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="UpI3u21o"
Received: by smtp.kernel.org (Postfix)
	id 80AAFC113D0; Thu,  4 Dec 2025 12:30:56 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013070.outbound.protection.outlook.com [52.101.72.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3B6BCC4CEFB
	for <tools@kernel.org>; Thu,  4 Dec 2025 12:30:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3B6BCC4CEFB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=cherry.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bENnS4Fe1aU+a24GQWvNLq48mFEfUqXAotH972rgOj8IxMBYPI/o21zZybiwVD4e7maw92Y59SF8sGlH7hJOD8mWQufUTSGpbwBy7jgMEQUCX/RmQ/bnKfd0+KuzWtf/9V4QUKfJAlDOBPe16fGuJ+uA6Wi7a5iI7gRMIqgue27pifOI6yXgsCoj+GNCkBE/oo3RdsJxDmKAGa0ZJdNNuUwaADiOveEkhx6Yi8lufCsmNqp9+2nuEVad+UCPYjDTmBNJ9pLQSngTA5jWVbC9hBwp9ZcN7LNKXQbbPHF3vVBEJ5/5quhO79t7mCJAFQ/CBleeOEEdTTpakDtnYOoyqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9z1wD7j8UiJzPRMGqVjJtEVBtCGmaG4041XL3du2eUk=;
 b=E902HSxEzXtHPmMGRynS0jHc0S8YJGNjzfKy9mFF4ElcBtjArNbZC6vfneZt9Yef9S34C8TwcELdbvhIN2gBJmaCyk7Cgw9GH7vg8vNz2oHVTZnqqn6GSrbgYLLyrX94OMLLz2Wnk8dNdLzpsdw52aJsqDuSvmA1mEf50FJ/JPP+CZo2OdZ1ySpzx9gnXYs6Gf7k8uEOM0OOcN+Cc0Mt1lZdOPTxjQZqX7a+scgq+7XtAGjPRekmYLTaVpC1xAuZQVq1jbAmFbshiF51llwQc0r9JBvmToLBw0y5aYAUY8syLf4lWUhn41ELuHHm9ZFUOzQav/6HBk7OHcJVJKblFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9z1wD7j8UiJzPRMGqVjJtEVBtCGmaG4041XL3du2eUk=;
 b=UpI3u21o+G/5EegcengQb/2vmV9xBDpILlxp05mIjOvqyv7eO3Zl65qwCXWdnV+6SOoq0oTRYU3eRmGSotWjdTfkJSRWCDGuH9V2/sxcSgNxBUN9F7irN+HgOJJujC7yuHDLpLCK8lxKZmroeRLTBTBcl7vn/fYBsM7xeD8eb6M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by GV1PR04MB10919.eurprd04.prod.outlook.com (2603:10a6:150:201::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Thu, 4 Dec
 2025 12:30:44 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9388.009; Thu, 4 Dec 2025
 12:30:44 +0000
Message-ID: <3f1646bd-3802-4bd3-8ecd-2ea6ffb16e4d@cherry.de>
Date: Thu, 4 Dec 2025 13:30:42 +0100
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "Kernel.org Tools" <tools@kernel.org>
From: Quentin Schulz <quentin.schulz@cherry.de>
Subject: [b4] b4 diff on multi-patch series does nothing (and fails)
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P191CA0014.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:800:1ba::14) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|GV1PR04MB10919:EE_
X-MS-Office365-Filtering-Correlation-Id: 556b28a3-0d24-48e7-62ca-08de3330f1bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|10070799003|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SEhoazlmaHZrTEpoanY5NzJTQ1VET1ZvYldZZXRHUXY0RWNsT2RCQ1NUS2hz?=
 =?utf-8?B?YjRzVWYvY1NnTERHUGkrUmhxTUdaZWNVWWNnOXE4ZWN4TGgyTW10cCswWDVR?=
 =?utf-8?B?KzBQSUF1bXY2QnlTeUo5bkhDZUtmMnJjRVlqOHArN3ZDT0NRWlRTSHcxU0VS?=
 =?utf-8?B?a3B5RnJKYWJCVUdYdkFPdk50TnZxeWJEK2JCSVJYeExiOHRYd2xZR1BveUVh?=
 =?utf-8?B?MHBCN3V0YUtiZmp3V1dlZFVPZ0tqN2NJVHBMZHlvbWZCQytkQzRBZGlMUnM0?=
 =?utf-8?B?ZXFxbWU4UHR3VE1qM1NSSWV3WkVmUW10S2k2VFJ2WjViMmdGREVmYlJpczVG?=
 =?utf-8?B?TEZLdU9hVmFSOU96dW5QWXNmZHFwWGZ5U1ZTUW8vMTZBZkJ5TThybVdCZ1kv?=
 =?utf-8?B?SXk3TDRWRng1WEZEeGo0SUxYRGxZaUIvRnpGaHcxQ2lGN1NlMVk0aGJkcEVy?=
 =?utf-8?B?WktDNUhud3NOa3hLdjIvR3pFVkg0QXpwdzdhbmhJZlNRc1FIQ1VOdi80TWxu?=
 =?utf-8?B?ZWUwVEFKOC80RXlmYTJqNzB0ZG1BT0tLcDVqWCtnZ2taMGkxT3JvMlk2NlJr?=
 =?utf-8?B?QU5kbnZrK2Y4Y0xzS3c5L3RYZTJpWGhDS2poem1BYzI3RUJyVHBhOVFoN1cx?=
 =?utf-8?B?aHNGL3BQL2dWcTFYUXlZWGhhTm9rV1h1bmFkUE9nTysvQkZLbWV3V2xoQkc4?=
 =?utf-8?B?T0Z0aHdRMlhvSGttT2JDT0pib0Mya2U5cU5ZS1FvL1hMYzVFdVFHTzFSY2xu?=
 =?utf-8?B?SkczNmVqWnBlRnJjTE1jZzNGREZ2cEx4ckk5Y2dTdjNuWjdrU2dJMHVSUmlp?=
 =?utf-8?B?dzhkUndKQ0xzYUZ4MlZGY2xUbXI0L1UxbTIwRDJXbXpwVXpMT1VHZXhWRjJM?=
 =?utf-8?B?UXlyOE9zQVNoMlhKNzIyQnNGSzFPNVJuL0xPRWsvb3p1YWN6ZkdxbTZaU09E?=
 =?utf-8?B?aWpqa1Z1WGpsWXVNci9OVWMwWHd5Z3hCWDJQNUlJWmNLQS8vUG5hZWdiaXky?=
 =?utf-8?B?eXB5K0ZRTTRZNFZVZUpLd1I4YzdrZ2NMeG1jYXJRTy9tQnB3c2hLUFgwUWJh?=
 =?utf-8?B?M1ZXSkNYN2lucUU0Y2hvbU5aUDRINUhPMG1TcWJFMWMwaStwNXYvTElvQURK?=
 =?utf-8?B?R1FMVS9MODlabGgvMk4xZEFPMERvRktINnlhS25Qa0FKMzI1QXYzNGFCSHBS?=
 =?utf-8?B?T2xqQ1Z1b1YrK0VNVnNlSldnK3R1TEdLQ3F1UXROZ0VXN2ZCV1NoRnZ6RHlo?=
 =?utf-8?B?UTlIZFJheXpEZEhnNC84d2lsazhtZUtpSVdoRktIYnY5TjNiaHJ3cUpzaFpB?=
 =?utf-8?B?S3FmcEFORkFET1oxZEw4SXpCNzVPdERDb0RqRlhxckhoaWh3MGxzWGNySVV3?=
 =?utf-8?B?SCt4VW9BUCtyUk5VdTRoTTRSN0pZWFgrdDBWeFJwZXhYYmJleUNWT0tDWU9N?=
 =?utf-8?B?Mi8vMEJaU1dBdStiZGJzSDlFY3Q5Z1MwVlY1Y1NTY3I5aGVTb1c0QWdzL1li?=
 =?utf-8?B?dUxYSDJwYjZDWU5nVlVFakN0QzVZbmtqa0Y2WjgyTUZPL0VIc1BrRTRwM2hH?=
 =?utf-8?B?MjNzRmlDM0h3VmkrUjVNTnZFWVUrN2pudDg5dmhHT3ltNVYyd2FuWGtJU2Fn?=
 =?utf-8?B?K1BFM0M0SEVVN0lBL282K09EUVM0S2JiZDFQcXZXU0lkdzdKWll2VUp6Mmhs?=
 =?utf-8?B?Qm9IWXF0VlpiUk82RGM2cXZKUjFENi8wblkzTnRzM3lIYlNuay9QV0hRalhU?=
 =?utf-8?B?SnFpNjVDVVNseW9xUHU4L29xTGRGK09nR2tROUh2NW56VzM3WDFHa3NoNGI5?=
 =?utf-8?B?L05FUHJxVkY0SFNiUFBOOWhLM2F5WXMxZllwMkI4MEU0NFRBU2NHOVh1Q1RC?=
 =?utf-8?B?dHBSVFFEL1lsVVhyYitKRDViaDlxb1RRbmZDMW5ieDJCdnc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(10070799003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NXQycU90am9DbXEzdlpVMFhHRWJZbmxhem1rdWRYa2VPOTZwT2VJdUo3dGZ5?=
 =?utf-8?B?SnorcEFmMEFLU2ljSG95enl6azVSMFRwMm5qcVFYbURubGpuM0RxSHR2MkpM?=
 =?utf-8?B?YUhQb29hc3NjWVFLSjhpTGYraU96YlBQZlExT0dJN2wvU3pydkc1MlZIZnR2?=
 =?utf-8?B?OW9LbzVxRUo2dU9OaEFQWjdxUkdZMUxZNU9lV3EyNm96WmtIdjJVQy9PVnQ4?=
 =?utf-8?B?Ump4b1FPUitNZ2txRExVQitRMGUwZUxBaGJMM2tuUTJJamNXZ2wyQjh6QXhQ?=
 =?utf-8?B?d01XbGdmWGtzME9nR25KcHlYRHJVV1dmTnExNUJmMllmdks5Y1hzVHFNcmY3?=
 =?utf-8?B?TnNiOHpaT1BJYktDb3VHQ3lJaXlFSFowZ1BpRjRPSnJjcTI3RzV0L09aZ0U0?=
 =?utf-8?B?V1NlNDFVelR3dy9TUTArTmZIQkxFZUFEK2k5VWFhS0p1c2kwVU1FYjlUd3VI?=
 =?utf-8?B?S05PaDR1ZUdEaVVzaDdFS3pKamR5RDA2ZmV5R0ZsWExJcFRvZ1FlVjdvYnBI?=
 =?utf-8?B?T1hzdTVDNzh3d3RTRDJvN0N6NE9HcXBvejJVeEc3d3RrY0VrNS8vcUY4RElN?=
 =?utf-8?B?cDkvQWttWmJZZnhVRzYxOHkrU3cxdjQ4ZGxHalJTQ3NjWHk4SWNrTUtiNTJ1?=
 =?utf-8?B?ZTA0a3k5MVhKNHB6WTBKWCtPQUxwZTdadVYwQ0dFNGhyNU15T0FEc1dIdWk1?=
 =?utf-8?B?Ukp3T1lmQXFZSkJrVkRKcHltSUE2N2x5dGs1U0h4bGtUZ3FZTENrbWZGL1Z1?=
 =?utf-8?B?dlYrT3RPVSt1RmdIUUhFaWpmZStqMFp0SEUwM3RrenR0azlvdG9CT0FsRngx?=
 =?utf-8?B?ZjRlM3ZOUDFWQjAvSTNJUU1BRDJBdFpianYyMUdCNGpUNnhJajJJaTNyQlNw?=
 =?utf-8?B?NEtBM2xHazVqaGgxUEZZZSt0N08zMk0wQmRXbE4xWmlub3l2L1AvZzg3S0ZM?=
 =?utf-8?B?bU56TkFDUm9BRnhmQlRLdVJRZGpHNkIrVDNpQmtNZTBhTW9xV3gvVmlLOU5P?=
 =?utf-8?B?TGhxMDJqZ0pCb2lvWnVNclo1MVVNM2tweGxSUmVhdVFRWDFHU1NqbTdMdkhG?=
 =?utf-8?B?MHBneWs0WG0wK0tzNURiNm5aQTBMM1Nud0dlK1BsSngwSUJHaHk3dTZjSlB6?=
 =?utf-8?B?c1FuenBQNExLeWxVQnZGQWFrZlpKNGxQUlhzdkc0Nk1OUWJIZlRpL3NvVGlF?=
 =?utf-8?B?U3U0aXVBbEVONndYVnUzU1JQdDNjNUt0aHhTem1ERElYQlZUdTkrYXFoWk44?=
 =?utf-8?B?L2hBWFlpWW9uZTJBcUFLd29YZEhhdHRRUmFYZW0vUVZUNFJtWWFYQ0hIbk5U?=
 =?utf-8?B?TklMYjJ5dVU1SitkVHBadE0zajlIdEJ4Q0tYN00rdnRYSVF0cXRrVmhVbExF?=
 =?utf-8?B?NWUydjh4M2NLVzZFUUlFZlNGeTVKcWV2b3hFYTNwL0xyQWtmZ250L0pkM0to?=
 =?utf-8?B?MHEwMGMwamhrVlhiV2YzTklVV3JITUsxaHdIZVhMa0xVbzF2ZEh5UkdudXRT?=
 =?utf-8?B?Y0ZFL284WlEzZ0ZUWm1rNUdsSTJtSmtCRXJldkZlRmYvVlQ3TW5oVlJqZ1RH?=
 =?utf-8?B?eUZ3TVBxMWo0QVBiZSttYndNTUMwZGhXaXViZ0FZT2h1OGNtWkZ3biszZURw?=
 =?utf-8?B?djErQnFnTlBza0lDT04zSWlsdmNySGU1V3lrQ0xnL0NTSGlQMFFHMFQwVWJV?=
 =?utf-8?B?R0x2TnFVTm9ub3VXV01LOTUrYy9OWjZVeDQycVNRbXhrc1NyeWpFbG5ZdzU3?=
 =?utf-8?B?QjZrLzVMTlJObUlXN252My92MEJiT0FMODJRNHN5T3I5VGRqaHVLTURVK3ph?=
 =?utf-8?B?Mk9kaWVWU3ZING1pQldIMWgrOTg0TmYvbVZxNllnMU8vck5HNVZWNkVuQUh5?=
 =?utf-8?B?d2dtaUVISlN6RFFET0t5dExkdlV1Y2dUb0FhNzZHQUxSU1hUTDNGUk5jUldi?=
 =?utf-8?B?amRHeSsveVNXZndiSUpnS1V4TzFEL1ExdEhoQkZBTjRoeTY2MlBLbnkxTzRz?=
 =?utf-8?B?MlNweDVHcEEzZU1MdjBWOFl5NnljS1VtV3Y2WVdKQW5jbVQvL1lvYW8rWEdw?=
 =?utf-8?B?Q0dRcmR2ZUR5dGR4QXNQTXVNRStMNlMvcWhHeTRVZFp2em4wQVdiSHFROEx5?=
 =?utf-8?B?dHdncURPMXI1VXdGOEY0Y3o3Uk1ESWhSS05BRlh5Wk53emtieHl2clVMdjN4?=
 =?utf-8?Q?3XRomoWAVr6f23DmxjpOW7Y=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 556b28a3-0d24-48e7-62ca-08de3330f1bb
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 12:30:44.1313
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xfgUHHP4v1YsI2cf7NAcCFIQtCNEAPhhul3S7y0Gb+ZihiBvLe7dnQztnVLUN6p3xVzTMpJIzXwX543x9oqxHx2hVC1Ka9WD0O68QL7STgM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10919

Hi all,

I'm flabbergasted, the same command I believe I ran a week ago doesn't 
work anymore. (the same series can be applied with b4 shazam still today).

 From a U-Boot git repo (https://source.denx.de/u-boot/u-boot.git), run

b4 diff -v 2 3 -- 
https://lore.kernel.org/u-boot/20251121-binman-engine-v3-0-b80180aaa783@cherry.de/

the command returns 1 as exit code and the following output:

"""
Grabbing thread from 
lore.kernel.org/all/20251121-binman-engine-v3-0-b80180aaa783@cherry.de/t.mbox.gz
Checking for older revisions
Grabbing search results from lore.kernel.org
   Added from v2: 1 patches
---
Analyzing 14 messages in the thread
"""

I tried with another series 
(https://lore.kernel.org/u-boot/cover.1764574369.git.jan.kiszka@siemens.com/ 
and 
https://lore.kernel.org/u-boot/20251203-topic-am33-evm-lcd-v2026-01-v2-0-262cf4f34eb5@baylibre.com/) 
same issue. I tried with a Linux kernel multi-patch series 
(https://lore.kernel.org/linux-rockchip/20251204063109.104-1-kernel@airkyi.com/), 
same issue.

Then I tried with a single-patch series 
(https://lore.kernel.org/u-boot/20250827105854.10746-1-ssunkkan@gmail.com/) 
from U-Boot and it displayed git range-diff as expected.

Full output with debug and no cache enabled:
"""
$ b4 -d diff -C -v 1 2 -- 
https://lore.kernel.org/u-boot/4cd587dc-da4d-4645-9a6a-fd14dcf15de8@mailbox.org/T/\#t
Running git --no-pager rev-parse --show-toplevel
Loading worktree configs from 
/home/qschulz/work/upstream/u-boot-test/.b4-config
Running git --no-pager config --file 
/home/qschulz/work/upstream/u-boot-test/.b4-config -z --get-regexp b4\..*
wtcfg={'send-auto-to-cmd': 'scripts/get_maintainer.pl --nogit 
--nogit-fallback --nogit-chief-penguins --norolestats --nom', 
'send-auto-cc-cmd': 'scripts/get_maintainer.pl --nogit-fallback 
--nogit-chief-penguins --norolestats --nol'}
wtcfg: send-auto-to-cmd=scripts/get_maintainer.pl --nogit 
--nogit-fallback --nogit-chief-penguins --norolestats --nom
wtcfg: send-auto-cc-cmd=scripts/get_maintainer.pl --nogit-fallback 
--nogit-chief-penguins --norolestats --nol
Running git --no-pager config -z --get-regexp b4\..*
Running git --no-pager config -z --get-regexp gpg\..*
Running git --no-pager config -z --get-regexp user\..*
Running git --no-pager config -z --get-regexp sendemail\.[^.]+$
Using values from sendemail
t_mbx_url=https://lore.kernel.org/all/4cd587dc-da4d-4645-9a6a-fd14dcf15de8@mailbox.org/t.mbox.gz
Grabbing thread from 
lore.kernel.org/all/4cd587dc-da4d-4645-9a6a-fd14dcf15de8@mailbox.org/t.mbox.gz
Mailsplitting the mbox into /tmp/tmpah0iuqd0-mailsplit
Running git --no-pager mailsplit --mboxrd -o/tmp/tmpah0iuqd0-mailsplit
Looking at: 20251110203000.9999-1-ssunkkan@gmail.com
Kept in thread: 20251110203000.9999-1-ssunkkan@gmail.com
Looking at: 4cd587dc-da4d-4645-9a6a-fd14dcf15de8@mailbox.org
Kept in thread: 4cd587dc-da4d-4645-9a6a-fd14dcf15de8@mailbox.org
Looking at: 20251104110307.3993-1-ssunkkan@gmail.com
Kept in thread: 20251104110307.3993-1-ssunkkan@gmail.com
Looking at: fda19051-7b72-4f11-aa8e-b8eb70ff04b7@mailbox.org
Kept in thread: fda19051-7b72-4f11-aa8e-b8eb70ff04b7@mailbox.org
Looking at: 20251103111225.3161-1-ssunkkan@gmail.com
Kept in thread: 20251103111225.3161-1-ssunkkan@gmail.com
Looking at: 05d93ac3-b79b-4503-8745-7442033b7b2a@mailbox.org
Kept in thread: 05d93ac3-b79b-4503-8745-7442033b7b2a@mailbox.org
Looking at: 20251102111441.5136-1-ssunkkan@gmail.com
Kept in thread: 20251102111441.5136-1-ssunkkan@gmail.com
Looking at: 20250827105854.10746-1-ssunkkan@gmail.com
Kept in thread: 20250827105854.10746-1-ssunkkan@gmail.com
Checking the subject on [PATCH v3] spi-nor: add support for XM25QH01D
Current base_msg: [PATCH v3] spi-nor: add support for XM25QH01D
Checking the subject on Re: [PATCH v2] spi-nor: add support for XM25QH01D
Current base_msg: [PATCH v3] spi-nor: add support for XM25QH01D
Checking the subject on Re: [PATCH v2] spi-nor: add support for XM25QH01D
Current base_msg: [PATCH v3] spi-nor: add support for XM25QH01D
Checking the subject on Re: [PATCH v2] spi-nor: add support for XM25QH01D
Current base_msg: [PATCH v3] spi-nor: add support for XM25QH01D
Checking the subject on [PATCH v2] spi-nor: add support for XM25QH01D
Current base_msg: [PATCH v3] spi-nor: add support for XM25QH01D
Checking the subject on Re: [PATCH] spi-nor: add support for XM25QH01D
Current base_msg: [PATCH v3] spi-nor: add support for XM25QH01D
Checking the subject on Re: [PATCH] spi-nor: add support for XM25QH01D
Current base_msg: [PATCH v3] spi-nor: add support for XM25QH01D
Checking the subject on [PATCH] spi-nor: add support for XM25QH01D
Checking for older revisions
Using cached copy: 
/home/qschulz/.cache/b4/a71aa23c4445f2a569dc5d928a1ea59df1b4665a.pi.msgs
Skipping [PATCH] spi-nor: add support for XM25QH01D: already have it
Skipping Re: [PATCH] spi-nor: add support for XM25QH01D: already have it
Skipping [PATCH v2] spi-nor: add support for XM25QH01D: already have it
Skipping Re: [PATCH v2] spi-nor: add support for XM25QH01D: already have it
Skipping [PATCH v3] spi-nor: add support for XM25QH01D: already have it
---
Analyzing 8 messages in the thread
Looking at: [PATCH v3] spi-nor: add support for XM25QH01D
   adding as patch
Looking at: Re: [PATCH v2] spi-nor: add support for XM25QH01D
   adding to followups
Looking at: Re: [PATCH v2] spi-nor: add support for XM25QH01D
   adding to followups
Looking at: Re: [PATCH v2] spi-nor: add support for XM25QH01D
   adding to followups
Looking at: [PATCH v2] spi-nor: add support for XM25QH01D
Found new series v2
   adding as patch
Looking at: Re: [PATCH] spi-nor: add support for XM25QH01D
   adding to followups
Looking at: Re: [PATCH] spi-nor: add support for XM25QH01D
   adding to followups
Looking at: [PATCH] spi-nor: add support for XM25QH01D
Found new series v1
   adding as patch
Using cache 
/home/qschulz/.cache/b4/0f33d9035ecc6d2c5c33d79799f4e3e6a79b2877.fakeam 
for 20250827105854.10746-1-ssunkkan@gmail.com
Running git --no-pager cat-file -e d3538748550dbf654f317143d59c103985a02f3f
Running git --no-pager cat-file -e 487a240aafeb7e35c11b505aca889df791e81a08
Using previously generated range
Using cache 
/home/qschulz/.cache/b4/43d6735d5b703d096e83d51781ae02a37174ff7c.fakeam 
for 20251103111225.3161-1-ssunkkan@gmail.com
Running git --no-pager cat-file -e d3538748550dbf654f317143d59c103985a02f3f
Running git --no-pager cat-file -e ecdcfe5cfa7b58a5a41a63ef86a43709f10f9998
Using previously generated range
---
Diffing v1 and v2
     Running: git range-diff d3538748550d..487a240aafeb 
d3538748550d..ecdcfe5cfa7b
Running git --no-pager range-diff 
d3538748550dbf654f317143d59c103985a02f3f..487a240aafeb7e35c11b505aca889df791e81a08 
d3538748550dbf654f317143d59c103985a02f3f..ecdcfe5cfa7b58a5a41a63ef86a43709f10f9998 
--color
---
1:  487a240aafe < -:  ----------- spi-nor: add support for XM25QH01D
-:  ----------- > 1:  ecdcfe5cfa7 spi-nor: add support for XM25QH01D
"""

"""
$ b4 -d diff -C -v 2 3 -- 
https://lore.kernel.org/u-boot/20251121-binman-engine-v3-0-b80180aaa783@cherry.de/
Running git --no-pager rev-parse --show-toplevel
Loading worktree configs from 
/home/qschulz/work/upstream/u-boot-test/.b4-config
Running git --no-pager config --file 
/home/qschulz/work/upstream/u-boot-test/.b4-config -z --get-regexp b4\..*
wtcfg={'send-auto-to-cmd': 'scripts/get_maintainer.pl --nogit 
--nogit-fallback --nogit-chief-penguins --norolestats --nom', 
'send-auto-cc-cmd': 'scripts/get_maintainer.pl --nogit-fallback 
--nogit-chief-penguins --norolestats --nol'}
wtcfg: send-auto-to-cmd=scripts/get_maintainer.pl --nogit 
--nogit-fallback --nogit-chief-penguins --norolestats --nom
wtcfg: send-auto-cc-cmd=scripts/get_maintainer.pl --nogit-fallback 
--nogit-chief-penguins --norolestats --nol
Running git --no-pager config -z --get-regexp b4\..*
Running git --no-pager config -z --get-regexp gpg\..*
Running git --no-pager config -z --get-regexp user\..*
Running git --no-pager config -z --get-regexp sendemail\.[^.]+$
Using values from sendemail
t_mbx_url=https://lore.kernel.org/all/20251121-binman-engine-v3-0-b80180aaa783@cherry.de/t.mbox.gz
Grabbing thread from 
lore.kernel.org/all/20251121-binman-engine-v3-0-b80180aaa783@cherry.de/t.mbox.gz
Mailsplitting the mbox into /tmp/tmpntdhes0t-mailsplit
Running git --no-pager mailsplit --mboxrd -o/tmp/tmpntdhes0t-mailsplit
Looking at: 23273f44-32e3-4f8e-be7b-996af8a10c8b@cherry.de
Going into maybe: 
20251202201451.GL303283@bill-the-cat->23273f44-32e3-4f8e-be7b-996af8a10c8b@cherry.de
Looking at: fea1b8fb-2512-41f9-af23-a716c70cce39@cherry.de
Going into maybe: 
CAFLszTh1Tt1=9SOHf1WdnENB3q1E7vdq4mK4XjPC7Bob5gQoEw@mail.gmail.com->fea1b8fb-2512-41f9-af23-a716c70cce39@cherry.de
Looking at: 20251202201451.GL303283@bill-the-cat
Going into maybe: 
CAFLszTh1Tt1=9SOHf1WdnENB3q1E7vdq4mK4XjPC7Bob5gQoEw@mail.gmail.com->20251202201451.GL303283@bill-the-cat
Looking at: 
CAFLszTh1Tt1=9SOHf1WdnENB3q1E7vdq4mK4XjPC7Bob5gQoEw@mail.gmail.com
Going into maybe: 
6b2751af-783b-40d4-b205-5859b7eaa0d2@cherry.de->CAFLszTh1Tt1=9SOHf1WdnENB3q1E7vdq4mK4XjPC7Bob5gQoEw@mail.gmail.com
Looking at: 6b2751af-783b-40d4-b205-5859b7eaa0d2@cherry.de
Going into maybe: 
CAFLszThxhLBEm731QjvB-wbOGryGBfh1_09NeWNy13nLwqZW4A@mail.gmail.com->6b2751af-783b-40d4-b205-5859b7eaa0d2@cherry.de
Looking at: 50d0c028-374e-45d7-ad85-29d43bdb9767@cherry.de
Going into maybe: 
CAFLszThFdfMeFTtvDyXfH1iO2zx5fe9rJJSz=MQBGJiXB4HG5w@mail.gmail.com->50d0c028-374e-45d7-ad85-29d43bdb9767@cherry.de
Looking at: 
CAFLszThxhLBEm731QjvB-wbOGryGBfh1_09NeWNy13nLwqZW4A@mail.gmail.com
Going into maybe: 
20251121-binman-engine-v3-4-b80180aaa783@cherry.de->CAFLszThxhLBEm731QjvB-wbOGryGBfh1_09NeWNy13nLwqZW4A@mail.gmail.com
Looking at: 
CAFLszThFdfMeFTtvDyXfH1iO2zx5fe9rJJSz=MQBGJiXB4HG5w@mail.gmail.com
Going into maybe: 
20251121-binman-engine-v3-3-b80180aaa783@cherry.de->CAFLszThFdfMeFTtvDyXfH1iO2zx5fe9rJJSz=MQBGJiXB4HG5w@mail.gmail.com
Looking at: 20251121-binman-engine-v3-4-b80180aaa783@cherry.de
Kept in thread: 20251121-binman-engine-v3-4-b80180aaa783@cherry.de
Looking at: 20251121-binman-engine-v3-3-b80180aaa783@cherry.de
Kept in thread: 20251121-binman-engine-v3-3-b80180aaa783@cherry.de
Looking at: 20251121-binman-engine-v3-2-b80180aaa783@cherry.de
Kept in thread: 20251121-binman-engine-v3-2-b80180aaa783@cherry.de
Looking at: 20251121-binman-engine-v3-1-b80180aaa783@cherry.de
Kept in thread: 20251121-binman-engine-v3-1-b80180aaa783@cherry.de
Looking at: 20251121-binman-engine-v3-0-b80180aaa783@cherry.de
Kept in thread: 20251121-binman-engine-v3-0-b80180aaa783@cherry.de
Looking at: 23273f44-32e3-4f8e-be7b-996af8a10c8b@cherry.de
Going into maybe: 
20251202201451.GL303283@bill-the-cat->23273f44-32e3-4f8e-be7b-996af8a10c8b@cherry.de
Looking at: fea1b8fb-2512-41f9-af23-a716c70cce39@cherry.de
Going into maybe: 
CAFLszTh1Tt1=9SOHf1WdnENB3q1E7vdq4mK4XjPC7Bob5gQoEw@mail.gmail.com->fea1b8fb-2512-41f9-af23-a716c70cce39@cherry.de
Looking at: 20251202201451.GL303283@bill-the-cat
Going into maybe: 
CAFLszTh1Tt1=9SOHf1WdnENB3q1E7vdq4mK4XjPC7Bob5gQoEw@mail.gmail.com->20251202201451.GL303283@bill-the-cat
Looking at: 
CAFLszTh1Tt1=9SOHf1WdnENB3q1E7vdq4mK4XjPC7Bob5gQoEw@mail.gmail.com
Going into maybe: 
6b2751af-783b-40d4-b205-5859b7eaa0d2@cherry.de->CAFLszTh1Tt1=9SOHf1WdnENB3q1E7vdq4mK4XjPC7Bob5gQoEw@mail.gmail.com
Looking at: 6b2751af-783b-40d4-b205-5859b7eaa0d2@cherry.de
Kept in thread: 6b2751af-783b-40d4-b205-5859b7eaa0d2@cherry.de
Looking at: 50d0c028-374e-45d7-ad85-29d43bdb9767@cherry.de
Kept in thread: 50d0c028-374e-45d7-ad85-29d43bdb9767@cherry.de
Looking at: 
CAFLszThxhLBEm731QjvB-wbOGryGBfh1_09NeWNy13nLwqZW4A@mail.gmail.com
Kept in thread: 
CAFLszThxhLBEm731QjvB-wbOGryGBfh1_09NeWNy13nLwqZW4A@mail.gmail.com
Looking at: 
CAFLszThFdfMeFTtvDyXfH1iO2zx5fe9rJJSz=MQBGJiXB4HG5w@mail.gmail.com
Kept in thread: 
CAFLszThFdfMeFTtvDyXfH1iO2zx5fe9rJJSz=MQBGJiXB4HG5w@mail.gmail.com
Looking at: 23273f44-32e3-4f8e-be7b-996af8a10c8b@cherry.de
Going into maybe: 
20251202201451.GL303283@bill-the-cat->23273f44-32e3-4f8e-be7b-996af8a10c8b@cherry.de
Looking at: fea1b8fb-2512-41f9-af23-a716c70cce39@cherry.de
Kept in thread: fea1b8fb-2512-41f9-af23-a716c70cce39@cherry.de
Looking at: 20251202201451.GL303283@bill-the-cat
Kept in thread: 20251202201451.GL303283@bill-the-cat
Looking at: 
CAFLszTh1Tt1=9SOHf1WdnENB3q1E7vdq4mK4XjPC7Bob5gQoEw@mail.gmail.com
Kept in thread: 
CAFLszTh1Tt1=9SOHf1WdnENB3q1E7vdq4mK4XjPC7Bob5gQoEw@mail.gmail.com
Looking at: 23273f44-32e3-4f8e-be7b-996af8a10c8b@cherry.de
Kept in thread: 23273f44-32e3-4f8e-be7b-996af8a10c8b@cherry.de
Checking the subject on [PATCH v3 1/4] fit: support signing with only an 
engine_id
Found change-id 20251030-binman-engine-e349b02696d0
Current base_msg: [PATCH v3 1/4] fit: support signing with only an engine_id
Checking the subject on [PATCH v3 0/4] fit: allow signing with an 
OpenSSL engine
Current base_msg: [PATCH v3 0/4] fit: allow signing with an OpenSSL engine
Checking the subject on Re: [PATCH v3 4/4] tools: binman: fit: add tests 
for signing with an OpenSSL engine
Current base_msg: [PATCH v3 0/4] fit: allow signing with an OpenSSL engine
Checking the subject on Re: [PATCH v3 3/4] tools: binman: fit: add 
support for OpenSSL engines
Current base_msg: [PATCH v3 0/4] fit: allow signing with an OpenSSL engine
Checking the subject on Re: [PATCH v3 4/4] tools: binman: fit: add tests 
for signing with an OpenSSL engine
Current base_msg: [PATCH v3 0/4] fit: allow signing with an OpenSSL engine
Checking the subject on Re: [PATCH v3 3/4] tools: binman: fit: add 
support for OpenSSL engines
Current base_msg: [PATCH v3 0/4] fit: allow signing with an OpenSSL engine
Checking the subject on Re: [PATCH v3 4/4] tools: binman: fit: add tests 
for signing with an OpenSSL engine
Current base_msg: [PATCH v3 0/4] fit: allow signing with an OpenSSL engine
Checking the subject on Re: [PATCH v3 4/4] tools: binman: fit: add tests 
for signing with an OpenSSL engine
Current base_msg: [PATCH v3 0/4] fit: allow signing with an OpenSSL engine
Checking the subject on Re: [PATCH v3 4/4] tools: binman: fit: add tests 
for signing with an OpenSSL engine
Current base_msg: [PATCH v3 0/4] fit: allow signing with an OpenSSL engine
Checking the subject on Re: [PATCH v3 4/4] tools: binman: fit: add tests 
for signing with an OpenSSL engine
Checking for older revisions
Grabbing search results from lore.kernel.org
Mailsplitting the mbox into /tmp/tmphb58mgmz-mailsplit
Running git --no-pager mailsplit --mboxrd -o/tmp/tmphb58mgmz-mailsplit
Ignoring result (not revision we want): [PATCH 0/3] fit: allow signing 
with only an engine_id
Definitely an older revision [v2]: [PATCH v2 0/4] fit: allow signing 
with an OpenSSL engine
Adding: [PATCH v2 0/4] fit: allow signing with an OpenSSL engine
Skipping [PATCH v3 0/4] fit: allow signing with an OpenSSL engine: 
already have it
   Added from v2: 1 patches
---
Analyzing 14 messages in the thread
Ignoring 826:  all: $(TARGETS) (not a recognized non-person trailer)
Ignoring 829:  elf_sections: CFLAGS += $(LDS_EFL_SECTIONS) (not a 
recognized non-person trailer)
Ignoring 830:  elf_sections: elf_sections.c (not a recognized non-person 
trailer)
Looking at: [PATCH v3 4/4] tools: binman: fit: add tests for signing 
with an OpenSSL engine
   adding as patch
Ignoring 210:              args.update({'align': 
fdt_util.fdt32_to_cpu(align.value)}) (not a recognized non-person trailer)
Looking at: [PATCH v3 3/4] tools: binman: fit: add support for OpenSSL 
engines
   adding as patch
Ignoring 30:              align: Bytes to use for alignment of the FIT 
and its external data (not a recognized non-person trailer)
Ignoring 31:              keys_dir: Path to directory containing private 
and encryption keys (not a recognized non-person trailer)
Looking at: [PATCH v3 2/4] tools: binman: mkimage: add support for 
passing the engine
   adding as patch
Looking at: [PATCH v3 1/4] fit: support signing with only an engine_id
   adding as patch
Ignoring 97:       fit: support signing with only an engine_id (not a 
recognized non-person trailer)
Ignoring 98:       tools: binman: mkimage: add support for passing the 
engine (not a recognized non-person trailer)
Ignoring 99:       tools: binman: fit: add support for OpenSSL engines 
(not a recognized non-person trailer)
Ignoring 100:       tools: binman: fit: add tests for signing with an 
OpenSSL engine (not a recognized non-person trailer)
Looking at: [PATCH v3 0/4] fit: allow signing with an OpenSSL engine
   adding as v3 cover letter
Looking at: Re: [PATCH v3 4/4] tools: binman: fit: add tests for signing 
with an OpenSSL engine
   adding to followups
Looking at: Re: [PATCH v3 3/4] tools: binman: fit: add support for 
OpenSSL engines
   adding to followups
Looking at: Re: [PATCH v3 4/4] tools: binman: fit: add tests for signing 
with an OpenSSL engine
   adding to followups
Looking at: Re: [PATCH v3 3/4] tools: binman: fit: add support for 
OpenSSL engines
   adding to followups
Looking at: Re: [PATCH v3 4/4] tools: binman: fit: add tests for signing 
with an OpenSSL engine
   adding to followups
Looking at: Re: [PATCH v3 4/4] tools: binman: fit: add tests for signing 
with an OpenSSL engine
   adding to followups
Looking at: Re: [PATCH v3 4/4] tools: binman: fit: add tests for signing 
with an OpenSSL engine
   adding to followups
Looking at: Re: [PATCH v3 4/4] tools: binman: fit: add tests for signing 
with an OpenSSL engine
   adding to followups
Ignoring 72:       fit: support signing with only an engine_id (not a 
recognized non-person trailer)
Ignoring 73:       tools: binman: mkimage: add support for passing the 
engine (not a recognized non-person trailer)
Ignoring 74:       tools: binman: fit: add support for OpenSSL engines 
(not a recognized non-person trailer)
Ignoring 75:       tools: binman: fit: add tests for signing with an 
OpenSSL engine (not a recognized non-person trailer)
Looking at: [PATCH v2 0/4] fit: allow signing with an OpenSSL engine
   adding as v2 cover letter
"""

The commands were run with b4 0.13.0 but I actually tested all versions 
up to 0.14.3 (I do use 0.14.3 but went back to 0.13.0 for testing 
purposes), all from a separate virtualenv (venv) with only b4 in it.

I cannot rule out a PEBKAC, but I don't even know where to start 
debugging this so I would appreciate some hints/support :)

Thanks!
Quentin
