Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D647017BCA
	for <tools@linux.kernel.org>; Thu, 29 Jan 2026 09:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=10.30.226.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769677868; cv=fail; b=nNtZEIov+6vBUphXuLJGpj4aV0KcXAZthv5l9tFh06yq6QM0EWhn6ATsOGpk8Eym6owh7yDmMVtZOGlfuT+zq5g5azivGj60ua1LJd4zxVXLstkbrLeOXHAPRr8PeE2DETufKvjvaKXNFfJF9z24VZqof0CQCvbW9OA6kuEl9aI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769677868; c=relaxed/simple;
	bh=mHmpm2AFB+0GZpkJ5ueUjW3hk568aYurBlGEBV9gjsg=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=JZcSUdXuQg21DTlP255MNLgTQ8PAMkPULN4ft0U9tQsSueh1eDH6n47VvxDpriau14/fboOKmqxUcsr8xt88ISxF+a8xaEzfJ/kYcRak+IpG4QUrul6oiSgjhqHDD6ecbKByskw94mv7IjzCDc2JK3NNrmjEHM3DWdhVvxyDAoE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b=3FZ49PUH; arc=fail smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b="3FZ49PUH"
Received: by smtp.kernel.org (Postfix)
	id 94B3FC2BC9E; Thu, 29 Jan 2026 09:11:07 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11023111.outbound.protection.outlook.com [52.101.83.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D4FF3C4CEF7
	for <tools@kernel.org>; Thu, 29 Jan 2026 09:11:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D4FF3C4CEF7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=vaisala.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s4WNjKRBuh6xOuzVvQPjH2TGmyOC3r1fi8XgzOBwRUm/rXVgKFxgFL+T39iZv58Toi313VxqfCG5mxcq5NDJGmRoNtM71gWoplPx/L0YX39hvKJ+0V7AD/Lkm+MuJRDOyhbFW/RBxAXVpXIS7NORMkpw2dLc4CQpMTcWIgjSZIgAw4xSupOsZBkjsBoscSsm7bBeSavzX1ZChuHzgV35V5d5Fw2rj9NlK90Vf1TcfbxuuQFK9HPI2ocJZtErGYeiL2CDDO2NBt8ImDcBkM2runPpR7W9CWkxTmifyaThMVAyfbEJ4OgCOVHKBn0DPSUvBQ5INkpq8Ru6lL8f/GlxBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fqxdpfCQ73sSpmy39PfinHP0HoGLaP0CsHTsdV+scdo=;
 b=RV7lz5TLmbPRX+IKXVkg+pi0WI/DhrisJQugA1rOn1+cPQT/ixG3gpaZ/gRJ7zhyl4z9DM9FOhZ98n8lCOA2nOTTwZWxitDmZhP7r3kYjSQ9pvonTaqDgGELOkeW/oNY7DGvUxRpNETCpU1noYkGS/hHNTEGDnT03gxWoncl3uwk16p3mA2j7Xba32FEBZmGrp5C34y9PhZpKJzmHGSyeLBmePzMwHYXxgivEjwyHgPSfYIWfr3QMMWjBFm11KqH3UtBNMpwGL9qkmfe+dRL0b9IupQO0M999y0kOfrCPMVZhJvEB6V7CRPFDcH1GqGzbQAGEDQ4URIbfhy1qvpPrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fqxdpfCQ73sSpmy39PfinHP0HoGLaP0CsHTsdV+scdo=;
 b=3FZ49PUHYnp53exWP8Ar7UsLV9YNd1T0aYQs4mtdmr2eesFg8Bh+29D5LjCO9i/mMoZFZCFkIJB1tz3wVRE2QhfPHHBshG6TRfSoubNIKOCJ+/zGvzm1xC3hfG1vgxU0KKf8o744V3ikLQQyuDXWB0K49I31nWkxsniVIIKPqNkvP2uY9QOFSRmAUciHnLLy1rUeGyl1YPbD0316X3P6BrjZT/zgvHNztSB0a87G5ItIEo+/NYL7jA82bTLZExMUMZb0ueP52MsYasy0lK8eUUwSee8DADNDwtPX1VW66iRVz9AbfUbVP7Z6WsT7lHacqyu+jfgCa6d2kimRQUWXdw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AMBPR06MB10365.eurprd06.prod.outlook.com (2603:10a6:20b:6f0::7)
 by GV2PR06MB10252.eurprd06.prod.outlook.com (2603:10a6:150:2d4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 09:10:57 +0000
Received: from AMBPR06MB10365.eurprd06.prod.outlook.com
 ([fe80::addd:5e9b:7273:8049]) by AMBPR06MB10365.eurprd06.prod.outlook.com
 ([fe80::addd:5e9b:7273:8049%6]) with mapi id 15.20.9564.007; Thu, 29 Jan 2026
 09:10:57 +0000
From: Tomas Melin <tomas.melin@vaisala.com>
Subject: [PATCH b4 0/2] Add support for oauth2 SMTP authentication
Date: Thu, 29 Jan 2026 11:10:28 +0200
Message-Id: <20260129-smtp-oauth2-outlook-v1-0-e8c6d1b00c03@vaisala.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAUke2kC/yWMyw6CMBAAf4Xs2U3aCkT9FcOBwlbWB0u6rTEh/
 LtFjzPJzApKkUnhUq0Q6c3KMhewhwqGqZ9vhDwWBmdca6w7or7SgtLnNDmUnJ4iDwzmPNbGt02
 wJyjlEinw53e9gq+h+zvN/k5D2newbV+Sj/sLewAAAA==
X-Change-ID: 20260123-smtp-oauth2-outlook-f09d40b65f18
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tomas Melin <tomas.melin@vaisala.com>
X-Mailer: b4 0.15-dev-d4881
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769677857; l=756;
 i=tomas.melin@vaisala.com; s=20251125; h=from:subject:message-id;
 bh=mHmpm2AFB+0GZpkJ5ueUjW3hk568aYurBlGEBV9gjsg=;
 b=NqVfNEIWW9XuWqpJsdmlTV5LDCRAS88ZKlnuro4muVKH05zjB+iV8QxGyfJwAy/u326a6DQkw
 vEp4Lt7g4REAAludks9UU08KQOuyjcDXNPzHpR1ioc9Fl8HgBMA4gpf
X-Developer-Key: i=tomas.melin@vaisala.com; a=ed25519;
 pk=6lMiecjZ+OeyZuxYsDm/ADy9D1JKvYrKdsYv58PMepU=
X-ClientProxiedBy: GV3PEPF0001DDA2.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::6c9) To AMBPR06MB10365.eurprd06.prod.outlook.com
 (2603:10a6:20b:6f0::7)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBPR06MB10365:EE_|GV2PR06MB10252:EE_
X-MS-Office365-Filtering-Correlation-Id: 41988273-ebdf-417d-7899-08de5f16504b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z1pYeWZ3MkFZUUNkbkpZeVBITk9vcUxiRHd1Uml0MGRHSE1jMTJaQjF1VmF6?=
 =?utf-8?B?MCsxMkY4NzlFZlM4TVBuVlFXcVNxQy91RFJJMDNmS1RHR2NaaUJ4eXQ1aFdZ?=
 =?utf-8?B?RDN4eVZ1RGpwMjRqbzFDeldZalRHeUdlV1dCejNMa1pMenZDSlNMaU1PeUlF?=
 =?utf-8?B?MVFNUVdwS3kvZ3NRL0JTZGtoaU5jZTVIUlBMK1NBVVVSZlpJV1pKYkxobTF4?=
 =?utf-8?B?aGp6YlcvcDdtVlRpbWVJYS9MV3NoWjFzVHRVU0p3VGNzNzM2UzNXM3JWTTQ0?=
 =?utf-8?B?aVpZdkF5amR6UG1JVjYrdURDeTcvUWwxMzlqWjB4dUhMcitwbGVpQkMwWXV5?=
 =?utf-8?B?OGEzU2txcmNzdEpqUy8rWHJDUlZMOU5YUU9HMGFJMWkvRXFMTTRmaWloSklX?=
 =?utf-8?B?T2NOZXJtcHBETkFNQkNabHBIRFo3ZjliN25pcDQ5Mm03aHY3Y1UwMzBsV0p1?=
 =?utf-8?B?UEVlSW14ZUdZS3F3cW1iZGd1UCtlbks1cUZ6NTdPcU1TNzJDT1ZhV2NZOUtE?=
 =?utf-8?B?NUZ3dXdFLytHSHBaU0RRb2NXMTZoRGxxOTZQeE81R1BjMmJaRWRCUkllOTJE?=
 =?utf-8?B?R0JQNVppbVdCS0JwNEFyMkgzQlRuN3RsSno2eW5ETVRONTFTc0x3NlNsMnky?=
 =?utf-8?B?NXAwR2ErQjZFeXZRMG1OU2pndHN1VVNYL3piN0svMnVUK08xRExvZVNMWi9G?=
 =?utf-8?B?dXN0Y0IyeXk2UUtHeEhQWWcvM25XZ0hidm50eGFKM1h2Ti8zR1hSc1ZtNjBv?=
 =?utf-8?B?MkpEYyttVGkybDFNbFQ3YjZDZUEyeUlNZ281RExUMVFWR1lZaEVTanlnS25Q?=
 =?utf-8?B?SW56N3UxMGtVaDIrLzFtcGsvZndhR0F5OHhIOU04MjJzWFNiSldqWDJPU1E3?=
 =?utf-8?B?TG1NUFFFSkZLUGVpbWg0eEFRdWtBMDVsQ0V2Ri8zOHQvVmVSeVA0SzVGeXM1?=
 =?utf-8?B?VndTSnkwbWx3OE82a1BMNkM5WDNUUCtlSTVNbVNFQkpiTFlQNmtubkhFUUQr?=
 =?utf-8?B?R0VZbGk1VXc0SFBVcHJkdWs1VHlJcXNETHFHYm9YUXByUXlUanQwTTVPSzVZ?=
 =?utf-8?B?bFVnK21LYzNEbWNjMlk5eUlMVTJtTFdUbjBnaG5zdkYzWGNuR2dFclJzWUp6?=
 =?utf-8?B?TkcweG1JaFRWZjBvME16S0x2SkpqS1NtbzdxdDJqazNQRHluYUNCN080ZUNE?=
 =?utf-8?B?TEk4TmNyVWw3S3pNNXBETm50SmxWcFZOdEtkUWZzZ2E2OEltU0htRm1hdzJQ?=
 =?utf-8?B?eW4vQ0duTmRKN1dqTVVUZkswTTdldTdVSE5uc1EyYjFFMStpOXJFYnpoUG9i?=
 =?utf-8?B?TmdZcVQydFBxSkNobHorQzFWcWN6cENjK01QWnJxY3k5cnFBY0pDYkJyL2U1?=
 =?utf-8?B?UHo4QWxpUHh3dG5tVFlwTmxySTczNlNPVXkrQzJiTC9qQXVtZ0MySVQ0ZFV4?=
 =?utf-8?B?TS9GSHBJYjFpNU9TLzJXZkZEd2p4S2ZyQmZHcG5oV2NIL2oydkZIbzNOSzlL?=
 =?utf-8?B?UlNvQXUzeHJhWFBaV093aHNTaVFLd2d4TWYrT2dRZHVtekVrZGI5akFpYjE0?=
 =?utf-8?B?aWZPaXNIQUZSa2JnNGtOS2kvSHN4bXRvS04vWkNLV1BFdWh0QURSR0E5OTlu?=
 =?utf-8?B?L1M0M05aeFkxdG9aSVkzbWRKdGg3K282UWZTYlUrMnNtOVlUZUN0bUJDMTgv?=
 =?utf-8?B?NzBEN0dpaU9YL1FYdFRRMTdrbWdKOURmMitQdktjcXVqV1Z6N0NIaXhuQ1Qx?=
 =?utf-8?B?NXRQY2pRMDBtWkhNalZqTDVBTXg1U3VlYXIzRytPbUJnU0RRN29kcDBydHIw?=
 =?utf-8?B?Z3pzRHVHU2FaUDYyUDc1VmVzTm50dnFjZUs4SDB3MzRwd1liNGtwbVltdFpD?=
 =?utf-8?B?NDFISUp1Q0wwREpXR0NZVFpLSWR5Zm1ieDdVRVYzdlFvUk5tNG1CdDBIa3hV?=
 =?utf-8?B?RkZZdzJEd3M2eDUxNzVYNVgrOGFnYmhNK3N0eU1DOVp2b3JydTR6TGxIMU5z?=
 =?utf-8?B?YUhqd2RTZDcxT29IUHR0cUNMWWRYWXIwWW1TcWQ0WEF5UjZsYzg4TWRaalZr?=
 =?utf-8?B?V2JSYW1TQTArRldCMWVhOUJKZUdXeVVFdC9IZTBhTFNGL05KWVBQTCt5NldX?=
 =?utf-8?Q?mxYI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR06MB10365.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OW9CREJ6NS9yc3NXbkZCWmJBV2dhbUxKd2dYaVNYMkFRY3FRNWlLdmFwNEdX?=
 =?utf-8?B?NTExQndxYllORTFoK3dOOTlVUVRpTlIxYzM4L2hUMm9kTGJpUTV2SGVLM0JC?=
 =?utf-8?B?RFRCZHF1ZFVubnh3cTV4Tm1TM3hXcWdNU3pwdXpHWHRZL29xQmNoNWt1QitV?=
 =?utf-8?B?YWk1U05POE9hekpGSnRvNlFrcHhyQ1lWLzFRdFI0MFp3c2J0S25sSC9kVkhl?=
 =?utf-8?B?WE01ZHI0dWhrRHlsVVk5QXk0QzBSN3N6SGZlN0svUTFtc2cySS85OFAzM1Qx?=
 =?utf-8?B?SFFkVGlsM0FTdUxTZTFWN3J3WHZoT2JYRDBkYlRhaFFNd3h6VHMzb0xCNVNt?=
 =?utf-8?B?Zm90YzRwc0JrcEwwQXUzZGwxV1N4d2Y0Z25UbUtwRFNEMTBRM3RDUFRvWVVa?=
 =?utf-8?B?OXdlOTgrcXR0VTBkK3RheHRHMTdUS2R0SFlkVlRtNm9LNWhjS1ZZREFEaDBZ?=
 =?utf-8?B?VWRmZTFEN0ZCcVV6UE1KcEVMVFYvNkR5ME40RjlYMDdKSTJRYUxXeHNSWEpx?=
 =?utf-8?B?MEdqZndPV1k4Y0RCWXo2ZzQyTSs0OThROS9NalpNOXlsV2NVWWEyVkpKUTk5?=
 =?utf-8?B?bThFbkZLa3F5L0NPajNreVJSbENDa1lIR01uTCtJR1VVNkp4NG1kY1ZQbCt3?=
 =?utf-8?B?bFlRcHcyQWZtZXpYbUk3Mit2dTNGWTE0SnpON2dvWm9PdzU0VzB1VEF0bGVj?=
 =?utf-8?B?REkrVjFYVUpKaHpnWHJZcGE3elczY3lta3NsaXR3bWt0b0I0Z3NsMWUybDEw?=
 =?utf-8?B?Q0ZXeW1xakZtVndCQjh6b25BMzhJbjdEVFc3MmVseWlOblF1M29NQXNlQ3Np?=
 =?utf-8?B?SmplMk8ycjJiUTlaaC9WSnI2U1l6OERyQk9BTGlzTXRocUtLTWxiRHlCMU1D?=
 =?utf-8?B?QWF0Tk91V3U3c2hjN2ZBSjRTY1dGZ2JPdkc3bVhpbjZiY0N1ODZBb0czUEJk?=
 =?utf-8?B?OWdadnRHZE0rN0Npc2dEc2tJK3czU0l4MEJqaytFYk9FVHp3RmpmWUpxbU91?=
 =?utf-8?B?eGVRclFLYTZkb3J1bGFkT2tEeWhPNTRKc3ZmSHYrV244TTYya3ZxMnBvY3U4?=
 =?utf-8?B?Z0oyR0VhbGVDa1ZjVjdiMTBwODlycHN5K2tsQVpQNTVtTlhJTzkxcjQ3MEZJ?=
 =?utf-8?B?WW5mYW9ublR5N3JHR0psYzVwOVpORzNNcEo4K3dnRjVhc1NGa1dkVG1ZaGZp?=
 =?utf-8?B?QXdCM3NMNkhCS3pCMlRyaGV3WWRPSDhIbjVTMXdQWU1lYnoveEJhOE9PZFYx?=
 =?utf-8?B?eDRuL2luVTQ3Q2hlVHJ0cTJEeThQbGJXUnpTaUtFRmcvaFhKYURrNUlva1Vl?=
 =?utf-8?B?dWxIYXU2WFVybzlYZnpzMGxpaGF3OFhGUE1rM0wxLzBFVnFWUGFwTWcwMThZ?=
 =?utf-8?B?WXEvRTNhSnpUMThialVrdHcwVDE0TENwRDRFUTdreHVRVThBR1ptS3Q0cmt2?=
 =?utf-8?B?azJSQVNSSzY4Qzd4YWVNejZ3dXRPWnVuc2JBZGNaZS9VQVpza3dWS3RncUlW?=
 =?utf-8?B?MkVnc2xiRXVORmUxMXJYcVRSZmRaaTArMTRDUHVUTWFSTTB4K3VmWit6WW40?=
 =?utf-8?B?QUk1SWZBcUxKbnBVWUtGN0I3aXZiN0VlQ2Y0TWVkZVRKTjNiSlJXRU56NXov?=
 =?utf-8?B?QkVxUU9JczlVMDlEdElOa0ozd0RSUGdmMUpacjNXRzVjT3B6ek5EMVk2Sm04?=
 =?utf-8?B?SmFtSzRWcXJuUSt3a1haM29YY1VnR1Z0YWwrNmVKVXFFa3lvRFFDWWNPWDU3?=
 =?utf-8?B?NndOdjR3M2ptYnUvSUtJSXUxOUNKeHpYd1JKanNUZUU1RVFMVksraUttb0dL?=
 =?utf-8?B?ZW1FMzdCYzc4NWF4QUsyZFRQOXRva0lnekJteERoZERMMkJMdnZBS3ZuWjJI?=
 =?utf-8?B?N3FXVzZ3UzhpdnlhTEI4dGMvWDJhYndZNzJhKzlvbzhENWhzT3VCaHg5RVhC?=
 =?utf-8?B?RzlwVUJBQTV4dXlBbm9MeGV4NElpQlpYdTV3UE9TYlg2VU9CeHFxa3FHM2dh?=
 =?utf-8?B?ZTJ6bFQ2RmZUM003ME8weTkxSjZRU1NxMjhNNjA3MHU0eGZlSzhtWXJ3bCtw?=
 =?utf-8?B?V0UzZmFBc1NVRzBSUUt3alE5MGV3STcveW1RN3BiOXdidkhCRGVKZ2Q3cGNY?=
 =?utf-8?B?KzFZS1NjdE85MzcyemZMNWIyR3dlVWU1bDlZOEZJZ204TDhYajZWVklzT0g4?=
 =?utf-8?B?a0NidzNoTEZEakVTdFJYM0NYYmlnWjVDNGxkUW44TWZZUW9NOStiYTdvYnFW?=
 =?utf-8?B?VG9hN2IzSm1ZcXBJck9hV094SEdxdCt6aXZDV2pJbUFrVTVnR283K0I0U2xH?=
 =?utf-8?B?MkpWV3NPYmJ1azhpMGIwKzFteVUwa1pwMXBPbTB5Rmc2ajIwS3JZL2NhUEhN?=
 =?utf-8?Q?r5nGTk2dO4jFql/Q=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41988273-ebdf-417d-7899-08de5f16504b
X-MS-Exchange-CrossTenant-AuthSource: AMBPR06MB10365.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 09:10:57.5823
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kWU+QedbQZ6C4sHkkalnjcXFy0RTrbiO7NDV0jYqeXeof4iHRfzOxJ9uZ0BR8iKDm7Pe6lsffceEFWgMtkXR4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR06MB10252

Add support for oauth2 authentication with SMTP server, integrating
with git credential helpers for retrieving tokens. With this approach,
the same configuration as is needed for git send-email can be used
to send patches using oauth2 with b4.

Signed-off-by: Tomas Melin <tomas.melin@vaisala.com>
---
Tomas Melin (2):
      ez: add SMTP authentication method to printed information
      b4: add support for oauth2 SMTP authentication

 src/b4/__init__.py | 25 +++++++++++++++++++++++++
 src/b4/ez.py       |  2 +-
 2 files changed, 26 insertions(+), 1 deletion(-)
---
base-commit: 477734000555ffc24bf873952e40367deee26f17
change-id: 20260123-smtp-oauth2-outlook-f09d40b65f18

Best regards,
--  
Tomas Melin <tomas.melin@vaisala.com>

