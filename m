Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84CA024468C
	for <tools@linux.kernel.org>; Tue, 30 Sep 2025 22:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=10.30.226.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759272074; cv=fail; b=MBrsNHf42hN287r1xWkmknhSbdfCyUvZ1Nv+VL51BGlx8QtdtLz6gUXqvlLrIxXYF7kOHRCEoIRDOi+lmQNwDfNC1d4gKQcOZ1rD7NUKGanEVNsyB/yeVTl1cI8puCO9WJf5yt4+LtVBnMS3WAXKW1OGQQn6T+KN1b4OkEMSj4s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759272074; c=relaxed/simple;
	bh=n6zdaxeG+846aQL4vacQFBWJqzu28EXuCWNh9TDKogo=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=YJ+CbZtWx8uOrQS6h6RDqvQNbrwPaV+WjKisHMjqHGxsDACHR2e98w8XYZpfQm/HC1puDOro8sOCRcgporwF1gQyh75UoWtys70iw/uqF+my2pqvNOSt4PHcIzzpik6Uljrw8yGHBd+GP4lpVNIw9dt6YBVq8odLXvO2poUI92s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OiygV48F; arc=fail smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OiygV48F"
Received: by smtp.kernel.org (Postfix)
	id 31791C4CEF7; Tue, 30 Sep 2025 22:41:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2989FC4CEF0
	for <tools@kernel.org>; Tue, 30 Sep 2025 22:41:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2989FC4CEF0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759272071; x=1790808071;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:mime-version;
  bh=n6zdaxeG+846aQL4vacQFBWJqzu28EXuCWNh9TDKogo=;
  b=OiygV48FPxOg3MWo7vFtRbbdBoJfCR72GDO56cJrikemNHltDWpCCe0b
   eiFx7OZBk2E9ji+w4S/FposvS+yTVXeX7aOiDzwbaso+ZZrtFYPMjs9zP
   0T5Ft4DaFOGwCcwopwDFuKNk50/VvbZ+peXG/GhWMJiUq9DjkrLsHxPj5
   vE2+thgkU8aZ7Imazyqq4bler/GoncB6qUEjPcaQaPSjFXAEEbcraRRLk
   SAxU43gBNrssrASxnEFKhg4nBH2bHYMeYw3PL1vnBe5LwVi29cjbkPVIK
   2k1ijbNVZ55IJPujXFmPReB7n0dsw385BUh/E4XjPiLc/VGWlCz/mbW+S
   w==;
X-CSE-ConnectionGUID: hT2JVlQySlebW2PjjvWnkQ==
X-CSE-MsgGUID: P/GLRy98RHO4Y/FpD+pXuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="65396720"
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; 
   d="asc'?scan'208";a="65396720"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2025 15:41:10 -0700
X-CSE-ConnectionGUID: sRGnCLC+Rs+ZtZCLLf4r7Q==
X-CSE-MsgGUID: UaZlYk7pQSuQkbmoIFYGow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; 
   d="asc'?scan'208";a="209593500"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2025 15:41:10 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 30 Sep 2025 15:41:09 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 30 Sep 2025 15:41:09 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.2) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 30 Sep 2025 15:41:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rzSMcgOlJsTHLokK2WBbQBk/TFWQWYndGBcYtGJczvPjY+A/bJMn7fyZ7HDpgP4K+3XGaoHa/VdtF7b/+xtzEUPReTCYtS+F8I1IgxxZjNSgQJno/u6qfej3zLwUJHdQwgBxpwTE0GqbddL3eyNyXGyA1Cgepkj+SqhC1vBG5K421KmwlB6s5EJfXCkzE9bqLgKDdo0FnKrRmSnIIEXsP0toFyHEEf4oQ3WnUBsR487WR0rUkoS7enqB42CIgGFfvcCQDMdIhU+qYdq9gHmXyKz6MzR5JX+YQQuwblii4w0FCUY2npBRUaW3DqN3IqpkrskpkLSPLbt9X0alyl2Ilw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C4fFJygqBnRx/tFR08uJNLRFbjV106zBdh1S91H84TE=;
 b=Gf6I4/L5UpiPvfsbErU+hVXJb6mZ/wkHCgk4mwOnjQKfyhUEA1KWi2nLi+rjjmjmZjI8dYU2/ny+FSe7Bhw0pkIr5J6zMaNNK/flJdRmlJxVeqYRfoiUaBG/jYDKmmOojXXPBxCtuNUp7j7l3l+CeM8iM5RmGBPFIHx+oDkEnE460Mhrr3rnDpTlZ0kCclLj3ZtN5Bj7jjOJGEqTtwWaZXBjlMVQamFFsEvOP0MBtpXAsHL1z3sDuOmYGr5xpAFG1mB30TklcSwCZi11akYARBXHmjxrGyZb47+a8TbQY3+OYzXjJ6WyaOLv9tMavm4JEb5wsLV9a6fJKkylA++w4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5089.namprd11.prod.outlook.com (2603:10b6:303:9b::16)
 by BN9PR11MB5324.namprd11.prod.outlook.com (2603:10b6:408:119::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.19; Tue, 30 Sep
 2025 22:41:07 +0000
Received: from CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::81f7:c6c0:ca43:11c3]) by CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::81f7:c6c0:ca43:11c3%4]) with mapi id 15.20.9160.015; Tue, 30 Sep 2025
 22:41:07 +0000
Message-ID: <428c3b47-ea90-42e3-82ee-77c439ba107d@intel.com>
Date: Tue, 30 Sep 2025 15:41:06 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] b4: support send-email aliases
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
CC: Kernel.org Tools <tools@kernel.org>
References: <20250709-jk-email-alias-support-v2-1-b0339905964e@intel.com>
 <20250930-carmine-butterfly-of-atheism-219f12@lemur>
Content-Language: en-US
From: Jacob Keller <jacob.e.keller@intel.com>
Autocrypt: addr=jacob.e.keller@intel.com; keydata=
 xjMEaFx9ShYJKwYBBAHaRw8BAQdAE+TQsi9s60VNWijGeBIKU6hsXLwMt/JY9ni1wnsVd7nN
 J0phY29iIEtlbGxlciA8amFjb2IuZS5rZWxsZXJAaW50ZWwuY29tPsKTBBMWCgA7FiEEIEBU
 qdczkFYq7EMeapZdPm8PKOgFAmhcfUoCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AA
 CgkQapZdPm8PKOiZAAEA4UV0uM2PhFAw+tlK81gP+fgRqBVYlhmMyroXadv0lH4BAIf4jLxI
 UPEL4+zzp4ekaw8IyFz+mRMUBaS2l+cpoBUBzjgEaFx9ShIKKwYBBAGXVQEFAQEHQF386lYe
 MPZBiQHGXwjbBWS5OMBems5rgajcBMKc4W4aAwEIB8J4BBgWCgAgFiEEIEBUqdczkFYq7EMe
 apZdPm8PKOgFAmhcfUoCGwwACgkQapZdPm8PKOjbUQD+MsPBANqBUiNt+7w0dC73R6UcQzbg
 cFx4Yvms6cJjeD4BAKf193xbq7W3T7r9BdfTw6HRFYDiHXgkyoc/2Q4/T+8H
In-Reply-To: <20250930-carmine-butterfly-of-atheism-219f12@lemur>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------woQJNKIGnXJV7UTcDebtdMBi"
X-ClientProxiedBy: MW4PR04CA0050.namprd04.prod.outlook.com
 (2603:10b6:303:6a::25) To CO1PR11MB5089.namprd11.prod.outlook.com
 (2603:10b6:303:9b::16)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5089:EE_|BN9PR11MB5324:EE_
X-MS-Office365-Filtering-Correlation-Id: 131e827a-c350-41a5-7994-08de007271ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N1QyWWVUUncreTdxM0dXSzFDN0JRYVllRGdreGlQUzFoV2l0T1MrREJKTGZW?=
 =?utf-8?B?VDMyWEVldDhpancvbjgwcEhaaitCYi9lNEJqVSt0V3FaalhnekdleFlPTkJP?=
 =?utf-8?B?dEExNFE1Q05PNTVqdm5rYzdZcFVlQlZrV0VGZHMxOVJKeVFiRHdMNFJ3N0t1?=
 =?utf-8?B?aVJvSk9sMzRVSHVrdW1tSnVwWmFQc1JCS0hUMFU4akpxcTdMdGF4L2M0cUdo?=
 =?utf-8?B?SStHTm8yeTFFenRJMHVDeVFvMTBQdmkzdlo1R3RSamQyaU5zM2hKbWY1dkFS?=
 =?utf-8?B?cjdEK1c4NHdRQTNJRVBKblp5cjRoRURrRTIzb0hhRkRzdXBzTzM5N096cnZ4?=
 =?utf-8?B?ZkpmSkhhbW9jSk9URVl1WW9NRU5vR2J0Ty9MdTFiRUEzYzI3MEFIZGhtWkJy?=
 =?utf-8?B?emN5cGtwMDlDaFlsNmk5dXhZeEFBbnMxNGJHNE52cXpUaVora3J2OU5pYWs5?=
 =?utf-8?B?ZkRFMjNzdWUxYlhVQisvR0RhRUpNbHJ5MkEwcHRVb3JKQmJOVzBTQUVGYTVC?=
 =?utf-8?B?Qkxjbi91bmd6Smw3dGxNTEVCSWJqaHRRZnVXd1RkT2pka09xbEI0eFJiTDd4?=
 =?utf-8?B?ZWVySTJ2NzFQZEFGcmNhYWVmQ2ZYbTFxYmFHL21oNjZWcDVYcEdMVUp3VE1B?=
 =?utf-8?B?a1NWemtsL0svbytPbzFOQWJYeWRjSnRBSFhDVHpGUEcrSlpJc0RIblk4OFJt?=
 =?utf-8?B?cVRjVE9jR2NUY0ZYZmRySGNuY2NBcThCWERhb0xxR0JlZGVaRjd6NFlqMnRY?=
 =?utf-8?B?K2J6MEdZOFU0UnEwSlF6dVZSYUxxamF0S0ZLdm1iSDVnQ1lRTENNbko4TnpO?=
 =?utf-8?B?SjVnOHhzMHFsMGlyQ1VXQmF2bzljWDF1VnNRcnFxb2J4aXRTemt1SDhRNThK?=
 =?utf-8?B?WnpUN0RMOUt0b1hINE1PYVFYS21Jend1UEh5b0xIcU01cTRqOVNWQ0UwdkNu?=
 =?utf-8?B?dTZOR3dHVHkrYUJOLzRyWDI1TTVZS0RIalQyc2xTSEdadHdhUHlnSDM0SjNR?=
 =?utf-8?B?ZEtQZ29RbWd1MlhEUVdUa2gzUGhQSndqRSt6Qjh1S3dpSTBnRTBzb1U5Q3pt?=
 =?utf-8?B?ZWdYK2RYaW5rTktpemRtcU1hOTA0ZVlseXljRndQQjZvblN5Um4rVUovZm9j?=
 =?utf-8?B?YUtrZVF4VmJiVWlIYWt5MVRnbWx5UGRMZkpzQXJ4MVphbXpkMWJGWlFjY3Yy?=
 =?utf-8?B?WElvK2xxQ21mNUVIR3pmamp6STc0bS8zamlRalJxQnl0dHQyWmh6YzUwVGZh?=
 =?utf-8?B?VGUxQVA2OURJeTZxc3FpNGZzMlV4UThmck53WTArNVhCeUhkc3JMdTR2UEd0?=
 =?utf-8?B?bTVxMXdzTFFLdkN2Q2M5TU9tRTRGWXEvbXFwVWh2UDlVQVFBOFZheG40VkVZ?=
 =?utf-8?B?bEp5VHJjQ0R2aml0NjU3RlVLUVJqaHlUZStYeUlrQ001N2ZaWWp1MWN5L1VP?=
 =?utf-8?B?QXVJODFSOG9zdEJGT05QM0NYMHNBanRxZ1hlVWg4MWVkZm5DVjVqR2tVTXNh?=
 =?utf-8?B?VExqT21ZUFpGL3dmeXRHRlhjUUZhYm9QWnpYU0Z6QVpaRTY1NHFoUjhhejVE?=
 =?utf-8?B?V2xEL2dqY1lpWk1pQ29CN2pTUUczUi8zbC9EK0hMU0ozbmlLVURDQTNiZm5R?=
 =?utf-8?B?NTFqN0lsU2EycnZKZ2dPWjlnWDN6VW12M0hXdTRBZ2E3MVdJR0hpaStnejdI?=
 =?utf-8?B?Q0FYaGRxWnBwc25sQUJtbG1rZHRvQ1FrVjRnSUJ0OHJLOVJldjN5NDhoN0R6?=
 =?utf-8?B?c1FkbjhXczFxZHFsMVhUMXZ6RWxRV1hFVmZ5U3dOWUNOMVlJVHhlTVp2bXBW?=
 =?utf-8?B?MVNjbmEwek1FUFdlN3ZweVpSN3FsTTNZNkVEWlBqN0ZZTVNyN2NxQ1RNMzcw?=
 =?utf-8?B?bGQ0OTNZZHQ4L1BCUWJaNUQrM01sNWlLMDFvZzlzRjBCbG8vVXdHbnd0dUtk?=
 =?utf-8?Q?uvXT8kSAPkuVf2MGopM4sjRp8KNi+O+4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5089.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eW52RmluM0x4SlJCekp3ZjEvWWkraFkzcEhGQ2VOZHJvaFhQQk8vY0p1dncx?=
 =?utf-8?B?eEt5TkNJV1U3Z0xlTVJGZlFhWTZhQXZDN0ZrZnVGMTFaY2gwU3BpelVHU21m?=
 =?utf-8?B?QU54QUxhTGIrZlhLQkZYUkxJUXBVdW12RWJrbXp6ajRkL0dqRUtqUU1wSnJl?=
 =?utf-8?B?NWIzamZ4ZnNIU2VYbHVzVE9TTVUxTVJVM3VKYjFFT0JodzJGUmg1TGJpZWNa?=
 =?utf-8?B?SlYvOXZFdzB2Uis2aE00UFhNUEc2TGE0ck9FQ2FwUHB2M2hQaDRUdDRjZmNI?=
 =?utf-8?B?d296M1VxRytUUmVSM2cvNG50NE5lSzlUdi90bEVKWjF3bm1Pdm1YMHg1d0VF?=
 =?utf-8?B?VnVQaXlTeFo3dnN6czNnbytCM3NTY1duWEl1QjJWTitJek1PaUxyTHJzMjNk?=
 =?utf-8?B?d2tpOVJVM1EycXRLRjFSc0pRaXlKMU5kWFhlVU9nYzFVOWkydTh4cFVTdFk4?=
 =?utf-8?B?dFpWMUExTmdJVHFHU25TNkJLNElrVGlzZkhZSVdYM2pKYXZSOTRrb3ZPV1Nu?=
 =?utf-8?B?STgxdlNldldiUEVRYnVjQUltcEhidld2Uk9mdWxuOEdJQlBsdXlZdE5LRFN0?=
 =?utf-8?B?ZSs5WW9XLzZOVnl6b0xzZGZBbThWVDNia2lKM0grMUhXVkFLeVNKNWJzSzh5?=
 =?utf-8?B?cVBwcmR6TENEekMwQXh4TmRwMHdBNnEwYUNZeEU2SFZpOGswSXRkZG9aUnpw?=
 =?utf-8?B?MWtWdzFjb3IzbGlrMUttWXJUNWVnaVJwOUloNTNDYmVWSnQzL2tHVVczdHBi?=
 =?utf-8?B?WE5wM3ZBZHVUVnhESmVYSkQ1dlNZa0RTczg1SFJkajkraCtZZ2NPUHlrcGxD?=
 =?utf-8?B?eExkeTVFUnNGS01UTVZsTEVZZ1dhRUFEK29vZDVlSDBtbnFSZGt6R0tYYktN?=
 =?utf-8?B?LzlHdG9pc2tUbURIRlQ1cUsyNS9yc0plVHNnWWlHVkZxeWZaVktyM0REbG9N?=
 =?utf-8?B?YlUwUTc2TzZkUnZJTk5IWVRmWUdLcEFJK2hudkZDbW9LYk5SV1pEZmV3RHVX?=
 =?utf-8?B?RTU3KzlrYlA3ZzMwNVFXdjM3b3piWCtrYXVPWkdKMEpnY3VuckdvVC9SdUts?=
 =?utf-8?B?RTJ4QTYxS3hlMEpzdjRWRk1wTmE3ZnpSTkd2SFVkWkEyYTNyNGZxU0l2Qisr?=
 =?utf-8?B?N2R2ZWVqVlZtMnlmQVRnTllhaUkzMmZodDJVWU1kSFNvRTIvOWwyN2ZXWVZq?=
 =?utf-8?B?c2NibDZCSnRzdzNBQ281NlA5UFRGL3d2RlExOEpWQ2w5MFRkMVBOQmtoR3Uy?=
 =?utf-8?B?TXRndWlsS3JBYnhOdElkMWw4TWh4NjFuNlVDemZWaEp4YzF5ZlV6YXBydDJL?=
 =?utf-8?B?MEZvSUMvY1RldEhoN0ZyZlVKRURmbkNCZEQxcyszZFN5aWNzR3FQT1J4d2tU?=
 =?utf-8?B?dE90Q3hPcG1LRktuK3g5TTFmK1dBY09qYlFDY0tHVWpGS1FhR0c0ZUowMWpK?=
 =?utf-8?B?cU1WanVUdGRCcmNDc2I1VFpweGVJY3JIUjVZWS8xTXFDWWEzejVSeWR2a2J6?=
 =?utf-8?B?WUZXY0wrcnkvMTZ5MWI0YktTYnZsaVAxR1k2UGZ0eUVMMTJJWmlvN09oSU9v?=
 =?utf-8?B?eC9wVkZkSkFpa0ViNStVNmIxMlFGbVFrYVZ5MG1weUZ2bDR5dmNJTHhJbWJH?=
 =?utf-8?B?TDBUSVQyUWtXVTR1Yld5amFiRXNLZDkwQUt0Rnd2M1diQ2UzYW5JS2gvN2R3?=
 =?utf-8?B?UUtSdU1MNnZhVFVpOWoyQ3R0Q2pqaldrSGZKaEpBSDhQZEJZenN2ZzE3QkM1?=
 =?utf-8?B?RHdtSGhRR05tVUFlRkNMb0NJQ05CK2liTm8xZlhHcFJPdG13VkxLVk9VU09J?=
 =?utf-8?B?Wkdyckh1K2M2b2MydWp4dWtiVHJkalpCcFVJeDBWUTJvZVFBeW52VVE4VVYv?=
 =?utf-8?B?bFNRZ2tMMHZFWFhSNlpRanV6RGpLNy9HNnoxR1A5WWZRYWtGSmlrRGRUeHdN?=
 =?utf-8?B?bE5lQU1MMXc1dVdzL0VuckVpUjIwZURGRE5wTnNDVDEzL05yN1JSUkU1cG9Z?=
 =?utf-8?B?SWJUOGRZVjdVc3lScGFwYTRtRVFGUk9xYVl1VkppamROVlNxOTFQYkRmdTNY?=
 =?utf-8?B?M1RuaWZmQWhPT3o0ZUFTRGVuV05PaDFPWXpTcmw2cEV6eHhOVDRYZDE5UnRY?=
 =?utf-8?B?clBTZVdmMWxqVlY2amdVbE9VZXl5N3RGWUhraTN1M3ozUXB1UE1VeVpEWUNk?=
 =?utf-8?B?bUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 131e827a-c350-41a5-7994-08de007271ee
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5089.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 22:41:07.2234
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SxuSTgVtXeNOF+ShDjjwldcPJ+DZpA0uKB97vmhWzGfNaOgLrvOcvjvnQLONIp//AkYCxVrxx+aNrjNTyJWS+/DE9WCTMu2NjYbUmdmHLpI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5324
X-OriginatorOrg: intel.com

--------------woQJNKIGnXJV7UTcDebtdMBi
Content-Type: multipart/mixed; boundary="------------TcEdib0M7meUNrtEQQ8Fm2xK";
 protected-headers="v1"
From: Jacob Keller <jacob.e.keller@intel.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "Kernel.org Tools" <tools@kernel.org>
Message-ID: <428c3b47-ea90-42e3-82ee-77c439ba107d@intel.com>
Subject: Re: [PATCH v2] b4: support send-email aliases
References: <20250709-jk-email-alias-support-v2-1-b0339905964e@intel.com>
 <20250930-carmine-butterfly-of-atheism-219f12@lemur>
In-Reply-To: <20250930-carmine-butterfly-of-atheism-219f12@lemur>

--------------TcEdib0M7meUNrtEQQ8Fm2xK
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable



On 9/30/2025 1:24 PM, Konstantin Ryabitsev wrote:
> On Wed, Jul 09, 2025 at 03:22:29PM -0700, Jacob Keller wrote:
>> git send-email has supported the --translate-aliases option since v2.4=
7, as
>> commit c038a6f1d748 ("send-email: teach git send-email option to trans=
late
>> aliases", 2024-08-17)
>=20
> Thank you for sending this in and I'm sorry that I've been sitting on t=
his for
> so long. I have the following thoughts:
>=20

I figured there's a lot on your plate.

> 1. Does it make sense to only do this when we see an address specified =
without
>    the domain part (foolist as opposed to foolist@foodomain.com)?

That seems like a good restriction. I'll check the git email aliases doc
to see if it even allows '@' in the alias name.

> 2. I don't think we need to make this configurable

Great, I can drop that part.

> 3. We should be using the new git_check_minimal_version() to make sure =
the
>    version of git supports this, and then just do it
>=20

Makes sense.

> What do you think??
>=20

All of the above sounds good. I also could use some help identifying if
there's a better way to do the conversion. I've been running this
applied on top of my local b4 clone and noticed that it does noticeably
increase the time it takes to launch b4..

The send-email interface is designed to be able to read from stdin and
output addresses to stdout multiple times, but I couldn't figure out how
to share a single subprocess to do this. Any ideas on how to do that?

Also, I noticed that the place where I put the conversion appears to get
re-executed many times, which resulted in a lot of wasted computation.
Perhaps that wouldn't matter once we check for addresses missing domain
part, since we wouldn't spin up the subprocess and translate it again.

Suggestions or tips on what I should look at to improve those would be
welcome.

The time increase wasn't terrible, but it did make b4 feel a little more
sluggish. I'll see how it feels with the suggested refactors.

I can begin work on v3 with the suggested improvements.

> -K


--------------TcEdib0M7meUNrtEQQ8Fm2xK--

--------------woQJNKIGnXJV7UTcDebtdMBi
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQQgQFSp1zOQVirsQx5qll0+bw8o6AUCaNxcggUDAAAAAAAKCRBqll0+bw8o6ByI
AQCeY3C90Q4pgTiP85tTck0qjiIEiQygG//SLswh0K3tQQEAih782kpa7G4rSjipPcgWyiznrajL
vd3t3LKuL7RVHQE=
=Yzag
-----END PGP SIGNATURE-----

--------------woQJNKIGnXJV7UTcDebtdMBi--
