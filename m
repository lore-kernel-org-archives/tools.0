Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260C2610E
	for <tools@linux.kernel.org>; Thu,  8 Sep 2022 22:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662675741; x=1694211741;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=BKVkrgJmAwecw2a+lKH8lqB/9Kz5U+GQAY4W/ijmOXs=;
  b=mAonu4gEZ3ILICkw3Tj5/APhZqZ82C9QhK6GxsJzvFF10fvAU5RDX0P4
   +cM4khbgqFvJQJgig5lA6fxCc2gLbgKBFfoSv0PzPV/F/12IwabZ4U+po
   icw414FHnmyFhTPtI1+Y5RX4W5vUiJs4dzxwf/yc5xL2F1jUFNm+66s1z
   FxQYKSFtDms+TFWU5emSjpRpgYpUv7DF42Vm9yLU1j2uabkZByjTzcguX
   3a3+R4fXcFu0g0e1+DfU8uAW39OAjwyov1lvmRWVcaabbE/lUxLo+xvhX
   iaedl834ZX9nUHzvQziwOafFAJ0gZmE7cOPDDpdPwuTxRdx2wsi9jbOtq
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10464"; a="323539609"
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; 
   d="scan'208";a="323539609"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2022 15:22:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; 
   d="scan'208";a="617632728"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga007.fm.intel.com with ESMTP; 08 Sep 2022 15:22:20 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 8 Sep 2022 15:22:19 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 8 Sep 2022 15:22:19 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 8 Sep 2022 15:22:19 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 8 Sep 2022 15:22:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fIkOddbuJESiy3X9dqXDuQHXuSj/M6hpJdNUwGiatzvrJ7206HHe1gpyy1vSFQgrghENdPAt/qBNagvNHZVJydnelIL6pK9GuZx339O9szr2PQU7IOcxqw391HygRcUYH9prKHVCufHkmpT66pVpxqunignNPT1xyD7xg3tbm8BmI9yUMl04IYbnVNs2PQSoUV+8rc0nkbar3zepGiri6pga1s/ddvSic3lAjyMn8B1OdP1rbKIwCt3o9Fp2pm10Hchuz8ysaqgoMuqOFXbL93Z62tZrGfw5wOT+XTtpoVN3Qr1TAHkeeOTQm66riVVZffk4Rrd4HuKGN033sP9Wgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wzD4ZvWv08vtmGWF5r1PVabHbXaokcbdU2yMuUKHc/I=;
 b=d1nGB4NAh+u3GszF6Ryda4dFazab9aAL8r6QuFZxeKBNn8HeFdAwiRuI8uzbjz52pnXzoBN8YEOUv3X7d7hgzj05Wi2JLQ+xVlktRqfOlxeJ0jcPQ1LwlGHuqXhDMdN8RI6q6TRjRO3NjwDyumuV1a9ZQRY7YgDf9HcljpDsnMLaep5g+CQjkZIFuRwJBjHV+YlKIzoJjYbAt/41cLu2OsIskmf2nglXpuIyoDxns1R7bknoCUBtHWfYO/48ePUxaO1INeJKj2I0VQKsIRqjrvucwtMG9SmmpT10uQyIi1ii1YQN/tbB5YYDj8IS1lhPVFFOEDT5Ei4tN4CmrXazDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BN6PR11MB1955.namprd11.prod.outlook.com (2603:10b6:404:100::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Thu, 8 Sep
 2022 22:22:14 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::211b:a022:39b6:5d2]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::211b:a022:39b6:5d2%5]) with mapi id 15.20.5588.018; Thu, 8 Sep 2022
 22:22:14 +0000
Date: Thu, 8 Sep 2022 15:22:12 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
CC: <tools@linux.kernel.org>
Subject: Re: Couple of bugs(?) in b4 send
Message-ID: <20220908222212.2ofc3atbin2k3fm4@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20220908201359.tlm3tlykpsm5j3iu@ldmartin-desk2.lan>
 <20220908203914.yxgmjm5tsk7jvfoh@meerkat.local>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20220908203914.yxgmjm5tsk7jvfoh@meerkat.local>
X-ClientProxiedBy: MW4P221CA0008.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::13) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2047cd3f-21d5-4116-32f2-08da91e894b5
X-MS-TrafficTypeDiagnostic: BN6PR11MB1955:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8gTjGaeeQ01seA0L0arPseIU4vr+dBMp5vlMPzn3N+1ln4bKF7yV/0imwmwepGbjFQg4hVtbyGsaONBEPpsMRYqLGWIz0KVhB5w0w7xXmnC6xamPp8WmH/576+4jYAzz0KfwpcmUZCgiWih56HbHofZms+k2iRzORPqr/t3CYqrtlkEmzQtgGLNaLgMtpMqq5chINoTvv50tDAFDd4XULkAYDgulcKJHFFjFSS49V4TpWzhaI/ZF/qQ6bj8enNKtdZcuSjBhIvffN9oGSP334NJ49NxvnZKfGqQJo//C/kH+F92Q85Auz0j7yE+1hQTxw4jD9e5QZ6xaacIgFjrFFB/V892r1XYB7dhMAiK4y9tky+sFacoZa2QTT34bbS3FrpVEOuv69BoxQ8kWMkoZlw5HM2jY9z1IhNQXKXzn9OBI/bGZWjbWw8Y3d9AGYS/YjHr/SfFn1at2YiATJB3weJKhD2T62cU9roABwk5Wu017GLvG1eyDDllW00iyokfaKvAEzHhBJrFC1M87WkxTit5wwtJbKqh1/pdkKSP74HrDU2/O2sAfI7CEyBNuXhH/H7DlXFZzuDkyK4khgH+V2TPFhCoyS7nnxiuTS9AuAmtGMu2S1CQKCtWzHMFGoERupmg2iZKJbvi7jAJc3TgIE+v/TjMKhqacI3CXmfuM08qprzryTMwFhKsjTIENPoV2VPLXZgOq613WmGrUQ6npzg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6139.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(366004)(39860400002)(346002)(136003)(376002)(5660300002)(8936002)(478600001)(6506007)(36756003)(4326008)(66946007)(66476007)(8676002)(66556008)(2906002)(38100700002)(86362001)(9686003)(316002)(6916009)(83380400001)(6486002)(41300700001)(26005)(6512007)(186003)(1076003)(82960400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eojrq52Bx6+GzQNqnIQcZD380pgCec35EuRGL0tFm2q2+uNR1wcXE3ydlSdG?=
 =?us-ascii?Q?8EhuV6OsEIx05Yy4NyF98ZJWNiE/pldXGD7eKRIxiBkKVwI+TI/4nmGdvSlG?=
 =?us-ascii?Q?CKndYjt9AlB4ZhmowzL8rFUICF8o0nmd8sTCA/AGHt4ShtZ2SXFa52Oc6ucQ?=
 =?us-ascii?Q?Mjetx4Q448+23Tnukfx42BrSr7jntAbkxV9emoYpt2Zh/xnxNY1cBZoSQbDQ?=
 =?us-ascii?Q?ZBaxcRMYxq8XHnlhvRei+znG6ddS38x5muQ7ePOTvMQlE26VJAfD9ie0uTYb?=
 =?us-ascii?Q?9HBPVWNzNDWmEqKuTE951uD5YTWyjh39q/Q0CtallMxueL1o6tnWFJ1ANtUk?=
 =?us-ascii?Q?zwOy+wGxrQXjsJJKZXSbjnuos0f0eAUzaibu4GujCnOsb7XZe74kpygHk5Py?=
 =?us-ascii?Q?V3RY8vDwQyt8cZqUgcAed/9D6Qm37J5D85D5KqMZj/UTu4F2b/dvpbKkEdHe?=
 =?us-ascii?Q?A45iQ6rlz9Fa85R9PCy/WMPgxw+n4ZFcr45VXBzyHgljFe0iuKE+O99jfU4d?=
 =?us-ascii?Q?cR4Sklw6B6AVa+rwJiFmjelrgQ+LG8hjDVLllA9bKtIpqMLGKnfLJ7XebEjM?=
 =?us-ascii?Q?GBFSVLuYm1FkVpEoe+oqbCFe46Gy4M8+4O+lWB/D8uMP8vk1J6bwL2b9WWFj?=
 =?us-ascii?Q?ErG9ZJalnukcFRBSIbGEa1tx3Q/ZHRMNgwAAb0N5emt/xTghRouFv9wlsZLQ?=
 =?us-ascii?Q?KPr21vFeJ7NS+CojDR5V5AdN3M3YwF27OgT8gPnF3laLjtDA86BmCvRdaorU?=
 =?us-ascii?Q?O1hK5AaPDqlPSgbCIq1c+NfCkGjnSePzk4O1PVwug1FrEARPJEt5uJrOuIN/?=
 =?us-ascii?Q?vPem/nmAd2EqAWMdcTgO004AD2HMCAbyzw/X3Fyzh5uwokDoNOMC2p8Zp0l2?=
 =?us-ascii?Q?EUlCgTB1A1bGpr5xkPvRAZptA2ZeHUAHsjUFzMMT4mH9IGtymmZejlAjq99h?=
 =?us-ascii?Q?Ccpc2qty17halcvSAr3PF4V3MjO1bS7dzl7u05BI2Ml3GUbYcZ70K+w2ukSC?=
 =?us-ascii?Q?y7lw3dh+5YEL+hpPvZCZQypFKzaqJ5iBM85DY50xrvtlyazBkgrDMLdVhhKM?=
 =?us-ascii?Q?ahFCdTRTAdQ06BLWzM17PlmMoubxO1HWU5KKEa9lMrbc7UHKUx7FegVOgjcq?=
 =?us-ascii?Q?LQw7f4r7S9GCxKwockvCE6t9/7Qq4Zr5hKTiDCXGfjG6dwiPScp1jYZY+73f?=
 =?us-ascii?Q?Iq+I1iOuAnZbme1oknfQdU6EZy+w9vGKrSXAGxfnr9LnpL82thrZ5z118xQi?=
 =?us-ascii?Q?hWxtOCWiLVrIbgjL5E8MEkozS2TbSKb1efcX1HvoQWBrulk7Rz6xXz3pkigg?=
 =?us-ascii?Q?L5WcLvN7g9DNSjgJr9BtpSnwN68rpsslt4f0Tq+0XCQf+LR6+2UlhTqV9VcX?=
 =?us-ascii?Q?SoZk5w+VijFSA1pe+1Pf2VrBnPGeGvyloyXE34AtCpsDaCs5cFJ5+xaL8xOf?=
 =?us-ascii?Q?U4L521pP8EDRDh64wXSE7HHsKxn+8moWtzCjkypVzY5O+wQ11ozB5lPDILAK?=
 =?us-ascii?Q?ydIiv2l2DwKty6wok9dvirMEFcrXX6zlW1EmkQ7B0RymSgyXuIvXDIIrvDqd?=
 =?us-ascii?Q?OJsfbG8Z/dFmSlMgmeb2CtMqcG7PyOSFaO/wYJKJgQZzALZoI9DUH4Q6eGFo?=
 =?us-ascii?Q?cg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2047cd3f-21d5-4116-32f2-08da91e894b5
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 22:22:14.1251
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k3rt6ZDRWs5i4UT10PYXDdIGcExGj0mfCsxhy6yWXKOAw3lrEWhkuJJtCfqpIdiqQwNnnV+fGoQLcl+zdOQN3EgEsxl6ahGbP/xlM6Kzvj8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1955
X-OriginatorOrg: intel.com

On Thu, Sep 08, 2022 at 04:39:14PM -0400, Konstantin Ryabitsev wrote:
>On Thu, Sep 08, 2022 at 01:13:59PM -0700, Lucas De Marchi wrote:
>> Trying the new b4 prep/send commands. I used some patches I had and
>> just created a new series. Some hiccups:
>>
>> 1) --to/--cc don't understand aliases
>>
>> I use sendemail.aliasesfile in my git config to point to
>> ~/.config/neomutt/aliases. When I try
>
>I'd say this is a feature, as aliases may be defined in any number of ways and
>I'm not sure we should try to locate all possible places where this may be set.
>
>The idea is that people wouldn't really use it via cli, but via
>b4.send-series-to and b4.send-series-cc, e.g. for a project like git, you'd
>define:
>
>    [b4]
>      send-series-to = git@vger.kernel.org
>
>I'm thinking of automatically including git-topdir/.b4-config when found, so
>repos using b4 to send/retrieve patches can predefine a bunch of b4 settings
>relevant to their project.

Leaving it in the configuration for me is a non-starter. For
drm subsystem I already have a few mailing lists that I may want in the
To header depending on what I'm touching.  Having to create a separate
worktree for the rare moments I send a patch to nouveau for example
doesn't seem like a good solution

send-series-to in the configuration may work well for projects that
have a single mailing list, but that is not the Linux kernel.

I wonder if we could have a configuration to import headers from
git-format-patch, so even things like format.add-header would just work.
Then Cc/To would already be resolved by git itself.

>
>> 2) --no-auto-to-cc either does too much or too little
>>
>> I want to Cc people who previously reviewed the patch or who are
>> explicitely added in Cc in the body of the commit message, i.e. I don't
>> want --suppress-cc to be given to git-send-email. However I also don't
>> want the get_maintainer.pl to be invoked since I already reviewed the
>> list of people I want to send the email to.
>>
>> If I pass --no-auto-to-cc nobody is included and if I don't,
>> get_maintainer.pl is called and a lot of people added to the list.
>
>You are right -- the current setting is mostly for myself to avoid spamming
>the world with fake patch series. :)
>
>How about:
>
>    --no-auto-cc  : skips adding addresses found in trailers
>    --no-tocc-cmd : skips executing tocmd/cccmd (get_maintainer.pl, if found)

lgtm

thanks
Lucas De Marchi

>
>-K
