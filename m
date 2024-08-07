Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C6B364BC
	for <tools@linux.kernel.org>; Wed,  7 Aug 2024 21:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=10.30.226.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723064556; cv=fail; b=AIxuZo03zMVOgCSID/YxDjoz9YnwvTJqvoulSSOwXb6AzR3rZjXJIFu2Quptm6+K7KGqcPF7+v8i1VBHjvDJSxsuyruDY9ctBlN+xOfl1YtneGVDGiLnR1I/wM5I4p22zgI8FvMg7wWJ9cB00rmHKKJvlMHX2sTiZQC/1yiZ1ZY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723064556; c=relaxed/simple;
	bh=62YKvawIapRg/uEZhtNdkCpj1MKOXrVYgrVAdMiDK+o=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nqulmQktzwYvneo6j8uesi4H3iYpRC2g1e6buCVtOPyebsEsgcwP+b/+mo2TEZbBASqmVyztu4eA7ve7Hxp1k7EcDhswGcXJiWVTpYxArDTX8151JN/ftVNkrceXdEJflaKjDKGOePYIGMfumcgkan3YUh65C3bizGYBQi0LuV4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d0LwtpTa; arc=fail smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d0LwtpTa"
Received: by smtp.kernel.org (Postfix)
	id 84279C32782; Wed,  7 Aug 2024 21:02:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 14D04C32781
	for <tools@kernel.org>; Wed,  7 Aug 2024 21:02:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 14D04C32781
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723064555; x=1754600555;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=62YKvawIapRg/uEZhtNdkCpj1MKOXrVYgrVAdMiDK+o=;
  b=d0LwtpTadVGZXHw5iUrDVguvPctAqAttvw5RXJB2irIk06ZTje0ZJLJb
   vUfi6rwQFJiiA8im8Vkh733nC1BH6zGTc5O/+4CacjRm0T3PKh04bBKIo
   GNYt1o3sIrPpzrOsmr8l7WrrVpwjr8rX9wPUFQ4yc+v3TJwRwkEDtwUE8
   xBKRZDuyUkN6donbHw6GZu6tJwQKjjgDrt0HyTuvIDQOqFlkG0e90b5/i
   jUcWCK+k6/PXFeUZsfIg0wV5+rwLRS+DTCHANuTCB0iHxkjtJ07FNHiby
   rbrdmkQmnKfvu0u/ZtQGvQ9yzz9THGw9a5QcypuBuKonYk+CQQFRvxBgT
   Q==;
X-CSE-ConnectionGUID: +xkE2gVHTfekHM4AKXpxVA==
X-CSE-MsgGUID: XTpSkcDQR5mgffpSwLsw9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="21283247"
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; 
   d="scan'208";a="21283247"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2024 14:02:34 -0700
X-CSE-ConnectionGUID: U57/gzj7ShSECxFUH+C/wQ==
X-CSE-MsgGUID: ghrWrat7S1WdGE9ULCtwuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; 
   d="scan'208";a="56943848"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 07 Aug 2024 14:02:34 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 7 Aug 2024 14:02:33 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 7 Aug 2024 14:02:32 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 7 Aug 2024 14:02:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QYYZG2ipJzhGOCXt2+RX6u6e1KtiQZ9upzJzRFP4rJdQC+FWSXuG6hDXYH4p8ArjJTkBlkXAtpZwhsGeJvqTf4y1olTQthZNq0JQWik2lXqbW2GRT6unArxxavrTEYc45EnWj7DPPemfbm/GgTMGyJvTs7Kc1llFrB9enHkHnOEohkA0Jy1rYcOIwXBu+SPaywBKJeDFIgopFHzoYZ1FnNzxhnYvZfGTOA/H6m53ZcrJ/6Oai7iYDryShXSw0UON0wJW6DJfImDiXbei7CmzTQIo6vCxu4JHaceRBX5lEhLN+ccrY3iHrxcOwPPPvnlgep2QP5Lsmy8o/0dcdbn9eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wSFYkoyenfOI1NWwi6v1wt1IF1XjQEpWGzU5XZAu3vc=;
 b=sIcaIjRTtn+UjOcHN050ChrnvTu0hOC6pLZRS/bu2Nt2QnW+634ZfhoAMuClC2V0ebPNNH/jJetKal1vW5+o0DJrecC5C4a2SaESfGx0NGn+i1FOcqSPbbVNEz9yjxiQ56d3NE4dyOydcgHgk1js0k99I6bPpaQp10bWqaTHIo7ki4LVPImI0EDM/wT2u5RGhBeSUPbhcs6KGtT337vshFJoNFumIHZp6dHt3pIX3MpiKUT5IZ0AhgkGCJX6J2jiWESN9NcEPCKfTx+ZMnJxumzgynwyTT/CfHbw5Vu5tAiVE7M3BZ3c0zINMil09fQGOVinST/pAPypBeLEo93/qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5089.namprd11.prod.outlook.com (2603:10b6:303:9b::16)
 by BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Wed, 7 Aug
 2024 21:02:29 +0000
Received: from CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::7de8:e1b1:a3b:b8a8]) by CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::7de8:e1b1:a3b:b8a8%2]) with mapi id 15.20.7828.016; Wed, 7 Aug 2024
 21:02:29 +0000
Message-ID: <0ee57ebe-c1cb-475f-b434-600f8c36b6e1@intel.com>
Date: Wed, 7 Aug 2024 14:02:27 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: b4 send support for email alias file
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
CC: <tools@kernel.org>
References: <a6a4755d-85a6-4bc8-83f4-db374c4f3a03@intel.com>
 <20240807-amorphous-vague-markhor-bb1a1d@lemur>
Content-Language: en-US
From: Jacob Keller <jacob.e.keller@intel.com>
In-Reply-To: <20240807-amorphous-vague-markhor-bb1a1d@lemur>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0188.namprd03.prod.outlook.com
 (2603:10b6:303:b8::13) To CO1PR11MB5089.namprd11.prod.outlook.com
 (2603:10b6:303:9b::16)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5089:EE_|BL3PR11MB6508:EE_
X-MS-Office365-Filtering-Correlation-Id: ce5d3535-43fa-4bab-d9f0-08dcb7243f40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?elBiUTJ4UVZwQWpmbU5aSm9PblROVE4xb080aGV2SGJVYzhHbnJKTytFcWJI?=
 =?utf-8?B?YnljYU9wT1o3blVkZUxWc0doRUZRajEyV0svL2xRSDlYZTFOQldST1BBVDI4?=
 =?utf-8?B?OElIWlMydWl0bFF3SXdrQ2Y0a05YQ29nS0VpVE5kYnViNmpYRFcrbUlscVRS?=
 =?utf-8?B?RUZENEM2OXFxT2lkd29KQzROZmlYUXJ0Sll2RkxCSzFGZWNMR3hZQjFqZTZl?=
 =?utf-8?B?OGsrQnZ2cEgxNEtCYlZPeFFqVjJ2VjRXTURtaHQ2MGlqYzRpYm40dXlaYmw4?=
 =?utf-8?B?ZkhsTnhqVmNNa2pNaHpKTVNpamVMdXgzTEpRd01kUHJxUW1kaDhJL3FCbFdX?=
 =?utf-8?B?OXdzcWFUK1BUcm96aGFXRWZqaWR4MGpjUDhXRENQbkJPYjhIbFBuQWdPUEFJ?=
 =?utf-8?B?cGdEbTV6SG9NU1d2VVRSdVBRTjZ0NFJsdkxnVXhTUTI4bEIweGo5dVhrZGs2?=
 =?utf-8?B?MlJ6MDN5djRSYldZVUxENDFrRHdzZXJnMHhGMFpOYUpJdkZvWGRQYStzUUxI?=
 =?utf-8?B?Mk5QTmtMZDRMdkV3aXVLZ1g0Nm80cjVtSFgvekJaQWFLZUpVQy9LdFFDQnNV?=
 =?utf-8?B?aVZLM0FsNDJUaVRpOVZYdkpQdGtnd2lTNnJlSGRyNGt1L3pRRUxsazRzMERV?=
 =?utf-8?B?ZVJxMVdDT1RWS1ZTWjdoYkoxUmVBbTFHRzdLaS9VanJzYVZseUlOWjdhcVo2?=
 =?utf-8?B?TUVvWTBLYVhIcFIyblEvcjFHSXhEakZqRzhNQ3AvbkJFNnBGK3NSeDVLZDRi?=
 =?utf-8?B?UWZvc2xEaWswcy92NWdRbFhrK3pmV0JyMXJlRFZTVyt1bFNUQkQxRURrdjRo?=
 =?utf-8?B?RWZyREE4ZTdvTEduWmMzOWptV3ppRlBTNktMbzNNMzA4aVE0bVVyakRLZC9l?=
 =?utf-8?B?VkRURTJkc2hObFQ2MUl5VjVRWDV1SE0vUHlFRGNCTFYyN1p5d1V6ZXN1TjVr?=
 =?utf-8?B?b1JHZjBNVVZnMjZoMHJMZVNYSjVCSUdocmgxSXBDOTBnUTZMdVV4UW90YXBF?=
 =?utf-8?B?WGl4MlpGWWl0OEhuNHlBK3ZockdYZU5LcGN6VDYzSW1XNGtGQ0xLNUoycml3?=
 =?utf-8?B?ak9XZ2pFSFI5cm03L2pzWkVFeGlNNTFvYXhvN2E2UGc5NmRjQXZMaVFQOGhi?=
 =?utf-8?B?VHgxdEdnMS9zUE5LWEN3UVU4Mi9MclA1YTN2cVBydmZ6cTN6eUNGblhZMUlC?=
 =?utf-8?B?bGZDaFNya1hsZFZuWTFIMnZIUysrSjIvMHJhUkVxVGtaRUxLL0YwUlhpSzVD?=
 =?utf-8?B?VzdrcldibXZFMFZqclAwbVAwMllZMC85YldaSFZSSUZsM3JpZTdWV09uS0lw?=
 =?utf-8?B?S0M5UUVmdGduRmtLVlZrUUJSQU9RQW1CUXlFc1VJWHpwM0g2WGZaVXU1U3pU?=
 =?utf-8?B?RDFUZGJOVEtGRnlMdmdCSFhTSnIvbUNTVml0elJDbTRJZkdPQlI1dVV4Mldy?=
 =?utf-8?B?VTB0U0JLWlJGVkdJN3IyVEM3SzgvWlpPWE53U2gxbXptdmlZZjl2dUFUVkNK?=
 =?utf-8?B?NWlUYUNpNC8vc25ibmhLMVZYNEV3Y1NTdmlBSnFLcXY2ZWxyNHlMZ2VJM0l2?=
 =?utf-8?B?Wkp3VjhFK0ZaMzRxL1BWWkNDQzNwY0tPb21QNFMxcG5QQ2xjT1E1V2pIc1ds?=
 =?utf-8?B?ZTVvRzBuQ0tlOHZkZUIzaDJBWTZYcXJ0RkYzSkc5L1FGWk4wR0xkK2R1VE91?=
 =?utf-8?B?UnJNdjdyTm5DMUVGalBCVHlTNVJlK1ovcElVbmR4dzZQOEhjSktvUjAxOHJm?=
 =?utf-8?Q?rwybDR8SLEYvcLgnxo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5089.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MHNsamIra3BMK0FlVE9aeWVvL0p2VXd3UlZzTW5iV3NWNnBsK3BKbE01RDVu?=
 =?utf-8?B?MFZFVDcwamFnSHV2dFM3YzJrZlF2dE1qY01yL21ZQTRpcEVxZWgvTndCN1U5?=
 =?utf-8?B?NUU5Si9BZFlBZzRndVVtTklzMlZWTzVMbnI1YjRicGRiK1VnZmMzRWZzeDRW?=
 =?utf-8?B?Z0FaZ09vMWE5R3pBMW5mQWpPRzZ4T3p2LzJXWEowUkZuNW1Qd1dCVzVJSWtC?=
 =?utf-8?B?NmdiT2plY1ltYzJaTXdvR0E0clZzWHJZWEp5cDlkOEFZdUJHQmpRZGhaTFRF?=
 =?utf-8?B?VUV5dXpzNk81R0tIWG11SmU5WFUxdVVBV0NBK1VZcmtqRkRLYkNEcFBGa0g4?=
 =?utf-8?B?cndQZHVuS2NqSm9McGVNRFhONVQ5WlBLNEJxSWYvV2RUZWNBaDgvVDZpTWRa?=
 =?utf-8?B?Tnk4MFJBY1ByaHU5R2hYVlhRcEg2K0o2YkpkZitvZmM0SFFDTU9QVkVOSThL?=
 =?utf-8?B?MC90UGM4ckllc1UxTDlzWDNUdXh6cis5SkIrdzhReXNMVWRMNktaVVVNRWlu?=
 =?utf-8?B?aDdGWlExUGRmUjR4a3gwWWZFWi9BU1l6Q013TVVPaHJWdFkwaitiMzJSdHl5?=
 =?utf-8?B?aEt6dUFRdzkzL0M3OFRMVGpzd2p0R2lEb1U3WTBlNDV3OWQxMFg2OUFEK2cy?=
 =?utf-8?B?cXZvdk5mMFhWRFJpc25jVGZBZklmR2w0SzZxdlhrM2QxY2lidEJXY2FrRmpU?=
 =?utf-8?B?azdyZi9zNzh1dmhBVUJmV1A3THVma3hDMkxjcmk5R1pDNGRocVR0UlZuTzcz?=
 =?utf-8?B?QlNQZTlNT1lwckw5aXgvS1FFS0wvbTUrbFZpTDYrdEJpR0dTUlpXOE1OdnRU?=
 =?utf-8?B?NmYzYVc1SlppdnJoZVJGWUhvc0FLaGl3UDFRc0o5azJmTnQvdGQ1LzNlZlpy?=
 =?utf-8?B?UUFQKzg4K0Q3UytLeWt5SXAvRDgwUklYL083QkI0Q0dsZURhSVNTRWtsaW1n?=
 =?utf-8?B?NVlnazYrNGxSOFpOUUUzc05hNEc3VVNyS3lHYWRpT1h3T1d0RTMyV0pMWlg5?=
 =?utf-8?B?VW9QaElLcVJnN1l5ZjNuSG1wYjl5S3Vubkh4TmovK21WWkNsZVh4THdzaG11?=
 =?utf-8?B?Y3dFK1lrWU5jZWdYYnFaK0QzS0VPNXdrSXRSQzNETkFoOE9xYklGaDRGd0I1?=
 =?utf-8?B?bGU5ZGVBNkpSTC9hWnI2eENLMHZjMk8yMi9JaTQxbHNIT1hwa3k5UFRVVXk1?=
 =?utf-8?B?b1QzSzRKTGdKNFlFUE8wMDkzV0xYMk5MUER2ZGErZXVuaUFFV05Dby9kWFhz?=
 =?utf-8?B?dGl1c3hOd0FxSUs1S09HUkN2OWMreVB5Q09IaFF5Y1pQalRMYzc4N2h6RWdU?=
 =?utf-8?B?aW84MldFallZNHY4Ukp3SkRQTlhBTlB0djJVdDlycXRsY0hNVlc5c2RYNVZX?=
 =?utf-8?B?YWc0bi9ncTAwRU1rYm40ZzhrOXkwekd1Z1N4K09jQjc4VEg5RWhURWFaTnJL?=
 =?utf-8?B?WDl1VUpRSDBraVlCVk01Wm1wc0ovMitjNDN2c3RmNXFGbHozSlkxTDFPVGMx?=
 =?utf-8?B?YW9kVUdVRU5OWDh3RzVjZm1kcUhiSVBWN3BjSUY5cjdHeUNxNWVPZ2pKOCt4?=
 =?utf-8?B?UzFHTnFyZGFrTDU0bllqSm1TMDZDaVpGbElhSEdjNlZjczFCenpPSEJuWWov?=
 =?utf-8?B?aUduNTFoUTNvR2phOWs3MUxoVTRuZlRaUkNHN1RwNmxFNDlJbFRrZGtaK3JV?=
 =?utf-8?B?RXFUZm5qM3dydEVKVUl4VGJGN2dYb2ZlUjdCN2VHdjNQdTdpMGErNFE4M1lk?=
 =?utf-8?B?VFFZWVRnMWJNUnZNMU5xc21sbnFCdm5jM09vTGRzN2ZPNFFOSXFaNEVJajlZ?=
 =?utf-8?B?dGtEM0M5Zk11aU94dFZtN1VjSkhKNkkvYU9WM0dpa1h6Nkt3SXYxR2xuWFVz?=
 =?utf-8?B?eU94Si82WnlCdEp4Nk02WXRzQ1V4WHg0VG11VWhqOTZOaHVKWTN5RzdJNWJq?=
 =?utf-8?B?UDUySFVucGdJTlNpbERNMk5KK3V1Q2kvTm5KLzRSS09oTS92M1dKSTlVMmJN?=
 =?utf-8?B?bmtwOGFLeVg4eWxjYTViM080VU13ZFdPU08xdERWbHU4WmtaQjI5akMzeFJi?=
 =?utf-8?B?NEs0TU1xL3AvdjMxYjVkdzh0d1Ewb1F4VWlYZnJicmdyUjRmL1lrczdUeC8z?=
 =?utf-8?B?b1JsU0xQZEo1bVprYXdDQWF4RlZrZlJjcHFjS2xuQk5Ud1NLWEFXQ0s3MlYx?=
 =?utf-8?B?aVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ce5d3535-43fa-4bab-d9f0-08dcb7243f40
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5089.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2024 21:02:29.2692
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bgLEyFVXf1xMdsfTHx7Asp7hnoTfMz1SrUGqf4nCeehmWhqKBiFaMFFxApEGYqs4fOUcCurHpM/gU8xC2clHdj/vydQbC1aJmY7kUsCI1iY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6508
X-OriginatorOrg: intel.com



On 8/7/2024 6:47 AM, Konstantin Ryabitsev wrote:
> On Tue, Aug 06, 2024 at 02:19:57PM GMT, Jacob Keller wrote:
>> I have recently been trying to switch to using b4 as my tool for sending
>> patch sets. I previously used git send-email. send-email has support for
>> an email alias file which allows specifying shorthand nicknames for
>> emails and automatically translating those aliases into the full name
>> and email address.
> 
> Right, this has come up several times in the past -- the TLDR is that it's not
> as straightforward as it seems at first:
> 
> https://lore.kernel.org/tools/20231212-illustrious-lion-of-psychology-d85d9d@meerkat/
> 

Sure. I guess you could pick and limit a format, but then inevitably
that would lead to users wanting to support whatever format that git
supports.

>> Would it be possible to have b4 either handle git's email alias file? Or
>> perhaps have its own file/config options?
> 
> I have a counter-offer -- suggest on the git list that the --dump-aliases
> switch should also have a way to provide destinations, not just aliases
> themselves. Then we won't need to support 6 different alias file formats and
> can just rely on git doing the translation. :)
> 

Perhaps also just an option to request git send-email translate the
alias itself? I can look into that, I think it would be fairly easy to
implement.

> -K
