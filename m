Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2B83D6E
	for <tools@linux.kernel.org>; Thu, 19 Jan 2023 21:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674164401; x=1705700401;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=vyYjpAw30XWIB/LDTkhBHK1oLx8gKiRpV3+J6aDdH/0=;
  b=ML6pLlJJjhqvMqBzG0a8ewP4ocSKlAdIJh22jatR1wzSKfJ4Q/GAcz/m
   fZT5s3CtMn7uvrTrWgMkWjS61+gFg5RFNJ8wUzVkTrFeWDVw/5jDdxe+R
   /ZyHnNnfCwRbIGD0p5Vi+wpiJMcgZcITRPp27DR430FyJjG86XAVGwT+O
   KebEZnR4rq8YLuIlN4XYjlL7FrfMWJYXnfcc0EC2CVfZY1jBOZJ+Mc57z
   rUQREN0LHn6CfVtmWbMWkdw2DEV3aLnYsYkY1PVTMn0m5tkmZzpu6t77m
   fG27UVq3FsVvLNGwghFgPewfiKlqrFphd5cBs3F1Pl4v3v4FE4AJWwm6J
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="305107602"
X-IronPort-AV: E=Sophos;i="5.97,230,1669104000"; 
   d="scan'208";a="305107602"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2023 13:40:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="637866767"
X-IronPort-AV: E=Sophos;i="5.97,230,1669104000"; 
   d="scan'208";a="637866767"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orsmga006.jf.intel.com with ESMTP; 19 Jan 2023 13:39:50 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 19 Jan 2023 13:39:49 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 19 Jan 2023 13:39:49 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 19 Jan 2023 13:39:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=al3/swuMqrh76WIM9QNINWEjgTpUiPudkrVU6ySndD7rNr7n8Ra4jhs/WhBgZm/gUbCN+TKoogaqnrbRSEb2mt7vIRBKKBYwjUDdhxhYNPpP2apcCAMsU1VbtPaeGo3wlwZNf9qiaqIz8P3Jr1I3BeLorVaPYZiszhE85kagL9BPHVU+KoV32/DFQloxaxhh1d7hJlmfHCz5YdsUpGaz+4hrcF/W8893b9Yp8qP0tqWkGTwIrhq5EoZH+WxF7ETCGrBHlYYVl2GwIifz+zpFuqlLKPtWht7asJKp7GV5bkc1jaLAtms7k+blyWT5IFcdXj9M+/Pof91yfJi9eHh5ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ByHnHOJkLkEtVK1th4zOX1q6wAreCt30TgQO96GPfUY=;
 b=MWAZOYH4GJstTMPxjdnoG//43jcQeRpxyjIdxJhu6gvtlTyAK0CvYrptCJBCTOBKzQaJws2FSc/39aphqqkR64mpZqaPFZsofYESw/OasXbNpw74G59zAW86ygcBGBX0DIYjaVo8wRPGedefjE1mJmjtHZurfdw1Ns0BxaUuyj90XWwdRt15JKFJBqb6IcOzUGM2yl8hnqjOVA1vGzn1xz1Y/9Iv6oVlYTBtChHIVRbO+t5hCy6rJrcLKT3sbRmN6nZc2EPZ6G6OtesZz+UuMflqKlQP5TbMw/j1/RUALdRpJZsbqYeAmAjfgIuW009trxUIEsPe7zxR/vgJGLKkVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6733.namprd11.prod.outlook.com (2603:10b6:806:25c::17)
 by SJ2PR11MB7714.namprd11.prod.outlook.com (2603:10b6:a03:4fd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.26; Thu, 19 Jan
 2023 21:39:46 +0000
Received: from SA1PR11MB6733.namprd11.prod.outlook.com
 ([fe80::288d:5cae:2f30:828b]) by SA1PR11MB6733.namprd11.prod.outlook.com
 ([fe80::288d:5cae:2f30:828b%8]) with mapi id 15.20.5986.023; Thu, 19 Jan 2023
 21:39:46 +0000
Date: Thu, 19 Jan 2023 13:39:41 -0800
From: Ira Weiny <ira.weiny@intel.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, Ira Weiny
	<ira.weiny@intel.com>
CC: <tools@linux.kernel.org>, Dan Williams <dan.j.williams@intel.com>, "Vishal
 Verma" <vishal.l.verma@intel.com>
Subject: Re: b4 send patch order
Message-ID: <63c9b89de923b_af27e294b5@iweiny-mobl.notmuch>
References: <Y8dqN1DgZ6Fwbk6H@iweiny-desk3>
 <20230119174805.zz3urz5gfwj6mkre@meerkat.local>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230119174805.zz3urz5gfwj6mkre@meerkat.local>
X-ClientProxiedBy: BY5PR20CA0012.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::25) To SA1PR11MB6733.namprd11.prod.outlook.com
 (2603:10b6:806:25c::17)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6733:EE_|SJ2PR11MB7714:EE_
X-MS-Office365-Filtering-Correlation-Id: 457e302f-8aa0-4e01-b86e-08dafa65af1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UgfuzE5R0eJAkQ6a0RfC1llZQwAB15Rs21HYOo8IGR4o74eQaEGM9V5Sz/uQhCqtUm9SWUZQDS5qKTaCtZno60+Rh6UL4zp9NV85KJeh7T7YCLHuniYGeNZIghqn25ZtupEq0sNczBY5S2Vm5896Yt0V5kl2l1lc0ECkbDsNK0UbNcKGNQGD93WVUTBD2vDzr+g4xVsfq0dOb5FeN/nyj1IWATqZi26eAON7b/Q/1+EI9TBSuxaClTalXjFD+ryL/KWmjQsGgl8ckfkpHeL7kArAtw6drfRBYwv0/GrJIf/6TBHvd6/IGPu069kzZvK4UEAYQ6knhXZt0zvVKDGoW3lWCWkwMKOhg5eEcmpSQAjcSNQIteH90AyMXkCuaEOx5PMa42xz+xAfWRaW/LWpWNYOPmVwcXDUJPlpQsQXHS/n9+lo5SrYZMxMDxShsw4bgB4xlcXZrJJRKD9cUpj7WTB3EmETt3KLKNVpFKTnY6oM8s788ig10L5YhsLe10DSps1nD9H+lPZ2hKH77AjkrpWGTj4kdU8g2bupR230uC8t2SK2B5xs6t9Uvh/1gTRX/1x6u+WTuKEfO9Bx5oxDPcgIXIEDi7RbQyaDHndkawIZnJcWHODpGJyjnnemQ1n/AEP2RgMo67axm8BMD2t2QME3eTIlcPsQYbOwQ0DuZj2rpjmSVa+wWNd/Gez8GRV6wim8FdLoDB/t5edaNsi58w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6733.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(346002)(39860400002)(136003)(396003)(376002)(451199015)(6666004)(107886003)(6512007)(9686003)(478600001)(38100700002)(26005)(82960400001)(186003)(6506007)(86362001)(966005)(6486002)(41300700001)(4001150100001)(2906002)(8936002)(44832011)(54906003)(110136005)(316002)(5660300002)(8676002)(66556008)(4326008)(66476007)(66946007)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Frf32YP3YxU5xlI/Ier0Z7hxCfsj/kWKURs54iKDikaqxwqKCOh68hQCSAMs?=
 =?us-ascii?Q?7+C9/wlZOvDAi0juNNV9t9+v0nh+OuZUJWRFlT6MIApHH+RflLBSpSspbyXC?=
 =?us-ascii?Q?8haHwc4AjndVQHOwbQH92yWBH/NEXKPtbhasxzRABrsIyEhxqTuNGXHrynIs?=
 =?us-ascii?Q?74oQOdiWOS0su0sgdhVtBArgxyqKy7nLKLPavgjhiCCwyGcRmVCpJ2VCi6xX?=
 =?us-ascii?Q?ugVAGb3PAHl0+Zv4J3LgpcEHLW+yx10Z1jkw3EpMgn5hf5LT5h94URqNO7KQ?=
 =?us-ascii?Q?MHrAxP4o3ZWi5vozMKrIwqZxLdqVP+Y3gNkpaNDvNg78YB7o9dSNzGHB/Lc6?=
 =?us-ascii?Q?24+Hfx7+uJylbjKgQ40jmN1WR+FTg2+tL1qJG1onQm8M94FCBolgu3TKUe3E?=
 =?us-ascii?Q?+QGVKAmo1qKBn4e+zFKcwhm+Iv/FMeNqNHDRejq1In0fEm7DRrN9jXqlxY85?=
 =?us-ascii?Q?Wb8P3fJmqCbC1bXF48DWutkCKdDULQ4CcveIbo3/NT0jmRgmS6k9CKI071kW?=
 =?us-ascii?Q?oS2kc8HTqrZZamw4MmFXvLLmWIWYf/UMg8Y+qDGLwJl1ilbZU2ZkXGqNKObs?=
 =?us-ascii?Q?KvF2rcGTVgdcR6NCNgLN67WymWhNjTj7hDuq/qbeASYzlHjwrJokuO/IBC+a?=
 =?us-ascii?Q?yRQ8ZwKyIffFjWcXyxVDNQ2mWav/DVuGIXzPGVH6hu4BORQHRK+2kSSUdt6B?=
 =?us-ascii?Q?xLCQz2FpC8nj1ASNhiI3B7Kh/+UXQHCsKtQJgfehs1lQehxSAapER0lGZ3TW?=
 =?us-ascii?Q?T2juLD+ghk5PRwHVTMzJHRO/X3V3d3Vn68ghlFHr6KwxyPR742K1p9me0nHR?=
 =?us-ascii?Q?ffOTycRNcDLpImv1hc59vA6emicSyN97kKfE+QTY8zXN9lvLIAm418MjAoL5?=
 =?us-ascii?Q?Gm/m8jZNyy0GoP9It4qNv6id0HMuauiPgeiA5plropQB12UYKaL1S4CnPaQq?=
 =?us-ascii?Q?IPn2zJQrBVXrfyKn+o9ZJ9UiRiY2HO6og4BuwPusdL2pemkaMMoIylsmZTJv?=
 =?us-ascii?Q?EpFssYD15+xg+H8qiJOUwbXaJ4d6StsqVWWKBuyXW/+jK+IpSjGOB55ylHQB?=
 =?us-ascii?Q?scZlmLQzitwWyLxFpjyNTGhdmPbv0Tx24tp+9ON5HRUP2fIQYi+gUqj94wST?=
 =?us-ascii?Q?Ra+vZIL8ziehd0lfolpfTOP4S6CPFtLNvF1Ce62f1xh4HpJgUntk6YIgTP4c?=
 =?us-ascii?Q?tjRFYhdkiCJWmMYS6WOtcAbt/o6cwdFC+U2YKSg8/bAv/Air0phG/PYt5XAP?=
 =?us-ascii?Q?B3dN3fZPEjPne1dPH19i+YeLbljKZET5Iavz1lwPQ5g6CXLsfyWwYHfTAUnj?=
 =?us-ascii?Q?n1cUh9zyKv5k+p5V3+9urm2JybSvGahsg+GA3vvzKwt4Po8yvObzpD27eaxj?=
 =?us-ascii?Q?S/LEFo4HWS7bqtm2ZMQ6t5uHAKrI4kQNv3OEHgf/tsZmiVfQlH6sZJqxW6cL?=
 =?us-ascii?Q?cGLLBh8Z52iDaRyX4x6FhCEyMbSJYqOlA0kr5Cv3ZaBsQEBhHhqyLd7bKqhm?=
 =?us-ascii?Q?tMborNdyK1w/oOrTknc/SQkbwY5Xfj1j0O0AhUg3gbfHwlDZyhv2joeB1Fw5?=
 =?us-ascii?Q?lbzuyRIJgoajgSPlDGttvDmtmbe72esINfJdsd+T?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 457e302f-8aa0-4e01-b86e-08dafa65af1e
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6733.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 21:39:46.4867
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sdtjoV853Q8D6j80qMGfzRmGruLI0ROoaO4VoCc/79mv2u2Vr+XVj7kMHrN326TUQqmaiPDucxxo78T8PZzt7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7714
X-OriginatorOrg: intel.com

Konstantin Ryabitsev wrote:
> On Tue, Jan 17, 2023 at 07:40:39PM -0800, Ira Weiny wrote:
> > Konstantin,
> > 
> > When using 'b4 send' what sets the 'Date: ' tag in the emails?
> > 
> > Dan and I discovered that this thread:
> > 
> > https://lore.kernel.org/all/20221221-ira-cxl-events-2022-11-17-v2-0-2ce2ecc06219@intel.com/
> > 
> > Seems to have a 0/8 email which is dated many seconds after 1/8.
> > 
> > 	20:24:53 vs 20:24:31
> 
> I don't actually know how this happened. I did find a small bug in how we do
> this, but it caused the cover letter to have the same Date as the first patch,
> when the intent is to have every consecutive message in the series to
> increment by 1 second.
> 
> Even in the 0.11.0 version that was used to send that series, the Date: header
> was generated using the same "series timestamp", so I don't have an
> explanation how the Date: header in the cover letter was so many seconds after
> the first patch.
> 
> - https://git.kernel.org/pub/scm/utils/b4/b4.git/tree/b4/ez.py?h=v0.11.0#n1118
> - https://git.kernel.org/pub/scm/utils/b4/b4.git/tree/b4/ez.py?h=v0.11.0#n1135
> - https://git.kernel.org/pub/scm/utils/b4/b4.git/tree/b4/ez.py?h=v0.11.0#n1178
> - https://git.kernel.org/pub/scm/utils/b4/b4.git/tree/b4/ez.py?h=v0.11.0#n1012
> 
> So, it's a mystery, unfortunately!

:-/

Well ok thanks for looking.  It only appears to be that thread.  Others I
have sent seem to be fine.

For those following along though notmuch mail can order by message id.
(SORT_MESSAGE_ID) The man page did not list this but Dan found it in the
code.

So in notmuch.vim you can use:

+               q.sort = Notmuch::SORT_MESSAGE_ID

Thanks for looking!  :-D
Ira
