Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD36946426
	for <tools@linux.kernel.org>; Fri,  2 Feb 2024 13:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706880830; cv=fail; b=gFWCacVCF/bsyn9XWiccc5TVpdVQUVaJinSpYBIY8dr24aEGk0aYQ94pO46zZJjAoIUtKgjW0+NZklL1OH3qA/jKce00yH5I86B0mWOswYJ0PnqS9ngGw1cHBrNaR3fvOn6YvUuMTRM4bsgrXIrtEGt4Il/P2q3AHLVH7WZombw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706880830; c=relaxed/simple;
	bh=vW/DTwilhvjJ/jW+YnkZ+k19BzepPyL3vwsPV8O92UU=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Qq2ulHrlB5VEbfVojjnWFWO7VJp0sFnyXoCT7Tow8+63Qjtn3zUyVQ1zFdaLzXACWvNfCuRrdKKyZG0HETv9Ryaz36WYs7lb4TfKjErQcTjRlQ2jhjtMNhKKv/EnuBDmc9Lb9NndkI7KLHqDwBQ5gdJKxgCqyDYImox5+WWjkXg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J9PsgU8j; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J9PsgU8j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706880828; x=1738416828;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=vW/DTwilhvjJ/jW+YnkZ+k19BzepPyL3vwsPV8O92UU=;
  b=J9PsgU8jXW55l0c/LiFQeOP4mWB1wEsvxvhx7hQEsO+ohWurcdtZKSwF
   LY7rXWBwAo+tAyXhievULKA0pJ+/03xTUkzn9Ev/zods9glfEJ7++0Z5u
   MP0LROEIFBt93YfPwZj6VMaoElqIiu7Fm3GHruEe00HxgxcyUw4hbm402
   4zziruxV+RAu/i3NgAPCN7tUb0pulBJwkHutAI20fZW3C0qY4eRAH92Xa
   xC+m4numleL778a2PWsk8pSGht4b4j4NL18OwPO7Nroqu/dXDo0VMDxhV
   AXtxljN+Q+HNC9QHoPYzfEFYE6Uug5Xymymr+ZFTiVmTNkn0Jef2/L57C
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="3122884"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="3122884"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2024 05:33:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="4694361"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 02 Feb 2024 05:33:48 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 2 Feb 2024 05:33:47 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 2 Feb 2024 05:33:47 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 2 Feb 2024 05:33:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gzh8F3N5GEk6XPDlx11YadEdgaSIaxIJJA4CHiQFug906dICCN3+9Vuj9wD8dCYszWoS/w0pJcs9mwCKq5Y501gxQ1j3AWTy6vUKKLzHjPNoedIJGM5eYNkz/F14BKwDn5ylL1oNb8wZL3Fcp6bM8++ZAoUVV6JdbHJ7xcbxRdsy5RBTIEzzmPAt8Iuovs00yiyEefWJdNTJVQ4mfGw5A0gbTrzDsa6fWfkjwJyVaMlwPLpKxEuYfXe3Nl0x0qC5imgOcgsZG8PtaIlddMGzxl6dSyjW0iwG0Vdp1iJuXRu47HgucJzLnTdBHxdMs7cqTxmJsQsG4B95KmZlLssluA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wMz0UsHoMiZOB8lvsxXAvqBPHnluGJrL7W2hy9gQuDY=;
 b=KmEWoY2E5s1iCLR/LH+eAyTKWpcpKyyxetzBr9UXfcMoV/qDMhsp0beQ2ZJHGG1GVEOoDB/Xiz4JDLCVgbqL6rfeeN2u29d/TXRUo+XGJz4bDFcOvkl2waH9ozbXcM4Od4xsR9Og40B6qLRcnYW2PUXkDPPIaEhmhS7J5M3iwmCQNYoU8lEm2mwE4TLwk7Rp2GNkzalnQQULBik5LJVOwX0z0t7lyCgQG15u++NTTWN7OSoBaZbaJyjSsjqNfL4mYKpzVlZvH0DSXBrTc1Tb5CH8p+txm/PMAhD3RgVwp63tyWSbwJuAlMfx1lJIrqfQTF4tELemOaE3xLIEHD+OYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BN9PR11MB5339.namprd11.prod.outlook.com (2603:10b6:408:118::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.30; Fri, 2 Feb
 2024 13:33:45 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7249.025; Fri, 2 Feb 2024
 13:33:45 +0000
Date: Fri, 2 Feb 2024 07:33:42 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
CC: <tools@linux.kernel.org>, <lkp@intel.com>
Subject: Re: trailers update and bots
Message-ID: <uq3gvjhhmapxhjwjsdjghc63kr4wdcic6oum6gss5rvlj572up@5eiplp2qzf72>
References: <20220916161835.mpi5oyeka3b4ellx@ldmartin-desk2.lan>
 <20220916162418.plk3jhc6hezv2ace@meerkat.local>
 <20220916163101.2ij6uznmymqvgklt@ldmartin-desk2.lan>
 <20220916165951.onu7f3p7xl7olw5u@meerkat.local>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20220916165951.onu7f3p7xl7olw5u@meerkat.local>
X-ClientProxiedBy: BY5PR17CA0037.namprd17.prod.outlook.com
 (2603:10b6:a03:167::14) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BN9PR11MB5339:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d2a6649-22af-4841-8a7c-08dc23f39412
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tGTTeSDWCj27b4Wty9LFAwQNipJpnAsYfoJs0Dyp7y99/9d0MjIKPwXvwZJ7xpYtgAU5JbQikE/UI3bI7l3/SLbxCUpw/XpXikVL1Y5fFYy1YukaYr/pLBkg29IGAAXaX/6ovvkNLA/nio5ujlPGZbltRpSxi/gpoDN8bD+1cHiSe1XfGPybs+uj7zuoLITYV9o6gsghB3tJeBdZBFajL0I7ouLMD6SgcZcC3BkJ1CUu2f0BeQ09Ht4X9h7ADhEhqGUMiYByoFBUKk2QXaxp2C2T3TrhjHBBLhvHwWeH2xFdXuLR3KBHETgHDLm9yYfsVNx7wVkM4SLAbXzA4+A8I14ABb3IF8EN7WfHGspiiYD1c0QCLRRVJmcIyVN5+nkFhp5bpyznkQSZU/2vh8HT9bJRDT+sT6wX7PE9+lyYaSnrrz/iT2M9LAy5RYlyQu6xjTgvqadgNfsu1wv5xQGzDe8v187xBbzRqJ1eFmSjRQI7MN1wvU+VM3qBY+Tr/3q0iuL0VgcJtlmvdEZIiLUAyKUHpuNcoBtLUBZWqi5aHclGf37tCuMQlKgGsdU3HrZzP4oyqeOkuQuP942ctAkPaQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6139.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(39860400002)(366004)(396003)(346002)(136003)(376002)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(33716001)(26005)(107886003)(41300700001)(9686003)(3480700007)(478600001)(6916009)(316002)(6512007)(6666004)(83380400001)(6486002)(6506007)(966005)(38100700002)(82960400001)(86362001)(2906002)(66556008)(66946007)(66476007)(5660300002)(8676002)(8936002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TvZ4vALY4knRCQZhJPToENVOPKCQB54eBH2zuyJwM6uqOMpiUT5TwujlIgq2?=
 =?us-ascii?Q?DSvk9FCaKgidWPHLhCDRg/1xs73CaTX18ok/BinVgY+ZCGWNIoNuFPRo+jJi?=
 =?us-ascii?Q?CM2NbbqEgvBnxZzztzQ5mHLs8HCfUyMhAk0J8GCNysSf4uOS0GfgpPHLMTZD?=
 =?us-ascii?Q?jq+ww9YSV8S3QcXw4LBK604qiwrzE+BfOTQCHis+Cic/UweWwDS88pjVQfIa?=
 =?us-ascii?Q?elGwFCbPLaHG7Xh+ZxjG9Hi7r7seSuGk4ilMzSUYEKew4mC70Vvq3rPo9jOi?=
 =?us-ascii?Q?+56IOP7TRwe8d7G+0qDDlkwqyCX2GIPp0d5emAbIomCWK2ba38YRDOS/Zrkl?=
 =?us-ascii?Q?WFHhMy6+aubadGW6pF2zdkMHtqW9fphuGBIUKPi8uwUfhpstDwk5PHgUE5sR?=
 =?us-ascii?Q?/r2tu6crgyY3alXZHYj8DEXWdGtMhStMk1f19jAjRwzMpQlEAOoaco88Ql80?=
 =?us-ascii?Q?MRoMpf3BW01Gnf7sT8C1p253g/KEcf8V4M6X63UE82e784bc+9ZWjbdo0LW6?=
 =?us-ascii?Q?5x3bNbd1aKuewlxX1t3by7SI2k71nju0whmK0/ZksRH9tcfl+Szd1yviwj/l?=
 =?us-ascii?Q?THCPqGTohpa28t1k52K0LT6RW2/HSo2sNYm03j03pbk8IQeq2bLhIJayD6cN?=
 =?us-ascii?Q?Ft2DVBFLuXD+qtJszSH2x0bCXbMCHzmSMyCvPtsHr8wSzXPi0jHvIpIa1R/S?=
 =?us-ascii?Q?sldzQd6c3MYDWrWog6pzvK1kozf64APU7piAplW0dH49+99rTtyrY7VDkZjn?=
 =?us-ascii?Q?5oihw9TY4ygptDL3J2wyGEtKwjvDSOdeb8k45U5/y74WD67DFFmF8u6UT/Mb?=
 =?us-ascii?Q?BYWaUIKVIBBeS0MlpevmCwzHBBJbVx5yNLtDSZiEpTW+yCncgc/efWzka9Gg?=
 =?us-ascii?Q?7n04k+kUUiNOjWTayQh8IkDN2pPctop71wo8I4jX3HSgLH7v6fVqzagOmxLM?=
 =?us-ascii?Q?NSG6A3t7Kdg22Mw8vTJyW0RtTlyTjz7ndp+GKlO5s74kUF/DD+I4Ztj11LPN?=
 =?us-ascii?Q?iYepTbwznzifyLbgeUQ956Uw9o6ynbQnKdIX02PWFRA18CjBHC0HhyAKJmqD?=
 =?us-ascii?Q?CFUdd16a7X9HveuDl6FqnpmL0p78zBGo7M9cd8sEPVvtiQIlp5Ydz4fhl0yf?=
 =?us-ascii?Q?BaLwcISNBoTivRmB2wZCo/KtaYAeldHcCezJ4ZQEpJz5vb9i5pJ38s89jlxX?=
 =?us-ascii?Q?yUteplruzmmxeWkWkderQslpP0NHC+xkntdAsci4g0hcYNJpsZic4QhcuIiz?=
 =?us-ascii?Q?/M4VAEcmlDdNonbHNBoWbxFarunfcLCB5Nbu3GmQdAXS1KjxCtqv8Mi8ijj6?=
 =?us-ascii?Q?xUrrNEctKK81ugShVaUvh6xKTTS34FT9cOMwslOc9FeZmIdhgIgpEOZ0cq4h?=
 =?us-ascii?Q?j8TPkLNY5pi9Mqi6/7aVCMFN0vV9R+s10n7LwNdLydc+6anWVuhaLPigsDL5?=
 =?us-ascii?Q?bj+gjL+PsnOV8ajz/CgXytDLn2bCzkIlcVQhTewWp3p5sZJ56uNwBbxdn4Z+?=
 =?us-ascii?Q?NpVzfAnpTskR6JIBX+SpOLueKebbNqQwGKH330r3GCEOZEHjjPlKF53H/lCA?=
 =?us-ascii?Q?UtgY6amMeV4hNBLtTBfWWz/l5IhVGwjSXFlL7F/PnQPaVaUsnpfsNs3p4JaO?=
 =?us-ascii?Q?Dw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d2a6649-22af-4841-8a7c-08dc23f39412
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2024 13:33:44.9718
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4ALA1p+CroJk53eBp4/Ff3yT2qrDLu7XnUMlyzErfEyg5Tz8gMS6CWlLfilm+Bxeho14/e7SpgckVKcfWg7tI+ytJa3avwf5Pz6QbaHgysQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5339
X-OriginatorOrg: intel.com

On Fri, Sep 16, 2022 at 12:59:51PM -0400, Konstantin Ryabitsev wrote:
>On Fri, Sep 16, 2022 at 09:31:01AM -0700, Lucas De Marchi wrote:
>> > I'm not sure there's a universally "better way". One thing I considered is
>> > adding an "trailers-ignore-from" setting that would allow you to keep a list
>> > of trailers that should not be automatically inserted, e.g.:
>> >
>> >    [b4]
>> >      trailers-ignore-from = lkp@intel.com
>> >
>> > Would that be a suitable solution?
>>
>> yeah, I think that would be something good to have.
>
>The option is now in master and should be out later today as part of 0.10
>release.

Reviving this thread as a similar issue occurred and I remembered of
this. Besides ignoring trailers from certain addresses, would it be
possible to ignore any email at all from certain addresses? Maybe a
b4.ignore-from to complement the above?

Current issue is for CI replies like this:
https://lore.kernel.org/all/170675203150.878359.3527977174668216260@5338d5abeb45/

It replies on the cover-letter and then if we use
--apply-cover-trailers, it will apply trailers that were
not intended to be used.

More details at https://gitlab.freedesktop.org/drm/maintainer-tools/-/merge_requests/27

>
>> Maybe we should also communicate a way for people writing these bots how to
>> prevent it to be considered a trailer? Would it be sufficient not being in a
>> line by itself? That could be a change done on the lkp side I think (Cc'ed
>> here).
>
>I've suggested it before. Any non-space character in front of the trailer will
>make b4 ignore it, so something like this would work:
>
>    If you fix the issue, kindly add following tag where applicable
>
>    | Reported-by: kernel test robot <lkp@intel.com>

I'm working with the people owning that CI to check if they can prefix
everything with a "|"  or so, but it would be good not to depend on any
possible bot replying. Another alternative I was thinking: use an email
header like is done with patchwork: at least the fdo fork uses
'X-Patchwork-Hint: ignore'  to completely ignore parsing the email.

thanks
Lucas De Marchi


>
>> Then people giving "conditional acks", i.e. it's acked if something
>> changes, may also have a way to avoid b4 auto-inserting the ack.
>
>I'm not sure people can be fixed quite as easily as bots. :) The same
>principle would work, though -- ask them to provide some kind of non-space
>character to prevent automation from pulling the trailer in, e.g.:
>
>    If you fix this, please feel free to add the following:
>
>    ? Acked-by: Alice Developer <alice.developer@example.com>
>
>However, knowing that changing people is hard, I expect this is just something
>you have to watch out for.
>
>-K
