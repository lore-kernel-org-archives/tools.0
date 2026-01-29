Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C33376BE9
	for <tools@linux.kernel.org>; Thu, 29 Jan 2026 09:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=10.30.226.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769677873; cv=fail; b=anGMNA7ly/gqEYhtnC0Eoy2eb24RVnO6o2TyDWj39LwZAqv2aLVjOTe0LIC4FrWIUpBjvwe93QNONcD2jXrEKnICBtaLK41ekhky6kAnuvmd+OuuS0tJxzZqHO8fasi23qD2BU80yRbXlQ2ZMLCyI0aYC+rurUDQYfUTZhKrZ6g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769677873; c=relaxed/simple;
	bh=sadsyCCbovXWAAdwzHXo3ONcwFDeX6waPT2wkWPDW6M=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Zm3S2RgZ/JcA927N97h3mBYxeecpS+tZvqIydOehFqQCukFR1yK/87Fw86YJa5p/oFzdoJGFOsBan7fhehCXCQW6Orf1q1ngO8M/XL0Sp/gOlg2R+Xq4SRIWK/d5IpF6QmDSgq0oRs2hX0tOQ4zZlyzq0JWTytShyX401vlCceo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b=jmpmCe5/; arc=fail smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b="jmpmCe5/"
Received: by smtp.kernel.org (Postfix)
	id 0AF95C2BC9E; Thu, 29 Jan 2026 09:11:13 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11023111.outbound.protection.outlook.com [52.101.83.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C6701C116D0
	for <tools@kernel.org>; Thu, 29 Jan 2026 09:11:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C6701C116D0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=vaisala.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qYs9nidVpKklUaWXvROBhhPNbwUKZH9r22HaxxyHba5GUbXCIr//r1HT7V9YUDP3TJq8ezihCEBUANyrv07xopo0l7x1y6LR4eiA7Mka8ZCeMpum5OTDnCB9P/3FQny/vfOKiXf0NGyGlgHlqtKlhGvnpaguFEnEP6ZGmY+Y1eROpxN80XQU6+i5YP80Dr3QG/jLMx2rMNZ/QNUhYpT962MlOzGSjzLAREyzTAqlArbiHM4S/khnbgZ+RiqddQoQgEU4ERI7tr37bBbWsroWyDLONqkzy8nOhZhTk/ORKmSK7MfnQu/XPhip/0aPXBYHo2w4z4xMTzwdSQ8AiQgLtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AaurMhY9emD6/b9YOHzGWY9PbC69S0PlCMZR4ODIGRE=;
 b=yJTy11NWXb8CM16BEbrZK4U0tM1sJj7arUdwu4VJmyKXT29tY11IW2ocg9EdhVRuURUpi48ZLF+QpNRC+UBHOQidMqS9QNdtJz7MCt3Bqwo8ZFYMPjmQhNcdLRlVt2ML0sVdvgG3gHY0aeDjNRPLcvErC9nr8p0GqABXHVNERrJ6w9IQrFClh4LpoTeEO4BTPnEMK0yAHCFBQ8Ys/6I4OI1Gk6r5jiAGxuH46KYlJHLDMnIlCebo0nNninw2+N1Ob9BTdvsllo956W29utu+9raYa+xBkoWGPCS1MSpBqd3H9LFbjKFth5CMgGwL1GZ2z6PZxguCMm2xKEfSNNKhFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AaurMhY9emD6/b9YOHzGWY9PbC69S0PlCMZR4ODIGRE=;
 b=jmpmCe5/cYR2Vzdt3NCW+J9xmCNdOSDEPwVyWKzyaw6qcxoyYNdWRZUSidQD9Ux5W+2A0qv+eYQG9+3buAGVPgFFsL3A9UkY+5UtNpE92HUAchYrbelhLswGiJMa0WTOonEzTNjKbBVUft9FzdxNuUsII8Ts/7g3jrvhjsjYfpcM5NXnsGD9vC6ZTfNMyeRJO9FahYFLvGGFsiBPJef7lzHUDa3yI7TG9yYYPtjsiAOR+y0gx6QrXdCXju3JFdrbnp3/eDOB/ARY0BJ/MB6dwSeoGDDZRAZFEQUYzXKnKqtDpOpXyJh+IR2nx/4nVC7f5wSI8ckJ/gjtvr4ir553HA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AMBPR06MB10365.eurprd06.prod.outlook.com (2603:10a6:20b:6f0::7)
 by GV2PR06MB10252.eurprd06.prod.outlook.com (2603:10a6:150:2d4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 09:10:58 +0000
Received: from AMBPR06MB10365.eurprd06.prod.outlook.com
 ([fe80::addd:5e9b:7273:8049]) by AMBPR06MB10365.eurprd06.prod.outlook.com
 ([fe80::addd:5e9b:7273:8049%6]) with mapi id 15.20.9564.007; Thu, 29 Jan 2026
 09:10:58 +0000
From: Tomas Melin <tomas.melin@vaisala.com>
Date: Thu, 29 Jan 2026 11:10:29 +0200
Subject: [PATCH b4 1/2] ez: add SMTP authentication method to printed
 information
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260129-smtp-oauth2-outlook-v1-1-e8c6d1b00c03@vaisala.com>
References: <20260129-smtp-oauth2-outlook-v1-0-e8c6d1b00c03@vaisala.com>
In-Reply-To: <20260129-smtp-oauth2-outlook-v1-0-e8c6d1b00c03@vaisala.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tomas Melin <tomas.melin@vaisala.com>
X-Mailer: b4 0.15-dev-d4881
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769677857; l=877;
 i=tomas.melin@vaisala.com; s=20251125; h=from:subject:message-id;
 bh=sadsyCCbovXWAAdwzHXo3ONcwFDeX6waPT2wkWPDW6M=;
 b=CMHauQFdBZm/aRDls12hpn48uUWXpFmPPRx51dpmjEvSoOFCESzyNF7zo/wD6fdJG8F5inrBV
 18VERt4OYqoB+bKzFs9Gm09VRhW2qo+Ti8ajywx9aDFFHP86kpm8Ko1
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
X-MS-Office365-Filtering-Correlation-Id: 07d128fb-b259-4b64-dddc-08de5f1650ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NFFIRTFIYmYwRW5rK3MxZXdVNlJpdDA0ZE90Wnc0WnJFMU1BdS9RV2NZZ0VU?=
 =?utf-8?B?ZFdtS0h5VTJQVkZMZCtPTkovVEkvakx1ZmpkNVpVQnpuZlQ4QzNWZDN5RzJn?=
 =?utf-8?B?elVST1ZUQk1YTW9NY1VrS1h3ZXNXbk40dTl1eFdDbXFyamFEMmJwVDNXR0hy?=
 =?utf-8?B?TmM4Qmg3Zmg5Z3IwMmQ2VVFsQ21jTHFlMWg1S0hLNjBlYllBZTBnZVpCWVV2?=
 =?utf-8?B?NmY4NU55bGw3VFNHYVVmRjRwMjl0WXpYeEpCclFVcHdOcTZGZkZUOCtoRjRV?=
 =?utf-8?B?djNqakUzMHNtUW5mTnVGRWpzY1p2QWFteTY1QTYxdGNNeGdKQ2ZmaHJwNjFN?=
 =?utf-8?B?UHcyclQ1andpNGNjaTh4anpxWVFQQXJNb0JwNzZxd3A0LzZtSThIR0ZtRjlX?=
 =?utf-8?B?c2F6WDJwWWcxNld2ZmZGVmIxdk5FSGY4Y215bFhtS1RMZS9oL3BzMlF6Mk5F?=
 =?utf-8?B?UmtNOEFadHFGMmlDWFdOQTBXcUFpbE9rV2poSzRJZlFjODlCeVlkMXBEOEcz?=
 =?utf-8?B?alZYYklMbURnTnVFL0wrek9SbE1VK3loTmorUnRLUHRVb3Z1cDJ1WFhYSTM3?=
 =?utf-8?B?SjZkcWNXVHdYcEhBTHFvVVMvQVQ4Z1BnQ2cyL1luUUhYSkdRaVBHQXlCQWJZ?=
 =?utf-8?B?aWRTYXJmRWhoMFZqb3dTOG13eDE5bG12eW9nenNVS0poeDdBYlpmMlpRQktE?=
 =?utf-8?B?dTBnWXhaQTJqYWl6YzZPUHEydnBQNis5bndMMTRpbGc4WEVFZW5MR05keUhy?=
 =?utf-8?B?ZlhnQi9kdHM5Q2hMaUxadTJzbnVJRzF1bU5hOTJrRUVpVG5XRkdaK1lOVlFQ?=
 =?utf-8?B?M3dUaW9ya0g0Y29MOVlGZ1JyRlFKRG9FR05peFhiaGZTRUZZNlAvRVdjV2VJ?=
 =?utf-8?B?ZXhsOTBFaWcvRmhDMmpBZi9qN2lHZ3pJcmJ6VTRQcXRGSW9ZRFdHb3lRMm0z?=
 =?utf-8?B?NExJR2ZiWmJ1VWpsbk5pYjZpQ2JvdWE0UWIvNTRQMnRiM3BHSzVlR3lXWGNK?=
 =?utf-8?B?MElNaGlPRlk3QzhNOG1xcGJNdDFNd3NORlVGaGthbXBGWkdTT0EwaXNUemZG?=
 =?utf-8?B?ME1ZMmk2THMvckNleHFCMFN1ZSt3VSt6RFVwa0I5N3liZ3o4cEl0QjFTcjdJ?=
 =?utf-8?B?TU9HZGI1QzdOdk5XZHkrNVpGSTh4aWgwemtGd3NoWUx3RW11eDJwSjhIRjZj?=
 =?utf-8?B?Sk40Sm02NWVWK3R5WHJBRE5QRnA4cExUN2xmcW56ek1ZUHgzYWpCOUdScnVU?=
 =?utf-8?B?UWJTTjB5MlR1cnVLd2lyN3JRdkFiVDFMU0JlazBWQWVPTXhJL3plK24vVldE?=
 =?utf-8?B?Vm5YZGtaVWhQT2lmeG5hZ29aK3hCMFBaWUU5UE5oWlM4K0hVNWttVDlRUWMv?=
 =?utf-8?B?MEN2KzJReFZyQ0gzZUVjek43S3llVW1QK1QrUkdJYWFadmJ3Z0l2UEtza2V6?=
 =?utf-8?B?YzZZMk1iVXFBZ21XSmhlN1NuYTdkdGRKejRTTnN6WjNPQmVWaGN2eGVZSHhI?=
 =?utf-8?B?U0hnd3IyNmxhODdERDFFbXZvNDNBTTVMOTBiZmVkbll1aDVzRmUrRGxDVWp2?=
 =?utf-8?B?TVZsWnNSNUhRMDJqN3c3d1ErQ3FPWUtYdDY0N2ROcVppdjFBay9iRnBZRHA5?=
 =?utf-8?B?TTJEM0k4ZkN0c2Z6R3N0WWl3VXQwZkplWlhhN2Jobmo2c2J3SEFoMXJNeThr?=
 =?utf-8?B?dGVhN3MwK1V3enJRY0FzR0NnSk9EcWJQT3ZjT3FiNVE4dlNhVGJ1djRIZWto?=
 =?utf-8?B?NnVXUVBBQlN0VjBtZXYwUGhIRjZMOUpmNWJQclRMUWQvUGM5RzdXNy9Iek82?=
 =?utf-8?B?Y0sxSVpuNjBSdmlJODkvbmRHNG1Id1pBZTdKdDJHdUNqZm4vbHFoMDZVZ3JH?=
 =?utf-8?B?SWx5R01EYmRDVEZMcmpOVXVaSEZqcHlwZEpiWDZYbERYTlNPWVNlZituODBQ?=
 =?utf-8?B?dnBBOXdZbUZHd3JLeEgxTU1QZ0NuSFpLczFaTk9KU2gxaG96MHpqeWpEL3Rp?=
 =?utf-8?B?VHBCWWVyV2VqdzNmYzhDSFpHMUtiNUdlQWtzdzVVTGp0VWYvVmd6RVRPd2tu?=
 =?utf-8?B?M1A4Q05iZjY5WG41cFIzOTN4bUxwd2w3MnJDdjZuWldlNGFHcHYrRnN4b1J0?=
 =?utf-8?Q?BAsI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR06MB10365.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZzB6MDNyeG9PNlp0TDcrWkthTm9LZ3JIWmpvaEJMMzNuelVMK1A5VmJndURN?=
 =?utf-8?B?dG9GR29nS21nbHJRUnZpWitqODJGRHdZUmVKRGduR2drOVJ2TituWUE3dHNJ?=
 =?utf-8?B?dXBNL2NDalBJMWFmUHNOcDloSThGdm15Y3lSSnJKYkZ6N2prckRhZUdYVThR?=
 =?utf-8?B?YXVvRHhIamN1SEgxekVneVV6Y1p6eEM0ZHF3Tm9DV0VmU2ZsdWhndG4xd2FN?=
 =?utf-8?B?ZjI4NGRaaGJUR3FRNjJQVzd1R2dyeXN5UWtNNnFqZ0ZINzB3TS9vTUhNTmhx?=
 =?utf-8?B?Y0NYTko5RzBZbmNENC8wZXlKdDNFd1h2dFFhaUl1R2tBdGJwYmhDUy8raXU3?=
 =?utf-8?B?em5MeGxiRTVrZllaeGZnaXVuYkMvcE9ERysvWnlXMkd5R29MZ2Y2SVhaWFZp?=
 =?utf-8?B?TWs4c3ROeDJ3d0pSaXVjSlpwb0lQWmljYWdIeUhrYytrWGp0b3VMckwvSVUy?=
 =?utf-8?B?cHk5YWZURUlDZ3ZkN0w5SFQ2Nld4QWRqeDhoUjFCVkhFdnBYdEhPY09HU3FR?=
 =?utf-8?B?dGJKQ1Z5Qi95dDd3WGZhbi83VEdPUWlkTkdBM0xFZTV1NUl2ZTZvVVk0SHVN?=
 =?utf-8?B?REJIWVlRSUpPVVRsK1lHazJHMjF5TnNIVnBYQlVLNkdCelRFZkRvYkw4bHV5?=
 =?utf-8?B?SWVreU5wTDVYTTVJK25BUGNhZ29pZHFaQldzWGZ4aTl0dWhsdVdwZURzb1JX?=
 =?utf-8?B?ZjJ6MWh3VUhRVVo2ME8vMGg2UVZxS2pXNXVaT2dKSk9SdWFMek9NaHlKUEhY?=
 =?utf-8?B?SXNBY3IvK3dXZ0NrRi9yN3BSblYwait3dFd5UWRzZzlkTm1pNlJhMGV0QXRJ?=
 =?utf-8?B?VU9nRGtYa0xkVkwwWVJkV2hYNEJMeGJlcTRMNmk1T3gzU09TalhBM1VtNTNr?=
 =?utf-8?B?ZGl1N2VWSkpWaW0zZGtlcVJVL1UyK1l3ZnJGQ09NWWMva0U0aHkra1h3VEdV?=
 =?utf-8?B?V2xwSkc5dE4zdnFtclhReWNWY2RGd0pqbzlOU25rZjdjVGs0czF5MUpBdmt4?=
 =?utf-8?B?WnQ1ZTJpVHNJNldDVVN3QlJ3R2dUc1JxUmhMMHhWSFE5WGd4eWlzNUNaTk01?=
 =?utf-8?B?N0ptNTVFOExjL0cxVmRpcHdMRW1HajF3djRORmhuby9zYmVDRStxSm9PQTkz?=
 =?utf-8?B?dDJ1WE96UVVpYk5rc3krMEpGdFRkbkhEMURDbmhWWUNpNE1kYUZhbU5FQTY4?=
 =?utf-8?B?WnRzR1pBMGduQmhEMmtMRVZKVTBScE9QaStFRi9WaXlwTDZqOVpjUmppVjVR?=
 =?utf-8?B?N1JUQm5oWTJlOE53YytqV0lRVWpQOUYyZ3UvTzNsTHllbFJXeFJJeVBUeENM?=
 =?utf-8?B?NGsxd3ZTbnkrYzcyWFBwQnBRZTZPVVlwSzhhQjZRQ3JpcVpKaHlWYUpIYUFw?=
 =?utf-8?B?dDA3RWEwMGZpOEZFdnQ5UUN1aEdXa1RNTWhYLzViaWc2MkwvdEZwVnBRUS9p?=
 =?utf-8?B?VFY3SUxnbDcyUVJOWkF6VWkrSy9NVFZOSEQ3UTkybm0rb3dnNFoyNkE1bzE3?=
 =?utf-8?B?Y0ZvcG45L0tkWCszanlIMm9zWnlPTzZ1MEFhNk1lQmUzZFFISW4ycU1ST1Ri?=
 =?utf-8?B?cXcrQkJueW0yaUdYRUlyNGR5amo0UVQ5NjR2bWhjdE1QaXptNm5qZllXbFJk?=
 =?utf-8?B?cDdlZUdhSE1neC9DWE9oa2x1OVd4WElWcGR5TnNhSXNpM004WWxFVXNpT21m?=
 =?utf-8?B?UldKNGlpeHovQUNWTWx4WjhmTTFzYld3VTl1TUJWWm5Ib3BUWjk4eWl2L2Jk?=
 =?utf-8?B?MHQ4MmpEeHI0bVVtQjA1YW9jM0xWSGV1S1psOG1MT3BuSWZKWU00eUJ4dTI5?=
 =?utf-8?B?Tkx5ZmVmWHNXYVdJR3dGdlA2UlRidVpIbGorNUZMaUNUYTJJSlpmWUdIeGNk?=
 =?utf-8?B?Q1NDYm1Gd0lDQVdvUUdpS2ZPYXhHUjZvRGxPRTFRc1p5cEwzSXVmV05HdGVr?=
 =?utf-8?B?VkhDNTJUZ1ZNNEVqb3VyWmd1OE5mRTRQeStRem1yTG9SaVI5V1JWU09zMFIr?=
 =?utf-8?B?Z3dlQldPcTFYMFRHZjhNK1N1VEZFQm5CdVFtYWg4RXpJUnZUVVZHSVlzVE1z?=
 =?utf-8?B?TmJzNDV4ZXFDdTR3d2VYVnNCS0VuTVdoQzFDR1V0Q1RpN1RtMVR6SklwV3M5?=
 =?utf-8?B?UEx3QzZoUFUvcTdUN3JHSjNxbDVsT2ZwRzUzOTI3QXVlQkdkNENWbGpydmR6?=
 =?utf-8?B?b3F4OTM4VUhxZU5PVHJXdWFxSGYrbmV4Tzl0cDVJRHNzRVNIWXFIRXRKNm91?=
 =?utf-8?B?eTFYdXArbEtWejdMQnQvejBSVTJFenVHOEZDSzFjMmRiN29wd1ZZc2Y1eWU5?=
 =?utf-8?B?VTRYMXUzUXN4RVk2aVVYcXZ5d05MTERDZnVvaXhvYm4wUTF4QnFZNWdqeHlZ?=
 =?utf-8?Q?MIjo5htivI1OOSqQ=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07d128fb-b259-4b64-dddc-08de5f1650ba
X-MS-Exchange-CrossTenant-AuthSource: AMBPR06MB10365.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 09:10:58.2685
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /HggUpeAaNr2ohXUD+OWKkist8D010lh0LrrhqgjRRByLPXSTQ4WA6mZNLgwG4CPMJ6N/q65yKFgRXgEluE3pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR06MB10252

In many situations it is valuable information what
authentication method is being attempted when autenticating
with SMTP server.

Signed-off-by: Tomas Melin <tomas.melin@vaisala.com>
---
 src/b4/ez.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/b4/ez.py b/src/b4/ez.py
index 298e382227eb..581d51357de1 100644
--- a/src/b4/ez.py
+++ b/src/b4/ez.py
@@ -2193,7 +2193,7 @@ def cmd_send(cmdargs: argparse.Namespace) -> None:
                     sys.exit(1)
 
             else:
-                logger.info('  - via SMTP server %s', smtpserver)
+                logger.info('  - via SMTP server %s using %s auth', smtpserver, sconfig.get('smtpauth', 'basic'))
 
         if not (cmdargs.reflect or cmdargs.resend or cmdargs.preview_to):
             logger.info('  - tag and reroll the series to the next revision')

-- 
2.52.0

