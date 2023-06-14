Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71FC57F
	for <tools@linux.kernel.org>; Wed, 14 Jun 2023 17:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686764663; x=1718300663;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=snvMNkf9YEM6k5XMLcLsFcHppZRz5mAaQqPHyver9bE=;
  b=hoJhOl19xR5utSEDg0GbExkJw9cLl1A0l8R0owxgZaI5ghWYWO+n1egF
   NF27MPz971aWdCLX7JhOYwRgtDIpU8P98/xC2cTxwDdlLQTsHB5da2qFb
   PYV/8omxd36nDetZyqmOKdkESWqCVNgUM2xCCBSRQ9lUxF8J+sfruVI8J
   j88gTL4I6Qdgt2epysCjlxYzexxG2LU7rOkpTAb2XHNiHA5NpxeLyvrJi
   S9ostxXsKzr8MMWA7LKf0Syi/Od8h3n1KMkvSFTfx6lft1if427Ms1N3e
   6OWj1o1o8I0NVxLCTDU+NLkx2eHradaw0dvabT7wtkEcFunotp4nW11ol
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="339037195"
X-IronPort-AV: E=Sophos;i="6.00,243,1681196400"; 
   d="scan'208";a="339037195"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2023 10:44:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="745171801"
X-IronPort-AV: E=Sophos;i="6.00,243,1681196400"; 
   d="scan'208";a="745171801"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga001.jf.intel.com with ESMTP; 14 Jun 2023 10:44:22 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 14 Jun 2023 10:44:21 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 14 Jun 2023 10:44:20 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 14 Jun 2023 10:44:20 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 14 Jun 2023 10:44:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dNZFgVpPhJWZgb+1Y0NSUjGIV6quLKP8M56SBqtyJFoPrXaDto0tISOfrfRozXXG9xfeCSjSfNi8NKaPmWz1eE3y7cKu01Cl4gvzBMmiOga2et4Xkq5Oud5IpYBSNcvfVIbVVbKQsnXaQVWsjUjX7wIamlqvFyaNqiQAUOxp7kBc/Rsy2z06oTITzqAQ2gnRMUMdbbjD5ldpT/cVmMlU4lfHh50kg9N0BCz6Q8W556Oz0bFfqj7zxFgX6Rv/NmMeEF3Q6hEyWqqcZuRgWlZ/xzOHRqJZoU6kmrQNIWHuwQXnXgUmKPjQ1c8sVsh2dr9JxeiSUXhLOu4JRawgb1Xi0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AlqtcJE3u4gQuKeXMtCAjAAo67E5wsQP6ZDZNHREFvU=;
 b=OK5vqWA7+ytWhqE2+dh5MWz3/I88PzAC0G+T5wfbtkXOUEmDb7EShojISnB0+EWdJoT3X3eDDvjGS1QfqKxtPQq7FxKWr/jCMy83b26el/otyh2zUwzChh0zj6FMdpGL/KNi4+sL/fg2A9cKWf5bC0o6KhqyrFLh6ScZ01OUVAP8b2kerVDKbSqiZeGUT+qoVphP284BhLIxeN6jmzSQJ/jGN9AdY8vgWGWAS0rkGkuMGioWxBK7Y3G8SwK8pdX/oRjuBNA/BpVVzu/DIx+2qC1jHD4AzCg4b2KteDD6TvjqIkaHT7pCQj+d0HxBVLgaaHyRlVtx7dLq97pWMHW9OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ1PR11MB6201.namprd11.prod.outlook.com (2603:10b6:a03:45c::14)
 by LV2PR11MB6048.namprd11.prod.outlook.com (2603:10b6:408:178::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.37; Wed, 14 Jun
 2023 17:44:17 +0000
Received: from SJ1PR11MB6201.namprd11.prod.outlook.com
 ([fe80::6ccc:155b:3b7b:754f]) by SJ1PR11MB6201.namprd11.prod.outlook.com
 ([fe80::6ccc:155b:3b7b:754f%3]) with mapi id 15.20.6477.037; Wed, 14 Jun 2023
 17:44:17 +0000
Date: Wed, 14 Jun 2023 10:44:13 -0700
From: Ashok Raj <ashok.raj@intel.com>
To: <tools@linux.kernel.org>
CC: <konstantin@linuxfoundation.org>, Ashok Raj <ashok.raj@intel.com>, "Dave
 Jiang" <dave.jiang@intel.com>
Subject: b4 pulling from lore has issues when new rev has some new patches
Message-ID: <ZIn8bVstydHNZZ9J@a4bf019067fa.jf.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR01CA0019.prod.exchangelabs.com (2603:10b6:a02:80::32)
 To SJ1PR11MB6201.namprd11.prod.outlook.com (2603:10b6:a03:45c::14)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6201:EE_|LV2PR11MB6048:EE_
X-MS-Office365-Filtering-Correlation-Id: 98146a3c-6434-4514-7bab-08db6cfefa09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WVurU8rqk9QkMO/9KS19zPN2HrSqKH/Yd5PZ4Ew+6gVogomLll+KLnsz2cimRAq9AGex3NnbCRLkYNX8QjMvGGhflGQVpqVhIiWae1k8BjsC3Sv5uQDl85wkJouWqMypBXp34lk+ATBPCYEXVPXdsx3QeIXm80Ay3HDxkcF1VDzLa97Q+T5GN7y0WWe3gB9ynNFBsD7ffO9lN/MQMdtmVoHm+9PaSf1zUtS86U8gw1/Fv0NHC/r4XuRdqtscw2ojC4i8BpgJ5foMbc+/zXBShNainfpx8Z5IMjkOgRkaiw9o31UPTx3NdhnugXCOe4IXvbBoKIDMICw0BfIy33eDtK92i3pot1ULUi+HML2+7t0bqUgCYlX/gLXCTQ8BO2ix9uTmRxoZptjGhNn+QGFRe1kfz5XbjbFODrMKwZkLUKQ2TC/HsCoBM00m6nWdM0TMHyt4fXxud8tCT3RjFvNwcL/Z01RD+Oja1zRQTHxcE1+HGHgz6EaagRzLtslvS4WRseZknVFefUrqmUxi7G6ZzHvORl8gpMUNP5xUxj7Nkqyclm3QSl9fgOeWv86Wr8YnvqgUylWEO+z3MVwMpj7teQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6201.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(396003)(39860400002)(136003)(376002)(366004)(451199021)(8676002)(8936002)(2906002)(38100700002)(82960400001)(5660300002)(66946007)(316002)(66556008)(66476007)(4326008)(6916009)(84970400001)(83380400001)(54906003)(41300700001)(478600001)(6512007)(6506007)(26005)(107886003)(186003)(6666004)(966005)(6486002)(44832011)(86362001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?NdZQ6y6US1pj6DhFe6LKNN4/Iu2T9JLq9TjVP1Ize0ZxWMaAx8hQkfNAGY?=
 =?iso-8859-1?Q?8E+cvF4l1YqWLqUmJ3hO2/1nGxuH3IDTg6rKdNEacdCks9BqAigOjhE++t?=
 =?iso-8859-1?Q?ixIwczJgL+tqdp78ZwUUNj8nsC/2OIX3i/3ZEtv4ebqrMw9HuZIlnV57FQ?=
 =?iso-8859-1?Q?9mJO1+aazi0vLMrsVpUCYxblMB9HJ5XU1lowOIQB32Qj648Imqqu2XvzM1?=
 =?iso-8859-1?Q?FoeOdRLQA5PcDbe3DVn4RYKKp0IrX8ZT2cVb7a3GdDxUGboOqG2tfWxAjP?=
 =?iso-8859-1?Q?8N92pOEePIR6QjXooktdbkZXeuLoeWVvfepZNJQPdVI1Y77evxkNio77rD?=
 =?iso-8859-1?Q?F+ZUyBZxmkb89XEMQdJ0p0OeKobrZaDknw4TM6pP30wtvCDunmqhFx21t2?=
 =?iso-8859-1?Q?o7qqJWUs3nGQ63oQOJWxBce3ogJn2xGx3y0Qep2gBUYouEXKxIK8PtpWN2?=
 =?iso-8859-1?Q?xiVo/Od2hD0mi/HINGYnQk/qhuPbGf9AKu6NWyprfDbt+8NGOWi5K2ts+t?=
 =?iso-8859-1?Q?fJRw2ESpUpeF5aP5fq7p32+1IJThbkzgenmFAMor2VjgPkpmSU+KMHFNDn?=
 =?iso-8859-1?Q?OsxbX6hCb09HIQZ9lSX0pgu1TnQJ8BxbbodC5X9H/p93kJoAwzWk9mgiQK?=
 =?iso-8859-1?Q?Mw2SspPuFbwfjo+3tGLjetKxSNcXOTaDLwQTQNcKENv/UHlbmWXGVHykNO?=
 =?iso-8859-1?Q?XTpUYCOvAtjsVTGdanMvAaBOqyb+xDQsXu4UIXL29K/5sztWOBFsicR2vY?=
 =?iso-8859-1?Q?dy7N4P7c/K5i1PSUpMscePY2Gi6JE99X31JyCvQZVvtYZRrXFRE4HlWghq?=
 =?iso-8859-1?Q?TdOK8ZoV1Fmwlga+Hs7yDp4q8+kDR0/mJDJZO1V/rChkrTdPRS8R0/BZci?=
 =?iso-8859-1?Q?orUQIp3l4wDlMYtprcQ13e5BDv8L66IsC66QCQmMbWBG96QP0PEkYTQeJe?=
 =?iso-8859-1?Q?oVhSoMMRbLloruNjvmq3DNKUCQ7F0lLQ2oNSQZ+NHz+KEPtW9QWnhMcQUe?=
 =?iso-8859-1?Q?fPQqMWL/ie53AfJkSKCF+G8p2kiibFiMbGegblc/hQEKMW0Zp+ck8mPsjF?=
 =?iso-8859-1?Q?0n9e9FYErr8E+Pfd5hnn5cFW0Doia2MM72jvGfEmOXRE9sODrpJQBGTwzu?=
 =?iso-8859-1?Q?qu5wqnFRDQlWtD2qoqzrGgtRxM4rh3Cwk7HgXfEjUloHU+cGJL3uHyi9j8?=
 =?iso-8859-1?Q?l7Fg1zCtyASyEkVnEweVmmibi/nGcvEq9I5sx1m+O298wt7DdBwQsYr9va?=
 =?iso-8859-1?Q?QOv1gl4vnNbPAYFCVHLgH9BKN6J6nAu/Ubj5FefoivIH8DuR8l0MNsD39D?=
 =?iso-8859-1?Q?iDgKTSdewSSOFxD+nICCPocP2cEhdlJ1fcAmSk4Techbl/KXjNOnXAq7wT?=
 =?iso-8859-1?Q?QTVwzjrxxOOgZqPSwgJtjZhq9JKhJPJIIkyQmA6nR9UE5VG07gVV7RW+qj?=
 =?iso-8859-1?Q?v2K+sLC1QPBsfJLk3SxfH0//7BHtF5lmcuaStg7UqFlV9dvH5/bekrAqde?=
 =?iso-8859-1?Q?1ogRBGCc+TrPt1Fvu2DnbA+NeVc1lae+IZYAos/o32Ih1JK8hoafwE57w2?=
 =?iso-8859-1?Q?0lgATAhJpz4UgqdVd/xyxnDVYOC03fw4JkSburEdeHJuWGag+bXO56Mkww?=
 =?iso-8859-1?Q?NBFLM2s8FiuFmHwboTsbk1RQdqvh23nx6z?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 98146a3c-6434-4514-7bab-08db6cfefa09
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6201.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2023 17:44:17.6694
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YGusCtY1iirSbgAliGW+rJqFuu8ASYmxzy5L1Of+7Lj8EesukG6g1n5ue/v/OvfdGr486HeLOzoG/tiI+BQ2vA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6048
X-OriginatorOrg: intel.com

Hi Konstatin

Dave suggested to send it your way.


I'm trying to use b4 (for the first time :-)). 

I tried to pull from lore. 

V1:  https://lore.kernel.org/r/20230603193439.502645149@linutronix.de

V2: https://lore.kernel.org/lkml/20230613115353.599087484@linutronix.de/

When i try 

#b4 shazam <v2 msg id>

it reports that it imported 8 patches as expected.

I was told I could pass v1 and it would now there is a V2 and pull the
latest. 

But the same with v1 msg-id, it pulls only 6 patches as opposed to 8.

It does tell there are 8, patches but only pulls 6. Maybe because there are
2 new patches in the front?


V1 only has 6, and v2 had 8 patches. GIving the v1 id only pulled 6 patches.


araj@araj-ucode:~/work/linux.git.trees$ b4 shazam -H 20230603193439.502645149@linutronix.de
Grabbing thread from lore.kernel.org/all/20230603193439.502645149@linutronix.de/t.mbox.gz
Checking for newer revisions
Grabbing search results from lore.kernel.org
Analyzing 25 messages in the thread
Partial reroll detected, reconstituting from v1
Will use the latest revision: v2
You can pick other revisions using the -vN flag
Checking attestation on all messages, may take a moment...
---
  [PATCH v1->v2 1/6] x86/smp: Remove pointless wmb() from native_stop_other_cpus()
  [PATCH v1->v2 2/6] x86/smp: Acquire stopping_cpu unconditionally
  [PATCH v1->v2 3/6] x86/smp: Use dedicated cache-line for mwait_play_dead()
  [PATCH v1->v2 4/6] x86/smp: Cure kexec() vs. mwait_play_dead() breakage
    + Reviewed-by: Ashok Raj <ashok.raj@intel.com>
    + Tested-by: Ashok Raj <ashok.raj@intel.com>
  [PATCH     v2 5/6] x86/smp: Split sending INIT IPI out into a helper function
  [PATCH v1->v2 6/6] x86/smp: Put CPUs into INIT on shutdown if possible
    + Reviewed-by: Ashok Raj <ashok.raj@intel.com>
  ---
  NOTE: install dkimpy for DKIM signature verification
---
Total patches: 6
---
WARNING: v2 is a partial reroll from previous revisions
         Please carefully review the resulting series to ensure correctness
         Pass --no-partial-reroll to disable
---
Base: attempting to guess base-commit...
Base: failed to guess base
Magic: Preparing a sparse worktree
---
Applying: x86/smp: Remove pointless wmb() from native_stop_other_cpus()
Applying: x86/smp: Acquire stopping_cpu unconditionally
Applying: x86/smp: Use dedicated cache-line for mwait_play_dead()
Applying: x86/smp: Cure kexec() vs. mwait_play_dead() breakage
Applying: x86/smp: Split sending INIT IPI out into a helper function
Applying: x86/smp: Put CPUs into INIT on shutdown if possible
---
Fetching into FETCH_HEAD
You can now merge or checkout FETCH_HEAD
  e.g.: git merge --no-ff -F /home/araj/work/linux.git.trees/.git/b4-cover --edit FETCH_HEAD --signoff
-- 
Cheers,
Ashok

Bike Shedding: (a.k.a Parkinson's Law of Triviality)
- When the discussion on a topic is inversely proportionate to the gravity of
  the topic.
