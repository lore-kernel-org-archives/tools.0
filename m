Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6407B21420B
	for <tools@linux.kernel.org>; Wed, 25 Feb 2026 03:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=10.30.226.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771991227; cv=fail; b=FsrnuciW9egcTVD+RrvqEmKGNfGPko1RynfTvwi7O4SEv3my2Wif6W4776iGgRK4mG7xcgS9LE3Dbyxm+STXE8hhFXdg+qh3ccpLFeJS0SuaCghOoiaNgavq1WCqN+/plLrnhBW6rJY6CGP4/tUYCPN91a8icF9YaHBKzaRz+CI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771991227; c=relaxed/simple;
	bh=W1Kj5sjr7530Ge0zdttUoQDMHv5J8eMAvpXk78WEL5M=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nlkw4rfmtsF4/JvQ/QRQmYiLw8g/DU2hDRx1KWHPGekqPc3DlRqWK+u7HnvxhMhYuEUylAB0H4blBFP7XG/uuUZxbt2ve/8R7sCKmOKM2RD6OTzuqaqRL9vJKrvUnHpaJ/0kfFMslbFsD4ydGBjaKVIk3nPC+cq2F7H7qzG2c7s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bB45URjG; arc=fail smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bB45URjG"
Received: by smtp.kernel.org (Postfix)
	id 184EAC19421; Wed, 25 Feb 2026 03:47:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EE373C116D0
	for <tools@kernel.org>; Wed, 25 Feb 2026 03:47:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EE373C116D0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771991226; x=1803527226;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=W1Kj5sjr7530Ge0zdttUoQDMHv5J8eMAvpXk78WEL5M=;
  b=bB45URjGXUMQsfu+NB5w/o8HPSfk2Kohe5IncxgHledO9WzdmLpkXl3R
   EyhcWXeX6Ozz156OVGl45rXr9b2BqWQO4BYyC7NUW5S2f+m/lV77pbaJg
   pe1O6ekjlr73uvo6ehhlmm0JykuCq85oUWTiDUc7mEd0o7AeLEAnXW0o+
   rcH+jbac1yWlPV8RYpaouKNo/Rgt8Er0xHE0AILA3zkAdEVu9FmIbkYPA
   O8tzsyxCjjIpOMGdE5O1FxbG30s3qM5hHBK8VcRprj9mFEyHUmGbWdeVV
   XgSFGKlBnNOpvzv++cz+FFN4Ub5HdgaFuqu9nqOWEQuCIAySvNrK00zzR
   A==;
X-CSE-ConnectionGUID: Vgk42Aj9Q5WScJWrrXOQ4Q==
X-CSE-MsgGUID: CBlDlyOPQK6RF6Gck11KYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="72231730"
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; 
   d="scan'208";a="72231730"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 19:47:04 -0800
X-CSE-ConnectionGUID: +jNTxegwS+qyK46wMZUBuQ==
X-CSE-MsgGUID: Oh5PkBDHSOu+LdDBVjIh5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; 
   d="scan'208";a="214267516"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 19:47:00 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 19:47:00 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 24 Feb 2026 19:47:00 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.57) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 19:46:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p+7uB9CpDQKr0M3jaRDgVqcePM2BYPc1I0MiI8RBzeK8xLk0HkD/jMXa98UDq8E+jiUW1JahD8SVhbNl5A5Bj8lkiIYgtAjSozk0N9fkhf7MwICtFM2eRlrF2VjzNWnFuqdjF4vu4HLAMBE//xdMi+ULYfeqWgXba72DKUvdUePrZaIdgnlz+vBhj2uaWIM/7xTKVsiEeyYzfcwsNWrrdMWXAHwKcip8YQBMbwYa+W0oEWtvzM5WeT95bbvQPpRI3bb9AQ/dMae7tHomaItOfKedSMM/6T1oUdepnBTz8oxEWZbWx9L4sl5p+/APy5wovjPen8M6myvqts9L+bCMCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W1Kj5sjr7530Ge0zdttUoQDMHv5J8eMAvpXk78WEL5M=;
 b=iYewV/p+vchqle/Ggfh7ooKlDMtWWPLW4/vMTHfbsUzUQ6hxGWAf1IMDjYo6Uepw9jeBRRX1CMqzuTFj698poS84JTGftODzIm8NFo3NmCowL0UM1QSe0xZ0q0+REIyU00k1gNlGBorpQ4Rj5bcVEpHB1bg8ks8Pay+Xh3XwI0CUcoOn82k9kR8y+BJDs23wfYVDsZ7/7Ig6KrnctRuxLuZXKoQ10G1sq7h3Alz+PHT3MqFWAHDGMxNQMBJUsdFcVQZBXvf+OpClvqiXYZL30FLSIk/7gywImLJEGZaAqPAQW6kri/5QtFEl4QYw1ChRVDYDs6xEgRCGtwQScM8SNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7125.namprd11.prod.outlook.com (2603:10b6:303:219::12)
 by DS7PR11MB6269.namprd11.prod.outlook.com (2603:10b6:8:97::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Wed, 25 Feb
 2026 03:46:57 +0000
Received: from MW4PR11MB7125.namprd11.prod.outlook.com
 ([fe80::690e:5fd2:b08b:52af]) by MW4PR11MB7125.namprd11.prod.outlook.com
 ([fe80::690e:5fd2:b08b:52af%6]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 03:46:56 +0000
From: "Verma, Vishal L" <vishal.l.verma@intel.com>
To: "konstantin@linuxfoundation.org" <konstantin@linuxfoundation.org>
CC: "tools@kernel.org" <tools@kernel.org>
Subject: Re: [PATCH b4] b4: Add option to b4-send to include git-notes
Thread-Topic: [PATCH b4] b4: Add option to b4-send to include git-notes
Thread-Index: AQHcpfJi7za+nu0mH0KCR5v1ou6LPLWSuEkAgAAOl4A=
Date: Wed, 25 Feb 2026 03:46:56 +0000
Message-ID: <cc3a0991b7031b8285b947d4fad7482fc06a1eb6.camel@intel.com>
References: <20260224-add-git-notes-v1-1-9b7d3ab24b61@intel.com>
	 <20260224-malachite-mule-from-pluto-cfa9c4@lemur>
In-Reply-To: <20260224-malachite-mule-from-pluto-cfa9c4@lemur>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2 (3.56.2-2.fc42) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7125:EE_|DS7PR11MB6269:EE_
x-ms-office365-filtering-correlation-id: 43949edb-29e4-4d99-f7b3-08de742085fe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?dUs2VlFQWHFsbjViNHVxV2g2SGxGdWJxK1hkdm5tbGh3aHNHc1d1VUZpUHUz?=
 =?utf-8?B?VWMvcGx1S0tVRk1FRnV4MTlGK2EyOHF3TUd4NG5kUXpYOHdkT0NuVHhzZnJ0?=
 =?utf-8?B?aStlbVhMeGZnbVhObVVsc3BoTlYyNzlkYzBJNHVnUTRDODNjNzU2U1JoMklL?=
 =?utf-8?B?WUlqMHFYeklRbEhsaGwxRzl2ZTdRUEt6S3VtYnZjUEtFLzFkYjBFSXNHNnpt?=
 =?utf-8?B?UjZDNzcxQjdxb3VvZEx6OFhicFQ2WWUreDFlaVEvbFRCSWZQakRtMUZQUHdU?=
 =?utf-8?B?ZjVBKzliTFMxQjErdVNiRmNnYmg3Y0EvVkRxZ2NJMit4dEJYUllRS0ZLQnBq?=
 =?utf-8?B?VGJ5REQvcW5wRUpOUklBN0YwWVVyb3pKS1FjNklUek1wdkVwUjhrdHA4U0Rv?=
 =?utf-8?B?RVRXMHlmVVhWNFBrakJucGxjSEhESkdYdDc2SmRzY1JzR1U5YWhuNzBaUTdH?=
 =?utf-8?B?Rno4OTA3eGVZdmgrT1JUQW5YY1g1UnMzbmxEdE1uNVNnNnBZRGVPMldjRHRt?=
 =?utf-8?B?NFRTcnVIV3RWZFhnRi9ONmdMRGhIQVNqc3czSVpkWHYrQmsyVWN3VkU4SGhF?=
 =?utf-8?B?WWRRRkIwUDIrRndZbU9PMVNIWkRleldoVUNYVCswWmdQcm14cERvRkhrUzJ5?=
 =?utf-8?B?SHJCWXNtT0FmbWpyYjhNSmJ4Mnp0TkZoTzFZREN5NUluYzNPVGVwaUdYQ3NT?=
 =?utf-8?B?TVVIbUtPV3JwRGhWRzBJZmhWNVZidVBmeWpPeGcrd21HeWxZci81Mm9Hc2tD?=
 =?utf-8?B?NjhGelJ6THQyRlFDMUNnSHMzbSsrQ1h4RUQxM3dDcHVROUZCL3RlbzBTZmYv?=
 =?utf-8?B?dmYza2tsSjcvQlRFcjBKSmR6TVV6TDNwNXRnYW9QZXFseVRhSFM2dTliY1Vk?=
 =?utf-8?B?dHF1Zzh3U2tKQWdseGUwNTNQdFlPQ0hUMXQ2YzZ3OUtCcHJXR3IxeVl4akc0?=
 =?utf-8?B?bDMyMi9EdFk4eVNIU3lVWlBKbUN5a1ZpZDVneXNxTXE1OWJtVW5ZbU1SUXhU?=
 =?utf-8?B?NzRQYjJma0pyK3ViRk5hQlFBNzUvS2NBcVYrODgxUkN0dHRRZVVaRjV5WmRo?=
 =?utf-8?B?S2Z0eUxGSDlXemR2THByT3FHT1d3V016bGprZlZHT2VwMG9vdE1xRTYyTDJk?=
 =?utf-8?B?WjQzWHhKbXpwelpyR2hwUWhtT3dKbmovTEYrNE16WkRWckxpeTE4ZDNDVDlk?=
 =?utf-8?B?Qk5wdGEzWkZ2YkMyZmRkN1lMbUcvbE1jNS9vaG5JSGZ6ZG9IakRBeVJOZ3Fw?=
 =?utf-8?B?VkZwcDVrSEk3M0dGVUJHQlIrWitaNjUrc29EL2c3L1lBdmR4ZUVCNkVPZWFI?=
 =?utf-8?B?dEtqYVF6bDV5eFZkNU9pOW1JalJXZVNHZ1dHZUp3WUlySkM4RVRMQnVLVVBi?=
 =?utf-8?B?akJsTzUzNHFRa3cwUXhacS9sWDdoOXNWZDFKV29Kc0pvS2htbGxDRERiUldj?=
 =?utf-8?B?c0lSbUxjUkNLeG5FZURBNDhhZ1NMRllJRVpHTFZNQUVoY0k1U0Q0WWszVHhy?=
 =?utf-8?B?KzIxa0hmQTdqK09PaVVyWHl3S2EySkRtUzNPT1U4T3FOT0cvRWNJMTc0SHlC?=
 =?utf-8?B?RGFubGVobDBYSkhwT1RaMjdDMG1valF2NWNKY2lpSUtXd2xPeWwrTVpmdEo3?=
 =?utf-8?B?MzlqYW8vcVNFMlExTU9YNHVvemE2YTRtYVFJNEFGOGpaa2FXTThQdEpUclEv?=
 =?utf-8?B?SWZPTUVEQWVJRnVOYVJnTlJudzN5VUhQbjNPQzlBZ1JYcFBtZ3pPYW1rU2pS?=
 =?utf-8?B?VFEySzgyU290UUx1QmhwMEZYVUJ4RW16S3Z5TjUvVEordjkrdm9ycDFhNVBI?=
 =?utf-8?B?UHJsUjlQOVpTeFlPWHhZcXp2REZKSnlUWGJGbkRMTWd0UU9UaU5XMXFNS0g2?=
 =?utf-8?B?bVl2aWdONUk5SUZiaENuQ0w4blcyZGNTZHlBVU1TQ2Fyajlhd2xGSFVGUTM5?=
 =?utf-8?B?aWVtUGdMRVhrUE02cFV0UTdLNnczOUFSTlA2TTR2MldCajBNb2lIcnppdzZo?=
 =?utf-8?B?MCtPc1pJbGtCdVNxSVpBVjY3bFgva0h1bzN2RDFaaU5EdVp3T1QwYWYzakRG?=
 =?utf-8?B?aTYwWTMxYkV4bU95aENRUUJWSmJCT1l6Zjl2RjJyUXVmbDN0cHcvSXR5SDhB?=
 =?utf-8?B?akRjZUludC9NZVF0bXZIZnUydUpKQTBGZU01Y0R1ckNIeHlJWWI3ZURXU1JM?=
 =?utf-8?Q?O4EVcAh1HIb9j/OghDlXIewEPgIOlrqKOJQ069bhEwKB?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB7125.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Wkg4MWtKMFd4dHJaa3VSeW1odXNkTzZUZmJ6SnV5V1JTVVNUbDYvRG9tU1dW?=
 =?utf-8?B?c3FReU9tOHdkYTlDZHFkZlNEWnZFazZVOG5ZMlZ1bmRCbmxoWTVKclZWajRk?=
 =?utf-8?B?TDdDbVdadGFraVFQV3g2b25uQ1JBSGVzRFcva0ttUnk2WGtodTE2cGFyNTFB?=
 =?utf-8?B?cXkrbkxqa3dwZzlVSFBBZC93enlUQWRiKytNTE9jM05JeGdmUEU5aXh2N1Vl?=
 =?utf-8?B?L1NHcmk4N3ZUQVVOTmlMbmdDMURFTExmeSsxbjNrTlExejFCR2UwamlqZ0s0?=
 =?utf-8?B?RDNtWE1tNTVuSXRURzBCb3RqT2JmdFlsY3dqTUZQWmNySFlaYUc5ZXJadFhW?=
 =?utf-8?B?Q0NoVTJFd0k3RUZxUElYWVNPVXpDQWNrajhsWk1zNkJoOXBjby9Wb2VqMEFR?=
 =?utf-8?B?UXU5WHdXWkUzUDVaTjJ0VlJPM3VtaUFuaHZUQ2ZTYnhLR0FCdDJIbVJuMEdU?=
 =?utf-8?B?ci9vOVl6Znc1QU11L1JmZ1JzYUF4TGlZSmZiTURFZ0lpVWFDV2FMcnoxN09q?=
 =?utf-8?B?aVJvV2duSUVOVU5Cdk1idWE2VlhHdW5STVV6NnVYRFk5VGJldUFranNyVm9E?=
 =?utf-8?B?enhYK2FpN2tBLzVuU0FxaTdDYTQ3dkswSGZBTTZXQ3Npb2FQaUZtZndEZVRv?=
 =?utf-8?B?bjI3VE9Pc3RGK05KRmVqNVkxTUFJc3dkNEZySjJJMXg0M21BTy9CeEZKb1Ay?=
 =?utf-8?B?Y3c2MEprTWptQTlDYTdjMklVSldoaFF6cy9KY05XMXJzWWFIN2tnNzlMdktO?=
 =?utf-8?B?T1d5MnA2T3lKWHBBMjB0bTE5WmM4QXZrRFN5KzI4UXFCZFhwY1FkdHdjVW8y?=
 =?utf-8?B?dElIT3lsZXB4L1AzdXVBNHJvSHhzUy9sVzNacnY2UXlQYTNXZWZtMGpWSSt1?=
 =?utf-8?B?Zjd1NmxSUzM5NG5IZ0pvbDRPcFVXUEhTZXRsYUxCckpDVG1mSnlwaHo4VTJ1?=
 =?utf-8?B?azJvVXdNYVhmNm8wbFQ0SHp5c2Yzb3Y0dFZiUXBWQ1MrV0JWcGQxdWdMWEh1?=
 =?utf-8?B?UWM2UzgwN0lSNzZSUEVXcFYrTXBKbWJIV3VHZDN0Y2wwREx0dWxuaThxREtF?=
 =?utf-8?B?WkNQajV1c0RXSXhQSWJHN2hRZmxHZGc3cGhJdjlmVVFnMWlsVUh3RjVna3hF?=
 =?utf-8?B?dWxRMTkrbU8rSWYvbUpGVXljRnBYUndVYVB5M3J6eThnUEd6ZjZ0bUhZeUc0?=
 =?utf-8?B?SklWbm5selpCYjFBR2I1YUJmdXFjMEZMMGk4Sk93d0c2cFhQbVdWeW9QMzhU?=
 =?utf-8?B?dGRxY3FmNXdhdzk1ZmxnWURaeWZDZWZYL0tMYmJCRnpBYXNmblMwYldhZ3Fm?=
 =?utf-8?B?K0huaFhBV09vdGIwcmtUdEV1LzVlWlJELy9MR2lXUTNKTlpSRTVUbVBMK2Vr?=
 =?utf-8?B?V0duWnpPcVJLQ2dUNzZpK3dIeWFFcC9saEFJdk9zeVQ3dmJMdlJ3Nlh6L2pU?=
 =?utf-8?B?YndHdUFtMkhmZmxwd01UV0ZtM29WQUxGUU44UitSdjNpZThMUUx1UjloSUZp?=
 =?utf-8?B?b0lLeVZ2T0szR2RMOXFuYkE5bVlCZUlMR3RKV25lbytmT0U0OXFSODgyS0pR?=
 =?utf-8?B?eW1kZm1RMmhsNHF0ZDlqcEx2dmU0Mm9KV3lSOEJFbWJyRnZsYnBybzExVG5v?=
 =?utf-8?B?R0x5cVZCRkpuYjl3ZVJvSXNSVTB4ZGhLME5VQU1vcm43d3U2YXRPQ1lJRFkr?=
 =?utf-8?B?aWRIUzRhTDZhdlplOU9uQ1dESlVGaS9ydFlaN1JoNFc4RGlxTURaTHdxOW10?=
 =?utf-8?B?YzM5T3R2dEtkNEJPcEFoTXoya3lNWDJadnRaRDdQdXh6NGNyQnlMRWR5L0Jk?=
 =?utf-8?B?TzgvcVlpUlVVU0NqQkswM0ZWVzlKUTR4TXdKNnZCSEsyaXI0ODNpRk1GaTJD?=
 =?utf-8?B?SEM5bFFJaC9UWUpoRHN6Z1hYRnZTOERkOE9yNDQ5dlg0WGs1YThYSUo3VUZR?=
 =?utf-8?B?a1ZFUnU3UnoxZWFyVW8yK1FCUTd6cDNqVThFRHFjUWRzQzlQQW5obTJNN293?=
 =?utf-8?B?ODdXb0tIcWZmUXJVblovcmNkSHRQb1pVSWtnR2pad1ZJam5nWE91MnVoRGph?=
 =?utf-8?B?bzBUSkpRclZxS0EvM1NCRUZYOGdjWmx3QXlTMmtROThLc0MzM1MvR2hBbzJF?=
 =?utf-8?B?c1lVTjY4bVovdVlWL3pEelBORGtpRHgxRUQ2Q2ZNRUlZQ2hET2ozVnVNVjBZ?=
 =?utf-8?B?TXNuUWtQeGJZMWs2RzRrVmNSd3BtbDE3NzFqSEc4WXZpT3lzOXVmdisyMzA4?=
 =?utf-8?B?OWtvQWluLzE1ZGZ3aENRSUgvcHp4SXdWUitIWUttKy8zK0N2YzZMejdZUDdQ?=
 =?utf-8?B?UGdPTFlMUzdlZFE1K3VRT0NiSG94KzJ5VWpMV0t3YW5hRGNnVVRwSlpGUCt2?=
 =?utf-8?Q?Go6ICg3JTE86r/ok=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <55FAD1D406BCE94A8D68B15E35C7B8BD@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7125.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43949edb-29e4-4d99-f7b3-08de742085fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2026 03:46:56.8800
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U3p0C+2az+6U09ozr8GW273OgqtTalom1Cq1iPASz/hKedto/QEQTo7eyynACgaEJA+K247+ZUIwr20z1Onswao0WLUKMa5wdv2pG8KUFM4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6269
X-OriginatorOrg: intel.com

T24gVHVlLCAyMDI2LTAyLTI0IGF0IDIxOjU0IC0wNTAwLCBLb25zdGFudGluIFJ5YWJpdHNldiB3
cm90ZToNCj4gT24gVHVlLCBGZWIgMjQsIDIwMjYgYXQgMDY6MDE6NDlQTSAtMDcwMCwgVmlzaGFs
IFZlcm1hIHdyb3RlOg0KPiA+IEFkZCBhbiBvcHRpb24gKGFuZCBhIGNvbmZpZyBlbnRyeSkgZm9y
IGI0LXNlbmQgdG8gaW5jbHVkZSBhbnkgZ2l0LW5vdGVzDQo+ID4gaW4gdGhlIGZvcm1hdHRlZCBw
YXRjaCBhZnRlciB0aGUgJy0tLScgYnJlYWsuDQo+IA0KPiBUaGlzIGhhcyBjb21lIHVwIG11bHRp
cGxlIHRpbWVzLCBidXQgdW5mb3J0dW5hdGVseSB0aGVyZSBpcyBzdGlsbCBubyBwcm9wZXINCj4g
c3VwcG9ydCBmb3IgZ2l0IG5vdGVzIHdpdGggZ2l0LWZpbHRlci1yZXBvLCBzbyB5b3VyIG5vdGVz
IHdpbGwgYmUgbG9zdA0KPiBhZnRlciBhIGxvdCBvZiB2ZXJ5IGNvbW1vbiBiNCBwcmVwIGNvbW1h
bmRzLiBTZWU6DQo+IA0KPiBodHRwczovL2xvcmUua2VybmVsLm9yZy90b29scy8yMDI1MDEzMC1y
aWNoLW9yYW5ndXRhbi1mcm9tLWVsZG9yYWRvLTA0ZjYyMUBsZW11ci8NCg0KQWggZ29vZCBwb2lu
dCAtIEkgc2hvdWxkJ3ZlIHNlYXJjaGVkIGZvciBpdC4NCg0KSSBzZWUgWWF6ZW4gcG9zdGVkIGEg
Zm9sbG93LXVwWzFdIHVzaW5nIGEgd29ya2Fyb3VuZCBmcm9tIHRoZQ0KZGlzY3Vzc2lvbiBmaWx0
ZXItcmVwbyBpc3N1ZSAtIEkgY2FuIHNlZSBpZiB5b3UgY29uc2lkZXIgdGhpcyB3aG9sZQ0KdGhp
bmcgdG8gYmUgYSBiaXQgY2x1bmt5LCBidXQgaXQgd291bGQgY2VydGFpbmx5IGJlIG5pY2UgdG8g
aGF2ZS4gT3IgaXMNCnRoZXJlIGFub3RoZXIgcHJlZmVyYWJsZSB3YXkgdG8gYWRkIHRoZXNlICdi
YXNlbWVudCcgbm90ZXMgdG8gcGF0Y2hlcw0Kd2hpbGUgdXNpbmcgYSBiNCBwcmVwL3NlbmQgd29y
a2Zsb3c/DQoNClsxXTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvdG9vbHMvMjAyNTA0MDctYWRk
LWdpdC1ub3Rlcy12Mi0xLWMwMDQyZTkzOGU5MUBhbWQuY29tLw0K
