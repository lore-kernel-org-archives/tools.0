Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155EA1C04
	for <tools@linux.kernel.org>; Wed, 18 Jan 2023 03:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674013246; x=1705549246;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qTdQ6vIHH9+Pb86qgl2KoJgAxJj7102Xuov1h3r3TGU=;
  b=PlEQqwf5QrGeY3vbiZA8Y2IQ3sd+47za7o5g/H4AIu+y5rjZuJ1gd0Wq
   6TfYnf1mrMlQJjB9S7SSMQi/ioUoyTRFC5lDZyoR9JUAT/FeaEi9IenWP
   tUffYfs9BdaQsB/aJ3yX2s4cqvZUcwvq8hOHCrv04Gh6moSWHUryRNHCf
   5K+1VxxGctkdY9MM9KF0GrvogpfYAPOiaEwC7hhCKryPia2lWeTWksmgo
   1UwbtptwKYiR0fA6UXJav2PHz5Dwrb2H5+KBIBZOe6AFCas4JWaSANTot
   rZieX2D4sgeU1D6X9/CepUlg99uT4DBukNzIAvnBdfwMlVYMyorXkbp8a
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="308455270"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; 
   d="scan'208";a="308455270"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2023 19:40:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="637099443"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; 
   d="scan'208";a="637099443"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orsmga006.jf.intel.com with ESMTP; 17 Jan 2023 19:40:46 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 17 Jan 2023 19:40:46 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 17 Jan 2023 19:40:45 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 17 Jan 2023 19:40:45 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 17 Jan 2023 19:40:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f6dMNR/49O53HdZJc2rjcWMzbSovCRlF4T5Ykk8o+yS80UdWbJPp58kflB9uVwKQklcoIZGN6V677ZlYa/0otCkzzNh2tviYoMNgKaaOom+rKpiXAJkW3P9/rB4GEbNuwJElwqa9ZCZ3KXgHNa4Wyf3clSXR+488/HB9AEvP+3VEks42kG27couVnbLaYPz8JP2Zv/uzhdEK9IV69EeRbsr8sXw4aTVn3bqRHNY2qAi3Nzg3RyH3AIoqzLEM87R60rZmDDoaeKnUFZWX4Uyl5qnaGOqFmGovLQKegtXsOK7ZQKIZpXPhuK0nU5zzVD1BQa0ArkecOVW8VEu3UZoMCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=srhbAp/J1KjOh8SUYpM+vhBJ3a0WGDr9P4MzBbue8pk=;
 b=g71vV2B+twK6u51wKu3OuKRgBSeUmmlKmO5gj5uQdeQFkFwJdXLC7marr1OQC+LbnLXZKNiqfVeDL4VVPsQu7J0+yeN3lcu0XeC386MnA/xun323BZqDQ3Yr/6FwFbnOOqovCfonh0hPKn8vRg2jWqb6j7mBIwKYxF+P4FGwwLP3QwElhTGu+55dpPr/kpMd23aOfFIBcXWsBWYO8niAAN3XIfLPx2abPxPAxFmXdXN+k1SA7vII9g/pKPGFJFQZins9SWjgjTv6XjTwHXf/XnDFmdRq1LYz5CWGP0QS9z6AwJXyGWUhwb7u6axFM71P6MTXQvdnQDUbh4OwcE92oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6733.namprd11.prod.outlook.com (2603:10b6:806:25c::17)
 by SN7PR11MB6680.namprd11.prod.outlook.com (2603:10b6:806:268::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Wed, 18 Jan
 2023 03:40:43 +0000
Received: from SA1PR11MB6733.namprd11.prod.outlook.com
 ([fe80::288d:5cae:2f30:828b]) by SA1PR11MB6733.namprd11.prod.outlook.com
 ([fe80::288d:5cae:2f30:828b%8]) with mapi id 15.20.5986.023; Wed, 18 Jan 2023
 03:40:43 +0000
Date: Tue, 17 Jan 2023 19:40:39 -0800
From: Ira Weiny <ira.weiny@intel.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	<tools@linux.kernel.org>
CC: Dan Williams <dan.j.williams@intel.com>, Vishal Verma
	<vishal.l.verma@intel.com>
Subject: b4 send patch order
Message-ID: <Y8dqN1DgZ6Fwbk6H@iweiny-desk3>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: BYAPR04CA0026.namprd04.prod.outlook.com
 (2603:10b6:a03:40::39) To SA1PR11MB6733.namprd11.prod.outlook.com
 (2603:10b6:806:25c::17)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6733:EE_|SN7PR11MB6680:EE_
X-MS-Office365-Filtering-Correlation-Id: 39730e13-e9a9-4331-9213-08daf905c6e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Yu8iybwwVg3pK9XeRMWh+HH6Y2cazyNID/tFxfpPnsr8u0iXL3UqPBX4fb2sR1xmvEsYs8rD72OQ9OQdLxsRA+ou3nmRvAno7voa1y2SzqUpjQAH2JXceP8+yF30CX3sASwxv68A6NRbZI2M2JJg11DZuFBkQ9NwtyjQXinLBCUBK7LL7rW7fM1guP54806zGFY4V77P0OvMPv67O9Bu2Q2mk/3E5mT0rqFcaBTrM3qi6lXynguRONR0RdrUI4EZYWa+Mr6rniTsZRBsfGznJlHaHX+csxrsxZFyQvmpTFW8pdWeUwbTHI0uhtqeWfoYndHYNS9CgsG/JzSmYHfIFVeqrjtRYro4Umf9I/3AIEZobuDP1bB77OqWl7SeqeHe6r6X2pPieF9DigyEewPGJk7X9j+lC3rREuf5a/PyrTgfrooh3p4mvbOfk1TDCfl0x9Sn7a8IGvLDBR/tVdabu6ZLdn7J7ZRdVB3AjQLVPYMfe6L+4YACqEUHdv3rrxI/OlobGYzgVw1g7aB6K6gmBy5Z6PpNssKRsGORPk+0orxSPxZGU8r2FzIVByxQIdf5B1WyRLbaH8ilgjiWmaYrKZTb3PwnFgzzeIdnTpPXsAzUvX5Yj0Uc/vb2ToerXPGv86Y/RJtVJ6wsyU+/5tkQRlMa+Zyz+No+4Kh6qnm+C6c3PDy16lL2VGFRlxYgQ+F+Y9nrOxMwmE9ETDpeAQssRQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6733.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(376002)(39860400002)(136003)(346002)(366004)(396003)(451199015)(33716001)(86362001)(26005)(4326008)(41300700001)(66476007)(66556008)(66946007)(9686003)(6512007)(8676002)(186003)(5660300002)(83380400001)(82960400001)(8936002)(54906003)(478600001)(107886003)(6506007)(316002)(4001150100001)(38100700002)(966005)(2906002)(6486002)(6666004)(44832011);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pThZXDZAfo02xEInxRZ+u/FZUKgRpYwmoowzKWy4gyNZ4tHfULWB9jLd6SYW?=
 =?us-ascii?Q?57vvmmcwqsil2pV6w3iAMSX0P8z+l7u8pVtdXAP1bxZdGlWWKIcgtassTabE?=
 =?us-ascii?Q?rnNihUzE0LoF63MaAYwmE2TN+A/XlJolWS7GJRcU3pjGZOt0jWwm8rmkzdLr?=
 =?us-ascii?Q?DiZuHZwJAPvnLXlfXutMRkps+4Bot8uGoctcpurm0RQS2K4IbrcSUz82Pz1e?=
 =?us-ascii?Q?2nSwFFdLorlFjCsxxwoB9TcumKPjG6WuBmXdlgHQHtZZfyWFlISxzaakyrSG?=
 =?us-ascii?Q?9oArJJ+FPJHqQx1LwqBPWYiFp/D6+iwQ6JbscPQailtlQ+30Rash1TcSIVVd?=
 =?us-ascii?Q?9OOPihtkPYq2Nl9J4VqB5y+orCtQk3VH2S2Z9EYkZIUI7Au7jGUE9riLPn8k?=
 =?us-ascii?Q?Iy5nPv7wfFt7TTTz+NTxlTE9y12qOh/adG4aXxm9xnl7aPLQNrLmj01l2dKL?=
 =?us-ascii?Q?JpydeDlOsTgFklt6PosGAdJ8Gl7HcFtyKurr7wVRijavxvbQhK29QCpTlvbp?=
 =?us-ascii?Q?bd6HxZ64amkO/7x6jrgtgcYymDFtbfOBhcax2UYSB6nsKYe5LTX+ZjQoIDsN?=
 =?us-ascii?Q?pGaaMj1vHQHwp3tXvkA4rs3pckyFfv2fIMLMLc5eJ2Fd+J7/bZtNQXHDVQCS?=
 =?us-ascii?Q?mHA9hKr2kWWpF4F/58xwJ2mvDfhGhL5lF5+a+cwxYPDzL9sINF1eX5OeKMLF?=
 =?us-ascii?Q?XXDUvFPKyff7J2GyPSVYkYr1X/jbAmmkNnVN3Bb8eHTeJ08aqO3R+dCHk8KL?=
 =?us-ascii?Q?688K5KUucURI6cr5HmGHuYytcDCw/wdwxntRJOBnyFZCmaxcBQfSNJuzZVf6?=
 =?us-ascii?Q?+XQO4RN+IsAPCLxSr1tjMBenOJMVmSpDkNx3rGJZgxoqdffyEX31gY30Uk0K?=
 =?us-ascii?Q?qhSOSbzuySmQ7vOiWFdEL+3CJbMMwLHRKcpHbRnISeLbxWs2N1ZIUtX6R1Yk?=
 =?us-ascii?Q?bBE/QhFvkCrK4OZJNpylOmh2ciWmAxXzrKEKsHNKLBOv2oX0N7LDtuyR+Pma?=
 =?us-ascii?Q?6wLLAEQvolP/C2fCCCG3GZBVMQje5ytTcWggTJXZtai9QR1vbMqWncTcj2I7?=
 =?us-ascii?Q?TR2vmthWm9tbYU0aoFv04uoaF+nfm5sHj3dviEldKbS9GMP1iPuhNIi4Yzan?=
 =?us-ascii?Q?0fswoF6QvoFPIUf2HjUwg77s+/YOH+VI49DXLkk9b1jz46vNWMg9C/LMYS7B?=
 =?us-ascii?Q?zDnxpkOdKf5eLUBV1ECJJCufj7M6gmiWONZMuTwdIQzUZWFJ3DUwUOAbvd0y?=
 =?us-ascii?Q?ogW20TIhnIQO0vxs8yAOFBNu4vDvXEae7gpmJFZtPVTFZjwXh+94nNvptzQi?=
 =?us-ascii?Q?fbNd3OMofD/ArgxHx3sWfPByWg8UdsPhp/AQ7NBWCkes3sdu/1GDLjI4CRmb?=
 =?us-ascii?Q?MvVd3hhoMkf9//q42KVpkIg0GVNRpwXQiL5iA9TGOxFVBJcuBXle29gY8K+n?=
 =?us-ascii?Q?l763svIkeqt3LOwjt7cYeNJviMKgyXmUcWOZ5LN6qiVIG7a2lysz31CWllNi?=
 =?us-ascii?Q?6VUM8jFeUnuWtckQiqT9VbdpJYf6CZ6f9fD/VQUbjhtTRXC7WBPMruy0zvYi?=
 =?us-ascii?Q?sfUAcwrKx7IeibOs0jIEd18UxeTbSE1m5tHXS+by?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 39730e13-e9a9-4331-9213-08daf905c6e9
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6733.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2023 03:40:43.5114
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1KpEhzp2UIaVfufx3IWDvuclVR+obAXgi+o30uoSPW6dSus7XuWBhHE7w6BKTF9nqNIq12SuOfu9EII8qeWLaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6680
X-OriginatorOrg: intel.com

Konstantin,

When using 'b4 send' what sets the 'Date: ' tag in the emails?

Dan and I discovered that this thread:

https://lore.kernel.org/all/20221221-ira-cxl-events-2022-11-17-v2-0-2ce2ecc06219@intel.com/

Seems to have a 0/8 email which is dated many seconds after 1/8.

	20:24:53 vs 20:24:31

This messed with how notmuch mail displays this thread as it uses the Date in
the emails for display order.

All the headers I see indicate that 0/8 arrived before 1/8.[*]  So it looks
like b4 is sending these in order.  I'm trying to understand this better.
I would blame the exchange server here at Intel if not for the emails
apparently coming to vger in order?

	20:25:19 vs 23:25:20

:-/

Thanks,
Ira


[*]

0/8: (https://lore.kernel.org/all/20221221-ira-cxl-events-2022-11-17-v2-0-2ce2ecc06219@intel.com/raw)

...
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231146AbiLVEZT (ORCPT <rfc822;linux-cxl@archiver.kernel.org>);
	        Wed, 21 Dec 2022 23:25:19 -0500
...
Date:   Wed, 21 Dec 2022 20:24:53 -0800
...


1/8: (https://lore.kernel.org/all/20221221-ira-cxl-events-2022-11-17-v2-1-2ce2ecc06219@intel.com/raw)

...
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229742AbiLVEZU (ORCPT <rfc822;linux-cxl@archiver.kernel.org>);
	        Wed, 21 Dec 2022 23:25:20 -0500
...
Date:   Wed, 21 Dec 2022 20:24:31 -0800




