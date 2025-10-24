Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB71626FD9A
	for <tools@linux.kernel.org>; Fri, 24 Oct 2025 20:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=10.30.226.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761336723; cv=fail; b=G1txMLvNKLOPDeytrJbhS9d/pOO/wEkWTTHPIB91WZNVikRaeLzGw6TgeBXpQdXA9kT9zWeGnAcF1k3olCtWYtPB5NMZi93ywoVUI6jmkHC/5fth8sGDTxtMehuH98I9G17M0I68dnj8ZnnEDIpi+Mtjfea7Ne3OV5/jyTynT1A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761336723; c=relaxed/simple;
	bh=8Dld5AAbGRUkLNo0mjN7RiYlyIinv02r9B/p1237Q8E=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Z731fEqWu/9fWq96+9qZtMay1sFk9dyU7z4w15+goVlz1JJQCovCDGtc35XoCdn2V8dtgvu+kHH12m+H6j/XKw67Ex8T8+/EotLQ1ivvB1edHMIBZXQKKQyvtKQNxdiPtayaJD9Uy+AkG+vgVhB+JHgtmdbsodlvJIT1Zyq1Z9k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XnGHpJyM; arc=fail smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XnGHpJyM"
Received: by smtp.kernel.org (Postfix)
	id 6F004C4CEF1; Fri, 24 Oct 2025 20:12:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D3141C4CEFB
	for <tools@kernel.org>; Fri, 24 Oct 2025 20:12:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D3141C4CEFB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761336722; x=1792872722;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:mime-version;
  bh=8Dld5AAbGRUkLNo0mjN7RiYlyIinv02r9B/p1237Q8E=;
  b=XnGHpJyMs1FT7LXawSrF2f6rCCGALvCEsRtFkgMgvYH4/BCfe2ivegac
   2LRozd4LgB+XgS3N1MrqB+J+xwVKg1yMcEanY7/4SsOiP0dTeSox/uvKY
   egvQbZU2HE/q9lYA1i0dXOSgVEEsBbk5TQQU1409K95/+M5AHHBdTAt6X
   t5hj7qWktsQcn0n66cLzZTfU8nGlenUv8vnKAq3XIYTlwkwI7pQVCkLOC
   P4Sn6wHjTcokqBBGZ2OE0wTh3s269lu1cbRSR6SVpLXGrP86UVSQPgfjm
   Uk9ZIWyk6/CEA7RWtfy/AynEMS34tvN8HTBNKcIhC6udlS6MWC+dg964V
   A==;
X-CSE-ConnectionGUID: S36raL7OQkWFmWkoq2zEvA==
X-CSE-MsgGUID: wIhV1WpJRkCwA395re7xpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="66137614"
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; 
   d="asc'?scan'208";a="66137614"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 13:12:00 -0700
X-CSE-ConnectionGUID: ukCkSIf7QlWxcK1s1qw3yQ==
X-CSE-MsgGUID: i/fPs3VTQnCMgbZxkNoT/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; 
   d="asc'?scan'208";a="208152030"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 13:12:00 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 24 Oct 2025 13:11:59 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 24 Oct 2025 13:11:59 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.33) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 24 Oct 2025 13:11:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qpGXwl/wCjqU8RoCPU3/veTLEoTnCvDtdXES/KA+APswN8Eib8Ley3OwEUUJ8Hn0aimG8lbLyIMwmB2nSSv7WpoJ6TGs8KIQTAq7LQBn2eiMHoNPkyY1wXIEh7IysPRcMT0sE/XVxE8jhxnykyQzDHCvw9c7lVD1XGw5tokb+cYKqssQkRpf6oJbjdqAo+xuWha4Tu4jgGbZyIj4IA+MAlEUT+acPl051ZAPBd2Ucpfs2Bd+18fRzHUaQK0760jllr6Z78Y6C0SK21ZBlCekBWJ2aol8ilN3L510pFKdpqSmIOi7+dNLfcfF4ag0iKW0I2W4pj8eJS9o2GNx5GGLUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Dld5AAbGRUkLNo0mjN7RiYlyIinv02r9B/p1237Q8E=;
 b=PqnmGcpvwyInbfYEDDfJNnQ/vV7W2k6bzWQs41AtBwum5U+J+e2vilU7m03KFUhfzxA20VFH4zg+ATZTcRpxfyzkkXuc3dYPobCEuBZwzHIpUSLOCD/HI8pjE80XkNg2boWXGVo5cd31F1H8wBw+VoqoCrCy2Djr3MdXRCZ9d2jIbcrtFKiYQwDmbAsr2RrKUmn2x2Q3hcFGplOpFofSLjanGGK9qBxHkX1KKHZjfkN/c4+O2Tr0XGSfShOwFA3R1FwJIEAqDqseTGous1LOsbyhtroxlWnw2VusMs64AXUBFI3TgB/rKGBa59Ge66QJjJd0XLZ5UlJzkWSgOcUc9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5089.namprd11.prod.outlook.com (2603:10b6:303:9b::16)
 by CO1PR11MB5170.namprd11.prod.outlook.com (2603:10b6:303:91::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Fri, 24 Oct
 2025 20:11:57 +0000
Received: from CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::81f7:c6c0:ca43:11c3]) by CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::81f7:c6c0:ca43:11c3%3]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 20:11:57 +0000
Message-ID: <d485ddbc-aa04-423f-9a29-af5466c5d34a@intel.com>
Date: Fri, 24 Oct 2025 13:11:55 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH b4] b4: allow multiple b4.email-exclude config entries
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
CC: Kernel.org Tools <tools@kernel.org>
References: <20251022-jk-multiple-email-exclude-entries-v1-1-79f4b936f612@intel.com>
 <20251023-merciful-angelic-squid-0a97ff@lemur>
 <6ebd7f92-7ebc-479d-aeec-d4ac008dd21e@intel.com>
 <20251024-convivial-strange-moose-cdacdd@lemur>
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
In-Reply-To: <20251024-convivial-strange-moose-cdacdd@lemur>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------e08R2ke3SggmI0TU0miqZTrc"
X-ClientProxiedBy: MW4PR03CA0058.namprd03.prod.outlook.com
 (2603:10b6:303:8e::33) To CO1PR11MB5089.namprd11.prod.outlook.com
 (2603:10b6:303:9b::16)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5089:EE_|CO1PR11MB5170:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d3f8540-48dd-4ff4-1df2-08de13399505
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bEhMdGV0a0tjNTZ3ZkFXQmRmVXdHeUxuSm16VFhJbkFSVUZBQnJtSmNLbHQr?=
 =?utf-8?B?QmRvRGM0bnR0ZGdDVVpaRlFpa2JDNUIzQTJDVjI5blJPUklKbHBicU5KcHZj?=
 =?utf-8?B?OGZJUVQzQVlGOVlXcTZmT1BBSktYaDdTZVBVRDBERmtkOHp2RnEvMWFaSHpR?=
 =?utf-8?B?QlJPOHQ0Q3JrbXYzNjN0OVNBTEFDZ3VqOVNsajU4ZUxPWUUrVk52Z0RlVS94?=
 =?utf-8?B?NHA3UXhOYzUyMENQdUsxRkxFLzRlNFFPekhHWnJHb1V2VFk0UTNGYVBiR09V?=
 =?utf-8?B?ZkNQb2UvRzlFN2thZHRQTlcyUlBjM3FEQ3NCaUxOSVMyMmJ4VXA3UzdFeld0?=
 =?utf-8?B?OXd4emxYa2lCbVpJTS9vbHFkM0tOZ1grUnRaVmZ6cXE4YTlmTVFSZkFLc0k3?=
 =?utf-8?B?L2M2Q1BoT2w4ZTI4TThCb3labnA4RldIWmRObzYyVlBONnUwbjZQdXBiVWZR?=
 =?utf-8?B?RHVPSWlvb29DTUE0NElWd2tIeUx1MFE5K1FtaFhad00zQUhuWFIxMmt2YWls?=
 =?utf-8?B?RjRMenh1aE4yVFMwa2cxYTRVYzVzM29TSFRRU1VsTkduUHNaMS95RmRPVUFP?=
 =?utf-8?B?VmlMS3htVXAyekJOQWJRSkN0UnFBdW5SWmROUXhnUk0zek9wem55VGpaaHM2?=
 =?utf-8?B?cWVTbzdrdXdOTlE0QnZyVXM3Y1RmNExkMmxmeVdKWGpTNlJOazVhWExXcHhv?=
 =?utf-8?B?WnU3TnF6YkV1aUJOTy9ES0hrdGxCN0Jxc0tOWDJoOVFDTUoxY29VUk5pV3p3?=
 =?utf-8?B?b1BTeHkzTk9Qa1dRZ0l6LzR2cEJkUWZjQzdYQ2swMGp0Ujhpbjc3cURmNUVo?=
 =?utf-8?B?R1BiUEY2YWloUVFQSkRBYnJ0OFAvWWx2YzNkZEsyKzBydnY4M2hVUlhJUXFx?=
 =?utf-8?B?OEsrSnhCYmx3ZEZZSHdGcno2L1dQeGJxWEs4MkovajR2YVF3WTVwODkvejZH?=
 =?utf-8?B?UlVqekgzclFGVmNrV2E4WFd2K3IydmVWK0ljcEljUDUyNlJqNUdpdy9RVGwy?=
 =?utf-8?B?WWF6NXZkakx6eGlkcUhHNzI2YVMweEpuNUhILzlwQTJtMHBGZ083Zit1cElT?=
 =?utf-8?B?d0pYZEFydnliZ1M2Qmlqb3ZsS3pGcDFvbTlHV202djhuTm5YUVFLQmt3Z3B0?=
 =?utf-8?B?dnRVRXl3MEdmNnl6OTdTR242UlNvTXFKZnh6Q0kvNUNPRXJoeks2SmduRWpW?=
 =?utf-8?B?VGNDaE9ONGZpZVk5Y3l4ckZ5bDNBSWUrdVFOUSt5S0p6MGpGbFM4NDh6SWxF?=
 =?utf-8?B?RU5TVC9oaldqT2xSRTZTa0lLVll5U2JBZFhZTTI5aFB0YjhhK1piZ0thVlJj?=
 =?utf-8?B?YllRSVBWdWZpY0lzMmlKY2lHb0JVaVUyUG5kVTB5UC82alcyN1Nmb3ZITTVp?=
 =?utf-8?B?YVordGxNK3NZL09lTW4xVnc1VUhpajRnZlhMWXlPL2NrbHgwbW9oVXMwUDNi?=
 =?utf-8?B?WnFsQ1lxQVVkS3JGRVlNK213SFlRNW0weDd1dFMvL2lTblpNOXl1ZnlKbjk3?=
 =?utf-8?B?ZWowNUFsMnFkMjZOZFovZWcyL20raHlpN3QzcVd4NTV3L21yT0tyYSszUUNM?=
 =?utf-8?B?T0tRTk92TjR6ZUxpNkJwSEtqbWVIZVJKMUVRWVFqUHpYR2VCTnBRclVGVjJ6?=
 =?utf-8?B?cEl0eVRrQWtJK3ZpTVo4NytRZFhNMGFzdFNUcXBIcnBScG5KeUZaeXJGQ3Ba?=
 =?utf-8?B?SjB3SCtTekZvVGYrUkpuMVUwMzVDQ0tFMFBvbW5GOXZieG5yUmplcnRlMmZN?=
 =?utf-8?B?R2Vrek4vUnR5U0RjQUN3NDU0Y2xPeTcwSm5KZVRZTWxvN0prTkY5NjJycFNC?=
 =?utf-8?B?emxBS0grQ2VwSW91empVU1hKQ1lVblpLNjZjMUVTbm1LVkkzSXZJSzVLaUFo?=
 =?utf-8?B?NGhYR2dvN1F0aEJJdEZoMlZGeG5oTmdoQXBaVjYvNGtVVzdId3BxUG1PS2Z4?=
 =?utf-8?Q?EOsXND9fmZQj4akH2ahR+mL7uWvyY2LF?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5089.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YU5YRzQxejl0S0RuNzAyeGR3STdaMjRyRFpYRm1MUXhMdjFSdXgwdEFJdVZF?=
 =?utf-8?B?RHJpY1hHU3pzNVlMWmpGcHlIVFlmZDY2a3l6RytFRHJGc3ZLclZpZnpKY2ht?=
 =?utf-8?B?bUx5aWMyMFF4QWlBeWY3a0ZIYkZ0aHlkZWk2RnpDaHJjS05sZWNML21aUEha?=
 =?utf-8?B?QkpQaFBybFJFTlRKM25sa2tqQXFSQ1B2SE4zR1FCV3puQm5qdHVweDVFOTJw?=
 =?utf-8?B?QW92MXlVbFB4N0FpU3hKU3VjWjBaRGV0dG05SEsyZUR0cHBNZFUrb05oRHRm?=
 =?utf-8?B?aC9rSmRIMUJ2QXhRMDhkSmJUMzJiMlhjbFZxcGZwV0haS0xnazVwV1RlSGlr?=
 =?utf-8?B?TjVLT0U0aDdIKzd4czJLbks0QlE4OXgzWkRvdTRKMFFPUDI3Y3FqMlRyT0xR?=
 =?utf-8?B?R2lqWUxuR3YrUXBlK1dUbVlLN21KTHY4S2pjYUw5VUVHc0Q2Q2p3NFhROENQ?=
 =?utf-8?B?bGJxOXZUSlV0cUJZQ0VBd01mWWhzTTNOaFVjdkgyUFJUN0dCTXZyblB2VnVZ?=
 =?utf-8?B?UUMzbDgvalk2Umt3cU1ZcFBha2pPZkR5T3p0UU1FN2hGUmgxQnh1MjlXczdY?=
 =?utf-8?B?U3NZNjJqNjB3M29maXUxUTRnK2g0ZTRSSHJqMVhWa0xicWVwcjk4QXJnalVN?=
 =?utf-8?B?TTIzMHpKbmoxSHV5MEpncThrdmVuc3pvK1pkbDZldUlXNFpzME1zeG14cU5m?=
 =?utf-8?B?MjFOdE40dDl4bkpFeTJYcjc3aVBNN1hDQ25lYzBkdjVXN0NGVkhXdDRJVm5J?=
 =?utf-8?B?QmRJQVBJRUxMZ09GeUxVaVhrVm5ueHlUTjgxdDRlb3NWQmUxVnBHNWVTSnN5?=
 =?utf-8?B?UzY5c21NRGJvN2RPTVFkVEFWNE1GUDljQkZ0SmhFRGhzcGtta0N1YzBha2NE?=
 =?utf-8?B?dlV0MjZhOFpNQ0hDYjdmUSszU3VaMkdGUmVXaEN2a2tLdFJCaVFkS1oyemlL?=
 =?utf-8?B?UmFtTWo0UFd2djd0ZUN2WmpoM0JwUEp2R2x2eW15c05UQ28wWUZHM0tZakls?=
 =?utf-8?B?RjVoT0IxL3ZFQ3lYQmRTcmxoVFJtZURWVkQ4WkhWcmJkalluZzJsU1N6UFZm?=
 =?utf-8?B?QVFYV2NIOW0yWm94bVV2Smg1KzgwWUJkUnlycGVmT1VHcGJTYkxrVkhiWjZ1?=
 =?utf-8?B?bnhoRko3TnQ2QmE1cmNCY1ZreFBDMTd0VUlSSFZvcTQwTEhhalNpd1NlM0Qz?=
 =?utf-8?B?VCtieHhLQ3VCTGluamxHT0VBWk9ZbXl1bmZGUE9nWVhkWUNmTE5ZbWRWYkI0?=
 =?utf-8?B?RGhlS1owQ1BHaklHbTVsOGlLMnJDYUxuSTMwTmMvUmYreHdqZ1BndEROOTRq?=
 =?utf-8?B?a1h4c2lEWnVmSEVBOU1uK0hyQ21SQk1KV1JyK2kyUm9WK3ZTUWxKbllxN05a?=
 =?utf-8?B?NkIvVHU3ODVXZFRsRE9zQ2RJSWhhdlFqQ01rYjYzRkg2SFE5SjhiZ2dCcHdL?=
 =?utf-8?B?c0hJc2N1d2ZjemRoejZHVmNybFdQM0ZCbHFGZXoyb1QvYTNDL0kyOVY4Mk14?=
 =?utf-8?B?cnhtQXBWTklNQ1gyR0I4VWFJbnVmODZINzR3VGUxclIxVlR0YkhyL2o4dTNR?=
 =?utf-8?B?eEdqd0c0NDdHVHpKZWd6eVFlb1pKQ2ZROW1reDBZT1dTTlN4NVdIVS8zSFNq?=
 =?utf-8?B?bzBZRC9lNXlZQ1FkNXZuRDV6RGp2ejVLUUR5L1R1V2svQXZPSjNZN1U5bmpL?=
 =?utf-8?B?ck9qdHhaMzFHVGkrUW5IdW02emczNDVDSGY2K25CVkVvSzU5NUowTTl6TzNh?=
 =?utf-8?B?WmRUdWNnaEhiWDRnanR4Nzg5YjMrSUFsU2VrOHNzSGpFUTJWNkozM1VsWFFE?=
 =?utf-8?B?SnYwS3lBRjRyZDVCK2VvYm5KdXNCOEdHN0tYQ1FVMVpvaldVRHlGcjNRUSth?=
 =?utf-8?B?NWtZRlM5MnY2dUtXRFdQQUphZnNEbEhGUElzZmdjblFMZTNTMlAvcHpSeGJx?=
 =?utf-8?B?aUFKcTFlN240ZWxNZkFYZUxvcm5KeE0xK1ArMXhKL0VDTFNJTDVXc1d0K3pk?=
 =?utf-8?B?WlVYenU1aVN6Nzl2WFl5NHZ6YlArektMeGphS2tpdzJyb2ZHZkswblc5NjRh?=
 =?utf-8?B?ekdTY2s1TStQbUFkVVRicDlUeUJWb3JhVkZnU3J4NEh3UWg3UDFpNGNnUkQw?=
 =?utf-8?B?THR4OVkyeDc2UEliVzZiSVhkVWNjQXpISGVGN2ZpRU0wQU9uWDlNMEFLT2w3?=
 =?utf-8?B?UEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d3f8540-48dd-4ff4-1df2-08de13399505
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5089.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 20:11:56.9169
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pcEM8UP3X9LO1Ao7HMZqHTw6RwohKv1ZiUaj3XPtBjbUB2I3vC5y0qZKw/aYYlzu5rllSbR8ZDz0g8MytCDTetwOQLhJWLxN7H7Pf3/vsF0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5170
X-OriginatorOrg: intel.com

--------------e08R2ke3SggmI0TU0miqZTrc
Content-Type: multipart/mixed; boundary="------------jUionjxwQNAS7eWBkN9m7QEV";
 protected-headers="v1"
Message-ID: <d485ddbc-aa04-423f-9a29-af5466c5d34a@intel.com>
Date: Fri, 24 Oct 2025 13:11:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH b4] b4: allow multiple b4.email-exclude config entries
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "Kernel.org Tools" <tools@kernel.org>
References: <20251022-jk-multiple-email-exclude-entries-v1-1-79f4b936f612@intel.com>
 <20251023-merciful-angelic-squid-0a97ff@lemur>
 <6ebd7f92-7ebc-479d-aeec-d4ac008dd21e@intel.com>
 <20251024-convivial-strange-moose-cdacdd@lemur>
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
In-Reply-To: <20251024-convivial-strange-moose-cdacdd@lemur>

--------------jUionjxwQNAS7eWBkN9m7QEV
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable



On 10/24/2025 11:22 AM, Konstantin Ryabitsev wrote:
> On Thu, Oct 23, 2025 at 03:04:15PM -0700, Jacob Keller wrote:
>> I do have two points that might make it not worth changing:
>>
>> 1) currently if you have multiple configs, the most specific config fi=
le
>> will take precedence. If we change that, some user configs could break=
,
>> meaning we have to make it a breaking change..
>>
>> 2) I don't know if there is a way to override and reset the list. I
>> thought git config might accept an empty value "email-exclude =3D" as
>> resetting the list.. but it doesn't actually seem to work in testing.
>>
>> Given that my main concern was being able to keep the lines split whic=
h
>> does work in my testing, I think I'm ok dropping this patch.
>=20
> I think I'm going to let this as-is for now. I can see both possibiliti=
es
> being valuable (setting something more globally that would add on to an=
y local
> configurations), but I also find it useful being able to completely ove=
rride a
> global setting in the more local .git/config.
>=20
> Seeing as it's already in place as non-multivalue, I'm going to let it =
be
> as-is for now, unless there is more interest in the future to change it=
=2E
>=20
> Thank you!
>=20
> -K

Agreed. Thanks for suggesting a workable alternative to my config issue!

-Jake

--------------jUionjxwQNAS7eWBkN9m7QEV--

--------------e08R2ke3SggmI0TU0miqZTrc
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQQgQFSp1zOQVirsQx5qll0+bw8o6AUCaPvdiwUDAAAAAAAKCRBqll0+bw8o6BTW
AP0Qd0YLXZPOXAyqWa1qvwCWFWtYNamKeTW9C+5Lm+KPdgEA5P22MInOZhVWNMnwuhSAOuiDit8B
BwribCIueAJ+GAs=
=V/Zm
-----END PGP SIGNATURE-----

--------------e08R2ke3SggmI0TU0miqZTrc--
