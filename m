Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412D526CE23
	for <tools@linux.kernel.org>; Thu,  9 Oct 2025 20:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=10.30.226.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760041371; cv=fail; b=sWBTxt6vxQlvBRbqprMkkt3eIrtmKioZReGrJZ54JCMTUdQIWnfQMcJY4/1fSDwNvDUvDMVhRKG5J2FXMkU/URH0AsC2l9qyNCH3fdNupDpiUc0CiTKwU5nPBNIOl3+xth2bC5XOrHAfORwM5xJUTzbyRIJMa6gaonC7WKWOENo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760041371; c=relaxed/simple;
	bh=O8epvosD3nQo97mA8Pvhgzk22pmsf/4jLRpRRHjJRLs=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dDQJVBLeqTSzurz8RBCMm+MIfkZnoIyUV0y8B1DB9A0Fodfk4sVxZspH7iUcPSQXM3F8X/HxOGOpsOn/NuCutjyOcLfuJ5kGZ2AvHWgCjYNe3tQvwhKGwLYQ7z+43ELpGTWBVEN8fthbfx4RLMtEDWPiSudBxwojbPyL27IDCWo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h66HepWr; arc=fail smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h66HepWr"
Received: by smtp.kernel.org (Postfix)
	id 1D6D4C116B1; Thu,  9 Oct 2025 20:22:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C7D0AC4CEE7
	for <tools@kernel.org>; Thu,  9 Oct 2025 20:22:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C7D0AC4CEE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760041370; x=1791577370;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:mime-version;
  bh=O8epvosD3nQo97mA8Pvhgzk22pmsf/4jLRpRRHjJRLs=;
  b=h66HepWrxneNLJ0R1Vgu1t+j/mbKAXSAuZNJSYIjVeijosSrf66y+BCE
   R61fpoaszkSLdLfSEo+p1dL/gO6W6hNsP/F9Wi23Npc/hWLPTj2TQK6Kx
   EFRjfDlh+C131J53DJ2DVI0Tg0j190ViG7WrZuUXLST/Hbjt9KCkrI6Fi
   ktYgtNydQLbxv3tMG2Q3QW1P2gOEYAeL87ppZFiuyqO4NTxFGDSBYwSNq
   po8FccbDedYEVdMLUIgQqNri8g2C/MTmweEM6iFdGYw7BDZm9wDkgUXXd
   PYn93cqxLkBpcC1pW5psTkIkKEQ28COCqA5J0qzpZQNf2mE0AtfEBXj6/
   A==;
X-CSE-ConnectionGUID: nVyC58WETfea+YfIrA8ZdQ==
X-CSE-MsgGUID: zhdNFt8fQ+OSdlhFqqIeiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="84883736"
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; 
   d="asc'?scan'208";a="84883736"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 13:22:49 -0700
X-CSE-ConnectionGUID: PzciClvbQdSqOIr2cZqZ9Q==
X-CSE-MsgGUID: pznWaC07SvGiB+xiOaPwpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; 
   d="asc'?scan'208";a="180753742"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 13:22:48 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 13:22:32 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 9 Oct 2025 13:22:32 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.22) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 13:22:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZEPQTJWqmYcWGmg1ORVP/ScuAQfVfV0alCWVfAbkJiP/Xp96tmfpWyhCpoXr1Jts0kvInxd/XR0ZSKjmGyYcsOPi/TiKGsoPvJOh64TRhJOXCD3Ab7PkiOA+eVc+y9eqWks1GYSzxVfw/qMiVCOtHj1h7cQzccIC1dK2BoqoKgGJxLUY3WmJsbuJeRqtqQbs8wbZWRAahh7YHWXROylECbsdqwy2BENw5MXXCouV7sk8ze64iVRuysOmwwuycEyh0kzP3PZ8IhxamLhy/5WCYwSwQzAT2tOeGb7QSUgL7NQj3aAHWC8CGCsPzIngm9nLpLrD4k8RF3CchH5iGpmSbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jm2FwBdn5HmVten5ZOe9bB1JZEvpprqmxUg9xDksKXA=;
 b=qv4rXyeP+7o++yAoYMdRDjEXGQ+MX7Z4H2Dv54jDJNiDKaEAbfp9evLV+sb3Ow101CVb0OSWgrTu8WRTPhTveIyyDYQpcqOPQB75CaKu+/wSZuiPXbmMfPG5TKxkXKdFLjTnfh9spgzT64SnyJS7i92ZeXxfE1c7IxoBaVQ+6JOEJ74h7JLMo+BeUV58gI0+PDSpPAA2AbdhKjP8gNkDRoXPh3diYZsvc5td8EcA2AbBluUrovxtqND4hq6NzrQT71eQQc5y2rjJ8Q9M57tuCrjgaKfgNqUIQECvG2eJQQeB9rULQ4GyVWY3DVRKMT8HvqQHNDCK81kKrYz2IKPjcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5089.namprd11.prod.outlook.com (2603:10b6:303:9b::16)
 by MN0PR11MB6088.namprd11.prod.outlook.com (2603:10b6:208:3cc::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Thu, 9 Oct
 2025 20:22:29 +0000
Received: from CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::81f7:c6c0:ca43:11c3]) by CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::81f7:c6c0:ca43:11c3%4]) with mapi id 15.20.9203.009; Thu, 9 Oct 2025
 20:22:29 +0000
Message-ID: <6b8b99fc-a6bb-44ec-89bd-ae79c3b91208@intel.com>
Date: Thu, 9 Oct 2025 13:22:28 -0700
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
	boundary="------------nHGRrgRVUWATrh6s4tf2FlQH"
X-ClientProxiedBy: MW4PR03CA0290.namprd03.prod.outlook.com
 (2603:10b6:303:b5::25) To CO1PR11MB5089.namprd11.prod.outlook.com
 (2603:10b6:303:9b::16)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5089:EE_|MN0PR11MB6088:EE_
X-MS-Office365-Filtering-Correlation-Id: f4fae5d8-8d4f-4fdf-5bb7-08de077191de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UkpWcEtsUXJxcTEwR0w3MU1pQU9YTkRpNXZMMzkya0wzVzJMa2U5UlhKZ0hT?=
 =?utf-8?B?ZnlCVy9NZGRwbkdOOUZKaHJKQTZ2MldWTkNDVU9mTDF4a0I3SVgvRHY1QzVB?=
 =?utf-8?B?amlCUWt0R3UveFhvcTFmZXJNRzNmekFGSWxFOVNiSzdpTFpYZ3p5L1hNaGFL?=
 =?utf-8?B?TTliYkl1eXQxR3ZyUWN0dmJjaGNZR09mSHdwMGU2T2ZVZkNiMkpGZnJldGFH?=
 =?utf-8?B?cVJhU2xJMFhnbVRmbmhnOGpFV1pic3JpMGgxUWJ0azVxZXljUXlpVnhRUXJB?=
 =?utf-8?B?MElmWEtCZDRWTHBWUGtTRTFZdXNFejRBNUZYdU1EaHZrem1hc25TMjhRRGN0?=
 =?utf-8?B?c0RDbnE1L002Q3dCS2NmVlRaNmxHNzZITjlNbmFtVWdVR1NwN2ltRDFyeEJz?=
 =?utf-8?B?ZmtKR0cvWFlheG5LT0FOMEVvaWhJMFdWeVJDT1I0TFVaWW9iYzhDNWRNb1J4?=
 =?utf-8?B?dWVkaWdqS3ZtTjNPcVo2L2ZsSURUUlZkVHEwVmVQdnN4ZVJYQklVN25VZ05Q?=
 =?utf-8?B?ckN1cFNyckZHeDVnVDhYc0R4eVR5dkhNNnBpTDV3ZTFkKzVKaGp0bUx1SXFU?=
 =?utf-8?B?Vm43bzkrMVdzN2ZjTTFKZ0QxdTBlcEhqMUZ1bFdjaVZxOEwzUlNMSVhWUmo4?=
 =?utf-8?B?ZEE2UUVIbUNFck1CMmF5aG5TM2Z2SDZSOFdJQ0VpYXlsNVlXR0N4V0ZnRzJ3?=
 =?utf-8?B?OG12MEhsYWNQdEd6Y3QxUmVLRStnRmFvS3NlMXA4Wjlyckc5a3lmWlcyeWNi?=
 =?utf-8?B?NzZBL3pkbXhRbGEvRXMxTmQ0MFFTL2JHRW0xUzZyN1pGYmZKVVcxRU1vSFha?=
 =?utf-8?B?MCtydk03QlRFQkZVUWt4b21zQ3VZcTZmTVBNWEJJMkgvaGVOakczd0JoQnE2?=
 =?utf-8?B?TU9acTFIWUtGYnI4azIrTDVCUXRSUVd0VnJqTURoUkZWYmgvQzV0QmZreWN1?=
 =?utf-8?B?VUNGczkyRWNhTmVMOG5nblM4ckhUK3FtVDRucFFVNHhKUzlHM3NjVzRWZVZx?=
 =?utf-8?B?QXM1ZlZsV2djTzBLQ0NlZVgwWTBleE0vZFhtRGQ1MUtsaHFRYlZlVkxabVJ5?=
 =?utf-8?B?azI3M085SSsxN2VRUmR0SEhZYzZRWkluV1dTRjlKUkx0YVR6RGcvUW5ZandJ?=
 =?utf-8?B?ZTZTdlBKaGZuVUo0SG5GTmNtSDF4RFNKYTh2UVVkcHpoY3J2NTlpZTFzT09v?=
 =?utf-8?B?dmlXSU5zWldoR2ZWTXBnMmhmQXhab3QyY2RlUzMvVWFuOVdFcWh0dnpxVGR0?=
 =?utf-8?B?WXZSUUNCSU14aHp2MXhxMHV0SDFpTWlNbnJheHp0TTFTVDZWMU1vdGVNVlNS?=
 =?utf-8?B?Slg4SVkzZVFCdllIWkVoa3VLUEpzdElXdWhnMVVHUkdtcDBNWDY2QVN6K2tv?=
 =?utf-8?B?eHNlSWZaN2Y3dHEzNmJaNTF2dzVzcmw0NXpmc29WZjVjZUwwWEFaVnpMOCtO?=
 =?utf-8?B?aGo2ak9jKytrbDcvVVNsbFBVK0psVXJyWVVhcEgxK1FTeUI3Q2VJcTBtNjlk?=
 =?utf-8?B?c2VydEVlMDE3UGZBbGRvVmdLM3ByR2ZoaG9NYTdTSWZ4U3lCZmRjVE1aUlVB?=
 =?utf-8?B?RDkxZzFBRlp0NFdYS1BONWYvVUtmSWRWQWdUM2ptL1BJa3lPV1lLZlpiTDFm?=
 =?utf-8?B?WDZtZ0kyU2dZWDR4U1FsbnNOQmNhK28vTDFiczhEOUFUSjVON0ZhUWp2eWk4?=
 =?utf-8?B?TG1VWGVYUHpmcDd4S1YwaUFiOG5WNlBwT0ZGRFVUVnRybEthS1B1anJTMnB2?=
 =?utf-8?B?ZFlJaWVua1haT2hGSlZINTAyWWdmMWhDb2p5bEdoem53WUtNckJxdTVuNitL?=
 =?utf-8?B?RU9EL1pLWkVaZ2laQ0dNaHE2TkhqYWpKekdoeksvMklXKzlzalE2Z2RKVVAy?=
 =?utf-8?B?TWVqUHVwWStJSTk5YWZZblhScEh4Y2tJUDZmU0F6SmJxWTRGTnFUcUk1NXRh?=
 =?utf-8?Q?LYeDdjWd8kLsnFn+1wx2zGosuwxo2LCi?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5089.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eVJ6QUY1RnZzV2xzdHpWMG13dTBYOUpYcEdWNWhRWStVL3E0c1FMNGFSWHBX?=
 =?utf-8?B?d1A0ZzdIb1FKLzZKSFUya0Yxb1lCZzc5TXk1cWNQdHIyeS9YRkdZRUUralVp?=
 =?utf-8?B?d0NUczhmTk5wWFZGazNiQW1UeFZrdUtmaTJwTlFtYWZ3b3NUSHdEa3pNZTZZ?=
 =?utf-8?B?RktONlZ2T0FzeTl0WXZPV0Y4V09BNWhQV1BGR3dXNUNPbXJrR1MwYVlwOXp4?=
 =?utf-8?B?OEFpd3AxWFAwcVBlWWVaUUdwVmlIN3EvUU12anJoSThMckc4WjVuc1MrN3Bk?=
 =?utf-8?B?aWtxekpiWDhNRlFBRmRnNTVYNDdhODFyVjNXanJTZ1lhcFZtZm9ydU8zTEVH?=
 =?utf-8?B?MEduZ2hXaDN5YzJoNmd0cDdaVmFlUXkyY2JPUjRuUGpjU2VJa1RvblJsRUdp?=
 =?utf-8?B?TGlTVTRGZ1RwR1FYdkd0QWlsanpreUQ5VisrYXpEbGRDaHBScGRxQnVtVEJk?=
 =?utf-8?B?djJqKzUrZGc2MzVORzRBYTVJWTJzK1doYlpQb05pMHVQOTZTSmlQNkVQcXpK?=
 =?utf-8?B?a2tHWWQ2WmNnaXI0Uml2VkIyVGRwS2g0Z1J2eDRsR2xaUTVNeVVwTjcyR0NN?=
 =?utf-8?B?WXQ0QlpDeUtSeGkwWXpaZjdwdzFwbFdjQms1cU5JYkdyUGFrdzJmMDVKMDM1?=
 =?utf-8?B?a0dUaWV5WEo0aGo5Y0xLRVRpRGFyZVFWc0hxekI5d1VGWFlkSWYrNWtuOXR1?=
 =?utf-8?B?MmV5OTZPN1hNdkZwSkNpUnhoNkRqSGZVKyt4bjN2VVpCTjVQWG1laVBic0dK?=
 =?utf-8?B?d0lUNk5wMGZ5RFFvNEJZM2k4bjdqai80elZOd082UGxZckx1WkVhTHE0SGRL?=
 =?utf-8?B?Nk0rMTFyWXI1WG1SZDB2M0FLcDAxVzJTSDFZZ0pVR1BHa0hvbFEyZ2NERTZK?=
 =?utf-8?B?bmdKSXlXVTh5eE84alBRQ1JyYi9xZFpzMXpPYjFCdjB0b0VDNHc3eGdKNWc4?=
 =?utf-8?B?eUFUMnk5NFpJQW9RRGxyRDZMOFRuMjNWdGpNNFBQUUh6a1hNcVR4b0VKamF2?=
 =?utf-8?B?OFRpMkJGNFJPNlliN3VLVHE5anluUUVQZXR3c05GbEpYSFlsUUFpSzZvRURH?=
 =?utf-8?B?UUR3Wnh5YklwQmhVcUdKQVhscC96OTdGVGZ6RTU3akwzcHkwNTNVS2JDOEg5?=
 =?utf-8?B?eEl5b081ZXhZdUMraDMxczVEcktvY25SamxuaEM0OXhuRks2QlVIdTNhbk8y?=
 =?utf-8?B?czJHazBtVjRxT2dMTnFDTTFUOHhzQ200ZWNMaUxQUWxNRCtJckQyWC9uZXF2?=
 =?utf-8?B?RWFrKzRwNUdHK3BrOEJuNDQ3N3FjRGJaZGtPUTlFTHRYVmh0YmZwdjNodnJv?=
 =?utf-8?B?ckFNelZSLzgwVWdBemhQSW9NeDBXZWRBY3pyODlkaHNDZjNGWlp2OFpOMnlP?=
 =?utf-8?B?VkRLbFJ0NHlnMHM4cUkxbjZxMXpSdHpydytxTFIwU080eFRIZGtFNjIyZEg5?=
 =?utf-8?B?QWJENS9PUTNsWFBBd2NYL1NML1R2T09BOEFlZkZKVTBmZWRiN0lJUDdmZm5R?=
 =?utf-8?B?NG10dWpROE5KR0JBODZ4Q1JlaE1KRUV0VGFaUzdmNmJhcGovb3czK1RURXFQ?=
 =?utf-8?B?QmR2eGNrbU5CMjZqQUt6dCtUQzhoTnpKaStLUU1mNk9mWG1nTFVyRkhuZlp3?=
 =?utf-8?B?cGZPanVRa0grVXNmRkdRRy9PWDdhRXR4ckxZZUo4MWtoT1crVHIzSXk2Y3Fa?=
 =?utf-8?B?ajJ4a3JxN1Bzc2ZMYlFsK3NudHh6cWhDZ0ZzN0cvcStVQzVMOTh5KzV2UzMz?=
 =?utf-8?B?VlhKaW96Q1hMenlHdjZNK1l1RnhPT1N5VkVjN28wOGFxbFZyaEpxd0dDTEQz?=
 =?utf-8?B?bFNPUlNJYzNKMjZhbWNJVkpRc2JENUtTVVVka3EwdGRSaDRpMGlub1RKdG1X?=
 =?utf-8?B?Zkk1S1JVRFFmYjh6ZmlJQnpsWEJ4cWR4ZXpUY0dvaXNsTE1oQXVqYzAxYjZ0?=
 =?utf-8?B?YkRvTTNiOGU5b3lDbUhVMGNnSW1kRnZNN1FnUWt2VlpRcThWVFBMaUxHdW9E?=
 =?utf-8?B?b2ZseGpYRXJqOC8wRDVNYU1FRFVhbVlNTUhROFg2Sm1tQ3F1eVprREZRcFd5?=
 =?utf-8?B?Q0ZPVEc5NG9HMmdFREZWaDljeVA3S3BBOW9rd2hLbEZtdDdEVkxnMXEra3pF?=
 =?utf-8?B?VlllRTkyeUFGMHJoclpiSkJqN3dvZkpQbzVOTnlYMzRwTW9tL1JvOTMzbTZh?=
 =?utf-8?B?VXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f4fae5d8-8d4f-4fdf-5bb7-08de077191de
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5089.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 20:22:29.4410
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WmAoMhyciqRjNgVO36LCBxenKed13ph+vMzGZrXmtbXNVcZcun11niA8Ckz0symPZQNwirV/8kaoNMYx8GWUyZ4LUvRrD6uTR1QBJ9flNtU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6088
X-OriginatorOrg: intel.com

--------------nHGRrgRVUWATrh6s4tf2FlQH
Content-Type: multipart/mixed; boundary="------------OVRnljGu0vAO6i7eBMd7pcjB";
 protected-headers="v1"
From: Jacob Keller <jacob.e.keller@intel.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "Kernel.org Tools" <tools@kernel.org>
Message-ID: <6b8b99fc-a6bb-44ec-89bd-ae79c3b91208@intel.com>
Subject: Re: [PATCH v3] b4: support send-email aliases
References: <20251009-jk-email-alias-support-v3-1-b90eb4b9c22c@intel.com>
 <20251009-miniature-toucanet-from-lemuria-00179d@lemur>
In-Reply-To: <20251009-miniature-toucanet-from-lemuria-00179d@lemur>

--------------OVRnljGu0vAO6i7eBMd7pcjB
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable



On 10/9/2025 11:24 AM, Konstantin Ryabitsev wrote:
> On Thu, Oct 09, 2025 at 10:01:09AM -0700, Jacob Keller wrote:
>> This implementation minimizes overhead by only requiring a single git
>> send-email process, and by only translating addresses which are not ye=
t
>> fully qualified.
>=20
> Great stuff, thank you for working on this! I have a few improvement
> suggestions below.
>=20
>> +    # Translate aliases if support is available
>> +    if git_check_minimal_version("2.47"):
>> +        logger.debug('translating aliases via git send-email')
>> +
>> +        qual_addrs =3D []
>> +        unqual_addrs =3D []
>=20
> We're trying to be type-clean, so these should be:
>=20
>             unqual_addrs: Set[str] =3D set()
>=20

Unfortunately, set is not ordered which breaks the zip I used below. I
considered some options, but I think this can stay a list and we can
either use an OrderedDict or just check for duplicate entries on insert.

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

One issue with this, is we'll also need to modify the check for
unqualified addresses in the following loop. Otherwise our addresses
will immediately get discarded before we find them in MAILMAP_INFO. I
think I got that figured out though.

Thanks,
Jake

>=20
> Cheers,
> -K


--------------OVRnljGu0vAO6i7eBMd7pcjB--

--------------nHGRrgRVUWATrh6s4tf2FlQH
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQQgQFSp1zOQVirsQx5qll0+bw8o6AUCaOgZhAUDAAAAAAAKCRBqll0+bw8o6AUX
AQDRfcej/HmFRx94NMMigpYlKnJQBXZnqfYRNJjdO1jsdwD/cRg2pajWBDCnhOMJJvv0+2MbZYlg
QHqCWqumP2pEGgc=
=P4wP
-----END PGP SIGNATURE-----

--------------nHGRrgRVUWATrh6s4tf2FlQH--
