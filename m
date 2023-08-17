Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com [216.71.145.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391C213AD4
	for <tools@linux.kernel.org>; Thu, 17 Aug 2023 12:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1692275064;
  h=message-id:date:to:from:subject:mime-version;
  bh=fAY5UBc+FZVxU+jvgXw1saPEdsyvVQT+q+eZ12auT38=;
  b=Jbf+P5BL/lAD2dgpxXg2UuR6NtCcs+ndjJkqAUDGWdUwjknZ8uBCKaiy
   Ia4N8+QoyBJIZg4kDubhp0EHZhmdlehyRrjkVRVdNoxnsSJqQnAcvfN8/
   zKqSRQ9FdjvsBFVQWe8KBs99QbW4J3rT+az5SQw/9im58LKBpvcb8IoMb
   4=;
X-IronPort-RemoteIP: 104.47.51.41
X-IronPort-MID: 120202686
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:cUFtkK+djWBj+xsNc+WvDrUDBX+TJUtcMsCJ2f8bNWPdYAtSk2BPi
 n1XRCnXfqzSUtbHC5sjL9L0rldB+8eV0JYyDFE0nZ0GZyITpZOZWNrFI0qvZnKfdsefERo25
 pRHOoeYJZtpQ3bW9k2kY+m6p3MljviGGOClBuXIYX0sT1Q7Qyor0h47wOBRbuKE4zScK1rlV
 YTa/ZSHYDdJogJJD1/4y55viTsw7amu4WlE5AwzOK4U5AWPmigbAsoSdfrudCf2HtBaFL/mS
 77Pwo/i8zKC9X/BKD8HfpXTKRRWH+GIbWBirlIMBsBOVzAb/nRaPp4TbaZaMgEPzW3Sxbid8
 f0V3bSoUwAlI6bQr+oUVhhcAklWMLZPvbTKOhBTi+TKp6H9WyWqm6wG4H0eZ9VCob4nWD4Wr
 5T0FRhWBvy9r7PuqF6EYrEEavQLdKHDII4Zs3d8+jDVZd5OrUfrGviiCXdwhV/ct+gWdRrsT
 5NxhQlHNXwsVyZnKFYPYK/Sqc/z7pXJn5+0n3rOzUY/yzC7IAWcS9EBOvKNEjCBbZ09ckp1O
 gsqVok2a/0XHIX39NaLzp6jrsDEjT+4SoxDLqSX8tJq3VuT5lY0NiRDADNXodHh4qK/c/R2D
 hROvwAI9O01/kHtScThVRqlpnLCpgQbR9dbD+w97keK17bQ5AGaQGMDS1atavR/7JNwGWNsi
 wbPw4qB6T9H6dV5TVq08LuOoCz0Ei8SNWIYPgcPTBcf4smlq4Y25v7KZo85SPTt1IOlR1kcx
 RiJggkHorwqo/QG9LmL8Gr93AP1uLfGG1tdCgL/GzjNAhlCTJKiYIizwVza6+tQaoWUVF+Mu
 D4Dgcf20QwVJZSElSjISuNUGrisv6yBKGeE3QcpGIQ9/TOw/XLlZZpX/Dx1OEZuNIADZCPtZ
 0jQ/whW4fe/IUeXUEO+WKrpY+xC8EQqPY2Nuiz8BjaWXqVMSQ==
IronPort-HdrOrdr: A9a23:xPSTcq5jzA1pdd7pTAPXwDLXdLJyesId70hD6qkQc3FomwKj9/
 xG/c5rsSMc7Qx6ZJhOo7+90cW7L080lqQFhLX5X43SPzUO0VHARO1fBOPZqAEIcBeOlNK1u5
 0AT0B/YueAcGSTj6zBkXWF+wBL+qj5zEiq792usUuEVWtRGsZdB58SMHfhLqVxLjM2Y6YRJd
 6nyedsgSGvQngTZtTTPAh+YwCSz+e77a4PeHQ9dmYa1DU=
X-Talos-CUID: 9a23:UgI6iG0LsKclUL5mlKXFfLxfNcs1bj7PwibqOmC8JWY0Tr21c3iuwfYx
X-Talos-MUID: 9a23:gR42aQiW8U67/5CGxmITucMpN+lJ2oGnMW43nLYai8S+D3NBYimyg2Hi
X-IronPort-AV: E=Sophos;i="6.01,180,1684814400"; 
   d="scan'208";a="120202686"
Received: from mail-bn1nam02lp2041.outbound.protection.outlook.com (HELO NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.41])
  by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 17 Aug 2023 08:23:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TfKrJpNYGNg3lTY8zRDWFvaLp6oQ42Cpaw3joFl1e5y0ktECdjantp6cs7+5/6zBv4sCv3mS7+dsWR2JUP7B/NtWZbtJxdnLPsiBzPA5qHRSeD3dRgOc10mCNyVfdIU2J3mQIL5ZDn+Y76HJA+IaHXVB7u1CMmtWFDw4+N/SjN1teQPCPZEo5UWn4czwRZ42F52F/wnZH9EFg2TK6ZbgiGQi4377PXnDmmrD2eRjCvVtcLlF/Yl7JMtLHsHp8e/ubGcv8iioqFYdRbsaeWBsqLJ6BoosaLY+AsydC/GuAVYe0Nm1DOUAgKsOynFh2HV/vPcpxQBLDQXGAmTSaxW6Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fAY5UBc+FZVxU+jvgXw1saPEdsyvVQT+q+eZ12auT38=;
 b=Azpc4C2rI733nLHuRVUJXKoXOOKXmyQHgDHo0LOtNHBARX+y/ADpHzmCTriedesdynEKGsxlpMM9uhDUrPEEPLtO9Tiq+gO2lgDtYCRwvYynfW80wQgo2l93KAohJLXDAomw1nhOfp7oGSof4uIAjUxA3NrJgSwMRMDUunPVtPzkJ1KNO1bsPqISM36DEStC8I6PnOYoBu4FoK0G0exZgNQOLThQEZou+DtbobFbz54B6a3X0+tl71u/NuQRQvKD2u+I2HVC6oq3ag1QyCf6+ht1Nwetv3GBiIJMQTvT/4tfBuVKLZm+ZFQAeSaEgVXXQ104o/fWJ4dmYa2p1T/rkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fAY5UBc+FZVxU+jvgXw1saPEdsyvVQT+q+eZ12auT38=;
 b=oh4AOKNAq6iOB9QY+GbWzplRe+4hY0GfxkWh0y8apNxCjBECu7tXkMJsGChwzULeKJYxaKw7dzljuDSjsl7JyliSWorSuxGEPKhUYXuEADCBQ51Gih3M2Uqf+LzNhTiw/yhtlL+VkzUMyoJstXfiPouFIWmGNblnKU///dCGMFg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CO1PR03MB5827.namprd03.prod.outlook.com (2603:10b6:303:9a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Thu, 17 Aug
 2023 12:23:12 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::afa:50df:158a:a912]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::afa:50df:158a:a912%5]) with mapi id 15.20.6678.029; Thu, 17 Aug 2023
 12:23:12 +0000
Content-Type: multipart/mixed; boundary="------------63ISqNXiQGttonvvxRYRhtDc"
Message-ID: <c9643b70-8751-a2a2-185e-174ec2560328@citrix.com>
Date: Thu, 17 Aug 2023 13:23:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-GB
To: tools@linux.kernel.org
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: b4 patch corruption
X-ClientProxiedBy: LO4P123CA0496.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::15) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|CO1PR03MB5827:EE_
X-MS-Office365-Filtering-Correlation-Id: b61b2a7a-4944-4143-e1e9-08db9f1cb913
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+VgZqZjWK9aeKnHVGdoHfXLHZCFIp3Rjt4ulCoqxTIlpKCCa1EbYyt49CHDiyXkC5YucnonqJ7Z0+fAT3NuROitnwqPnWZtwLksIcIcEYtjKoByiUofD7gIm7lEUmfgIgCmEEFloYN0osjt6PYpMmVR4C6egEGsO6MkBXCG4ltFHh53+Uv+ulx9MFW0uRO69IgTE8PH4tKTd9nBvdHkGaaqKpGi6ErU3YHE9o0T2q2/FS86fAuUk+ZhxCH8f8/bsxdKY66X0GSDM+2KR9rNnntQz7bvuQa8ghmqPaIkNv2tMGrhC3qX0gT/NzQcDUh5xmOaQCDOWk8GVwxAILQ41u10nKnnSZ/obU+c7QJFlRrOgUu/wfnGUk3ulUIqHIfwXBHLYfOzzjIouK/0NW4iGSc3js4WQn0Dq6aIiv97IOIl7CwYG5HTbCUsUi2y8kBR8wu4bVZRvr3LWGU/9/kRbAX6UhwNh55AjkTSD0vOgLB6Z8dtJeoLHegZ/exx878e9+SaAEpbW1Jaf6qJjGcjdDkiio+HRYnSzoDVRuNB5zBsXQ0j9IMsSwFqW/zetXYMOnhrOizRxffuEmhR4rQnydlf/YRDdheJ2kqZwJrml3sXCYNBvj6VR8PFUfCnrAjClXbjfpBnQ7uMMqKonv8S+fA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(366004)(39860400002)(346002)(376002)(1800799009)(186009)(451199024)(83380400001)(235185007)(2906002)(66946007)(478600001)(66556008)(66476007)(6666004)(6506007)(33964004)(6486002)(6916009)(316002)(5660300002)(2616005)(7116003)(26005)(6512007)(8936002)(8676002)(41300700001)(36756003)(31696002)(86362001)(38100700002)(82960400001)(31686004)(84970400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?alVYWXI4Yjl2eDAzc0puUWJFS3pLcElBSDlvNDZoR2pyTHR3R1pKWXlVbDhv?=
 =?utf-8?B?elVBR1JpRHMzaUFYMlhVMUN5c0JkY01vaGlkZTZvVldINmttNVNBNFZVaUNy?=
 =?utf-8?B?aTFaWVVidHgrUCtvaHk4UUNSVmd6SklCb3lEaVNKQjJDamNkSDA4N2pPcUlS?=
 =?utf-8?B?UlovaHdFbnlSY0RrZ2xqRDUwUmQzN2hVNzJEdnpUZk52b2Mzc0I5Mm1wWjJ2?=
 =?utf-8?B?N1ZDZktSZlpmelpVVEt3Sml0NC96NllURUJZK1ZzT1FQeE5PL1o0Z1ZoWFpx?=
 =?utf-8?B?TmhwS3IvbkMySmNhS2hlbmR2THNEM1NySXl5d2IvMitUaEF5eHRBVzcxaXRk?=
 =?utf-8?B?RVZBWjBPVFFEN2RSa0FPd3pIRU5xTzNXYm5kSzRCNGhJZWk2VkIyV2R1NHJ1?=
 =?utf-8?B?MWdHV3M3VWZONkoxOXhzSk9KYWFxNGpxQVRVN3JXdWRzcnl5VzJjSVRTOHpu?=
 =?utf-8?B?RnFmVWRrc1MzWDJsMzFkTUMwSkg2VXBMRytVcTVkNUlXa0JuRUduaHNrV2Jh?=
 =?utf-8?B?VnllOThzbkgyNS9wUWtVblpNSENjVHdJVnpZdmFaeXQ4QjFwM3NHUE4zOW84?=
 =?utf-8?B?aWozd2dOVkxwa1JpSEo3NUh4aVFRWjB0cWJVcFlFMUN3aGh0WWtMRzJqV0Er?=
 =?utf-8?B?b2FoajFzY1dtVVpWWEpKSGwreHNINURzcGY4Vll5V2tTZHhuTVV3Yk5pVDFk?=
 =?utf-8?B?cHlTV2duOGNscVhqNHlSTkRnYzlvdUZ3WkcwMlh2b2EwWmF1ZlhzY2o4bWIz?=
 =?utf-8?B?UDNtaGQ0QVJmNXloRGhwV2kraVprSW1haFR0QlB3SnBSamcyYmFmV00yM3hl?=
 =?utf-8?B?OUFlVkpuS3hnUDlPQ2JQYnB3L3JsU3JUWjFqZ2F4aWJBSlBzQ1lzaTNNZTVT?=
 =?utf-8?B?cWhjV01IOHZKNEEyMERLV21uR3Y0eCtDQ0I2WW5DbEs3STc5OFJKczJ0YlVa?=
 =?utf-8?B?SG5PeHJBbGdISVh1N2RoQlIrRThUZHN2cGI0Z1J2V1N3RTBxeEJMMzZpa1dv?=
 =?utf-8?B?cUFuYVVNR0pWVE5wNWhBQkk4OE10T1dZckFqTHM2TUxyRDE3WkZpQnJNY1Uw?=
 =?utf-8?B?ZVEwNmNhWFBoMWxtZTFXdHI2WTNKZFZLS2c3LzFrN3ovd0RrbytyY1BOMFVQ?=
 =?utf-8?B?aGoxdFMxOTlUNW9kcDhPejBLeHZ6WlZFUndLY1dJNkxXYnVVWHdCdVdkSkJp?=
 =?utf-8?B?Y0VvYitjbXlLMXJOeUJxQnY1Zit1b3UxbEFoV2tZbTNmMkRGTWpiR2k5TG9z?=
 =?utf-8?B?WDJFSmFGL3ArRkpzd1RpTWN1enpub3lSUXdQV1grSWRvb3pKb0MzVTVxM0R0?=
 =?utf-8?B?WDV2V3dYa1VqOTUxQzRJVnUwMGpCcURiZzZaQnJGbUZqbER1ZXYxaDlsdHlZ?=
 =?utf-8?B?SWs1WFFyMHdxaGd3K2Y5Q3VsUDl5ejNhS1ZyamtpdGEzb1RkN0xtWWNDMnY0?=
 =?utf-8?B?UWcrMy9la3I5TnlWdFlhblJXMVNXTW9zczJPTVZuOEV6UVIySldIVXYvTkRk?=
 =?utf-8?B?b3ZXTkM4NExsQ3l4YVJDcUh3SEc4N2c1SFM1cU5wWlRQL0lDRklqY2pxSEp1?=
 =?utf-8?B?NnEya25GbWN6YThFd05jbDh2Y0owdFdPU0duMHZDQzd2RTV4azRhai93YUw2?=
 =?utf-8?B?UThySUZKZEpxdmgvMU5qZlhuNThxNjFTMWtSWURWWTdwakVFR0JwYzA2cjIz?=
 =?utf-8?B?dGVqSWdwbHRva3JWdE5QVW5IT01iWUF2ZnpkYWZJZ1NtMUpJTmhBdGdvV0hm?=
 =?utf-8?B?bmxsbU41cG96dUt6NFk3aFdGS203NHZud1BwZkJmYXJxVlZxbDEzeTJnbEx1?=
 =?utf-8?B?T1JKL1VZdUNQZmllNk5RZXVWSkRhNFp0aWUxU25POTJUMTBRRkdocG54VXIx?=
 =?utf-8?B?VVIzdDRzdUVoKy9Nc25lT3lLbkE4OW5ibHZSQmhma2M0NWVCZ2Y4S0Nsd3BJ?=
 =?utf-8?B?NHJpbWc0QllVenRwMjBFR3RDNFhuTDNoZm9GaXhRVGNjM0ErK2RJc3ptdHIr?=
 =?utf-8?B?UFRvZTFNSHc0c09WVjlZUGlDUzdJUUdDR1k5aWt0Mk5YNFQ2cVdzWDBQOFN0?=
 =?utf-8?B?OTlZOWYrZU53bzlZaVVLaEozWHdoRFhjT2JMQlNhZlFmaE5wT045ZkUxekd1?=
 =?utf-8?B?aEh4akVXSlNyVlNqd29NdCtSSS81WE9CWHhuVzltamY1eVdsZ0llRTBrNzVL?=
 =?utf-8?B?Vmc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/UvLo59Ib9RGOgrl7Sj2kFn1/VyGt+XA6t6ZX+FgK+gNJryiXwjtWF6JtMFutjR0qeB5rUgilLr0G99as/2Bx1wZSTYB2/iKaV2iRRwMEXnuNOgaD4BjJaFV3Umd8m1F9zo0D9HW+93eva0mrslA8gd1aRKdyxfRgrmnVdBy0V+SnqOa9WXK5khEvnJtDz0kF2jODXsgTBCL/SxZAzGCz6o7ME7rLUbry58/8lkTnIyihbIaKSTv13k//cs/PViBnyqul5Ka0m+K8eAwnSOKz9IB4GzxST+LvcpLBH/rTlGIKPglvSKy+QNxUgexIqUXclhjkAwFTE3nwLz6tpvnWs46WAv2Yp+4Wjj6Epy3h01kojoTTSx/yvNtWUDCnREBngflHZsdcYwNYAxW2D1UUt74L3/Wi+a4wzYzmtU1XM0mr4Ud3kSmM7yShArMd8TLG+t+WvT4KsQwpfqm7Bb+iXh/tEFrFhkdvQsPSU7ZCYPsQc4UAN/2yG8F6RJ3V1S2BCNti12gvj1/TLoWcLa/ZsRDdS5DRxxPlToZXhgvuVj0ZoccJKoadXTU5NuKeNs6li1hKi7uDiW3YtGNO6kgHFdRnez7yMMqQUNVttvW7zAT7uVubL8CVZJ5hWP/IJ1eh3g/B7Srd5dCssGXOMjj3OiMuvbJPDkk2YC7wMBBv+k8HfMPY4XQmt+/u6Tu7ROq0zoqiYZz/z/7jRS1v+CNvjvSzMF3YH5M3PGq34tDvX6qSiPvEtMTsi1kbiy2JaZ0hXkGtMfD5+i4NUK+cBOEGA==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b61b2a7a-4944-4143-e1e9-08db9f1cb913
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 12:23:11.9001
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vz487rq5IVCxBZMyW9qKjK4aIwAkvV7c3pTqzaYo+7BY+57QEIF9QSNFSPDwDE2WIQBcl6qlvFd+NMQuJj7c6EsdDJz9Ij4AlAIMVEYiGW8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5827

--------------63ISqNXiQGttonvvxRYRhtDc
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

I'm using b4 v0.12.3, and getting some kind of patch corruption issue:

xen.git$ b4 shazam a67c2fa3-ba1c-3783-c3ee-250aff6903d5@suse.com
Grabbing thread from
lore.kernel.org/all/a67c2fa3-ba1c-3783-c3ee-250aff6903d5@suse.com/t.mbox.gz
Checking for newer revisions
Grabbing search results from lore.kernel.org
Analyzing 1 messages in the thread
Checking attestation on all messages, may take a moment...
---
  ✓ [PATCH] x86emul: rework wrapping of libc functions in test and
fuzzing harnesses
  ---
  ✓ Signed: DKIM/suse.com
---
Total patches: 1
---
Applying: x86emul: rework wrapping of libc functions in test and fuzzing
harnesses
Patch failed at 0001 x86emul: rework wrapping of libc functions in test
and fuzzing harnesses
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
error: corrupt patch at line 11
hint: Use 'git am --show-current-patch=diff' to see the failed patch

Forwarding this to patch does produce a more specific complaint:

xen.git$ git am --show-current-patch=diff | patch
patching file Makefile
patch: **** malformed patch at line 11: @@ -51,10 +53,10 @@
x86-insn-fuzzer.a: $(OBJS) cpuid.o

but it's not clear what exactly is wrong here.

If I copy the patch out of the email and feed it to `git am` directly,
it's happy:

xen.git$ git am rework-wrap.patch
Applying: x86emul: rework wrapping of libc functions in test and fuzzing
harnesses

I can't spot any interesting differences between what failed and what
`git format-patch` reproduced, but I'm out of my depth here.

My gut feeling is that something has been mangled while b4 was
processing the change, but it's only a guess.

I've attached the copied-off-list patch, and the base commit is
d0eabe3eaf0db5b78843095a2918d50961e99e96

Thanks,

~Andrew
--------------63ISqNXiQGttonvvxRYRhtDc
Content-Type: text/x-patch; charset=UTF-8; name="rework-wrap.patch"
Content-Disposition: attachment; filename="rework-wrap.patch"
Content-Transfer-Encoding: base64

RnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpTdWJqZWN0OiBbUEFUQ0hdIHg4
NmVtdWw6IHJld29yayB3cmFwcGluZyBvZiBsaWJjIGZ1bmN0aW9ucyBpbiB0ZXN0IGFuZCBmdXp6
aW5nIGhhcm5lc3NlcwoKT3VyIHByZXNlbnQgYXBwcm9hY2ggaXMgd29ya2luZyBmdWxseSBiZWhp
bmQgdGhlIGNvbXBpbGVyJ3MgYmFjay4gVGhpcwp3YXMgZm91bmQgdG8gbm90IHdvcmsgd2l0aCBM
VE8uIEVtcGxveSBsZCdzIC0td3JhcD0gb3B0aW9uIGluc3RlYWQuIE5vdGUKdGhhdCB3aGlsZSB0
aGlzIG1ha2VzIHRoZSBidWlsZCB3b3JrIGF0IGxlYXN0IHdpdGggbmV3IGVub3VnaCBnY2MgKGl0
CmRvZXNuJ3Qgd2l0aCBnY2M3LCBmb3IgZXhhbXBsZSwgZHVlIHRvIHRvb2wgY2hhaW4gc2lkZSBp
c3N1ZXMgYWZhaWN0KSwKYWNjb3JkaW5nIHRvIG15IHRlc3RpbmcgdGhpbmdzIHN0aWxsIHdvbid0
IHdvcmsgd2hlbiBidWlsZGluZyB0aGUKZnV6emluZyBoYXJuZXNzIHdpdGggYWZsLWNjOiBXaGls
ZSB3aXRoIHRoZSBnY2M3IHRvb2wgY2hhaW4gSSBzZWUgYWZsLWFzCmdldHRpbmcgaW52b2tlZCwg
dGhpcyBkb2VzIG5vdCBoYXBwZW4gd2l0aCBnY2MxMy4gWWV0IHdpdGhvdXQgdXNpbmcgdGhhdAph
c3NlbWJsZXIgd3JhcHBlciB0aGUgcmVzdWx0aW5nIGJpbmFyeSB3aWxsIGxvb2sgdW5pbnN0cnVt
ZW50ZWQgdG8KYWZsLWZ1enouCgpXaGlsZSBjaGVja2luZyB0aGUgcmVzdWx0aW5nIGJpbmFyaWVz
IEkgbm90aWNlZCB0aGF0IHdlJ3ZlIGdhaW5lZCB1c2VzCm9mIHNucHJpbnRmKCkgYW5kIHN0cnN0
cigpLCB3aGljaCBvbmx5IGp1c3Qgc28gaGFwcGVuIHRvIG5vdCBjYXVzZSBhbnkKcHJvYmxlbXMu
IEFkZCBhIHdyYXBwZXJzIGZvciB0aGVtIGFzIHdlbGwuCgpTaW5jZSB3ZSBkb24ndCBoYXZlIGFu
eSBhY3R1YWwgdXNlcyBvZiB2eyxzbn1wcmludGYoKSwgbm8gZGVmaW5pdGlvbnMgb2YKdGhlaXIg
d3JhcHBlcnMgYXBwZWFyIChqdXN0IHlldCkuIEJ1dCBJIHRoaW5rIHdlIHdhbnQKX193cmFwX3ss
c259cHJpbnRmKCkgdG8gcHJvcGVybHkgdXNlIF9fcmVhbF92eyxzbn1wcmludGYoKSByaWdodCBh
d2F5LAp3aGljaCBtZWFucyB3ZSBuZWVkIGRlbGFyYXRpb25zIG9mIHRoZSBsYXR0ZXIuCgpSZXBv
cnRlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KU3VnZ2Vz
dGVkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgpTaWduZWQt
b2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgotLS0gYS90b29scy9mdXp6
L3g4Nl9pbnN0cnVjdGlvbl9lbXVsYXRvci9NYWtlZmlsZQorKysgYi90b29scy9mdXp6L3g4Nl9p
bnN0cnVjdGlvbl9lbXVsYXRvci9NYWtlZmlsZQpAQCAtMzUsNiArMzUsOCBAQCBPQkpTIDo9IGZ1
enotZW11bC5vIHg4Ni1lbXVsYXRlLm8KIE9CSlMgKz0geDg2X2VtdWxhdGUvMGYwMS5vIHg4Nl9l
bXVsYXRlLzBmYWUubyB4ODZfZW11bGF0ZS8wZmM3Lm8KIE9CSlMgKz0geDg2X2VtdWxhdGUvZGVj
b2RlLm8geDg2X2VtdWxhdGUvZnB1Lm8KIAorV1JBUFBFRCA9ICQoc2hlbGwgc2VkIC1uICdzLF4g
KldSQVAoXChbWzphbG51bTpdX10qXCkpOyxcMSxwJyB4ODYtZW11bGF0ZS5oKQorCiBwcml2YXRl
LmggOj0geDg2LWVtdWxhdGUuaCB4ODZfZW11bGF0ZS94ODZfZW11bGF0ZS5oIHg4Nl9lbXVsYXRl
L3ByaXZhdGUuaAogCiB4ODYtZW11bGF0ZS5oOiB4ODZfZW11bGF0ZS94ODZfZW11bGF0ZS5oCkBA
IC01MSwxMCArNTMsMTAgQEAgeDg2LWluc24tZnV6emVyLmE6ICQoT0JKUykgY3B1aWQubwogCSQo
QVIpIHJjICRAICReCiAKIGFmbC1oYXJuZXNzOiBhZmwtaGFybmVzcy5vICQoT0JKUykgY3B1aWQu
byB3cmFwcGVycy5vCi0JJChDQykgJChDRkxBR1MpICReIC1vICRACisJJChDQykgJChDRkxBR1Mp
ICQoYWRkcHJlZml4IC1XbCQoY29tbWEpLS13cmFwPSwkKFdSQVBQRUQpKSAkXiAtbyAkQAogCiBh
ZmwtaGFybmVzcy1jb3Y6IGFmbC1oYXJuZXNzLWNvdi5vICQocGF0c3Vic3QgJS5vLCUtY292Lm8s
JChPQkpTKSkgY3B1aWQubyB3cmFwcGVycy5vCi0JJChDQykgJChDRkxBR1MpICQoR0NPVl9GTEFH
UykgJF4gLW8gJEAKKwkkKENDKSAkKENGTEFHUykgJChHQ09WX0ZMQUdTKSAkKGFkZHByZWZpeCAt
V2wkKGNvbW1hKS0td3JhcD0sJChXUkFQUEVEKSkgJF4gLW8gJEAKIAogIyBDb21tb24gdGFyZ2V0
cwogLlBIT05ZOiBhbGwKLS0tIGEvdG9vbHMvdGVzdHMveDg2X2VtdWxhdG9yL01ha2VmaWxlCisr
KyBiL3Rvb2xzL3Rlc3RzL3g4Nl9lbXVsYXRvci9NYWtlZmlsZQpAQCAtMjU5LDggKzI1OSwxMCBA
QCBPQkpTIDo9IHg4Ni1lbXVsYXRlLm8gY3B1aWQubyB0ZXN0X3g4Nl9lCiBPQkpTICs9IHg4Nl9l
bXVsYXRlLzBmMDEubyB4ODZfZW11bGF0ZS8wZmFlLm8geDg2X2VtdWxhdGUvMGZjNy5vCiBPQkpT
ICs9IHg4Nl9lbXVsYXRlL2Jsay5vIHg4Nl9lbXVsYXRlL2RlY29kZS5vIHg4Nl9lbXVsYXRlL2Zw
dS5vIHg4Nl9lbXVsYXRlL3V0aWwubwogCitXUkFQUEVEIDo9ICQoc2hlbGwgc2VkIC1uICdzLF4g
KldSQVAoXChbWzphbG51bTpdX10qXCkpOyxcMSxwJyB4ODYtZW11bGF0ZS5oKQorCiAkKFRBUkdF
VCk6ICQoT0JKUykKLQkkKEhPU1RDQykgJChIT1NUQ0ZMQUdTKSAtbyAkQCAkXgorCSQoSE9TVEND
KSAkKEhPU1RDRkxBR1MpICQoYWRkcHJlZml4IC1XbCQoY29tbWEpLS13cmFwPSwkKFdSQVBQRUQp
KSAtbyAkQCAkXgogCiAuUEhPTlk6IGNsZWFuCiBjbGVhbjoKLS0tIGEvdG9vbHMvdGVzdHMveDg2
X2VtdWxhdG9yL3dyYXBwZXJzLmMKKysrIGIvdG9vbHMvdGVzdHMveDg2X2VtdWxhdG9yL3dyYXBw
ZXJzLmMKQEAgLTEsNzggKzEsMTAzIEBACiAjaW5jbHVkZSA8c3RkYXJnLmg+CiAKLSNkZWZpbmUg
V1JBUCh4KSB0eXBlb2YoeCkgZW11bF8jI3gKKyNkZWZpbmUgV1JBUCh4KSB0eXBlb2YoeCkgX193
cmFwXyAjIyB4LCBfX3JlYWxfICMjIHgKICNpbmNsdWRlICJ4ODYtZW11bGF0ZS5oIgogCi1zaXpl
X3QgZW11bF9md3JpdGUoY29uc3Qgdm9pZCAqc3JjLCBzaXplX3Qgc3osIHNpemVfdCBuLCBGSUxF
ICpmKQorc2l6ZV90IF9fd3JhcF9md3JpdGUoY29uc3Qgdm9pZCAqc3JjLCBzaXplX3Qgc3osIHNp
emVfdCBuLCBGSUxFICpmKQogewogICAgIGVtdWxfc2F2ZV9mcHVfc3RhdGUoKTsKLSAgICBzeiA9
IGZ3cml0ZShzcmMsIHN6LCBuLCBmKTsKKyAgICBzeiA9IF9fcmVhbF9md3JpdGUoc3JjLCBzeiwg
biwgZik7CiAgICAgZW11bF9yZXN0b3JlX2ZwdV9zdGF0ZSgpOwogCiAgICAgcmV0dXJuIHN6Owog
fQogCi1pbnQgZW11bF9tZW1jbXAoY29uc3Qgdm9pZCAqcDEsIGNvbnN0IHZvaWQgKnAyLCBzaXpl
X3Qgc3opCitpbnQgX193cmFwX21lbWNtcChjb25zdCB2b2lkICpwMSwgY29uc3Qgdm9pZCAqcDIs
IHNpemVfdCBzeikKIHsKICAgICBpbnQgcmM7CiAKICAgICBlbXVsX3NhdmVfZnB1X3N0YXRlKCk7
Ci0gICAgcmMgPSBtZW1jbXAocDEsIHAyLCBzeik7CisgICAgcmMgPSBfX3JlYWxfbWVtY21wKHAx
LCBwMiwgc3opOwogICAgIGVtdWxfcmVzdG9yZV9mcHVfc3RhdGUoKTsKIAogICAgIHJldHVybiBy
YzsKIH0KIAotdm9pZCAqZW11bF9tZW1jcHkodm9pZCAqZHN0LCBjb25zdCB2b2lkICpzcmMsIHNp
emVfdCBzeikKK3ZvaWQgKl9fd3JhcF9tZW1jcHkodm9pZCAqZHN0LCBjb25zdCB2b2lkICpzcmMs
IHNpemVfdCBzeikKIHsKICAgICBlbXVsX3NhdmVfZnB1X3N0YXRlKCk7Ci0gICAgbWVtY3B5KGRz
dCwgc3JjLCBzeik7CisgICAgX19yZWFsX21lbWNweShkc3QsIHNyYywgc3opOwogICAgIGVtdWxf
cmVzdG9yZV9mcHVfc3RhdGUoKTsKIAogICAgIHJldHVybiBkc3Q7CiB9CiAKLXZvaWQgKmVtdWxf
bWVtc2V0KHZvaWQgKmRzdCwgaW50IGMsIHNpemVfdCBzeikKK3ZvaWQgKl9fd3JhcF9tZW1zZXQo
dm9pZCAqZHN0LCBpbnQgYywgc2l6ZV90IHN6KQogewogICAgIGVtdWxfc2F2ZV9mcHVfc3RhdGUo
KTsKLSAgICBtZW1zZXQoZHN0LCBjLCBzeik7CisgICAgX19yZWFsX21lbXNldChkc3QsIGMsIHN6
KTsKICAgICBlbXVsX3Jlc3RvcmVfZnB1X3N0YXRlKCk7CiAKICAgICByZXR1cm4gZHN0OwogfQog
Ci1pbnQgZW11bF9wcmludGYoY29uc3QgY2hhciAqZm10LCAuLi4pCitpbnQgX193cmFwX3ByaW50
Zihjb25zdCBjaGFyICpmbXQsIC4uLikKIHsKICAgICB2YV9saXN0IHZhcmc7CiAgICAgaW50IHJj
OwogCiAgICAgZW11bF9zYXZlX2ZwdV9zdGF0ZSgpOwogICAgIHZhX3N0YXJ0KHZhcmcsIGZtdCk7
Ci0gICAgcmMgPSB2cHJpbnRmKGZtdCwgdmFyZyk7CisgICAgcmMgPSBfX3JlYWxfdnByaW50Zihm
bXQsIHZhcmcpOwogICAgIHZhX2VuZCh2YXJnKTsKICAgICBlbXVsX3Jlc3RvcmVfZnB1X3N0YXRl
KCk7CiAKICAgICByZXR1cm4gcmM7CiB9CiAKLWludCBlbXVsX3B1dGNoYXIoaW50IGMpCitpbnQg
X193cmFwX3B1dGNoYXIoaW50IGMpCiB7CiAgICAgaW50IHJjOwogCiAgICAgZW11bF9zYXZlX2Zw
dV9zdGF0ZSgpOwotICAgIHJjID0gcHV0Y2hhcihjKTsKKyAgICByYyA9IF9fcmVhbF9wdXRjaGFy
KGMpOwogICAgIGVtdWxfcmVzdG9yZV9mcHVfc3RhdGUoKTsKIAogICAgIHJldHVybiByYzsKIH0K
IAotaW50IGVtdWxfcHV0cyhjb25zdCBjaGFyICpzdHIpCitpbnQgX193cmFwX3B1dHMoY29uc3Qg
Y2hhciAqc3RyKQogewogICAgIGludCByYzsKIAogICAgIGVtdWxfc2F2ZV9mcHVfc3RhdGUoKTsK
LSAgICByYyA9IHB1dHMoc3RyKTsKKyAgICByYyA9IF9fcmVhbF9wdXRzKHN0cik7CiAgICAgZW11
bF9yZXN0b3JlX2ZwdV9zdGF0ZSgpOwogCiAgICAgcmV0dXJuIHJjOwogfQorCitpbnQgX193cmFw
X3NucHJpbnRmKGNoYXIgKmJ1Ziwgc2l6ZV90IG4sIGNvbnN0IGNoYXIgKmZtdCwgLi4uKQorewor
ICAgIHZhX2xpc3QgdmFyZzsKKyAgICBpbnQgcmM7CisKKyAgICBlbXVsX3NhdmVfZnB1X3N0YXRl
KCk7CisgICAgdmFfc3RhcnQodmFyZywgZm10KTsKKyAgICByYyA9IF9fcmVhbF92c25wcmludGYo
YnVmLCBuLCBmbXQsIHZhcmcpOworICAgIHZhX2VuZCh2YXJnKTsKKyAgICBlbXVsX3Jlc3RvcmVf
ZnB1X3N0YXRlKCk7CisKKyAgICByZXR1cm4gcmM7Cit9CisKK2NoYXIgKl9fd3JhcF9zdHJzdHIo
Y29uc3QgY2hhciAqczEsIGNvbnN0IGNoYXIgKnMyKQoreworICAgIGNoYXIgKnM7CisKKyAgICBl
bXVsX3NhdmVfZnB1X3N0YXRlKCk7CisgICAgcyA9IF9fcmVhbF9zdHJzdHIoczEsIHMyKTsKKyAg
ICBlbXVsX3Jlc3RvcmVfZnB1X3N0YXRlKCk7CisKKyAgICByZXR1cm4gczsKK30KLS0tIGEvdG9v
bHMvdGVzdHMveDg2X2VtdWxhdG9yL3g4Ni1lbXVsYXRlLmgKKysrIGIvdG9vbHMvdGVzdHMveDg2
X2VtdWxhdG9yL3g4Ni1lbXVsYXRlLmgKQEAgLTMyLDkgKzMyLDcgQEAKICNpZmRlZiBFT0YKICMg
ZXJyb3IgIk11c3Qgbm90IGluY2x1ZGUgPHN0ZGlvLmg+IGJlZm9yZSB4ODYtZW11bGF0ZS5oIgog
I2VuZGlmCi0jaWZkZWYgV1JBUAotIyBpbmNsdWRlIDxzdGRpby5oPgotI2VuZGlmCisjaW5jbHVk
ZSA8c3RkaW8uaD4KIAogI2luY2x1ZGUgPHhlbi94ZW4uaD4KIApAQCAtODgsMTEgKzg2LDcgQEAg
c3RydWN0IHg4Nl9meHNyICpnZXRfZnB1X3NhdmVfYXJlYSh2b2lkKQogICogYXJvdW5kIHRoZSBh
Y3R1YWwgZnVuY3Rpb24uCiAgKi8KICNpZm5kZWYgV1JBUAotIyBpZiAwIC8qIFRoaXMgb25seSB3
b3JrcyBmb3IgZXhwbGljaXQgY2FsbHMsIG5vdCBmb3IgY29tcGlsZXIgZ2VuZXJhdGVkIG9uZXMu
ICovCi0jICBkZWZpbmUgV1JBUCh4KSB0eXBlb2YoeCkgeCBhc20oImVtdWxfIiAjeCkKLSMgZWxz
ZQotIyBkZWZpbmUgV1JBUCh4KSBhc20oIi5lcXUgIiAjeCAiLCBlbXVsXyIgI3gpCi0jIGVuZGlm
CisjIGRlZmluZSBXUkFQKHgpIHR5cGVvZih4KSBfX3dyYXBfICMjIHgKICNlbmRpZgogCiBXUkFQ
KGZ3cml0ZSk7CkBAIC0xMDIsNiArOTYsMTAgQEAgV1JBUChtZW1zZXQpOwogV1JBUChwcmludGYp
OwogV1JBUChwdXRjaGFyKTsKIFdSQVAocHV0cyk7CitXUkFQKHNucHJpbnRmKTsKK1dSQVAoc3Ry
c3RyKTsKK1dSQVAodnByaW50Zik7CitXUkFQKHZzbnByaW50Zik7CiAKICN1bmRlZiBXUkFQCiAK
Cg==

--------------63ISqNXiQGttonvvxRYRhtDc--
