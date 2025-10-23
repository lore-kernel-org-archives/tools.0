Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7DE86340
	for <tools@linux.kernel.org>; Thu, 23 Oct 2025 22:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=10.30.226.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761257061; cv=fail; b=avzVoWhjW42LVinbiYwlSfr+Raz6FQnSjL+V94/gFafppCDbiO7ofAxP2yeYqLTDLwHtjPDYYe1I2iUVXymkC3QswsiyYh7O//ItmhO2JAf6xSXLT50fsdn+X0h5ftMHfG8X10HEb0NLqBNrjMW30W1Bvg0KZ0daJu9TW6pLtNM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761257061; c=relaxed/simple;
	bh=AwyJln2PZJIMMuycZwSrKtX1tao7wANZNdY79lOzqGk=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=n2QGkvJTuK3NpYy8D/Z58xJm0ND3ANKHzezpDI/Uu6zqV7iYXDo8jCn7PhzS+oJmRBKmG4udOOjymqwp0iDOzz5ItpNTcGTP4c6+qZGO4wOdk1+R6XA9HCEwOc249OngrMy2qU0nJ5kF4Ww13R9XXX6hUhYVSByAd6ubOcPNIxo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fh8sf4QR; arc=fail smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fh8sf4QR"
Received: by smtp.kernel.org (Postfix)
	id 31201C4CEFF; Thu, 23 Oct 2025 22:04:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2B4BEC4CEE7
	for <tools@kernel.org>; Thu, 23 Oct 2025 22:04:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2B4BEC4CEE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761257060; x=1792793060;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:mime-version;
  bh=AwyJln2PZJIMMuycZwSrKtX1tao7wANZNdY79lOzqGk=;
  b=fh8sf4QRi0PzPkstnKKgPef9AEO0JPeBAUCTqAB6MgszA54FWzkb1kjZ
   Qio/N9VJYYV1Z0cSRDRG/i/ChJswCFeMMWxy4QcpP5y2EkTknD9Y6Iob7
   oWlm7t6nVdGBq1JDWVjN+ueaJlyW5hv80WitByPtKGSGi+mdpnunZaZ1p
   aTdf7d38JIIB58XG4fCB6T9bAJtrMneLYBpffbHQNHiPBestHozU93Vud
   rNAVhcAJ4IIx0yVvqdKxGrlO7KfsTYXLd+sToMDLUY5XiLd7ajn1TVQrF
   VER7e95Iaed4V8WoIfV5odyEzIinfefJ1oa6r0m+Mk960qWuVt14maXe0
   Q==;
X-CSE-ConnectionGUID: zJH3PpbjTfqsv/xPgQZUZg==
X-CSE-MsgGUID: /qNMKXkRSiGLHSn2+CVJ/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73728812"
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; 
   d="asc'?scan'208";a="73728812"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 15:04:19 -0700
X-CSE-ConnectionGUID: YhEAooXsRMWV6qGPn7GJ8w==
X-CSE-MsgGUID: TbvxfSGaRzuasvM17obdzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; 
   d="asc'?scan'208";a="184750519"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 15:04:19 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 15:04:18 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 23 Oct 2025 15:04:18 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.6) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 15:04:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KMyZI1usxY+66cHIl0qP3gseGLq6abf+KLuCsOfUiULExcWPzOGA9GgDONfKayTHFKgrO/uxyw+dXVyu+GxzNIgGVuw2BPpjQ6xb+SFU4lY6VmMIyF3u/y+5tLBonvQDbSjTv7SCEy+I6xtD49fSeuXLuHtrwlKqVn4ze2xCsTVWyNJ90oDhpyFxfsBXez8+6ES2ljYu3Gn9CrC6C7b9aRppY5iMLsr+gh2AcPnDWDK9boRAwr2hU2SXRrYKXR9qE9OZ4EEtZJ/UceTF/Y+efFj5lEfQzURXjvAUjQoBv+1Lffow54vmIvZYEq66m2wes3tjOD+ugVwTmSF5gcdM4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bQ6d/M5on6aw6XHDJn2lFPdMW4Bun/NmmRYRsziaGp8=;
 b=rujnhgIa5jgAJ4c62Q0SgFbI5Ys5ghmfItilperJM4Im6Lwl91UkXmF0E5dQwxHCBQ6XtKH3wK3UXGr+kBArl9ajDu8OQLPb71KEzXTfmu/NBPJLrQElSSLDcUoydUPYcqdUc/x7SJOjDn1X/5jkKBveHPdroRwwG5i/DgvxlK/JRQyM3GnkeRbNB8Hz3Bsh5K/+6pvIyXDAMkSLNBurSqbPZ9RHykROYGOs92L3q+nPmGvyrobVtxr+LMYxhg1o8PEbruLeutqK9Rs7/M9DVmlzLUbNrDe6Uxt6kR5GjEsuJlETI1qNcA3b1NwmCd3UfXqiaeJxBk3BHVFZ6TgNXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5089.namprd11.prod.outlook.com (2603:10b6:303:9b::16)
 by DS7PR11MB7951.namprd11.prod.outlook.com (2603:10b6:8:eb::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Thu, 23 Oct
 2025 22:04:16 +0000
Received: from CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::81f7:c6c0:ca43:11c3]) by CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::81f7:c6c0:ca43:11c3%3]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 22:04:16 +0000
Message-ID: <6ebd7f92-7ebc-479d-aeec-d4ac008dd21e@intel.com>
Date: Thu, 23 Oct 2025 15:04:15 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH b4] b4: allow multiple b4.email-exclude config entries
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
CC: Kernel.org Tools <tools@kernel.org>
References: <20251022-jk-multiple-email-exclude-entries-v1-1-79f4b936f612@intel.com>
 <20251023-merciful-angelic-squid-0a97ff@lemur>
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
In-Reply-To: <20251023-merciful-angelic-squid-0a97ff@lemur>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------0Ku9uWz3yFXPncowpli9lcnK"
X-ClientProxiedBy: MW4P222CA0019.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::24) To CO1PR11MB5089.namprd11.prod.outlook.com
 (2603:10b6:303:9b::16)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5089:EE_|DS7PR11MB7951:EE_
X-MS-Office365-Filtering-Correlation-Id: c6609f9a-91ba-4ce8-e216-08de12801be1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aUFxN0lMV2FYVmFlTTNxeTB2SVQ3UEx0a0I0RFJvRlNTRnZJT0EzWXBFOUly?=
 =?utf-8?B?Y3dsN2xEdEx1R3IwRldhL1lUU2Y4TWZqN1BsU3VjWGh4bjl5QXRsRVo3Y0Zo?=
 =?utf-8?B?b2E0TUV3RTgwRWVGVEp6bDBabExJT2Y3TW1DSzNUNFdnQXNWd0l3dlpQclBw?=
 =?utf-8?B?SzYxMlJjK211eHBydVRCdm1wYndMYkV1OVBDNDhmcmxuN3VLbGpFNkFLejF5?=
 =?utf-8?B?SVRubzV5VWZObHRqUVgyOWZOQmFZZUxXS1E0SUpwTjl4WkNrczV1b2dyR3k1?=
 =?utf-8?B?WmxCMER5MjRjNVdkbS9xZXluYTgybHBhNzZPK3hFT29iVWRFb3JwMEtJMjFP?=
 =?utf-8?B?d09hVTFESkJRNTNQYUZ1OURFNGx3eU91eHV5QnRGZmZhTUluS2s2dWhPa0pj?=
 =?utf-8?B?ZGE2R0RYSnM5NHVoaDRybWtRNHpiRXRhQ0IvbnpCV2RoenFFeGRkRDR1SVpG?=
 =?utf-8?B?OHB3eVZvdzBlT2hCbitodGczaHNGekZnSmJmYnRzcUlVSmJ2QzlENWg4UkpV?=
 =?utf-8?B?b0RsTE1ydjZlQTZCemZhZGVWd0FwRUpYUGpYMFdQaFFBNEpBOXdDNlpQYmM2?=
 =?utf-8?B?RHBtZENNSUdWNU94eURWYTBYZXFSY1dIa0NjeWVmNUxXK0l4MVd4eU9EMU5Y?=
 =?utf-8?B?RlJzUkR0emdKYVBnM1lZd3lsd2VnT09BUjc3NW1OVGlQdkF4SFplb1IvbEt3?=
 =?utf-8?B?ZEdqK1hubW9USEh1alE2SGN4cGorWnFTYWpyVHdXWnBrTGY2YW9NN1ZIOVp1?=
 =?utf-8?B?d3pyQk5PVm1ld1RoMXM5bmVhSGNNN21neENJd2txMnhKY3N0Sk8yT1FYSjla?=
 =?utf-8?B?NXRsc0RnN3J0VE92NmZVU2d2V2NMTHV3cGRXZE83cGhFbUlycC92K3FQVlhX?=
 =?utf-8?B?MzNjSGVSTXg1L0tGRVp1V2VEWDVTYy92N3MyRjVrVUovT0NMdXZHcSthK3Rk?=
 =?utf-8?B?WlZMTHJCU2hmSlgzNjZXb2IwYURDTURLNGx2TVVGSzN4Umk5VjFFb1dGQVF6?=
 =?utf-8?B?OVZiS2cwSTl5bHpkVlhyMzF1aWFiTjdTS2J4MlFXRTdBU3B4MklLYS95eWdz?=
 =?utf-8?B?SWtWL2tVbUhpSnpMYnI3MDd2NnZSTmxRd3M3VjRiTXdXRjJIS1pNNzVQbUl0?=
 =?utf-8?B?allvQUh0VmdrMUxVWFlTTlN6MytCOThQQ29qaEZUNHNpTk5XdUdzOXoxTE5E?=
 =?utf-8?B?aGFIWmpBWDF3SklWcjlDeFpVTFliejNjTGg0SzdLeVhFZjJrbTM1WmRvQ1A5?=
 =?utf-8?B?U2h4NHpSajBDUkd6L2srZVpiK1BCcGJNZndWM25mWEVmS05vT2UzU0FtdnJF?=
 =?utf-8?B?bzB2YkdFekVmR3hDRkxndFpsQTRGbTZiYkhRaW5Wc2UyY0VRNjQ1N2RQUlpG?=
 =?utf-8?B?dDV1Y05tRDBzRFBsRU81K2gwVUtPL0lVcWU4bWlieldGWHN5WUtKMEsxMWlE?=
 =?utf-8?B?Um9JeGQ5N1pkQUtUcy9TMkY2UFc0TTltM1MrS1ZNVW8vdndMZ051QkZiUFg0?=
 =?utf-8?B?UDQvRzEwckV6UkxwSzkyZHU3ODZYZFJFejF2cWdWbDlJTlZpT2IrOWM1Lzlh?=
 =?utf-8?B?dGw5WGVsNEdLOUl1dTJWMFA3TloyTXNmeVZPZTZGamVZK1RlTGs1clJ0c3Yw?=
 =?utf-8?B?YzNlNTJvZGM5aldvWXprb054emt6aW43OFZJdkR3NWJOVkFvb21UWFdCYmt3?=
 =?utf-8?B?amtXRGZVd21CblhUYUJNMkVVeWhDeUI5MkxCTVA1K0kydzliNHpUaW9MUFhy?=
 =?utf-8?B?TFFIWHRnbUtEbkVsNG0zN2lLVFB2TjFpbjdHYkhVU2dPTmxXUGkwVXVsUXB2?=
 =?utf-8?B?U0U3ZGtnYkRWMjVGdkxmeDFCVHpwanhIaGFzMjdEZ1ZOTTNZY2JuQUNQUUZv?=
 =?utf-8?B?NTlNTUtzb1dkSFp4T25OTUVPQ1Z0UUE2SDVEZnZrY1JkVGxsR1BLYjFqY3FF?=
 =?utf-8?Q?Zq2uWTv+MCEjI25AxI8k+3cOPODXMtsV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5089.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZmFEWm5aV0lGMEgwL1IvbWdFZ3hVWVkyc2pISEtBL3VwNFVpdnRDYkZBdmJE?=
 =?utf-8?B?VHI3OUNjZW5xSVErU0VieEx3cmxRU09jajl6a3lvUzRMRDNaQ050NnNNZlhT?=
 =?utf-8?B?Z0lYaDdEWkJxcEZyR3JaeVJmT3g2aDk3R1k2RlQyck84ZUZvKzZqZ01JTERU?=
 =?utf-8?B?VHNuTFdYbWhQMXZ3T1lWUnJqdStrYTNVK2trUXdZL1p1elV1eWlCMUZ0VGN3?=
 =?utf-8?B?Wi92ZkxBdXpkdVV6cTAyd0RrVDBlS1BKTVlOZGF5NHl6b04zT2h2MC84Q3gz?=
 =?utf-8?B?QXZTcVBpeWxGZlFkNGFCLzlhb1NLTW9id295SE55NDhERm5lbGFUZUxOWGp5?=
 =?utf-8?B?d1l2SXduVzVYRlhKNlVHWEc4d1NLeWdGOWJON1h3a00rQityRjhTeXJ4aDJQ?=
 =?utf-8?B?VGpYK2NXZlMvRFVMUzdYcmp3a0VMMUZ0a3ZvK0NZVGpLY05USDY2b0FxeVI3?=
 =?utf-8?B?akpYU0RhZDNLNlIxVlgwdGFmZFdRZU9ncWd0SnU1dkpmcThYV3RnVkRuTXZ5?=
 =?utf-8?B?UmNVT3lmdXZJZFhSNmhvNkZQZFJoejZDVmtRb09naVR3MCtlaklCSVUvbTc3?=
 =?utf-8?B?V1JzUmc5dERMd3FweTlZaVhkem5iNzVnV2tWc1g3T1VOeFpMeUJpRWRiSk9H?=
 =?utf-8?B?bTJ0OGs0UWl2a0V6TUI0YXZvNEE0YzNoNWs1RjVYa0JyUzkzOVU1OTg1YlF1?=
 =?utf-8?B?OUQ0cHhxcHNmcnFoNkVkZmg0bFJqNzNTekNDVmFzdGErb0lqbVJoQVJqL3Vo?=
 =?utf-8?B?dkkzVmJJWkhlV1picVN6RDFKUmlUblAxTmJYOEpoc1p2UGYvUjhuVVczaGc3?=
 =?utf-8?B?OWNuREZPVVRJbjJ0Z1czUkt5V3lyb0EzRTVBYUs3dzB6UndvRE5VeFJuaWZy?=
 =?utf-8?B?bHdNOFJzUGRhUDNBM3pGQmlnWEVKakVPc2M3aWRyb2J0MkZzVXhsUU5pT2xL?=
 =?utf-8?B?Q0o0bVFraTIrNUlhWHZSTWphT3FlRmQyU29POWNWQ1R2dnQ2c0pGdk85Tnds?=
 =?utf-8?B?MUJKVjRweStNNGV0VnhGNzlBRmFuSnk1RmlMMXduSllhWHhtOW1NZ0htd0lN?=
 =?utf-8?B?VktDSGVxd1BKaWd1N3BWbGpNTnhadVpJblNhOEJPTTJoakRJZERmaDdlTnhp?=
 =?utf-8?B?SE1seWQwREpGS29qZnBNY3BYK2diaVJDeHVrT1pHb09EWm16SjYyayt2MS96?=
 =?utf-8?B?UXZ1N2ROR3pWWVFqTUpzT3c1S0RIazVwa0NiZU1PaDNSOUlCSWhyZ09mbTFv?=
 =?utf-8?B?ckZ3b3BWNlVzRGRIZTA1WGZMdXk1ZWl6dUdONS84VlcwaUoyQkYrdWdiaWta?=
 =?utf-8?B?QTFEeVc4MS8xMGdVaWwxYnA5ek9OM2FXaGNXZWlNanpkdkZWeUQ5SGpqNHky?=
 =?utf-8?B?SFpsVEM5MXlaTURNMFZKRVQzQU5OanMvNGVrRS9aV3A5c2NuMGZhdzNJSW9y?=
 =?utf-8?B?QXhQbWJkOHZFQ0hXM2VYN3RocEl6TlBpTmw1Zm8rOTFKeWJHbEhQejBvUGM4?=
 =?utf-8?B?aHhPNkQvUVpjWFNEZGJnWG1hcjFzWlRPZFZDZ2RHa3duMlB4Q0FRSDN0d1Vs?=
 =?utf-8?B?OUdrZFFXZ0VPMS9tdkJDZXVIVXgrWDJ0WEg5cExCUVJKUTZtanU4aDlYYXFw?=
 =?utf-8?B?SFNTMlRET09lRnVHVDVmR1E1dWk3L0hHdTBtZDZEaGxXeUlOK09BMFI1N1k4?=
 =?utf-8?B?WVNJSTh6WE9oVHlOU0hDWCtGUmtVM0d2eHRFdmNuSlRzeGE2cEQ0M1p3bG1Z?=
 =?utf-8?B?MGhtRTFsRlhIdkY4Y2tSZGxLUXEvUUZYY0svRXo5ZEZuVjNGK25reHVKaE1T?=
 =?utf-8?B?Rkg0TzJxa2ZEVVNHbFFpWllWZjVVTjhtNmFBSkR3TkF4UEgrNWNHV1czdjNX?=
 =?utf-8?B?UkhyTnoyekJKOVh2LzZ2b2NkblkvTTJKYnZnczJOS1lFV25WaXlrdTI5bVdk?=
 =?utf-8?B?c3dmM2ZlTGZxSFpxM3dQaXJXYWFBYUJHbkdpQS95SzZmNk9ENEl0dlhIRWll?=
 =?utf-8?B?Y09TZXl4OGFlRi9HWDdVdTFTU2VkTjJFbElTODk1OFhZRzhKRXQ1SjhTaVVi?=
 =?utf-8?B?dTVndExRUGljQ3d4RmNUZjVSWS83QWNJSStESmdFNCs5Zyt4b3g0YjFLNVN0?=
 =?utf-8?B?KzlPRGJEOS9oUHBpdjhodDF0VmloeEhZU0w0bWJxTGNUd1hGUGVmeW4yNDhT?=
 =?utf-8?B?eVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c6609f9a-91ba-4ce8-e216-08de12801be1
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5089.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 22:04:16.7648
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +ssSFHyRVoLkN+1rexLw/i1kqnWmITjG4H7Vr7dEvfYBKUGZ4l6cnbGO0B5zeT+/RwmVWtMDc9muII6C9BXWcn0b7jeJppwQByfERUGiSwA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7951
X-OriginatorOrg: intel.com

--------------0Ku9uWz3yFXPncowpli9lcnK
Content-Type: multipart/mixed; boundary="------------Thi0AGd0Hat1qBSy0oxn0xi8";
 protected-headers="v1"
Message-ID: <6ebd7f92-7ebc-479d-aeec-d4ac008dd21e@intel.com>
Date: Thu, 23 Oct 2025 15:04:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH b4] b4: allow multiple b4.email-exclude config entries
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "Kernel.org Tools" <tools@kernel.org>
References: <20251022-jk-multiple-email-exclude-entries-v1-1-79f4b936f612@intel.com>
 <20251023-merciful-angelic-squid-0a97ff@lemur>
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
In-Reply-To: <20251023-merciful-angelic-squid-0a97ff@lemur>

--------------Thi0AGd0Hat1qBSy0oxn0xi8
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable



On 10/23/2025 12:45 PM, Konstantin Ryabitsev wrote:
> On Wed, Oct 22, 2025 at 03:24:56PM -0700, Jacob Keller wrote:
>> The b4.email-exclude configuration option allows users to provide a li=
st of
>> globs that define email addresses to never send to. The configuration
>> option is interpreted as a comma separated list of exclusions. If the
>> number of excluded entries gets long, this can get somewhat annoying t=
o
>> manage in a configuration file.
>=20
> For long entries like that, I was kinda envisioning it looking like thi=
s:
>=20
>     [b4]
>         email-exclude =3D \
>             foo@example.com, \
>             bar@example.com, \
>             baz@example.com
>=20

I actually hadn't even considered that the config file format accepted
backslash continuations!

> I am not opposed to making this a multivals entry, because then it coul=
d
> combine multiple entries from several levels of gitconfig, but I'm curi=
ous if
> you've tried doing it that way.
>=20

I do have two points that might make it not worth changing:

1) currently if you have multiple configs, the most specific config file
will take precedence. If we change that, some user configs could break,
meaning we have to make it a breaking change..

2) I don't know if there is a way to override and reset the list. I
thought git config might accept an empty value "email-exclude =3D" as
resetting the list.. but it doesn't actually seem to work in testing.

Given that my main concern was being able to keep the lines split which
does work in my testing, I think I'm ok dropping this patch.

Perhaps the concerns in 1) aren't that relevant, since it seems unlikely
you actually want to reduce the exclude list in some configs but not
others...

> -K


--------------Thi0AGd0Hat1qBSy0oxn0xi8--

--------------0Ku9uWz3yFXPncowpli9lcnK
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQQgQFSp1zOQVirsQx5qll0+bw8o6AUCaPqmXwUDAAAAAAAKCRBqll0+bw8o6KNN
AP0aQMcCHmgWwdL8C/jS+R0RDWT8H3mhGDrNsNu6XMyMRQEAlYJ9JJvgDJiH5/ZVyVKKdXKtUC2A
oBkz5yUFDYAoqAA=
=YJ0a
-----END PGP SIGNATURE-----

--------------0Ku9uWz3yFXPncowpli9lcnK--
