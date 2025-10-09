Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895FE34BA59
	for <tools@linux.kernel.org>; Thu,  9 Oct 2025 19:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=10.30.226.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760039354; cv=fail; b=bD4Cdz0vuvsGTww5nJgDehplCVHcw3CXMZyb4GtSBYEFVY/oobatwuv5Bn7NG0c3fs1bh/ali67BKT5vDQNso1Q1dInAskB4tZTDFUoYjObaAczjfMA7AEmsSDam89KXwWP2rn8/mxrIjNslAhPOrRWpJ1DyiD4uqMb6o8whRmg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760039354; c=relaxed/simple;
	bh=k9SLGfWIi+LHiol5lsX++4ZE0yqvG9+oDgykOQtwqPE=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=SdIN3NrQMxlWeFdKDnP4R6xyXoIWD2GpwLHwevk2St55M18aYTfRVe6tsg+qPZZxW/TlE7er2K4E3xq/tWuB9OI4KaicFZwcFouwQ5lWywhGZfUKnRK1AnH0J4U1dTg2OvYtKosj5Op3Duy2OKMc37CWrae43ObsO0RVAiXqZWw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VSfsg6bB; arc=fail smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VSfsg6bB"
Received: by smtp.kernel.org (Postfix)
	id 2262FC4CEF8; Thu,  9 Oct 2025 19:49:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CFB19C4CEE7
	for <tools@kernel.org>; Thu,  9 Oct 2025 19:49:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CFB19C4CEE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760039353; x=1791575353;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:mime-version;
  bh=k9SLGfWIi+LHiol5lsX++4ZE0yqvG9+oDgykOQtwqPE=;
  b=VSfsg6bBWXfWDykcWxRAHpfDAq2kHvOf7QD3xBuwyAgDHX6G+cTPHXxr
   wku7uEYAXNmCKxe0M4XU4xnQfIK6W1IB0h4LdmTd4+TGoEiDWwMQitTh7
   DH+P2XDYYvSrrrD9nTjpljPQ8uD32SiznQSqjDn8sjYvw0EQnWehUpfvu
   cw6ugiVBjJR6GKOdZKt1xbNNNBUl+BEhyiA8SZtzke4Iod0nDYhjqsP03
   S2QXWBmC8V4OIugBk1O49ajZm/oijtehAAyNbXCujEb7e7YtKKVQD00vJ
   CgXKhf2zhzQmE5VnywbkmCuT+GI7a9AHgGUTksvVdBVotteR+wae8BjOv
   g==;
X-CSE-ConnectionGUID: /uC/o/iYR1GkKw7NoPEd2Q==
X-CSE-MsgGUID: p9akfAKyQiWH6hRW/21Clg==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="49820992"
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; 
   d="asc'?scan'208";a="49820992"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 12:49:12 -0700
X-CSE-ConnectionGUID: z/3hIYQSSAqQgyfeOELwOg==
X-CSE-MsgGUID: qo7EXHEcQEODWHtVWDqQ8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; 
   d="asc'?scan'208";a="211445253"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 12:49:12 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 12:49:11 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 9 Oct 2025 12:49:11 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.59) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 12:49:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aWjUtSYhFaDk1KHyvBZLjOlNTu8LzuxYD90XtlXR6cDuMrOOgRdSwJZRgLQLkyEtw6DqF7J6M3DWub8sF1CHGscxtBnd9QtYtuBucfsucmtjhpA6d3GH2R/Sflt23VRRUXLX4/5FjXNafOCF9c+X+BxPUmxX1j+ODTvQBEfa7XlZhtW/MRFuPSk5116wj3n7jLSkWsytHLQwzIrcE5kUkDCn3vWsb4cWjvSVQgH2MZgLKtxx64KlbH/lvFuV/OmJvMNDA6675KoSW376prk/rkCSBsXSK8NxjabDZjou5pNo7LopkQuGkdTtvYDYglNjAsUymZ8zj4MhDkYUSs5ubA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9UeRjDV2uGTP9wIE7Psg/nLacJxrfFi/x5n7lCulcQA=;
 b=XxgZEtt6uQ/7e79UJ0yuOcbmPDO/5wTiSrhb/0P71kAchqOKluxHsqn492hdVX7Wqk6XZgqMXuNe6iIqRAqnl6qTy5ye7ATJVPtXxmlbmsVymFwkoYm1IvPZLDv13zMSZQvP8Dxasd9oy+NKonolLhQW3Ev3iAkLYL2nQStt8Am0adKFgJe2uLNzzqNWGGElwfQIxjBB3hEjSEr3+rvb/d7uVP8+hWlGcjicfWi1cn0qqx8U7EixP8bOYOR37P0oPWOkrCwjBq6FFMMUPuAelkD6eujIrfMZj2aW9c+ANaEgEJuLPdUs1GvDyzz79f+q6d1hl6Z4FjDDtX/3+4IQHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5089.namprd11.prod.outlook.com (2603:10b6:303:9b::16)
 by SJ0PR11MB4864.namprd11.prod.outlook.com (2603:10b6:a03:2d4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Thu, 9 Oct
 2025 19:49:09 +0000
Received: from CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::81f7:c6c0:ca43:11c3]) by CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::81f7:c6c0:ca43:11c3%4]) with mapi id 15.20.9203.009; Thu, 9 Oct 2025
 19:49:09 +0000
Message-ID: <116c58cb-8752-4c6b-95ba-48b30e3aa23b@intel.com>
Date: Thu, 9 Oct 2025 12:49:07 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] b4: support send-email aliases
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
CC: Kernel.org Tools <tools@kernel.org>
References: <20251009-jk-email-alias-support-v3-1-b90eb4b9c22c@intel.com>
 <20251009-miniature-toucanet-from-lemuria-00179d@lemur>
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
In-Reply-To: <20251009-miniature-toucanet-from-lemuria-00179d@lemur>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------02lc7Vfwgx9efcCULffhDM5A"
X-ClientProxiedBy: MW2PR2101CA0018.namprd21.prod.outlook.com
 (2603:10b6:302:1::31) To CO1PR11MB5089.namprd11.prod.outlook.com
 (2603:10b6:303:9b::16)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5089:EE_|SJ0PR11MB4864:EE_
X-MS-Office365-Filtering-Correlation-Id: 13be6bf2-9a93-4d2e-fe47-08de076ce998
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YnJVeHpEZDZXTk5odXRQTHJ5K2FmcGtGNVBOVTJLMmVmdnhFMFhBTk15WGR4?=
 =?utf-8?B?SVF1ZUNFYUtqQ0FaTDJoMGtQQ3JLbTdXL1J3Y0NSbGJZQ0lWdlZ4UE1EQnd4?=
 =?utf-8?B?SE5sOFByUDFvbXUwTjZPUkt2N3ZTcFdKdUZNcjF3aFh4c1JnY1NhSkZLeUNj?=
 =?utf-8?B?UzIwVWZlMTljNjdGNzRsbmRIaVR0SFE1Ry9TK2puOEFSTCtFZUZQaEJmOXND?=
 =?utf-8?B?eUtDclZtNjZIRU0vS1daRGJna2hBZEJsWHJIeklyN1NBeC9zSjk3L0pUcmhX?=
 =?utf-8?B?VEEydWlaMkZzZnVLNEtESVFURUkrUnFmK1pPUGxZaFlHSUVSZHBZaFZnSWxn?=
 =?utf-8?B?cmM0RzNvYXNLTm9KUDJSYlVLOXhaTHhRUzFMTFpUM1Npd3BuQVlMSVZPalhV?=
 =?utf-8?B?UVZFZVJVMk5tU2JSWUFmUEp0aEpCWWdhd01zRzF6TERPRHlNNzYvbGh6WldI?=
 =?utf-8?B?QmVQYTQwRy96bnFnOHNEeUZOK0N0RGp0ZzlldEZySkpFczJYYmUzc0VkaXM5?=
 =?utf-8?B?Z3lzL0EyT2M5NWhYcnRXK252S1ppVExlaEg5bGczRHBaRVh5Mytyak5GNXVW?=
 =?utf-8?B?RlI3dUxxaTRCOGR1SEoxdTdXWkZkM1BLdE0xT1hKbE1WVWNmNkhYdWhXOVpJ?=
 =?utf-8?B?blJmWHgrTytHSnZMTGV3RytMOHlmY2MwZXpzK2IyM1VMajdISUdtNjhMMkZG?=
 =?utf-8?B?dkVHd3I0UWowbVcvUWlWOWhNZ0JIUUFrUU5SejRzMkhzdmFqZkMzWlZmaUlh?=
 =?utf-8?B?MklIdmppVzJGaE93bDBUU0FpQkVqOWE4akVEWnBQR1loZVpHenJkV0pCTUR0?=
 =?utf-8?B?Q2FLWUpTd3poaThVQkR1dVFZaU5kdHJUTVhZQ0N2dlhzU05naGZSdm9yblVM?=
 =?utf-8?B?ZGZLTXBEZ2pVbEc5K2lYa2hMakVjQ2lOd20rSVlQUTI3TDNzblA2cjFMdnRa?=
 =?utf-8?B?UGJRaGZOQ0YxMndHb2VGNjFsejZQUUFaNW0rcjZ2emx5cVlZN1ZQWTNaamJL?=
 =?utf-8?B?c3kyU2RtZ1piTjdQRjlQKytqSVljbVBMbkUxOHY4Qm5uQy9pajZRbVlmY2JN?=
 =?utf-8?B?clVmMmhaMGxBTGJJL3Q1ZkFueHhTcjVub29zWHhMWlA3UFI5ckpiOFlCcHZH?=
 =?utf-8?B?b0VxTU5Tczc0anN0QUdCbVB1ZUZyaktvZitMN1lYdEhsbElqeThzK0xQdlU3?=
 =?utf-8?B?YmtqSkFDSUFPY09nTUlHek5KUGJhbUZ2L0luU2FrNFFQUE1OWGV2b3MzYUxw?=
 =?utf-8?B?UVptYXplRE1KQjVTTXNJODRydDMrcnBUcGpESVlaY0Y2WHNWN0JEZERFajE1?=
 =?utf-8?B?VnFTSmZKWXhqdTB4eFo4cXhEcVY0ZXl4Y0dKdTdyYVMxMVhPOWcvdVlkRmpy?=
 =?utf-8?B?MUZqRGNFdGorSnk2Z0pkcW00anovUEtzc28zR0RGUkI5ZHRvMFkveXJtYk1v?=
 =?utf-8?B?SFlJTnpPSDF4M3V3dW50M3JGU3Q0dGhVcjYzRWdXcU5BUzFyM25MMytPTEF5?=
 =?utf-8?B?NGdYU1kyWVE0OTZFWlVtaHJBa3FGY0RwcXJOM0h3Z0g3ZXFwVnpUUEFRVnZr?=
 =?utf-8?B?N3NZekZRbWtHVWprQUtPSHVLNkR1ZnhWQnRwRVdtd1hzNE0wMlByVjRhL2Nq?=
 =?utf-8?B?eHRMdkFHMk1ELzR2dlhkSlZnZC9zUW84bWVQQXdCQmlKb01rU3FtVmw3ZjJ4?=
 =?utf-8?B?Y3hJUWtLa1FsUHJxS3lEQ1dYc1BTSERtUDJuZ0RCYnRXM1lyQzZ5aUZqdThp?=
 =?utf-8?B?Wm90dDZ1WVFtMDVQSUNiMzM3K29kL0RKLysxakh0WjdPSU44OWV0dEFMZ01O?=
 =?utf-8?B?dkFSNXkxclloNVhVVnp2VkNzb3JRc1RUMnhNQXRyTEtXZ01tcmxjd3ZUT1R0?=
 =?utf-8?B?bXlYZDNJYUpJc3dINFhiTlFWSTZNcFlaamhoSUNQUFRzUE5pTlltTzZ4TVBy?=
 =?utf-8?Q?EpOs/0adIDOTj9cI1xs+V64GsBBj/RsB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5089.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YkJ0QnJtdjgraVpaN1IyOXNMa3NlOXJTSDRVazhROVFRbnRyQVdsWG5yQmVS?=
 =?utf-8?B?YzRMN0duT0FsL1BaY3Q3d0ZoVGs0ZU1FRWpkVXdoZmo3bGsvelhVMUpEY0ZB?=
 =?utf-8?B?cGR0WE1SREJzLzZrZzJtZ3BTdkVQTFMzdWxLVWpXK0psdStqV0VqZGJLSzdn?=
 =?utf-8?B?amhVZ1R0L213bTRhUHEwbW5pNStIMVZ0VWdWdXo2RExrbHo1WWdmTmVCMjZO?=
 =?utf-8?B?SmttL1Z5elIxYkRheHIyYnJxdnhHWTVKK3dLLzVxNUtCejBxZ0h0Ny91TXJN?=
 =?utf-8?B?ZUN6aGc2U0pqT01iWGM4WTYwK3RoYXJGSXpZR1RlZlZOcXQ0cEs0TVZ3enJB?=
 =?utf-8?B?NmJLL2tlK3dUNDZnMXI2c1VYVFFmMWNLcURUSTR0dFZydFFGbktkMGQwZWJz?=
 =?utf-8?B?c1V3NXdwYXNaOUZ1bERWQTI3S1E0M1B5d0NqSVl1Tkh1aDYvU2s5cTFxeWJ2?=
 =?utf-8?B?WHFIWGxBTHdCcDZWVzE3ejArS0pzdHB1c0lOd0hlcEFyS1VFbFBjKzBxcU83?=
 =?utf-8?B?dnFhU1BMNlZRMXJSemNTanhXUEhFRzFuZUtWb1FtQ1dzWkgxQ3FWeG9Ndmlj?=
 =?utf-8?B?VzhuVTVrcWx2L2lVOFQ4T0QxallNOGdGSnhKb3pzRlpTeDhMeU9yeTR3d21E?=
 =?utf-8?B?eTdkN1hPdE5Bc3NYclBHb0JjbzJuNTd3czA1SFVxd2tzc3dyUDI2VUJEWFE0?=
 =?utf-8?B?cWZpSlhXdm9IS3RsRml0NXBHamkwTUFjS1MyYWJ4ZFZSVUdTbERRWTB4TW9l?=
 =?utf-8?B?QzMxY25IZGYvRXJwd1BsaTcwcCtPc0taSDhDNUJsczVQamsrQWVtemxLckdG?=
 =?utf-8?B?NlpHaVE5RVd6TlEvMjJBLytCcXArcU9vRDhXREtQU01ncTVKUE94YlhsWWNJ?=
 =?utf-8?B?Y2pxSTFHc09BTzZhTmdDZFIzQlJOY2JNUjEzU3gvNzVMSWNreUQzTGhkMGRT?=
 =?utf-8?B?YVJXempaSEpKUUplUnZmL1A4R0JqcVlSUDVXczF0T0IwYVF4THExK3F0Y0tO?=
 =?utf-8?B?aFZHSEpKTUNiV25iTlk3ZU5yMDFnWTZkNTZrNXNzZDV4bmUrenRidUZxUFp5?=
 =?utf-8?B?MmdFMTZFQVJ1K3N3ZU5vL29pS0tDMmI0V2Exd29kMzk1cmRoRWRRdnh4bDZv?=
 =?utf-8?B?T0FnN2pMUzV6M3pPdEJ4TEIvNjFXN0lJeURtTGxvRy9pV1p1Tit5YmdxelBG?=
 =?utf-8?B?RUE5YXJhMkYvRkltY040SVh2QmtYQjZHbFp4c21Ocy9pTjhhSGpVclpSQzFE?=
 =?utf-8?B?VG9sY3FYU05oSDhGS0ZaVmFhUGNXTk9aSFVaRTI0RTdxZHRMYzIxSktoVnds?=
 =?utf-8?B?ck9mNHFBMlZnMVl1STFmWk1jN2tRRDZGbHVtSy9OTnhkZWRSRGl6VllMa2ZN?=
 =?utf-8?B?MnlzVlBsK3pLaXBVeGhpQ3RVNEhZTTFrbUwvU0NaVWR5ZDVmRDJpV25FdHQr?=
 =?utf-8?B?ajR0U2tFN0xOLzkvOGpDTGxlN2UzL2l6Ui9HZFhpTytRcDErVFlyaFNpTXpC?=
 =?utf-8?B?ZDVGb2szNW5mSmsvMFJ5eFgzRHIzbStXNURkUGtlUWJlZGhPQ3plRFhBaFJE?=
 =?utf-8?B?YmJZWUZLY3BDQkVQMHJBNVNHWmN3RUxVTGpsVDQ5c3Y0Q0dZdm1wWnQ1cHpk?=
 =?utf-8?B?d0QzVUdBeDRQWmhENnlzSzFWamU3U3FzbEtzZEw3NXJuN05qSWVVVXE4WWdL?=
 =?utf-8?B?MFhNRHQ0ZXpNS0c1Y2E3ZFVacWN1RXNFWlZGWWVlZHdBZUtiRDczNGpGMHpa?=
 =?utf-8?B?bUgvVzJlZGthdWRNcGhRUDJVbnNETGY1OEs1YWxEN0tyTFh1MHBDZG5UdmZY?=
 =?utf-8?B?WXpDQzdnMmRYNit1QnpMTmhWWGZ0M2NERWZqN2FWa2JZejV2TUhBTC9nZnBs?=
 =?utf-8?B?aVBzNE9ZVGUvWHNIOGx3SjhhMnlyUTlMc1FjcnNLZ09pZXVvQW44NVFLcXZR?=
 =?utf-8?B?Nm9xYjRQVWdmRWF6a04yaVRkR29saXFPUGN3RjF2YytUMFFvRlFRMWttOVEw?=
 =?utf-8?B?LzlqN0tZZXJvMHpnOVMzYjE2L1RrODFUZmFScHhWdEl5NHBhYnVWRDhXZjM3?=
 =?utf-8?B?cklEU3kzdWJDOHh2QWh5cFErM3FkMndOTUg3ZmFWejNpMjVZWGZVcjI4UHZs?=
 =?utf-8?B?REx0UjlQWFlCNjhUdFJweC9OQUxnbDRsQ2J2Sm5rYUlISnpOMTlnS3h3TTE3?=
 =?utf-8?B?SXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 13be6bf2-9a93-4d2e-fe47-08de076ce998
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5089.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 19:49:09.1410
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LmLuWfCMrEJxv0IeRHJpsvnXG90opA3m2APl/GdOJ+waKx/rLNL8Wf/DRxS2EHP7Ocddkw81iegou4w9ewnnGMwxMn+G9zZI/TAd6/9oxRs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4864
X-OriginatorOrg: intel.com

--------------02lc7Vfwgx9efcCULffhDM5A
Content-Type: multipart/mixed; boundary="------------5rIgf606VrJ4nXxX6V26KEpu";
 protected-headers="v1"
From: Jacob Keller <jacob.e.keller@intel.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "Kernel.org Tools" <tools@kernel.org>
Message-ID: <116c58cb-8752-4c6b-95ba-48b30e3aa23b@intel.com>
Subject: Re: [PATCH v3] b4: support send-email aliases
References: <20251009-jk-email-alias-support-v3-1-b90eb4b9c22c@intel.com>
 <20251009-miniature-toucanet-from-lemuria-00179d@lemur>
In-Reply-To: <20251009-miniature-toucanet-from-lemuria-00179d@lemur>

--------------5rIgf606VrJ4nXxX6V26KEpu
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable



On 10/9/2025 11:24 AM, Konstantin Ryabitsev wrote:
>=20
> Let's not do it this way. We have MAILMAP_INFO, which is a global mappi=
ng var
> we're keeping around for the lifetime of b4 command run. It exists
> specifically for replacing email addresses, so how about we do this who=
le
> chunk as follows:
>=20
>                         if alias !=3D entry[1]:
>                             logger.debug(...)
>                             # Stick it into MAILMAP_INFO so we cache th=
is lookup
>                             MAILMAP_INFO[alias] =3D entry
>                         else:
>                             logger.debug('"%s" is not a known alias', a=
lias)
>                             # This saves us from having to look it up a=
gain
>                             MAILMAP_INFO[alias] =3D None
>=20
> This has the following benefits:
>=20
> 1. If the same alias is used in 20 patches, we're only looking it up on=
ce.
> 2. It'll be automatically used in the following block of code without n=
eeding
>    to modify the addresses list here.
>=20

One other issue is that this means if you have an alias, it will not be
covered by mailmap.

I'm wondering if what we want is a separate ALIAS_INFO instead?

>=20
> Cheers,
> -K


--------------5rIgf606VrJ4nXxX6V26KEpu--

--------------02lc7Vfwgx9efcCULffhDM5A
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQQgQFSp1zOQVirsQx5qll0+bw8o6AUCaOgRtAUDAAAAAAAKCRBqll0+bw8o6HB2
AQDmpgyjUhuuoq6TcEgGJPcG3NfxV/p9FbeUu5mhVF12bgEA4ZTnDaHaFcxJEl2OY5JnW2PCkrkQ
V9oE2ViK+63Vjw8=
=0Kjq
-----END PGP SIGNATURE-----

--------------02lc7Vfwgx9efcCULffhDM5A--
