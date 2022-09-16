Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E799219B
	for <tools@linux.kernel.org>; Fri, 16 Sep 2022 16:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663345871; x=1694881871;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=dhCv/yil5uU8B0Xsv3By61OEWVxM7CKp8fFLaRtwNy4=;
  b=hAcpEDVG2UcgstKnd3gi8wDle74nC4+KC4khG9m7JRP62wZY7YubxZxS
   iAiUJbehdcsHdmut6yDBawH/XHERFHriLVinuiGFfCPz5MUulUvhfClXN
   Ho4JQF6i7hpD7nYoOJuWnXPnJZb23UMTavCuBtMBcrhZ4766i7a2RP6tz
   beoPPkmYE3ZF5tXQArcXMAcGhXW/Py6qq6nuzFtzxS5zgUor4zB7kEm21
   K1XewbHZTYvGkM21FMABX70NYrmA4XTjqJbwu8aiEO7vgFszH5wgd/IVf
   liq/KOq+ctf9cHR8Dq+iF1dz891fxT+CRwP18Gw/odJOgoyxXjeymf/bg
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10472"; a="325304326"
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; 
   d="scan'208";a="325304326"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2022 09:31:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; 
   d="scan'208";a="648317669"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga008.jf.intel.com with ESMTP; 16 Sep 2022 09:31:10 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 16 Sep 2022 09:31:10 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 16 Sep 2022 09:31:09 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 16 Sep 2022 09:31:09 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 16 Sep 2022 09:31:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TtcEFgqayv/AxVmRW6AtonMOenthQ9oMbJY/+OgWu5OQt7pc321C0bjAH0XIwa5Km9LL2jIWj2rYiMl1FGtxIYAjznOzQ/Vg+NMEm5lxDjz+4aDG0JSI4lTdVUCNcWknJUZnykjgOcYnBD5JAHtx/nNVWzQYj9i3reaIuNGmurLMz2T1Fq7YRExvyIhKssUebTzBOvFOn7lsfMRijgsRLZfsJnXDhMmbig62SHAbYOUJDB8ZgN+HMR0kpHxa2gJl+hd9QnOE5TtqwA5wqoxdr5WB7ZqT1J89aUhCkOjg1721GLbGfWU2z9n8pn7t4dwTOxXdL763v2ISaUn1bEDtgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qMwWgaa0vPz/nDuDCGZD1WS/OLk61J474CVNtKLy4Mk=;
 b=fqFr5oZEusRXAxU5jDp2urptLMIDbY6G2vYy6dU3Q1osk7+FmyZJhrSVghXziSZKo+8l024mGkYqgr+7ah0eRFlpeeecSYULMr6nK1n72hHzLtlQDU4dWHvJMbXpF9xcSvm200KaSHgyku1r/9McTXY4cTPmn4U73/RTNlE1ZrZurx3FZoMuv1OJnxCEo7wW1nGpWCya7P9qCr35qKMr6fPQepKUllAYNhSE6rljjRg2Cqxw4IW5ijkbdyjo/0qpjpfVqM897/HdJJ9PJu+KVVrTNrvKdG50RqxfVXubbNuYqb6SuiCIrnOXPXsCMZ/EGNo80AIczu5wzfKcJR65Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MN0PR11MB5964.namprd11.prod.outlook.com (2603:10b6:208:373::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Fri, 16 Sep
 2022 16:31:03 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b80a:cf49:9118:24e7]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b80a:cf49:9118:24e7%6]) with mapi id 15.20.5612.022; Fri, 16 Sep 2022
 16:31:03 +0000
Date: Fri, 16 Sep 2022 09:31:01 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
CC: <tools@linux.kernel.org>, <lkp@intel.com>
Subject: Re: trailers update and bots
Message-ID: <20220916163101.2ij6uznmymqvgklt@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20220916161835.mpi5oyeka3b4ellx@ldmartin-desk2.lan>
 <20220916162418.plk3jhc6hezv2ace@meerkat.local>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20220916162418.plk3jhc6hezv2ace@meerkat.local>
X-ClientProxiedBy: BY5PR03CA0007.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::17) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MN0PR11MB5964:EE_
X-MS-Office365-Filtering-Correlation-Id: 2dbfa7be-b2cf-4fe9-a9f0-08da9800d91b
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nVm5wIsXcxLZftrcUrDQ2gG69oYSayLl4e+FWk3iVThOk9z6KiE8UO8kMoFb7fPaDdbEEHe+dbLIvAsXCnPz4WivpgzJRQ7fqG97LTiAPt1RPIWrvTkd14fqsPWJy9KFCIvkgpiVZAMTfcIidRvoQot4k2c29FmtTIoSll6eiLe4ZgDbTSJXwM2P1k5cewseFENDSvMG8K9AlxtQcQ7thfG9XiY2nj1FB6QnMf66MKeShMgJRV1MUs8VuMToKHRIQh4LT2OjLI+XrHGE5JxBnQ8IfUJfxBnlyjaXYHuJCh7dQOqGgQY05x6mV74Dzm4M1tD/PcAAjeJ2HhuUZI+eUdWmyD4kUAS5B/aWmrlOJv21MJz2WYoUOaD054OVu0Q1DEuqe7jzYJM8jVKbZoSNn09VuDPbCMId74rDzeO81OUBSKduADZ8iMMeyYLeR9kbFL38//B0FazSAHqqN4mr1egj8snekgVoG6JjYe1RZkeUuMF4TF2iOMaMe4kAdzdRZ3BkBg4ijQBtXaQZLkkJRsRIIdffStNhCk6ofDRXTNW+sQceCRevhJoruIHdJhimFfp7Jf9AAXp6Qn6HJWLnNK2c+Kl5xc0X1aXb4MaGHrXruMvpWBv7RbJcz2p80mSFXAPH+/FChp5vTVvvqe1tDHVwLwRxGL9QNLixFbDJN4jAI5/pY1L6tjd8oH/t/etahZGH2rnLrqSO/kseLM4NaAjmEx6hrSsR9nMSJLqGMOY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6139.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(376002)(136003)(366004)(39860400002)(346002)(451199015)(8676002)(86362001)(83380400001)(3480700007)(38100700002)(186003)(1076003)(82960400001)(26005)(41300700001)(66556008)(107886003)(15650500001)(66899012)(66476007)(478600001)(6506007)(2906002)(9686003)(6512007)(5660300002)(8936002)(6486002)(6916009)(316002)(966005)(4326008)(66946007)(36756003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4+LcOs3o72X8/gtsnoc9JK/8DpXZmd75jeHTECHR2R9FImthc1oW9VVDYi50?=
 =?us-ascii?Q?44QTyFzFKKfxpsubNE7RlTa6pYoetBLQl6rLzZ5xXwsSM979/fuaKrFaeQIW?=
 =?us-ascii?Q?4f2+2ZNEaKM8VjmBUwprd0G9U+G/Ug28U5VRo5yFMcWWwnZKWPM/2oMj/78s?=
 =?us-ascii?Q?1R0QjYbJbvF7esDqb/PcTRevicrgP9Zxd5K8rwbEexIq4tSO3PJ0zHAIfO7N?=
 =?us-ascii?Q?7BVbc4NK5GX9DhMRd5SJocJIJ6tMsoDTzevir0eVudKCi0KXZ/XZuLkS9I+3?=
 =?us-ascii?Q?MxcvFvmR67NtHPao/1qsk5QIrMrobjjdo6Z1KhahFPouyFCvLWa1b0SePon4?=
 =?us-ascii?Q?nLmvLSsBaKpp6sZxcvGPJEmVxUGB8/p97VMMKlkD7gvpk0C+dcweLEIyvsGd?=
 =?us-ascii?Q?04LyvMlt0rSX3Hj3Iku9b1S2pEYEd3+bixY96hyu20xN69SvdHf2p+ritNjD?=
 =?us-ascii?Q?3Q8u8h4UMNZbh2Z+AXBC8WSamewkeC94evpnurePVA4DBcAngIY5P1At0r2S?=
 =?us-ascii?Q?myR+7OI1C4iQeHYHvj/KDwkFiQY+8RsQXiodhYNYJ8neeyRzbGyjq/hSpFar?=
 =?us-ascii?Q?p5LWS+ZokFYgk4DuXzZBX6QDPZ9qcM2/vRkmQNJjiHj3EhX8pK9zEkRd8SrP?=
 =?us-ascii?Q?3sAfV3H9EzZroLoqzQp/Ww4yzjkwSR1AK3OHCi/rSBHGSoegOc1XWKNEtswP?=
 =?us-ascii?Q?sUjh2vRICwRD1vl4S2NNNqjKylaqIfcARH23V/ii/S8/I97YEJK8SGe/pu+3?=
 =?us-ascii?Q?/0qWjmVFpFcv+d+Pqo5qDVw+dp0Sc9O0lsL8OlK3HCSM8IPzNTjfDt+wwjOI?=
 =?us-ascii?Q?mfVAgwlx0tZ1h4u/RVz1c2IDw4Uys9Nc6vjW6nihktr7lieT9ovtdaGSx66o?=
 =?us-ascii?Q?k9CoAf8Jgf8/2F7GzoIrOyKnQbfhyqPvRQl3KoHLzBpQG/63e6nUd9U4YvRV?=
 =?us-ascii?Q?Wh+Xe3xxSb6mGszbAJTqpRnvB40faRLrn9dEVfv3rVIxbf1ePMGTpOyLtiGo?=
 =?us-ascii?Q?2F+t/86pPncgOJP+amPaRzwL+UAm4WE91jevKTDVzoypBaH+danCVjRk8aWV?=
 =?us-ascii?Q?Uy4wn5fGRhBC2Fazjy85DMr1sKqW+mjw5J09Ase1StF6uVXaEIqwa9SoOdwF?=
 =?us-ascii?Q?qk+7HBRYFUhrHEB1+8rXWplqa3bFKdYkVMYeVjyUd7jbZbTRvDp1kjkY6WAn?=
 =?us-ascii?Q?uOqAdtDcaGwchmux7ZJ+t6L0AtGUI3qrmDIsSxECO1e+jWpKp0pc1XMUkfGB?=
 =?us-ascii?Q?8FKlP2y2kVuOd36QNi2/8AYzv8y9E5R1yNCOQ7kfE+qhWnJ7/h6Na69X6Lcs?=
 =?us-ascii?Q?p4lBzA1IbRzw2Fkr57LtqHv4egT02iaLNDdKeHiJxE510uZNwVh96/gkgNd1?=
 =?us-ascii?Q?g/sMpi0qXXY59selM1pW7C4keKwCse+u2SvrfbLRF/AbOGJW4uZDYK6wqWBL?=
 =?us-ascii?Q?A1nExnbgGqtmFn/pzK4WT3p2mXhoVZO+Pia4gtS3L4A3TGfJnW+4i7RXgY+L?=
 =?us-ascii?Q?3dW+bKO78f75FvQ2+WQLUXKrDgHMXw6ukbEe+0hgo6vtr2VIRFBIyjCtrVjE?=
 =?us-ascii?Q?JeAq9A8rfyzt7t18fNwQZjycFauhCa45vF92KWfgv+cvtWdhutsFXqtNA578?=
 =?us-ascii?Q?Yg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dbfa7be-b2cf-4fe9-a9f0-08da9800d91b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2022 16:31:03.7487
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bYNU5NSqCQ4dpLJu7FF1FIbipO7PTQQhs4BEjcx6fJhEYlciUhH8Hro2H7AEJT+UJP+eZmYh0u7PLgsM4I1GVeILVKT2O328dCsQOnOiVE0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB5964
X-OriginatorOrg: intel.com

On Fri, Sep 16, 2022 at 12:24:18PM -0400, Konstantin Ryabitsev wrote:
>On Fri, Sep 16, 2022 at 09:18:35AM -0700, Lucas De Marchi wrote:
>> It looks like there is an incompatibility with b4's updating the
>> trailers and bots sending "found a bug in your patch, if you fix please
>> include Reported-by: ..."
>>
>> Example: https://lore.kernel.org/all/202209160835.MMBeObmU-lkp@intel.com/
>>
>> Now if I update the trailers, it will look like the patch itself was
>> done because it was reported by kernel test robot, which is not true:
>> there was something wrong in patch that needed an update.
>>
>> Should lkp (and bots in general) escape the line "Reported-by: " that
>> looks like a trailer, or should/could b4 deal with it in a better way?
>
>I'm not sure there's a universally "better way". One thing I considered is
>adding an "trailers-ignore-from" setting that would allow you to keep a list
>of trailers that should not be automatically inserted, e.g.:
>
>    [b4]
>      trailers-ignore-from = lkp@intel.com
>
>Would that be a suitable solution?

yeah, I think that would be something good to have. Maybe we should also
communicate a way for people writing these bots how to prevent it to be
considered a trailer? Would it be sufficient not being in a line by
itself? That could be a change done on the lkp side I think (Cc'ed
here).

Then people giving "conditional acks", i.e. it's acked if something
changes, may also have a way to avoid b4 auto-inserting the ack.

thanks
Lucas De Marchi

>
>-K
