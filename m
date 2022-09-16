Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76EA95C81
	for <tools@linux.kernel.org>; Fri, 16 Sep 2022 16:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663345121; x=1694881121;
  h=date:from:to:subject:message-id:mime-version;
  bh=80mh+tzIydoXegaNK9TRmMbyM219+q9/q+0A0O0jnsg=;
  b=nbqa5Rejq7Ua08Ur4s5obus3k9GzenlHTtDaC7UxJYsNa2PKsFzlj4JR
   pomr4+xmpm+CrcZ6XvW6hPGhE649xP3U0Md1lvRO8MATyiPQ04FA09ce5
   M85659kG8FlC5XA2wsaF334vNcgci2TR65QzTcwDZu6w6ZbNppTNrLpRq
   o6+wASKiQI1fks4sjg5mJV98e/B+M+bFV9MA+n8ZOnb68ppaIqbzCpn8U
   64pcjvECbqWgqrke/2WBQjkTIM6HCdggW/1mj2OQoBrJf22m//zCOXlcm
   O5DACPjVEFi39gjl7zO7yy7sh6iLZt1d5REWtXgvYhqsbyh18kUzjE0jr
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10472"; a="299017725"
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; 
   d="scan'208";a="299017725"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2022 09:18:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; 
   d="scan'208";a="686191486"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmsmga004.fm.intel.com with ESMTP; 16 Sep 2022 09:18:41 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 16 Sep 2022 09:18:40 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 16 Sep 2022 09:18:40 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 16 Sep 2022 09:18:40 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.106)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 16 Sep 2022 09:18:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PqUaCfBJxaJr16AC9malqbt61CXlIIrjoTQMCdPl+RRvYunYoUn4RRmws0D0IJDutDfY6hVoM+mGejG0JQBDjsnAemiv4U/8M8HFVVSs3rbjLLMy+ZsY3kdgQ5gZ6Qxuga4SJwoINKFzu7Uos/ff6fyhm1AW0nEeFhQ9jmesTXN1x4iULy/NJEYeekrzIl0ejd8vBGaxBDnrnrXt8tlOEQeDpFqWEz0VbB3Atp2QriSQvQAEhdUR8hHHxQhuRu724ZkIT/Mqq1bNlOJex+ZJ+TOZbRqoyEGHdmxFTIp8yDEQKZpkr4AmAIicGVKtYfI0eynoOYPKfmO6Kj3F/5yfqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=80mh+tzIydoXegaNK9TRmMbyM219+q9/q+0A0O0jnsg=;
 b=fnc2b0MGnLzwtGg9VTWzzjXxIlf1ZekcFfzgzQMMYCQc7FBjUz3cFHKEcELAKCZZ+cT1UrUBBCD1NvU1Je9wzsOpXlmShNn4PrfIUgB6mIVaWhyDxOmlaK9AnzJOYPHxa4xMNA1Y6cO43srRyetoO8Ankx/iKJzuMSY7kzTGuGdXuoCNrKW0hLY8XxVf8A0pVVYGn1QdhxXwX+rvcYnnkgmyREQkKGTGp4OyNT3qcQkMtZUnIJ860+/FrJiHZmQINDo4Zyo72F0r2sFFblQaTkeRjZQuWiBV6wq2HZNYRMUT/VPFtHvcEn9IcC9BCApf6JaTJCphpUovaTf1mmLIrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB5789.namprd11.prod.outlook.com (2603:10b6:a03:424::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Fri, 16 Sep
 2022 16:18:38 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b80a:cf49:9118:24e7]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b80a:cf49:9118:24e7%6]) with mapi id 15.20.5612.022; Fri, 16 Sep 2022
 16:18:37 +0000
Date: Fri, 16 Sep 2022 09:18:35 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <tools@linux.kernel.org>, <lkp@intel.com>
Subject: trailers update and bots
Message-ID: <20220916161835.mpi5oyeka3b4ellx@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
X-ClientProxiedBy: BYAPR11CA0054.namprd11.prod.outlook.com
 (2603:10b6:a03:80::31) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB5789:EE_
X-MS-Office365-Filtering-Correlation-Id: c5753821-aa6d-48f6-94df-08da97ff1c4d
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6SHxuCJpk9fP9WRT38IrLkzw+tWWmu3rj7c6q0Xz78lGNovG7MPbbgo7s2LKSfPWGBj77ofTdVnoDF7xE5tvh9dArnZLQ2EIrseFHj3oiwBg/ibrRHQKwUb+/VZcVRPtu2hgVC3yPsE3aApse+yg81ISaiSgm+VpJxBe0dg+zKrUSD78K8Ez4KhmD/CWsh3udBWQPGkZ2tpNs8wHGZpZ3AmMQDqPuZa9CcU/jGiYU/WNSj7eJnInGGnTu6NeU2koX7dKjuVzpapFcx3LVNtlzBebQWWs939RezjRit73gwxm91djwQpz7p5svy5iFYctCHosrIIRAloFWbiYgQegcvlNchvdNPaLEkNArgg+9sKnaJFO6mCm2463MF2iHfAjWpvdtG3MShOBK+0basRi+LuvxWUYvZ0jH9MP/jMT+GU7H+RiU7WIAVatrRoUOyFfMvQ1bJz8dS4dPonQE+r5I7Bp61QoVJOlWJ0wM7+coIwOGt7TXoiB1Wari8D/hj4J+93/zMtLfoZhu09tB1kg6o4srs+b6U7igMhZy4wHDqK1MjvLhjcNrnr6mVh5MwWdZde8t/o8kjnTvkPRX9eKMnKbe+gw4IdiJj/mMkj2PRn3LRxnO3TtEe7/NKyblquZ+CwxqPlUybn3NuAurl/Uhs9VmaRk+Y6GwdKRrs1nnD8Zi9rUk1flcKetUaaf3/UTu+7dwTiJb8kIqrgCf5x42hzeVp+4gh5vZ22eq2/n+5p71MSUIBJDYRY+hfwqSuQN
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6139.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(376002)(346002)(396003)(39860400002)(366004)(451199015)(66556008)(316002)(36756003)(6506007)(1076003)(3480700007)(2906002)(38100700002)(41300700001)(15650500001)(5660300002)(6636002)(9686003)(6512007)(66899012)(186003)(6486002)(8936002)(82960400001)(8676002)(478600001)(86362001)(66946007)(966005)(83380400001)(26005)(66476007)(4744005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0GLW4l0i/KXrMtHAEr2JVC4Zq81287tFLcWXVEGUeqbsAuUCTqI0juKHxE6u?=
 =?us-ascii?Q?q32aOklQ5LgvsnYnuKCqGok4GV+6Hoqkdqs0Cxew+mEvVXdFhDrgfrVa5pEE?=
 =?us-ascii?Q?YMrcsVu8WdUrGytt97auEUC+YOqY1jkBHzkMf5F4mqF2Oe06heraBgmcN1pS?=
 =?us-ascii?Q?cUKperovewwzC+hfIwu65nIu84wqiIOp7eehIuv/Uh/pph1Sk37xLzSN52oR?=
 =?us-ascii?Q?yNRF/pzyCaoXTEF+e9q0uSgb37w8GpAYqwGNQcwIlL+0p1PSkEkeripR6uLl?=
 =?us-ascii?Q?0TS6cmjs407a9K5w572iaqnkdQfmrUxyXd5EyLNBJrAhJBfzh2ILEI/B3A1R?=
 =?us-ascii?Q?PE/flxJmonraC7FCCU+zBDqJO6jQ9WZ6i5+Q/skmLbBCnoM6xNa9DimWN4SW?=
 =?us-ascii?Q?8vEYPn52bJ5LyUFt4MS67JqhOPJrTWVJaXJjddbs5BSvudPCy+9cpA9vziWi?=
 =?us-ascii?Q?vpPigJNAV4IEBva00hFNZkImrQCCo64XSj7bt1N/wTjrQBshVKgcjZXiolJg?=
 =?us-ascii?Q?tPs+WmuBalkUJwBGrvrs5+FLIDKjIVVSVjXe+RUhBCVkwA2x2FVdajwZLAKG?=
 =?us-ascii?Q?Fj3KcZqLUFng7QuYAmDbFbdDgo6Sifrk0vBAkXYDu6btUmq67KJICW4m9UTu?=
 =?us-ascii?Q?suPgr8JriGNbDY4F+gC4Vx35XSajgiaSyW1OUDangRX10ZZZzPAjjM8YAp2+?=
 =?us-ascii?Q?KgFjCGLq/pj3AWk4uBa4DB4VgjcD4GrALKwLvzXMu1Mt7LNQHAQOOAxSoovD?=
 =?us-ascii?Q?gAPkoPqLWrZGF8J53NL83mr4W1zfMuMW55/vjqD6kfdtdtVghfbqx/eq+wVf?=
 =?us-ascii?Q?m93L+NLU1qAY3IGOEURgWI1NzIZue7NqiVKMMmS/r61ZBoxglyGsqOLBv1f8?=
 =?us-ascii?Q?SvtPQTu1XEyjjGLQW440gpBqKq8yp3OFizm3dGjbqcMOCxkX8FNouGOrEvmr?=
 =?us-ascii?Q?Vny9Yzp8HapWuO1s6Soj0JqLjFVPw5RN1ctKITuwz0J4h/OtHegAn8/Uaa9S?=
 =?us-ascii?Q?vf0dwdyszXr8TcH5LrZ5BxAPl9WNILWCP42f6za3ffStDxBsENqjh70zKw0p?=
 =?us-ascii?Q?69ab17hQ+mMhEi4dg8Vxd4YOOPQS3nS1XsBKdubh2D2kfFrzuK4aRl8/fSOK?=
 =?us-ascii?Q?WF6iy+HI8RHCOFzp/FG6akP+sjAjBZfXV3x2v/UYCVlKfRl4dts1glsl0RW/?=
 =?us-ascii?Q?1L7n4cICaU+XPMNOYehxMWKP+RgEzx8reGOLU4lwDTF7Ibd636My/Pfq/i+Y?=
 =?us-ascii?Q?yPfJ1C1M4WrgmWP9nN5H/FlAb7e28pEE5HIu7xB6FG4iiChChto1jjtRdCG/?=
 =?us-ascii?Q?ar8oh6zoNq5aIi6W8VnMKW8mF75xMHYLCyGQA76v3Is/PNCqRkf5OaNgTVyK?=
 =?us-ascii?Q?36YHCBV4veMRjrIV8++xB1O45bgHJ77qHiXeCxsC78Sqd2442Irz66eKxQ6u?=
 =?us-ascii?Q?+0RQEpcLoJabbA6PnbjddFVy1Ihs5H/0hjU4B9i3yOQrupZIMTGRT1fxEn1T?=
 =?us-ascii?Q?in3281Es05ZPySROHcxasmpC0RgjnkDNq5e8ekSrrCIxAzHFLwcpQDez7+bp?=
 =?us-ascii?Q?jDDhVS2lOPGG+bOLwgr1m21g24ndk9lNjhY6eFj96W1hdLV/tJ4qnUsBC1xH?=
 =?us-ascii?Q?mQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c5753821-aa6d-48f6-94df-08da97ff1c4d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2022 16:18:37.7880
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dR8WZzHodsFhLhPKcrMckw/26lFhJiIt/6vhk++5MS3hzmTF/ueYSvXma6wLz9sclUB7uB5qY46cHLDtp7ieh40EOF4l61LVXBIufi5yj3Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5789
X-OriginatorOrg: intel.com

It looks like there is an incompatibility with b4's updating the
trailers and bots sending "found a bug in your patch, if you fix please
include Reported-by: ..."

Example: https://lore.kernel.org/all/202209160835.MMBeObmU-lkp@intel.com/

Now if I update the trailers, it will look like the patch itself was
done because it was reported by kernel test robot, which is not true:
there was something wrong in patch that needed an update.

Should lkp (and bots in general) escape the line "Reported-by: " that
looks like a trailer, or should/could b4 deal with it in a better way?

Lucas De Marchi
