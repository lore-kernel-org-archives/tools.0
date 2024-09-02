Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF9619F112
	for <tools@linux.kernel.org>; Mon,  2 Sep 2024 17:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=10.30.226.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725297551; cv=fail; b=SK6dCkdX7EWp+6qSeMJ1HAqXEt5BdIyRqNL1HMTsOHyQDLuAo8DL1C/bnUvHuJOQZhLt2/HIFyaqjEITV69I/+OeLHJA+LhIysJA2TMhhh5ifCZZenV5DwIrwRbMl3UZcVymGPXGS2g+aJ3P0yXWdVMwL/CorLMFP4m/vE03/8o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725297551; c=relaxed/simple;
	bh=3/a8I+scy/oQXl+5LqLuDdkPwwQrDuhTgj85Q/pwyRY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=k0yw9RmTOjBFZTlejpamXz5b8cWRp96TvEbja2vjtYA44OCSjLi467cYOprt+tSvVZieLLxgnyzoY6oEdGA9F3WP9EgdP4sQzImqc3AakvDtZvSSD+Q9G9/gMb9VrpNmoM5FZxceEjxI2KblY0bVGOSI0BQybXNJRXNmBAfamcI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=cq8DuwOb; arc=fail smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="cq8DuwOb"
Received: by smtp.kernel.org (Postfix)
	id E48F0C4CEC7; Mon,  2 Sep 2024 17:19:09 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011006.outbound.protection.outlook.com [52.101.70.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CCBD5C4CEC2;
	Mon,  2 Sep 2024 17:19:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CCBD5C4CEC2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=cherry.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uGoZjctkD33GKN4zXHIZ/u7gfG+0RMijmwieZqsT/2l7h2ki4E+jApxbktjKE1dMF8CTffTzWW8XfQ86WAV2XSwQYh5jzdZ2kM5MNaI64jrOo1BGs0mMvYR09Y9LUZVXFU944m7j1hjCAL+97sYlfAn52iW3Ys8TGhLTrMAuoVmD/iF90i4LjFIF4woHKUswk8qCmdHLpXEKYgVMU5kijFIQC4OAMgDjxLUFkK1/PJoH+vxWhx8mAAwzEJQKIBIS0P3Q5OMP+rjI41gc7eKhK248NQRepRgTWeykG7WqUZwYktCkMPnHFPODDv9KOae8hrTRmXTaTF/sA1Y1Kus4yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Upz6NIjmwIaItrHdCp/evcMN4h9R+ZqGfZFRJrXhDDE=;
 b=GsqQC9eDzPP4W/WVrcTohSJFNWAIpV7wDICKf2VTWcRbAHQ4EVb579nYcAhTvU6lwc7zJ8dHt41tVJwi4JhqJ0/KvT8IyswxwbUvhHXS6MRjuJpoCbcnEpM8u6uvnVVHqdRfmHVof+eNvPniO3vP8JaMddcfz0OmAUWCZNtu6fy6yc8Z7E5O3lT0jXxfYXPINB8gSkvattHc/7LYpmNrAglFZ3XYQemHoaphzgafuEdmGDiTl6HT6nvbCqkgCCP26FcWzaC/yYfrgSeM76a7NjZAV47Qo/egNZfdXgEUtvjyrIdNg3m4jqxD+XI2rsoNZMXapgnRSH1d6oedDd8T3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Upz6NIjmwIaItrHdCp/evcMN4h9R+ZqGfZFRJrXhDDE=;
 b=cq8DuwObiuNG5CaDU/5jcqgXyKp1DyXRMy+Z57da7ZdX1XkorlUr4sE3R82FElJqFvZcTwlUhl69ywWLyPnf7fOahel6OLO2JL5QKXkHRBJSRF5KPSMElWwUGzQVfy5eDRUwYf76DTorxEGEhnUbMb+MtU/E6Y9E5Zu1q1VfGOs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AS8PR04MB7782.eurprd04.prod.outlook.com (2603:10a6:20b:28a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Mon, 2 Sep
 2024 17:19:04 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%5]) with mapi id 15.20.7918.024; Mon, 2 Sep 2024
 17:19:04 +0000
Message-ID: <a5155c96-19b8-42a9-ab43-5430288aaf4d@cherry.de>
Date: Mon, 2 Sep 2024 19:19:02 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [b4] add notes to patch for commit with git-notes?
To: Matthieu Baerts <matttbe@kernel.org>, "Kernel.org Tools"
 <tools@kernel.org>
Cc: Farouk Bouabid <farouk.bouabid@cherry.de>
References: <4bc5dee0-ed3a-442c-a9ee-d48050627576@cherry.de>
 <c3ee39c3-afae-4918-a82d-148cf62c93af@kernel.org>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <c3ee39c3-afae-4918-a82d-148cf62c93af@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: VI1PR07CA0147.eurprd07.prod.outlook.com
 (2603:10a6:802:16::34) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AS8PR04MB7782:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e24b20f-11c8-4c0f-42ec-08dccb735855
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?akt2SjNSYi9KeHFuQ0x0MWd4ZWNnbXR1NG1kenptWVgyVDFuYXA5Q0x0UEhT?=
 =?utf-8?B?NHpVWmxnTlJjK2gzSmM4Ylh5Rm5wQWNESUNCb1JVT1hGcENCakhzNDFuNUlo?=
 =?utf-8?B?Vm15M21PWWl2aGkrc0h6ankySlFEZWRhK3ZqNk1HaGY2cVI2ell0QnBEY1A3?=
 =?utf-8?B?ajlMMXRNcS9tNHdIRnN4VUpMM0g2cm5jeis2Z0p4anhBdzdHSGVsNjk2OTRa?=
 =?utf-8?B?NTV6K1lGaTdIa0cyeTVQUUxXQjA1K1VSb0NkYUJ1THhJVlZINnQ4U0pnKzlF?=
 =?utf-8?B?QnF4NmN4R214c3k1aHphRWxKZWVNRThvVUs4eUpjUWExTzdCVXpuSmxDZVI0?=
 =?utf-8?B?Z21BZHBlckVOeFVXZ2pMT3kvbm9xdml0c2ppUlc1MDFsTUlQdk1Pd3hBKysz?=
 =?utf-8?B?SFVCMEoyTXhOSW9ZYUd6Ri83cDZGbWVabWRGeFQwbDhtVUQreXBpdTlGQ3FX?=
 =?utf-8?B?VTltUXAycC9SYWVkdi9mSUFac3ozU2J0RTYydTNGM3JWNmVDUTNNZlhQOFpM?=
 =?utf-8?B?WFd6SUxWUEtwVWJKUHJrT2lOeFBEZm5pN3I0Tk1EOEl0WEQ2bm5YZzVmeDJ6?=
 =?utf-8?B?cUwxU0NKZUhuOVBUTWQ1ejllTG9EUFF6UkZhQVZKUG5EdmlMUDdSM2lUcUhy?=
 =?utf-8?B?SjFlRTA0RnJJS3hNUjlVOEJxdW83WEdEQmJQOThYaHh5dVJiZWdRNWxJZ1hl?=
 =?utf-8?B?a3JVRDQ2N0hieDdWaXI1NjFJSjhwaFB4dE9sMHZJVG5HZnN2cU51Y1N1UHhz?=
 =?utf-8?B?RjM0RElLYnFEemYwMWZRcXViOStOY3VpR0xIOVB6TW5MdWZBVGJldVk3VFNi?=
 =?utf-8?B?MXBvd2l4RWxxRkkrekN1aXFBdmJiTHRHRmtrOWM4eTlOdkNscFRvUlhlUFJv?=
 =?utf-8?B?WEZJOEhrTkNuYTMzY281MCt3OWhmZnhQbmdmVm4wMVRobE9ZUUQ4NVZHeFBG?=
 =?utf-8?B?cElhbHpDekVwZnJBa2JlUnJJZjV1ZWRYVHZjUTJjV2F1QThqNDV6MndEMGp4?=
 =?utf-8?B?UlR0OU44eWNZYUsrTmtxYzdUdTUySm92UnBmM0xTMXZuUlRqZkpkRFk5LzZO?=
 =?utf-8?B?bGpIZWlTV3FkWHpucmpRK2ZvSmtBdGRJcWM5SzlmU3FZVFA4Q3hSZXpBcm9T?=
 =?utf-8?B?Uys1Wk5USVJnRjVVNlB2K0xlMjRnZkwxMG90K2gvTEIrWEh6RnVVSDEvcWs1?=
 =?utf-8?B?RW91ZVM4NEQycVVwRU5Oc3NsSHcrWEl4QS9XbUJnMktFVGhxc0NyMUJPVXJ3?=
 =?utf-8?B?Zmh4T0kxM3IwVm1iRHZXWEpPV3NPT2tFZHd5MTBtYTIxL0dja3QybmxmNlYr?=
 =?utf-8?B?MzhpaXNhNjE2Vm4wdzgxMERiYVB0N0V2TWZ1akdPRTFOUW0zNHBEY3VmT0Rt?=
 =?utf-8?B?R2xqNktYWkN0YW9kTnRGOXBHeFl6ZjMxVzJOcjIveEpmSlJFYnJIQ2UrY0FH?=
 =?utf-8?B?am85eTVZcEpUU2JMa2NxOXlSYmFaRHNYaGxFL2xqQlhyUU5JYlI3TnhZaFFU?=
 =?utf-8?B?L2VJbVA0RWJBSFFOS1RDanBxaG14ZzNyMmZ2MHBkSVB5c0Y0WDRjUGlydFRX?=
 =?utf-8?B?TGQwRGhHVFNaVjZaN25yVy9HNmRUdjM0REVsblBMMGpUajZEdktzNnFrNFFC?=
 =?utf-8?B?SFhyMVNLaVN3UnhxT3BrZ1NPaFp0M3U5ejllMjhGSGFuZmxPTGttWENKUStn?=
 =?utf-8?B?eHZPbWtOWGRYR1hKdGw1dVY2YnBLRXhFckszRmdGRlZZdmJJZlNmMWw4eW9r?=
 =?utf-8?B?Y0ZIc3FJOG41Qmg0SHhtQWRxbjNxMXN6QWRQdDVWb3l2QjdDcGROakU1UWZQ?=
 =?utf-8?Q?SsrisAxyC+qnE0luSmjyM4MWFo+1vVCTYBG/w=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M044VDhuV3lmVXl2UmtEeGgwbzBYbGVrR2NhV3dtTFNsUVptMGV6bFdLNW5Q?=
 =?utf-8?B?UHQ0Q3Q0VVZqNDB2b3M0bGdVQVc5bXFKRDY0T3lZUmw1MFdjSEtxVEc3Mktu?=
 =?utf-8?B?SCtOMVUwTGEwYU43b3FaRko5Uzk3MkJmRXRLMlgxSStZUjZTaHhuSHNVTTR4?=
 =?utf-8?B?QWo4L2xIN21iOHVxWjg3SGhmTmlSUVgyUmFrY09iSHZBMktoRk41ODV6K1A0?=
 =?utf-8?B?UUtsaVgxODhFdWQ3Z0NvMnJVZzdQOWQ1M1FhQVBORzFIaWtlOHUwRzJTVTVW?=
 =?utf-8?B?YlNYU3ZoVklhV3B5cFdBbGRsRnVNZWtUYzN1SjBCTDlJMWUrZTFWZnZ6NWV5?=
 =?utf-8?B?TmZCU2ZpZXVWa3RWd3gzWXhPcUZmd1E1NnhXaUpvVFBpREZkaWR1a1ptRzlh?=
 =?utf-8?B?dkRMZ3dEUG1JSjJYSWI5TEE2MXgyZGh2d1ZobnNEZkt3MUFXbHhVWGpOZzQ2?=
 =?utf-8?B?azY0U0E1TlY0T0JqVnJQQ2NXaHBQK040b0NnVk1CQlJISHpyNU9JKzIwWFZo?=
 =?utf-8?B?elJzZkJtZzdTTTBCRlUwUCtDZmhBVDVhZnJXN3lrSXVRbUJVRGpDQmdZNmt4?=
 =?utf-8?B?ckIzTmJmdmFOZ0NEUUwzbWd3STJLMVhEZi82eVBqUDQySlhaRXZvc05wSjMw?=
 =?utf-8?B?cmdrc2FydWZSRy9NdVlxU2U0eENGZ05OVm5oaVdHQklWWTRKakVuREhnLzFK?=
 =?utf-8?B?YnNqUkxiUnhwREZTOC8rTkpsMTZ6NXBSeVVlZEpUbU5JbDJwYWhyTDAvTWJU?=
 =?utf-8?B?ZUdBeGs0Wmh4M3greWl1SFliU2Q0MVNCVDQ3UythUnFHNnRuazl1Tnd2MG5z?=
 =?utf-8?B?eEdLN0xpeGN3SStJMTB2dnlHNFNDMnpENCtzUVdrd0NpakF0SEVoUkNIb2R5?=
 =?utf-8?B?N3FPNXFKUnJQUjRaYk0va3ZXYTRoQ3EyRmcxVEhlZHc3MTBrVlEyQ3NsTG11?=
 =?utf-8?B?ZFoxdlFVM0kyVzcwVHRZSTRISHhyNFZjejFVb3FBbG9CVURuWUtnZ3FLMHJy?=
 =?utf-8?B?Q01lQ0hrM3pNTUlGS2RCSnRSR1lEVEsrMjJFR2lTWHlQa2dPa3JHTVo1K05D?=
 =?utf-8?B?MjFzNTJ1QnU2S2FhSWU3bTk5c1BjVjVWbnByR3g1WW9DMWg5akJndE5Fd1F4?=
 =?utf-8?B?YWVOcE1ycXhNbXB0Mk0wRGpicVBIWWthSGdyZ2tyUXVkZXFzc2o0TE9nMXUr?=
 =?utf-8?B?TmF6MEhiUEY4dktnZ0hxRHFQbDhZNGxocmx0UlJ4ckhiTjJvS2tQeVo4YktO?=
 =?utf-8?B?V0U4V3JTM3EvYUhPeG9wN2RaVzZ2Y2FJQUh0TkRFN2dGY3ZSaHFLR0dSQitR?=
 =?utf-8?B?RTNMUTRzdkxMMHlPREduMTFyUUNsbkRIU2NZSHFTUlJRaFBXa2MrQS9mWXJl?=
 =?utf-8?B?SkJqSTF0alAyVU83TWJNTlBpa2VwSkk2Vnl5SlR0UGdSMFZJL1ZzbEdwU240?=
 =?utf-8?B?QUcyb3VtL3JodW50SzN1QWQrTExMTUpHVEhPMGdXWnhUNWlNYmtnSVVmZ0dR?=
 =?utf-8?B?Skx1MmRiT3BIOW01dnNNcWRyM2xJeVNDZ1JLWm5GRFoyQjd0RE51NGdkTGJO?=
 =?utf-8?B?aTFjOUtXWVdEVFB6ZU9qdzVUMDJiWGRxY2xpQVE2QzlpeHZ1VkxNekZLeTA1?=
 =?utf-8?B?R0hzWnU5UEdwSzZqR3AvM1I0a1p6cGJRT0N0YUZJWmlPcUh4TkRzUE52K1Zi?=
 =?utf-8?B?UXBjMWMzSjNvaXkwNnBSTmkwMkk5NnNoNlFtVDdERmxCaHlqOHdsYldRd1RH?=
 =?utf-8?B?VjJoSm5FTjdYbk9wSEQvcXZ1NXZVOTJQdFBNeERpcndKbkh3K2x4UGVKcGRw?=
 =?utf-8?B?OWJKaUpXbGdHTW1JQ3VHQnZSUTJXdmMxUkhrRzhXR2VKZnBiUHNTTllBdHRP?=
 =?utf-8?B?MUZEM25KNnZhVlRVbzdFYWt6dUw3ZkgzSnZUMmtlM3JLNHk1QWxQdnBVM2Nh?=
 =?utf-8?B?a0ticXg4T1FGTUZ5b2U2Y1pIdGlvMDk4bktmaytUdXZKVzdoakZZbEUzUTZx?=
 =?utf-8?B?RjhjVjdWTStyRnBVRGxQTEJwRy93ZGNhbk52TytlQlBJbnpnWm9YaUZZOXJh?=
 =?utf-8?B?bUY5MWFtZFUxOE1iZUs3S0NQcWVsWElFS3ZzUkNjVWdTU1lpLy93bDdIUWdi?=
 =?utf-8?B?ZkgxQmI4VVVhSDkxQUZnYzJkbjB2YnNtbytHVFRSZXA5blZqRGJMVDhjeGVP?=
 =?utf-8?B?RHc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e24b20f-11c8-4c0f-42ec-08dccb735855
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2024 17:19:04.4415
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ObraWr7F6veWVtYms8Rx1hrlPnJymOgkceV+OxdF5xpT8MNu13YKMcFxbVwdTxoLMCeaytME67497td8J2nrzIcUIraCs2Za5W8ghAIC47c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7782

Hi Matthieu,

On 9/2/24 7:10 PM, Matthieu Baerts wrote:
> [Some people who received this message don't often get email from matttbe@kernel.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> Hi Quentin,
> 
> On 02/09/2024 18:51, Quentin Schulz wrote:
>> I think it should be possible to use git-notes for the latter?
> 
> Please note :) that these notes can be easily dropped by b4 itself when
> editing commits because it uses 'git filter-repo' to do so [1]. In other
> words, these notes will be dropped when using 'b4 trailers', or when
> using some 'b4 prep' commands when the cover-letter is stored in a
> dedicated commit.
>  >> The diff we had for b4 to make this work is the following:
> 
> The diff you attached has already proposed before in [2], but not
> applied because the notes can be dropped.
> 
>> Let me know if git-notes would be fine and the direction to go for
>> patches. Thanks!
> 
> Unfortunately, I don't think that's the right direction. The alternative
> is to add the notes in the commit message, at the end, under '---' [3].
> Maybe the direction to take is to document this alternative :)
> 
> [1]
> https://lore.kernel.org/tools/20220929074717.u2xfvfwq4ki732tw@wittgenstein/T/
> [2]
> https://lore.kernel.org/tools/20240131223054.371692-1-Frank.Li@nxp.com/T/
> [3]
> https://lore.kernel.org/tools/jx7vyqdj3qt2zwgsxh6hjac6osr52n2vcmkj2pg3elapcth62m@jtl27si2pa3g/
> 

Darn it, I didn't look far enough in lore :( Thanks for doing the 
research work I should have done myself!

I didn't know git would keep the --- part in the commit logs, should 
have tried the obvious (though I've been bit by #-starting lines 
disappearing so I assumed similar behavior :) ).

Thanks for the info and links!

Cheers,
Quentin
