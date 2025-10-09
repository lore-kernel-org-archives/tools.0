Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E5426A0BD
	for <tools@linux.kernel.org>; Thu,  9 Oct 2025 22:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=10.30.226.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760050074; cv=fail; b=AR9OqHOaH7n4vCiyP615TzskPk12vBtDhfVUgpc/EEkKDsfs+Yl4dG2hUOuKI7+lN/D+s9glXUCnXlfIY8FqeLxaWKfpAfLJ6+KBLsB/ZlpCGWq76B5/OYR82WdBSbJsYdSKujNkU0g5HE8n+pgKupnDy81Y9pIMn780UHyNiDA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760050074; c=relaxed/simple;
	bh=UI6xw4xKvICOYZrP1DtLqob2KoQS9c5sVwB8aJyuflM=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=rpiMFE45IxKMGoRK5L36XR4O9MVvheDz8F2bEhyHuMk6WsQALqdayjPCGisTGQbYau4ntmb3u78gHs/XcHVInTwywyWegY4ZMZwhUgDyT9WYRZaovOd7NLmTz43AYd5i123FIocuz0/ADxjQXWgk4kTPKC4G6z21rH41t5W3b+Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b0Agqr9x; arc=fail smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b0Agqr9x"
Received: by smtp.kernel.org (Postfix)
	id B337FC4CEF8; Thu,  9 Oct 2025 22:47:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E6D98C4CEE7
	for <tools@kernel.org>; Thu,  9 Oct 2025 22:47:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E6D98C4CEE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760050072; x=1791586072;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:mime-version;
  bh=UI6xw4xKvICOYZrP1DtLqob2KoQS9c5sVwB8aJyuflM=;
  b=b0Agqr9xHGhXaB9cauH7c3gPD+QO8Mji2sXxI3OKz582iLFR5jH9Wgod
   7Vlfh8nGjlSGDy7ERA7aQq6fNpu8YYL+lvNOaxNpoB4iAYaPq0qpgHLsK
   buqqF03NUy/Xqmpo7vZ04s32uUUOhlcBuUbucmsWkBTRKbr6Qb++NmNAE
   kipVGiwoyYfQq43sP8XSwFzyHz5zalvGDLwVcxvMKQmMNkv+AwtC6jTX1
   YpCK9eFinWi9/YwyTTSOOYO0PHaEHxc+LzZpyMFBeFRKXfXuEtkDl4sYu
   G45zbDqr+umlpfAG/kfykKnIdiWzZKXCXyQo3Lxwu+Kr5Qj1MhUM4XCGp
   A==;
X-CSE-ConnectionGUID: echYrU9GTPCk0/3Ik3yr5g==
X-CSE-MsgGUID: DOvwZKHVSIyaJgvIA6yeow==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="79712989"
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; 
   d="asc'?scan'208";a="79712989"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 15:47:51 -0700
X-CSE-ConnectionGUID: i2PmQiecQ8mS4/a38lPJmw==
X-CSE-MsgGUID: iY3ZDpZ3SHSe0n8XiWUadA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; 
   d="asc'?scan'208";a="180076474"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 15:47:52 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 15:47:50 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 9 Oct 2025 15:47:50 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.35) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 15:47:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bTV+6UxFrL+ZdPFGpLnjoK/NEIljq4R2NvfaqkdSN2QlI1HaN9cDg4gWRBWmaNxRx0lFpSXdFWejrfZkY5lZTHobIaPnRnA3nj2RxdbX/XNI9kZgmOEFytak5bck1cOPXExTaloVwbSu9gFjtnR+j0YbhpKQ/6ebatzdgFaFQmODjY/9SxMbw11BSoE/XZIoGkcQLY7Iktri+yiC8z5Li46938YX/WpWQN1wktR8YZDyNvc51sCmklXa7YHUQWidGllycNHSVscVSEimPtX9tAYGg2lu9do/nSDLRaDKH0DhC4gUY4OdlUHrPp8/CK5ooWGVuTc0Z6VIJ7RH+KP4lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nrfg80jgd16x1huqIfVQoSTpe+4C7sY+o6r6fIdur3M=;
 b=CR9/hDu0o2H0BWbklmXNFBuiuudzCQbLR8o+vr2rF4F0QAe0I3L3HeVxc2EgcyPYseM/WlJLzV6cfmimLrJlbWsbvO2+NBJx8b/RZhMGFSs7LfhlPW45Va4fjg0JsXP1p5Ps0HywBHaEqiOX1t1y0DLbWy/ahtJGaYkPUsyhCmnUxL6/GO1Z43gAVuwaxt1j+/Nyq90astYTAQcsTaVq9Vqgz66usGxnBfPhFOQ4d2ALToKgAs08phY0x1pyUzgjLcOmLSSvlC8kupox4J9w1xSzvFb4ilMHVOcb/+oPfFRcl1HmnzKYcqRJxpLUvlvJ51/rTr0t6nlkXYpUJOfDVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5089.namprd11.prod.outlook.com (2603:10b6:303:9b::16)
 by BL3PR11MB6409.namprd11.prod.outlook.com (2603:10b6:208:3b8::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Thu, 9 Oct
 2025 22:47:47 +0000
Received: from CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::81f7:c6c0:ca43:11c3]) by CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::81f7:c6c0:ca43:11c3%4]) with mapi id 15.20.9203.009; Thu, 9 Oct 2025
 22:47:47 +0000
Message-ID: <85fed1e8-0028-4ada-a450-fa022eb652af@intel.com>
Date: Thu, 9 Oct 2025 15:47:45 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] b4: support send-email aliases
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
CC: Kernel.org Tools <tools@kernel.org>
References: <20251009-jk-email-alias-support-v3-1-b90eb4b9c22c@intel.com>
 <20251009-miniature-toucanet-from-lemuria-00179d@lemur>
 <116c58cb-8752-4c6b-95ba-48b30e3aa23b@intel.com>
 <20251009-space-porcupine-of-lightning-1086aa@lemur>
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
In-Reply-To: <20251009-space-porcupine-of-lightning-1086aa@lemur>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------b5Ffoj0MXsYOC5WySj0CeJXC"
X-ClientProxiedBy: MW4PR03CA0276.namprd03.prod.outlook.com
 (2603:10b6:303:b5::11) To CO1PR11MB5089.namprd11.prod.outlook.com
 (2603:10b6:303:9b::16)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5089:EE_|BL3PR11MB6409:EE_
X-MS-Office365-Filtering-Correlation-Id: 3acad6be-899d-4a88-ad22-08de0785de56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?THI1M044RWxWanBJQkVsMFA4UWNUZ3VjejV2OTY2enJsZURoa2xlV3FKSWxB?=
 =?utf-8?B?ZURsS25XeW1mRkhPZDdCamQvcjc5a05NaXk0RXJnNVJVUVRhNmY2bzhNeCs1?=
 =?utf-8?B?RWpSMWVVWWZzUm9TWmp5T1d2Nk1iY1RwbGVkKy9IU2M3b2Z2cDdLYjhBV1Nt?=
 =?utf-8?B?bHNYWnBNQk9oNi9zQmVaaDkwWnR6WGM0Tmo5S050MGxNTEVPbDREb1JQVVYr?=
 =?utf-8?B?cGZlQzc4Q3lLUEl2ZzlUMmxjR0pCOGpVN3o0THpvNit4TXgwejhuNG9RQTFh?=
 =?utf-8?B?dnNaR21zR25IWjNFOVZOejhyQUFEUS9lckRtMjhjdmdYaVB2RzNBd2NBZzNr?=
 =?utf-8?B?N1dwMk1kNDI2NURIeWwwb2hwNE5ZMWtYbXE2YnorNWlEc21RakRBWjBKY1hB?=
 =?utf-8?B?VDV2WSttWE43SFJpbTBoTXU4RGRCbW1tNmEyclY2bXBtQjh1SnpCYkcvVUpp?=
 =?utf-8?B?bU1qYkF2WnM1Rlg5NGw2OWFYazU0WHFPRmZhTjdEMUJ1N2hLOWVCeUtyOGp1?=
 =?utf-8?B?KzhHbEIzYTFmNk90TjFPV2dwVkQ1UUhTMGVoU1lEbVdZWVNkd2MyMEdIQ1J2?=
 =?utf-8?B?UE44NzU4ZE91VW5nK3U2bW84Nkc2eTI3U0pMNTYwRWpUTG5pMzJwbFFOZDYz?=
 =?utf-8?B?ZWk4NWhCRzBlenp6WlJyelNSY2xSZkJKbnZDdDFReVVQM1VEMTdMSnM5Tk5Z?=
 =?utf-8?B?c3d0ZWUxV0pZRjRRLzBKYXJFMU5aUG1vaStWdVI4dzhnY3VKc09nVFR2ZXla?=
 =?utf-8?B?OVdyQThSZHJ5US9KWjdrclRHNHdNazBGNTFMREdXNnMwd1Jid29tNWh4aHJw?=
 =?utf-8?B?Vkdsb1JKZ3NyRXlrK0xBc0RLd01ZYXhvS1JOaStzWDhFcjNidFFMYUpyWVk0?=
 =?utf-8?B?ME1BY0JjTE0rZjJuSWRLQWtjbXdxRWJBTVdURm1EcnpsbkJrTTJVZ2JKT3Jr?=
 =?utf-8?B?ZXpkeWJUQmNwTC9hV1ZEMjh6Ni9kU2V4aWp2c25SdGZXUHdLeXF6dEVkVjg1?=
 =?utf-8?B?L1ZXMHlGeFU4dXBGZnZjUjdTNVJnTEhhcDhsZVNpY0lockgwQUNtZ1cyakV3?=
 =?utf-8?B?bitVTzJPQ2FzV3NnbUlQN0FDZ1VFOW9Ed3NvY1NkL0tiM0k1b05DMkpCNnZr?=
 =?utf-8?B?OCsvTjhlKys1Uzd2TG0xWHhYV016UXhoTC9yMDkxYWphbEFvVUlBcTVJakkw?=
 =?utf-8?B?MjdUU0ZTSUhpeG8rbnlDaHJNY3MrWEJDUFFPKzdTNkx2ZFJXdEZZN2tKTDRH?=
 =?utf-8?B?TFZPOURZM2FPdmRPRzhFVWhRV3J2SlVoR09RWGM0VXJYc0t1WTMwYk1NMzNi?=
 =?utf-8?B?S205UmpUWDhMUUtBcUdWdTRHU0J3c08rRXpLVG5vQklJdGNPSE9DUVZ3VkVQ?=
 =?utf-8?B?NmphMXBsd2hFcVh3akc4YkljSmdGMFg0aXRhaXplWTRRMnIyYmswbnJmTit2?=
 =?utf-8?B?Y3Fwc2RPcFFtTGU1NnJyczQ3ejdFZ2F2ZEZDRFhKRE1hSFExVEFaUytXTXh4?=
 =?utf-8?B?VjI3ZHFUYmZTUVBPb0trME4raitHY1VVMzJEaWdBT2JGNmtaeHFhbXhKQ0hl?=
 =?utf-8?B?UC94bzNXOTdyVnNFeHJnUC9KTitZdTlPaHFmMDZzcnk0OGNvellUTWZtcUVq?=
 =?utf-8?B?YjJ3YnVhcmN4dGNzdlE4Q1grNlNQUnpRYWZkalVOYkMrSjEyWm9oTXVld2lp?=
 =?utf-8?B?Z09HOTY4OEVqd1ZmeU81NkRWelMxMFY1ZjNwenZhdE1PYkFYakhkMUZoUERs?=
 =?utf-8?B?VDZXc1FNS3J5Y0libGsveTdVYmZmK1F0NXA0bWRDQ0xjL3hya3ArRlB5WTkw?=
 =?utf-8?B?SEJWYWFDQ0lyTVVHRzgySjkrME9IdXRraTlUM1E4QUVTU20wZUNoOCtZaEdM?=
 =?utf-8?B?eHdJRytzd2dHV0RTb3RuRnNhbmNTd2JEb0ZNN3g3QVhMcXc4WE1hSjh4Rllj?=
 =?utf-8?Q?koIDjP2k+u6Pp8y+tHm7E3c2Fu59a4xj?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5089.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WGM2RW10RW1lUHVMNkhWRUJ4NDN3NmdORWFleVE5TXpDU0JUdVdlcDJ2bHBu?=
 =?utf-8?B?bmZ5dERSVnlvK1RFVGdMTlluZlhFZlN0L2VPMnJQSkl2WVdTYVd1d0lRK3ls?=
 =?utf-8?B?UFJZcnc0VEs0ZXRZSzcyOGtWK0JDYjRselg2WFh5RSt2MTl3ampsRXRYZStP?=
 =?utf-8?B?TVdwOGRZRi9jTitqWkpDcWFoZU9ENUdFRjl0SXgybmtES2NtelNXVlR2bmRB?=
 =?utf-8?B?RVRSaDVsMmd3N1k3OXBJUEhZWkY4OTZKNWNyWjBnS2l2ajQzVjFXdGtqWlQr?=
 =?utf-8?B?RFZjdDVuNXZMR1pnb0w5YU1rbTFkaHFyREtoZm1pNk15TGlhakhKSkd4MGVq?=
 =?utf-8?B?K0RFcnNrWFExdWI3SlRIdXFEQUdXR282d0dVWmpxVGJ0dWNCUmhMNkc2eUhq?=
 =?utf-8?B?UUlrdTZ5THVCS2N6RG9RRitSQldHYVNKVnE2ZzV1UHFvOXNJUFlXVGtlTFYz?=
 =?utf-8?B?bXhrNnkvU0N5VThMWXg4NzkvRFZCZG9SbzRLdytGVXhBbk0rcktEMDlmNk1E?=
 =?utf-8?B?NHZhL1BCclNuVkgxWFViekc5Z2pZejB2UHhIcUc1S2hsVlVuZjloYk9pa2po?=
 =?utf-8?B?em9ObGdnODcrUHhiQ0RxZ0NUYWllcnpyaTVLQUlGUjlWckFPOEZ5M3RQTzBt?=
 =?utf-8?B?NmRqUTdYcHV4d001cFBzVGVDRWFmclIwTlV0cWdvOUVhZG5Kb1BQUURGT2M0?=
 =?utf-8?B?aC8zZHUwVTl5aUNiYm13RThaQmQ0MDNJVm5qTHVzTU83aDZqRUxHa0RJWVYx?=
 =?utf-8?B?MnRiRUhPVXV6dk1jV3paVUFic2tzUnhPb2tHWTRTZjVsZ1JBbEZSUmZPOGZM?=
 =?utf-8?B?Yi8zOEtmRFFkUWdUVDBrR3lrbDZRZU9QdVBta3RqaHVlQTRJVXBNKzc0TGF0?=
 =?utf-8?B?c2tha1F4ZzVKUnY0Tk5BWEtCZ1VzY2pnemlmbWtjT1V5MEhHZDlMVHNsV3V5?=
 =?utf-8?B?SzRPY2lKOGdBWGwremFHS0NCUHUwTGg1RjBUWjhvTjlzSk1nWFplS0FGU2hI?=
 =?utf-8?B?QmhhYkRzTHZJWmppUStHOXFLWEl1eG8xM3NCbVI5Nlp0SVlnUW5veFk0ZVJu?=
 =?utf-8?B?OU1CL1hDNGlGYXc2SDdjaTBiSWc2MVlHSEdNdW9qT1Q4UFdVYzlwQmlTUEIz?=
 =?utf-8?B?NXFPVUZRa1cyR1hFSVRxZmo2VlFER2lMM1dzd0YwcFRNK2FSMXpPSk9FeXlG?=
 =?utf-8?B?U3g1L2t1SWZtUk1Ydm1OYzlIR3gxeENvTTR1R29YRmJhQlRxemJBbndSaE1v?=
 =?utf-8?B?S1NHaFN1V1FrUjEvZ2xKUEczZThmQksvSkI3ejE3NEZXUmY0QXhpM0ZyUjVP?=
 =?utf-8?B?RkxOUHlxSDRZYzV4UGhacnRxMXI3Y0lQYlBxcnUzdjNha2k3WkJ3eC8zNG8w?=
 =?utf-8?B?OWk1ZWJBVGphZ2twTVhUcHZiU2VpNFAwZ3I2MlpDb1VLQUZFR0NNQk1JYjVT?=
 =?utf-8?B?RWNaa01tNTJpMU9JM2JXZHVxU2F3eG02eEFybkdPT1VXM2RHaWlDeklTbW90?=
 =?utf-8?B?em5BRlFuTDFZUW1FVFMwZzIxNmkvVEpnMi8ybXhtZW5MVlc2TXZVTTVkK2NL?=
 =?utf-8?B?dUJ2WjEycDFQTjJFb1dMT1k3dTBHL1RvNHFmaGhxU2NCZGl1cWgxU3ludHpU?=
 =?utf-8?B?TkUwN0VwbS8rbi9UOWtQNk4xQ0FqcHkycUFLcm4yY3Q5eDdWMFVHWk1HdWtE?=
 =?utf-8?B?ZjkrT1c0UTdCS1lYaW1xVVVaNFl3WWJTcFVHZ1FlVU9uQkg0b0haZENzVWg2?=
 =?utf-8?B?UnRyUlYyVWdNb0FkOWpYckxOSHcxTnJzbGpLOVBCaHVNQ3BEeWlQOWxoeGhE?=
 =?utf-8?B?dmxickY1dzVQKzBkZ1RwQ2I0dWQ4ZXE5d3UrZStFMzlEQU14TUpNMC80eXVx?=
 =?utf-8?B?QTR3TjhWSXhnRnluMjAwSWtSZlRBd0U0dktXYjVQYUUvSjRYMHlQKzZwNGxY?=
 =?utf-8?B?aXVlTi92d3VDZ3Ryd1kyNStJKzNUYjV1TnF4aFIvU3FzdXdGbk8weDlWbHlt?=
 =?utf-8?B?dmNFQ0ZsK1FEQzJJbzBocDY0QWxKWEc0bXlPQ3BMYkYzTG5KWHBQV0ZhSmVw?=
 =?utf-8?B?SDVrVnp4VTVCTTQ4TmxGVUE1bUhGdDM3UEdvRzN5UUFuQXY0ajgwYnkrUm12?=
 =?utf-8?B?ZmhXaDR5U2NzVHcwMkoxWUhDUUpZVVNoc0Vvd09VRGlVczRBQnRBUXNJUnh4?=
 =?utf-8?B?clE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3acad6be-899d-4a88-ad22-08de0785de56
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5089.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 22:47:47.6903
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UFD9MFD2NeWL44hPp6aq3qfSthT2+2ISCdP6XycDSSM8koXDDfG+eO1q6iF4KIbkQd1fxoq0jb9j6r1ZNdzoepFBVR8h8YpKdMJY0B8KBoM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6409
X-OriginatorOrg: intel.com

--------------b5Ffoj0MXsYOC5WySj0CeJXC
Content-Type: multipart/mixed; boundary="------------nXhUyzrI0lZ0i0pjoT8t8lNI";
 protected-headers="v1"
From: Jacob Keller <jacob.e.keller@intel.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "Kernel.org Tools" <tools@kernel.org>
Message-ID: <85fed1e8-0028-4ada-a450-fa022eb652af@intel.com>
Subject: Re: [PATCH v3] b4: support send-email aliases
References: <20251009-jk-email-alias-support-v3-1-b90eb4b9c22c@intel.com>
 <20251009-miniature-toucanet-from-lemuria-00179d@lemur>
 <116c58cb-8752-4c6b-95ba-48b30e3aa23b@intel.com>
 <20251009-space-porcupine-of-lightning-1086aa@lemur>
In-Reply-To: <20251009-space-porcupine-of-lightning-1086aa@lemur>

--------------nXhUyzrI0lZ0i0pjoT8t8lNI
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable



On 10/9/2025 1:21 PM, Konstantin Ryabitsev wrote:
> On Thu, Oct 09, 2025 at 12:49:07PM -0700, Jacob Keller wrote:
>>> This has the following benefits:
>>>
>>> 1. If the same alias is used in 20 patches, we're only looking it up =
once.
>>> 2. It'll be automatically used in the following block of code without=
 needing
>>>    to modify the addresses list here.
>>>
>>
>> One other issue is that this means if you have an alias, it will not b=
e
>> covered by mailmap.
>>
>> I'm wondering if what we want is a separate ALIAS_INFO instead?
>=20
> Ah, hm, you're right.
>=20
> Yes, go ahead and make a new global caching map. It's very unlikely to =
be
> more than a few entries large, so the impact should be minimal.
>=20

Right. It should only ever really be the number of aliases + potentially
any unintentional unqualified addresses that aren't proper aliases. Its
not even the size of every alias in your aliases file since we only load
ones which get matched.

> Then we do want to run through the list twice:
> 1. first run replacing aliases (new loop)
> 2. second run checking against mailmap (existing loop)
>=20
> -K

Yep, that's what I did in v4.

--------------nXhUyzrI0lZ0i0pjoT8t8lNI--

--------------b5Ffoj0MXsYOC5WySj0CeJXC
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQQgQFSp1zOQVirsQx5qll0+bw8o6AUCaOg7kQUDAAAAAAAKCRBqll0+bw8o6K1i
AP0YuH8YnoyYjFMT6hnQxC+a1DAOWcUgx7JtCSr6QZTknQEAlQb/qDpc00zYBqemXey3MNsTYuAw
gLXPTRNC8IU7oAg=
=a4xG
-----END PGP SIGNATURE-----

--------------b5Ffoj0MXsYOC5WySj0CeJXC--
