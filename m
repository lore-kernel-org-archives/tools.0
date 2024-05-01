Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B90D52F
	for <tools@linux.kernel.org>; Wed,  1 May 2024 22:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=10.30.226.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714602228; cv=fail; b=d2o5R+CsxLJOsZ7yf5ANoyTR1KnLzrw9lQL9Mjg7tI5wh4yvHTsk9zY0ph6MvKtdn/U+MgiWNmcV+PNOFHb3PFsl0tiqSsQMVuiCGNgvFa0tUU5ZdNmjAqpZt8LdVAfBtYFfYPdgWmKW2E8/8/JGUQ2kJXUyRGrD2wJQfwxn41g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714602228; c=relaxed/simple;
	bh=WKIilmBWY4mh8wJ4x35fcNL9KFZ69aUfTrSEBEUMOn4=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=ZhoOMnze7e8ARHhyer6t+cs4YcruNC7rWKPAtVtLoQeupl5imnIxgRDAQJQ5/XiU1Nd+vcQ+vTt1G53JpS/+cl7+ad/ltdXSIEUWUFEcNz4gb5MByBQgemNOQr57S3LVH10YYWZ5Ug3u1dbyhl78LSbvpHA6zfkUpj+1PDfuGyU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VlE7j2yi; arc=fail smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VlE7j2yi"
Received: by smtp.kernel.org (Postfix)
	id CD0EBC4AF14; Wed,  1 May 2024 22:23:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 38857C072AA
	for <tools@kernel.org>; Wed,  1 May 2024 22:23:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 38857C072AA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714602226; x=1746138226;
  h=from:to:cc:subject:date:message-id:content-id:
   content-transfer-encoding:mime-version;
  bh=WKIilmBWY4mh8wJ4x35fcNL9KFZ69aUfTrSEBEUMOn4=;
  b=VlE7j2yiNRecelLY1Qgb9CpuuzTADEEnL0X+6HACR+phOy8I4geCenGY
   sGtj+xV3wRL3W0fRVYsgq+r4z8Lj10b18A7l3c2rxs1DJgm4V/CQ9OkCu
   F2zbOFoAOEhNPhg5wbeaVYcDrSdLpBoxItv9NQx971ei64Zzn2zAZdRJv
   cAIZZiXFa1vMXk1Ksxqs4XHlryjjuj46n2jeosubxnUpKytC2/sY/AuwQ
   GbMDt1lmMc6y0QlLAIA/n6McW/vQ9dFVn62bE7PHQ1US54mD7aF14WPE7
   vYZA9SCwYCK3RXeugfyetZE9K5BKplkS7OFo47/KFXSqk8/XKokltJjun
   Q==;
X-CSE-ConnectionGUID: a3mzpnJcQ26ySxT5sY3mZA==
X-CSE-MsgGUID: YCZonTmmS4C4n2yWgWtLhg==
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="10229786"
X-IronPort-AV: E=Sophos;i="6.07,246,1708416000"; 
   d="scan'208";a="10229786"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2024 15:23:45 -0700
X-CSE-ConnectionGUID: kGaXK9ZoT5aJ/obvvP55ng==
X-CSE-MsgGUID: 9/3USookSDKOvnPpHb0K4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,246,1708416000"; 
   d="scan'208";a="27327954"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 01 May 2024 15:23:45 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 1 May 2024 15:23:44 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 1 May 2024 15:23:44 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 1 May 2024 15:23:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N5ITfzGApQMOBxxwVP87MqWyIgPuMSwLGleQn+XOQ/mZ40EzIpjWMnp4Be3mwSlK4F8S6YZRHSYzyf5RYL6PFFSBGtsaJLGezGrrqGSIRdqtrr75v2i8M1HuASuOIlxsFmu3nB+VgLF129VkHfxqH46wR9HV97Zfdw9AQ/yuQIUNIbTk7p0DvsZ+VF2xo7an7HTN7Kgyj2ur/TQDzKYmH7dXAuTXyJmcRML1Cw4VjsxPKE1UOBHIOtzO2O1lUVOEqX/aoR5FZgNNiEpRQOhn4LBiTAHmfYRfIOL/JqyFdcPo1H6RL9xf2CdqeqXEzJjpVvwt1ZmtPvWI3MQxgZjzsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WKIilmBWY4mh8wJ4x35fcNL9KFZ69aUfTrSEBEUMOn4=;
 b=Yoi9Q0s8hur4wK901fXr/u+WLE8OK5QHgSmi8Mu/ibf9GKv+yi6S+JckolJI914+X1P0OEReWbX5SJfYzltZfu924Sd428nzXpcOdgmwZ7dZaI9wjzzgcFIiKsQbobbHbaw4xQPiICzSWIyn2vWV59mZRFI1jBGSc9bwigcOM+4cpwVLxfws2Et/4cskIGR7xaztv3/vq6sXFmU56fBYPAFlI1p2xggMRtWLhpv1lri2JLKt9l7qjs0mUWfuA+fim9PUj3tHlTt0x94oI8MtQtSOtga+Y9HLtddjbna8e/GP30BVcRfpIzrdNhLmMIk2wWtH1M6ss6dTpvjo9x6UUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7125.namprd11.prod.outlook.com (2603:10b6:303:219::12)
 by MW5PR11MB5812.namprd11.prod.outlook.com (2603:10b6:303:193::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Wed, 1 May
 2024 22:23:42 +0000
Received: from MW4PR11MB7125.namprd11.prod.outlook.com
 ([fe80::ed72:f69c:be80:b034]) by MW4PR11MB7125.namprd11.prod.outlook.com
 ([fe80::ed72:f69c:be80:b034%4]) with mapi id 15.20.7519.031; Wed, 1 May 2024
 22:23:42 +0000
From: "Verma, Vishal L" <vishal.l.verma@intel.com>
To: "konstantin@linuxfoundation.org" <konstantin@linuxfoundation.org>
CC: "tools@kernel.org" <tools@kernel.org>, "Accardi, Kristen C"
	<kristen.c.accardi@intel.com>
Subject: b4 unable to find a previous version of a series
Thread-Topic: b4 unable to find a previous version of a series
Thread-Index: AQHanBY4FxntFUUCgk+3gXxszyJDnw==
Date: Wed, 1 May 2024 22:23:41 +0000
Message-ID: <ec51e00311e45ae6ad7363e10c8a61355b6b7cd8.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.50.4 (3.50.4-1.fc39) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7125:EE_|MW5PR11MB5812:EE_
x-ms-office365-filtering-correlation-id: ff2f496c-0b29-40b0-5592-08dc6a2d5b70
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?bWhrRW5ET2Q3ckpvbmpYci83T0JsMXJXcUViR2k5aC85WnFLNkhkYy9vMzNR?=
 =?utf-8?B?bkQ0d1lORHJmQjExdS9TM3Y4anl1MW5CY3lqQ1YrZ1Y1NHhBUGpNM2dOekVK?=
 =?utf-8?B?WDJGR3hEU0pvYzRNRkJXcGtieHBnN0pIdGdYSWY1QmVBN09yb3Z2WUtSVC82?=
 =?utf-8?B?Rk5hcTNOQnVqaW1zNUdBRWV2bzlJdTlnbk9HUU43eUlBdEd0ay96aVMrWkZ6?=
 =?utf-8?B?ZVZRQ0Q1Q3FKQS9SMkNiTVlaS0RMcDl0TFNuVUZwcnV2bFcxaXo2RTk4TlJE?=
 =?utf-8?B?OFczZGRyak5aMEdCT0pTcmliNXU2LzhuWHpCR0pHaG5LTFBjeUIrU2Q0YSt4?=
 =?utf-8?B?YmM5RnVQZUUzUVczS3g2V1N4aVVIcGZEWlBwbmFiL3dwekFzN1RHbW9pTy9D?=
 =?utf-8?B?R0loSFlRSjBUOXlGVi8zaTF3SmtLN0orNWYxa3JOMnJPcmNmR0dMa0Jpbm5W?=
 =?utf-8?B?dEx6NzBUWENESzNoMXBVSVFOaTE1Zlo2T2dsU3VadUIzN0NCekFPUGR3K3Zt?=
 =?utf-8?B?c1B6SDlMbnVnWTFlRzlKVzhGYzZuNVllZGpMemhKbm5SbE0yc0w5SnNJWEZt?=
 =?utf-8?B?QVFZQ2FVMjFmUytTT2Q3SVMvUUdlazJ1ZVVtbW5BMDlFby94ek9xQXIwMUt4?=
 =?utf-8?B?SWtHRGlld3J3SVlTaFFvOUpiVm5PcTFDdnljRVFiZTI4b1drYWFsa2JzVVMw?=
 =?utf-8?B?MlhzSm9MVWVGdUwxcmRGWmpzMmJSeTFvNXBPMjltSlp3N204SndwbER2OHVF?=
 =?utf-8?B?QjFzVHFmUVBpOVBxcC8yNVRHSTF1Szd3bUpRYysrT3k1b0dLKzE5UkdRTU1n?=
 =?utf-8?B?YzBSN3ZhQTU5d3ZacXZSQ0EvSVdtQmpabXM2cVN3L2RtczczMkNkM0VsMytG?=
 =?utf-8?B?RHR1aFUxaGsxWG92aDlTeFU1cjRGa3hlQVpkV1Rra3NiNXJKVFFMS09lY0p2?=
 =?utf-8?B?dGFBYWY5bHQ4VERYRGY3WTYzeUJ6NnNrZEcrVC9Db2VzQ1FUcU1BTTI4bkEv?=
 =?utf-8?B?eXN1VjBWNXVTWEw5UWk5UlFFbHJxSnNMSkdpQWtsSlYxQzJsS2hUbW8vK0ZV?=
 =?utf-8?B?N1JzT2pjSUhLVFY0dk81RFIvUkVhbnI4VWwrZ2J2WENEZFA0N2llUGZjak9o?=
 =?utf-8?B?bExqZThHY1g1TlFuWm1ibUtDNUljK3pVQVo0QTd3d1p3RllYZjBaTURhODE0?=
 =?utf-8?B?K0tpZ0ZtZEF2UzNSQkc0anlycEttaEU0M2R2UFRGZ3BEQUplYzVxVHJkcW5Y?=
 =?utf-8?B?dFRwbFl0T29wbXZmd0srQ05zdVZTSElmRE1LWGE3eEhaMGc2T1ZPcVZOUTVU?=
 =?utf-8?B?czJPUUg4NjV6VW9QUVhObWVLM2k2K2xSeXpSWU9TSm1DSU4xQmY4ajEwZC9L?=
 =?utf-8?B?VUxOb3U0NmxFUWZCbFlycU9ZODRwZ0RlckJhVVF0MnNXTzJWYUxDNEFTeWJ2?=
 =?utf-8?B?MjRFODFwdlYwZjBNRm9ZZmFvQW9hN3RHazNrT1BlSkdxd3o1V0F3MFhGZ2Jv?=
 =?utf-8?B?VDhoRjU2OSswOXUzOXQyeFdvNktjbTN5dThMcGtvR1F0ZUZpeFJvZXQ2Y1Ra?=
 =?utf-8?B?SUxuNjV0L3lPTk1HYzNkSUQ1ODRxYlBjTTRQWnk2c3V5dEhxaWdRUDZVVHNL?=
 =?utf-8?B?SGVQcEdlSkNHdFZOL2dpamtRUnd4bkhVU2JHOGIyU2tyOHZodGhtZEtiS0d5?=
 =?utf-8?B?UDZhd2FSMVIrQ1ZjLzFyWkNadnJIUUtMR2dwTGMyMlRwdHJ3REZHUkZQV1Jz?=
 =?utf-8?Q?iAV/QnRb6A378Sh2CE=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB7125.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WWI0SXloT0VjcTVkMTE2dlZGK3VPcENPM0U1WEhhdVk2QUFJZTZkQUZubUI1?=
 =?utf-8?B?R0V3VEJSYlFTcGxGZmFIWHoxZEdheDhYemJVcUgzQmI2Tk1MKzd1VnlSUGc5?=
 =?utf-8?B?a1NBQ0tLOVJDRXlmeFFaSjRJNm05RTZvcHBGT3VpWkpjdS8vMER1dGszUWJn?=
 =?utf-8?B?OXUxalNRdityR0w5Z0puRlg2QkJHN2V6ZklOYXIzWFRPRFlJblJFRVhLQzZx?=
 =?utf-8?B?Y1FNL2FMc3JiZ0VvZG8rOWV4NjNTWWxLZUZHd2Jidm5lQ3hjdHNmd2VadWxN?=
 =?utf-8?B?L2pTbmV5WjN0WHJDY3ROcCt4TzJNTHdaUitFekRvcXJFY3JSV3NIL2xqdmFy?=
 =?utf-8?B?VFhFdUhJTHdIV3B2V2xaRTVnbnJDRGI5QXRjU2hZa2lOZThScTB5WGJIRXYw?=
 =?utf-8?B?aCt6WjNReENaV2pCalA1dy9WbVhra3NWZVRBL1BiZXdMYzM4T2FoYjZvVTBP?=
 =?utf-8?B?QldPb1o0bm92eTV0YzIwdXBLejdSdGorZ01vOTFoNHlFb0hDMVJTSDl0YmxZ?=
 =?utf-8?B?c2VkTWZVREZEN3l4eGNNdVpyQmU5TXl3TUtrNzlPWU9lS3RWNDJHZytzclpu?=
 =?utf-8?B?NVh6enFQcHgycW5meXFIZjMrUTB5ZWMxMTN3d2t5NEhZeFBWSDF4YkZCVXg3?=
 =?utf-8?B?ell3alg0R29zRGQ5V0dvalI3L2N3N01HVUh3VnJYR2R4SDZkbHNadElnUGRt?=
 =?utf-8?B?QmdsYlRmUFJYNFlJUklvaUhLM2ZHYzk2NVgybkQvNm9nRWVveWlwVE9hTXJB?=
 =?utf-8?B?SUs2Z0JRdk1nRWRaUG4xZWNMclJTcWIvbjNPOHU0Wk5WbUUxZzcxQThpeUJH?=
 =?utf-8?B?eHU2d1cxVzJ1WVVldGlUNmhwTC9Db3VUNUtkbXRVMGJ3aTk3cHZSLzhzR1Ry?=
 =?utf-8?B?UlpBc2tVdDZLTGZKT09vNUg3eHVTclc0dEtZWUhNTTcvWElTa3ZOUW1IbnBu?=
 =?utf-8?B?ZWJySndWeFdjcG5pYjJ0K1hpZjVJbXgxTXREKzQrNndydklsMXhLaEt1dXBX?=
 =?utf-8?B?YmtzUWk5Q2FvM215Z0wwMysrNmRRR2daeDJNeTI3Rml0eHY5MDdrRVk0Vm4y?=
 =?utf-8?B?Vmhhb1FhMUgzNHJnZHpNWWg0clZQeFdncUNCTGQwVzIvT0JFS2VqTXhVZ0Fh?=
 =?utf-8?B?QkF4RHl3SnUzVHg5SmZPRDRhY1lEcWZYOVNtWExWdHYwTjNhSHNWV3krKzR1?=
 =?utf-8?B?dWxlMVNSak5ka1lIS2pBN3RRQzUyMGI0bElOZ2FIWThKay9CanZmTGJiZGNx?=
 =?utf-8?B?UlVZOEpScWVhVTQ5M2FWWTBoSXMzL0JkQ0U4N2dXcmNla2FxYm5ON1JFYkVC?=
 =?utf-8?B?MW1LMkVlU2NnTkRKOVFiNzczMnQ4a3RrZ1dhWDJ2U1RsZEVyMEdhN1ErUm9O?=
 =?utf-8?B?NzFxRHVVMjdRalN1RWYxSVhmR3JhcEgwOXpBeWp2R3dpaVYreTJsbzdTTVd4?=
 =?utf-8?B?OEVjMWxlN0Y3Qjg2UDhmRzltc25uc2FpWW1UQjFVSy81dVZzR3IxMWwvYmJq?=
 =?utf-8?B?NmVydndpZUJBQ09paDB0MWw1eEwvZk5zZEMzbHY4R0drTitzcXdwbnpmbHRS?=
 =?utf-8?B?Ujc4OEo2RDFVWlpNNFkxY2JlYUFIQS92N0hUcjNJcjVXY0t6bllhOW02OFcw?=
 =?utf-8?B?UzFoWEtPc3I0UWlLcEFmS2dFcTlON01YOXE2YjEzZ241akRIRW9hQWZKdlBG?=
 =?utf-8?B?RTF6eGFSaE1qU3J6SFBRQUExV3BRVi9ZeWgxNWs3T0FNbmp6a2FZOStKY09w?=
 =?utf-8?B?YnY0TW1qOTNOcWNJMGVaU3p1QnRSUVFMZWVUNWpWdnM0ZHhyeUtUd2lWZFcw?=
 =?utf-8?B?OU56QzdaNjRYUGs2NHJORFplay9VSUVQWUY0Tm40alFYaHVjR2pUTVNqVGJQ?=
 =?utf-8?B?MlhrMWJhQXJJYmRiZDBxTFVtZWdQY0J2eGxqdmMrR1haa2xadW1UZkZOd3p4?=
 =?utf-8?B?RDM3aGVvL3VaN0FwZ1FTM2s3OWlJN0FRbXo2WHZKT0UxWlhYSk5WNW9UZmFQ?=
 =?utf-8?B?YllUUldVMEJxUWpweG9CcU5tYnlCRkEvMTNHSm9VWVFRNVhqR29ZZHVVMnZl?=
 =?utf-8?B?Qm1HU2swWW5zbkR1Zm1PblBTQVBwS2tBamNGUlF2TVFUTWRBOGFuQ1RaWEFm?=
 =?utf-8?B?QkJYdktTZUVEOVczc2dQMzM2TFE0Z3NrU09PdXVrOWhCeUM2TVpwUyt2U0Jp?=
 =?utf-8?B?MEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <77085A78532B94408CA16C541EE771E5@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7125.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff2f496c-0b29-40b0-5592-08dc6a2d5b70
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 May 2024 22:23:41.9775
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3U4195cDHvpuWlG00zhEMt6P704LzH737LPn3zTv6xdolSJtjklUt3eM3XjEM3uhnVQbDUrEbXf5YLgeAA0I2tJzu5xRctsolQIKjWIVIuU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5812
X-OriginatorOrg: intel.com

SGkgS29uc3RhbnRpbiwNCg0KV2UgcmFuIGludG8gc29tZXRoaW5nIG9kZCB3aXRoIHRoaXMgcGF0
Y2hzZXQ6DQoNCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9jb3Zlci4xNzA4OTMzNDk4Lmdp
dC5pc2FrdS55YW1haGF0YUBpbnRlbC5jb20vDQoNCklmIEkgdHJ5IHRvIHVzZSB0aGUgdjE5IGNv
dmVyIHRvIHRyeSBhbmQgZG93bmxvYWQgdjE4LCBpdCBpcyB1bmFibGUgdG8NCmZpbmQgaXQ6DQoN
CiAgICQgYjQgYW0gLUNNIC12MTggY292ZXIuMTcwODkzMzQ5OC5naXQuaXNha3UueWFtYWhhdGFA
aW50ZWwuY29tDQogICBHcmFiYmluZyB0aHJlYWQgZnJvbSBsb3JlLmtlcm5lbC5vcmcvYWxsL2Nv
dmVyLjE3MDg5MzM0OTguZ2l0LmlzYWt1LnlhbWFoYXRhQGludGVsLmNvbS90Lm1ib3guZ3oNCiAg
IEFuYWx5emluZyA2MjUgbWVzc2FnZXMgaW4gdGhlIHRocmVhZA0KICAgVW5hYmxlIHRvIGZpbmQg
cmV2aXNpb24gMTgNCg0KSG93ZXZlciwgcHJvdmlkaW5nIGl0IHRoZSBtc2dpZCBmb3IgdjE4LCBh
bmQgYXNraW5nIGl0IHRvIGNoZWNrIGZvcg0KbmV3ZXIgdmVyc2lvbnMgKC1jKSBkb2VzIGZpbmQg
djE5Og0KDQogICAkIGI0IGFtIC1jIGNvdmVyLjE3MDU5NjU2MzQuZ2l0LmlzYWt1LnlhbWFoYXRh
QGludGVsLmNvbQ0KICAgR3JhYmJpbmcgdGhyZWFkIGZyb20gbG9yZS5rZXJuZWwub3JnL2FsbC9j
b3Zlci4xNzA1OTY1NjM0LmdpdC5pc2FrdS55YW1haGF0YUBpbnRlbC5jb20vdC5tYm94Lmd6DQog
ICBDaGVja2luZyBmb3IgbmV3ZXIgcmV2aXNpb25zDQogICBHcmFiYmluZyBzZWFyY2ggcmVzdWx0
cyBmcm9tIGxvcmUua2VybmVsLm9yZw0KICAgICBBZGRlZCBmcm9tIHYxOTogMTMxIHBhdGNoZXMN
CiAgIEFuYWx5emluZyA4MzcgbWVzc2FnZXMgaW4gdGhlIHRocmVhZA0KICAgTG9va2luZyBmb3Ig
YWRkaXRpb25hbCBjb2RlLXJldmlldyB0cmFpbGVycyBvbiBsb3JlLmtlcm5lbC5vcmcNCiAgIFNl
cnZlciByZXR1cm5lZCBhbiBlcnJvcjogNDE0DQogICBXaWxsIHVzZSB0aGUgbGF0ZXN0IHJldmlz
aW9uOiB2MTkNCiAgIFlvdSBjYW4gcGljayBvdGhlciByZXZpc2lvbnMgdXNpbmcgdGhlIC12TiBm
bGFnDQogICBDaGVja2luZyBhdHRlc3RhdGlvbiBvbiBhbGwgbWVzc2FnZXMsIG1heSB0YWtlIGEg
bW9tZW50Li4uDQogICAtLS0NCiAgICAg4pyTIFtQQVRDSCB2MTkgMS8xMzBdIHg4Ni92aXJ0L3Rk
eDogUmVuYW1lIF9vZmZzZXQgdG8gX21lbWJlciBmb3IgVERfU1lTSU5GT19NQVAoKSBtYWNybw0K
ICAgICAgICsgUmV2aWV3ZWQtYnk6IEJpbmJpbiBXdSA8YmluYmluLnd1QGxpbnV4LmludGVsLmNv
bT4gKOKckyBES0lNL2ludGVsLmNvbSkNCg0KQW55IHRob3VnaHRzIG9uIHdoYXQgbWlnaHQgYmUg
aGFwcGVuaW5nPyBJIHRob3VnaHQgbWF5YmUgdGhlcmUncyBhDQpjaGFuZ2UgaW4gU3ViamVjdDog
Zm9yIHRoZSBjb3ZlciBsZXR0ZXIgdGhhdCBjb3VsZCBicmVhayB0aGUgbGlua2FnZSwNCmJ1dCB0
aGV5IGxvb2sgdG8gYmUgdGhlIHNhbWUuDQoNClRoYW5rcywNClZpc2hhbA0K
