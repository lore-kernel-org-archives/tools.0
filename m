Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398BD149C74
	for <tools@linux.kernel.org>; Tue,  6 Aug 2024 21:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=10.30.226.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722979205; cv=fail; b=TUnM7bRvhiDoyF6koOLQMEZoMmT3yIeu/G8aHkO9T81TvNCOKOANDIwFxqppWEqVTB2kj5TnodBqk2iUGGdkEcXo3/9vWX0DgqMiN+5FSH55VQl5rXvldxrPDUO7kYi4+jmPhazn0fWvEGOd+5wF3zB1HfGCXl8iDTAGAK1axo0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722979205; c=relaxed/simple;
	bh=sCLLn1nSyEMGd6RjRiID+CDUj+MK8XX1wefInsdnrrk=;
	h=Message-ID:Date:To:From:Subject:Content-Type:MIME-Version; b=EqXofryJHKIqgeEMot32JpFGe4VBlAZMd8ph795UYrahdfjBWjQakWwVdUlvh2LEnWAwr+aUedjiMFL9o0VpYFvgq4gOSGkAWzs4JSxdrtAkQvNJkHpW+CzWtJBJ5Ne6D6AyDuQb7lZ59BsDMbZTJtnJ2AeyrOQigroet33kYW8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=li2zCZSC; arc=fail smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="li2zCZSC"
Received: by smtp.kernel.org (Postfix)
	id 29FB4C4AF09; Tue,  6 Aug 2024 21:20:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AF74CC32786
	for <tools@kernel.org>; Tue,  6 Aug 2024 21:20:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AF74CC32786
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722979204; x=1754515204;
  h=message-id:date:to:from:subject:
   content-transfer-encoding:mime-version;
  bh=sCLLn1nSyEMGd6RjRiID+CDUj+MK8XX1wefInsdnrrk=;
  b=li2zCZSCIJXYvTMjYVltpdJQPUw/nLDMx5EoNcFZEeUNXkYRbsjcrhkb
   sHkXL7CQZwOF2g3oSq6D1QbWw0Q9OKyHWPb6NTUEm7ypKgB72Mw8t3chd
   Zld2shVOQQcVa48TaiEcZRa5qEZpzqTyCkInyouvVxEUlBVrStuPx5tW2
   Gr4yxek8yR90Lk0B8Sx+AgkQO5yiGEj9SJrUzCSPB04w1P+LszjnAmfpA
   FyrVPyvSzzzjCXe4NoN0AjMzzYnGdRlhGQb9yAwPMYnsDg5Lu5qf9Yk7R
   YI5Ps/rSMfwy/P8TOZa2L0fzrqpXu+An1YC6k00HrYLATn9IgQH5laU+V
   w==;
X-CSE-ConnectionGUID: dv19yW7gTLaGYMaO86WKrA==
X-CSE-MsgGUID: FRQ1iIexRHmWC+a8WAsbDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="43550761"
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; 
   d="scan'208";a="43550761"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 14:20:03 -0700
X-CSE-ConnectionGUID: 9wX1EF0ASBOWDr0NX/fSOw==
X-CSE-MsgGUID: jGQdMNuBTSC27fcgmJPXxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; 
   d="scan'208";a="61452172"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 06 Aug 2024 14:20:03 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 6 Aug 2024 14:20:01 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 6 Aug 2024 14:20:01 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 6 Aug 2024 14:20:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fHALoniMev1xLHMQMglau2aBXV+x3sjnKKRzGnjPsBHhMPhItXbOxn+W1m8fTeREfO9USKWEo6PVva2aV89J5hJJuFHO+LVPWvdBCWgyD0+BD/RxtOLvQiL8ddaj5p1OmH+U3D+3eaXSyNhTbds4zML5WhpWRaBUhhMDcGFKTnIUhfDzVHpT+L9kp1XO+1G7W8lWGMWkr09+u3RER4+ZXCIW40unOXeubppNamZueK/1lQteJrf9Stz22XW69DRpWCFByrqgPeVznzD2lucJgsPm0zpFv7D8XttxXexFiE1wVG97Pc5mAeRwHnnkKeXZx0K5/+PknyCoP6ozLQ+4jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sCLLn1nSyEMGd6RjRiID+CDUj+MK8XX1wefInsdnrrk=;
 b=JAl5U2eZ1OOnCIan4dReMta00DOeo+Y8ITZo6m1O/q710WmzD1g9fWyHMDYRTa64BqqHhl5JuDABh9hPrPOfqXTJu8B6otGZG2pWgx6c4qd3ixAhuODp1gEZCcivv/Eeb4S8j5Z4ntuFARcjFAjQ+Qsq89O1ZmrUnBgElTFhVDd9FE7fBRdfhaYIhf3dHLBbBQapXeobkZeDvy+2fpA6uYHS9dfwBHLWPg3Lti0gGMCtITGIB3GaMJ9pPZ0zuNFedWG1woOBOpaqGiaSZcIRMsOFXkxM1GOimdbONmfajumBGf+GFYzCCBmUJUFf+ybKGwR1abRGEFgKNSjVi0K1Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5089.namprd11.prod.outlook.com (2603:10b6:303:9b::16)
 by PH7PR11MB8477.namprd11.prod.outlook.com (2603:10b6:510:30d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.29; Tue, 6 Aug
 2024 21:20:00 +0000
Received: from CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::7de8:e1b1:a3b:b8a8]) by CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::7de8:e1b1:a3b:b8a8%2]) with mapi id 15.20.7828.016; Tue, 6 Aug 2024
 21:20:00 +0000
Message-ID: <a6a4755d-85a6-4bc8-83f4-db374c4f3a03@intel.com>
Date: Tue, 6 Aug 2024 14:19:57 -0700
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: <tools@kernel.org>
From: Jacob Keller <jacob.e.keller@intel.com>
Subject: b4 send support for email alias file
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P220CA0010.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::15) To CO1PR11MB5089.namprd11.prod.outlook.com
 (2603:10b6:303:9b::16)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5089:EE_|PH7PR11MB8477:EE_
X-MS-Office365-Filtering-Correlation-Id: e8a447b6-eec8-4bc1-73b6-08dcb65d8773
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OXVzV2grMFVlWDhERWh1N25kd29MNUpBVHNTK0l2aFlxRUsvOE1tY0pNdWlt?=
 =?utf-8?B?WlFVNHprUk1WT0JRQVM3Tit5U3VEZGVtc2RsYVh1RU8yakI1dVJxSVI5U0Mz?=
 =?utf-8?B?amdqY2VJMEZIamN4OERGTTF4c1kvekZLQmVvZS9UaWJ1U1NGNFNYUnBlMUhn?=
 =?utf-8?B?eFFzNERUNGNpNU1LaXFMWGgyYTVITjJrYnl1NXg3TFJBWU9DSXVRRlI5Z1Nu?=
 =?utf-8?B?WTZiWWlmYWxxa2tMYWFpd0NKQlcvYzBuYjJUeGNsdFJUT01jUWRkOEFEMWFo?=
 =?utf-8?B?WTluSGR0ZllFVmxmZlVNWmFlcXA1eUMwdXJDRjI1VXdXTnNJb3p0VmdMeE90?=
 =?utf-8?B?a0wvbGwrY1g2RCtvQXhkNlJXcVMzWVE2aE9tUkk0OU9aK1I5S3IxQ2U3YW1E?=
 =?utf-8?B?dXJNT0JsK1JaeXFSYXdUVXhjeGJFK1JVZXBOVm8vNVZyZ1JleG9pVFhuRllH?=
 =?utf-8?B?OTR5VEZOdUVvUnA1b2ZhVHpyUmxkN1dpYVNseVFERmphM1VGS2Uxd0d6Ynh0?=
 =?utf-8?B?TkJ0NmVPUzNDYVVDZnoxR1FUd2JScjI3OFVGR21RZGZCMEZUWXR5dy9iV3JK?=
 =?utf-8?B?S1dkdTFrYUlTTzIrSW43a2toQ213SUx1dTdFY2xqYVhjYXZ4N2FZd3ZUNmZQ?=
 =?utf-8?B?V0xIWndkbm1YUU0vRFFDUUxORU9ZNDA5SVVoc3kxK0pvd3hQMEpTSm9sR3pK?=
 =?utf-8?B?RGRycGd3OUhxTDdVcGQ4VDNWVW1HTXRyUXFLVXh1MEJLaGdFZzdKY2plbitU?=
 =?utf-8?B?Zjd0bC91c1FTMkRZRmhNc0Vtb3pyMjdGMkJvdmN3dXBtSTVaNVZ0NjVvVGpN?=
 =?utf-8?B?SVpvZklhRUI4N2RHSjFNcG1PZ3R5RFkvUUR4MjVHY0JidUVOZ1VaTjViVmQr?=
 =?utf-8?B?NTBQaUl3a2wwaDJVN0tUT3A1S2x6VUVsbW8wQUJhVXpwdHJHc3ptY3pmT0p1?=
 =?utf-8?B?czB3eGhsTUNjYmZZSkdEQnNpNlR5U3BHQ0dIckRmWGg5N0RyQjBIMnFZK0ZL?=
 =?utf-8?B?bHdCOHBsZThBNFVKWGVRcERYNDEvZDRCd2FnaHJUVnNBeUYydDZZY0wzUTRD?=
 =?utf-8?B?L1haWG4vcngycmo3eXBiT3ZpSjBBUVMzUDcxT0RsakJWYzlMankxVSsyY0kr?=
 =?utf-8?B?SUsvb0ZXS1RuQWJoWDZiNUFCd21UaDVVSFVyRWlvK2lzN2tBbUk2SHJTcWZD?=
 =?utf-8?B?Q1pxZlZCa2wxRDNBMnVPRHVqWHBYU3FzMU15K3YwM1pyYjY0OXYvV3NHZkN1?=
 =?utf-8?B?eXZFdTFJL1Zic1JLeWpSNkpxM2F2MXdaYjIrdWlBenJLemFjNFdQMmthQlVE?=
 =?utf-8?B?TG16YUxFYk12cnVSNjlGV0NQMzlHdHlJVDUzUUoxMjEzNUdzVzZteUVpNUxM?=
 =?utf-8?B?WGY0STNiY2cvdjk0YlJHWC9xWXM1RExQNDVYZjI1amZhK0pLeGExWk94ZThS?=
 =?utf-8?B?d09EK1l3dzJHcHZBQk16Y1dqeTBveHMrdjFBQ3lhcVhqeEkvL2pKVlU5UU1G?=
 =?utf-8?B?MlNteGQ5K0RDNTZVMVAxQiszMWhrdFh3ME5UWTVsQ3hEak83ZVc5NnhKVHJR?=
 =?utf-8?B?YlZ6QjQxMFdNRkNuRS9jTUlib0VDczFvbUxvMkVOUVdTVTd0cEpoSUdOdFVt?=
 =?utf-8?B?eHZmekxIamsyRDIxbGE3MmR2ZmNvcis5ZGVaMFo0SE4xbXYvV3I4eXQ2dkdR?=
 =?utf-8?B?amxEVVhwWEc1aDJIL1l5aXJVTTFsL0V3eDRyNmtrZ2xXNUVEZkNuMGJtTm5z?=
 =?utf-8?B?S3p2UXBCNVFLM0FobzR5NUNZL0RmZlZTSzF1and6OXFWQ1JJai9HZnpVcDdV?=
 =?utf-8?B?eVpZU0lyaktqOGJhdHM2Zz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5089.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZEpiV1NudEdqclQ0endhd0lTb1NwaVVkOStGQkhRZDJ6VVMzZVFOaFh1dlRY?=
 =?utf-8?B?N0J0dVQ1NWorcUpDOGVzYjRzekdZV0dqS3Q5MEFLblF0K1ZlSXRZcCs0NjlI?=
 =?utf-8?B?MHEwdC9nbHMxNjJOUm85MmxHMzN3VjMwdk8ycTFHQ3R1V3psejZLV0tmKzhr?=
 =?utf-8?B?dnpHem1iSWdzSVM3Y2FxY1FPQ1pkSjNRSGdZREdYZi9LdWYvekk2NEcvQ21F?=
 =?utf-8?B?UFdCOG85ckFjREdiU1dJeE1xRnRXNmxreWUxeTVkUWJGZ0x6NytyYXJObDRo?=
 =?utf-8?B?dFptbURjM3FyOHN2bWdRaHViODNXY1grbHlmQWxoR2o1M2J5TG5UQmhoMDVn?=
 =?utf-8?B?OGFESi9nOUpYc2NqeHhhSFRoSFVOT0xCZkZSaWVEY1dFV1FZOHRSNmpQRWln?=
 =?utf-8?B?OGJaeTlMc1dLc3RDc2dlQjFTc1U5ZDhTT3JTU1UxTFM4YWQ4dDJNL3l0T0lp?=
 =?utf-8?B?bEdvbkxtbVlWWWdTaVUwcUF6ckszdzBRWW9HaEZtRitNQ2VLem1xNEtYVWg4?=
 =?utf-8?B?WnBqcW5oSzl0cXZiQm9OcHZHSzYxZWtwSFpVVEs3MGY4VHVYSStscnhRaVNF?=
 =?utf-8?B?MDJuOHJ1K1JUU0cvN3hlMnV0YWRJelRZbk5UZ25lSW8xU1FrSm9XZXlWV0tp?=
 =?utf-8?B?N211TFJtY0kyKzRxS203dW1SNjZ0cVpxRGFYdExjelpSRktMY0NaQWZUMi9Q?=
 =?utf-8?B?VVA4YnZtUEx0SEZNMXdCYzVJYzNIbUxKSVk4dEtuMVduVDRKTGdFUkhwbW9E?=
 =?utf-8?B?QkhKeWRjYkhoK2QyUUhYcG9NU1hqWk9PeTJyK3RQQ05hQWdmM2ZYZGRLbUpi?=
 =?utf-8?B?K1FScXJSbENwZFFHQW5YT3djaTJjc2JBUFRVU1piRHVHdlNJazVUTkRZZ0pa?=
 =?utf-8?B?ZDBveEppdU9HSi9NbUs1cGQ0anJ2L2ZxeVgrY1FUU0lTd1BZYU9jUGp3UWwx?=
 =?utf-8?B?ZER1MnBqT1dwYVBGeEdnRUlKS0V3WVEyYmdPa1lyOUYzbW1YemE0SmwzTG1j?=
 =?utf-8?B?SHpWV2tqT1RzelAxSzRUWWVJQTRsYWRDZis5MDdhL3FCRXdkQ0NqUFBheVdo?=
 =?utf-8?B?K1lYVGVVdWZ1VDQxejd2a1FnckdvNmhLTmpweEdvQUZxODlROEl4KzlrYnhN?=
 =?utf-8?B?TC9yd1MvaldMWlRzLzAvSXoxZi9pdmswdUhMa1Myd09abzMvSjNWeUwrYTVV?=
 =?utf-8?B?S01wNHdxRWh5U2wyaGs2VXFwU3RrL0RFUThaL2kvUFc5SDBaYUJmSGI1MGdv?=
 =?utf-8?B?OGRPdEtiZTdhdVFGbU50Z1g1MXh3VUozODFCcTlMQlFyOVN3ODNWYXdvRFVa?=
 =?utf-8?B?ZElLZHlWQVRpZ2ZSSENteDNEb2ZRRWRVWnVhVVZESTdMVEJjcHFIeEkxVUJm?=
 =?utf-8?B?ZnY2Rkx0eHlzbzBpMGo2QnhBZEdkVGNOaC93QnRRdVBJaHRyYVJtR090VGV1?=
 =?utf-8?B?SEQyZm4vbUF0Ump6K0NWTXk5bkZMSms5WEZLYW1HVlZIQTA0SVJQRTdNaGNi?=
 =?utf-8?B?VnN5TTRWdnRIamR2MUFSc3FHbGs0TStGejk5N0JxUWVPTXRabENjUDYzalJx?=
 =?utf-8?B?bHJEei9hd0NueEs2MkhiY05jWnZyYTRURy9yRmtxN1NzWCs2OEJSMXFUUWs1?=
 =?utf-8?B?SVZiaXVjZXNlMkVXVXBlSWpPeXQ5dlZkWXJ5OWt1d0F1Uk1vL25mSi9qenZj?=
 =?utf-8?B?ZE9KUXI1bkZEdFh0MGVTWDQ3NkF2clpSTTdwd3d2aGFHVVZIaUpzNGVZcEhj?=
 =?utf-8?B?OWlpeFlZR2JSdjF2a0tPUVhHL3VCNFEwSG1BY1RFWHlHdDVqU2R1YlhLY3Nj?=
 =?utf-8?B?eFA0L2FGbGJCYzB1VGRVdmV3bEM1T0dUM3dWRGovR2hMb3ppNGhoVEY0dlVr?=
 =?utf-8?B?b3N0ZFU2UDB6V0ovV0VUM0U4Y2U4QlkzMzgwWFA0NHVsMXRpbEZFL1ZXeDV3?=
 =?utf-8?B?RTFxaXY2Y2pBQ0xyeWxhTHFhWUJsTjVidXE0clFIdkdrM0pWOU5JcTdaeUZu?=
 =?utf-8?B?eXhnT3U3d2c2c1I5QUFXanlTazJNYzdzb1p1UEtFallNci9NQ2dPb3RkZ3Q5?=
 =?utf-8?B?MUhVNDJHSW9NdmlXbElrYjJZaXoycFlsTllTS0J6S0VHaEhyZkJNbXlBNEFL?=
 =?utf-8?Q?YjSg9B/FIH7woknt2srLnt6Dr?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e8a447b6-eec8-4bc1-73b6-08dcb65d8773
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5089.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2024 21:20:00.1248
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o80gO3SzRp4r5Op8Iqd8V0a/W1hTLwQHdh6FqISwZ56ewmq/cSCtqAtriT0811V+s5rPx3Q8DL25oUxSAJfjYhhoGX7OdqwRiB23ToIPc3U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8477
X-OriginatorOrg: intel.com

Hi,

I have recently been trying to switch to using b4 as my tool for sending
patch sets. I previously used git send-email. send-email has support for
an email alias file which allows specifying shorthand nicknames for
emails and automatically translating those aliases into the full name
and email address.

Would it be possible to have b4 either handle git's email alias file? Or
perhaps have its own file/config options?

This would make it easier than needing to specify the name and email in
quotes every time when sending to common addresses.

Thanks,
Jake
