Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2EC61D8E12
	for <tools@linux.kernel.org>; Fri, 17 Jan 2025 11:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=10.30.226.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737113725; cv=fail; b=C4ZRJPZ82yv9VXnHLacedcJ53iDaRSPF2ZWaxV/VGmw8T+UIBxGPVaUYIdh9cIDWcYd2g6rHcK3LrafPwOKwIK/nZIH7AxNMcSiuiMhg0GFO76Am1iVLzpV7We6fbseAM8ZoF9kXuyizXT53JMufoXuY2sLx1AXfHVXKGFherj0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737113725; c=relaxed/simple;
	bh=3XASuc+9O/iGzCnkzVe2Twn0OvlpTRhpfHrlVMIB1BY=;
	h=Message-ID:Date:To:From:Subject:Content-Type:MIME-Version; b=GihrlqcBRyGD2exuwL7Yd9fR8bSsTGpTJMwGa+C7BFlDEG0/kWGarm7h4VFZCn3xIcSos/om4uw/d41huwVUWaCWQVGVA2VFvfcc7gVGo3GnGklwhjRv1m1KMn5kqtBfFv/KfwQF6Bqpj3zkYfcGBRoFl+b1E4UXjncXTx8s5ZA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=GiBbXCcL; arc=fail smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="GiBbXCcL"
Received: by smtp.kernel.org (Postfix)
	id C9025C4CEDF; Fri, 17 Jan 2025 11:35:24 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011063.outbound.protection.outlook.com [52.101.70.63])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7B7D8C4CEDD
	for <tools@kernel.org>; Fri, 17 Jan 2025 11:35:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7B7D8C4CEDD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=cherry.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bKEJL1R2s+4+3IOTG5tJN33AVUzBDb4OSkxG/YZInUR6zPu99U1tkDl1f9qncDVtXN3hnmdx8F6W9b8P7z6t7HWXXkwRH/nDM8VqFIBSTYyY2U9IU0G888a6N+1WqaGwTj+lsydSSiD67VYQ4QdmkA+hSyOAG3fzSVz3amtKXvv06DpIDBMlYLLAnZFTIZOlnng+qsJaCfrh4aSajMAxjyWfOYnCn7sfvi9mBRpL/WK6YRMAcVePIkYEIpdWTYJkIPsBKdpl5O6wvva8kv6pzucU/ngpMjJAVzJpQRfUkSGMlOXDbLPk/K/EBeB/MUwICTSehfiA0AD09CN+0TZ2dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BaMdS02cuoj8c554b0auTqLsQb0kOQuEEAYwkv2MvCk=;
 b=rsqXFkARWEJKjyHitI60w1HgyZKg8D4iFZttitFk7hg6gMxHmlvMbpwbbCWeiPtipu8AHemfgNXVfCBgukJDwNxdW3JKIkBtGG5WZbBvAx3+KLbxkHTdf9II+2Da0J0m6La4FNnyxUy2sY6zI6ZJGa6LzrV5VDP99CZJF/4X3BBck/qdi9cazHrXG+wdMyjT9Zr/P6fGCSP9j0yvCvx/nHzJSloD4wQmCRTTn1llITyMUFbgi5zmfTGfQrVCUngy+hqJBcVGTK3hc7eZGJSY0PutvlElc1KD223oA7u0kmy7zZ60FDe4prkxosZDNQk8BZGzuDtebmislUBOYas8wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BaMdS02cuoj8c554b0auTqLsQb0kOQuEEAYwkv2MvCk=;
 b=GiBbXCcL4TQe6fBbQsyTwN5ZJw4Sxb0hiJyCnnaxZXUJOOR/XFFAkzJ0mlEEJsk//fsbtfhFHbdNVBb2YLJKGWbdeuik9gdxsPoZidgZwATuQuWxCy7m1EJ0sWPHCisjysuinkH7OPpLocPVLHVOm0WZlqjxXlMMRcIHwvH3dlo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DU2PR04MB9522.eurprd04.prod.outlook.com (2603:10a6:10:2f5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.16; Fri, 17 Jan
 2025 11:35:17 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%3]) with mapi id 15.20.8335.015; Fri, 17 Jan 2025
 11:35:16 +0000
Message-ID: <a8bc0958-6c46-4622-96ef-b1e55c15f30f@cherry.de>
Date: Fri, 17 Jan 2025 12:35:16 +0100
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "Kernel.org Tools" <tools@kernel.org>
From: Quentin Schulz <quentin.schulz@cherry.de>
Subject: [b4] prep-pre-flight-checks doesn't seem to work
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0172.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::14) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DU2PR04MB9522:EE_
X-MS-Office365-Filtering-Correlation-Id: b388193d-d734-4221-854a-08dd36eb03ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R1cxL083WGxscWxVeHpuRDd3WVJ1WkhVNzI0QktBLzN3WkhmQVdpVkF6aHBD?=
 =?utf-8?B?L2lVelFUUWVrdDlMLy9HeXJ1LzhXWG5iMlNKWXA4bm5xdnA0ZlkyN29uSUZn?=
 =?utf-8?B?Ylh1elZScjYzc0hMYUV5RzMxQmlPRXRLRjZOQTh4ZDNDU3VmMUNGdEM4Zll5?=
 =?utf-8?B?aUg0aWpiQ0pFSnZLWDFjbXAzalVrMFZOTUU4Wi9DYVhWOGhjMllXc1F0OVZU?=
 =?utf-8?B?SjVlcG5zR05palJyZ1htN09iaEp1Mk1VRlgwdEdhVmVzRmFMK2RvQ0Y4YWpC?=
 =?utf-8?B?MjZoeUlHSlFKbjZiK3NzRng0ZFFmeVgwUjJPZHFvVEZMeG90bEVjdVJEZTVt?=
 =?utf-8?B?ZG85TnZLV1paRlc5ZTkzdUpXalIvcDBtK3dzQ01mZVBxVmp6Ui9wRmhwcll5?=
 =?utf-8?B?OVRWaWFRZnFGVUJFOTJrUzZLbGpxTFBjVjhxQTdDZFlTU1lLN1FmdTRZMita?=
 =?utf-8?B?UjhWOTNCVGw2VUhLZEdEUjYxU2xIUnc4ang5YVhnMi95SUs2d09BMGpQWXZa?=
 =?utf-8?B?Q25PdzNLNm1WVHQ5Z0FsclY3ZXVxQThVRGt1SWxvcGZjWEdaUXRQakM2Qko5?=
 =?utf-8?B?YXBkU3VqTXVHS0MxVHEvY0IzVWRCaFB0cHFua2xKSmlpRjRTZnZsTzR0dEtC?=
 =?utf-8?B?cC8ySkVvdXB4Y21ROWJ5WXNJaTdyRHFtcGc0bWhTSnBtdlhQejhVcEF2YjZP?=
 =?utf-8?B?czhiZjVRbVIzUXI4RzJSLzJMZGZ4T0ZOZkd5RTlnU0xIZUJPU3hya1hkV0Zr?=
 =?utf-8?B?Y3hvbmJ6cm5zbU4vbGkrYWViVWJNTHFHRDZzNTlYaitiYXIyY1BXSllFbU9E?=
 =?utf-8?B?YXViTmVTUS9tUHlHRG5yTzZpZXhMRHdNNlZySnlTanZTQWtwWWsxbUFxWVJv?=
 =?utf-8?B?bG5WQXF4aVNVbDhSbDJRaEdVd2RDcFpBbm5XYnl0a01NZWpObHdhbDJXNXN3?=
 =?utf-8?B?eklNMnJYMDYvTU5yNHRNVVNqL3pKWm95L3ZIWWxqNG9qVDZ6RGpTdERGbjhk?=
 =?utf-8?B?eGxxd0ZUZGlCbXIwNzBxekpENWZxS1RGTTRjVnNHRGRZTlR2RDNOeGx5c3lI?=
 =?utf-8?B?OU50TVVGRlBsbyttQmo1K2lXNHkzdHd0b3lwUld6OVZKV285eWU2TGwzUkdr?=
 =?utf-8?B?QWtVSkVoclZWa2VSbFZHSkZHUDdBcEsyTFpzcTUydHp5TEd2bDNoM3VZNjlz?=
 =?utf-8?B?dHR5eEh3NnpxTmlZTFpZakFYYXNyRjUvOGVFZzhMbGh4SWsveTdGallKbnlS?=
 =?utf-8?B?RFowOUI3MlJIV29QQU1HVEJLWHlISE4zRHVTOVExeWVyQW5jeFUvVXBUeU9S?=
 =?utf-8?B?NzVLQ3hkcG5XSUpLQStPVDFEMnk5bTNWUmhGZVg1d0pRT3FHajg2TzkvOFkr?=
 =?utf-8?B?VDErL1NETUkzZ0RLbWtQMHVkRm02NWdSeXczblJrNjJ5UWdibUtseU9haFpS?=
 =?utf-8?B?Tlo2MzI1YkdNcThkakE3S1Z1c3JraFNKdFBveFhLTmFsSFd0QjFnVHJDcktu?=
 =?utf-8?B?Q0dwZS9sdWM5anF1VDhpR1dLd1RSTWE4K3FNTWJ0akhwWkZsL1gzcC9HUXJx?=
 =?utf-8?B?WlpIdUk4RGtEdDV2SVkwSUJaam11UWpzb1NKbXNnMWpXYW4wa0ZPZEtaSS8r?=
 =?utf-8?B?YXJKTlFKei9XVGx4b0xoYXlCZGFVcUt1VTZ0MUVLb09SNEFQYXJLN21nVUhT?=
 =?utf-8?B?WEYxTDFYc08xdTlWU1ZZTGJkTlhacENtWVhHZG1yckNSQ3JRRFZBdUV4THNl?=
 =?utf-8?B?TmJUU3A0MmpHZ1dxeXp6TVJLdW5mdkk4MjRqVHdQZDY0aXZ4bUVYYlRESzV0?=
 =?utf-8?B?L2dqSXNuZldzWFlTSXJ3QT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WGNUcHFhR3RVU1QxQVN2ejFEd1dIaGdKcUg5V1pmTkN0WS9kQ1ArRVZqL05N?=
 =?utf-8?B?SFRtajZGaVdQbTB6REhZZWlBNUtOdzBMenBreDRiL0ZXdTJrR2w0WmZxU2dW?=
 =?utf-8?B?eE9obDdSRm5ZT3JCa1drZWlBTXBWUTFpYmFZZ2x5S09HcHdZZnVyRGhvZWdH?=
 =?utf-8?B?ZVBxR3BiVCszR3pDSGZCS1hFYXZDTEdGaldhcnAvcm5rRVdaRTBydGQzMFlF?=
 =?utf-8?B?K3ZrVXpvWDRxUW9nczhJVDNIOUIyME5xRkRoL2x0bHdJSDZiT1o5QTNCSmlr?=
 =?utf-8?B?dlhXMXRmRzEzSjhmUExqMGlBZmI3bVVsSlFUeWNZZ3RPcnIwZTNkN1Z1NXZz?=
 =?utf-8?B?Z2o4Y1VKOGtENVNzaDY5SEF3ODhFeXVCRGl5VTdVbFZ6cXQwQnBscFpzR1lT?=
 =?utf-8?B?cEMvNENzMEJhVlpLWlhYVHBpdkNZNG1FL3BFZmhxeXhoRThrQU8xTks3SzZX?=
 =?utf-8?B?Rm83KzQwcU0ydVhBVUQrcTlhNm5EeTNGT2R2cGFnTVIrWXdhUWNzWXB2KzVB?=
 =?utf-8?B?bnUyUEN3WFIwMDZBUnZrZ3JrLzhvd2dJMTNWL1Ixb2lYdTBBSllDYlZ0NTEv?=
 =?utf-8?B?dURCeUxRd3hWSEFqTW9iMEFtMjEzcTJXM3NxektxMGphSU4wK0VwM3JBTUcz?=
 =?utf-8?B?VVoxQVA1eGtBalRyT0NoQ0tQWUZWUTBCMTU3ZlptVUMyS3I5WUNUWUpiQjV6?=
 =?utf-8?B?YzB2cVpZdGQ4Qzh3Q3pqckpLTTRMUjE0dVJjdEhlblZ3MmR2SWEzdnJwRnU4?=
 =?utf-8?B?Y2c3dzJyQklCcmJhb2pYQkxYb2xvS1daT3pmdERFdnV4Yjd1R1B0VnE1UmNs?=
 =?utf-8?B?RjNieXFlajZHcW9ML3IzRE94azIxc2FTaWg2Y3hVM2NJbnhLajdMVk5PSmZt?=
 =?utf-8?B?UnNDYnZiL0M2MkhoT3lqUmdWb3pvMkRSUlY1bnJobUR4SjNFNExEVjhTSGFF?=
 =?utf-8?B?N3J1VFZ5TDU1SEg2OVZjVW85T3lKZGI4VVhNK2Rhcm13MDl0Q3BYZkQvUmE3?=
 =?utf-8?B?ZFVuMWVRVXhveXpkaUxHQWVLRjl6dzBiSzNseEV1Q0xkbGFFelBMdm9vL1F2?=
 =?utf-8?B?VWV6cjFROVdhN3VqQWdvcXB5bGZ1bWtvSTJsQXlBR0o5M3hqU2ZndFdWL2Fu?=
 =?utf-8?B?Z0xNOTJVb0M0Mkl4ZGxFZDBZRzB1R3REUzM3djhRQTdVR25sclhIYmZEc3J0?=
 =?utf-8?B?Rk1aSGpsWG84cWpnQWZyUEpuU3VPdGFZSW4xVG1OOUliVmZTUzlsZ1cyQjNH?=
 =?utf-8?B?YzR2bk80VWlDdVFMYU1XYUVSQnJkSWhFbVBCTmExb1VtODNDQUR4dDB4K2ZY?=
 =?utf-8?B?TlRuMzNNNFo1dUNtK293ZEM0dEQzZnRXUzM0elBocVFHZG5tTUhVNVBoYStz?=
 =?utf-8?B?K2VnTlpZN2ljOWJac0RRWEF4ZE5RQThPRjVQWmdnMTVPbGFDL0t1d2NRQWpJ?=
 =?utf-8?B?QTk0RkVBdDRNWVJOVHg3V003cm1GWnpYbXlUSzM1V0hUUHVNZndacngrU3Z0?=
 =?utf-8?B?ZjlFSTF4SU1kRndseEdYbmx4K2lIS2dCQWx3YlJWMkZMejB0aU9ta1hTZzZ3?=
 =?utf-8?B?djZab2xRWTZxUlkvNzRuYnBmb2wwQ3NWNEhhQW1TU0ZwVUlXSlJSQlhnRGFs?=
 =?utf-8?B?N0NZYmtIY0pWYURsdHlEZ2tFRTJvR0hUc0FocTJQOUpubS9xWlNCeWNNYUJB?=
 =?utf-8?B?TzV0NTFGYmc5dlZoZDJ2bk52NTliOW9zcVBIN2phMHZmRE9TQmVVRDRHL3l2?=
 =?utf-8?B?c0RqRXBLRnhFUWRRMDA5M2xNTVYvbGhRV3Era2kyUzNNekRia1k3OEp2VmRT?=
 =?utf-8?B?L2JGZlVHWkcvQ2JZcWp6eWJrblI5dURiSGR6WkNtUENkZ0JnamNKbFdDRlZM?=
 =?utf-8?B?Q3BZditEWTJIZmloZktVS0xRVThtNEFGOE50RlpDOG01c09WdFB3cGZaOXpQ?=
 =?utf-8?B?M1pHMUh1cys4SGQ5L3RDZUU1ck4yeHlLbk1ZZDRxNEVRYStnS293YlNGLzBu?=
 =?utf-8?B?S05tQzRUelZDc1FYSHNhMng2N255NVhKREhweDVOYnFiVkdTQ2ZLYzJUeWE1?=
 =?utf-8?B?R2xXSldsYnZvb2N5VzljU3VrUFZ1WFBUcEJ6aXlSeW5uMHgrVHhXV0tVTWNB?=
 =?utf-8?B?TitMYmNkUTZ4UTVONEplbmE5M1RWY3AzRGRuakx2V0REUnJDemYydVFuYzc0?=
 =?utf-8?B?Smc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: b388193d-d734-4221-854a-08dd36eb03ee
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2025 11:35:16.9297
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gmA8aODJ8triI9eWv9VArVevDCw7lHcn10lGw/2t8RP3ApHt/K3+rib4OdWYnN8doS+kbpUWj6VmJfzw2swtXB2ZVsjrhVGrRXuSUT+fK1M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9522

Hi all,

I believe prep-pre-flight-checks doesn't work.

I've added

[b4]
   prep-pre-flight-checks = disable-all

in my local git repo .b4-config, but b4 send still complains.

Adding --debug to b4 shows the following (stripped down to what I 
believe is important):

Loading worktree configs from 
/home/qschulz/work/upstream/yocto/yocto-docs/.b4-config
Running git --no-pager config --file 
/home/qschulz/work/upstream/yocto/yocto-docs/.b4-config -z --get-regexp 
b4\..*
wtcfg={'send-series-cc': 'yocto-docs@lists.yoctoproject.org', 
'prep-pre-flight-checks': 'disable-all'}
wtcfg: send-series-cc=yocto-docs@lists.yoctoproject.org

Now if I dump cfg_checks from 
https://git.kernel.org/pub/scm/utils/b4/b4.git/tree/src/b4/ez.py?id=33ea697cc3d0bc77d2f3fb58176116608a0f1332#n1923 
I only get "enable-all" the default value if the prep-pre-flight-checks 
key is missing from the config dict.

"""
diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index 814413e..b514556 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -2883,7 +2883,7 @@ def _setup_main_config(cmdargs: 
Optional[argparse.Namespace] = None) -> None:
      # some options can be provided via the toplevel .b4-config file,
      # so load them up and use as defaults
      topdir = git_get_toplevel()
-    wtglobs = ['prep-*-check-cmd', 'send-*', '*mask', '*template*', 
'trailer*', 'pw-*']
+    wtglobs = ['prep-*-check-cmd', 'send-*', '*mask', '*template*', 
'trailer*', 'pw-*', 'prep-pre-flight-checks']
      multivals = ['keyringsrc', 'am-perpatch-check-cmd', 
'prep-perpatch-check-cmd']
      if topdir:
          wtcfg = os.path.join(topdir, '.b4-config')
"""

patching b4 with the above makes the property persist. No clue if that 
is the proper way to fix it nor what makes a setting worthy of being in 
that list.

Have I missed/misconfigured something somehow and this should work?

If it helps in anyway, running Fedora 41, Python 3.13.1. b4 tested from 
master (33ea697cc3d0 ("b4: stop generating full object IDs for 
non-binary diffs")) with b4.sh and also from v0.14.2 from pypi.

Let me know if there's anything I can do.

Cheers,
Quentin
