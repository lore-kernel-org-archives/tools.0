Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC26714883F
	for <tools@linux.kernel.org>; Thu,  4 Jun 2026 19:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=100.103.45.18
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780600479; cv=fail; b=atk8AUC71TvWu52wvRUawVruKHLWxf+729aR2yCrqrZ6KqBui6G+ASeRNa8laMM241pXpYQhERB9iL9YEO5SRmUhiGDECPvSdkSUIM/hPE4OpXC3k9mJm/JGbkqzUkz8RTs7ExqDn91ykleHDTmu+dWJ15gUwH/RZTTAQSUNfk4=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780600479; c=relaxed/simple;
	bh=0ebYQnsZmQKkGRNLD7y/nMpRrpukf+ysxY5W+Seywlk=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=UnIYAzfGnknb1n/wiVNUK/99f+bRrbPOo+la0WYYjn1Zq9IdyLIpbbSULGy2UnNMIeQ46PnK7uDjAcG/OMAS+dJZbLCM3nQ6l8MbVTu2zUpVTDSdgvlSnWStw/5njO+L4TCmWUSsfHDCpDjsPl1vg9D4lPwn9HaP6k16YARTn7s=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gM2tS7bn; arc=fail smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gM2tS7bn"
Received: by smtp.kernel.org (Postfix)
	id B18F31F00898; Thu,  4 Jun 2026 19:14:37 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=fail smtp.remote-ip=192.198.163.12
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=fail;
	t=1780600477;
	b=G/GXBrvJ1GSHwnUYb1vsexgRDiOyYmTr0NoZzJ3r1UzSQVqRvRaLsk7c4DIysHkZvJxP
	 RQ0fQbBlxbzTRIxavj8CdbruGwotYEHIboKz0btN0lL0w8wBn8poiyQMDqtJ/hwJZoliT
	 rDzNTB5x2nKnDVVHVzPjD3fTkKeJXODqyn2cjKIdB5TsgySVf/kxElEZG0WQ4GVS8XIFt
	 LTnSlP7hiOORp+GQBw1GAEUD9mO+iHFI2wadxL0l/v3cfe8SOt/huD9BrV0UDhJCCeNUr
	 U2T1D2I+MaLiievtihNNzPJpfhQttSYEsJBn0M6n/RkhBF3Rntj1UWz9Nw8XBz9KbtA==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1780600477;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:Received:Received:Message-ID:Date:User-Agent:Subject:To:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=d3sNGVhGBb6fs/Nu+T42ufnOuzLksrkR+7a2ftr0+bM=;
	b=eCjrV0+nZxtDp2cx9rtD9ii5J8FidUxBVRBAsVYcjORKnsQTewoyfZ7WzEPFN5x1Awlw
	 Op8WI3X3aV3couL9E+ylqvCWMPVvt38Ww92DyTSOWzsoavnNKkZqy8Pl2g6/uQWyjvcIf
	 zFAs9s0BkvzKDEPpdzdi8Wq4c3XVCosnMv/4M7h3xybYovH5AnUew5OossQHlRDAummQo
	 JKAUfa3hhbwVleEnxJCijJm43DfvaTktrkdggFWzll8OJadOMhMaOs5e2afc55DKjSjO/
	 UFbWDGJw1ktENY59TI8EdzVQr/43VYgKP+wQQgE1P8WAQYW+Jv8ht1FeVD4QCr1OwSQ==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gM2tS7bn;
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	arc=fail smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0A9E81F00893
	for <tools@kernel.org>; Thu,  4 Jun 2026 19:14:36 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gM2tS7bn
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 0A9E81F00893
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780600477; x=1812136477;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=0ebYQnsZmQKkGRNLD7y/nMpRrpukf+ysxY5W+Seywlk=;
  b=gM2tS7bnlP3CcVelgoNlrBmnJNX97/Ki3hv2poZJwWmWMO8tAG9msI60
   JW03lu1eNrV1Cu3s/5qG0g5QMMgy8KngpNSPNuAzRW5EIWTFhZuQ7qhz1
   SzH9MfP3DNFJFlV5Jgrj0kDIeMXbzl3wD5rs1+C8mVrdC2fjZDuiBidCk
   cNqy5Jye40AhqISgFZo3pDIA+jE61p18+/zNamUAOoophGjmp+Bw9KhFr
   5KGEOyQWtsX9eDiE/tpAV+fI54SEqe2yevo/DFqaeWMbDMDTi7nbQArNw
   3rCizlDsMKB2gblN4dV96bSUXjx9lqbrByZxBycblS555xQ1G3p9oOwTL
   g==;
X-CSE-ConnectionGUID: 5cSAK8RZTdmKZqdRbJ7lCA==
X-CSE-MsgGUID: s6+RWJQoTHqE/dRnvZMHzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="85289726"
X-IronPort-AV: E=Sophos;i="6.24,187,1774335600"; 
   d="scan'208";a="85289726"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2026 12:14:35 -0700
X-CSE-ConnectionGUID: qdAiYAiwQK24i/2qLYLnfw==
X-CSE-MsgGUID: p5MrywzKTjqfZ0WQZEyQxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,187,1774335600"; 
   d="scan'208";a="243545446"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2026 12:14:35 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 4 Jun 2026 12:14:35 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 4 Jun 2026 12:14:35 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.11) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 4 Jun 2026 12:14:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HbRK98RuW6vEc66yX/mJBkGDY5FBFHlf5WOtTVvSY0whtEdeS7tWK0opQd8uVw542XfQbz4W7KTnCWvnZNO0tZ/8Ta0hIWQ9JGNShB6tzNIK8jpfS3m7MddCEaJcMAl7RbbStqmKz0FChozKj5wjhLn3oSnayxyO01mlAWo9AHHL0njREeNZO61hHsBuy6rFWXfnxQgpP/8f+d1LiH8aTtcxhI4YSZLiaidyQN3pbImQk9JSb0Fn25990W8JytjQAPzpRTGfzu+iRzCa8n7Sfzn6AcYfd8G52JZXp6QZSUOUCew40ay4idxWDszDlnqxY9YJWVvD1kUyK2YeFcmfCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d3sNGVhGBb6fs/Nu+T42ufnOuzLksrkR+7a2ftr0+bM=;
 b=olpYD2mlJMhgsVtaXev4v9qqJXDpxE6YxeaVRaB2GQ974S6SKXs3Alrav3M3xNBmkDXcrqqQnBtp8s71ePs8fTvpMEw6KTdG9vcKzj9TcICEH8impyGGVlSv9f4laDztOXNh5RdP8vCr7EQpTXhAa/xPbWpddR9S7wn8vbxWZkFUmTqqpYDCCLrX+EtcqJopiGZP0hlFYvnXq22Lxdnc54aLrSn6a/j7hFf/ekgypy7A4M0TayqdbifFfNg7h6BWHDtCgCdO9ECjFuQzcPxSd3SPYzvL3+jYj7d4XKB0mdVRAKKKLzHOqjjihZHl0d5kCtQSjpg+b5dsc7VgNigpGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7381.namprd11.prod.outlook.com (2603:10b6:8:134::14)
 by SJ5PPF1170C8165.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::810) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Thu, 4 Jun 2026
 19:14:32 +0000
Received: from DS0PR11MB7381.namprd11.prod.outlook.com
 ([fe80::4c39:dfe6:d6dc:6f58]) by DS0PR11MB7381.namprd11.prod.outlook.com
 ([fe80::4c39:dfe6:d6dc:6f58%5]) with mapi id 15.21.0092.007; Thu, 4 Jun 2026
 19:14:32 +0000
Message-ID: <4f82730d-476c-4f99-8f5f-f728fc8b650a@intel.com>
Date: Thu, 4 Jun 2026 12:14:29 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH b4] Prevent interpreting usebranch as a path in
 find_cover_commit
To: Kernel.org Tools <tools@kernel.org>, Konstantin Ryabitsev
	<konstantin@linuxfoundation.org>
References: <20260513-jk-dont-interpret-branch-as-filename-v1-1-220e7b8b006d@intel.com>
Content-Language: en-US
From: Jacob Keller <jacob.e.keller@intel.com>
In-Reply-To: <20260513-jk-dont-interpret-branch-as-filename-v1-1-220e7b8b006d@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0138.namprd04.prod.outlook.com
 (2603:10b6:303:84::23) To DS0PR11MB7381.namprd11.prod.outlook.com
 (2603:10b6:8:134::14)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7381:EE_|SJ5PPF1170C8165:EE_
X-MS-Office365-Filtering-Correlation-Id: 27dc5aec-b8fe-4b45-86fe-08dec26d81dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|22082099003|56012099006|6133799003|11063799006;
X-Microsoft-Antispam-Message-Info: q6m3aMGXyCY9+DQqhuznXHW8F6dP03OyQb1eE8AEusDP4ghSjH/EUfcLVaFNjwtUpzUwfGsvSEv7ycpk10yt0jpqbywIkzRvhiYVt0NLbuXONAaDQ6h0vbv1rXqLlBmiXTQT56Mn4r9eL91n7ki83ws4jSD+5Rr+kAwG+CFRgdS9q8OsndN3fMfrvuFkL9J3ZxwQSZTUjnhlV2tojZWtnQmfQhyZpkCGNExzWg/DoHjdtlUS8hALDGxZZ55r/3f2SU1Rm2t1vjWkEyfYLqeOzkO9jgkwN+JM87LGx+L0BaPcwEdf9VhINeiEg0OWf3BPVbXSGP19VYJ6LufvVfWRuSLkNTbxYuVuH10UJFF6yoiSZLDr5k6mHREs9ny6/Wb/nS1HAvH8yH0zP/UeE+KiICkS7U2wWqss4nfz0ngRiIjZ2O56xl91UV4esqPh7A+VDsUoD6tXwlU2tIJYJaxKOJbLFLUSqx3td5BVPt27xPuqduHN2hMHHminIaWaN8bVY17x1RwEhOM799xvsfr9uxe/GbcROTa9007UrE++q0zVYXo/GS6EaaXlFsDPIXaw2G6b7mfnpeE5J9j36ASSz2a+cmVz5LZHnpB6/Yxyr1i4MFVWR5Ba8jztQ/+b5IiE6uAJaBXD6xi4CLFqmoeQz45z9oUCa6NbTyL5qv8kS+4I4B+/vUQUyJ8WcXHCtM5N
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7381.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099006)(6133799003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RU9tMW9WbGhmd3NIbHE5MVRDdWZSVFJFcE5IRXRJcWkvM2dNbGJGMDF5eUlE?=
 =?utf-8?B?NnhURkpaN0VwdnZWWGF4OXhLamY2L1c1U3luR3c1WmhveGZxNGpPQ2h2UUl5?=
 =?utf-8?B?WHhnSUJGSU5CZXRrNUg4bGhFQTVLcEVta3pwbjczeUw1Tzd2bk9mNXliNHNI?=
 =?utf-8?B?ZFJQYXZWVmVUQXFQd1MvcnFRVWdlbmxaUVZGWUw3dkJ2TVhPd0FEMHRaL3RU?=
 =?utf-8?B?VkxPWG0zYVlReExiUU5xZGVMVGlFZnF6S05pUkl0WGNWd2hVeVZ2ditnRmRE?=
 =?utf-8?B?UHNLckJmUkpaWGRBWGx6Zmsxb29YTWdlTytpc3dzQjVORks3MUNZL01sVGhl?=
 =?utf-8?B?REIyOTl3Nys0SHlqTW1PR3BaYzF2Nk1FcE12ZmxYRGpvbnJObXE2NjhsUTMy?=
 =?utf-8?B?NXJIbkxiTGgyMDk5QUE4QjlmN0NWNEh6VW41NG0za3lZRERkWVIzSHhVMkJm?=
 =?utf-8?B?S3hlVjBrdzFzdXNSTjc1bmNEb0NiTEhWVkhuNi96UE91U1BXN1hpMnhUTnIv?=
 =?utf-8?B?WDdTb3NBRUlJWUxUUGgyL1hiVXU5V0RlSEkxbnkrK0dCTytRMzFyU0VsdjVy?=
 =?utf-8?B?VHRyUGNDblQ1dlM4cjY3M045Z1ZvbFA4ZFRUNHFPOGtzbmFVdzBUUW9DZlNt?=
 =?utf-8?B?SEltamVkb2JUem9mbDEyZjl6am1sdU9zdWoxYnhhdjU0MWpOZXNlaE9FWHpv?=
 =?utf-8?B?a25wcEhMZ25hTjl6dHNBMlpqWDdLV0YvWWRNS0dENFhiY3cwMW04QXhnSEJI?=
 =?utf-8?B?dVlXVk52M0xPeEFuZkI3SXZzYkNEaFl1dmpiVFdiaDhLRjdWUFY5N3c1MVJI?=
 =?utf-8?B?Wit3L2FaelZVTFYxSVN4VDBORng4b0M3aWl2OHVBc0VBUmNzcHRKSFdLTUVL?=
 =?utf-8?B?ckh2ZU5iYmpUYUM5dUtWR1k1T3NhYUVxSzNkUXFKOGtMcUxoTGNQV3JWRmtV?=
 =?utf-8?B?c0NRMnlLYSt6MUFqY1dEUURoamtOMGhhYTZaNWxvMHE3d05ycm5Jakl1aHc0?=
 =?utf-8?B?MDR0dG1QOERZUERiRmhnOUhHTnQrVHZNUzNYVXBqYVFwMVB3bFNTTmYxMHkw?=
 =?utf-8?B?ZFJlVysxOUpieERzSVc0ZVkyMXZxTi9GeXNETCt2UmtuMURPeTBmMWdQYklL?=
 =?utf-8?B?aFYwQkluUlVyY24yY3N0RDVlZ3RYcEtLTHdXaUhIaGJQOTFTZTNkV3Z3bWlX?=
 =?utf-8?B?dmZVNzVrUXhXT1hNb3Jsc1hFOTh4QkZuNm1QTHI3UDI3Qk5jd3crU20wV09G?=
 =?utf-8?B?aVRVZkRPUUcwS0xhV01TdzRuOXJMYjZ2N2h3NkwvQk9ROVJ3SlRvd0k0REh0?=
 =?utf-8?B?YTcvRmFJVzZvTXZaenFGZHY4azFTQ1ZFTklGejUzZXh0V3BDK0k5NHFHTlhx?=
 =?utf-8?B?czROQlFxYjJNVTRhbnJIZTBJeHJjQnJHbUowUVl1aGVPYzhHMEx4Zm1zSWpv?=
 =?utf-8?B?R2dMSkZCdTlUZ2FvSXE5UURjZ3liUVM3UzN5WGFmRHhKZGdiS3hUUENJUy9U?=
 =?utf-8?B?SFJUQ1NuYmNlVVZRMDBBWWZDVUVIVTkyYjR1R2RPUnRXdTNpMFNYKzA2ck1O?=
 =?utf-8?B?Znd0UWp5R2VqOVZjWFNOTWhEdEJFZzJ5WFVFUkt3L2xWYmRvU3A5YTFvVTRU?=
 =?utf-8?B?YWY2MHJ5RnJ1bTcyUS9OUjVqTTRkazJySmRKeFUxSHZveW9Kd2pkWkJXZVVZ?=
 =?utf-8?B?Z0lMTFE0aGUrSDE2d29vWmJOM2FoR294OHlpTkVHaGcxdnJRT3BCYjEySUc3?=
 =?utf-8?B?aGhJcmltV09FNlY0WEZCcWNVcXpWRk1ndzJJZTNQWEVhVGJ5RmZkR05kTEwr?=
 =?utf-8?B?ZG5tdE5ENXAwRVVqK09iYm84ckhTbzZxaWQrdFVSWjFIayswY2hlVm91NmlT?=
 =?utf-8?B?MjVDYkN2akYzclhCS3RPb3JsTmcrNlovN0l2N0hVNk5GNmxMRk1MY1A3RTkx?=
 =?utf-8?B?S0NaWExBaFQrR1hwN3NiaFdlcGpZR1o5OHVEbVBQVFJZakVzRFdMcnZ6eTFD?=
 =?utf-8?B?WEMybHdoR1lnVVUyV3B1cFE3dlpnVkM4Z1QzR0JmQ1FqZ2QwZjYzWm1waEFU?=
 =?utf-8?B?U0tjWnR2Z1dFWG1Od3NEYi90QW85T2VyUWhWR21qSU4yQlErTCt4a0d5NDJJ?=
 =?utf-8?B?MmVwSzBWaGpVWmlZVXVRSjBjQUUxcFp1TzhMb0dacEtrcUxNV1lJbjR1c1U1?=
 =?utf-8?B?cjM3dmNCTkdRMVYvcXN1OUNiRFNITWt1c1pZN3RBN0ZZVlNwS3k1Rlgvb3Vj?=
 =?utf-8?B?cytoVnZucGgxNWhBY29GVnNNbms1M08rK1cyMlBQV2NndVJOOTV0TkZoUmxp?=
 =?utf-8?B?ZWtNRWc4TDgvOU5BS2lmL016SThjWWRrQWNxUmtJQWtzQ3AwMDFDdEFneSt0?=
 =?utf-8?Q?dBKTx3SeNKKNzoYk=3D?=
X-Exchange-RoutingPolicyChecked: c7nXUt4P7fSL8kU06AyJkivcfik5Rzz3ixHUG9Khq0PpWsMakJuhKrsns3N+9lXawT3dVjpjzqpvlNlSI6fMIaefVrx+15ZCZEGPjzVsLeSi+UpMTM+jPAW1L6BexzCb8p2W0WTrFKeV/euy5GPUFHNRbZ3g3jTexcmFm6sqdffLYwrWPvAj/0F/6iixS9mBzOIRIjsLgQvuXaNmLLS9kSmN0g547p6+berJWfZ33KmrCsTZ9AwfJZNHYmAug4eJc0AbjRTL7jqs4yfcMR3buBFFjfQZYK8Cg2tDqq/4mr8PxGcUSROgWzFI7QJRL+CKjdz6Ul3+lye9cB5wIieWdQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 27dc5aec-b8fe-4b45-86fe-08dec26d81dd
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7381.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 19:14:32.1244
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UmsbLs9T5lNgOlqAzJQ3ZoP05nxFvZAwTuyqeD2WD9LMRnokuTV6Y0gaYcuQUdupqzV1Xi0O7KWXjafN33aPbZQ961wTgYqilsRShF7WISU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF1170C8165
X-OriginatorOrg: intel.com

On 5/13/2026 2:30 PM, Jacob Keller wrote:
> b4 can become very confused if the current branch name happens to also be
> the same as a file in the root of the repository. When that happens, the
> find_cover_commit() function will execute a git log command that can
> accidentally interpret the usebranch value as the path. This results in b4
> being unable to identify the cover commit, and assuming the branch is
> unmanaged.
> 
> Fix this by adding an explicit '--' argument which ensures that git will
> disambiguate and never interpret the branch argument as a file name.
> 
> This addition is sufficient to resolve my case where I had exported the
> patch series using b4 send -o to a directory with the same name as the
> branch. It is likely that other git invocation sin the b4 codebase could
> benefit from explicit separators, but I did not go digging.
> 
> Signed-off-by: Jacob Keller <jacob.e.keller@intel.com>
> ---
>  src/b4/ez.py | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/src/b4/ez.py b/src/b4/ez.py
> index 3e81138e2dfe..d1e2fba76ea9 100644
> --- a/src/b4/ez.py
> +++ b/src/b4/ez.py
> @@ -902,6 +902,7 @@ def find_cover_commit(usebranch: Optional[str] = None) -> Optional[str]:
>          '--no-mailmap',
>          f'--committer={limit_committer}',
>          usebranch,
> +        '--',
>      ]
>      lines = b4.git_get_command_lines(None, gitargs)
>      if not lines:
> 

I didn't see any reply to this change. The fix is minor and helped me in
the case where my local branch happened to conflict with a directory in
the root of the repository. I'd like to have this (or some other
solution) applied so that no one else runs into the same gotcha, however
unlikely it might seem. Without '--' git doesn't always disambiguate as
you expect and in this specific case it doesn't even fail, it succeeds
and causes b4 to act as if there is no cover commit.

Thanks,
Jake

> ---
> base-commit: d5d981426ead3f490713ef5d2fd1aa3d0f13b005
> change-id: 20260513-jk-dont-interpret-branch-as-filename-e4cbba6f400f
> 
> Best regards,
> --  
> Jacob Keller <jacob.e.keller@intel.com>
> 

