Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-eopbgr140074.outbound.protection.outlook.com [40.107.14.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36BC7E
	for <tools@linux.kernel.org>; Thu, 20 Oct 2022 09:03:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mw31EmN/tqLHHIYr/m1VEuMM/AFT7fYrJWaREuh+QONYsSulFB1BO+78XDqD9Z7b/Z4YrMIvPM6RqMUdlhlD42Jg5tdiJOUFxe2tshRwekDxqZ1NLvmGxJoxyKWYn4OWAILOSZS4Zi5UTTMqpYUKprJiOZBEYT0Qs2K5cx72KXMT9JlMFuKkhIvHknQTvCdiKHhVyFv0+PvHab+Op1GZWVtzwhJBKRkQrczpTXcPM4/x7lBYDXPKzPLfzMDj06y9Gnsw3zuknmpYaUQeKtMYugWSZQ7fLE3YqulEdSf723AlvlWOoIpBeNrTBOB9KgCgsd7nr4+q6yhL1ATGmn7wjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k/G+/LpOGL3a/FzFe6xzn0mvxR9TFMWJ9g3iEgfEmYM=;
 b=dtMgnBe+V03sn+s4O7V2hRAHkdVznIfkYggIu6J3eJto8JlQcWLL4d1V9InkXKuE6+pccHfOivlRIew3IEi9XBX3QoWu7IFDW9MZTg2do1Qb/DiU9Ag6hVggaStmRVefX0jO1S5o5FTYKUzpiK03fkhJ80KXwr945sWNPaM2CEKAyZkiq3sS/85LizmwyeTqDN4zBXFara3yGLQX30+3dyekFu924o5izpUHPSv1Nm0Xj2/mzSmoyMmiCkVgnRObrPQMKQWYoYTx/j+keQplHz8bU3xEjxzBJTh5uvEk7oAFiIpZ8x2vR2tzUHzRSeRDaJcBLa5SORGn5kJU5xEBUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k/G+/LpOGL3a/FzFe6xzn0mvxR9TFMWJ9g3iEgfEmYM=;
 b=bDyJ9IcVuQukVQJa7eNPKLPdQm3JDwPYYRH75ghB13bhZlNQsW7ysaen/mwFr+7Mz2ePj7DwtfJNj1vDA1gOslS7+oHpZ6lY3WrUv4sU5y/Vrbzvll1B1kHhFmh54bRVwz3vcgClcUba4rirsCqDVPaUoegJgI8SUhK1MLUbUx1SM3HmuNDL9HHv1VM2EMSjme8qP4oDVMgjh1Uq1e76FhK2TfChM9C+me8Z/WVO4k5lP0R6MAan/jBzuhTht8sb+r8ioLBGwaD7MB4ZASOEHX5Z8DrD0SzibnK6gJT/Vjw25vh5IneNy6MTeRJjcWfyUcylwf1YEp/Hq30j7hoXvA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by PAXPR04MB9421.eurprd04.prod.outlook.com (2603:10a6:102:2b5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34; Thu, 20 Oct
 2022 09:03:15 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5e5e:1989:e5ec:c833]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5e5e:1989:e5ec:c833%3]) with mapi id 15.20.5723.034; Thu, 20 Oct 2022
 09:03:15 +0000
Message-ID: <e45c9949-c3d1-302f-5694-b60da7b9579c@theobroma-systems.com>
Date: Thu, 20 Oct 2022 11:03:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: b4 send --output-dir eml's sent with git send-email creates two
 From: in the mail body
Content-Language: en-US
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
References: <9bdb42f7-661a-77ed-97e5-33ba7a31fd9e@theobroma-systems.com>
 <20221019193208.euw2lv2d2anpzvdf@meerkat.local>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20221019193208.euw2lv2d2anpzvdf@meerkat.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0147.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::11) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|PAXPR04MB9421:EE_
X-MS-Office365-Filtering-Correlation-Id: b864b19e-976f-4d78-7aa6-08dab279ec3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wqcDuDLWby1IR8/fQmt2NdEr0cruqg9swCjbh+/5cATgooLFFrBPtW+tgqzsew0L3NCcRv6i9FNIMX8fywfuFQ/Tzff30wO/HGhyFMtsOPxUWvHJwW4GCuxBJJvMPOReDeKUyYtkofAhTu2R3ZvghTZM6erPyaAjm8+OF4w8nw9oQ66I5XcasDxx+co4UCH2HBxg6TneQO4k75PDiVGRf920imzAroYhDXFZ9Ng8DOUSS6Q9upFHxpWQtTkXiF2qGQtxlIXJKIAU7ltRrQpMR4auJ9/LXqi4h9S4DLOo2IK1cUpGVz6n4GUUKP7rF4VHtdnofaHFvLeydqME8wYwKQfCB6kPaialbbX0C1Z4XBMO8V5Soix5zelIRcHftRvZMm5Mu05ysbmvUMzlpDinpx2FWsbGuQZPLRJ8X05Pkl5tD3hInM5MD+a8jjsgCfI676qX36UzBT5JbTChiqQ18NkNemCXFaBnOWAlH9S7mEGDpIqeWsHeSt9CHLBMDFOMrB7lwNlHRHYcaJZMkZTpxPENlfcFBuche7HvWYFQKhX9pN00++Qpu94raVf/NaONKPQfUSMRY5E/88d1O52tKMWbPgJxOE2Ur/7caOi4AI8/N2e0VZgoXUTuFBrvq1wT+cvmS5Zx00dpkpMnqhZIDNyQWVbIXdPCykErAAUqgjIAFcsxMOrnfHPa/0FcM/DFRVU1TmMGBR0G8ii9pj1bJ6c0vTgINs+Zc16112HXPopTirURgviHCP919Ay2MCMtPBBwTIHfM/aXwi+/KZKTV6t//IsYFXpkDZ6Y01TdEXTj5j3kxUHS2J7tEMn7j4LnKhz52rwhg5CNZB678x/lEw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(136003)(396003)(346002)(366004)(39850400004)(451199015)(478600001)(66946007)(8676002)(31686004)(31696002)(83380400001)(86362001)(6486002)(966005)(66556008)(6916009)(36756003)(53546011)(316002)(6512007)(6506007)(41300700001)(26005)(8936002)(4326008)(44832011)(186003)(2616005)(2906002)(66476007)(5660300002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZXp6SE9NSUVneHBQS2xkWmtSenpyNXVzZkVmUkFkRFBLMk4xNlNRQWYvL2Zh?=
 =?utf-8?B?MHkweUtOUVlDUDA2QjEvVmpNcWJuSjhHM3pnVUtqVU9NZVFyQnZHQlNJM25k?=
 =?utf-8?B?MmtCN0xweEo0VWpuL2MvTzg5Vnp2Mld0OUZJWnhPUkJmUFo5Y25xMFJGL1Zw?=
 =?utf-8?B?VXgveEFOL1RteDZkT0U1cWwrWnZxOC9QVUIxcFpXcGhCNVpuTk52VUtDV0kv?=
 =?utf-8?B?aTAyOEFaVDJ5UjY5UE9PdWNKWTlybWdOVXdodlM5Mno5VjZQR2x6VnE2ZW5L?=
 =?utf-8?B?b1B1WHR5dDlMbXk1MkRKbGlJQWFPWkZqTG1ac2JVNEdaSllnLzhrK09QWHhD?=
 =?utf-8?B?SkNTaVpjSkNCSk9yYk5qVWVBcVA5emt1OVFLT1pKcm9HTU9WWm92UXBpNG1E?=
 =?utf-8?B?NUdzbDJHVFNXNDlDaWhzMG5FNEVubnhPanBZSW5kM0FXVTdSWFN6NTlGa01F?=
 =?utf-8?B?cGtad2VqZUt0VUJET2VPOXQ5TnVjdHhjZjhJODlYcVR3ZEdQREt1UzAvSmxP?=
 =?utf-8?B?RXBNS0dqWGZFbGhkWS92a056SEIrR2U0WHNlWHNDUEdKM09oUEtOVlk2UDhV?=
 =?utf-8?B?b1dQUjNRZVoveXZrZTkzWUhBK2x2VkIrUXhjK3k4Nm94bUlveVhHcFhXMU53?=
 =?utf-8?B?cW1YTkYxVGY0WjR0VVYvUXJkcGhJeEtMWUljQUJPVU05Nk92ak5oa0ttbG5v?=
 =?utf-8?B?K2wzQXBuTDBPODNNQjlrdy8zanF4OVAzdm5mSUlTMTFWbk5BdTZaKzBTaXB6?=
 =?utf-8?B?TmxWYXRQZ2dYVXhNM3RwWlJJK1M2emdwaXRYOTcwemdyTHZSdjAxTGhwZ3lh?=
 =?utf-8?B?TUZtNTBmb2tRMmFzYSs2S0krbXNyMm1PVTlpM2gwUjN4ZS9TMEtRN3AxT2JN?=
 =?utf-8?B?NG8xclI5TU9SZmdsbkV2Tmlla0lwbUczd2xzMVEyZTFXcVVpMnBmbSsvMS8v?=
 =?utf-8?B?L3RPU1JFV0k2WkdQcEF4WnBZbEZyc3ZWR0RkTTlQUTBvVVQ0dkVwcUlMN0Nm?=
 =?utf-8?B?UlpRVW5ocGxqU3poaVZtTDVWVU1FRTU5QXRYNG9LV3dRcCthK0dQRDdWTFlJ?=
 =?utf-8?B?V0dqbjZIZkhJUlpNQ2ExWmxDTGdtZ1dzMWF5cTM5dkNNMjNKdXB5b3A2NE1K?=
 =?utf-8?B?d3pTZDltUnlTVXVSdTNRbGJiNGVZeTZUNVlJWGxjVldmdE0wM2toVjdEKzRh?=
 =?utf-8?B?blROVTJyS2lrVlFiNDhzOEFMTHgrS2ZCb2NwYmkvVzVZNU5qMkh0bE9UbzNi?=
 =?utf-8?B?YjYwUDBXUTRScHRnVE9mQmphcFpBMmlNYXMzUVNVWVZ6TmtnNFZnaXVpNzVX?=
 =?utf-8?B?RXRacnNVN3dRdXYyVjZhYks4eWl5dVBFdVhSeGR4bEdzSTlhV0YyVmtjNm9z?=
 =?utf-8?B?SjNNRWliNG9kQ1N6WnJuZ3d5T05NZ0E4WkZ2QzR1K0p1b2s2NG9LcG5XdWRZ?=
 =?utf-8?B?OWRkNC9EempFdVVDR2NwV2pvQ2NIc3IzM0NSSmloL0VQdVc5c3hHQTMweEFQ?=
 =?utf-8?B?Znh3MHBFQnUya3NSTS84b2sxRzg1Zk54eG1va2htTDNyZElQb3Vlc1pKVi83?=
 =?utf-8?B?N0dFd0J1cEVra09SbmFWV3kwbk1KbDc4dlRzcGtWOXg0cDVpd2hsd2g1T1Ix?=
 =?utf-8?B?YksyOFhtOHZpeEZOL2thUVVCYmI5Y0xhZEpqN0Nxc1Z1cWh5SnlBc0dXRUZG?=
 =?utf-8?B?QnZERUF1V3k4NmhUS2lRalZ6Vnp5QW1QUUNJcnl0VWZOUkJGak5JaFZnVjQx?=
 =?utf-8?B?U3M0ZTN1aHRIOWxYMjlCcGhNZHRZMzE1NktvbHJKUVBqQkhSRVN4RkRBMm02?=
 =?utf-8?B?emR3NnJ6ckZES1oxQzZOOGVLSUdFbDZjOGtVdCtRT2lNYmFEWUFSM0ErR01s?=
 =?utf-8?B?K2llNFUvZzRNUWk5NlU3TlE5b1MwWmRMMndjbHMwOGpYOG8vY0Z5b2RrRGdu?=
 =?utf-8?B?WXVPalpoVE9aNTQwQndUb2JIYUloWWtJZHJ5T0N2MktEa1QzOENSYm8wSkEx?=
 =?utf-8?B?cXFBOXVNWEc1aWZvbkY4SnRSZE9mQjNSU0FRajNDNzRJaFZOdDRBZDFVZGdR?=
 =?utf-8?B?azhzN3cvWWhPay81RjlGUjMxbW1naFFvQ2pwcXBFdzlsWGdWWjYrY3lWOTdi?=
 =?utf-8?B?R0RhVllKSjFXUkNLZmNKc0crMC9DSHRVM01VN3FLeTh2aXQwNlg0enhpTVQ4?=
 =?utf-8?Q?OkLXUd6Bx8hWPsUPmJP3E7s=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b864b19e-976f-4d78-7aa6-08dab279ec3d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2022 09:03:15.1522
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CBCpaQk7gqw8Z1at3C/S/EQJKhiNhjQCHMpK+dxCND8d9aJvTnumwwUa08qMtpBW3k43YHJ/KmejuNPmq0uoJ3FlrHV3yfbc5x7mgyvQiUaklRCplUqF86q+yp3LxiFD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9421

Hi Konstantin,

On 10/19/22 21:32, Konstantin Ryabitsev wrote:
> On Wed, Oct 19, 2022 at 06:23:09PM +0200, Quentin Schulz wrote:
>> Hi,
>>
>> I recently encountered some issue with my particular setup.
>>
>> https://urldefense.proofpoint.com/v2/url?u=https-3A__lore.kernel.org_lkml_20221019-2Dupstream-2Dpuma-2Dsd-2D40mhz-2Dv1-2D0-2D754a76421518-40theobroma-2Dsystems.com_raw&d=DwIBaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=3N_s7FaOdYHdJMby-XVFQf58qtINncJFtBc_oRqX8C4u5PcoifqemzDuWAyza5ef&s=9tuNrkRYhAXplODVZKdP3zXXV8R8IDPhP5XNItUrsrM&e=
>> is the problematic mail, note the two From: lines in the mail body.
>>
>> This particular patch has a git author (Jakob) different from my local git
>> identity (Quentin Schulz <quentin.schulz at theobroma-systems.com>) which is
>> different from the sendemail.from configuration (Quentin Schulz <foss+kernel
>> at 0leil.net>).
> 
> I'm going to point fingers at git-send-email here, because it shouldn't stick
> another From: into the body when it already sees a From: there. You should
> report this to git maintainers as a bug.
> 

https://lore.kernel.org/git/09e125ea-5ea5-40c8-575e-57cb7e1806ff@theobroma-systems.com/ 
is the bug report to git community if anyone wants to follow the 
discussion there.

> That said...
> 
>> The eml file created by b4 send --output-dir has the From: field using the
>> current git identity which I assume is the issue.
> 
> Right, we're not doing quite the right thing here either, because when there's
> a sendemail.from set up, we should be using that instead of the user.name +
> user.email. I'll see how we can fix this up to do the right thing.
> 

Lemme know if there's anything I can help with or test.

> Thank you for the report.
> 

Thanks for the tool, it's been something I've been wanting to have for a 
while already (not a maintainer, but the shazam+prep combo is awesome 
and I'm very much looking forward to the --compare-to feature that was 
recently added).

Cheers,
Quentin
