Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com [216.71.155.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7571F922
	for <tools@linux.kernel.org>; Thu, 11 May 2023 14:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683815148;
  h=message-id:date:to:cc:from:subject:
   content-transfer-encoding:mime-version;
  bh=z2gDiV/0vzArPkLGaCv6C33z+Ag4h4Xt0u4vmfSQBZM=;
  b=cfDkJyDKdxKRXzxE3TqdZo4bEwu1vPSTn9o5iZdgWnV0IZfCdSm4XkDh
   7gtAT2ujTtmmdBnNMTQDrr8LNrP7VU7pbLUw3ZwrkoobptdZnj9pF3i8i
   QoZCPHl5ZIhV9xP+DUKAKkS0gIlJDNc1sI2aFAQreNGFlz9OICr2yfobD
   Y=;
X-IronPort-RemoteIP: 104.47.55.104
X-IronPort-MID: 111137798
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:84CrrKnxj1VoM1PMTWNbGino5gyQJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIbXWDQOvnZYGv8e98lYYvjph4B65aEyIIwHAM/qyk2ESMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aWaVA8w5ARkPqgW5QaGzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 fk1NCgrdk7avei/yo+rd+1Ul80iMsa+aevzulk4pd3YJdAPZMmbBoD1v5pf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVE3ieCxWDbWUoXiqcF9t0CUv
 G/ZuU/+BQkXLoe3wjuZ6HO8wOTImEsXXapLTeThraE10Q37Kmo7EhEkDQXjhv2Do2WaWtVfK
 mMN9RUTlP1nnKCsZpynN/Gim1aYuRkYQPJUEusn+EeOx7DS7gLfAXILJhZDZ8YvsMseTDkjx
 FiP2djuAFRSXKa9THuc8vKRsmm0MC1MdWsaP3ZcEU0C/sXpp5w1glTXVNF/HaWpj9rzXzbt3
 zSNqyt4jLIW5SIW65iGEZn8q2rEjvD0osQdvW07gkrNAttFWbOY
IronPort-HdrOrdr: A9a23:ohHk1aql6OZ95fC7l9iYOs8aV5oleYIsimQD101hICG9E/b1qy
 nKpp8mPHDP5wr5NEtPpTnjAsm9qALnlKKdiLN5Vd3OYOCMghrKEGgN1/qG/xTQXwH46+5Bxe
 NBXsFFebnN5IFB/KTH3DU=
X-Talos-CUID: 9a23:jct13mztpvinsYDNVeAsBgURN9w9VGWDlU3aKkWFGVttcKycSEGfrfY=
X-Talos-MUID: 9a23:wxItwAWhRvvkMnrq/CXgtmk8bOBs2Y2FLEEKkZQposa7CBUlbg==
X-IronPort-AV: E=Sophos;i="5.99,266,1677560400"; 
   d="scan'208";a="111137798"
Received: from mail-mw2nam10lp2104.outbound.protection.outlook.com (HELO NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.104])
  by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 11 May 2023 10:24:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gejAk1oFR7hlhExu1/BmLvQTnBtv48gXEfD81c3qTLpsu4pAgF8yMq0o9jcJBO1ltcYm2Y9UdsOoaxWL/AFgHRtQ3Ucdng3tspSdkEOgMa2qpyHO2+EZIXaVmrkifZVJZs/x+lcNFf+qD6QxQM0ulP4XVwWKOh+U80meDz/XCmAIraGQxCYJ2uuqSmfNPe/jOThglKwCbfN43px2/05+IAEx1n9I865ci6U2Wia9XPc2r4+Z1UcghAhdwwCkhlCmacHXrUiKrCQQEBgSeEbcCrTXBm/r+s+yXhYNU4pXTYdqTW0gPhPfA02WySRhwkBMeBwMYlika9SldMpp2cct/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z2gDiV/0vzArPkLGaCv6C33z+Ag4h4Xt0u4vmfSQBZM=;
 b=jC0Ugo7hOry5Ejwa7swBEA1KSoKOyFNgtPuFBZGvupKf11wEoBekMDB6M23b82NHBY9meriNsWuNAl4LfWX9xKamWd1ArriyNz/UoBfpa1l0mxNPzLr5+MAcRuSxIQrwkbf1WT8c5HK+k8tcJWcX/hks6Z/rXTxSiyUMRexMF57hWEoa6h0UTTKDc9L/0fcV5H5teeiDV83/j6gaGblg3j4lFaiRE/oM1FHq5TwyN2fZ1HOUqeH3p7+9lzle7E38us5okyMmUPBb5Zlp8msHmgExX1rW5Tkkgm2braEDgsTWEEk0QWU2aisc0Kw1iNVL+k/RyQNI5otxVo1I54ulqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z2gDiV/0vzArPkLGaCv6C33z+Ag4h4Xt0u4vmfSQBZM=;
 b=NjTmaiko4cklcUZOuS11zh2EGtopRQZ858gjo4vuXVTRNcOD7G7fhUu6k33nQ9RT1R+OPcNTV+9Bcj8HupFj6I+bs73Bz32ruKAG9Z25Dej3vQmFgwNfjIcCaeD0JqOI/7dAkw2Tw1DFKtv6Fv2onm/jlsHtCDqSo2Yr2uSA1Rk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB5664.namprd03.prod.outlook.com (2603:10b6:a03:28f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.21; Thu, 11 May
 2023 14:24:35 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb%4]) with mapi id 15.20.6363.033; Thu, 11 May 2023
 14:24:34 +0000
Message-ID: <a512454c-2bd6-fd20-dff0-5ec19c8f85a9@citrix.com>
Date: Thu, 11 May 2023 15:24:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-GB
To: tools@linux.kernel.org
Cc: Julien Grall <jgrall@amazon.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: b4 am/shazam tag accumulation with HTML-ish emails
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0321.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::21) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ0PR03MB5664:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d162f43-2fe7-45f9-d03d-08db522b7151
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	h0gOPOYehsvBn1Xa3JvGSC0ZFu9xq3ZejBXuUher1OAx4X4jFitJmD7X59x2lwUpLUnEib/4Q0TeOU/wlwnKGSPx8jMH6h0nUdqHQtp2pFfCdXiN24jQf7qV746e4X0m8It09bf0XgKoBrzFSGpCwAFmJo3atQTQlQgVjIdylCuKI0rDnmeoSAApdYcZuKZPq3Bwqw7GvFtbQ4ppWQDPIqsZQr6P+XzeylU13mQxBCLfBBAtq32MupKjtRlu72eJ+lXa19k2XW+vizD34paOKSb+0HXFQh9ADAKaRu7y+GDOX0UAoKUHA1qb3H0Q64804ekpO8OmY1mijrE7F8VZNJNMs4VMoi6RTrGTsptKIY04Z+STQYdx/J3joKChePVw90gx9yOz4saHqy7tJ5LmH+9RtfhgbJ4ua/puWPGlw/a45/Yz9jZbubfQGtUtXr/yIIGE+AB6JpHoHrlIc+43aY7qNPni6GJ+HxzdlzCJdRj/fbpa/vQe/TgcGAzujkWYRWScszBsOc6C73MkJbm1UxFDrYPyBxbRUST6dja1Iop5JtpDJeD6AiZFkoDMhmgBDDjzoE3twDqxs7TEORqKuZ1msqbSrEA4Nh6awNZeqquAE0PSKi0uAvUf7lS5W1XW6jTQ0nSY1YJVcmSwoqfmJWcUZqWaEsbqI8pGe8xq940hQUV+o81Aoxip4bLdZ2Ms
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(366004)(136003)(346002)(376002)(451199021)(31686004)(38100700002)(82960400001)(31696002)(86362001)(36756003)(4326008)(41300700001)(6916009)(8936002)(8676002)(186003)(26005)(5660300002)(6512007)(6506007)(66556008)(2616005)(2906002)(66476007)(66946007)(4744005)(966005)(6666004)(478600001)(6486002)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RkRiQzE2Y0JpZWZsa3ZrN2VSdE0rcThyNlRaUUxPSWovMFlsN3IwSHdURHVE?=
 =?utf-8?B?aVVjZmZteUJ6dkgzdE5uK2ZjWFpKLzJ6QzNxNzcxYk5OV2FDNHY4eExKcGF3?=
 =?utf-8?B?VjRqQ1NjRlZWdTJuay9zaS9ocDhORzkwWEE3Um5FQXBQampweWFEd3pxb1da?=
 =?utf-8?B?cE5OcVZqOUJDY0llN21DRVFIbG1aN0Izb1RyQTh3eFR4VkJ5alBhaXFocVox?=
 =?utf-8?B?RW02TXhJVFNQbURxRktwbXVaSFErbXdzYjV2WGJ6M25JSkNzTFRHRWVBVmN4?=
 =?utf-8?B?SkpzUG1MdHo5eDh2N2RpdEo0cko0OVRZZlVWZHZ5WTh0bUlpNmNMT2N6WTJC?=
 =?utf-8?B?aExQV2FoOVE3MFVBdWJwV1RoNDFwOUJPbFlCTW1SYkRUeTdmWk9aUFpxTXVv?=
 =?utf-8?B?SlNXdjQwVW5XbTFkTFhkaTZ4UE1yM0RXZTJPcllQNWp6Z0xSeEo1TnJEWkFz?=
 =?utf-8?B?bUpodXVqNzlJSWovbDBqODJ4cWkxNTNaRzR3RTdyMVIrR2JKUTRCMlNCS3Bt?=
 =?utf-8?B?NXVUMk55RDhnemh5dXFtT1oxN29HSml2dGhVMDBZQ1g2N2dreGY4Y3J6QkFY?=
 =?utf-8?B?RG95ZzVNbUJhMEVNZldpUW0rcDdTZnlHemhuOFUvQXNnZTlOcGVOQUZXZTdM?=
 =?utf-8?B?UnVCYjg3aWxLU3RadFNKS1V4dWhFaEk0L2laWTBkSkNjc3VGQU9laCtuQ21m?=
 =?utf-8?B?dVJqVDVZMzVaOW9BVk8yU1d2RWVTcE5Zc1RYWHFDNEF0Qml4dXVuOXJORGNF?=
 =?utf-8?B?M3J5WU1YQ3RteXl0TzZrckJNRWR2NzZpS3VOSE5wRFYzR3FZelQ4dUFkdmhV?=
 =?utf-8?B?S0NXSlVrRUxZdjVOUkVjYVlSQXlxc0E5RlhBTzV4THoyb1pUaVVpYXYzZk4z?=
 =?utf-8?B?Q2VWVlJoNWt5bjBrZGNvS2dhUFp3dXJwV0NZM2FGL1Ayanp4UERqa1lxQkla?=
 =?utf-8?B?bTZjNUZCRVFCY0g3NzVteTV0eEUwQnM0UFNOL1R6NWxJN0xPaGxKdVIvR09j?=
 =?utf-8?B?U1pnODNzWjQweEErajhTazM4V29CMmhiSm55U3JwZ2h4L3lwUExyRW5jMGV4?=
 =?utf-8?B?Z3dmNnN4bHBQdmI0aWRKQ2s1MkEwbkMyQXZ3K0dwZzBhTmwxMG5ESUhvOU4r?=
 =?utf-8?B?SjluVUtzK0xvSDZHK3JrOFRRMXBuVm9LTnM2OUEySkNRSHc2dzMzWTgwclBD?=
 =?utf-8?B?VFVPOWNLMFhPdHlEV1dSTXZlTEx5aVpIRURDckV2SkVRczJNVDZYLzJVWWlV?=
 =?utf-8?B?VWR1Q1JQWmt6TDMwN0lCOCs3QXF3SXlRQmVhVDE1UmpsaDJiaktibFNrTWN5?=
 =?utf-8?B?TFZNZDRBSmJacXhGbS8wNFRHYi9zb3hoRnl2dzN1WGFLV2tsSGk3dWxXS3dK?=
 =?utf-8?B?RWoyWGgrOGM1SXVxdVdWWVQ4M05oU1g0OG5INU56THZHNXd2bm5OMURmeTFD?=
 =?utf-8?B?a1RYZ21EU09SNzltaG9UL3pIZ1lNdFZnMVc3T1RmTjM4ODEzRENhaEtVNCtL?=
 =?utf-8?B?Q3IvOUk0RFgzcXFCM0hrSzdxdTM0Rm8wcnJlYU1pSHhickdpOW1LaytKZ3Rz?=
 =?utf-8?B?cVo4cDNTQ1pZYjhkUktLanJGNUpkOTFIOVZFYkFKSG9kVEFHcUcybVM0NHA2?=
 =?utf-8?B?WEFVbVRwR1hjYVFMZzl3eVNSdk1QMFNjS1hMMDNwTEQ2SVNmY284eCt0dlNp?=
 =?utf-8?B?SWs3dHp2NnRHcHZtNlZZazZyWFRSaXYrdHRLWisxVGI2K0Q3Uk0rSldOSWRu?=
 =?utf-8?B?bWdQbFBYTmdVTEJCOWQ3aEtDZUIzN3N4aTVpNGV3YnV0NXNUNGhCTHZITmhM?=
 =?utf-8?B?bXQzMCtKQ0ducVExcHgrdW16djduMGQrUUdIeWFWYmhTQ0NZNTZvNG5GWG1i?=
 =?utf-8?B?eHUrb1ZiMWRlSCtHK0luY0s5MUdKU1hoajFIRDBaeCtZem0rcVZMUFZselVo?=
 =?utf-8?B?bVdUeG1ELzdJeXRSc0l5RFlwTVVZSWR1Mkh0OEhUMUFHNllBYVJBdlJqcUl4?=
 =?utf-8?B?ZXBLaHhnUzU4WGU1QWFJSEVHTWhpeU1BeGhBSktSZ05CM1hFVnJ6N05zN2Jk?=
 =?utf-8?B?Q3I4MEgvUzltRkNLaHpMbHEyZXBldUkxdGU0L0VDQ05pYmVxNHZYNzlOMU5k?=
 =?utf-8?B?a3FuQ2JzTXNGdXpVdzJMd3NCdWRZaTlWSldid1RONktzMk5zK0RQZmQrcFZt?=
 =?utf-8?B?eGc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	G2wTp8Wd6mxBXaQ38g6WimtRYAJ7r/2cw+Oq3KOEVvu+VVcluhWlV4oZhD8sdlytapZ1DtVYU4BxSOE7M/Suzs7L8fC2oRQucEqw/0N9L1HHsswuRVCNqyUVVcFuU2HVRgPOgdev5UCMCEFP11dHGbguXgM0rKaIwghhuPUFMvEoBtCTHJy7PDWBgd8tqXdy3GPA195h6qHmwk5tqPsFpfcX6/pGkHDKbF6Je+bAAZd4nyGtNgtBjJMdenAe2Ra7szeDDyHML6WOwIpxJb+1ACd/J5lLtwFa0yw8lHtl7Yg/08WXohTlp0XkonZA4ZJ0peStASi/Y5PRTh/RiNuiV0/UDkjAjTHc5VIoI5BSd95+A9Ch9PzDpNRvRnREf0+u0DhaqIocyJ5SYDHhIoKW19Zxl88NkC07+EiLkCrclZ3S5NUTxaKfujb+52HqgGno2Lm2V6AlNrpBMNpQxSEc6/ZOUeEeJR5SO+APmilE+8REiOtJda7SxCaCdAxbZZ/wdMovdabTnKVrysh3gkO08ImN7bzYwPM6nsxoEblVoJBk7+6tFDNxAIe8F61giHgghw/56ue75L8rsCQUMP1eY2ON3s1bFyoI23VSgq4vVUuNxJ6mUu2Qd7UzSyztPaDkN3DzZB+ox9d7KWo/KcTpotDSX/T5JDLLhXQCPJejERFRbggjApXSpKp/PHd2Mwa5rUKFWvoKPl9jMuCo8WTd1MxRvgxrz9T6RSIU6b3BOtNpbC2VvIKMYVxymxUP+FeUAws1+FfKl/o8qnieNvIjSOVcEsD0oKzl3laBaP/49P0=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d162f43-2fe7-45f9-d03d-08db522b7151
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2023 14:24:34.4344
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iAvw/QBtXW3WAIEhE1/jM7NiYXZqeYyyz9tfubflMKqErDw5U44XONFUCW4u7I9jC5r+s+r4579l6gWoFnCypr8wivNXtu4tp5p8DXjYx8E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5664

Hello,

In Xen we had a minor error today.

Given
https://lore.kernel.org/xen-devel/7E04E3DD-B260-49E4-8543-77BBF8715BCB@arm.com/
providing an R-by tag, the resulting commit ended up looking like
https://xenbits.xen.org/gitweb/?p=xen.git;a=commitdiff;h=cb781ae2c98de5d5742aa0de6850f371fb25825f

It appears that despite being text/plain, there was an extra <mailto:$X>.

Any chance this embedded mailto can be stripped?

Thanks,

~Andrew
