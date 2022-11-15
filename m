Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2086.outbound.protection.outlook.com [40.107.20.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7269D24F29
	for <tools@linux.kernel.org>; Tue, 15 Nov 2022 17:31:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MR1R6g8//Yf0arZPquz969C1fzORhc+yPU9qFXbMo+KclMmmuFhgKbY4Ot/JUI4n5I1hFYLAkWmkEWpQVQ0JTB3fW8gclfprdHHGbDaxFpPrgP1FTT45GO4AnZodV4AtTkhc2UNGZD9A4EpI4UBsmrpcOK90iVLkb/j+PNjFNxEoCsAuqlwhA0ySYFiJAfRwYcw3NY2yJO9sAdQ/bspFKOhOnAtSldOOL3U00gu0ipiG6OT7HlPvhKRmiuQjlYdnAeXjA/qEnZHEcXNsLB6ind6bnDZeLe11pi0DfOkoJNU6u7YYvAewTN+jtL3MtwAOajz4Gg125WQT6ZfMFF6mxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UViQ/h1Tf/QBConetmQA6uivPmWUvmNd5SJARXnF+y4=;
 b=HNoakuYb2+FeopK3qpVr33ZFTXihRk0FXL/eeYNW2KpubIGQ0D0XXkziQOf2AcwJHyP+dwmCTY4Kqa0EXDcxY+GyHAyrq9zMYujdUoiNAhkT7YhwaSg8YB3++lp+fVOf+3P/MOLXCHSKyFIgSBFMIrlgvh0mpHbWVQDqxaEXXLocqHHfcs0ViLOYKAWsH1z4WgzWrEd4rX5rPFu8UXUjPzSSPmBTUtDD7mAnD2vJAAHxVM4Nzp/txSjHQmGxX0XZXu2M5MHQMIRbAogAmzqiJibUrqvFAoU6TbKfZx5qw1tkJuqA1z3Rsl+Kj/6/UFP/kUIzvMHCP0Wpf3nQV7yxBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UViQ/h1Tf/QBConetmQA6uivPmWUvmNd5SJARXnF+y4=;
 b=R86gRrJpr+4ZZv8EOGGKAe6Da62guavMaOnDQgL1ZIxPuy+K8UuTQGPC7hUCATyEbeYSxzenFBXwPH3UHMGhhnrD1Wyucy0wzadLfHNx5bdt0Ma6jDkDjqI+akTpJ+Ke0C5O/mqZQ8S8duQb5u5JTIQXrdIjVQ2wmaM11f2l8HMmxplr2fecfRLM9Txiq/Ybi0Z4SLZD/e1UsnUWJVfKEdcj664m/rCVK+bBBrmwhM9F1SmHHAVOpkBOMF9/vRpUogfTVV6cYObn//h1dgnX1Y+UdE5xz0L83Q0bSA68fBXJmkJ7DcPApDzpqxYjjZWUQsfScNQrL3WDKi8PgiwWBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by AS1PR04MB9237.eurprd04.prod.outlook.com (2603:10a6:20b:4d1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Tue, 15 Nov
 2022 17:31:06 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::9584:94ee:73c6:bed4]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::9584:94ee:73c6:bed4%5]) with mapi id 15.20.5813.018; Tue, 15 Nov 2022
 17:31:06 +0000
Message-ID: <0eeb50bf-9a09-6127-ae50-e838a9261042@theobroma-systems.com>
Date: Tue, 15 Nov 2022 18:31:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v2] git_range_to_patches: actually add to/cc headers from
 cover letter to single-commit series
Content-Language: en-US
To: Quentin Schulz <foss+kernel@0leil.net>,
 "Kernel.org Tools" <tools@linux.kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
References: <20221114-prep-format-patch-single-patch-to-cc-v2-0-70a9019eb90c@theobroma-systems.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20221114-prep-format-patch-single-patch-to-cc-v2-0-70a9019eb90c@theobroma-systems.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0161.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::20) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|AS1PR04MB9237:EE_
X-MS-Office365-Filtering-Correlation-Id: f2d40846-bae9-48ca-8728-08dac72f2d30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	csSLxTaLmjWpwRgJZDOFiE8aO1x4h/fXfSNT1jyAhgX4Q0AxsVxZRN5cTEfJJuZ8E01IN5BhGVcABED/25J/DahkYlQmXRgeXfI3DOADXF7id+iqVIXrITOGqL2Ea+VMLZiOWBECXP4AQ8eNbO+65YW21mPz6tpxjL9zKdNv5j9Q2xTA2sD7OeS6BvoxS8WV3LsxZYw9B1t9hZtJWRCxFGb3T51ZSDQR17qDkRg9fq+ijLbaJGCIo19BVLj75mbwL+PojLC1ffaHwZC76fQQ0n0p8s5j2RDmYIgK5Q+8gWghJo3dSjzbrR23gBIlgt+9DNefnz3kOXy9m/R5QeIF3Bg5eLoTnKSefqkEGtWvZ8c+TA0fclTyzdlIAycEYZa5YVrqup/m/TVGyPhJy0CuVQrpnDxu4Est6XyWZnJtDH9942ktkdux1WncF8qVIePO0I4yHL0923qzSj0r73SP0pVCgdtkI95WZUPGAW0sNbA5yLskQ3C1//Qx792wVrxT4L8eiefmH1N2G3kXhNGCIBUIH4LzGeBT2hVV8h4TrMPE1TsZnaZptykOc3iYMobxW+KO5U3Yb7GyEqxkGaqzji7IJl3numrQJ2wXcS1mRxTwmL64hvAnz2M2t3xvh1wivm2hYcQkNA/awNjJ4TuyAu6GY7NhYsZc28877qpKBhumr3PerEc/SAJxHDWZny+XUWG1U/UL7293yB3l6u1ojzue/22ZuLbnD/ABuiIIpUM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39850400004)(366004)(136003)(376002)(346002)(396003)(451199015)(6486002)(966005)(478600001)(31696002)(110136005)(38100700002)(86362001)(31686004)(26005)(53546011)(41300700001)(2906002)(186003)(83380400001)(316002)(6506007)(4326008)(66476007)(6512007)(66556008)(66946007)(5660300002)(8676002)(44832011)(8936002)(2616005)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Mnk3REpZS3JJRUJnb28yWTRRNjFkSllaZ2k2cXJGTEk3cWUvK0FLYXE0WGN2?=
 =?utf-8?B?K3dIWWszZXZCTGdtczgrL1NmRnlsNm0yMktYaE5NUm9xdVl4MDY3RWxzd0Zr?=
 =?utf-8?B?aGlYZFJoRG1JUFh0QU83Q2FsQ01pUlVuRHd6cE1CUlY1cnJOUTVRWWJXM2hh?=
 =?utf-8?B?TThpbjZoVVo3aVF4UWhLUFpsdDQrZzJyMFVINHM1MnlRRU9nWUhIY1I0bG5M?=
 =?utf-8?B?a1dkQ0lkeTI1OWVSM1FwTzlpNVJMR0xyei9aN1pYRE5ibG13Y0RWejJJTnNW?=
 =?utf-8?B?K1dxR0xGQmtMTHB3bXF1Ums2ZzZYcGxHNlQ4TUp6aUdxSjkvOW9UUm0xVFZl?=
 =?utf-8?B?QXdBeWxSVFFqeW5Yd3ZPVjBHZ3NJNzNUdkZCMDdhOFRGOUVEQmFvRFdZZi9m?=
 =?utf-8?B?MTBDcFQ4WWxnOXJocFB0VzZUNHhuTC93eEJER1RQMW5NdlREc2dSbVN4bVgr?=
 =?utf-8?B?YmJVbGE0ZllIa3VkNGRReGtVSHpXY25kU3Z3WnlvK3VqaXdTNmVQSGF1eXpa?=
 =?utf-8?B?TkdxS2h1Qmk3dFFTdmt5VEcwNFVzdlZ6RWsvRS9PUGpSR3VtNjVZVWV6UlVQ?=
 =?utf-8?B?dVZuNm9nT2xxWEUrYWFnWUNLcEhtVXpWbnZQQXhjVUVsaXVTaldqWVoybng3?=
 =?utf-8?B?Y0NtU1liSjVTU1BHeTlmZWVORTZ3L2dRY3MwTTlFMjlsOXVYa2VyaGlGRGNP?=
 =?utf-8?B?TVF2ZUpwQkErd0JOc0poMTBiL1I4QWljdkRoRmxEUEh4bVFQSVcxWm56ejNo?=
 =?utf-8?B?VVFwZVcvcWQxK1FqT0xuSHpXM2dRMEtJT25oZE5oeCt4TjJBRXhYdXFQdmMv?=
 =?utf-8?B?cDhKWGxNKzV4UDIvRFJ2eEJaTnZ5WmxQNGVZUGYyZWhFYU1VUkV0cGZZaUY5?=
 =?utf-8?B?MmFvbVkwQlVCdWNnK24vOGhqTGhyWEhzY2dld1VTQ1A5aVNuV0lPZkJKM3lG?=
 =?utf-8?B?QVlFdkZCc1o0UGR5UXBadDMzdUpVNXpUNkxvM1p5b0hRUWdjMWo4UHVicTdj?=
 =?utf-8?B?RlVZQnpEakI5S2hsQXB1Y0ZrZ214eitzV1U3SGhDbng3cnU1NWdzdWZrMjJJ?=
 =?utf-8?B?ZGZkK21aRjV2QU1BeEtpQXJaY3VKR2E5cHRaOUo0VmxCNU50SzNhWHNhRC9k?=
 =?utf-8?B?MVBKS3F6aUdqR3ViR1Bnc2hhRkU3VXg1K1FzVmVLRlluYjlEdk1EdWdsa3Q5?=
 =?utf-8?B?UDA0YTlYdTRCQ29lSHNva3RGS1pveWVpeHZ1eXVrVGJ4enRSb0syT05NT2RF?=
 =?utf-8?B?MkFycHV6SHFETDZBQXozNE94NXBvajJMRGVDSkRXZUNQaTJoNk5WajBsbWNo?=
 =?utf-8?B?N3FLSGY1aDk3YjNTZFBHWHVqdFdwT2Q2SzdJZUpLRjQ0b3BmVzhsNlJ6SWRj?=
 =?utf-8?B?bkZwSlZvMHRuT0JQS2JjRzk1clp1MG1LSm5vcEw1Ris1WWZaVWUxdloyQW9x?=
 =?utf-8?B?ZktFWTdySDY1eFgrWnoySkFkU0c4bFdiN1ZQSnJBZVNaWlVDZXMweCtzeG54?=
 =?utf-8?B?bnlYZFpQUG53WWtYaWt1TzBXTkhrd2tnYTk2NXA5Mm8yMkdsR05rY0FFZ0Rv?=
 =?utf-8?B?U3MvWU1lRzNuRFQ1NDlSZHNFZ2I1dUtiNnEzSlViTmo1MGpNLysrblk5VCs2?=
 =?utf-8?B?bmFwUHhtcXBvUmJvTWNpMVFxOWthZjNjMUVuNk5ZUXhMWEVVWTQ1eFRIWHhn?=
 =?utf-8?B?SmNIY0JwZFRPMU1UR2w0Qjd1cHlldUxNTm9URXVJS2Q2ckFHRmVSUVl5M21R?=
 =?utf-8?B?OGc3VnNWdEF5RTVET3QwV1VqRzFNMTJiMEZqWEZMeVc0Q0h4L0prRDd4UFVC?=
 =?utf-8?B?V1p2YU5rRi9mNUNiV3BKSzlVa3FHckhoc0ZYeDB0QmI5OW5iT3RZZUpacGpC?=
 =?utf-8?B?S2MyWHIyQ2c2N2NPUFNGelNCQ3B3NjNTVVJGdDZ3N09EMjZhQlg1OVpNZGlK?=
 =?utf-8?B?WE10dmF2R0J3YVpUR0g3UWNIdU1sZk5tWVlKYnh3VGRPNU5zUzZMOUI2aGRx?=
 =?utf-8?B?c1A3UW5CU2tvWkpPdkg1NXFjb0xXYTk1V3VjcVEyUHZSODFGeUduRjU4ZEpW?=
 =?utf-8?B?ZVVnQzQvOGp0YW9PZERkVUZ2N1UxMCtzNitvcFhVTDZRZWpYa1ZOMnFuMG5U?=
 =?utf-8?B?Z0xWa3hOMU1qRzY2UEVLMVByZCtVaGZORmFGbEt6elFoRzZFYTNvN3VPOFVy?=
 =?utf-8?Q?DrfenYdhFvUQuVmykJNwamQ=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2d40846-bae9-48ca-8728-08dac72f2d30
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2022 17:31:06.2985
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6ml5perImEMrlyZ9na4ROFX/2NkJ8pU9oJ0sTjiwcv1ji2G7ScMAAxNJxuxrngZLUyTDjPH0E4uqpzRfQAtwpnHHhAOA32C99LN2qCHf/4N8yAFsA9lceL0N+TdpKQsg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9237

Hi all,

I resent this as v2 with a minimal change because I had messed up my 
local sendemail config which meant it was sent to spam for most people 
(including myself :) ).

I take this opportunity to discuss what we should do in a bigger context.

The issue with this patchset is that it only fixes single-commit series 
(which is already a good start). However, patches generated with b4 prep 
-p patches for bigger series are broken because the Cc: and To: fields 
generated by b4 prep --auto-to-cc do not make it to individual patches, 
only to the cover letter.

I could suggest to *always* add the To: and Cc: fields from the cover 
letter into each individual patch headers but I know some 
contributors/maintainers like to have a patch series with not all 
patches sent to all people impacted by at least one patch. E.g. for a 
new driver only the patch for dt-bindings would be sent to the 
dt-bindings ML, while the other patches would be sent to their 
appropriate subsystems too. I personally don't do this but I'm aware 
this is a possible workflow.

I could see what I can do for the workflow where all Cc: and To: fields 
from the mailing lists are added as headers to each individual patch in 
a series if there's some interest for it?

What do you think?

Cheers,
Quentin

On 11/15/22 18:23, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> 
> The intent of the original code was to copy the Cc and To headers from
> the cover letter, previously added with b4 prep --auto-to-cc. However,
> those are added in the commit log which means a newline is inserted
> between the subject header and the start of the commit log, "breaking"
> the mail parsing because the rest is assumed to be the body of the mail.
> 
> Since the To: and Cc: lines are assumed to be in-body, and therefore not
> parsed by the mail backend, they cannot be fetched with mail.get('To')
> since the header isn't actually set.
> 
> Instead, let's use the Cc and To fields returned by get_body_parts of
> the covermsg into ctrailers list of LoreTrailer and then add the ones
> that are supposed to be To or Cc headers to the single-commit patch
> headers.
> 
> Fixes: 6c215d83473d ("ez: don't send a cover letter for a 1-patch series")
> Fixes: c748abf6ad2a ("ez: don't send a cover letter for a 1-patch series") #v0.10.1
> Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> ---
> git_range_to_patches: actually add to/cc headers from cover letter to single-commit series
> 
> This probably wasn't detected because git-send-email is capable of
> adding the Cc: fields in the "snipped" section of a patch (---) even if not in
> the headers but not the To: fields.
> 
> To: "Kernel.org Tools" <tools@linux.kernel.org>
> Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
> ---
> Changes in v2:
> - fix From: field,
> - remove list cast for ctrailers as unnecessary,
> - Link to v1: https://urldefense.com/v3/__https://msgid.link/20221114-prep-format-patch-single-patch-to-cc-v1-0-e8dddbd07096@theobroma-systems.com__;!!OOPJP91ZZw!jLjSjQiC6nnLDYzEtcDnFpy3MKaEznFDBJ2ZIwawgkZKTJ7V1PyHs5Mkk95FXr0b8qphsxDoo2YyDviCnFmsz5ziKFOyZdgCbseB$
> ---
>   b4/__init__.py | 10 ++++------
>   1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/b4/__init__.py b/b4/__init__.py
> index f5bbc53..590c756 100644
> --- a/b4/__init__.py
> +++ b/b4/__init__.py
> @@ -2779,13 +2779,11 @@ def git_range_to_patches(gitdir: Optional[str], start: str, end: str,
>   
>               pbody = LoreMessage.rebuild_message(pheaders, pmessage, ptrailers, newbasement, csignature)
>               pmsg.set_payload(pbody, charset='utf-8')
> +
>               # Add any To: and Cc: headers from the cover_message
> -            toh = covermsg.get('To')
> -            if toh:
> -                pmsg.add_header('To', toh)
> -            cch = covermsg.get('Cc')
> -            if cch:
> -                pmsg.add_header('Cc', cch)
> +            for ctrailer in ctrailers:
> +                if ctrailer.name in ('To', 'Cc'):
> +                    pmsg.add_header(ctrailer.name, ctrailer.value)
>               startfrom = 0
>           else:
>               patches.insert(0, (None, covermsg))
> 
> ---
> base-commit: 287477e9e0149b42e444471da9dca629ebacf2e1
> change-id: 20221114-prep-format-patch-single-patch-to-cc-2a878158d50b
> 
> Best regards,
