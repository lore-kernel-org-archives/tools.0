Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9791917ED
	for <tools@linux.kernel.org>; Thu,  9 Oct 2025 22:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=10.30.226.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760050192; cv=fail; b=jcvFALSerE+T8N5cdO20Q3XrGauUsrWLunTYMDLyxxnwSJa68xh7x6ag9aARPQSB0VhZxp8j09G+2its/+AjJ9pgTipRK3A7TqFBmfeEUruIub+EUcUtdSjJcVJLJ39PG3dYex2VFbDdhr8Swtx00EaLBPHgA2IvQsTk1AYEfGY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760050192; c=relaxed/simple;
	bh=ZDO+5i8c2vkzrJ9g6Pr8X65ozmmpvTHot+PIwI8hxSE=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=QGSO3/a0kxYcuBKlkTlZsMTOxR61+SMI07c3CshAk+zy+IUcWWl6Cvftsp77UfgMLzl6C4MhMwWC5AEhMyMwqw/AxmuCMgBZJJK7iLnZQOHuMt2G5E0njzhZuLfimnluY29HFTKCMnr0n0meFI/OCJTEeJh8fR5JB1h5JYCNQcc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=db2yAGSu; arc=fail smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="db2yAGSu"
Received: by smtp.kernel.org (Postfix)
	id 2D617C4CEF8; Thu,  9 Oct 2025 22:49:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 32B93C4CEE7
	for <tools@kernel.org>; Thu,  9 Oct 2025 22:49:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 32B93C4CEE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760050191; x=1791586191;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:mime-version;
  bh=ZDO+5i8c2vkzrJ9g6Pr8X65ozmmpvTHot+PIwI8hxSE=;
  b=db2yAGSua9NucaszIl2JLgmDy/SuHV/Pb0iV/7SeBI10uBo/moPP4JwC
   Tpt4RdbW8c90giNrm0hpUPvTK58/Z3GexTLDdAXo3FtmGwiMkOT1Kaa8j
   f3Iv9uKsHHG9BMo9aTjuJtwFA7ipTn5zTI5duCzsTOAO3o5zv02JTa/QS
   G4CllIatxIW/LiJ29Y4s1EgCZzlgxxNK3FQzPcLFA83z2Ya04C0kEgnwv
   q7G4NryYbLvk5SnbqjAjbGPSI7BlJyQqtsedL+ipC3bHhrMMO02pe6MEV
   oG08OnnJzY4tr3OR3aIHaQavla2ZVQzh+/jzNlMfdR1P/RMvAwDI2KbFN
   A==;
X-CSE-ConnectionGUID: nR/QTs0LSHKPv4H4q5j82w==
X-CSE-MsgGUID: ztyFlw6UT3GVFeChrUvFAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="72952258"
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; 
   d="asc'?scan'208";a="72952258"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 15:49:51 -0700
X-CSE-ConnectionGUID: dNHcnwY1Q0uSLXu9zovU2w==
X-CSE-MsgGUID: itonM6yeSdGCOQgw5LNSIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; 
   d="asc'?scan'208";a="211789919"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 15:49:50 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 15:49:49 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 9 Oct 2025 15:49:49 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.42) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 15:49:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GEl/YjWlIEn2nZfYmCz82IAlafs5vT1iPm65a0/HfWHrAX8GfICLp8SWPB0GvD6T8RR5Z/6v+ooQQ/pmGtYEpdaQtnZa6xITrYcYzlpaotj9gQnV15dwE0GheEM/qdhnpLYE8y3PBNUFLbbrA731JVDZJxDhAQcOeLt1NXfA+ghMiT+1oaeOVuG4zX4XAM3Ns5iut6F30E0HfAQ6K99+KT40mceIwnCnCXJvZWrGghUAqTAwoSwkx34nFfOXDnFkDjsLKuv+g9hL23oMb7uXm0wFS4XB98nSm/uxYDv6+JOpUzWYadJQuLAo24LOsSZUw66Ax18RlLkB/aom8TxbAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+4o5niuW8qKzq0QlXunKGIhe/c/OzRsXoHboaRyPSos=;
 b=Mz1ZlqXE53DQ1o9Mc/4b8rmQEmOAL7QI1OyhfWzIxBdq/GoNoAyU6SvjeC+gN+h+3kUQxZjxJYs7IFwzgOEVD2LLXj7KRDlcBzG4RiAjsQXt6xjQ6RDv7TT9+ZQcamp5rTR8CBR66ziIDUDdS9qmUm5jeaXDfhAcJlKcRUs6vFtUYTPVOvHWUeZ214LU7sOWClIuQ67Krm55nYP/IUH04H8PVUtcqm1K11Ix8W8mgDbsCT3mp+CDYGhWKQZ2Yeft7xMUKmrWsmXK7I40Ajf63xYvom5zwOvy0+VFfXTXG0J93iUt+PWS4+UgVfodZUQ0iF034hxLCINd2Zddqm04Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5089.namprd11.prod.outlook.com (2603:10b6:303:9b::16)
 by BL3PR11MB6409.namprd11.prod.outlook.com (2603:10b6:208:3b8::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Thu, 9 Oct
 2025 22:49:41 +0000
Received: from CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::81f7:c6c0:ca43:11c3]) by CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::81f7:c6c0:ca43:11c3%4]) with mapi id 15.20.9203.009; Thu, 9 Oct 2025
 22:49:41 +0000
Message-ID: <6ac5c872-7b82-4676-824b-9b834ef8c970@intel.com>
Date: Thu, 9 Oct 2025 15:49:40 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] b4: support send-email aliases
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
CC: Kernel.org Tools <tools@kernel.org>
References: <20251009-jk-email-alias-support-v4-1-16f458de996e@intel.com>
 <20251009-voracious-calculating-gecko-adfe48@lemur>
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
In-Reply-To: <20251009-voracious-calculating-gecko-adfe48@lemur>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------USJKYF0tYQoTUJFBOs2MuDYs"
X-ClientProxiedBy: MW4PR03CA0297.namprd03.prod.outlook.com
 (2603:10b6:303:b5::32) To CO1PR11MB5089.namprd11.prod.outlook.com
 (2603:10b6:303:9b::16)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5089:EE_|BL3PR11MB6409:EE_
X-MS-Office365-Filtering-Correlation-Id: 0de4aa0a-e1ae-4ef2-01a7-08de07862203
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M25GV3ZRR2tIL0d2T1BDWkhKUDJoMmsrdkROYmpEY3I3emJLSllhY1k2ZEhj?=
 =?utf-8?B?QmlEZ0dHRXM5YnNXQXVTbVFadDF6NGVRVGs2MFJRdDhTeFpmMjRvOXdvT1dS?=
 =?utf-8?B?N3UzRG9lSEp3RUlQOGpEVVhKZVJMSzQ4NmlTRTliOURmMVdJUXlMeUM0TDls?=
 =?utf-8?B?dy9uYlcyNncyVnVNMUJJcER0bDQ0ME1Bb051b3NxdEczK0dxTDdjeGdqMDFa?=
 =?utf-8?B?M2xOZXp4YS9ZUk9lQnVia1o2UzJ1dmlnTGJLUVhQNFdVQzB3bGp4Y2x1Zmhh?=
 =?utf-8?B?Zm9URk9lN0JNRlhLenpLcUpWbDduL01VeWR3MWsrR3lqUjZNTlozalZHbkRR?=
 =?utf-8?B?UHM1RTVzd05Hc2ppdFVlZDREVjJYbWhtdTNqYUM4ZWV5R1RQSjZwc3FyZnRr?=
 =?utf-8?B?amRkR0dPTm53S0U2ZiszRVo5THBaWTNnc3hxR2xsOStlZEZFVVFCaUlLSTcy?=
 =?utf-8?B?UHVCUkhtaHBXWkw5UU1ZTmswVFN2NzV1Y09nVkhxVjU4K09WU2VhWVFjcm9l?=
 =?utf-8?B?TzlPdk5sMVFoQlVlSXNpbWt0MUNtRkZEMWlVRm9Jb0FrL2NaUDZjZjJaSFRn?=
 =?utf-8?B?OGdlajIvbnhjVmZpTUpvZE41N2FES096OGhONFplRkQxQXhKWnQza2xZVUM3?=
 =?utf-8?B?VHFab1kvS3E4Z0dyZXRWYTFtZVlWUjJYYWhhaldVVWVSNGdNTUdpQUhhS1FI?=
 =?utf-8?B?WVpxcGE5NXRoS2RJajdsRThzZmZjTkZmc1ZNQ1JncEJ1K25RT3FuUU1Xbnhw?=
 =?utf-8?B?UHVHZWdidFpjaW81R0lqL2dRdUJaWnlLUXB5TmxPc09ydTdSV1dVYzVkT0tR?=
 =?utf-8?B?NHN5STRuS1VSZHFGWTROVmJPc2RlS1R5UnZTNUJkQWoxVng5V1VyVGIyMlVs?=
 =?utf-8?B?RTM2blU5aVUveEpZMFpKaFpqeU9PY0VXeWRHL21aZGZ1aWcrdXpuSjVKWVFn?=
 =?utf-8?B?WFVYTUowV25MT0FWVjAxN1RMSkpWOXpPRzQ4eXlULzZqZzA3TVByblFMTXNF?=
 =?utf-8?B?dURPZ1VNQjdxUmdiSTdobHptdm5lbE9TK1BTcHcrMS9hUXI2UGlzckwwdEVZ?=
 =?utf-8?B?d1BvbEh2aTA0elFudmk2NFRUYWd4a2pCdm1IYWo2M2tmN0xnbjg5SFMxdkdO?=
 =?utf-8?B?QS9hZGY4QlVjVFNMRTJoc21PMDJxa3paUzg1Yk5tcGY0YXIzL2szaEZUOXZN?=
 =?utf-8?B?QlhobGxMNE9GNmhuU2RiS2lxTzZxc3prUXZtcUtOTllKa01rL1ZmM2dOSFBH?=
 =?utf-8?B?RUF5cXBkUjVwMUE0Z3JDZEZYUkFBLzdmRnIxYVdEQ3RBUmZQKzNQUDBSaHFx?=
 =?utf-8?B?dDVrcjlMM0tjOHIwek14KyszbWZkQjZCUit0YStldnVUTE8zVGVhNEJtTDkr?=
 =?utf-8?B?OXFpRGtRTzQ3OXowYXFnVGRBd2IzRFN6OXp5WThyZ0Q4Nk9QNTJqbXQrZHRs?=
 =?utf-8?B?Y0FxSE85RGlOQUsxTXpOOGJQMkN1K0Yzek9CSG90Qm4zUDBaUm9TNkhRaGlQ?=
 =?utf-8?B?RWV0QnRwL0dOUXNCVEpqSTBKYkdZRk5MSVlmVTRuNmd2VHBGYi81a0R5RERz?=
 =?utf-8?B?c1Vqem40STQrN1VqOS82L1ZmdGRKc044d1M1clFsb2wvVDBLWE9LT3h4bHpk?=
 =?utf-8?B?Ni9UWXVkNldhaVBoZm1CSWt0b0xiT1N2R3FBR3AwTHJiRFFuSE5GTHBCakJw?=
 =?utf-8?B?ZElzbUJRdDEzUDBMeW9HUGh2RXE4MSs3ZWV1VXJpNlM4UXFjMDBjamt6UmE2?=
 =?utf-8?B?TElQKzlTdlFyZzV2bGs5QXVCOUxEdDJ0eUs2MlIvMjlZbURYcDJNSWJNZzIx?=
 =?utf-8?B?QXRaODBsK2FtdTh6dkliYWFlMmRxQ253MzJJS2ZwNHdTYVZKY01jdGd6Vjlp?=
 =?utf-8?B?VUoweVQ4Z2tZaTcrS1ZhaGdzVm1BVmJ3T1ZNcHRPRGJadldiMFdyYnpPOHE2?=
 =?utf-8?Q?l1i8CUeMyw7KZGZPubN9VJtrE9pWbzMB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5089.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZzVZK3ZoRTZvVW5welQzYzlscHV0cnorNExVdm1QSWtwUEZsUktPWEhpbmli?=
 =?utf-8?B?algvUWFydFEwUFFaMlpBenlWK2hmcWI0ckFsdjZsdWxrMmRlM1lJODdsUWFN?=
 =?utf-8?B?WlJpTlpSdktMMGNIdzFyb3dua2V5WllzMm9jWVZGMEFhOFA3Wld4anlHWnhx?=
 =?utf-8?B?REg0bmJycm1vUVo2Q3QyNnQzVm1QSWRGZkgvUzJFVmtRNjRCTktKNWNZeDhK?=
 =?utf-8?B?VEtUOTdCY3Zkb0NhYVlNenlNVUd1UG9KVlA5L0gyNlA2NGZIUHZLNi9jTUtj?=
 =?utf-8?B?VTIwUVdpREh6dDFBQWx5NHdlcWxqZk1hZ2tDTVJsaHdkalp6RmcvSENjajEy?=
 =?utf-8?B?aGdHb1lPbitxTXM2M0NsRWswT25yRHJIeWVuVjRaYXlIcDM4QTk5Q3Bjb01V?=
 =?utf-8?B?b2dQUHdZWVkxTWlpQVlrWUF4ZUtzZFIxZXFBWlZJUHJXdzUwQ0J4MXA2bEJD?=
 =?utf-8?B?L2FiNWFhR2oxSHlua1dPdXIvT1NDdWx4OVd4R1FvQ0x0S2ZXM2ZyVWozL3gy?=
 =?utf-8?B?UGhybUt2dHM4YitRR0VJNm1LeW5MVS96eitXZnBPa081dUFvbXlBcFRyNXFi?=
 =?utf-8?B?ci9BZGRJOU5wOFpIb3NJYjFZRWVCYTRUakVxa3NKMWpRdmhKODZTSjB5bThz?=
 =?utf-8?B?VXpxczJUQk0vcnlWM1IxYi94Uis3SlViQlMxTjB6Um43TnV6Vy9QQ3pnTVhw?=
 =?utf-8?B?S002TklRSW1HVnZxWU1JTXVKNTh5YjBsSnVQZmwvV3doUHpmM1VFamlvVHFv?=
 =?utf-8?B?M05ISE1VUG5mWWVnbzUwa0pUdGwyZnhLQU0zZ0VrZSsvSHpQRVN6Z3ZxOWwr?=
 =?utf-8?B?ZmVBMExlOTlxeTFwV0tEOHprUXJtMnp4eXJxNFZ6d0dWL3paUkhnVlZJM3E0?=
 =?utf-8?B?NlYvQUFxQjZiYXYzOEFvRFkwb1cxVnRFcUd2UWFOWkMwWFZMdXJiNGhvSHh2?=
 =?utf-8?B?TEEydWFrek4rbDhwVFNLK0tRS0xVZHB1VmQrUk5lRjVlR3lBY09JLzhjOXJv?=
 =?utf-8?B?eUJkM0ttNFBSa1NoSnA3RDRMQmNaa09TTjhxYjRYUXoyL2ZBSUVPM1U5VDZw?=
 =?utf-8?B?eVFQUGM3ZUFObHQ2Z2kvZ0JzSW80M09DeFAza3JjR3RPVWp5WEE3VUphdjVk?=
 =?utf-8?B?V1Btc0FNb1o3bU5XeFlEdG82eWNSN3lQakpXeStKV3dLYVpUOFdZb1VyQ09O?=
 =?utf-8?B?bkRpWnNIUks5SU1wcC90ajFzMi9rM2dlRzJTeTk3U1g1M2o5ekk2cjFwZHhT?=
 =?utf-8?B?Z2ZXQkJSalkxYks3WmwwdmtDREV5ZUNJdS9KVVRHRVQzL3VCelV6eG9scVBH?=
 =?utf-8?B?bmtvMkpTcEEvcXA5VXNIRStQQ1ZhZDJNS1FNOWRxZUJFQlFBQlhMeFVaSVVq?=
 =?utf-8?B?MTIzQlBvZFI5elg5eERISGxlMitlREJGR0V6cHF5Z0hVSTRteTJscG9xQXRW?=
 =?utf-8?B?K0ZTcFVOajRIVVQza2FJQzRUSVlUenZBWTE3Qm51a25obkhwQmcvcUVvbk9w?=
 =?utf-8?B?OUFtcmpLU05leDBDMGgrU1VEbDE1RDhLMjRmVFFCblhYSTJtV25INVY1SWN4?=
 =?utf-8?B?aFZxWEJmMmluRDM3UUdlc0dSYVcwOE9GSGlRMEs4K1Y1UCs1TVNJMks3Y0ha?=
 =?utf-8?B?R20zZjdRVDFQRmZ0MEpUMmcwUFlwM1FFY0VyMkZFVCtQK3Bud1F2SUEzU3JL?=
 =?utf-8?B?YTd5RnVZNGcxM0MwT3BIbzhWSmtsZ3lBY1FabGpXc2M4OTg0WDZRRHpJSkJy?=
 =?utf-8?B?K3BWZ0tjS3RNRWNrOUkvQ2ViQXV0VDNaNkh1UDRBcndkOWM1NzBIdnowdlNB?=
 =?utf-8?B?d0tsQnFEUlRKeDVQREsrMURSZnBDUTVrOGU2UXZ0Q29wSXVvdThUWWFMSnNo?=
 =?utf-8?B?bjdNL2JwMjRCQ2pOSGlrdVFubElRZk5vRnRyRnJNVlFFZEtLS1lnRjF2ZTRv?=
 =?utf-8?B?K3VVZGlmTzVuOVU1U0RLbkRLSjFOUHhTN3NYbW5oV2NIRUNQdk5qL3dhaStO?=
 =?utf-8?B?VnArYldEek81R1U5VVptVWU2ZFU4ZWxpdHVMM0htV1VwcXZsbUNMdVMwOCtS?=
 =?utf-8?B?ODlWM3p5R1pOZXhqT3VkeGFYTERRK2EwMTF4LzZTdDlOVlVIRFpCOE5NYXV5?=
 =?utf-8?B?QTZoQ2pVcE5XYXZHaGlIKzFVRE1vMDZjNVQwTkFlY1V6c0ZieFhKcXBtdm9U?=
 =?utf-8?B?cHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0de4aa0a-e1ae-4ef2-01a7-08de07862203
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5089.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 22:49:41.1757
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RBVbECeZHxdvmBPSR/AbOG2/ctj888Szxb75d0xCQyF9KBSlamBNXIBWRJ7zjfceZPGdp4RbfRb1/SLvGPCch/rBJVvwx/kfnSNYhVIrW7o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6409
X-OriginatorOrg: intel.com

--------------USJKYF0tYQoTUJFBOs2MuDYs
Content-Type: multipart/mixed; boundary="------------JbD7Vh0ylbi8rT4quB1jI2yP";
 protected-headers="v1"
From: Jacob Keller <jacob.e.keller@intel.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "Kernel.org Tools" <tools@kernel.org>
Message-ID: <6ac5c872-7b82-4676-824b-9b834ef8c970@intel.com>
Subject: Re: [PATCH v4] b4: support send-email aliases
References: <20251009-jk-email-alias-support-v4-1-16f458de996e@intel.com>
 <20251009-voracious-calculating-gecko-adfe48@lemur>
In-Reply-To: <20251009-voracious-calculating-gecko-adfe48@lemur>

--------------JbD7Vh0ylbi8rT4quB1jI2yP
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable



On 10/9/2025 2:06 PM, Konstantin Ryabitsev wrote:
> On Thu, Oct 09, 2025 at 01:19:13PM -0700, Jacob Keller wrote:
>> - Use a dictionary for unqual_addrs to handle duplicates while preserv=
ing
>>   order.
>=20
> This seems hacky. :) I still like set, but perhaps we can do:
>=20
>     unqual_addrs: Set[str] =3D set()
>     ...
>     if unqual_addrs:
>         tocheck =3D list(unqual_addrs)
>         ecode, out =3D git_run_command(gitdir,
>                                      ['send-email', '--translate-aliase=
s'],
>                                      stdin=3D'\n'.join(tocheck).encode(=
))
>         ...
>             ...
>             for alias, entry in zip(tocheck, translated_addrs):
>                 ...
>=20
> This seems more pythonic and you're not continuously running .keys() on=
 the
> dict.

Right. Ultimately we're going to have to convert back to a list
somewhere if we want the ordered property. Without an OrderedSet (sadly
an external package and not part of the standard library in python...),
I think we're going to be doing that conversion somewhere. We could do
it upfront but I think the tocheck makes enough sense.

>=20
>> +def replace_aliases(entry: Tuple[str, str]) -> Tuple[str, str]:
>=20
> I would make it an underscore function inside the cleanup_email_addrs f=
unction
> itself (yay python!).
>=20
>     def cleanup_email_addrs(...):
>         global ALIAS_INFO
>         ...
>=20
>         def _replace_aliases(...):
>             # No need to global ALIAS_INFO, as it's still in scope
>             if entry[1] in ALIAS_INFO:
>                 ...
>=20
>         addresses =3D list(map(_replace_aliases, addresses))
>=20
> This seems cleaner, as this function only makes sense within the contex=
t of
> cleanup_email_addrs() and not in the larger b4 scope.
>=20

True thats nicer.

> -K


--------------JbD7Vh0ylbi8rT4quB1jI2yP--

--------------USJKYF0tYQoTUJFBOs2MuDYs
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQQgQFSp1zOQVirsQx5qll0+bw8o6AUCaOg8BAUDAAAAAAAKCRBqll0+bw8o6E2A
AQD1HMM6dtUt99AdSW1cq/02mhDOATVtvX6TgMLig+HGngEAqqTOdgLfjMXxcP0TF1NilY/JojBq
fW+nyTcCDZSwawg=
=4scW
-----END PGP SIGNATURE-----

--------------USJKYF0tYQoTUJFBOs2MuDYs--
