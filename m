Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7FE026A0BD
	for <tools@linux.kernel.org>; Thu,  9 Oct 2025 22:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=10.30.226.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760050074; cv=fail; b=sNte2kQG3LDgTav1L+oqkIbAQeT1s14ITmRGkXi86JAX6JkM5lugg5mJDwf/J+FmtXh3yt/suyrneq0wr4bUcAjhmERhUrGhdz31X+hGy5TVlcGQ4X7BcQa/BOopZX0j+zOW1Hg6+2AmBWu4tc29z+OW1qml1t62purr58LlzUI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760050074; c=relaxed/simple;
	bh=8OmupldaB13irWs0nQE09J02/tCQW845aEVOouZCF0Q=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=GRTmZWlrv5e8eXwKCdiFUdM5lWL2SnjTdNFw2uzTld8y6XzXyIguysYohYqqG4EhmMRpJQT18cE817HFqiFm6D9MY71jwegvQuVMus/aMJuRNiFWfs3yT+z1fYiFvcCutm2wc/HixoGo1JU7tHkNxhdG4W7aJ/n9+wJPowsO/iw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AsYNQPnm; arc=fail smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AsYNQPnm"
Received: by smtp.kernel.org (Postfix)
	id 6B6C1C4CEE7; Thu,  9 Oct 2025 22:47:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 38E64C4CEF5
	for <tools@kernel.org>; Thu,  9 Oct 2025 22:47:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 38E64C4CEF5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760050073; x=1791586073;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:mime-version;
  bh=8OmupldaB13irWs0nQE09J02/tCQW845aEVOouZCF0Q=;
  b=AsYNQPnmPP0ouca446Cpf9oTZt7zyCwvz3y1tiEbgfDXo5+Nm6S0tAT9
   Wml/CK8PkHOZe+SGnmFkTO/uzgnwCnOYV2ihP2LBquxEbvzmxF+TEbF4H
   KXTh8fRglSvoQ/+vvW5Oygd9cMSj7I7jphheIGGys95TkY5Uod5k3Pe7X
   WIn9iu8CaYG1h+9N53XIwshx7EOAH0oiJDg2JzXVRURupRzxXF/RP1s6c
   kuHMfwMRgXHM3nmyd8pMJ6jXU/Lzc7jVhpSW10xOtbFOZbY6Xjk7hXe5Y
   SY7x4VSHdDB0CJjIeippWGx1TLaLhFhkijjWh6JHevHYeQBE28xaTQdl5
   w==;
X-CSE-ConnectionGUID: Zy1bfTORSiePTLfoxIy/JA==
X-CSE-MsgGUID: PtydtU3xQdOz26E/SfWMbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="72882282"
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; 
   d="asc'?scan'208";a="72882282"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 15:47:52 -0700
X-CSE-ConnectionGUID: /QvgzD2WT9CS/Hvota37WA==
X-CSE-MsgGUID: 1IGN9PdDQKKCMXY0tWwibA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; 
   d="asc'?scan'208";a="217930153"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 15:47:52 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 15:47:51 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 9 Oct 2025 15:47:51 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.35) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 15:47:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AW2A/uSB3jxKodlpQ23/t43ptHY3kU4KzoIsYGlwEv9pK8k1jDDQlJIqZtsexZQ8/LeFvjxXqaajSAkWTWxZOGLx7ExpjO3nirukRII37k/arX+3N7zqUpy5yWSfZfnoVFuKYZBbgM9FNHILVf35zKSZJf94nILJv4yiLp1iPeKILD57BFrFxZCaJoGWWwMumexfwTZ/yG7TVtXynaTU/uMmS9EP+8IZzFg7k61n0fXXobRPvMeMX+F/d8Gqtc48B7LUhmGVbirv6G8OzuX81Syz+pwRh5BoWpC1Ozf1RqvDZ6SXKl9GV3k/ukhseR3t5CwNUAqrJIOpyV/K1V9PcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d4OSNIp6z6vtdQo0Fk/0iYcQeiEa42AHEh76+xZ8fuU=;
 b=eb49gchWMd2D2p60jm3abixvDzT+vofBYk3scwqtt9FQ+OEJNGsYWlsxsl415bvxJMWdqePAaAuoIUoVwL5qRIT/uHk3+tskoKp8t+CaSHfJROr5b5zMiM3DiMyKnC+b6oEebboQIyStZxZvAyPobo+8BN2lmxqQG6+X0uDv0NkCJ8P7ZfXrZsEitWDLLDRpEmkdSmyDvR3urwHm8GDEfsi/uonzO8I5O6rsmysGE6qU9Ejac0qYe0a4agyU4D0ldyu9eFWm/CzUEhMwMwmRarDfCfsftcX6VOY8KSXDNRBeWodUjCxkIpOd17pMpb55qQmZR74+fVbtUwpEQxutgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5089.namprd11.prod.outlook.com (2603:10b6:303:9b::16)
 by BL3PR11MB6409.namprd11.prod.outlook.com (2603:10b6:208:3b8::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Thu, 9 Oct
 2025 22:47:48 +0000
Received: from CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::81f7:c6c0:ca43:11c3]) by CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::81f7:c6c0:ca43:11c3%4]) with mapi id 15.20.9203.009; Thu, 9 Oct 2025
 22:47:48 +0000
Message-ID: <8da6b3ed-58c8-4f79-8d5b-31fadf2e141a@intel.com>
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
	boundary="------------RQnnNcVDSzfaodRBPZnpNR2H"
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
X-MS-Office365-Filtering-Correlation-Id: b4380a36-60c8-46fb-cdad-08de0785deb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cEQrSFFHMjloNnZSV0Fnb2gwUmtBMjEvQ0dlMGY2RUpXR2xNQi8wVnkwK09R?=
 =?utf-8?B?RkZWSGpaTEYrOW96aGJ3bFRZUyt6L3VTRlJqMFYvQnRReXZLOHA3Q09GM1RQ?=
 =?utf-8?B?V2pnZVdCYWdSaHpCSmhGQjRCVmthYzNxZGM5Z2krbTI2ZkN2cUU5VU03NkVw?=
 =?utf-8?B?eTRlMkFpSzdSc2h2elB6UHUvdml0bVVJRmh2T216dlRxR0U3VmN0NVdLajBD?=
 =?utf-8?B?ZWVTRFlzeTkxNHpDWGx0NHZjK0xVakRRdVAvMnRPWit2aXVoUlZqSFdDemdJ?=
 =?utf-8?B?Q0ljdzIxNXdQYXdCSGkxdGhjbDVqYVlMbVBFOXV0QVRTRnRXZGZrNUJwOGxY?=
 =?utf-8?B?QklCZUttWGdER3p4bVZrRGR5dUpoaEcvUU5sUTZLV3V0ZHRSMkVBSDNPNy9n?=
 =?utf-8?B?ZmsxRzU4MzJRMjJPZ3VHS0I0TlpUOXJ0enZRbXBFWDVmY3VCSGllSWdQMHd3?=
 =?utf-8?B?ZzY5emZKdnYvMHhublhGd1BlMzVKWlFXYXRRZlV1V29sREdHcUV4Y1hBaFoz?=
 =?utf-8?B?Tlg0MExMcDAwczZWUUpDR0dPemFDd0ZKc3MybnpaVGQrRHIwTXdxaVZBcHc1?=
 =?utf-8?B?V0pWMGM0bmFpdWJzaUdlYTJMRVFrd3BZbW9GNnE2eEM0VzQrVFpvUE5tbGFK?=
 =?utf-8?B?TkIwV2tGMDZndG9oWFVDWDdhMXllbENIV1pYb0Jic1FVL3V1NnM5WkxxaUZF?=
 =?utf-8?B?WEMzWmlYeUt4dlFvbTQvRTN6cndkbHBGRStBMEs3dmJpQVd2UGxkRUQwbThP?=
 =?utf-8?B?UlNlaDZzbkJCV1VMUTZKWnkzbXRFcUVUa3Q4bG9DNXVoMmxLMjBzZENVVVh1?=
 =?utf-8?B?SzZzQUErOUNmSXJTRHM0M0I4dUlxRjZURksyYmFVNUF0eDRxTWNnMWQ4L0Ix?=
 =?utf-8?B?dzZUbDQ2ZFZWU1pFd1BlUzJCTXMweG9PUDMvWDlmdzZaQXNIdTY4dnNCbjB6?=
 =?utf-8?B?Nmo4OS9XbDBxUGJ5d1kweThHTFhkWXM5ajhNWUYxdEZBc0ZxUXdNTXJQcTNO?=
 =?utf-8?B?cDdmeWJNbUtSRWtlakdXT2dVQ0Z6dmk2YkxtNDZ5czZwRCtCdWxLYVNrSmdF?=
 =?utf-8?B?NE5HbVcxT0pSdXpVTC9LWEVDeUNSRUtSMjA1T2ZlOU5EakVVc055MVRKVnJU?=
 =?utf-8?B?QnhUL09xQ2h1VzNTR0tRVVZrT3JuZVptTGI5SURtK0p3TFNlLzJkVVBDK0RY?=
 =?utf-8?B?dG5Pd25XZTFSVmtGY2kwbGFVbk04RG51emg5VmR6cDd2bk5NRkRLY3hIcjJP?=
 =?utf-8?B?NnRYMmRKQnlvczlzaHdTOCtHV094MWJnOWFWQmFtMEtDeUVMT0RuN00rOGJp?=
 =?utf-8?B?QzBocHVrMmkxdis2aEVDTFBkZ28vbi9UYmpieHkwSzczZElWTzNJb0RrQTY4?=
 =?utf-8?B?Q3gzanlVcjdWeW1vQ012Q0c5Z3hNb3BmcjF2clFBNEZKOFJpVUpiWnMrV0xm?=
 =?utf-8?B?ZFBlczJwQ3NOU2QzWk5YWVBPdUFiN1RXRTd0eS9uTHB2MHZYUlVLa0MrZWcr?=
 =?utf-8?B?Nm1SLzR0bVN2SU11dUdaWmZQQWVTeFgyWU5GeCtXeE9BcUwwNmZVRWZVYXRS?=
 =?utf-8?B?STNxOWJheGlZMFZCazkxQTZVYS9HTUFWOXBBc1NOSndGam1QZGFFNXNhSFlO?=
 =?utf-8?B?ZkEzREJFbHB4L0JiYWN3blF6YXd6QmoveVA4VGswQUdVT2JpOHZHdGdyMlRT?=
 =?utf-8?B?ZmJSS1RCL2J4ZlRlbWl4Z09YMzlKT0Q2Q0RqeXN1TnV6dnFmMlgxR1h4U0tU?=
 =?utf-8?B?ZmdlU3JhZjBaeGIxT3J2UDBQQ1ZPRG1BampIdU5hZkFmNFZXK252dEwxbytl?=
 =?utf-8?B?R2lZVjAzcjU5MjhWem1lNUpXb1lkamNiWFl5WkJSSTdRQ3pQRDk4WE8xZTA1?=
 =?utf-8?B?RmlMcFhkdGFvRHVCcUx1Z2lGRXlnTTF4a3p0cUFITkVuS29rZHhQdWowTklS?=
 =?utf-8?Q?OPj6JNi0JhzqfCiU04i2Pt28IQ0c1olc?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5089.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MUtPUkZUZmxEcEpnWXNWT0pxYlFQU2Q0cGV3TGJoYzkzK0pFU3RRU3JaUEJZ?=
 =?utf-8?B?M0JNR2JkMVAyL3VFMnkvbDcvM0FxR3lhM1h2b0sza1ZWQ2IxL25kRlRtY3JR?=
 =?utf-8?B?NjF6MmZpSUZvM2ZScGN6cE5uM0ZjbVlBVEtTT3NROU0vTW83TTFycFo4ZEQz?=
 =?utf-8?B?eTdkakRrWHduaytrd0NXMWpNQmRzb2FhOXkvbzN0OU5HU2F3T084VDk4YkZN?=
 =?utf-8?B?dXdkQXIwSlR5WVJtcWlhVzdGdDBoVFl5WllmRzg1b3lrbFplTUx4UlJleEJB?=
 =?utf-8?B?emxlWG1TSWR5TzN3WnVKb25PVUJZdlN4c2hubUJsN0xEaTJWM0xzcmV6YWNp?=
 =?utf-8?B?TzhmaW1XWXc2L1BGYXY4ZmdhZmMySTl3b2QrcWhaa3lvYUlDV3ZjZzQ0UGhF?=
 =?utf-8?B?eXI3dE51SEI0NzUwSUlvY2tiZG5uYktWUG9LN3pLSkcra251T2djNGxSdU00?=
 =?utf-8?B?TkppUTVxR042NnFyVVFkVXVhNXNYYUxrdThjUDBKY3dHNmR4cVlqWFRTaGZK?=
 =?utf-8?B?V1I5YUswZUgxWmhFdld3R1Y4Ym03ay9DRHluaXZGWHd0L21iSmNEcWhnd2hz?=
 =?utf-8?B?YWdpbTJpUnV4MFB6ZzRCQzE1dmRrY0ZPdWJpaGRoNVpyQ1VkOWl5dElpbENr?=
 =?utf-8?B?anZ2TUUwY0toK0xaNXJ5ek50ciswdFh1SG8rS21iNzNsdzJib1IxSElVWjk2?=
 =?utf-8?B?UnBaNjJERTUyaUd2U3dWOG1IVDVTTCtxa3NtVElpTTF3ZGJ3SVRvMDNWUTZ1?=
 =?utf-8?B?TlBSbmxiWnZFQVBpRTNQSkJUS2w0Ynd1dzFZd3JETGJ1R1dZREZGSE1HT2Ja?=
 =?utf-8?B?V2E4bWJWeWhDU3JJZmJMUkpNMEhqS0tvRkwzNGUyRDVCQnZQditKT0k2T1F3?=
 =?utf-8?B?QjZzVlBQV1Nla0tvb1FYVERjeis2b0hoang0VitSR3JOK3RUNmNSNDc4ZXVW?=
 =?utf-8?B?NTJBRWhocWlzem5NamlFelJmS01rR01pM2tIK3pOZlB4Ri85bkNvTG9JTDdq?=
 =?utf-8?B?S2lJV0RaN1NkdnFBTUJqbTVPdjBPRThGZjlyRUxkLzNQSmdOb2tPcTBHVmxt?=
 =?utf-8?B?VkRVdVhpTGYxMVhyL2dnRlZMc2gvekdOUmtYRkw5aHIyTWdkQ1YwL2xFMkJw?=
 =?utf-8?B?R2tzN1Bqd2hoZzZKV01aODNUTzdrdzJLK0NrbXB4VzYvQnp4OVNkZWFxaUVP?=
 =?utf-8?B?bnFWNHl5R3YvWmUzSzhhcU8zMHRTMnVQQTlnUmpEMmI1b3hVRFBQVDFnb2Ir?=
 =?utf-8?B?RFFsbHE2K1ZLejZyRk5DNDVHa290bVlJOSt3dEhZank0MGUycjlnY3EwWGh2?=
 =?utf-8?B?TisvRWFycVlINzlWMFJEQlU5V2RIbVZoNE5RVFlrdjlsckQ4L3JuTWxlaWhL?=
 =?utf-8?B?VUJrT083YjhiRy9oTmdmRTB2TzVRdkFtN0VCQWdGdHI1MmQyVVBqWGlhUHNR?=
 =?utf-8?B?VEY5TTlMQzBEUDM0aHphZVpvUmNTTnZPdjAyd0NMeVE3OHVpZmxGVVQ1RVpK?=
 =?utf-8?B?a1kxMjIwSDJpbXBZSTF5R1VUd2xsUElNV1pWLytYRVE4N1A3OWt6WkdENUZW?=
 =?utf-8?B?b2x4N3hBTE91M2tBY2dkbnp1aFFXQW1FOEhKT1hYaTY3bDdRRFd2SkpwKzc5?=
 =?utf-8?B?TnJkN0VCbG9NRkRwYmJJZHRyVnkya2llUFUyRExVZHNuTmZiWDlEVFptMlFF?=
 =?utf-8?B?eVNWNCswMWFQVzNtc0k0NHh4RUM2VVorZjMrNmw0cWc4TmNNVWdTeDhGdVBM?=
 =?utf-8?B?TEFWZGdmNXduS3UwUmhZd3c4a0d5MVdlVWxvTTJFaFRDQzhkcThhWVVuVm9P?=
 =?utf-8?B?azdLcis0TFFkNWYzMUU2K3Z3eGlHa1huNTFDOTdWVEo5blhRYnYyWU5CWHIv?=
 =?utf-8?B?UHRmR2ExRU92ZDBGT2t2OFpMYVl3dXNjbVlKWVJPYzVuVjRsTDIwR09PaEg0?=
 =?utf-8?B?dVIyeXQ3MzhoVkhyVkc1SGxpdUdsOXNmV3BER1R0b1Q0N3JBOTBpc3dsaEhO?=
 =?utf-8?B?SFYxNWVJYjdBR0Y0SmsrRHhjK0FEaWw3MEFSQ0pubHF0dkxHNUI4QlNmNkZO?=
 =?utf-8?B?QnZMSWFSVHVQYlI4TDVUYXM5K0xiaGp3RlZPWVMyOFBCYUVXeVBvZzlLN2hT?=
 =?utf-8?B?K3loV3R4R3pTVEVGTlpRWkI2ZmZjemF6eTBMOUJKSTJLTHZoVHE0Qjh2dFlX?=
 =?utf-8?B?VGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b4380a36-60c8-46fb-cdad-08de0785deb2
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5089.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 22:47:48.2704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uaYodKXTI5sSrCzs74d9qo3QybSqFxcQhtCjDtNq598JT+82PNm9FGPPlhxWjSPu1U34C2lovKSnbl968BUwvhNDSWHNviZrnBBE8WSNOG4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6409
X-OriginatorOrg: intel.com

--------------RQnnNcVDSzfaodRBPZnpNR2H
Content-Type: multipart/mixed; boundary="------------8IvFTxfl0yJ1yqMBuPpMqr0q";
 protected-headers="v1"
From: Jacob Keller <jacob.e.keller@intel.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "Kernel.org Tools" <tools@kernel.org>
Message-ID: <8da6b3ed-58c8-4f79-8d5b-31fadf2e141a@intel.com>
Subject: Re: [PATCH v3] b4: support send-email aliases
References: <20251009-jk-email-alias-support-v3-1-b90eb4b9c22c@intel.com>
 <20251009-miniature-toucanet-from-lemuria-00179d@lemur>
 <116c58cb-8752-4c6b-95ba-48b30e3aa23b@intel.com>
 <20251009-space-porcupine-of-lightning-1086aa@lemur>
In-Reply-To: <20251009-space-porcupine-of-lightning-1086aa@lemur>

--------------8IvFTxfl0yJ1yqMBuPpMqr0q
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

--------------8IvFTxfl0yJ1yqMBuPpMqr0q--

--------------RQnnNcVDSzfaodRBPZnpNR2H
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQQgQFSp1zOQVirsQx5qll0+bw8o6AUCaOg7kgUDAAAAAAAKCRBqll0+bw8o6FHq
AP0S50eytBaMWvqLXoxxV73KQ+hXMrpPoIeOfzEoMNg1PwD/deggHO4skBdY0MKR2PGhX+Bg9r8k
8hDCuTc1VmbZlQw=
=x2z2
-----END PGP SIGNATURE-----

--------------RQnnNcVDSzfaodRBPZnpNR2H--
