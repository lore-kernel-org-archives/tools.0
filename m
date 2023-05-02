Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com [216.71.155.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7F533E9
	for <tools@linux.kernel.org>; Tue,  2 May 2023 17:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683047257;
  h=message-id:date:to:from:subject:
   content-transfer-encoding:mime-version;
  bh=HdO1UgaGkYzMPMQDuKOugvKKvdaobGCci7P0+roVKX0=;
  b=dQLmm7U3THbHU2e3DI8D8pAkFNHlOVnVPwvpnbPPQ1gLijLTDdATQODE
   2lwry6v2Agk9FiIi3a0tzkCPnBBfqQIAjh34O5sLHQyfyP8dvI3KzrlwS
   9+I+Wv5eVv8Lcs9gGH9lHLm2uBx39LLdcXxIxznWEXDVV/Te358GsVPXm
   c=;
X-IronPort-RemoteIP: 104.47.58.101
X-IronPort-MID: 106936396
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:eZswtquefJN7MYSYevkAzuEfX+fnVFJfMUV32f8akzHdYApBsoF/q
 tZmKWvUOf2Jamf8Ld5yO9m1/E8O65+BmN9lG1BkrSlnEiIT+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj6Vv0gnRkPaoQ5AKGzSFPZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwIwINax3Au+SM47+Fcu98jMMgBZKwFdZK0p1g5Wmx4fcOZ7nmGv2PyfoGmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osgP60aIO9lt+iHK25mm6xo
 G7c8nu/KRYdLNGFkhKO8262h/+JliT+MG4XPOTgqK8x3gbCmAT/DjULS1rnguu8yXSgStUDB
 mE7pgUwqI09oRnDot7VGkfQTGS/lgIbXN5LO+k77hydjKnZ+QCUAi4DVDEpVTA9nMo/RDhv2
 lrXmdrsXGRrqOfMESvb8aqIpzSvPyRTNXUFeSIPUQoC5Z/kvZ03iRXMCN1kFcZZk+HIJN05+
 BjSxABWulnZpZNjO3mTlbwfvw+Rmw==
IronPort-HdrOrdr: A9a23:kuycL6yUybz64TzpN3/lKrPxWOgkLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9wYh4dcKO7Scy9qBTnhOZICOgqTM6ftWzd1FdAQ7sSjrcKrweQfBEWldQtqJ
 uIEZIfNDSYNzET46fHCWGDYqwdKbK8gcaVbInlvhNQpE1RGsNdB1ATMHfhLqQ6fngzObMJUL
 6nouZXrTupfnoaKuy9G3k+RuDG4/HbiZ78ZhYCJhg/rC2Dlymh5rLWGwWRmk52aUIG/Z4StU
 z+1yDp7KSqtP+2jjfaym/o9pxT3Pfx19dZA8SIq84NbhHhkByhaohNU6CL+Bo1vOaswlA3l8
 SkmWZoA+1Dr1fqOk2lqxrk3AftlB4o9n/Z0FedxV/uu9bwSj4WA9dIwdsxSGqu12MQ+PVHlI
 5b1WOQsJRaSTvGgSTG/tDNEzVnjFC9r3YOmfMay1ZfTYwdQrlMqpF3xjIjLL4wWAbBrKw3Gu
 hnC8/RoN5QbFOhdnjc+lJixdS9N05DbSuucwwngIi4wjJWlHd2ww8z38oEhEoN85o7Vt1t+/
 nEGr4ArsADcuYmKYZGQMsRS8q+DWLABTjWNniJHFjhHKYbf1rQtp/M5qkv7u3CQu1E8HILou
 WObLpkjx9yR6q3Yvf+nKGjsyq9CllVZA6dhf23vPNCy/7BrLmCC1zydLlhqbrjnxwlOLykZx
 +CAuMrPxbdFxqQJW9o5XyNZ3AAEwhqbOQl/vAGZnmpnuXnbqXXi82zSoejGFOqK0duZl/C
X-Talos-CUID: 9a23:CwBjVmPFkBBs7u5DUxtn8UNXJsYfUXDj9HHAKUi7ID0yYejA
X-Talos-MUID: =?us-ascii?q?9a23=3ApoxfgQ1cLehHIDBIHB1PCjwuQDUj/rqvVGMflNY?=
 =?us-ascii?q?8pdiDaQFdFGuykjGSTdpy?=
X-IronPort-AV: E=Sophos;i="5.99,244,1677560400"; 
   d="scan'208";a="106936396"
Received: from mail-dm6nam10lp2101.outbound.protection.outlook.com (HELO NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.101])
  by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 02 May 2023 13:06:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YgD8TOJONlkQw25NijJg44RvScBVqfaweUuPM70FZUyy+yACgCcmhYTKs+ihqRoGZRLeQkB79gl/OBAUQGgDlDjvdh3sFs13WZmo+fO+qcSpBDP8DijvlckWQgV5CWDnH57rohwAGRRq+bFNhKILXDl3bfxei5m3UXvUPu+M+sUVh2AinSoyY4FXLpo+E5yhH3kfybr0L7b2csDVaKt+7ktu2LVz/AVaxEiG8kBYKF+FAuStkJrgGzcEckQXXF7H47C0Sq5xGk73E1L5K1slPaJrAYiM2jN+EL3LXbtYfUCWuqtdV4sgLltj0HMjt3bfdENO3I+js234DlVwHThZ5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HdO1UgaGkYzMPMQDuKOugvKKvdaobGCci7P0+roVKX0=;
 b=WeNTlV1Au3b+GW1ApdVCe5UJuF/8xZfEAAPUB445q0lrO/mbAiJbGp5VdS4qLhxVyp3AGAChybnuFVAoJE69Q1jMLjJOSjeCs3qwXVQnAE9Ad+ugtmkz4AVgnFyV/nvg+HdvucGd67oitfrBjDeaBTLrc8fGvFOzIfTH0ZZnhMaKsvnoNv4vaDFKvaTW7D4uD7KWbJRlhCtr8sgAVws0vPGfiVb+u+9pcsLOXf/dVxoTFg3sAZN958fQsAsPNu65ZweO9ovtF39eqWMNsJLqLLgUrZyUXcSZ4EZlK6D1VaNE1/7rKg7d6zWijcaMggVu1X3YqDLMMfN5+qujooGzmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HdO1UgaGkYzMPMQDuKOugvKKvdaobGCci7P0+roVKX0=;
 b=A87HLeExhsufvpiofniSFFg0Ls9u2R5BriYCvI2g2vJ+P3pgwHYUbbTqyKirwArvZYioieVtJZtr+g2S/S5ONwI7E0dIFKu4frOvITsDfDcwsny1nVm0aN91FO3QDZrGbWNfUo8xJD4rOUa+qks7+4rlfmOUTeDZr5EexQXvmK8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CO3PR03MB6776.namprd03.prod.outlook.com (2603:10b6:303:164::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.34; Tue, 2 May
 2023 17:06:21 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb%4]) with mapi id 15.20.6340.031; Tue, 2 May 2023
 17:06:21 +0000
Message-ID: <4e4757cf-7351-9aff-fada-2b03ff82b2dc@citrix.com>
Date: Tue, 2 May 2023 18:06:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-GB
To: tools@linux.kernel.org
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: b4 shazam in a subdir
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0642.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:296::11) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|CO3PR03MB6776:EE_
X-MS-Office365-Filtering-Correlation-Id: d624d502-df41-46ed-98d6-08db4b2f8d2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	F1YVQH/0l+bKIafQK4f44aYEAjlAK8tD0EaXoUI4kl45VukC3WHqhGqBx3JKKnlyXWD8sdfuzY6I0spnwjayJO0u5Wao3eIaHitNh2NrM4KetnO7tk+58OOjh5ksVrguSV0YBEmZyR6eIcFZeyjWNPhOZCE7Ln5jXw8ugm7vbWgnkFOEfbZamd0767Ya2ndYSgWYgFQZoC9/pzz8c3ubNd6NVlrtdFI/tiS0VN+YNy/+Gq5AF+DzW0edkrDpBWxgci65jQoLA3Q0ZtyK1XNr0Rh/canBLfh2ldDUDyM4jQcK6aG6GSzqYzA8QoDEG7JyBUcoKKMf0wUDOilFBxSfiaZ2vqUn1HCuyj93KHElOR9Ccqn3RVl2DX07AJOjTG2Qi2GIHhQjv7KRR7Nv0VoQQ/mth8Ldu+/Wh7rCzq8sGZQXzkbFkfCd9HZlIvv+8qdRnvwCZPGoSSe713R24IKl3yzXYd4mOYbaV7Zg+CYqL6KJl0SrNKyzZ49J6kTohkEXPTaoH0H/IR4Ki+YPSaNBgX93FdKunyTSmY7SCh4O8NwPp1qqWA2oCUygN1n2yUSnG3lfL9uIn4VZ7SGE30vpQ04rrKN3umoAZ2e5a6t/WzyeSxwQcZjUCvY+YZQX0lUY0HQbSRIANDGT1roJMWJflg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(366004)(376002)(136003)(396003)(39860400002)(451199021)(6916009)(31686004)(66556008)(66946007)(2906002)(4744005)(66476007)(86362001)(31696002)(2616005)(5660300002)(8936002)(8676002)(41300700001)(316002)(36756003)(478600001)(6666004)(6486002)(186003)(82960400001)(26005)(6512007)(83380400001)(6506007)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cmRDZ2k1dDViVmxrb0lMb2lJekNwVGFVZFlpR2hBazVwVnJYc0tIbG1mTWh3?=
 =?utf-8?B?TXBsVHE0SnFYR01ZcHU1Q3dTWW14SThqWU5HckhEejdacGhkczNWbFZNanJZ?=
 =?utf-8?B?SkdlL0xmT0w4dDRhTklTTFJGYmxSTC9aMTEvcThvd1M2dUt3VkxRaHpHY2F1?=
 =?utf-8?B?eTJJTUVkK0wvRkN0bDhJSzZFaG1DNDlsalVpTlUzbU9qWnUxclRTZUhhcXI5?=
 =?utf-8?B?THZFTHdLNnVuN0xWVjNyalFaRkxLcWZvNldSVy9oZTlGZTVneWlnKzdCNytv?=
 =?utf-8?B?ZTh3R0dsTWpUNEJEdUFONUpPKzZ0V1AzYkxtZFkrajB1M3JGeHhXdXd3Z0Jl?=
 =?utf-8?B?UW4yZGJlWmExV2Iwd1B5dW9XLytYWmp2ZFM5T3dMdVYvci9DazJVaXVxaFNQ?=
 =?utf-8?B?SkswYmlESit0dGVtd2N1Y1NQOTd5anVTM09ENzQyMlhOVTczVUJMSitObjVr?=
 =?utf-8?B?b29MM1VLVmx6WDg4UFpVK3NTREJDT1hvZWhaTCtBNHJrUGxPSXc4eCsxNXFy?=
 =?utf-8?B?YlkrK0FIQjJPNkNsanlneGZMODRJa0tGUTdaZVlYMm5UbUE5eXpyUm9vWXN0?=
 =?utf-8?B?OE16bVpUZEo1VlNDVXZqOE1vejUwQnFCMnFlQTNMT3pXMkRjSVBhbUREdVBL?=
 =?utf-8?B?aFlvQ2V2V0IzLy85NklIaTJHTVNpUm9qVjFiVGFHU2IxTmJWaUdVajhzcmpS?=
 =?utf-8?B?bGxyZUtkam9FY2dTZU9iWlBTcURROWZRb2s1L3IxaHgxQlMwbXRjZ3ROZG9S?=
 =?utf-8?B?aVM1Ym14ejJHamJuSEh4MFRQeWdlOG9CTldlZnpOcngvaDRjcTRQWnYzWkJo?=
 =?utf-8?B?Tm5ES2RWd1JFdk1xOXBzcXM3NHRoNkpwYjNyZUUrNnF4VFdQYkJwdmJOcE1B?=
 =?utf-8?B?ZlZSdG1ZV2JYMDIxQlVnMnNHN25JQmxiQU10eE1UVVdSd0taVk9vVkpscVBL?=
 =?utf-8?B?VlpRTWljS3RuUXlJbUgvTklKUDZCSGFHeHppWHk1UzJDOXhnSU5WKzJNaVpk?=
 =?utf-8?B?bGhPQ3VyMmo5NGlTTGFaZWJHTklEVXRDdnpPV2F4bm1BY0NiRHhVUWJCcUhn?=
 =?utf-8?B?TkRrMzlPeitmSmJZZ01Hbit4YVFvcGllcHArUWxodGN3ekprcUZSWWQ0V0I5?=
 =?utf-8?B?blQ1NTJMcURuUFRGSDhPZnVxenl0dEg1WnFqS2hXeXpiMmdlZS93bk1DRlNz?=
 =?utf-8?B?amVDM1dob3VESmlUZUxKSEdSaGNaWFBoNWZKN25XWit1bGh0S1pLc3ZpdUJ3?=
 =?utf-8?B?QzcyY3FRR3grUkNOaVFHTXdyVDMrczVGQ214T2VnRk94NnFxZFhFOFdYaDd0?=
 =?utf-8?B?dDlsSEFJNEhHL3prYkdZRXdSSERXWEgvYmhyUXB5TldEeEl2amxOdFZ5Qmlv?=
 =?utf-8?B?T01haU0rZkIxWjVGMXFTRTV4dmdKTHBBYXlNenhTd2JGTi9JdG8xRGg1SFRq?=
 =?utf-8?B?S0F3SC9heFNLRjNUUm9SS3MyV2tpZE1zTzdtdjJGSVJGSFozUDRhcmpnazRo?=
 =?utf-8?B?OU5qWGFsMDZXL0o5RnRXVmlOY2VRTGs5VGdYU29BUmg0SklHd0NuZUhqTG00?=
 =?utf-8?B?ZHgwMGxXQVVnZzBQMDZhRUdBc2dKeG43ZzVSQ2lxTC9UM3lVR3Q4aytObzkv?=
 =?utf-8?B?eHlpOXQwVmF0OGJzODJleGpmTUZia3FKTGd4RDlkZWxqM2dFUU9nZzZWUGs1?=
 =?utf-8?B?dGZrLy83Y3ZWUWVBTmd1YWh1MHpSSTMySCswMmQ5K1BLZTR3NFVMdG9VQWZN?=
 =?utf-8?B?Tm9jcmlHSFhGbVp4NzJ5YjlodlZodG01ZlZRR3dSQ2s2WHh0TXJsb0YwbkQw?=
 =?utf-8?B?MmV2OWx6bHhXblRXSVpwQVBKeEsrQ1JGS0xBcmlDWVdMWk0wQWEraGJ0TWo2?=
 =?utf-8?B?U0FlcExpV01lSm9IQVJ1Vkl4U1BLT2wzV1dnS1VDdGFwdVVyT2dZUy9MQTc1?=
 =?utf-8?B?WlFqdXh2TmZLbjhJOXVja0FWVVZkUUxEYkgzZ2UwQVNQMTJ6QUJVMnNaWGpq?=
 =?utf-8?B?Unl4YUFrcG53UTZ4eTJwaDFjeXd1cVRnUXVqTmVSSjhYQklwaERFaGU1WXcv?=
 =?utf-8?B?RzFGWnlEVldnNG9uQ3ZmYytqQ2dTRFRwUlZ0dmZRN0d4QlJlWjBlbWxXSi9u?=
 =?utf-8?B?K2pML0hyNWQwWi9OZm91aERzNHNqczdRU0F3SmVqUXc0UzlScDFpR25vY0Vs?=
 =?utf-8?B?TFE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	21K6ODkUwjXmoFc8l2onhL4heI8ZstGyxzNdyrXeDTeaCbnycOKstq2tDuv8pEI5fvcCiqfpiEakyjyoYmQZNfVPUX8wPk6L0b9jmweOr2BmDZU9mIh95aePp2pV1J8u16oCORxD8utBOc/Yt99A8zbEEGEXuLKUvd7vcZl0Kyqjd7XR1v/xG4xYeT0FzXImc8Y+5Xy9XAnHVkNjGFuUoZqaA0NDMhS1l27zrInt9HTIcG5X3DUWlKHefH5A4FWgz+QdTIyGp8VFLUvjwu0eUKjR8dBwhOMX/n28NuaVGwIbooPR1ldhw4k6KwseMWwLmbz5BKM5M1OT+ftguULP6bMwbvv86B64Lb5MtUA4z5wzHG37pCPOlTHJ7G5WtEOWnd5Vqjl26StayI4c7nN11oBjnCy+Yg9cD764aXe3SdZRsBFxQY7O0GReDvt5xcrrwgy5nfF5BVH5ckMX/rNAUVM3fa6jLsdeyGCEmUqCKKL7UB4W/nvsETpdAwpA0hzMsAp5OKuhpfiqsqRXAuqwAiOf+jhS7gzrCsC+i4d2A/brCqF2IeyowXQBXKpueOKs9dahIm8b2eNysNBE/EaV4TujnLFimVPYE/jtY9rTAzKNqbNuo5bIXk1+xD640u2iDS2XXiePMgeZAnzSNnULCJqIZYjlx41jcHDaR12igf7KFZOWUsU2HZrOAvpJM8vxOGIS8X1dCWQlyyxVdWK+KqfRtU6PK7AkXhKxBM8jHgbQXQZqMTz1JdutHBqrf+arIeBYPnT083+x6LITJxr4Pg==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d624d502-df41-46ed-98d6-08db4b2f8d2c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 17:06:21.1389
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 44U0E54XGdzN2R+SPJO3y/+oSJxNsa7BaFULIMT9IwSjhnNBVxVVPkziJSGQJRZiSOl6Xc//8XpSBzzC2wB6Fh3urYYwP1uUVFWGDdwj86s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO3PR03MB6776

Hello,

When using b4 shazam in a subdir of a git repository, you end up with
the patch(es) applied correctly, but also the diff structure expanded
under the current dir, and the working tree dirty back to the state
prior to applying the patch(es).

Running from the root of the repo leaves everything in order, but it
would be great if b4 wasn't sensitive to $CWD inside a repository.

Thanks,

~Andrew
