Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52675A31
	for <tools@linux.kernel.org>; Thu,  9 Oct 2025 19:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=10.30.226.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760036494; cv=fail; b=KmqQveeENUO9zJOfxpIUAPyc3HgA7///3VyqWblmc/iIQrWHGzaQs8ENKBJjTVuTkqkHH7luWxmF7kGrqQShxcDYJzg0//bLO1hI9tk8hPnqNmPKdDBlu8Qv0t5+IzktY9//IsetYP8LaLZiELYPYmfXedAFqwBlh2PPyqqNdhk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760036494; c=relaxed/simple;
	bh=zinQKB7U9275MwsVFVlLniGE68O3XWBkFytT5Bci1Ls=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=WUS72dmKRfG9/y/Zzm0Bwt2hJR68iN5qUnPZFr88vd8rPju9EOXhOOIHbaPFYK7mlL2uhZKQT5GBBW5Qgly6hS8OdC/S2uM1vwXGKb+WQnBaikZeZZY4V2Awkt5lI8/jJ1X730jj+ftzbjQmYS9CX8ezxIXeFXanIxGr9RgbEcU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mi9dW7yu; arc=fail smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mi9dW7yu"
Received: by smtp.kernel.org (Postfix)
	id 05BD6C4CEF8; Thu,  9 Oct 2025 19:01:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BECC5C4CEE7
	for <tools@kernel.org>; Thu,  9 Oct 2025 19:01:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BECC5C4CEE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760036491; x=1791572491;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:mime-version;
  bh=zinQKB7U9275MwsVFVlLniGE68O3XWBkFytT5Bci1Ls=;
  b=Mi9dW7yu5jlWWpJhLDN5zn+SwXYwB8fg9G07GYDoth7UpwwI+TmnKzXF
   d40Y0Sk/Dq9V3smH/KJTMkpUBQTPBXnMx9DtGJwrXL4iUiSBHg1K02F1i
   KibtQNX7ET58qoG6t6NWuc2rUmmpmOW+j5dWV9ftz/BK0OgWpeGzvUCsl
   UoIIaiuObsIze060PwyvPj5UdMnG5O2xryrUnepMZePlumYelc4cpXL/5
   o7Wy6MYDUlLxyVgSufT78pHVN7hQ5OO+wgj6+qRRKw+eal5wX5NlQu8Kf
   zpI/8E06FbH3Phq2+fieWjSoDOG3M3Pnu2iwEzV3R5EiZ/7bWIMBPDVBu
   w==;
X-CSE-ConnectionGUID: gpBmcaWMQYuF9cmSwck17w==
X-CSE-MsgGUID: /dbbv0/iTjG4vsgayI6hFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="66087449"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="asc'?scan'208";a="66087449"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 12:01:30 -0700
X-CSE-ConnectionGUID: 8NBfzo9aSQGMAcI3C4p0wQ==
X-CSE-MsgGUID: KwLWrsAoSUy97uIHsxIJhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; 
   d="asc'?scan'208";a="181564483"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 12:01:28 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 12:01:27 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 9 Oct 2025 12:01:27 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.45) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 12:01:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zK7m4nSnx4V2u0nP3hI4K/3X/CeFAU/2bv7wdRsF/vxSR78wpAVcwK3AOSE/I6sH7Enf+RpItNYuBoPcdC8MqXPKmBRTJ6fAMCYI7B/wR01fVdadpMQacy7T7M7ReYHQFb5hXUr0bQvmHqjdIS4+eXZwVmJAqTLdjwSmwNvIzahRrlimcm5asGY1xURbp81V3v/3woA2eknr5J6B/izGeBLgbNNOkD8vnh6cUngghr+4E/7BkrhXMsvSVJsDDvof7CqQawckXJ/EeI7NXKnYhsAbfr8aug4w2f/g0nmK4R/Mwf3v9b0gF15uBzTPlXDmsHoZNnnys74GMrMtVN9jJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zinQKB7U9275MwsVFVlLniGE68O3XWBkFytT5Bci1Ls=;
 b=IXU3bbeQW5RupJU0IsnCSUAM7iqpj8qfoBT9Qc+IK7c1mHFb37lIDfvwe42Brc710W8m3UAa3NJnHIv1Qeoqk1VVdLA5ZExM54nqJ2tyXpPALI+PNKsdCnKIhveCiZNXNrq5+M6sHa2Qp6OudcyFsRmi9foe8fOYSgW9iqwmYsbmGBFbymnnl7ME3HQ3aAbhWuuAbsIw3eZtFiabt+qU+dM6zUpcQ77ALrknWm0PFTVSwMl/g3BLXz5cMtGP10jwmkzhQR0lsC9U/zGt2NQTuf2crNrw6D7kGWxKqZSB2M+dLAZd4gAHcz4BfAEIOFBHGNsnlR+bTrrarAc5fRLkbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5089.namprd11.prod.outlook.com (2603:10b6:303:9b::16)
 by LV4PR11MB9514.namprd11.prod.outlook.com (2603:10b6:408:2e0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Thu, 9 Oct
 2025 19:01:18 +0000
Received: from CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::81f7:c6c0:ca43:11c3]) by CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::81f7:c6c0:ca43:11c3%4]) with mapi id 15.20.9203.009; Thu, 9 Oct 2025
 19:01:18 +0000
Message-ID: <e168bdd1-90b1-481f-bac8-505c37c4a0ef@intel.com>
Date: Thu, 9 Oct 2025 12:01:16 -0700
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
	boundary="------------I4HkgrH7bFXjATQ7EE32mhrZ"
X-ClientProxiedBy: MW4P223CA0001.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::6) To CO1PR11MB5089.namprd11.prod.outlook.com
 (2603:10b6:303:9b::16)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5089:EE_|LV4PR11MB9514:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ed21511-7635-4893-3248-08de07663a34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aW5DSllHaDdBeFYrdG1mNjhjS25ZL0JWQXF6aVpQK1pIcWpGdm93cUlVZHpp?=
 =?utf-8?B?SGdoU3JXMU9QWDlqQisyaEp0QjNxalg1STF6QXVLaHcwbTBOeGE1akJ2ZUt5?=
 =?utf-8?B?amJRblFObDFJVWtLaDNqUURQMDI4VXcxWFZKcjNpNVQ0WFU4WG8zYWduUGNB?=
 =?utf-8?B?RlNacWwwbTF2T2JlY2pkK05YRTZCTGw3MjhRdjNaY1NNaUVmZ2JzN0l6Vysw?=
 =?utf-8?B?UVRQcE9qWU50MFgzdlpXWW54UEZuWWJWaU5zS2F3VUpJTGdKUCt5QjRvMHlI?=
 =?utf-8?B?NFowSXN4VThVdlRZNUlIM0t1TU1Od0RTWTdhQ2lIQ1BSNXdaamdHKzZKUDQ2?=
 =?utf-8?B?MjJJQlBMN1EzWkxObW90TnpCZmRGNXAvWjNjNWZ3TjRwWFp4amdRcjZET2hE?=
 =?utf-8?B?bFlSbThsSHdnSWZHWjVvaDFXdmJaTjB6QW1ZQXRmRkRnZ2wxS05vSGNWUUs2?=
 =?utf-8?B?a2IyYUc4aUIrcEZCV3lVRjJqSkh4UktET1djeXhjYzVBd3ZTTTdrWG5DYWRv?=
 =?utf-8?B?UzRDNW4vdis2OHhVREJUNnpzQklZNXphRHVHVFIrMWl1WTJ4SUFSTTZJOTA5?=
 =?utf-8?B?YkgxYWJFcEcrdFg0TTVKNmpMQy9FV25JejNReTM2Nnp5WVNES1hOazdud3ZO?=
 =?utf-8?B?NjNPemRGclgrRXBlNmN4S1ROSHc3ekYvenU3dHVtbUJvNHR0bmF0aW5zcVFj?=
 =?utf-8?B?ejFpRXE3T1RXb2psa01JdTl6ekU5ZXlIRGZuUVRJTkFQOTFSblBuWkp1cnEx?=
 =?utf-8?B?Vy9pV3RtYmFoejBsWEhtaFYvdHI1WkF0OEQ0cnlSZ1FVK0IwV2JjSFBLNisx?=
 =?utf-8?B?QzRKa1NOZTJNSUFkM2NIV2lPNGRtdzEzeXlKK2U5bzlzUnVNWENHRmQzazRH?=
 =?utf-8?B?ZE9JWGNlK21VUTZQZ2NTZ2R6RVdXK3dFdnpuN3pqNjRxYUlzbnFpQ3hjcEVT?=
 =?utf-8?B?NlZObi9WMmdQR2xoL3RacG9jMXg5aHpHYitCb2UrNWg0Q1MzdGFIZUZQaTFY?=
 =?utf-8?B?Q2J3VWFPbldlRmlSbnlyNkp6Ulh5MHdxK3ZNa01jWHQ5ZGZzUW5EVE1wdzVj?=
 =?utf-8?B?M2RaZUFjMnBpdllkSml3WSs2aVFseW1jeXQ2UEg3d3dEVi93R3p3dDhWZ2cz?=
 =?utf-8?B?M1Zwdi90WVhBOUVLVFNkMFlsVFp0Tk1tVkxmSWw3djh1R01FdlFXOUVRczFi?=
 =?utf-8?B?QS8vMW9Ed1NDbVRQS2R0YUI2QWYyeGI0RWZCNHZEUi9KUXRIQktNVDd5Ui9L?=
 =?utf-8?B?ZnZ4R1F5TjhiVkhXKzJtQml1SVQveW5Id1E4dytrRFE0b25aLzYxaG9JY2Jh?=
 =?utf-8?B?RmlDYUx0UVpDVzNEVVVkODIwQnY5Vk5YSG42TVl6eUxVVEQxR0w4aWZ1NEI0?=
 =?utf-8?B?M0FCLythY1JZMGZZQm9HVE1WcndSVDJTeXVaZDJCYmpiRFVVRG1SUGVDU1li?=
 =?utf-8?B?QjlsOUsrd1NvRTVyWVJBTUV2NlFORTdRUVNWekltVWFlUTI3Yy9pdWZTYWVD?=
 =?utf-8?B?V1U0bmREN1dSQjRZY0tGTzFkdlI2WnpXZWRoeHZwOEU5R0JhRVhCdTI3STVI?=
 =?utf-8?B?emV2cUZRSVp2NEQzNlNDNkgzN00zZFZod1ZzQ3dHVEJCRnJBcWttN3lpYmFI?=
 =?utf-8?B?aWYwTVdTa2FqQUpucGFXdUQrOGtKS0RYcDdITC9PUVp1RlpFKzdCNFU2Szdi?=
 =?utf-8?B?MzkrVmRYUlkyUUtDYTNOSmk3TytIdVZmRmRFSkNWZndHeFNJM0tBTHpYUmdU?=
 =?utf-8?B?a0lMV25hc1pNZEdtY0IxMzRRZHp3c2pmb21DZG4rb2ZxT1BWUUY2VTNtMzhi?=
 =?utf-8?B?NG54NDVISlFkRjQ0eDMzTlNLUVhuZWxDY3dLcmRVWi80bGZCQ0hwR0VmTzV6?=
 =?utf-8?B?MmZPV29tUDEzVjFWV0xRbFVkQ1o3U1RsNHVUcjBmZHlReVluWnA5ajJRazQr?=
 =?utf-8?Q?tTwqbTmV+nysIzOXy4lvYXo4ovTEi+W5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5089.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QTRIdWJ2OElTakVsWEdBNFZBOXdYNTRlaHRtZ0Z1NzR3V3NCaGZ3ZWUwTDdj?=
 =?utf-8?B?NmtOWTFvdFRINWZpZTdnYnBJNW1hTFRtcmpnRy9XRjNKdEkxT3JJamdLT0tB?=
 =?utf-8?B?eTFBK2NDTlh1Znpab082Q0xhbGkycyt3Z3hrU3BNWWM5MGRIK0owUDRkKzlQ?=
 =?utf-8?B?WmxzRjRSdDY3SU53ckRVeEJxZk9pZEJWdTBYTUY4V1pkd3hoR21oVlNoZVZO?=
 =?utf-8?B?cG5IRXMrMFNhZkIzUFFmbXlZSWViS2xqTDU5SFR5MFBTdmV2Vk5vNlgvQ0ZF?=
 =?utf-8?B?SzNiQ3RIUEFqTTdPK2toblhTeG9qK0JaTHEvMEovSUNjaDNPYXJBbWtqaHlX?=
 =?utf-8?B?a0xmYWcwa25NOXJZT2llbDF4bEMvblhjeERUNDVzU0JIZ2I4R0k4a1BLTEFk?=
 =?utf-8?B?aGtzQk5vcE5GWEhQM2ViTUg5MWhsa1F1TUlyWnk0V1V1bXVKZ1I5b045dG02?=
 =?utf-8?B?VDN3dXE5WVlNaitlRTVsWmJkcDVDbk5TQ3NsK0RqL3pSZ01HWmhTME9ySmRn?=
 =?utf-8?B?ZzEvTXpyVitPd3hXMUk0VGRucytVR3ZEQ1ZkZHhKRUdkaTd3RDNxSjQ0N2JD?=
 =?utf-8?B?UkltNUx1MStBanVaOGJFYTFrdzM2N0dGZ01mNlJ1ZXZCMTFVb0ZOLzJCWjFa?=
 =?utf-8?B?R0d5MGRhREx3Z3lTRnFDUHc2amQwTHZ2bmxOSDZRaHdjSEw5KzNiMWJXMERX?=
 =?utf-8?B?VVRrUm1YR3hYZHRRVkFTWUFlRUpnTUhKSmZXUTZnV2FkaFpxYWNyKzNUb29B?=
 =?utf-8?B?aXUzQnlmS3hWd01BdkxneXFRUUREcFQwcEZuek1wN2R5dXcrVzd2Z2QzTXl0?=
 =?utf-8?B?SUh2WGE1MVRmMWMwUThBL2xEL1hzaWttbjZRYU8xcUJtQ1ZmNGY0ZGVVQTNC?=
 =?utf-8?B?Y2wrWXFQL1VEWW5BdWlVdU93ZEsxTEdVbHlybktQS3RJUGVVRjhsdXVTUjEy?=
 =?utf-8?B?UHFGR0J0Q1piYTFYOUpHWm1meWw5UDFWRjhyanBJUXJ1WGFGeFNlY0R3UzJK?=
 =?utf-8?B?NjV5TEJ3WVkwZ3J0Q3Joa285L05MbWZST0NrOGZCZS95cnFQQmVMaDFUMVlK?=
 =?utf-8?B?bVU4czBwYWJ5QUpVNjJmZWlNRk1lZ1dBVk9YMjhNTzd2WlF3S1hGa0NPSHlI?=
 =?utf-8?B?R1FuN1NmN2hoL3NkK3pBNng3ajhyZWlRcm9oUi91YXNzVGNlQnYwcnRwZEFR?=
 =?utf-8?B?MHRySU9GQ2ZDMTVqL0JDZDZNdmR5WlZ6WVFKVXNxUFcvV2hTaVJpbmN4NHZT?=
 =?utf-8?B?M29ndnd6RktZM1UwRzMvT0NSWmNMTGl5L0dxUDlkRncxRmNXa2NuOVE4a2J0?=
 =?utf-8?B?WDFUOHJKa3JpakdXaXh1NWo5QmgzdDdDdTZPZHVudmVUZE9nRFMwc2hlZlFH?=
 =?utf-8?B?dXFvNGkrQkxwMzYvWHl6L25MUzA1WWh2bVA0UHlZYXE1cDR3aGkvNVIvTXNq?=
 =?utf-8?B?RnNDdGNEZlNFZUNta3RiVmQySTErNkM1SHNUaXlEUXYyZzVzak9MTVBGWDRW?=
 =?utf-8?B?bXFmQnp6NHlmSkNibDcrYlhYQUExY013eTYybEl1Z2JZODNZWnVoUEQ1Ni8y?=
 =?utf-8?B?QVBVR1VXSnVaOExQVjhoRDBXdHdXNEdSNWRrMCtoenFab0JYalNmSytDdlRG?=
 =?utf-8?B?MHJIZGcveW5HV1YvdFJwQ2RScWZEM0VMR1NBTEhrdDhETld0UWN4OXAxYXVo?=
 =?utf-8?B?QTZWbmRWSWtMSml3Y3JqZXEvZGdZQWtsZHNJNlJsNEZCZHFqeCt2TmswTWdY?=
 =?utf-8?B?SkEyUTdGcGV1RVN5NXBmeS9ZVlROVFF0YmZrN0Q3S1E2YzNBaGFXT29BQlhx?=
 =?utf-8?B?RFYyYSt3VVZ0MHZnMEx3RjR2T21ZUFBReHhuaDByaFdkNmFtSURCejd0N0ZJ?=
 =?utf-8?B?SmVzZzZEREhnajIzVU42RjlycU9Eb0NFVmliWGV0TjRwZmxDSlBWS3hxdG4z?=
 =?utf-8?B?MW5tQVlEMVZVSkFyS1RjbFcyZWhkVzF0a3VydkVGcHBzeWNjY1Q3UXRNZmcz?=
 =?utf-8?B?WE41M2lGVlc5NUtweU1LT0JhUnpkSDYrTnhlWnNNaGpROUFkMEZLWDV3SG01?=
 =?utf-8?B?R0VqeGJkSjBUcXJJZHlXbmU1bVNIY1RTdDRVaWFkTlpjZXh4ek1xemZ6bmJx?=
 =?utf-8?B?WUtJVXFBbkJ4VHFXZzBhTm9GRzgrOGVvUmlhRFZ6NmsyWFBrdE1EUzc3Z3N3?=
 =?utf-8?B?Q3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ed21511-7635-4893-3248-08de07663a34
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5089.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 19:01:18.0227
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QXeLHq1cne9cAc9/KpLbec/dPrTzGkL/sdYWgjWKsoqlDc3L0PXoKNQlgdmMOcpvYZVjrtULf2jP7Mtxhw041TVBJet/2sHswPmtfYMKFBA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV4PR11MB9514
X-OriginatorOrg: intel.com

--------------I4HkgrH7bFXjATQ7EE32mhrZ
Content-Type: multipart/mixed; boundary="------------Bua8ZRlqm6bQTnRRkDuZHdYO";
 protected-headers="v1"
From: Jacob Keller <jacob.e.keller@intel.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "Kernel.org Tools" <tools@kernel.org>
Message-ID: <e168bdd1-90b1-481f-bac8-505c37c4a0ef@intel.com>
Subject: Re: [PATCH v3] b4: support send-email aliases
References: <20251009-jk-email-alias-support-v3-1-b90eb4b9c22c@intel.com>
 <20251009-miniature-toucanet-from-lemuria-00179d@lemur>
In-Reply-To: <20251009-miniature-toucanet-from-lemuria-00179d@lemur>

--------------Bua8ZRlqm6bQTnRRkDuZHdYO
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

Great suggestions! I'll include this into a v4 and resubmit soon.

--------------Bua8ZRlqm6bQTnRRkDuZHdYO--

--------------I4HkgrH7bFXjATQ7EE32mhrZ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQQgQFSp1zOQVirsQx5qll0+bw8o6AUCaOgGfAUDAAAAAAAKCRBqll0+bw8o6MFL
AQCiaiWBNYvA+d5ZXs4F0X4qmurrygNLKnZ/ufYMQiGFxQD7BnmghbJTWH69yIIukUwYhVJ5p8wC
Ns1B3LOY9/K9lQg=
=osUw
-----END PGP SIGNATURE-----

--------------I4HkgrH7bFXjATQ7EE32mhrZ--
