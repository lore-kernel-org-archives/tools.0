Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89BA033062
	for <tools@linux.kernel.org>; Fri, 17 Jan 2025 15:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=10.30.226.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737128985; cv=fail; b=PJ8MdmJJeIPPO4BW4wdHyCf4EtPQ6htjLbNqVkQevN/izPm5x4hLBz/Y2MrAojMM0rdiRy7pLeR58bLwZxFAbwPlkw9B/sF0rjn4FZp3Q6vIEXfNi1cdZPozeC4jcwle06XAcPut0hL6YBLUiUWkDXvrAJWV1I7qiNLRvF+L/lI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737128985; c=relaxed/simple;
	bh=K3lZZShN3MB5uIRE53pyMwqoGCnh8b0dxU+uUnD20V0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=SXcCX/CEtiA9NBdbk4WEo70oLJ2B1mUn0Kg4YMbYaD1R6pNmj7678ZselxSsFlZjtbQNw8uBipQY5tT1JbwDJkf2Be+bi+b6nCyzFRSreG8USV3xwcLnVLpNXlbes/0snU0CQe7h+t+I/RPXb0u1qRtThEcrMFJWtkz3jK0xs1I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=W+xAgJN6; arc=fail smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="W+xAgJN6"
Received: by smtp.kernel.org (Postfix)
	id 185E9C4CEE0; Fri, 17 Jan 2025 15:49:45 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2087.outbound.protection.outlook.com [40.107.20.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A56FEC4CEDD
	for <tools@kernel.org>; Fri, 17 Jan 2025 15:49:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A56FEC4CEDD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=cherry.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=epOu0iENMqijw3HEOC+Wlf7HzBaMTJY2EkYSRwZzlXXojnQ7siaEyX5sWo67unC//S0jDb0dls6PKGLAAc0DVu+UHyg7Yjr2lfZ9Tbi7u5bLEbyKVlCyA++OvTiJijQkFWhjhSYR4LWgwDFJqpy5AOr1bUCbW/zy6sgWM0kro1W/szKSo9xV2EMieW67+/qmUuVpVJrz5DzRsNN/86i7kte+OeM/pNA8eclAggUlejUP/a+dzFjHakwxisU5VUBbdinpGwRZCw+Tl+mlKnpHC5rddctv/KTA7y7ocDlvRwLZWJ39zz28qW+xTDc/w0Dkf5tm3oAnrp2lBrImkHgVMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=41S9mt5alOb+YV3GuBIxshxCSLnVLe5AIHbl7v7FYHo=;
 b=Y8AQuRKrTBAxCxYocXEO+q2Tn7K0c0RKZqDKKFW3Huekqkueqx9QshPL/4Zd955AO7MthRu1HPDre9qDWXPLD9xMKE4uWAlCXIp38Y1t6rNKdRfEEwSDePHomAKwoBpD1RORn8ghFmTFTok+UIleAn+QOE+RTlw8D4nhLJf8Fm85SS72hraw4EdhxBgACVsPVZ1I3owUf2iWu45kdV5Xi7HggHlHToSuynkqt/h/z4HpXXS+10oCuiAxZkf8MStlivBjlGldaObvlUf6jg7Ak8DUQdtasd8VVC+GuLQSqjlSFCS0DvmdXqtG2K8JydqqJqdusS2YDFDXN5lG9UU/gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=41S9mt5alOb+YV3GuBIxshxCSLnVLe5AIHbl7v7FYHo=;
 b=W+xAgJN6PlMQuTIogV1+eiqFSQVauRKYBfyqWRGelP0sQVagTgarpNOilquYkM7gwobZeOlCpE+2pbLWgmrAuvxSKZ++tezPgQR/upqis9K1zGuBWb+appcE4mwCHKuGmoi1fo5nGPWxbycI9sOmpmM7wPqBWl1DXum9fcmprXk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by GVXPR04MB10071.eurprd04.prod.outlook.com (2603:10a6:150:11a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.16; Fri, 17 Jan
 2025 15:49:37 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%3]) with mapi id 15.20.8335.015; Fri, 17 Jan 2025
 15:49:37 +0000
Message-ID: <8f22b90c-3216-4eaa-abf5-85dc29625e4f@cherry.de>
Date: Fri, 17 Jan 2025 16:49:36 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [b4] prep-pre-flight-checks doesn't seem to work
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "Kernel.org Tools" <tools@kernel.org>
References: <a8bc0958-6c46-4622-96ef-b1e55c15f30f@cherry.de>
 <20250117-ambrosial-interesting-trogon-a67628@lemur>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250117-ambrosial-interesting-trogon-a67628@lemur>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0250.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::20) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|GVXPR04MB10071:EE_
X-MS-Office365-Filtering-Correlation-Id: 196144b0-e989-4042-ea48-08dd370e8c0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QTBReW9RL2hya0tZUWptN0JVY1R4NnNEMFphUmFma2p5SDBnQjJMM2R4UGl6?=
 =?utf-8?B?ell1S1ltSzFTUFBxUDRDZFJHVFN5R0hza1BBTmdJOUxDQ1V4YS9Fcnd0UTF0?=
 =?utf-8?B?UXlyQ0ZxM296bTBUbFE3V0YyZzhnTDl6OXNOUDZ5dFlqeXl5OXEvcXc5NFRi?=
 =?utf-8?B?ajhrZWlNM1dRRTQwL2RTR1RVenBIY1lITCtOaGlHTnY4VnZxN0oxMnoyKytt?=
 =?utf-8?B?dlRRaUZwYU1pYmNkV0ZYUjArMWNqNlZ5U3M0cTFIbGR3TFRYdXgwMHQ2NFov?=
 =?utf-8?B?NVlkMWo1ekROWWxKemsvZXVDYWdPKzUvTkU0YjBmRGJ2TjdqOFZERWwrTFN5?=
 =?utf-8?B?WVYraFZSL0xWcXIvamxzamErZ2NEWjJPZ0plODBRalZMYjFhNVlHcWhzejQx?=
 =?utf-8?B?WTE3Z2NqbUY2dHl0RG16WVpTa0pRWmx1bk9uRkVSLzFVS1ZKWERqV2VNRFVR?=
 =?utf-8?B?MURxZVlFOTNqc21za09XMmZmdkRjRExBWDlnVnBueEhjSUdKRXRsU0tSb3lB?=
 =?utf-8?B?MjJNS2FrRGVEcjRsWVNYRVExc2pUbXUra1IyVHdnVmd6djVFa2tVM2ZGbVAy?=
 =?utf-8?B?UWlaSTVmS09QcnY4Y1B0cDlWYzlSeEl0SXNBQ2pLZXQrQmc1azl6NE9QS3h5?=
 =?utf-8?B?T2lWTjQxaVVKc2hGTTNhalFUU1dUcCt5OWc1TXVuSzVKWnVDeHNPTzFQNFJH?=
 =?utf-8?B?dWhpQkJhSDRSa2x4MmRSL2Jtamw5S1VMKzBwVkx6a3o4NlJXa3h0VUxXdHgy?=
 =?utf-8?B?cTZnUzV1QmN6c09YZk1DejVLV0U4Tm9CYkhQOTNPek9GZTNwM0VLbDh0NzR4?=
 =?utf-8?B?elFvZUtTb2o3RWZVbHdOMmVOZW0xaERLZlljVGRWS05hOTc5dEJKdWFsajdT?=
 =?utf-8?B?OUJZT0xBbTgyK0MzQjk0a2Zrelh6SkVEU0pJSTV5Q0UzdE5yYzRXc3pQRkJX?=
 =?utf-8?B?UlNjaUV5YWVtY3pLVmhwUmkvcnhzaDR1aXJGTVRhaGw5ajFrcDM5ODJzTzdk?=
 =?utf-8?B?TU9qcXRFbThSMXBNUVJBQTlXcXJBVFk4bEowQlc0V2lSY1lZaG56S213Mkpn?=
 =?utf-8?B?L2pQakFMY1RTY3RTeUtzOXNCWFVkaW5FU1R5MGRvZm5KNG1aQjRzRHlNTk5l?=
 =?utf-8?B?V0xRaFBCRDBnemUwOWsrYlhBVGMzdEhYMkFWYWlhV0U5RmlGRnVZbHBDb1FO?=
 =?utf-8?B?Wkd4ZUVNYndxdUdGUVVwVmpldFdpcjBnZWZYVXJUZ3FHbDlWSDJVcFA0cTlX?=
 =?utf-8?B?bkE1Ymxlam5JeTExSFlWUm16Tnd3NlVXbjltRlRrUlJQRjlzVWlBK3YxcWJJ?=
 =?utf-8?B?YW5LNmxpODlBcm1MaVBDWGRKUjAwMEgxeEVVSEQvMng1b3B5ZUpuWDZrU2lO?=
 =?utf-8?B?N0twUXdRdG4vcC85UHpDdFIwRUxJUTI0MlE2NWtScEcrcm5HZmNFYUpjYzZK?=
 =?utf-8?B?UVRDcCs0R0E1aGJlRTFlR3haelNXOTNvcUl2TDRxeWxWYmpjTTlHMTQzc3VZ?=
 =?utf-8?B?MFVPa0VYQUJkcFhDaTVtd3lrOFdGSEhuR2JxZEFSWE9VYnc0cUlGUEtvSE9t?=
 =?utf-8?B?OXNsL1FuN1RVSkhXNldRTEo2bVdHLzNMQmplV1pMYnJhWWFBZ2pVWXdKNTB1?=
 =?utf-8?B?cTVXSEphRFFMNnFDNWJmUk5lREtJR0Fnc1MxWXZDZGF6UXBncmxIL3VNYklq?=
 =?utf-8?B?MzZRQ1MvU2JZb2huMGtPZlRheW1mSFBhZmZwMUtUWnBLS0RDYTRLWVJMaTBw?=
 =?utf-8?B?dldRNmtMakZ3dWdWcGNFaFVRRWpwQjFYdUdqNk1KRXZ5TFArdG5KY1A1SVJj?=
 =?utf-8?B?anJxYjFUazIvWnlML1luZ2EyZ2NtZWNtS0hCeVhjdHc2V0ZhQ2RsK1l5cldi?=
 =?utf-8?Q?XljJm/fEkYE0q?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UzV3N1lwNnhYYVU3dFZ0TkZ2S3R6R2Z1N2dKbFdLUnVIV2hyd3BMd3NHM1RV?=
 =?utf-8?B?emRpWmFORmV1NEN4NmN5QWxMQU1GelVXYTFZdkJFQWtMMERjQzEzTlFJOC95?=
 =?utf-8?B?MkJwNWNJWFBkczBlcmxPd0dnRmpLb0NGOEkyREMrYmc3MnUxN3VQVUxPcTVn?=
 =?utf-8?B?R0JSb1E0eFZXL2ZRS0pYRVBNekEvblRpY0xPcjFBZ3JLekRmNmQyVE4rMTNw?=
 =?utf-8?B?N1NNT250NkhsRVpacnkrU0RWd3JPT1hRWnE3STdtSVdGZFovUWRhMGlheGFE?=
 =?utf-8?B?NFJYdTRxc1JkenRvMldsOVByUkNiSVJKRmZENnI3MzcybFhsaGhaVU84aFNF?=
 =?utf-8?B?aFd4YVliUU41ellTQ29Td0svTEtYTEhvZHpJMXhLeUQvWVBoUC9uRFNXcHY0?=
 =?utf-8?B?b1ltTG0vckpHOXhJOTVzeExLeGV6dVBhdVZ3M3NvRSt1ZEd1Yi9FZkhieDBL?=
 =?utf-8?B?ZWh3WWVReWxrVHI4WEdIS2F1NTRhQllOM2ZaNE1GM2FpYlV5c00rNzZQdFhQ?=
 =?utf-8?B?SVNMU3ArT0g0U2dVTU1VREZHNW14MHAxV25PbTJuZ0xRU0xrS2E1b2N6TFhI?=
 =?utf-8?B?K1Z2bjZzeC80TG40L0NVd0tKNmZzNnNJY3JuZmtvTURneitiZ0FkSlhQc1Rj?=
 =?utf-8?B?Y0lGSWlLL2VRZzlhVkNMOXF1K0UzcFJib0JSU0xYUENReThjbUoyamJOUVpU?=
 =?utf-8?B?V0VWeDBYd3BHaG1SSzhQb1lYc0pHUzJucEU3a200WGlBbmZpRGh0S3N6WExj?=
 =?utf-8?B?YUpob3VidzVaOG1NVDZFbXIxa1BpODBDSndPSDBoZ2RadSszNjAyQVFZSXVH?=
 =?utf-8?B?S0VXUHozYU5uaDlpV3RSNmk3cDhIZEtlNnZyMGI0d1M1Q2Y2enVjWmpmNGtP?=
 =?utf-8?B?bnpkLzlTYVNwMkVLY3UzOFR3OW8zWjVzUnFkcE9mSmZTbGk0Uy9XTm1XbGtT?=
 =?utf-8?B?T200c29DUmRVNHhiL01oMHpKaThnNUpUeEpQdXdnWGo2eXdSY3dqVjFSSGRV?=
 =?utf-8?B?ZzUxSFpUTGxBWG45bWtGdDZPVXQ5a0pWV01rak1HUGZxSS9ZZGpURHdFMjBy?=
 =?utf-8?B?VEhLMU9oaXM3U2d6RFBORlhJY0dpTUh2Y0xVSENRcTNkQmNEVGYzS1JNT1Iz?=
 =?utf-8?B?MXlFNStocjU3ejRCcFd2OGhhMTU5Wmd0d3V3d3ZlUGJoeDI2OVBMc0VTbUZY?=
 =?utf-8?B?dml2M1lZL0RqYXdXVEloUTA0RW84TEJkSzM4WklReFhDc1Q5MTNHaEpOcjRp?=
 =?utf-8?B?ZnJiZWZFNHZMSkdTQnhaMkErbzZNbWpqck1nckIzQjhHRFRRY0pxNGh5TXIz?=
 =?utf-8?B?SzBVKzA3SldsWDdyajFHMHI2NnBORmRPZWEzMWdRNTBwV0VzcFltYmZEcmhp?=
 =?utf-8?B?a0E5QVNycDRKdGN3czNxOXNUb1dCMU1GN3JseU9weG5sUDVTZFhvSkh4eHZ4?=
 =?utf-8?B?OFkxdHN1aTlJcnZRZWRjMHpxdTVSZ0xTdzF2aVNlLy94Tm9zQU9JTDVzdjVp?=
 =?utf-8?B?N0NkbGttMEJGRUdrYjlrSllJRXh2ME9HSkVTb3drTlA3RlNBZUZaeE9ZMDZM?=
 =?utf-8?B?N3F3bGphVU5PVC9wdFk5Vyt6cU1aaCsrS1pkTkJzblFvU253c1htMXBDS0RN?=
 =?utf-8?B?T3dLQzhJdGxEUnBta2MvUVFET3VqYkl0T3htRXpKNFN3bEJ3UjhvZlpQZ1Nn?=
 =?utf-8?B?UC92TUpyMHQvNWxjMVdXYmFjQm50V1JOMjA4NDVWdjg0L2RVUHN6K1dMcTJS?=
 =?utf-8?B?TkxsTUhqRStHRWhDTEM1ekhQNGszenI2L2hBNGZDL1V1aGcwNlpORVhjeTNI?=
 =?utf-8?B?czBEa3pMNVIzNitPT3dpSy92TUNmalBxZElzR2xrYTVVY2pFUEVMSjg5ZTVi?=
 =?utf-8?B?TEsyTFVORkswdXliZG4vTkdXOTRMT2dIWnlXUWQ1b01IbzB6cktRUUFCd09S?=
 =?utf-8?B?eG9ncmE5V0lGSG1mUStOWitrcDErVEkrVy9lY2ZyUFhUcVJ5N3Z3SkJBNmI5?=
 =?utf-8?B?RC8wYWNBR1RENEVkdUNDRThLdXFyUERrVmI4N3FubFhmMWtqM3owTEZEbEV3?=
 =?utf-8?B?b3FMMzM2b1ZKaS80N0Q4N01wUmxtZ3JaL0NJNk5KMENSUDlNb2RyYmJ4Vmsz?=
 =?utf-8?B?ZlZvQUdQS1RHcUkyU0dBMGpRaFZNQVhnL3ZSeWRVVW95dzZYaW5kSFRBUlQw?=
 =?utf-8?B?a3c9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 196144b0-e989-4042-ea48-08dd370e8c0f
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2025 15:49:37.7079
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H5kEsXO4Brm8Oeb15/FFwoTp23ZS49qHk+Jd78XkpwOscgT9Sru+BJ0IY9Hln50I98TOBqPutEk5YRhLr6d44FKS0fBGnIFgRb16X/U+igQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10071

Hi Konstantin,

On 1/17/25 4:20 PM, Konstantin Ryabitsev wrote:
> On Fri, Jan 17, 2025 at 12:35:16PM +0100, Quentin Schulz wrote:
>> Hi all,
>>
>> I believe prep-pre-flight-checks doesn't work.
>>
>> I've added
>>
>> [b4]
>>    prep-pre-flight-checks = disable-all
>>
>> in my local git repo .b4-config, but b4 send still complains.
> 
> Right, we only pay attention to a small subset of configuration options
> coming from .b4-config and prep-pre-flight-checks isn't one of them, because
> it's not something that should be configured project-wide.
> 
> What problems are you seeing that makes you want to disable pre-flight checks
> for everyone?
> 

We do not have checks nor auto-to-cc commands, so there's no point in 
telling the user to run b4 prep --auto-to-cc and b4 prep --check before 
sending the patches as they'll do nothing.

Cheers,
Quentin
