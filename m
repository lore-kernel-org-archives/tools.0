Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15165CA6
	for <tools@linux.kernel.org>; Thu,  8 Sep 2022 20:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662668044; x=1694204044;
  h=date:from:to:subject:message-id:mime-version;
  bh=433HeI5m0bE8Chp2sFvBEZZtJT67H8NCaULA/HAEwAE=;
  b=XdtNxbwQ3tnK/lSpkfzUd0xtrC5AZ2kXkeOFo9+Pq1fuYXXNn6ttLzzi
   ac+3e2nJ9VQAuvRAhubf+SgwlpsaLblQrbDLMLnXHljaKc5eCSxxwVOjy
   KukGPaR9IGouPueyY2JwwcRMCHrYhgN1xiy7FrSzNP7VdUozukwbnMjlT
   W1MN7cmIBMt5FpCEn1q/NFC19zC0/yzvU+lg8v6kHHcCBySUUnp9RqAMl
   lDvk0n4lCV7Y3l/pyx3Ovmt4rlwD2u5HFJAeMTB6QK3U4F5kaVFZ12lyv
   8CNPfwiarnWRNAmcwunC5SWG7D1nbPsGkw0fgwW7q7qQCAMz/0wf5Fh86
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10464"; a="297313544"
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; 
   d="scan'208";a="297313544"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2022 13:14:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; 
   d="scan'208";a="615024670"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga002.jf.intel.com with ESMTP; 08 Sep 2022 13:14:03 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 8 Sep 2022 13:14:03 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 8 Sep 2022 13:14:02 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 8 Sep 2022 13:14:02 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 8 Sep 2022 13:14:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W2SgIqv0StE+Llyk8Wyg/VdsnDB31Jg/Dn5SLj40XI8QYjzJSqJUfnScJWhHEnAHJ26xjQFuODRFaLqnBVoqyrXi6rCqQdmUr9yKOQ8IG+ttI31xDoSzPb+Ep1Kfnnh1Pzu46HTUXrYk9D21jkhqXSt73zIWhafU3VcWr/l31R4pFZlaPwj5Y5vfLx3qQ6I/+sw/a7Xo2l5czvv6YB8IpKaAD+Q2l2MynoAjMSF6UDwlPZ/cfO7wb4BRsYzOhXRrenhd8nCKY0NW8rnT9w/Psgg/H123WTFwJ9+H5u+u5Bk38wVnP7wuRFvtowwK3fTNU0iL6IChtjOCRSAYxHLTTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+yg2VXO0iYE3aYlGhrzvIdcWtj+8p6EiQMM9XA8bMGQ=;
 b=kW02CFldWjRA9zsT45T52eCbp3T4JDAGMZL/REcVbQLh4Fw3PQ2fl5mahBsdCPfbg1wUkOrYQogtU9yOm4Kq5+an0JJYrUpx+NrVUyMsEUjvRQc7gcFVovmiUDiz88Tzu1TWSd3ouuLxoorrOlHHjzaznLdPJIAwb/50UAUsCOdXNIiWFH2X1xC+urLAfhwL9bI24ubrL9HLu5KMI3PTMh/E09k5cVh2+Y5LxmLH3EzinKzU1LcpeHTeg+76MceSvmjVOuGpGU7fLbz6tFDRbo/PZXp4S7GRpH19H+7kczloU2jllEdeo8y25QBR6KxLsUygcEx+xjboJT0NYOG/zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MWHPR11MB0064.namprd11.prod.outlook.com (2603:10b6:301:64::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.16; Thu, 8 Sep
 2022 20:14:00 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::211b:a022:39b6:5d2]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::211b:a022:39b6:5d2%5]) with mapi id 15.20.5588.018; Thu, 8 Sep 2022
 20:14:00 +0000
Date: Thu, 8 Sep 2022 13:13:59 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <tools@linux.kernel.org>
Subject: Couple of bugs(?) in b4 send
Message-ID: <20220908201359.tlm3tlykpsm5j3iu@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
X-ClientProxiedBy: BYAPR08CA0012.namprd08.prod.outlook.com
 (2603:10b6:a03:100::25) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c4709695-3635-443e-db2c-08da91d6ab1b
X-MS-TrafficTypeDiagnostic: MWHPR11MB0064:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sjiyp8TcSswEFDj9QK6HF6s2rf62PD2N6xys8VF4oWtOgENfFKkdbfbvoaXQBSYmPJfwvTQs0NXbaNsMTxtfGpQvTfOM/MVyeSN4ksf7O0CEtkv9OMczDzjvkemwu5O7CuhfTEOi09e0yRNpUkhi9v6A9R3sdnAUuG1xIdzlI5FVWzZwGr+5rKQCvk17an7qqmyl3rHWcxLAVhkAXWVw02OHAIqhTi3ZAhQdV2UATl74zrfYh5JYSl30v1F/xUo4xPZFo8bojyNYkRcS2vCzKKkekrqnu5P0Y8en8yoKXSEq+CC5oow7i0XWHO2y42WWd1bSoY+PKZ4Z/3HhSztp5UTM1pTQ33A/18R2+tVjUaBJ+tlvykUXW6wDGCWMY+vATRpg7jvfPn9J257DyUuNGUfnX3TnP/xa6MtuATxsDT/+m4Bc3LEFu/BKShUzmj3UzdaPJxZa9V4LrFXqarEtEIhdfy0xbbkduUtnmIv9+Wsv/KPrJAa8gH2Hb9nawEQL3goeSjXGr3ETPYv1TDxRE2mgjkzojzR57XWm0QdWS7gPI8HuHPEcmiU6dAB4BEo6PcYAyRbkFSSDfooysRTVaOTEQh4//iysNJGDL58p9KDZupsKcoSKQsi9ce9olxsRUhRc0TV+tzKKOujaDjV9cw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6139.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(376002)(136003)(346002)(366004)(39860400002)(36756003)(82960400001)(6512007)(26005)(9686003)(1076003)(5660300002)(66556008)(66476007)(8936002)(2906002)(38100700002)(66946007)(316002)(6506007)(8676002)(6916009)(83380400001)(86362001)(186003)(6486002)(966005)(41300700001)(478600001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/1sQLx9PgA7uVQgZ08bDzvkxg+ZhLfeF1+AF3fYDAn50BFxj3DFXDQC51lXm?=
 =?us-ascii?Q?K86NtGnowfhPbHdVP7eIyME6O7yC0r43YXfAq1q+aJQcNZW5XgFwsnIQnkRl?=
 =?us-ascii?Q?A9hShPYaqE44RvDT9KuvbWPvUsNHfsLfmxbW9cKXoOGPWoFEwcQwbixcxGmn?=
 =?us-ascii?Q?5gDzkBEM4Aqu/M4n7rkJfOPhE8dpgAZgbqIcDwc5evscc21bFzQ7m7yQaTBe?=
 =?us-ascii?Q?JarYB1pD67+Lkw+lXRJy3eCaN7tcM2DCkJkLS0TRHE9+Z5TiEfARj7CTWMef?=
 =?us-ascii?Q?UkgaxFt1Q3tMxGSwuJJ14T4RLlZSOU+YaigfrplxcH7P+ooRLozbNb+/JiAz?=
 =?us-ascii?Q?T5S49t7/NKDKkkHWqKz67h6H9Xy+lxrBobbrWTEX0IaLitrm41H7aevstsXL?=
 =?us-ascii?Q?NUWKgLPSeRcihBjaHbp4IcT58o/yzC9x5xHDEnAtfS0lzX0X6b3XDhAIfXQJ?=
 =?us-ascii?Q?UEDUNRK0c4jhaRFtdkofOZFWdUC1mny1wa7R/whvVet5jH9oTLBjy9kQ73XH?=
 =?us-ascii?Q?zXAAYOPh23v3rRmBhXJlX0Woq2W5VlUzkldSzdxcqOQhsySWvFAkH0N3/FD9?=
 =?us-ascii?Q?Pj719uU3gcrFscuggmwkpVbi7IBqyE3Zd3ptdy3+BNcFkyQOb6EPMRMn0hAh?=
 =?us-ascii?Q?DPUzaOQ8cOq+jSaSU/jwDHvc32fk2ZnvlMwFcdMlWEebyV7JUXtYcxa8NL+m?=
 =?us-ascii?Q?aBOX19jVvK1aFnKLKVViQ5xIykKl+zdrvNfOTbhxiP/TZPpfDAcMS8vbyxbC?=
 =?us-ascii?Q?JN+MD25MV9FD2X8FlgnN15vVEx3M0MoDvimYGT6L0St1texptDCu0sXTXaUg?=
 =?us-ascii?Q?nWTQ3eUavbSKUOq92Zd1CFDSSYyb8ttuty90x+oPHhv5gXmhHKQ3/Pz6Wjxo?=
 =?us-ascii?Q?J3e3E6OJHXafz+b4ajRJb9M1T0/uTNzmWO3ADF8QiOS6woAvFkhKmkHifOqJ?=
 =?us-ascii?Q?62Pg+hPV5q2WWfErPlEre6mDke4r+nnRwf3C/VAqDmCsjyk3qfiBlp9PoziR?=
 =?us-ascii?Q?nJ8cG9qAZfuRG0JUrnpCoYvBo5J3cZ50Sm0TbMrOvDCJXJaIkJkSQQdq7zp6?=
 =?us-ascii?Q?NojiGSgOxdyxLMiKwkcfkEkwbfegRn4PoF9Fp7TdLevAYfO5MWG3t/llem35?=
 =?us-ascii?Q?J1/pdKuJrRdB94TK4wXRxxAOfQjChfJ+FLRn1KQQPCNKWcVmlGjfXO7P8zcY?=
 =?us-ascii?Q?ESzwXZkLGSGWvtu+ApxAC6vwCsiJ7geYLLJXwmQAKx9LJXuoYdkxz7yN7zyl?=
 =?us-ascii?Q?YvTfkA5WFMztt/uTwpGH7Bfkxx1TGFYNYsRdF3C7kx5gdLErf2BkWAy4+Nnj?=
 =?us-ascii?Q?diiaoRsC9QkfCFYFtj7FwAcP7NatwkvyLf4zzrazu7Wctj2hC/k44uF/RDwO?=
 =?us-ascii?Q?WKQ0GD1s1/YcK6cI6HJ/Q+nUnGIStmorxJNTyHvlABlpYZvr2DOCLq0mzs5C?=
 =?us-ascii?Q?CbKBx92ZPEwkl4Srjprxdvs6md9rhcspGHZkVzhbp5PpDeV0AWCU/e2uS/SR?=
 =?us-ascii?Q?pCPo32H9KV/hJe0YLMmhRkg/H9r58r/A12zHI749D7g88os0dx623Ny81hwy?=
 =?us-ascii?Q?Ho8BOsgECAqIDiVTfGD/qykihc4PJN84n2EIq5qw5cuBPXiL67viykSCWGH0?=
 =?us-ascii?Q?xA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c4709695-3635-443e-db2c-08da91d6ab1b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 20:14:00.8125
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iwz6/0MBGA9qrXlV+810X8XS75TlikxLm68R94JXn+x/lR1QfmTGCRPJzdg5UWttZFXp7Udoxpi4eWsMSFmcFJGxPQ3Yqpt4KW7gazwo2bc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB0064
X-OriginatorOrg: intel.com

Trying the new b4 prep/send commands. I used some patches I had and
just created a new series. Some hiccups:

1) --to/--cc don't understand aliases

I use sendemail.aliasesfile in my git config to point to
~/.config/neomutt/aliases. When I try

	b4 send --to intel-gfx --no-sign --no-auto-to-cc --dry-run

the "To:" header is empty instead of looking that up in the aliases
file.

2) --no-auto-to-cc either does too much or too little

I want to Cc people who previously reviewed the patch or who are
explicitely added in Cc in the body of the commit message, i.e. I don't
want --suppress-cc to be given to git-send-email. However I also don't
want the get_maintainer.pl to be invoked since I already reviewed the
list of people I want to send the email to.

If I pass --no-auto-to-cc nobody is included and if I don't,
get_maintainer.pl is called and a lot of people added to the list.

My workaround for both was to use b4 send as a replacement for
git-format-patch only, with the output to a directory, and then use
git-send-email. Patch series is this: https://patchwork.freedesktop.org/series/108315/

thanks
Lucas De Marchi
