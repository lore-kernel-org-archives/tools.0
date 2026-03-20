Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8414A33F361
	for <tools@linux.kernel.org>; Fri, 20 Mar 2026 21:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=10.30.226.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774041073; cv=fail; b=R3aDwfeoHR2d6Zsgyj3vGJW2erYAE/lzuH9XlijYytl085YOW3jHNBxZ5jpOrpvxGZcoPnbm9jhj2SZopnUFMSydFWrYPg+beiz87t2+H3RwF6QJ5WG/0sDenMhYSYEFluQfYke+ExpU2PL4t/P2KT9F3gr1lJrNj27Fo+pulHg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774041073; c=relaxed/simple;
	bh=eV4YKXSX3+aPV4ZnkUHYwGXPKwJErgNv/MEBD8IF/1g=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=d6ax8cONQMbTaeyKbU99g5ucK+NuQo10XxPKLUxlhT3lcAgUQ2Ia+7RGkN4dSHmFuZyDkfXM/mXK4U2oDL8RVq2rHlMVAc8iNcbdDfmxqMDzLreJLZC0iesEPqn0KL2jMY9y6J+aHI3mThIFm5I77lHoXudPtbVz3DdYCkn9TBc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e36ZPBR+; arc=fail smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e36ZPBR+"
Received: by smtp.kernel.org (Postfix)
	id 35387C2BC9E; Fri, 20 Mar 2026 21:11:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 831E3C2BC87;
	Fri, 20 Mar 2026 21:11:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 831E3C2BC87
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774041072; x=1805577072;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=eV4YKXSX3+aPV4ZnkUHYwGXPKwJErgNv/MEBD8IF/1g=;
  b=e36ZPBR+NJ2KmNrAsA07WA0PhpJ3TtHsAcambw023pxTw1IJJYS9xVmn
   GZ3WPStMo8sMtBy4LoRUlIaCvQywuqLAeFnJPRYVvD7eYa7AirAzxl5Op
   9637NzJvToXzJ3FC6FV6E56B5vQjfGBwX56LHmCb+s3ZvH2O5uA5T6FTF
   2r/pkxiGiykZm70eAKwntQSHRi7LOo0TjIn6M0a9dw6eBI2lge8PegDsm
   p3djt3CQvIkpyW8I/7r4MOhBSDFavllxd82VXuRjd8b0hXKOjp31ueydL
   PNGORtEGlyhrvRQhjH92efCq/EzgHSIsc3U1pN/x6AP9AoWkb07Mb6bK3
   w==;
X-CSE-ConnectionGUID: fOCtwBEAS2OGW+4gZLuExQ==
X-CSE-MsgGUID: gQxsTcANRvONH5JEa0Uu1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="74314028"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="74314028"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 14:11:11 -0700
X-CSE-ConnectionGUID: ZluHN1QlSCG2+FSv+KGs0g==
X-CSE-MsgGUID: O0eL8mkVSkuzvItqgz01Uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="219155801"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 14:11:11 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 20 Mar 2026 14:11:10 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 20 Mar 2026 14:11:10 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.5) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 20 Mar 2026 14:11:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mBhaQE53nk8Gy031FTyuwLLnrI/kncqk7QRHCJOH5vLflRCzxYHvbO58y8Sohu5z5XETAeFUKiSx14dXHwIV8iDyYIPqvFkIFBoerImfMM0X+Gyih8FbY91kyJvO1Tld+xIE485CF15EUthtMMnAhQUzoDa6VNHT7Q8s10OTmvC4Pnw0TCZSjinQaD3Z7h+XC6yyxQwSG++nVW/8iFaVGF1ELwaQ3Mzj+n46TN4MgFsHE6zTNC6c798AqY+bcLvRtaEMQ6jUCo9jg6YXAwZfbYj+P+NrZwEVwjm2jwLDyRvaPIhlvhKq2AV8HoFpzdYZgLHAB0sAJKD0aqDuLPHAGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eV4YKXSX3+aPV4ZnkUHYwGXPKwJErgNv/MEBD8IF/1g=;
 b=Qni59OETEo5Be5wEB6vq2zS1RZP1xqHgXSWfWSjq5hw4krQB+6/9yh0UgNXUEU8+b65Bvjk3x6l0zQiJj7jWTYFjzT6wgjL5voJFrD+/9u2R3sqRhP2HFgLwRtbMEdNDGtsVmYrAloU1ZvWGxgzocd+Or07czZeO5b89o+1hjvPU9aFFxX12BFJBjkEUbJcgQpuH1jzt9zSrzpW0klc23nFgBAeu1QE307izQ6ewEFo+Ce+CRWIFX7W6Kx/MbvL8ZDWHXj6hSC52u/E3653D/wc3ir20Q/VLTGlPWPIZuSRgVzfgoPPQFlaqVCgD8uf4UNrGfS546BTNPC/12b9vNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by CY5PR11MB6463.namprd11.prod.outlook.com (2603:10b6:930:31::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Fri, 20 Mar
 2026 21:11:00 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6%7]) with mapi id 15.20.9745.007; Fri, 20 Mar 2026
 21:11:00 +0000
From: "Luck, Tony" <tony.luck@intel.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, "users@kernel.org"
	<users@kernel.org>, "tools@kernel.org" <tools@kernel.org>
Subject: RE: b4 v0.15.0 released
Thread-Topic: b4 v0.15.0 released
Thread-Index: AQHcuKrKtx3ZyFXtjESSXvxcbs/eH7W36hkA
Date: Fri, 20 Mar 2026 21:11:00 +0000
Message-ID: <SJ1PR11MB6083FFF6D6C12C7D487A52AEFC4CA@SJ1PR11MB6083.namprd11.prod.outlook.com>
References: <20260320-portable-jaybird-of-focus-41fd66@lemur>
In-Reply-To: <20260320-portable-jaybird-of-focus-41fd66@lemur>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6083:EE_|CY5PR11MB6463:EE_
x-ms-office365-filtering-correlation-id: 34127a8a-9ae1-4bd5-e6b6-08de86c53010
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|56012099003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: YuzV0DPhbN1/YT5BebrdL0lbgCget8oz0YUd4DrMRjMmLi/Xi9hYpEk3PHZSOVuxLlUHxuc5djN0JL9+RX1yB4JCtOjH1SsKh/rdjXi4o8mBRPcfe6UduDxTmZOPVe3PXNawggXlOqwrkOkEdka5qDkcX+wJoF3GrrmMNp3gLR/hQwPED8O2+duLeLcjg1PoEI8jTvDMh3XiD13I45+/EUGQp2qPKk4nnlMmNt3ycT2bFMdENrwVKwbRBIAtaDRGyu935MPtQYNzj4soe3dkGAtswD9MpVsxPwXE3jhSyE5SIZCAqDHrZiFg/aD5eJFfZ59aHzOjMIhGUbHoo8/Ux+9HGrZmzIn1PR32pimTuk2dXAvuv5gkN8zrHWni58H0Nho9vqdsiobAb1aGk6ry/rtn5oCXK+qOEd6GmMDBx6eUfMF4BuPALW4HSQriNk7pPlA1huAfsZkicm4TWVIbKHr+DX0bLpjuu/VEY5VvVqEQ73JkhWsYmacG5FOXia1lRqOMPrH5+EPNmBKd6Vh0axr09ZrdjigXB/FroQsWkNTooctPXiXoPFNJWCfgq7Lc18VeR1YwBHjemxHWDWtkAsq8rHLmamBcsnl289sD1IswU5bWhbQL56vo7BMrELV77d4qWs1mhqDE8q+z3ElBy3ffXYub64MAFh8PJTXkCUKlPY0REhv83q9IuCzyXl7Wy6i2ORcDcfE3AwfoURCVw1/4sBI5CQ4J4raegqEgULSqEPZ5e1F1xDAcxl+RnYWKOvLrh/w70PA85D6hN7duHJjB/Q1xgMEz8AT2IaOGqfg=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZmlIMFY3S3Z5TG5ma2tNN3ZCTWl4SHVzZWFuSjBjZitqcU5KSnFUYkVqT3Nm?=
 =?utf-8?B?bDhWOXRJa3ZiNUU3ZWhVeUdPQmlSSDNBc3JpS0hLLzdwZy96bWorQzllRzJh?=
 =?utf-8?B?K1R1akZya2Y4SHk3QXdhLzUzYnh6VXI4TWgxYXdjWUxKekF4VmhoWHNHbW9o?=
 =?utf-8?B?dzJKTDFrVFZKOVEvcm5sbFFteVFhU0h2M2d3bVFYUmRVWlFWbStieEl6Wjhs?=
 =?utf-8?B?MzdJaHNTejZFUmQzdi8yeDdwVXgrb3NmZW1GZEZ4NWYwMklBM0ZJb0x0RG9z?=
 =?utf-8?B?MWorRlEvTkRWU3Y3UTVnNkhhQk9qRWtyVzh5bEU2cDF6UHpxQ0hqdFV3Y1BE?=
 =?utf-8?B?WW54R3Q2aW1ETTZvd2sySjVsZWsvRTlmeU15bDJDdDZ1d242ZUNqejBaeFVa?=
 =?utf-8?B?SXhhL1dZNTF5eHJ0VTJ3WnMzbTVGWk0vRnN3aC9tNVhCei9mKzRaZjdIajRl?=
 =?utf-8?B?NXo5UE81dElzYzgzNnRualZTb1hHdnhncmtGakFLOVJJcmQzRi83R3RNZStr?=
 =?utf-8?B?S0xrR2VFVFJGRlI1KzlYZmJjT2FMK1dlL0FJRkJodjBNV2hqVklLMk1oWjJV?=
 =?utf-8?B?N3hpVllVWnRXTkxFMUVGcy9ERHhQZThCUEFDMHBjL041L01qWkI2VXJYYTRt?=
 =?utf-8?B?VjYxSFBZQ04xUkxvNEE1VEFUSzc5WUlHS3hrY2dRUjZuK3ZxWnREejhjV0ZM?=
 =?utf-8?B?a0JUSmN5andCOUlGUzZYWnBLT2pSNVlUZFNlajUwVUJoK2YrendtOGFaZUJi?=
 =?utf-8?B?V0RTOFRiNldRVmdyZWVXcm5kU2E0ZzVtOE9ORGF0U3hNemZjdzI4YXN6QjBY?=
 =?utf-8?B?ZW8wdkI2TDMySTQ5UkFoK0lUTUxjQVVnSUhuRnVWWFhsd0QzL2M2UkxSd05r?=
 =?utf-8?B?UjFZaTUzYVFMUWdkRVQ1T1dZS3BrQVpEL3J1MGl6SkNsUUlWajZGYmExWWgv?=
 =?utf-8?B?S2ljRmNzbkU0dlluL2JMakRGT0dVM1UvaVRRaHdjSEszZnFadkNocGNxZUp4?=
 =?utf-8?B?aVNTK2NLSHd3b21nM0d2L2RUaE0xZC81VXIwZXZZZzliMW0wRzZySytKSUxM?=
 =?utf-8?B?MGFSZkIxbzkzbmIzVXdPZEtuTElBbys2bzdlc2pEYjhIUVJnN1hTS0VoRFBP?=
 =?utf-8?B?dC9vUHFRTDBkWEpJV0VMNjhjcTJjNjJONlBrd05XTkxGR0d4aXVGTXcrWmcz?=
 =?utf-8?B?cU5ueElod3laK1BVQ3h3ajdWQjZ3cEZBUURPQzMxVlU4aWRWRWEra1pxdWdn?=
 =?utf-8?B?K2NxSFh6Ui96bXFFRzBQL1NwVG9yVjd5bndjYWNOQmJXR2VlNjFVM2puQ2dk?=
 =?utf-8?B?bUVGY3FDMHRna08zQTM5dTdEVnVsUEE4L003anY3V0lLbENBTE9qNGNHZW5T?=
 =?utf-8?B?NzVFa29aSnJBY05LamozQ0hoMTROSGgrNGRXZUFQWHRIVnNoTDVnMkVnNzc4?=
 =?utf-8?B?aWV3c3RLVENJVGtXd3NWc2NtallKMmYvK0lqbG9vbnJDbzNyWC9hMFFLZVdJ?=
 =?utf-8?B?Zm1kVEpBNE5mY3d1Wkw1WmRWa1FleXcvZ3hlYTdKaEhtemRJZ0hxL2o1MU9S?=
 =?utf-8?B?ZmZWNEJpU200Zzl0VkhPUjZqVUVsUXpCdVU3czhvK3VKSll0NlVvTEdabTBo?=
 =?utf-8?B?K2VrY0VNTk5DWmdURTdjT3dNZGpIWW1FazhGaFNvQnAxOXlpTTZJeXplSGdl?=
 =?utf-8?B?M1lrNVM0R2dWZjE0V0xZNERUOXN4L2R5Q3p3dlpYN3lGQ0M3SFpsam51OVU0?=
 =?utf-8?B?L2tYSUdNL0lBZUhuZHg3ZmtoSlhpL2lpR1lTaDRtL1dsOXdkb3RBcHN6K2sy?=
 =?utf-8?B?MXhPZnJDOVpTa2pGMUZidndYeVRkeG9teVc2eGhOM1ZMTWFOS0ZJSFRPVkZx?=
 =?utf-8?B?UHNubDFwcmx0N0xCcVNsR2hVM3pzL1dOQmwvdDVFZ2QrSE1VNW4rWlkxNG43?=
 =?utf-8?B?Z1FFWDZGdVdiRjYxb1pMbmJDMnFWNUMxa29IS2VNMGRmMUFBU2wvRUk1L0Jr?=
 =?utf-8?B?Q3I4RG56YzhaczlwaWcwQzI3TlJjVksraUR5R0MvZkl6TFoxOEplYzNwdkpz?=
 =?utf-8?B?ZXhrVTNhbDZoOVZtSTI4SEg4ODB1VnRUUWRmQTUzR2VnVTZNS0RZSUQvUVBr?=
 =?utf-8?B?TDVieVVYdE1PWGtDODNQRDYxMDlUWkhpck1OT1FtQ3B3ZVVMazV0UGtMTXAr?=
 =?utf-8?B?Ukh4Z3V2dk93Wm9PclVOaVZ3YXpxd1daVzhaWmZ0c052bkp6SzljWjRkYlpx?=
 =?utf-8?B?TEhKMlpWWnJDMGZveHUzZE91ckQvbysxOFZUR2pMejJGQlhkbGN4T0lURFJm?=
 =?utf-8?Q?hX3ttYiB5Bl342nuFn?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: A0+VYzw0FiVibloX+nZFxq2Nj3/L+1Cev1l8n+0hdaMotZkzLSj+V5yYMvZi36sChze3FYg3D/DxAs2EUIe2Z6QnRNWha0cbSQcSt1jxT5ZO7cV8ZCrQ5E388R3u569QN/lCC4cnIRDEnCHIEV9DdYDl39xG5jvo7B2kQ2e4JAGZJyKPRhmxrCK9T68SuQs5Zl7mwMh1aSlVQ+dWzlkkvnrg1i6A8JlGoou0bPv0RjiJU91aMNfCaOfv+Ex8podV0gsbgjLGzJUuQxTnLtmb1vFnZ8HBlGLD2adTwajogaNsv/74s/d685JjQMYqBzfv1AEIFFiCp0pTu9rC0DGXkw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6083.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34127a8a-9ae1-4bd5-e6b6-08de86c53010
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Mar 2026 21:11:00.5680
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gy1ytRQyJeb7Zw6U9wrsN94mSD/mUOwRawwtQONN6d4c5A3rGFgRwvQICu+3MrtCiU56z2mE60NOdP5jdL83Wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6463
X-OriginatorOrg: intel.com

PiAjIGI0IGRpZyDigJQgdHJhY2UgYXBwbGllZCBjb21taXRzIGJhY2sgdG8gbWFpbGluZyBsaXN0
IHN1Ym1pc3Npb25zDQo+DQo+IFRoZSBuZXcgImI0IGRpZyIgY29tbWFuZCBzZWFyY2hlcyBmb3Ig
dGhlIG9yaWdpbmFsIG1haWxpbmcgbGlzdA0KPiBzdWJtaXNzaW9uIG9mIGEgY29tbWl0IHRoYXQg
aGFzIGFscmVhZHkgYmVlbiBhcHBsaWVkIHRvIGEgZ2l0IHRyZWUuIEl0DQo+IG1hdGNoZXMgYnkg
cGF0Y2gtaWQsIGF1dGhvciwgYW5kIHN1YmplY3QgdG8gbG9jYXRlIHRoZSBvcmlnaW5hbCB0aHJl
YWQNCj4gb24gbG9yZS5rZXJuZWwub3JnLg0KPg0KPiAgICAgYjQgZGlnIDxjb21taXRpc2g+DQo+
ICAgICBiNCBkaWcgLS1hbGwtc2VyaWVzIEhFQUR+MjAuLkhFQUQNCj4gICAgIGI0IGRpZyAtLXdo
byAtLXNhdmUtbWJveCA8Y29tbWl0aXNoPg0KDQpOb3Qgd29ya2luZyBmb3IgbWUuIFRyaWVkIG9u
IGEgcmFuZG9tIGNvbW1pdCAodGhhdCBoYXMgYSBMaW5rOiB0YWcsIHNvIHNob3VsZA0KYmUgYW4g
ZWFzeSBjYXNlKToNCg0KJCBiNCAtLXZlcnNpb24NCjAuMTUuMA0KJCBiNCBkaWcgOTM5NWIxYmIx
ZjE0DQp1c2FnZTogYjQgWy1oXSBbLS12ZXJzaW9uXSBbLWRdIFstcV0gWy1uXSBbLS1vZmZsaW5l
LW1vZGVdIFstLW5vLXN0ZGluXSBbLWMgTkFNRT1WQUxVRV0NCiAgICAgICAgICB7bWJveCxhbSxz
aGF6YW0scmV2aWV3LHByLHR5LGRpZmYsa3IscHJlcCx0cmFpbGVycyxzZW5kLGRpZ30gLi4uDQpi
NDogZXJyb3I6IHVucmVjb2duaXplZCBhcmd1bWVudHM6IDkzOTViMWJiMWYxNA0KDQotVG9ueQ0K
