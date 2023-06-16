Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4ED6130
	for <tools@linux.kernel.org>; Fri, 16 Jun 2023 06:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686896941; x=1718432941;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=641p2x2Z4YcBNrtCUCfPnekRiXkaycuCT2OfaRpKJ4g=;
  b=WlGRELAxmIbyScvzJ+hWd36THZ0WQm3Efdae81bo+3kIJ8wGoT3s6Si6
   ERdXfAIK80mbU11HR6pBq9YzuG2sJHqDx9QFzeDYTEEj0rcB2i/vbfn+l
   T17MXYtbJr7wbFK1NXg3VguWn0JaCKMofDCXA+pzlQi48VdFLk+BXQj9L
   B1VgRF1dHgfPuW18lB8aImwtlPnaOlK0qm/65Ndu0G0KPPeZ3IJAYKENf
   0zqMddmx7E21VvH59yD+c9mlFA/vdZQd7GyNQVEe0udJ7C6RjJF9x808a
   1Xi7JcgnElvKCUV5gw1DjTY3ZfkknCI3ljjvjFiV3PWrxbQk7pdIzfWOF
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="348850459"
X-IronPort-AV: E=Sophos;i="6.00,246,1681196400"; 
   d="scan'208";a="348850459"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2023 23:29:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="712745608"
X-IronPort-AV: E=Sophos;i="6.00,246,1681196400"; 
   d="scan'208";a="712745608"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orsmga002.jf.intel.com with ESMTP; 15 Jun 2023 23:29:01 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 15 Jun 2023 23:29:00 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 15 Jun 2023 23:29:00 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 15 Jun 2023 23:29:00 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 15 Jun 2023 23:29:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QSo2Yc2ZcdH3THd5r1+jtSS9y2dV2IAmEnfUU635/LFQeY0USlzo/wNJRv9P3tSX62Lbzaal/SDzO404/7sWC5F2OjMs38iO4eX4ulSKZgSSHo0PrBm01UgaMfBTa6SE/+C8oOVkMUeNRUzMxH9bZ7H2rh8E/bF8Y0tqvkx/Jslnp0BnuD4FdVZbvSGQPlCjSiKOC9vVVfvNDTvTtciGWoTSfF4JT1md+Xp3Mr4Mgq7ImZ+yJ5EqtZWOoynTEWxQ58GJu+HaWXEeDfIh6FHFHF5SAFi9uEKJYOzEoUFBdHfKwN1p9HkJIdyBrtIvnsT07jDrUqLzpzrVhFWguh5v9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FRbffskQs/jpnvtmyfTxgKnVKgX+uDQQM1WYQGpDcPc=;
 b=MNP3Rery4of5Y6eV/j9POgxN4gmfanoDdKw/iO6dAMYCguJw2jayTPInSlgKYr6T3zh9uQ34O8nGAuhbliN/i/pvut6uCC3TnbVc18tP5ZASH43A9Fiab2rWS3Engz8FqH9eO2uZlAGwZexLsAQVEOMzYFwSN3hQu1VPxrTMsvRzYtl8E1lyQs3pnDtHkN2OA3+6Fx67rQQhydLEdDt+IyMaUoDubs9uOkZcGO5MfWaMV9n9vdFCPnO3uqFj5rI+WuV9zdJJ01c0Q69Gxk9HKrVxl+6U6lZs6WW5nliaFNoHKE7b21e4Pjxf75hgNsfFx5p6pHJIEVF3UmF0KHl1Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB6194.namprd11.prod.outlook.com (2603:10b6:208:3ea::22)
 by DM4PR11MB8202.namprd11.prod.outlook.com (2603:10b6:8:18b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.29; Fri, 16 Jun
 2023 06:28:58 +0000
Received: from IA1PR11MB6194.namprd11.prod.outlook.com
 ([fe80::7b14:354b:7e3f:a306]) by IA1PR11MB6194.namprd11.prod.outlook.com
 ([fe80::7b14:354b:7e3f:a306%6]) with mapi id 15.20.6500.029; Fri, 16 Jun 2023
 06:28:58 +0000
Date: Thu, 15 Jun 2023 23:28:54 -0700
From: Ashok Raj <ashok.raj@intel.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
CC: Ashok Raj <ashok.raj@intel.com>, <tools@linux.kernel.org>, Vishal Verma
	<vishal.l.verma@intel.com>
Subject: br prep for fist time, but always shows a different branch as base?
Message-ID: <ZIwBJr6g2amew28Q@a4bf019067fa.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SJ0PR05CA0054.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::29) To IA1PR11MB6194.namprd11.prod.outlook.com
 (2603:10b6:208:3ea::22)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB6194:EE_|DM4PR11MB8202:EE_
X-MS-Office365-Filtering-Correlation-Id: 8adc4205-04e7-45b4-3198-08db6e32f77d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0WVkeIoji0fyHYQYUHMe55Y7pTh8qz/+JV2EesfAFBDrj/vSN6W+6N3V6DAISZ4WiPwXNtqpxZvDUF1XIs5ulcrXVi04aLbTos+RUyCStnX/ok7IYuk/Hx6SATK/eLfNHI4fZ2znNu1lJ1XuCgB9Ob85LT+u55bkVzaK7VcaEAAVHNB0Ymbk21xRinPv+moEgNQXok8lJ1KELuvtcW9pCKDKNgEOHTPA+tLbuob8vW2Uwk7Md8LuQhYp5gfKShGzwUqHMlxhbayKCNe5PtdfFFel6Ri58X7xzSRwxfOn6EPYhgJK5uJJ5mjrfZmIlR55JhiAvl4Nue67JVRvqFq5S1zFrfQtHq+ftk0G3ftvSMcMvaeuOsnnxPojE9EUNWEXtMZd9jmYREpHbQP9mdMD6SO1h/VdaVuGoONW9eAVg5EHRHNexkbCtuK6IBb7shPNyhQpd/B8AdbEQ9ezw+6ybvul4d+UIhZxyCcBrVYlMNJZ+fHsJqn42bMBf5J2qU5dnqSq/Q9w5H49DzgiB7Q2xga0OGzVruWDLMLeEgaRJ9u1Fxogmojoi0+LmJQgPjDn
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6194.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(396003)(39860400002)(346002)(136003)(366004)(451199021)(82960400001)(41300700001)(316002)(38100700002)(6486002)(6666004)(6512007)(6506007)(26005)(107886003)(6916009)(66476007)(66556008)(66946007)(4326008)(4744005)(8936002)(86362001)(44832011)(5660300002)(8676002)(2906002)(54906003)(478600001)(186003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xK7N+77qik422z3nrpFxQlN4UD39Vnit22ZsIR1M9H8f3n24Boa4nN7VCwhk?=
 =?us-ascii?Q?LfYABy7AuvLINXNWEvxLXvdBDMf9McOhYYb+cY+EoplPBZzE8g2Yj8qvqyUp?=
 =?us-ascii?Q?U338AoQyKj7gVW4FWVqMJkzwP+VsHszKbdfFcWYnzvPJ/T/DrX/b4Pwe+NI2?=
 =?us-ascii?Q?KPC6rvLDb3YQyNbPuEpmjs5o8L7GTt2JL5PU7WhojM5NfC3p/+ApXm9ToPtB?=
 =?us-ascii?Q?WGvpU8x4TT7ph/A9WlT1FV2h8a41Y8kXF9N18A++1F/5d1QSw0EvIR5jzJRD?=
 =?us-ascii?Q?/1ma3GUXviC6lpaR7MIz8f7HHMkCWGhw7tJ/yyGD4J+te501pCXilc4SwTeZ?=
 =?us-ascii?Q?md3sdcDPRCpi4t+ef1xsoxMjPRrjepTYmMQvQOEhJMGmIkZpoqJCHh59/7bu?=
 =?us-ascii?Q?6+8J8xhiQY2vXTsvTJqWeYFa8UR6uBFJ0h3ko9HCsXZNvIChxareZKEED4lm?=
 =?us-ascii?Q?MYtGbvdZxfhjEJy55mfM4pL5govlPzz/uZ/+RKsbaY8EO0vFZsy6SbfyvI2i?=
 =?us-ascii?Q?kxLCclgRRoRrZvfgCHSb52f45+EalU4KMJPnt+kYz/0tJZZt9jGrZRFFIkB3?=
 =?us-ascii?Q?+tBi3jsQRbECRU3JbQXQQZsHqagUMWLwYfWD1LvQ9aTsKCyk7+uoHRPDJm0o?=
 =?us-ascii?Q?xWXCq527SnUo8UJz/7d/8WztLegZ46j+WYMruoeeekuJTqjmRiJfNE+K8Lfc?=
 =?us-ascii?Q?Q2J4iIewx339kMgW5EYgj3N/FPCUJhmp9y230JRUVugZCt/ErXuF3DkEUrdN?=
 =?us-ascii?Q?IVIGYofd1wY1FBIBIrkY1y+BpBcq527AYuvj+cbV7pNpI2ZMZXCFxr0CC0YC?=
 =?us-ascii?Q?wQ/L4ra7Or+zIBCH2vfrwGperxuTKe+swWLxhlqRUdxk6k9XCcuNGIgQRPD7?=
 =?us-ascii?Q?E0Sd9jl3yctrQqlCHqGiC6eUWPTrgyfmuHrQDcRqy0C/FDzYuuRXNYCTMKX0?=
 =?us-ascii?Q?a5I/UhR/vLw+mseL51tl0tnXk9nZQECSLA2cxZwU7b8Z4AjBAjSxzrAQYQ7x?=
 =?us-ascii?Q?oztSbW80p1H8VAKQVlmL8KttW/7xHyj2g1my+w/lhH59JVrfRDdYUJmxj6gC?=
 =?us-ascii?Q?pdOivvjmfQ4G6jKg/DJryruZv5JVRJJ2k3ylDrnsZQCKO5cehoO8jc0J1kbz?=
 =?us-ascii?Q?agI5qBiXASyjuH6j7leh69meX8+cawEBOslrFFxDMjQb+fx6bz/STEE67PSA?=
 =?us-ascii?Q?gc68FyBswI6Xe8BUcRbkF+qDlWTEio9NRAx4yZq4FQE1B+1X4h/W3q4ojqJi?=
 =?us-ascii?Q?h/aWmGSpxgFvUHC6+3Bmc21eERhzGxYvoIYv58ilY16lEmLPC4y7T8R/o1uP?=
 =?us-ascii?Q?Vx7qyUhrvHPaOQYIMk4QpeEqsJhiAG8QYgHa2fqkKABa+tPchuLiBtZeddGS?=
 =?us-ascii?Q?H87RWAw4K4JCzDPpUpZmEvD5R26nyMqdKsdAYNtmAkULAi7pw2E+NtN/BvYI?=
 =?us-ascii?Q?tqZNaYq6gK+PgetAmdePyzJwLHFV/u9cd4sQaFkmwUE7p0iFcef24gMTHpKe?=
 =?us-ascii?Q?iAXPKjstex6KntDqqA382PnGHmBk3FKDVvZsSv/0rnP03Nr74Y7oIS4MgIgs?=
 =?us-ascii?Q?k/Yi7rH+4TGFnyhHRnVS1BCYUrdeYAcHhCcyKZ1T?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8adc4205-04e7-45b4-3198-08db6e32f77d
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6194.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 06:28:58.3925
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TIPVhkJNmWDzJtVQR5rxVT7vGezkEjdsD0dI6dXsCBvgSl4t71nY8SsAhqHjHn59pwaYuipXQCp3GeHZ6RoDTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8202
X-OriginatorOrg: intel.com

Hi Konstatin,

I'm using the latest b4 from git. I aliased b4 to point to that version.

tried to create a new branch with v6.4-rc6 as base as below. But the
tracking shows another branch in my tree, but that's not my base branch.

How does this happen? Incidently minrev-v2 is also based on the same
rc6 branch.

#b4 prep -n ucode-cleanup -f v6.4-rc6

    --- b4-submit-tracking ---
    # This section is used internally by b4 prep for tracking purposes.
    {
      "series": {
        "revision": 1,
        "change-id": "20230615-ucode-cleanup-c3140c205659",
        "base-branch": "minrev-v2",
        "prefixes": []
      }
    }

-- 
Cheers,
Ashok
