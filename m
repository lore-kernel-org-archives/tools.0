Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3DA638B
	for <tools@linux.kernel.org>; Thu, 12 Jun 2025 17:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=10.30.226.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749750512; cv=fail; b=L7C5eBXS/jWcCjb5Jx+H9ECsr1xgl+aqCkwXj2r6SVSJuGxxQe8Ll8NMapFSXA6nFFeW2pu7SWsRu2fyLP2E5oV4YIAiCkA7aDRFGlsnIJh4+n42/it2AENyeHJPi02C6ssnmxHYSooR7jy8oqFY0TWUjMpcPAHVdnG5ENbViWc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749750512; c=relaxed/simple;
	bh=I/KvYbvGpce2tIP9Sm32klLdcUKZqFhDVwhB5VXT+dU=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=F3TaUamBIcmFmtCC4skIJnk9Kq5nW5OC/5s+MapopFlvJ5CpKIf0wOOcZKPOPwGvd/d4XURKHRRcMnNX9eebmsXdTDR43038IUfy5ZbXCEaZUZEczd7m7lTLbFOgw2v3kt1TcW4bVlaplLvFe6XyE77WWLhDblvE2eIILAln/HQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PZgMVSAD; arc=fail smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PZgMVSAD"
Received: by smtp.kernel.org (Postfix)
	id AEB17C4CEEE; Thu, 12 Jun 2025 17:48:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 46FD2C4CEEA
	for <tools@kernel.org>; Thu, 12 Jun 2025 17:48:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 46FD2C4CEEA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749750511; x=1781286511;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I/KvYbvGpce2tIP9Sm32klLdcUKZqFhDVwhB5VXT+dU=;
  b=PZgMVSAD40yl+p4mkUuT2VC+6yLYtpDKtY1Gazp9legQG81iF3PE7oL+
   GV3BBtNPzMIi8q+vJdhoAIKsK39oY+heUvP5TyGvcrE8+6cwGMqxhDoiM
   4XWAhimh9mIeqUGrEK3g3KzumChQCOCwrBipxTvCYKB4eX05Hj8Pb6V/R
   CfSK0hYMJJLUuwMkQsjJUzcL4b6CVatnXsEz8nA555npVbqR1A7omTInP
   4nST+9I2EKOOu8xtL33RUCvVd4K4ngnFCFbmkP/mjNhNWJF+tiU9mljG+
   MyThVZS8tIKOdjGH1eIoLvtyJ5jtp3yt8b82rYGISeL4QyxkBQz2qxgGj
   g==;
X-CSE-ConnectionGUID: CwjjWxeCSmKJxIli7aHlCA==
X-CSE-MsgGUID: QnLfqYK+SRKIdrm5X9dLgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="51663403"
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; 
   d="scan'208";a="51663403"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 10:48:25 -0700
X-CSE-ConnectionGUID: Bqk4FI8lTgGRtcOvp7b+5w==
X-CSE-MsgGUID: Vfz6znljSwGfwjrCy1sTew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; 
   d="scan'208";a="152500810"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 10:48:24 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 10:48:23 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 12 Jun 2025 10:48:23 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.69) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 10:48:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q+4X/3ptXSQCfF/hWbCcc9iiNcQWPdHd+iq0zjeN36TcuGqeVGoJRZqfccTuJ5Nh//UnsXHw7TD20H3YlGeg2lFEqNdd57+zpaONjec6UA2NQIeai70l3Nhgx8/lowuLrv59VzSuA9m9ccRLDDoVO3CjF/LJviluIPFj10UPy3WpLKAurk/iD5ap6xyhAh+MKl6CtPtOLjbOE9fuUTTIRdIXdJ4MAziKJYYpmj0fWjGpDPS2N0bOcDOI/WnV0R4DOwV3kXPOZI6vBazwPJ9klh4K5vIes5evoQDqkrCRLpFyPv+xB71SdVkXEBA1RzT/NVIhg8DXltK99OU9kQH7og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XaWdYLMNIbIKTymwKvt2F717yhD6f7b8N0EhssSzVR4=;
 b=b9BbmMiLq2SJZcrb0/0+B0NbooD7MSlgKQyh6MNhXmxsg7sVFMB3lIGynyK1ZA13VlEeezn+2/hsvE2E9kivn3KX2C2bbq/MjlbYzVgME5rmCtfLx3B7sEXp67norcCRurGeDeWWmGcp5bkvnX8USzNn51F/bYyNZBvyuAnx7W4N514Qc/BrpD0ZvIe1dT4t5i267h9kKDWjqbPA8pZHBLggLk0UrIcK5eIAgDdre9B+fRdcJ3VwOC71nvBXRhsujYxRePBOE3/dl0xBhIBQqN62uys3eLkaNgP8+H08HOOsKQxDC7zkvLZT5TzldD1z5q2SbYpFvaFcJcppHIIU2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB7124.namprd11.prod.outlook.com (2603:10b6:510:20f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.31; Thu, 12 Jun
 2025 17:48:21 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 17:48:20 +0000
Date: Thu, 12 Jun 2025 12:48:18 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <tools@kernel.org>
CC: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, Gustavo Sousa
	<gustavo.sousa@intel.com>
Subject: Why are checks cached?
Message-ID: <65b3tv5latpw2xwrcnn7p34evviiyzq477kdneclj36dyoaged@wghv3olqemaq>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
X-ClientProxiedBy: SJ0PR13CA0007.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::12) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB7124:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f13e0d2-2429-49f7-154b-08dda9d9520b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5z24t9aCKm+cn4OvL6KoyPdsMRQFRPq/OMGCDXz2km9pEBgl1lzegYwiJ90E?=
 =?us-ascii?Q?FbUW+I0dUqCTSr8yEHemA1g28m4r+uU6ECEloKrynlGzMOZeecjiNBmP5TAH?=
 =?us-ascii?Q?cNGpiVVRoPTvMDtMPGv/OYe5qHCFXVAPqibB/OgpyFLqBUaPX0yTJ0CA/Ra3?=
 =?us-ascii?Q?EMv4WwGmzyVElXIJ3/TqXpz+QNn5ev1Y5Azv2xYtuFBrbCQ5KqIQnNnJjKRf?=
 =?us-ascii?Q?nkoUHTP0strudZrNMKBd2Yryws9XUj4UfnznRs/r3tqgoL6pIlKHvV6unzQd?=
 =?us-ascii?Q?nyVNMyjtOkDnDokHFIn1ZHvoyErPTmDjYGYLTp+TKlQUJBSHiPLJVo9eeh+C?=
 =?us-ascii?Q?d3ymaN0ahWhS1euTkc5KGfhzxuDG1ku4JbtMITsPpEM0/lIWEwgFBl6B3ZXK?=
 =?us-ascii?Q?OFXp76uiVMRmPm/tldoayTR82GWwK/C5mQYeC0P1+reKxevfLXzefAd8jhub?=
 =?us-ascii?Q?tBTqqNYy+dWOhPZRsmsYDftDdD/1D2j4ac3cQHf1+Qv2r4ADDGIhpfkEux+h?=
 =?us-ascii?Q?KUXhXKzABSVFqKZw3J+ZfQIzHdO/LqqGveYB1yeYnOYO+tk8CtGgv6wZmwKR?=
 =?us-ascii?Q?K5hvZEtBXcNPnXJdP6b8KzftcuURRrfUYJTo6u3HpgUVIrbFqxxbYywXNHM8?=
 =?us-ascii?Q?oBAYXWMGhxuHt5klrR3VAdL756KA+Dn/WHoCw9ten4IXdNZWaXbMhTr850Oz?=
 =?us-ascii?Q?A9C+j7+O8TvUD6oJQmjUyL45EgeYXk7iavXqL1NvdF8rOLd2O7jpUv5K3YqZ?=
 =?us-ascii?Q?eheE6ctmM/RGH7UPNLnC0mr6E1sf8+drKLtRXdU4cjFG8Y2+QW0ADK8gr1cc?=
 =?us-ascii?Q?y6KYcJBD88rvhxexd+howjN5tcVjTP90HBpxPwpsHB4c/U03uorSdN6JcRms?=
 =?us-ascii?Q?fkymdN3wWNnj9YklSBCiugtQ3eni7uVu0pU514/8j3TqO/HhkGUNPFbx/+pj?=
 =?us-ascii?Q?E5rwlNxtZy7/rn1RdNfGAFwjBgIswC6hPlniw1q8kzueqzn66xykxyLbPQNz?=
 =?us-ascii?Q?oy/eA7rLQqGmIijOfqTz5iSpm+8F18hnYGs9Z0gtKvphkQJrr2Ku3F0rD6iG?=
 =?us-ascii?Q?n789+6Hv/nffkUoIPAbxmL/n2x26xuZkQ0BGnJPtVRH+BOKhHH66UCeEmUMc?=
 =?us-ascii?Q?B0vIRpu5ByaDqgnAY/hafK4Wt7ivvkM8QJH2RwdRaW/eyAYD1XWGKpaFRdeV?=
 =?us-ascii?Q?E3Pu+U8USkTu5Pnqb2wMFJ1L5DBVPdxEneJiPZAZitPj63lLFqyjFJw84QK2?=
 =?us-ascii?Q?G02t8EEG+KzWjge/+VkxICD+fwE+Hx27LJToOt5EUbohgrNBSOog8PUDsRTC?=
 =?us-ascii?Q?uSzhd9QmdsiLDerhe/fUmvTBeRwOSNFcvdakzSxSrEq6vLiys/ulnzaB88Oi?=
 =?us-ascii?Q?FqDevqWms62nScdmtxz+SdAA4o6K7LBgfQHBtYoMYdMDCgzqtfG49gV058S6?=
 =?us-ascii?Q?MykprsXAuvw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6139.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2ECbB4JhScTyNaGrW4nD03G2LkvOGPJRZb1fMGhWvICbl8JeoPJFS04X3qoG?=
 =?us-ascii?Q?Z0s3rAXD4cxdyWa/+xOWIRFqkR1DIKrAEbdkOGT+g1o/c6QvHCJZOyfV7y4L?=
 =?us-ascii?Q?SThSIEGrtEqvtAAgTT2zhG5B3QQDK4PI1EI5ao5k05/Z7kVfESFBdegp1c0X?=
 =?us-ascii?Q?KHvtMaSEfOf3V5fn5oYJ41Rwlktz9dJTg0LU4MzsywRXhvQt2z0F2Npw9r66?=
 =?us-ascii?Q?in9NHZo6dHnZbn0PtKmUQJSgfYIlmycXRE4VXDbUjbK7IL2orhOIfhay4dTC?=
 =?us-ascii?Q?P61VoFhCBRLsCYDCAyCIeE8VjZFMtX5n44bp1YiofxmC//r4BfIpKE+ycBGP?=
 =?us-ascii?Q?qaqo7bI7b6NFhGTtW5pFMQib9t6NSt4ecpyNDxnG3v/EL7LXS8bQ0HZhmB49?=
 =?us-ascii?Q?9ZWWIrLTtl85ig+zIilLY8pNl7zC6zh2bJ8jXzsBHRC8gAFQ+r5NkizsQLpF?=
 =?us-ascii?Q?ApiLxTdvEFWqRPSilS1bM4NtFauHf30LNh+CsqTjyz7MtsY6s9Pj+mP8UfKb?=
 =?us-ascii?Q?bpDrHuKfLSwNOg47fbrALr7uhbLj12qVZbr21zLTEr4InBgTAA9gjO9jNbYl?=
 =?us-ascii?Q?9fq32nnHm1Hv8e9P1g+HHeOdMY09fOIeyth/fRteDYr2SZrKnD5H9aHwQmF5?=
 =?us-ascii?Q?ll5+ZYhJ7iRyp8mLMbtofXfeWfwooznPXZnZdVQQjNIYwfwkOMDF1Eis31DB?=
 =?us-ascii?Q?aLa11PKQ7qeNLQY2QANIks7Nk8Fvo+e4OaXCHy2qnflAf/Wpya/D4UO+v316?=
 =?us-ascii?Q?RvxbD7BRkolJ31O9PutLFDVjGFZ6Z5IFDUqMPpXt6N6Y0XQ8fFpNABAlgEIh?=
 =?us-ascii?Q?Y44k9jZlaogmWJ6a3KPtVtQnFp7dS92He6cdcW94eJGJSjfLevS/rnHkrCV4?=
 =?us-ascii?Q?awwHUFk9X4UX9fah98jPMW5ER6ycyGWEyOQ25m213XiPmAECFUqjs+6YBOL5?=
 =?us-ascii?Q?odrZB5WxxM/37IQc7qQg4lEW/I3Aekik64HDJDSAP8sy+HVoW3OiBWJ9d0cW?=
 =?us-ascii?Q?Ttji1tlXmtp0qYWMMB+m1t2IdJGk8iN2t21MDjQ8Ht6zEDyZg3AZnDBSk3qi?=
 =?us-ascii?Q?sosLiWVks3ig1/OXnRHLzphtEnS5lqe1ub3DqoJUvKdTuU3NVi2iyzLZfiqe?=
 =?us-ascii?Q?An5ASU766ESDyuO/2QwlZCzhO4XAiqaBlgX8QD0xveZ7/MT+7kLvz/qOkOgx?=
 =?us-ascii?Q?rj4tXg+JRnf+kwH+EDRTP1AlKRB29HFBDS7TfSSPTK3uEFxl7N05LSYUupNu?=
 =?us-ascii?Q?7jASK4piv0qmUxNoeHutb6LknNaPmQi64tQjPTmf3cYRxk4ZcTNFnNEpP+iV?=
 =?us-ascii?Q?3pgPcN2tQfTLnM7Mf1tQVldJ2KN7iIfquc0/zj7wXGjGJck1FIhw+9+jkHLX?=
 =?us-ascii?Q?9vv3O2zhGnItAvDoorRC9TmOejoZnRt8lHaiYpSBTWkfPb9mUrBungcNJPol?=
 =?us-ascii?Q?AsBIi8ovpf+ABD2KcEavRTA1CK39Q2QvdtEQcCHdWtPe7Fmr9q48yTBi1fPm?=
 =?us-ascii?Q?lff5e0pyKZZcerjlCOq5X/Ocw1JH2Bu/X7yDX0Q7xGmAB1tKDgoyPHRbKy83?=
 =?us-ascii?Q?cD+H5cRmYBseyV2bnHaPCse0etNmI6UQbz7yynBwk2Tpmnw/cOVxXkzacVjO?=
 =?us-ascii?Q?5Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f13e0d2-2429-49f7-154b-08dda9d9520b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 17:48:20.6929
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UvluvehQDb7cW/4Q6nwUSAVAWfd8SvSRyJtLkX5XIrNUuV4q12LtmfqY5JPvoZ/zbyso4OhXUx+TiOK3FAMeOg2p22g3jByKtqW+FQM1u5U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7124
X-OriginatorOrg: intel.com

Hi,

Yesterday I was caught by a surprising behavior in b4: it caches the
checks executed by `b4 prep --check`.  I have additional tools for
checks on my kernel patches and I was changing that particular tool. I
wasn't really expecting a local operation to use cached results. I
double checked the help message:

	-C, --no-cache        Do not use local cache when performing remote queries

For remote queries, it makes sense: do not download things again, just
use what is cached. But for running checks, is it because checkpatch is
checked out in the same repo? I'm using `prep-perpatch-check-cmd` to
point to some external scripts.

Some possible improvements:

	1) Just rework the -C help message
	2) Add a separate option (default false?) for prep checks
	3) Do not cache results if the tool is external to the repo

Or a mix of them. Thoughts?

thanks
Lucas De Marchi
