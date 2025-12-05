Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01B8331AF1A
	for <tools@linux.kernel.org>; Fri,  5 Dec 2025 15:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=10.30.226.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764949532; cv=fail; b=jNPngQleT6HtawgtDh9sFpBKPjpLaFpTDBcGGV8RjfRKEOYhDjgWTgVqMjougnBbNGhPlmGNARwjMCjsMTHUUy3ZsavM/nVIVMcq7aQwqzdGa4hB97iHn529WsjrMC2YJtIOzhd3n9HhZ67tXGYe3xcjfINRBxF6F6olq9Tfrvc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764949532; c=relaxed/simple;
	bh=IXQHEi0He+p4EXNAwpvPWx5Z7KPTCG0oKXlpY7QWDC4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=YW8Rm967E+t6t/7G2Rj7hqnQm0obyC1pf8I7vNAMls80MpyvowYthtMRIWh3Djb2452xs6v4HBukQMY7MYpbmLzbfkn2nWr0z9vYNZV9747iMMrzaMaGGNEhb5vetWAA5Qo1TB4j49JWRv3o4CASPPPdiIBVgSdp6xg71QKkxl0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=e24FK25c; arc=fail smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="e24FK25c"
Received: by smtp.kernel.org (Postfix)
	id 7FD53C116B1; Fri,  5 Dec 2025 15:45:30 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013063.outbound.protection.outlook.com [52.101.72.63])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 97DC2C4CEF1
	for <tools@kernel.org>; Fri,  5 Dec 2025 15:45:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 97DC2C4CEF1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=cherry.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r/viusbmLu/GSKhH+j71aHsBYwfu9kH2OMtb/bcKf9vfLPJwaEuFXdMB3GgbPUEmkpIShtRukMzALwZPTNl+TUT/YHjILHIIf4wGLhD7VJ/fg3s1IQzGqsyW5Xs0EGLOGmOsHJTcMXv44mGDKIVnDywpK14tnwY+Goo4sF1Bm9ZxUEB6meJi6xHemT+vCtqV7P65Xc+eQU4i/7Lw6v34hWU4LQhQE46SfNGSn2BJE68b9Gw5N7qkCy0MCzJXaSssCG0aXHwiuqwS+6M6NHVj5SAImEDnKYJuP9nb57xB8f8xbjBJyf7QgqQ+CqhkgX/QMdNc4a15eK1Bj5gu0mW8Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4q/m7tQlgCzOk4fXcB9ERJpr5LvnS8cpzW7i2ri0nGA=;
 b=qojOHJlABLNEOM4z2yFRFHU1Zwlb3I6IBam+wIwzKVx62XCajPcCHzofPGweVnLz3lrDfXOpsWR2lq9x5AgsKIwt4Rk/2RWfBTpLnph0v/Bd0Sb6Ixxpn+QeIdXvJsyXpHwJ5nC5z2AV4SK+UfWb1yYr1Wj060ShzyauzeTkk9xD2BafSpzHiQiq90cMMHQanmS6hPq+5TX5BtjL2iIKGoqR6dWphJx3HlG0OX7WP6C5zbK4lyz9VEqzTrpNxvysfJ9xX77F4xM1JYy7C54Y6qPQ3LuRJ4njlivSkEpfHLaufFABJhp2d5ytO3rkZaVLtg2SldpJo/ZonyljcoX9eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4q/m7tQlgCzOk4fXcB9ERJpr5LvnS8cpzW7i2ri0nGA=;
 b=e24FK25cbedzSeZ62rYiZKIVfsEH4ktBzaNnDGoYqFSXSV4pQCPoaWWZaz0s2tSWTjjbHQEeXLxej8FGCTGEP+Yw6CfbRP7ZSkFsvzd5/1beLXWqnw2meqhh+o6/o1KrKJ82zBrI8lLNtE7Ek3HkJEjjVcm3w1yEOP5GjVdH/EA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by GVXPR04MB11588.eurprd04.prod.outlook.com (2603:10a6:150:2c0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Fri, 5 Dec
 2025 15:45:23 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9388.009; Fri, 5 Dec 2025
 15:45:23 +0000
Message-ID: <fb39b81e-3533-42c7-8ddb-84a09a7bf43b@cherry.de>
Date: Fri, 5 Dec 2025 16:45:22 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [b4] b4 diff on multi-patch series does nothing (and fails)
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "Kernel.org Tools" <tools@kernel.org>
References: <3f1646bd-3802-4bd3-8ecd-2ea6ffb16e4d@cherry.de>
 <20251204-quoll-of-sublime-skill-8a039c@lemur>
 <20251204-prudent-free-partridge-ea14b9@lemur>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251204-prudent-free-partridge-ea14b9@lemur>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR4P281CA0303.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f6::16) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|GVXPR04MB11588:EE_
X-MS-Office365-Filtering-Correlation-Id: f12c37d3-ee32-49c1-fd27-08de34154d9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cXhJOTM2RUdzc3EzRjlpcHNUWG4zczFBTGluU3MvRFluTU5hcm05OUxFSlNp?=
 =?utf-8?B?OWJwRzByU3dQT0dDWkh6a0pqU1hET0JUQ1NFaWxUelo2ZFo4ZFlSemx0RGV5?=
 =?utf-8?B?VjM5WU1sQ3FrM2ZEQ1lCSkM4ZlFkSVgvanhFRmp0NkM4YjE0cUIwekpKeldy?=
 =?utf-8?B?N0lTNktDM09DTCsxMHdsOXFVT0Z6Sm45N3o4MzFwWGVEOXRvdExpVFVsZm9V?=
 =?utf-8?B?QlpJcUJWQmxaQ1hzMmNRTGFsekEvdkFNSHlFRDI0NjFGc1hVVVFGNnlvS1JL?=
 =?utf-8?B?UWZwMWh5M2FBNEN5UGJ5N2g5ck1pUEcvN3ZTM3JqaXBLcUVWcUJnY2JsZzB4?=
 =?utf-8?B?UVl2NnVHcGJFb3Z6ek1CQWxrZFd1UW5OMEFmKzhWNXVpZkd3WFV3NVlaZnpz?=
 =?utf-8?B?Y3pUT0lycitEelhoZVpGMGJnS2JZRmtGeU8vM0FBbGpzNzBHMUhvazYvMFhO?=
 =?utf-8?B?NG9ncVlySjNWLzJMYnFWOTBFdWZXWGdDV0hSWG1UWTJWZnh0emQyN2kvZmZE?=
 =?utf-8?B?QkF3eUZhM1V3NWlEZmhnZ21FbHI5N2NJVXB0RnZMS2xkZkVOalVOK1YwbVlN?=
 =?utf-8?B?TTN1UnN2eWFyenl0c1FGUU1vblp2SzFaU3Bnb3I1T1haUmdpY0xPTkhwMS9S?=
 =?utf-8?B?SkNWejY1b0RzNVpDWHNCSDlWMVp0Z1lDdk9xMi93b2pkNjZLVUk3YkpuTGZU?=
 =?utf-8?B?V0lNNndBVEJXVUpId3FCQkNhM2MwRDZRNUVUOE8xdGFKSjU1cWJxQU53M0Jn?=
 =?utf-8?B?NmpIbDhtUitHVGFjUXBRSEw0OGV0Q0JVS1NxQXlldWFnbCtRbnh0dE5WTm5W?=
 =?utf-8?B?NEJSSEkwOE4rVkxlblFQd2g5ZWRQeU8yQ2RnWUJhZGJqUTJuR2ZiMCtKSnAr?=
 =?utf-8?B?djBnMzB2aW9tZ2ZqTjlOS0RPNVBqNjM2aUt2a1BaeDlPWlNveXcxMG80VGJ3?=
 =?utf-8?B?U1Q3azhaVUhGQjhjbDZpZDdnR0EvZ2ZGT2xIbko4dk9iQlFoWC92aXJvMlVn?=
 =?utf-8?B?dFBFSnRIekpZNGpkSjlSRm1ZeW03UEJuMFVvaldqcEk0MVFBVC9zUjZWbzFx?=
 =?utf-8?B?QWxrQUlqSHVEbzJncUZLMFpkT1dnTUtySk1kQjZKS210QlZiNHNueUV2aXox?=
 =?utf-8?B?emx5VnBjVUNieWVVY3RZMm0xblNlTTNqR3VQYVY0NktrUGdJdjV1ZGViMkhX?=
 =?utf-8?B?aVVCNnFPdk5raUQwNHBkd3A5UVpMZ1d4M2lGcFVka3U1WXpKVmRnUTJYa2Jt?=
 =?utf-8?B?UDN4VG5OaXRiOXphL1NxQmQzVHJWbzhIMUZpd3JHVlk1Yi8zSVRzQnZXYVh5?=
 =?utf-8?B?QW9Kc21vQ29ZWm1qL1dBMmQ5NUY3Y2pPYnlacmdqZkFCNDVIbEp4UzFJVnBk?=
 =?utf-8?B?a3VWdllzeE1UZlVlcVBZOTZkR2V4Sm5yS0hqTmdmSE02c25wUXZhOWtOeUV1?=
 =?utf-8?B?QzhQQ3puNENOMUpQNDh4MXFvNjJ2aXVWdzZ6TTZ2c3pYbFhYMXErMTRkT0lU?=
 =?utf-8?B?VmJ0QjZRM09scjFBMENMWGIycC9BbHNhbG5UT0lQVVVHTnk3UHJYNWVCU3hj?=
 =?utf-8?B?akV3WTJRR3NJVnRmRDdoZzRMZU15Um5wUG1UK2VFQi9HbWYxUm5ReVJTVDlO?=
 =?utf-8?B?cHlBK21sVGlxcExIQXNLUXVzcEsxYXBPSU43T2I3OHRBeWkydWdrLzUwaFp3?=
 =?utf-8?B?VDBwRFBiald6OEpuTERvY0k5Z1gwcEhKc3p3QkdlNHU3WW11REhXdFJkYmRJ?=
 =?utf-8?B?ZXkrejBnOUpOdkNnT0JURy9yTkVUbytKUDhaaitTUDFSUE91cE14OWx4LzRj?=
 =?utf-8?B?NUFFOXBRS1NsYkx6NmM0VU5rbmhoc1pTd3VxbFdqY3ZPWFRaSFBHaTNaR3l3?=
 =?utf-8?B?Vm9VeFJEUlk1K2YvTkNzcWltVjU3bDBoWGtvbzNqOFI0aWtOVFlMZnFnY3ox?=
 =?utf-8?Q?VlE9u1tF36pu7fGZ6HEpv+0FlhwgECr7?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dUJhOUhYN1JZUmREMGhKVkNqZ05rVlJ6dWVqMVJxVmEyNDc4RS9Pby91SFNE?=
 =?utf-8?B?azYxQkUxWGN1eXRueWlwUFo2Nk10ZVhXTk10SjM4dU8xbGc3a3VIQnNVaExl?=
 =?utf-8?B?RzZuYkVrb0xuclVTNHhzQUFMeERoellnRnl4WXlNZXpkUUZ6MzFvS2FwYXZy?=
 =?utf-8?B?UnJUM3phOXNoV01RL09oa0pkbzhSeDc4Z3lZK0oxeGxBVURvclQ0VkZJU3ZB?=
 =?utf-8?B?V0RUd0pBTjdJM3NlS3NVbno3NmkySHYxcnNTWExCRkM0QWQ1QWJnNGVIMnFi?=
 =?utf-8?B?cG9LWGZ4VW5YZmQ5bm82b0h1bzcrcFVoNmNEOU5XOUlqcVEyMUF0NkYwTWpV?=
 =?utf-8?B?eDdUSElGcGJncmkvdGN1UTFUNi80M28yWFlqeGh3bkxOTG9DRFBTRmE5S2Z1?=
 =?utf-8?B?VGhBajVFaUprelFUaGdNY1pHeFhEYmFZWTdTRTQ5VUdJN1k4NndqQkl0bDdT?=
 =?utf-8?B?N3ZWamJKNGc1RmV0YzlkY2tldXpPWU9JR2FCYWhMQ1E5SlpQQXE0eW1JRzN1?=
 =?utf-8?B?bmM3T3lrY2FpV0t4L0hYL0JiVWpDK1duaGhwT2VMM3B6R05iVkl3Y3ZyN3lO?=
 =?utf-8?B?NzkvMjkvWG03MmErYzd2eXR4YmlRZDRscDZDVUJQc0NnbkI1WUhLbVBMaWMx?=
 =?utf-8?B?eHk2RzhZZnJLRFFNVCtVU3h3U0h5RnFYcE12Z2pmRTFGV0p6emR1c21WM0pI?=
 =?utf-8?B?S0JXeFNkSkF6UzFWM2dmbFhqb0MyYWFsSUlhaEJZVFlnb1I4cDBJRWUyWndR?=
 =?utf-8?B?b0FpNWdxZ3F2Z2FBZjdBWElhNUJmZnB5SERTOVQwOWcxcnV2aDlXOHA0Rm5a?=
 =?utf-8?B?cTJLUlQyT05tTnpDNWVGa3NtWnFSTGRWWHJDR3NOYWF5QUdMYUoreU8rRkFG?=
 =?utf-8?B?dStxMndkUGhHTEtINzk2RDR5ejdFRkFQTnRKR254b3A0MG5zSmhxZWl6VU4v?=
 =?utf-8?B?Qzl1c2ZzZkRPa1IrTmcrV1VlTW11WkZ3cVVtb3kvN3NpNWJnNkErRWh6a1g2?=
 =?utf-8?B?ZWp2ZDVMbzNtNTE5bFJDcmlndTRCTTVmTjFkU3ZNZkRlaUsrRGpOR0NKN0ZV?=
 =?utf-8?B?ME8wMFdaQ2w3eDBwY0Y3T0hUZDBwK0pUYkplSzQvQjMzR2FZVGhZM2xoRzBu?=
 =?utf-8?B?cWtWSzBaTFllMU1UeDhnS3pybzNLaDVacjBzVVNsdVRVdEplL0JpRFNKUmVH?=
 =?utf-8?B?K3hDcDN2cmpwbFdNUEFYT2U2VlZPbEVSekw0MHlINlVsNG5BZDYrZFhtcGM3?=
 =?utf-8?B?ZzZKdC9vc0JMQUkvMG9zajZXdllzWW9xRWl0OWtqeHN2WUtkQ2xoajVQaDha?=
 =?utf-8?B?cGdNbHBrRDNCcmRzMFRiZU5HNnF1NTF1RkJlSVU1bXBHaXlMcVRqUmJONUF2?=
 =?utf-8?B?c3B3SHpwK0pqRS9BVisvTC9PMFRxaVpzSFVncGZxSC9uMDIvVTZPYWFMaVlV?=
 =?utf-8?B?WW14b0VIMDlGZkk3UUF6d3FMejJ0cTZjRlgvV1RYei9TdHE0N1ArNjVGMFlO?=
 =?utf-8?B?d2VuZDZkVlFPZmdXTjNpWVpuSzVIMzNPTmIwUHhYWDJnTzJpMU55UVhNQnZk?=
 =?utf-8?B?SmpNck1tWEhaUEY4RGQvSzUrT0xHR2xPdndRR2tucGR6dmJzR0ZISlhsdVRP?=
 =?utf-8?B?YVFqT1V2VjVpa25xR2NyZTNOeVJ6akMxaGpXb1pDVElXOUU1VDJPcUtwZEhU?=
 =?utf-8?B?Y3gvSkY3TFBTSTBWOWUxK0JXYnZTd3JJNnF2eHhldlNiVmk5VHFoZVNmZGE4?=
 =?utf-8?B?TW93OVhGS0pCN1hvc252UHo5b3BDb1NGWFFSaTlTb296YWhlMVdzYVBHL1VU?=
 =?utf-8?B?RWMrRE1mZFBpZFhMaWRkV2tndFVSWDNWbTVHREsxNlZoQTlQcGljT1phVWh6?=
 =?utf-8?B?UDNGejRoTnhiU082QjVOK2F6TWZ1RTJWVkF2Si90QXNTUmxXSDhKSzBpOVI5?=
 =?utf-8?B?OVh1cklzS1R1TjMyUGtTQWR0V2RMTXBjOGhhbHkzR2xFRUZiTk9WNUFRUjU5?=
 =?utf-8?B?TVVSbFRXcTJsTll1VW1vNTFoTzI3d0dDdUlmSEh0U2c5UU1Yc2thSWxyMDVS?=
 =?utf-8?B?dTBZTVNoSnRvTlo1REtZNXBHcFA1cFJlY2ZpczRMVDlUTU41TDlCb0F6N2hW?=
 =?utf-8?B?cjZMcXJhU2dlQTQ0dndQUzAxZmY0QWZITGpZQnJmc3dVZW1yVDlCWjNWbHdY?=
 =?utf-8?Q?WoAawHMliUpwV0fGLktuDvI=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: f12c37d3-ee32-49c1-fd27-08de34154d9d
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 15:45:23.5142
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iNjvacjNz86EE6j1acAkMZmt0RQtFTZiVQC+BjnbUgcdQ0YSbuETbdEvMU5ktDnmf9nFjQPSuZRJJ2vHDdenIexN/nyvpcfy1bLmf4Y/rtM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11588

Hi Konstantin,

On 12/4/25 4:01 PM, Konstantin Ryabitsev wrote:
> On Thu, Dec 04, 2025 at 09:41:37AM -0500, Konstantin Ryabitsev wrote:
>>> I'm flabbergasted, the same command I believe I ran a week ago doesn't work
>>> anymore. (the same series can be applied with b4 shazam still today).
>>
>> Yes, I can confirm that this broke with the migration to the new servers.
>> Somehow the search for previous revisions now only uses the first patch in the
>> series instead of the entire series.
>>
>> I'm investigating and will follow up shortly.
> 
> Looks like there may be a bug with search threads download in v2.0. I've
> reported it upstream:
> https://public-inbox.org/meta/20251204-modest-jaybird-of-will-9d55dc@lemur/T/#u
> 
> Meanwhile, I will repoint lore.kernel.org to the old servers until this is
> fixed.
> 

Thanks for the quick fix, much appreciated!

Cheers,
Quentin
