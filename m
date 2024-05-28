Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E61316C68B
	for <tools@linux.kernel.org>; Tue, 28 May 2024 13:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=10.30.226.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716903584; cv=fail; b=g8UVKN3NW9VsA8fUlP9abvwTzwbHV3ucQhvEKNDGNj0MbKVCjd/80liA2Z4sGGDgWynI8Zbiz8yYNJGcSpTv8zKwm7fpb756wqbKupvq/zPQDxyzNr/cUbDTzu0YfBOH9rac0Sy4JHbTsA2IUMOSgW967/DMu9hUM76HwmC7gis=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716903584; c=relaxed/simple;
	bh=Qs/0vJDowv5AAGcjIoW1Lq8gqK8Ek945M8KyUuLLyf4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Qu+/PhuZwgJWY9xHVM8QbmoI3At2saqhKQX6KW/EC12DZvDZmb0dRvmQ7KFe496dFZ3B7S9HNdPhw8Ie9clexxO0cVXoy9HqPzUMqw2P5uGuCET9ss28xcIL6cnhfu+dszG+oKu8rN5+xWaCtSLmn+XNW6rKLOLmScI1EMgOeIQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=jiqzxv+a; arc=fail smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="jiqzxv+a"
Received: by smtp.kernel.org (Postfix)
	id 25B66C32782; Tue, 28 May 2024 13:39:44 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2104.outbound.protection.outlook.com [40.107.241.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B08B9C3277B
	for <tools@kernel.org>; Tue, 28 May 2024 13:39:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B08B9C3277B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=cherry.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E4rMT7s8LYDtN7YrcuJ5McQpTFkVdT4p78tQRKuw4P5bWe/9SeZYNrEOglJlbp+q0x0YCk/IXu3ZiQmWgSenQyaO0mF1UBCVUT6bWFkZCXt7e4x2LVovk5EpTF/19XOxcbv2HpxD4mWbcAsH7fqRRr32QWkVQU3NLezJwhg2r+lAyk9v69PRQokNG+0QFzetaYuWsBJkztIWXrbYeBEj7bHTAEufid9Bk0F04qItn/TZLAIaMBvGVGX/TllTlMko0IrzEDyfEUg/guv8rgE3ApK28jkECnb9wzkfb+tjQXpleWTGJzg59DxYSsJXEiM+k6duJED1s247V6ll7h+pXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qksMXT1Gn48kq7etAsn4p2xGfuFKeap6e/TDlIk1g0M=;
 b=PhNZXQqF7OvKetZeJ9NEEiUirvlOINw0KAi15SXnP/F77qRHAeVKYSyuAKLV9S8dC98dbkUNvwyY9HEyno+qW2lZQIMzVdFfQqsnDyzzjc1WRnFvV50p3jP1V0ACiFKD5zizChebXbJJ3tqnq1K5vnAFJmybwR+eYVfRgLfMQjxdoSW0+tjZKmg6wBoyaDs9eZV27evMwnCTNh5SZYltvG+GvKuMj/p+zKmcxAq9HOUys6l8cEMiYrz9kxXdeX/vUjqAcM5tTxu/cPX4reqpIXKEQuaicsMtHe03nNktUtplVEZAqsPTFKFwWLhMLPdPU1gv5InHX5wCgyroXRWpJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qksMXT1Gn48kq7etAsn4p2xGfuFKeap6e/TDlIk1g0M=;
 b=jiqzxv+ak63btICCX7yrIFVXEi6C6kb/3Sc8BOPRb1LEjxAqdNbfv9Ki5mU+tGL6SQYCjR3kpGU8heQyU5ivYkGWwklkpUAU83tIMrfl82tbe/UdiQeHPWKqkBaUW0C6q5PsucGLo7op1q5uv4q79fD0JAA3keWRgQ3tDJbMp44=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from VE1PR04MB6589.eurprd04.prod.outlook.com (2603:10a6:803:128::25)
 by VI1PR04MB7038.eurprd04.prod.outlook.com (2603:10a6:800:12d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Tue, 28 May
 2024 13:39:35 +0000
Received: from VE1PR04MB6589.eurprd04.prod.outlook.com
 ([fe80::8476:1b2f:f236:db31]) by VE1PR04MB6589.eurprd04.prod.outlook.com
 ([fe80::8476:1b2f:f236:db31%6]) with mapi id 15.20.7611.025; Tue, 28 May 2024
 13:39:35 +0000
Message-ID: <79c4380c-0e7b-42d1-b954-147a6f77e95d@cherry.de>
Date: Tue, 28 May 2024 15:39:33 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH b4] docs: document b4.send-prefixes conf option
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Quentin Schulz <foss+kernel@0leil.net>,
 "Kernel.org Tools" <tools@kernel.org>
References: <20240524-doc-send-prefixes-v1-1-c6465822ad8c@cherry.de>
 <20240524-great-fanatic-whippet-caec89@lemur>
 <20240524-nebulous-ibex-of-finesse-c2ec8b@meerkat>
 <2e1d55cb-6692-4ea3-86b9-06e2af45f739@cherry.de>
 <20240524-radical-silent-seal-8d1cb5@lemur>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20240524-radical-silent-seal-8d1cb5@lemur>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0047.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::16) To VE1PR04MB6589.eurprd04.prod.outlook.com
 (2603:10a6:803:128::25)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6589:EE_|VI1PR04MB7038:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c2f3132-a476-4936-60e2-08dc7f1b9cae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZUNpWGtkS2wzVXc1MFNsbjN4dlRlM1h6L2ZSVmlUY1lXUzFJQ0g4bjVOWFlM?=
 =?utf-8?B?UWNyTkNKRzN0SCtXYTBycHJCUXJ2K0tXNjhHbDV1aVVZemZ0VURVcmtFYldh?=
 =?utf-8?B?dGpUWldtdGxGZjh1ZVJkWVJPajNGcDE0RkEzNWMvWmJ3Wm5TVitGSk5SbHYw?=
 =?utf-8?B?OW5RRm5kdjkyb0tZUTU5RHplWTUvWmhTbEJlb3NKYU5mSGlpanpPOWY3cTYz?=
 =?utf-8?B?RWhYekY5c2pMaVloNFMwU3dhOUJuQmFhY3U4Q3hZUGNDTVdpSVF2U0duVlAv?=
 =?utf-8?B?UjNTWkx3Z3krd3NyY3B2Q2xNNU9SUVZydmYrRmpzS2pJejZYRzFkd1JxR3Jk?=
 =?utf-8?B?ZUxWVGtJMEI2SUtNS2k5bUt5Uno1VXFZdmFqdVhKVzBRc1Z2cjM0U0F4UE1M?=
 =?utf-8?B?dncxOEFWd25yeFo0ZVF1b3VWNlp6Y2RyVUJUWmNMeFdhV0EzS28vbWw2N3VZ?=
 =?utf-8?B?WnBVL1BLam5VQWowMkgvL3g0N1U5VkJxVDZyaXNrakhLTE9zWW5ZbjgwNU1J?=
 =?utf-8?B?d0UwQk13OU81LzhpZ2lWRC90U0pMRm5BR0hBWE1wYVV5TmlvTHpWSS9PeE5w?=
 =?utf-8?B?RTBrUnhuUWRkT3N5L2MxclJjNTNmMU1xRDl1MmZxZWtVeVlEUzQ1N0JxZmtB?=
 =?utf-8?B?TjhDVUlkZmppVG5NQ0dnWGdHNWVCM1JuRFFoN1RTWFVlbU5jR1kzR3NKUnVD?=
 =?utf-8?B?TU9QWk1jaFJLSHpXU2dtdXpsaG5USGliVVgyUVl4NC9qNWUvS3h1dzIxQ2NS?=
 =?utf-8?B?YkkyMWloejAwZFpVazhyVFI0RzZlaHp4eFRRUGpyN09iakplU2p1MnlXdHVh?=
 =?utf-8?B?aGt3c1VxMnNXUHhIWEFWd25OUUtmWTk3Q0JTeXJId3hpblVjWE1rb2Q3Zk91?=
 =?utf-8?B?WGszNG9aVlNTdE5zY1Yzek1wQ0gyVDNPeGtrNWxVMGtPZ2pUdTNncCs2TGVF?=
 =?utf-8?B?K2Z2bElxU0xnMFNWVS9CeUNLeld4ZnBjS2dLT1Z1ZUVnUCtxTEdJSWpuTVZh?=
 =?utf-8?B?RTBHb2s4Tmp6S3llMkZMZDh2eXVCd2E2V2o3bmVQTkI0QW5FbkNQd3B5ZHc4?=
 =?utf-8?B?dlJ4N2VoVGRXTmFiWmlpZFdsTFp6YnZubThnSXpyczVUUTdVelAzT1dJWFZW?=
 =?utf-8?B?ZysrNDI5Y3pEdEZqWnM1aDgrRTdleGRGa28yMXB5TnpGekZ3YWljVDdwd2Z5?=
 =?utf-8?B?am90bkI1cmRDaFpoSGlwaDNjM09zL1h3bWt3bGN6UlRwdUN4aVplR0FyV3Y2?=
 =?utf-8?B?ZjNLNjVXK3M2MkhPcnIvY3M4aHY5bFoweGdYUlhQWkJIYUI2QXp1OFhUcDha?=
 =?utf-8?B?VjVsN2NGUGZ1VDIyTmVOa2JUVVpDZlhnS0pIbHJGTTd6WkpkOUs5YS9kckdV?=
 =?utf-8?B?dVV1bFBlZ0JUSWNLRmNnM01FOFh6WGtlMXlPcERKdSt4Wmc0MnZ5cEpYTFJ0?=
 =?utf-8?B?L2NCUGRVbjBFL01HSlNXdVRqYUFxa2JRZTRBZXFpSXorQ3VlN1d1VU5HdWFh?=
 =?utf-8?B?UFBmWXdHbXNTRDhOc1Zuemx0cUh0UENCdE1UY0ZJc2dmbUlNTitpZm10R3F4?=
 =?utf-8?B?bmJ5d0l2bjh3Q2tsWFNkVS9Hc2RxK1NuNVRmUnBaY0lHVTVqZmZ2bExQRUZY?=
 =?utf-8?B?V3BFQjZBVXNaeUo1WTZ1NnQzZE5rRUFEa1AvNEZZS1Jwd2k3VWkybVErOEpH?=
 =?utf-8?B?d0tBT3ZzOW1WQVJHQ0Rjc1VvT2ZwT2V1cS9LZmFuMnpFbHNlVVNldmdRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6589.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RnVqNXI5dld5R3c5WTRGNkhIdndrMGlJay9GNHdaY1A5WFZWUWlXZXlvb2RL?=
 =?utf-8?B?dVRFbXJDM2RBQzYrNlI3ejBIVDFPRFgrRVBqOWRRU1JBOTRMYU5PSHhUSGlq?=
 =?utf-8?B?SittZ2U0OHZ6MGNudldkY29GOFp2TDhVR0I5UktIVXRTUEJzckhpaEZRZHBn?=
 =?utf-8?B?MG1mVHJNSG5nRUYzYjFrVTNOc1Rma2phYmNFamJ3dGk5dUljazhjNFVkWVNZ?=
 =?utf-8?B?ZXdReGczMytIME5FamNBOE1yN2p5T2ZxRysrZlhMUllKTGlCcWFOd0dNWU5X?=
 =?utf-8?B?S1M1VTA2MG10RkJrckkxNjQzeVh6dUxVWTEzbk0zODZBTnQ2YkxWeVBhcHlI?=
 =?utf-8?B?Sk1CWVpaaFFEVkR6ZGl5OGpsS0NNajZFelhhcHdMNW12SEhhTE8yc2d3KzRp?=
 =?utf-8?B?NXowZURKNEdNRTJBQkx3TnFmaitYUjd3cFVrMm82bDNhT2pNQnhGRUhESFBS?=
 =?utf-8?B?TEZ2UmdRRzZDcGtraE93SDYzY1ZRL0RleEQ5aGJ0Sk9iRWdLcG5RM2pIczZv?=
 =?utf-8?B?bWVhWWtWK1RUa3puK2JUbEFmemdkV1IxWFBxZXNnV0hUNC9SRHB2a2VMRVNo?=
 =?utf-8?B?ZTZzQ29tZHBBWFd1dHRGMG9HWTI4dWtBYjFzTVZyT0FncVpZUTlrbC9ERVVy?=
 =?utf-8?B?Tko4OWlDS0ZJOHRhZ203Um5SdUFvM2doRW1teE5vTlJMN0lJVGRsNWJjR0lz?=
 =?utf-8?B?eEY4SGVtK3dkUlB3dTR4SzEyenM1MC83dHJLeWp2V2hpM0syUmhBOFhUU2Jm?=
 =?utf-8?B?MWorVUJsUkhaMFNTZWViNjlsd29zdDY1M3pkcExYYmwyZUhTWUFCb2I5VFJS?=
 =?utf-8?B?S3pJR0NSY0NSNDU3b05CZkJCVFczTkFYMG1Ta1F0UVRiYUxVTGZjZjBhUEZ5?=
 =?utf-8?B?S3ZYRmN4Rkc3Rmx1amJuNXNUeWw0eWpUMHM5cUhPb3hGYkhLRG5zSkhBeGpP?=
 =?utf-8?B?UVF4QmR6bzN3R0JKdUpmQkxKZ25CTFoxNXBwZytVY05ZOWFVQlUyNDNBZ284?=
 =?utf-8?B?c04vOXdNQzFKelliaVpMVjJTZEtXRnl4RkkxTmtrN1h4dEFob2lMNEdLSWpw?=
 =?utf-8?B?SHFoU0NDeUlJaE1KUW5pckkzQlJEM0Fzd3NXSGZvSDhSeUU0MkZYWnB3VjE2?=
 =?utf-8?B?T1NsQW94UElMR1NKeGl2Um9FZDdrYlNaVi93MzhNMVVKQzdjU2dKbVJZdmJt?=
 =?utf-8?B?MkVwVFdzb3V0QkRvZi9WK0J2LzZ0WUJGekU0VmJ1WmRkUG1XR0prWWYzQ0gx?=
 =?utf-8?B?S29MRTY5eVhxR2Jlbk9Ya1Q3ZFBKUFhWcnlqV2xkSnZFRWxFYTVybnFtMHNn?=
 =?utf-8?B?Q2thcGxYL2tlQlF1T1cxd0UwSE02WE1KdDAwUHJDaHRLTlJZbU5YTzhvcU9T?=
 =?utf-8?B?aFVsVUpYOGtteGhQS2p5SHlSVHFHOTgzb1NTU040eEpFTUduRlA4WHY5UDVl?=
 =?utf-8?B?MWRuN3Zub1pZa0Z3OG45dkQ4a3hXS1V4V1NaN1pIVDJ3STZjSk9wZTBwUGNz?=
 =?utf-8?B?K3R0WXorUnQ4WGZwdzJHVHZabGIzNXJ6SG4wZE9rTjE1Rzc5R09nc1ltbDkw?=
 =?utf-8?B?bVRPa0NFcTkrbGlINUk0UkNoVVdHa0YveldkWlVJWFQ5K3NjZnRXNnhGaHR5?=
 =?utf-8?B?ZXZJTGZ1cmRqYXpHZ3VxL29GYlFhNFpuRTRRbjNiMHdJWUhIN3E0bWlwYWtL?=
 =?utf-8?B?M1oyMjF3K0hCS0dzQmdkUUl3aXBUUVFWMm1CeUp6d2psUDVvUk1HZXBsN2RI?=
 =?utf-8?B?WW1DdGRCeS9TMmRlcjVSc0huRTZReUp3SEJMblRvSXlDcXpRZTBxOVkxcmlC?=
 =?utf-8?B?L3FReEdJTUpvNkdYREhZNFVXa2tsL3dOL1FBQm1obEZYQk1YbU5wZGpNWTkw?=
 =?utf-8?B?amtsM3BiM2s1N3JNTS91clRJVHJDYU1icU9YZEZJVEUxNkk0SkRRcGhVWElQ?=
 =?utf-8?B?bmZGMU10aFA5NFhSRmFEVkdMeElUeDJrSTRQWnNyUTllTmY4eEdack0xb001?=
 =?utf-8?B?cUoweXdVKzZMcHhpYVdlL3Jxbm1MUzI1ekJ1MFpiaDVTR0pnWGFxM01xZ2pn?=
 =?utf-8?B?YkRnYlRjVkt4NnhHcHdpbXQzYnk0WlhxVVR5MmNFN3QxaUtRYmZacURiKzM2?=
 =?utf-8?B?bTQrOHdMcWJPSzF2OXo0Q0lXT09zR3F5SitlVVFxcFJRTnhicURaSE9CTTc0?=
 =?utf-8?B?RFE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c2f3132-a476-4936-60e2-08dc7f1b9cae
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6589.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 13:39:35.1765
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Oa0MJZR17eBwEHpJXuX1/ivsDa3208URo1jWO9bTEj/2NBh5i01B2ugCDZG6Kt/PEMEzI++ohTIlkB0ymxHnVs29IUTxgcu7FiymT3rQiQk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7038

Hi Konstantin,

On 5/24/24 10:25 PM, Konstantin Ryabitsev wrote:
> On Fri, May 24, 2024 at 05:07:53PM GMT, Quentin Schulz wrote:
>>> 3. switch prefix management to always be in the subject line of the cover
>>>      letter, as opposed to being stored in the tracking json
>>>
>>
>> That's an option but then it'd appear in git log.
> 
> Not sure how you mean. Yes, it's in the git log, but since it's just the cover
> commit -- it doesn't really matter?
> 
>> Additionally, I'm not
>> entirely sure everyone wants to blindly have all strings matching '[.*]' in
>> the subject line be applied to all other patches in the series?
> 
> Well, it's stricter than that -- it has to specifically be at the beginning of
> the subject. And wouldn't you always want the same prefixes across the entire
> series?
> 
>> I would go for 1., probably because I thought of it as well and that 3. may
>> add a lot of corner cases and I'm not sure how to handle them?
> 
> There's another option of just using --edit-prefixes the same way we do
> --edit-deps, but it seems a bit overkill to kick off an editor just to edit a
> couple of words. :)
> 
>> BTW, I also had a "surprising" issu when the cover letter title is the same
>> as a patch and I added a git fixup, a git rebase --autosquash would try to
>> fixup the cover letter rather than the commit, which makes sense, but was
>> not expecting a git conflict at that time :) So if we go for 3. maybe that's
>> also a way to add some logic there for that, if that is a "problem" worth
>> fixing.
> 
> So, you mean the cover letter should always have a subject like:
> 
>      [COVER] This is the cover letter subject
> 

Just FYI, I tested this locally with b4 v0.13

[COVER] in the cover letter makes all commits in the patch series have 
COVER as a prefix.

So it seems that some piping is already in place (on purpose or through 
some side effect). Though we may want to not propagate [COVER] prefix to 
all commits in the series when sending with b4 send.

Cheers,
Quentin
