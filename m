Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9452CA7
	for <tools@linux.kernel.org>; Wed, 14 Jun 2023 18:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686768815; x=1718304815;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=1PRl13GXFhd3Uso6Ma7FwMUNEhjxbokojmXfWgyCf2E=;
  b=AoDxtp1ZwLotLJV7J1stFWtk1WwTAKIKs9KfqXflANtSK5DeVvI/gtrH
   vKi3TSTeyFjGYog5wWrGv03EW6rsVDgPf1Is4XOOkKasQRqTVGO3PgF8m
   0DcD3Fld0T7XeSpYTAEXMVkn6ePnAUOYb23mu7ogGVv4emRiwgqU0AqtG
   DS8Wq/Q5Jv5AU449S+Sv3rpzMYtc57B7QEG2PPTQchxdViDvnPaSfzuuk
   8Y/S78pg3xIvNnYsG5zgGBVGeruefaiEKYy+qVVSBZEPjM9WjrGmpuq2E
   WXlPjNV8PeP4h7NxJlSTzTIq75/D8lGrFKNrBQLL/Jk8h6W+dn5649iMu
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="357588455"
X-IronPort-AV: E=Sophos;i="6.00,243,1681196400"; 
   d="scan'208";a="357588455"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2023 11:53:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="777377855"
X-IronPort-AV: E=Sophos;i="6.00,243,1681196400"; 
   d="scan'208";a="777377855"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga008.fm.intel.com with ESMTP; 14 Jun 2023 11:53:33 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 14 Jun 2023 11:53:33 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 14 Jun 2023 11:53:33 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 14 Jun 2023 11:53:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JFHdZXPg1X56a1zi82zsxx3mw+BIBwE0HfHc3lrHaK+tf15ZeFQa1TYQO6tIUrcLMqj9RdxeVdllN4Hyf4ZZ4AysOIS/PcGpMv4AG2K6tBtY7ALlrwlPEYSGWER6Fe7sijzYaAgNov+W5uaGJdnuyoKFCbF+x9f5tRrl66XEnd/kyRi/XQ8M69OTKCWReEAES3TSwxF0cvoRB35zqW2Jm8M5Wf2bIZERyAnStlfXVdnHdXecQmICn5O3p2GNpZrfLb8vPzYu2K9bIF6Z0/t4cUe7Cfa0XmwiSBjdnzSV0nUBbAZgMmJvST+tFdIAmHBe4R/ZDJ+fThphDSqQdqFtTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OiiMuzJpkI0B05v0fqsYCMT45zHe8Bmy4y6CqadZwqs=;
 b=GRhcXnPFVl46HC21ieXdpmz1b1Chom9hjkrR/QC93T+T3UIem1Tfco7ahMlXv61aD38HCUHD1bZp937C5opvo24qtM+LY8rmI5HuLbAHXv1JxmIUuPs69KcugEd++Ga3ptzWsYe2NIkD5uEK0O6f0OV0/mNzx97JQFKanoqnJx+6/C0SyO3DN9JFJNqdPB5dNvQ46AyWR8HUHgmcBZmDeL4azoWFn74yBMsKu3KaIBZJaE26flObgVYtWaW+X2q3d2blprwXKfpraKXFTzA9CfMXt49RtdqriflAkr6O1QK1SIpnk2jd+SWH+Hk0S7FqMUk1OkkRDepEE2dzhekqOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ1PR11MB6201.namprd11.prod.outlook.com (2603:10b6:a03:45c::14)
 by SJ0PR11MB5168.namprd11.prod.outlook.com (2603:10b6:a03:2dc::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.37; Wed, 14 Jun
 2023 18:53:24 +0000
Received: from SJ1PR11MB6201.namprd11.prod.outlook.com
 ([fe80::6ccc:155b:3b7b:754f]) by SJ1PR11MB6201.namprd11.prod.outlook.com
 ([fe80::6ccc:155b:3b7b:754f%3]) with mapi id 15.20.6477.037; Wed, 14 Jun 2023
 18:53:24 +0000
Date: Wed, 14 Jun 2023 11:53:18 -0700
From: Ashok Raj <ashok.raj@intel.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
CC: <tools@linux.kernel.org>, Dave Jiang <dave.jiang@intel.com>, Ashok Raj
	<ashok.raj@intel.com>
Subject: Re: b4 pulling from lore has issues when new rev has some new patches
Message-ID: <ZIoMnjHZQ/3qSHbV@a4bf019067fa.jf.intel.com>
References: <ZIn8bVstydHNZZ9J@a4bf019067fa.jf.intel.com>
 <20230614-bloke-aural-hawaii-3a8eb6@meerkat>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230614-bloke-aural-hawaii-3a8eb6@meerkat>
X-ClientProxiedBy: BYAPR07CA0020.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::33) To SJ1PR11MB6201.namprd11.prod.outlook.com
 (2603:10b6:a03:45c::14)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6201:EE_|SJ0PR11MB5168:EE_
X-MS-Office365-Filtering-Correlation-Id: fc3fee57-4b90-4b79-319d-08db6d08a1a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iFWhmbmO3Kv7AwoHVcGoOGny9sQVhHU5um0Tzgx0ztrkXhyRB26H/4kAIZu71PdHui/9Wxbq+JuUq8xOsc700lT+DTJDPqLqwKrOvR8pKmHpO/jBHRgeWGCAQmoHNkJ4JqwBu1iOLPjpS/JOebtlTHU450wR5mScieYNz7WXJo7lcZhupTOVs8oYUVm88BytIdQacY+igm/0Q2p2qNSYk39qwUkvGhbk1ruar+C6tIA5fwVBOWtMS9s/LC/lqgB5Em2JrN5uH2TrzBmZqaBKOwkmPu05137NNilFHqoPbcoOl1LDMF0AVKWWUzEFMr1G8y/u2Afb+2MigzlYrY7B7Uq5gMqEJ/gFOn3GB+p6kZ/GViHnMh4Yvx5wACwUqHGV1oOMo6vSSLk0Dol+hqk9qYhoC9l6UKD0iMhONIrDqbAnYduWanzhaGsYorJeG7oFKQ3Sxz6XC0/Ey1dOpejLNFZwNIP4steZ+tvZ55GRuWZ9FvMtnps+U1diI9p30DhkOETpCJCXPGF1srcluozCJtpCj/FLEv0nO5Nq3qdDcKiZ+Yax8AGJMCMUf2ox5qF7XDvXRkwxWmg/LcuRMOgSAQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6201.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(346002)(39860400002)(396003)(376002)(366004)(451199021)(8676002)(8936002)(2906002)(38100700002)(82960400001)(5660300002)(66946007)(316002)(66556008)(66476007)(4326008)(6916009)(83380400001)(54906003)(41300700001)(66899021)(478600001)(6512007)(6506007)(26005)(186003)(107886003)(6666004)(966005)(6486002)(44832011)(86362001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?REdKQnhMMUVYNU9UVE0zVlpxQ2J5cFN3d1BOa1FaSjZGL2FuenpndEpWVzQz?=
 =?utf-8?B?NFp2R0laS0h6T0cvMHluRldBVFRXSEpIUmtmdWZYQlZQM1BKR3d4RTBjanRD?=
 =?utf-8?B?WFgzU1FBeUF2ekVRa1NZenhtVHgzdlhMNjRYVEpMOW9ZVWtScFpQT0drZkNs?=
 =?utf-8?B?aXdMSGlxWVJDdlFpWmNjSkxZaXJSS2lHNVYvTkFEOUhBUXkvWjlPZ0ZKd0xN?=
 =?utf-8?B?MFEra2xpbU55U2xKc1d0MGRyak9SV2FKRW5VOEl6dlN6Smt6SVdhdlZrT1Jp?=
 =?utf-8?B?TUxlblJMTWFSVllGYlFEcmYxNTEyK29kMWw5dGQ5cnZzL3MzcjA0SzBQbmxt?=
 =?utf-8?B?bTVhN2xJRmlQTVdXeTBudS9FeWhiQXBYQ3hON1J0djNYVXI4S1hnV2FtQW9L?=
 =?utf-8?B?L042OW5wMXArRk5vVEQ5N2tSUkRXeW5sMlFzdXZlbTl2UnRDLzQ3bGg5UW5y?=
 =?utf-8?B?UUxFczFYSHg1YzNFQ1hEcTdZNksxVlMyNEd1Y2hMWlpLZEM1Q2JIMWRGL2wv?=
 =?utf-8?B?ZGRCWVQ5b0JwbHAzd1A5WEx3QmRHOEswK2V2eXhhTHRTZzAyMFhUUWl2dGt3?=
 =?utf-8?B?NFNkSVJmaEhPVFAvbndmeit3aHQvbUVnTTczaGVUOVppbXBPUUNvZmRoUTly?=
 =?utf-8?B?ZCtkMUVEYlM2TmM1dnpIcTd6eXJDcWJHMzdFQzBHMzZEbk5WOW9KTDlZWnNN?=
 =?utf-8?B?ZDhIbnExK2xzaFZNUDJXVGxYSGlSRExFWWh2WEp3VnMwNmlpZFZZTFRQRDkx?=
 =?utf-8?B?WGkwNWVLT0MxTVExMFZVUG9ON2hlN044ekRLRk9ZWlV1Sjk5QU5qNlFFdDdJ?=
 =?utf-8?B?UHBlNHlyWXh2aFRaN092K1V6aGpRb1IrTTBFV25IUk1wZ1NydW9UdytYcEJB?=
 =?utf-8?B?UGFZSkZ5UXFOODIwVG5wMUFiTENkRGx5enFEbi9UU1F0YTloK3NON2IxcUQ4?=
 =?utf-8?B?KytBdkVabyszSkQxZUxZSHkzY29nRmJxWlppSkJCRkthOW1NODZXQU52d2w4?=
 =?utf-8?B?dFc4cnI3eTlSbkw1QTFpdnRSS2JSNmV4RUk5dWs0UURvTmYvRGd1NWl1bzZI?=
 =?utf-8?B?WHBuWkUrTWxXV3c2Mit3dG5Eck5tTHpvQ1k2TXRPSzF6d3FMRy9abmNsRElx?=
 =?utf-8?B?ZDFQTnBzMmJtQm1kMmZGMm4yRW1qQmhhK0UwaXB5aUdqWkpIYTZNSlBSRmNi?=
 =?utf-8?B?N1MrWFpWbmxTMDVPZjdwN2dKYmtoTDlFQ2JsaVBEZUVWOStEc2xNNDlQZ3l3?=
 =?utf-8?B?MysyUjZCZkkxcTJDREl2clI1YlljdjFNeWVjWjJhWXdwbGFGR3VJclVUdXhD?=
 =?utf-8?B?a2x0bGZWZDZRV2RoZ2hWemdFcG10akVMR01pY0h6MFJYTUgweGtxM2JrNXBB?=
 =?utf-8?B?UWdXUENBZTk2SGg0QW9QeUQ0MEVWUzU5NGdPK2tRVVhjaHVxZjY1YUl6b0Rw?=
 =?utf-8?B?dUhiVTEvRGx6SE12WWI3dkw4cGdlT2JKS1JCRVp0eDhhK2RPdy95Z1FpMjJx?=
 =?utf-8?B?N3l4cFRGb0ZSVm16WFR5WmVvVVJhNUs5alJMRjNsc1U4UUVtVXl5QWsrRWR5?=
 =?utf-8?B?M2RqUy9PTFR6bDNmZVNLWGdOeEJ4d3dtMkdKUjlVcXRIa3FaVE05eEVZZGhO?=
 =?utf-8?B?dzRoMDh2VEN1WFd0cTk2cGNzY3JXUWl3S0tsQzhpallVMk1ydVBoU2NGMWI3?=
 =?utf-8?B?ZlFGZzhoY0RlNjdFSHVqQjlBZVQ3QXJRK3JPQk93azZOaGUrY3ZjM21DQWg1?=
 =?utf-8?B?eHF0VTl6dWJhUFNrdTZyT1JwWE5MOGNJT01lUy8zeFRVK1JyeGNhMUhNR21p?=
 =?utf-8?B?Vlk5Y3VHNjRycThmMGpNWVFyMHYrSnlwdEczSGhXS3FrV3hlQUVhQ1VCbmp1?=
 =?utf-8?B?K1o0Tis3d0RockhHc2ZNY3YzRC9kQWk2T1huUmdHMWlPV0VMZ3U1ZXk5V281?=
 =?utf-8?B?aUtQMXlpVUplMDQ2RkdYZjJmemh6ZW9JaHI5dWJnUDhYWi92aisrOENOVzdW?=
 =?utf-8?B?NUFGZG1uU2lRLytkTmFVNEViQ042SEhrOU84OW85dHBTUjBmVEdMeXFnS04v?=
 =?utf-8?B?bk1vYm9XOUtHSWdMaFJZYnJhTk9VaDM1cEd1c2lnQy9mQ2kyZFh4VzJOaENi?=
 =?utf-8?Q?Ntl/AeT0T2houC+RCIFD3qntk?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fc3fee57-4b90-4b79-319d-08db6d08a1a4
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6201.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2023 18:53:24.3475
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rMb+mcwTZPu2L+B/48qPzEZNFsNcav6dDZ5oKE5MuuOm/YosS056vLEhpKtfrV47o8c4bMo6uhSZhNixAmuRAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5168
X-OriginatorOrg: intel.com

Hi Konstatin,

First, b4 is awesome.. I'm just being the novice user trying it for the
very first time :-)

On Wed, Jun 14, 2023 at 02:19:47PM -0400, Konstantin Ryabitsev wrote:
> On Wed, Jun 14, 2023 at 10:44:13AM -0700, Ashok Raj wrote:
> > Hi Konstatin
> > 
> > Dave suggested to send it your way.
> > 
> > I'm trying to use b4 (for the first time :-)). 
> > 
> > I tried to pull from lore. 
> > 
> > V1:  https://lore.kernel.org/r/20230603193439.502645149@linutronix.de
> > 
> > V2: https://lore.kernel.org/lkml/20230613115353.599087484@linutronix.de/
> 
> Unfortunately, you started from a very bad case. The v1 of the series has the
> original 6 patches, but also a single-patch follow-ups claiming to be v2 of
> the series. Specifically, this message:
> 
> https://lore.kernel.org/all/87a5xe8gid.ffs@tglx/
> 
> This is why b4 auto-rolls a v2 for you, with 6 patches.
> 
>   ✓ [PATCH v1->v2 1/6] x86/smp: Remove pointless wmb() from native_stop_other_cpus()
>   ✓ [PATCH v1->v2 2/6] x86/smp: Acquire stopping_cpu unconditionally
>   ✓ [PATCH v1->v2 3/6] x86/smp: Use dedicated cache-line for mwait_play_dead()
>   ✓ [PATCH v1->v2 4/6] x86/smp: Cure kexec() vs. mwait_play_dead() breakage
>     + Reviewed-by: Ashok Raj <ashok.raj@intel.com> (✓ DKIM/intel.com)
>     + Tested-by: Ashok Raj <ashok.raj@intel.com> (✓ DKIM/intel.com)
>   ✓ [PATCH     v2 5/6] x86/smp: Split sending INIT IPI out into a helper function
>   ✓ [PATCH v1->v2 6/6] x86/smp: Put CPUs into INIT on shutdown if possible
>     + Reviewed-by: Ashok Raj <ashok.raj@intel.com> (✓ DKIM/intel.com)
> 
> But then there's another submission that claims to be a v2, with 8 patches and
> a different subject in the cover letter:
> 
> https://lore.kernel.org/lkml/20230613115353.599087484@linutronix.de/
> 
> Thankfully, b4 is quite happy to roll that into a series:
> 
>   ✓ [PATCH v2 1/8] x86/smp: Make stop_other_cpus() more robust
>   ✓ [PATCH v2 2/8] x86/smp: Dont access non-existing CPUID leaf
>   ✓ [PATCH v2 3/8] x86/smp: Remove pointless wmb() from native_stop_other_cpus()
>   ✓ [PATCH v2 4/8] x86/smp: Acquire stopping_cpu unconditionally
>   ✓ [PATCH v2 5/8] x86/smp: Use dedicated cache-line for mwait_play_dead()
>   ✓ [PATCH v2 6/8] x86/smp: Cure kexec() vs. mwait_play_dead() breakage
>   ✓ [PATCH v2 7/8] x86/smp: Split sending INIT IPI out into a helper function
>   ✓ [PATCH v2 8/8] x86/smp: Put CPUs into INIT on shutdown if possible
> 
> > When i try 
> > 
> > #b4 shazam <v2 msg id>
> > 
> > it reports that it imported 8 patches as expected.
> > 
> > I was told I could pass v1 and it would now there is a V2 and pull the
> > latest. 
> 
> Unfortunately, in this case we're dealing with a messed-up situation, so it
> fails. The auto-finding of the previous series only works in perfect
> scenarios, and this one is very far from perfect, sorry.

My bad :-)
> 
> > But the same with v1 msg-id, it pulls only 6 patches as opposed to 8.
> > 
> > It does tell there are 8, patches but only pulls 6. Maybe because there are
> > 2 new patches in the front?
> 
> Basically, at this point we just give up and ask people to stop doing crazy
> things with their patch submissions and please just always send a new series.
> :)

What would have worked in this case? if the subject was identical except a
v2?

Can it have more/less patches than the prior version? 

> 
> If you're trying to get a v2, just use the msgid of the v2 series -- any
> reason that doesn't work for you?

That works "beautifully" :-)... I was just trying the crazy thing since
Dave said these cool things about b4 :-)..


