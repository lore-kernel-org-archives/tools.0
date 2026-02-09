Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0E036C0C0
	for <tools@linux.kernel.org>; Mon,  9 Feb 2026 11:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=10.30.226.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770635406; cv=fail; b=BHFcDh4PwqlldQXN7KYSj3+7aQm1+dj+QZUoSC51rgEcZPvGB9TIt7ZmSfizSICq/zNHraZn8PI5f0UU16RNwKdlnxZ4H0N9TshLAgQ3Z5DMDYvNqWsp5sfbCWUG3zpGXpF9RR3ca6VOX32IevTWTiehnXG0VKcIliiG2KoDod8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770635406; c=relaxed/simple;
	bh=oSae3FPqNatF7UAZhQlMr2Ad9e05UyIZJD6q0JQ5uVI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=J0rKABehmaotLycweyR0P2BMPtVJ7ahCS7sOS4rnukRcz0F72A2Y5S18Jqg2Yc4Z/zaZQGkc1p4QiB+u7K0Y4nsBidH+CofX8s/9LdybvwHhjYNa5GzBmbIlsHytNl9v+8Lh7qNBseK5L3VKAgpGFQc14zd2Rzz+sF81jtvsskk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=OAafEbxf; arc=fail smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="OAafEbxf"
Received: by smtp.kernel.org (Postfix)
	id 943BEC16AAE; Mon,  9 Feb 2026 11:10:06 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011060.outbound.protection.outlook.com [40.107.130.60])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2C9A9C116C6
	for <tools@kernel.org>; Mon,  9 Feb 2026 11:10:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2C9A9C116C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=cherry.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lVsDNrScJfFUiqtot8CyLzw6hpiIn6OJ4JUiGs2AAmuOSU6oymy+i8DDDO04KWH3W/qaZEcea9TshA9hxcWGFm4GU1uNVmT+vHdtjkAHp//PG00IT6014JfKsuFXn5jUJnJALbBFEk0kM6xiyQpx1fiL7QkUW+1vX+Mv7kb3ZMDbshAWZu3PAH9vAj0ysCd3TEf9gRqU4gx9qZrG6hAxCgFgzEsKfFMQELhEfSTnM3yfbcDOx2zZYNleKa+Vgw20YRyI6Jc2NxG8dCJrrsPjKDjm11I68JI7iwv9QnM3HTZ/Hpg+abjFZPFGn25+ePCSaL3svo79i/+XnRvHMq1pQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ENC6gFPQ52AURqeYlgZT0ONjqqAx+j/TvVTkQ4a05pY=;
 b=Tq8OU3btoDcd+xL8PRfx8A7Q795UgLbFI8iX1ZBilziQMKSDYHd1E7IiYHOVYDGh+hvbf+vRCwsL4wkvkRtOfkz+oa5lhD0GT3z6Vz/M/ZS1rIk5AT6DZ6eidvcZyCDh22S85tdR70muhRDIODuk4Hw5mLwLmIjsX+OIv/VxSQkqjozLm9KpHt8CQ03uZephH2ms2qFXCtkiHEIHFoPiO5RPfPt9pwXst7zPfeBgYqT0MD1Ra5eziHRLOIpoA7toGcpKKPpLl0Dcb/HnhT6CjW9fotoJoaJs6LabjLhD9AYqhTSy69PI1rBD01j7XGtF6uD0YJPHwDXDQ1MgYI757w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ENC6gFPQ52AURqeYlgZT0ONjqqAx+j/TvVTkQ4a05pY=;
 b=OAafEbxf2aCKhOq0/XQRqNlLU1B12C6s+4LkVnP8l9Qu97hXlc1KDoThGhV82RHY/fP24LPSXiqg+diUolagvAh/BTWt8snhZeIO23IeHr14yzG8ZlcKtDxEAGhfPiwx7e6IxWYvrof/psUZqySeAUWxE2f6WMTGiPdci+El8Y0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by AS4PR04MB9267.eurprd04.prod.outlook.com (2603:10a6:20b:4e2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 11:09:58 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 11:09:58 +0000
Message-ID: <54f66bd9-3613-41a4-a8d0-dc6c9898e67e@cherry.de>
Date: Mon, 9 Feb 2026 12:09:41 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH b4 00/21] docs: various fixes + migration from definition
 lists to glossaries for config settings
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 Quentin Schulz <foss+kernel@0leil.net>
Cc: "Kernel.org Tools" <tools@kernel.org>
References: <20260203-misc-docs-v1-0-fddb72511357@cherry.de>
 <177015602599.1183724.18098082713650045602@lemur>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <177015602599.1183724.18098082713650045602@lemur>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0069.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::16) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|AS4PR04MB9267:EE_
X-MS-Office365-Filtering-Correlation-Id: 64d90ee4-0f88-4410-0424-08de67cbc2f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T3hxUmFRY1gwQzFZY2hwSC9IdW83eTM0UDFoUjlrRlFxaDBxZlRBYUJTaUN4?=
 =?utf-8?B?VUgvN1VwdGZnQ21ua0dsNi9ESHozb05nV1RMWGNVY2tIKzBBNFBaWXBhOFhj?=
 =?utf-8?B?VW1QM2g5ME5WQ3lCVllZcW9XcVl2bkY4RDY0ZnhhMXNYK3gzd0tnL2EvSUYx?=
 =?utf-8?B?TWlHZVdLTTNpRGpza0VLSzhvZ0FJU1hWNit6R3EzUmE5SnNrK2YvUldYZm40?=
 =?utf-8?B?RU5vOHhuVmZkVloybVJnUDlwMHJZbGh4V0xwdWIyd3NJNHdaWGNxbkFuOUFJ?=
 =?utf-8?B?UFJNUVJlM0V2QmZhNVpCakVpd0x4a0tmYXFIa1ljWHVuWm0rNjJDQ2I5QTA2?=
 =?utf-8?B?MzR1am5tbXZDVkI2REQwdGtCNnliL3BDNXF6VkJManI0MWZiWVJVWGYvMy81?=
 =?utf-8?B?WmdqVGxjMXZJbnFjRmJmcDRORFNnZnNnU3cwSjkvdGRlN3pZWDUwV0JtT2hV?=
 =?utf-8?B?U0xDeUUyU3FEc2tLbFpYL2pReFE1YlRJT2llZlpseFI5ak45aXo5dVVxY1Y5?=
 =?utf-8?B?c2c1YTcrS3ZsditRQ0hiWi93b0RvZStzUzZzWkNQOE9mYTBmSVZpYUFGUjRn?=
 =?utf-8?B?U1VRZU15MDRYbFpCNWE5ZWFxNnZVcEVWVjk3NitPcnZHU05naElJbFk2Wk1S?=
 =?utf-8?B?M3FhTDdwQUlCSDBNNVZZblNCRWFYYWtiSndDY1MzbHYyU2RaNUw2YmxIVHh4?=
 =?utf-8?B?b0FucEUyWmhHOXNHRkVnaUVBSjB0cGJGUk9pV1p0STc3ZUsyWFVLendQQXVR?=
 =?utf-8?B?MEJFc2lraWZRcW5IWm9LSHVZVmtjdnZ6QnFjK0gyQm5pdVNtTVpxK1VRQzVk?=
 =?utf-8?B?WEZwSnpGNjZaOSszeEtHSUp2WDFjY0psTGZjdUtMME5LT3UxQWRsU3FGbHFT?=
 =?utf-8?B?TmRpYnA0ZHpoMmJ1cHhOM1lmV1FLYzlrcExkQ1BjYkVXeHNGLzFzdFByQXVK?=
 =?utf-8?B?enlwU3l0THptMUVFVnFmU2pJMWhpTXhwQmdMWVNXaVpXZkFWVFYwR3NRNUJD?=
 =?utf-8?B?VjdDWEJmRU4rQ2MvSXhFbTRDQy9uZ1NPRDVLaXEyTUJmQjZNdDhMdkZGZVcx?=
 =?utf-8?B?WDl3SkFaVmZXQy9sR0tmdE10ekJlcmQrWmcxSEdnNmVxK3UzdzNLN0tLOUQ4?=
 =?utf-8?B?NUtjS09HS3B1YTA3SmdIUEd2TGZtdERXYWZENkowcEREQkNtVHJHQVhBU1pj?=
 =?utf-8?B?WkxVaUZXRVVhYlM5VXAvSmlldEt6aU9GWUd1alVEM2lJYmVZT0ROdStvOStx?=
 =?utf-8?B?aDNXUTNmTks1YXlPWTduTEFDNmV6RE53cE9EMVFhalZpU0w3N0U0R0tGTGdq?=
 =?utf-8?B?VDFBNkxDNkhVaTJBQ1pVYUZRZExPZlFobGhBYUFzS0IvNUtqT2F2dzkwd1Q0?=
 =?utf-8?B?SXlTd2h5dHdqc1BYVGhSK0hKbmJhcytwck9XVW1KSTZieEh5V1Q2T3ZGUmlt?=
 =?utf-8?B?eGo4aEcxUUlQUll6NHRQbXRSUHlxbnk3VFFjaVcxaGZ1WHNjanczZUYwazJU?=
 =?utf-8?B?SCt1QVAvQ1NsZ0RPeEREczY3U3NuTFNyVTljN1o1Q2RURTdXa0JicFppRTUy?=
 =?utf-8?B?Z2U4NzhNT0NOWllyMUU1S3oyS3l6Vml1YklaWXBSdkdkSlZYVnNMT2VTT1lM?=
 =?utf-8?B?d0dWZnk3WmpZNzlTNVN0M3JuTTU0RFN0RkwwRkJ6TUM4RHdsYmhVTy9sdXNs?=
 =?utf-8?B?ekNpSXdFczYybzM4NHpGd0Nkd09tbDUvUExzTUErcmlkUjdHWk9TNUJmS05V?=
 =?utf-8?B?Y0JpYlAwMjdad0dLSENUUjNONHhZazJUMEFVL2lJait6b2llbmY0T2pmdlZo?=
 =?utf-8?B?Wjh3TkVHTHlib2ludXNuVVRxVUhMUEdJR2lBZVZ6U3BPeWRCMXFiWXJySTBI?=
 =?utf-8?B?SXNGbXdBOWV0OTE4T3BVdUwxcFVkVm5QZ1dPbnhOQjBicmhkZW0xbW0rb1hT?=
 =?utf-8?B?MWJjRWx0WVUzOGN5OHl4TUdEM1ZOb0VKbUJJMm1qc2lyOWxMeWtZUVVueG5v?=
 =?utf-8?B?a3BVSU9UOGxoQVdxbFNaY0pVQm40bThoTE02blViRzAxTUNIT2Z6RzQ4L29T?=
 =?utf-8?B?Y2VuRHNPNEd2RkZraW00QTBqb2daaVUwcHBUTlVEUHZrNEZRbWNxeFJYTXJG?=
 =?utf-8?Q?JOu4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SWJLOFY3MDFVS1FHU3lkR3FUVUFBaWRIRVhKZ282VG9DV09xWTJMUUJLMTkr?=
 =?utf-8?B?NllIeUVOWFE4aXpaWEVVY0UxcHRLTW4wZTN3aGxlMXVnbVFZYUFnRkpIL3dr?=
 =?utf-8?B?dkdaZFdCZTFQZC8xWEJITkxHcUx3Q3IwZ3pIdnp5MWZxUWNHU1EvV0dLM3FP?=
 =?utf-8?B?akNEQUwwT0laNFgwMTZzOXhSVmFoWWgyMmlMV2hLdXlrZjgybkYwSkpmVGhZ?=
 =?utf-8?B?bEdYNC82VWJPTWlCa2lWMDFvSGt5bE15dUZmZXJVZVdxT2VlckFNSXo1Z0xl?=
 =?utf-8?B?SlRqZzQwaC85eU9YeS9RRFUvak5WZEx1WlBtOWdjWU02c0hQRDlWOHBRZWg4?=
 =?utf-8?B?aGM1T3NDaVRXN2JMNEd4Zk5NaHpHQzM1MEhtc0M5Y0JMRUxaby8yWDFKazI5?=
 =?utf-8?B?NHcyckUvYlhTdkNVMXVkYnRKWDNCTXJ5NGhLRFNzV1h4bFhXSjNBeDZJcmJs?=
 =?utf-8?B?UDVFdG1qbFJVWTFsSzFDczBWRU9DQkl6MUE0dUVXbVVRSnRnbVBmaFNHT3ZN?=
 =?utf-8?B?cGNBZWFQMU1CK2FaWmQ4UXI5UVNxdVlURGhhSTVqRWNsYlNCRTltTGpXMTlx?=
 =?utf-8?B?Mkd3Nkp3R1hyTjJ3Q1ZybEtnM3d4ZE9QSDcwR2Rpb0FqSU56RUFGMVcxUFE4?=
 =?utf-8?B?TW51MFNVMTBady9EaXpjR2pWbldiZzRPNXh3eHppK1Y2ZWxrakVYR01Wa0ho?=
 =?utf-8?B?TG9MYUNhWTNVMlE5RmhRRmh6b0tQcngrd1Z1dmQwcTVVMHp2RzhTemxoQVJm?=
 =?utf-8?B?N1BSNzVpYWFtbldGbzc0Tkd2YkJ4Skhra3dZQ1FWUDJDeEtrQ2hlZFQwc1Mv?=
 =?utf-8?B?ajRTb3RxRnV2TEJFa3ViNTE2dmlFZG0vZkFBQzdrQVUyUFdYM1NPNDV1UW1s?=
 =?utf-8?B?Y0lIMitUcXZqT1UzWFUrSEhQLzM4R3ZNTGl1MXFOenBHdk5YRks5SmZUQVBF?=
 =?utf-8?B?UndmdHB0Q2U2dUcreFVjZ1VNS29MWEt3SWJnZXFCcE5iTXR4L2YwczU3RU9G?=
 =?utf-8?B?OUYyNmUvYXJtTDh3TW9kRXNkYm93ZmIybjdySlJKTnRMUHFjc1VSa2N0TUtO?=
 =?utf-8?B?TFRXbnhIaXAwY0hzakw1STVJcFpyTnBDQmVnVXZiMWh5YlhRa0s4KzFmcHFw?=
 =?utf-8?B?ZWVnclRhSGFWR1VtekxXeGJ4YWtvcVdnd1NKL01FdzdQenJUTURtRENGSFov?=
 =?utf-8?B?Y0QrOE5NOEYxS0hJZ2Z3UW9lNDkwWmd2WWNZdGFmVVpJL09SeDlKYkUzdDNI?=
 =?utf-8?B?aE5iRnBvRGRFQmRLVFdYb2VGK2VTZnkzU1pXWXV1Z1RHZkhvOU01VUw4bVJW?=
 =?utf-8?B?NHZCY0FTM3d5K0Fwb1Q3aTBvT2RNbUFGTWJ2dDJGamRRUXdUU2JGVFZPWXNF?=
 =?utf-8?B?ZHhJREc5Y2RMZWNrQlhZTW1WYWZ5WEpESkVGOGljdWFtN1F5cHY3cE9BWkVx?=
 =?utf-8?B?cU5WWjRTYWczbFdMTi81WldxVWNJVmJBbzNuVFBLY2w5M21RUTZnTGxPZjlY?=
 =?utf-8?B?ZW04MDZlNmxRdzZyVjhjOTU0SlJTSTQyWnhZQnYwOTNPOCttRFAxbzgrL3Yr?=
 =?utf-8?B?ZGxPOGNCNytNMHJ6S0xzZ2ZQQ3piWXVhYkE1US9zNlJCQktJU1MxRTJzaS9j?=
 =?utf-8?B?ZG14dGVsMU9IbWdnY09IMWpKellLNERrRFVWVnB5WXhDdFZkbWVYQlN3aHNK?=
 =?utf-8?B?Y3RSZXZiazhxRUYxVldLbnNWc0xTeVVJdHRscTMzSXZrNkFnMVp5ZHZManVE?=
 =?utf-8?B?Mk1CeUZITHBoMG9obDZKY1hUaEJZMWNIbyszakFCZWR1dEVJZjMreGIvMTdY?=
 =?utf-8?B?cCt4TFNGZXBVMWhXNHVjRHlOSzRWdG1sRkJzdUM3dXdza1pxTW5xMTUzYTJy?=
 =?utf-8?B?YlgrN3htUXc3S1lyR3NNc3BWTjZHWStXRHkxM2k1YVM3KzFkYTBZVmgzSVJD?=
 =?utf-8?B?b3Z6MDNULzNMWEE0WUYvRU1rMHVWaHVyOURKNGZGSDViWWxFdlpPMGlBYjVh?=
 =?utf-8?B?UnpJQ1lkLzVXN1VaME05RUpTNm14VHl2SkhyNmtYNkJVOEVIbUk3UUViMmx5?=
 =?utf-8?B?bWVVTEhGZUFKK0N6cXcxcjRnZmNFVGthQlA1c0RDRVRTYkhDQ3JhRzdudDdQ?=
 =?utf-8?B?aEpEbU5iNE9rM0VieE44ZTk0Z2djdnJkbHR6WjgrSzJTSnNZaTMrUi85ZGdn?=
 =?utf-8?B?dTlPY2I5QTBMK0JmYldReHdwcHd1bGpld3dKUTNZbTV4UEF6eW4yTVZsRWFU?=
 =?utf-8?B?S0JyR2dBZVoyd1cvY2QvL1BXV0hkM3llbi91Q2ZwdnYxRndENFVmckpiM1BE?=
 =?utf-8?B?RDk5ZHFqbWRYZ0dHODcrTFM1ZWt1enJLQkZROUtvU0txN3dMYnE0VnNoRVNv?=
 =?utf-8?Q?XX3yo8rg5+nMMM5xPQBRc6NBM9ircaUSa48zj?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 64d90ee4-0f88-4410-0424-08de67cbc2f3
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 11:09:58.1468
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2fJQIHeuoYXEC4d9VI/Qx0qnJ1vLhPh59mNyi/EgYYh+8/xUASumFvnNiHxHznDiTfIz+VB+KoxNb4rVzV/Beu7q0g8Te1inJ+Fmmqiydko=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9267

Hi Konstantin,

On 2/3/26 11:00 PM, Konstantin Ryabitsev wrote:
> On Tue, 03 Feb 2026 14:30:59 +0100, Quentin Schulz <foss+kernel@0leil.net> wrote:
>> This makes use of rST version admonitions for config settings in
>> anticipation to make each config setting a term such that we can
>> cross-reference them easily and have an anchor in the output for easier
>> link sharing. Then it migrates current "verbatim cross-references" to
>> actual cross-references using :term:.
> 
> Great work, thank you for sending that in. I'm holding off on this only
> because I want to try merging it using the new review ui, to test the
> full review-merge-thanks cycle.
> 

Ack.

> I noticed that there is no attestation on your patches, not even a DKIM
> signature. Do you mind setting that up -- this is probably not the last
> series you're sending in.
> 

Not the first even ;)

I should have fixed this oversight now. Would you rather have a v2 or a 
RESEND for the added DKIM signature?

>> Note: ``b4 send`` seems to be picking up
>> ``Signed-off-by: Your Name <your.name@example.com>`` from the git
>> context in patch 11 and adds it to Cc recipients for some reason??
> 
> Hm... definitely a bug that I'll look into. I also see it added to the
> CC list, so you probably got a bounce for that as well.
> 

Do you want a separate mail thread on the ML such that one can do a 
Closes: in a commit log fixing it? (I vaguely remember something about a 
"bugspray" tool?)

Cheers,
Quentin
