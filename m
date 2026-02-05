Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 639B83314A4
	for <tools@linux.kernel.org>; Thu,  5 Feb 2026 09:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=10.30.226.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770283581; cv=fail; b=uSsohXOCZVGybO/M3nsgpv0HcP48mwyDyVZZEqYzB/0H+Dr+3+84p7Keqn+Xkxlm4duXlEuW1Qds9pGiVa3Qhx6jbubB2nkJOZDPDUTNLPwSizB02Ymv/jIZ93r4ZANv0wiGYkikHVd9PDH045Rv97MxtgQXeRTtwGv+kmGKFbU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770283581; c=relaxed/simple;
	bh=22QhK5jZWww0BEYKo6liYjNwYxTpIbkj6CY2hxKCuZg=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=o8/uCY2dYimMB1SqyUZHHlyOBIAcmh4j64V8eJmIAhWCTyLxmOL7gcRLHP4dk/xPCWBfP82sqrPG4GzEYeqbOVc3drnreyD+BRq0LBwoqxnxJM3LVa5mq1FGMyaarv0jjxAK0SjZR/rtmPHBNTZOuxlSgxEIvHm/AHOeTwLguNM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b=gey9QsPh; arc=fail smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b="gey9QsPh"
Received: by smtp.kernel.org (Postfix)
	id 1EBD0C16AAE; Thu,  5 Feb 2026 09:26:21 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11023118.outbound.protection.outlook.com [52.101.83.118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8EEC6C4CEF7
	for <tools@kernel.org>; Thu,  5 Feb 2026 09:26:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8EEC6C4CEF7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=vaisala.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y5mdmI4gTl8sK7rqERpC7r7oGF9HYj6WO9hSgY1jp08tK7L1ItidM2o+xQco4YfML0dL8zuS4vbvdGIudYol5Wwl98RPoMEdrnuCGYfaFYC6dAToo38LCiSTE9Kc4gr82MRVgMg27MLzic7EY8OBrDD05jukM+QdHwYODNbe9NO9kfwN28MXpjAAWjYGchVFkIKIsn7ZBg7j+qEzGam07vJUUhZOWg1cuOtyvKlVnclG17mrhtKyX+oM/8CfBkXXa0M4wcsR73JdzhbbEjgOJR4ErHiLow/1P9yEiSv1/xH9Ov6AmfwAdp6snhGOA8cJay8yhl87q1k8K/+OygHkoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pL+2Oh1QwIOB68l0tLv8q0NtBz6dpJJ0wMCPsB3hwRA=;
 b=SXwsX6i2uzNAr1fRYftRFe9zPgv0XJRPA6yyxWd4CVjSCUbkcpT9pt1um4XAm0DHxU6NRPwNsVG8vNjeTDtWjYPec4v01p1HGbEc0aqCQja2GXGzzeTux8musuzT9SSxNFrEN+i0llOuzr6ZyaxgtoxxDb0tKVmxxJh3MxxWc2J/z7QS9kmH7QOO03LevkCM9S/aNwppYnT8trnMARfhQZJaXuCM7no7hp5eSN83dmUmPB6BwzAEKqP1dq6NSe9G7NJn1HG2gPFv+2WVWx+SE8o+FJE4w5Aq4/Rf9f1E1LK0TgUA6jHB+iYJGeUYQ2cLAqBe/SzeY8isiacvv9YhAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pL+2Oh1QwIOB68l0tLv8q0NtBz6dpJJ0wMCPsB3hwRA=;
 b=gey9QsPhPFepEvYicN9BfOvndJ/wcP1j8SXVMKjVFECH0Rq/80e2cMNWUDsbYhckAl1AAuY++i78Vb4g0ojFhriMY3MQgGWhNSuZXaNcwKHG07T6CJQOlsg3ZY8hJF032ncC+aH8il2Tsl/LW9xMcz7Wt61llg4+//9WcdnaB1QpWH+3WiOMuBhykROMaMcrOZUi2TfTezw+2cMkkk9ZGLPDJBDTcEFrqKzoP/lRBactdmdi7rYl+7YgyncVwHzaQW4DRUEiAZe9FT9maurQi3pGOkYNGd055dyDBOkuNfMo5HnY9WYcEUg4yHf4BT78kh2ejjb34Z5R8/tE8xgqWQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AMBPR06MB10365.eurprd06.prod.outlook.com (2603:10a6:20b:6f0::7)
 by AS5PR06MB8597.eurprd06.prod.outlook.com (2603:10a6:20b:679::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Thu, 5 Feb
 2026 09:26:14 +0000
Received: from AMBPR06MB10365.eurprd06.prod.outlook.com
 ([fe80::addd:5e9b:7273:8049]) by AMBPR06MB10365.eurprd06.prod.outlook.com
 ([fe80::addd:5e9b:7273:8049%6]) with mapi id 15.20.9587.010; Thu, 5 Feb 2026
 09:26:14 +0000
From: Tomas Melin <tomas.melin@vaisala.com>
Date: Thu, 05 Feb 2026 11:26:01 +0200
Subject: [PATCH b4 v2 1/2] ez: add SMTP authentication method to printed
 information
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260205-smtp-oauth2-outlook-v2-1-6a5eb233b285@vaisala.com>
References: <20260205-smtp-oauth2-outlook-v2-0-6a5eb233b285@vaisala.com>
In-Reply-To: <20260205-smtp-oauth2-outlook-v2-0-6a5eb233b285@vaisala.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tomas Melin <tomas.melin@vaisala.com>
X-Mailer: b4 0.15-dev-a0347
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770283571; l=1048;
 i=tomas.melin@vaisala.com; s=20251125; h=from:subject:message-id;
 bh=22QhK5jZWww0BEYKo6liYjNwYxTpIbkj6CY2hxKCuZg=;
 b=QDc4C86nmQBXfq7d4wObMJvWTujgeptTeDTxvbFeImP+0PWJkvJNQxm1sp5iTtUxv3Vujt4AL
 RZpJvsvp/f0DacA01+1dJXMb6KXpYvrEHiHRemlO0a04KdObteCX4/C
X-Developer-Key: i=tomas.melin@vaisala.com; a=ed25519;
 pk=6lMiecjZ+OeyZuxYsDm/ADy9D1JKvYrKdsYv58PMepU=
X-ClientProxiedBy: GV2PEPF00023992.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::19a) To AMBPR06MB10365.eurprd06.prod.outlook.com
 (2603:10a6:20b:6f0::7)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBPR06MB10365:EE_|AS5PR06MB8597:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b66f3b9-e48b-40f2-df26-08de64989ad6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NktvMU5rYURDQUlTMUVNMHVGdmJ3RFlkUWx5MVNGWGZjUVIyM1RqdUVJcGF1?=
 =?utf-8?B?S0RwL1JJRnZsdFAvL3hudG9HOUhPQ3VQcFNrS284QllQOGRuVWtibDN3eDBP?=
 =?utf-8?B?Tjd0aXBsaXc0MzkwMFpUdklTWmFpaWZRRDY4RWlDMWZOWk9rUi9tR0lJMWdt?=
 =?utf-8?B?alJ3dkh0SnJqbVpienhxaGZvZ2g3ZkNxeWMza0xJaWxyNkl6QmVCak8yeGs3?=
 =?utf-8?B?SUdDKzFEOG5lU0NHN0RNMWx4UDNRQUtIRnB6bVB4bU13SzN0MEk1SFh6S3JM?=
 =?utf-8?B?a3JzYTFWU2VtZFNDdzNkUXViejY1dkgwdmtMUDBMVHU0VE9jNTVmM3VnNEQv?=
 =?utf-8?B?dlVpRFRsZlEvVGUyc1NHbUtRM01jNjVrODdVcVhjaVZRcG9tT2EwR3lSczhS?=
 =?utf-8?B?UkxYTktqUWtUNVZuTUZHSFhhcFhhTVhxMC9WZXp4VUdkRmQ4UXUxR3VuT29Y?=
 =?utf-8?B?T09ReGhRWmRNQzJVTHBlcWFselR3L2c3MmgvcTVIOEc3QUtyZEpYUlRrWVY4?=
 =?utf-8?B?ay9yZkJETFF0aHFkWmRua0FJMXdwK1lZZlJ0TUwzV0grWEx1RWcxc3NvRlFB?=
 =?utf-8?B?eUoyWC8rK0VKandrYnV4ejJMand1VmVaY25DcWVRbE0wbmVibUhyVzVaVmJq?=
 =?utf-8?B?alBBc0Y0ZEh3Uy90NFZHY1VJb1hwYWk3RnRiVXo1bzVUZmpOM3V1VjBXZjNi?=
 =?utf-8?B?ckR6V1NRWHRMSUVVeVdUVDRFTE9OVzBoSnJ1d3FibkNkSkxWUnpQbDlWNDRh?=
 =?utf-8?B?V0tPTFVLTlFPa3czdG02SlhkeW92emlnN05VYUdVMmZ3UGswZ1ljTFRpZ3lX?=
 =?utf-8?B?TGVTQmI5d24yVnRlYmhZeENoNkw2ajBiOGtoVmVuTXpNeFBjQ1d0QXFZREw4?=
 =?utf-8?B?U1A5S1RhejBjMFBYQk9hSnFxaXJWSzlEdGRVOHU3SytiZXNqYVk5WHRubmIr?=
 =?utf-8?B?UTVRNEQrN1hTOVQzMXRzU3M0VVAxT1dlSy81d2svY1Q4VU94WkVrZWxVenFr?=
 =?utf-8?B?VmkxdEUrYlAxTExGaGl6Q1hPa3RMZW84OHRUcVNHeGg0Tm4yU0VYV3dudUt0?=
 =?utf-8?B?T3lZOXlkRTFORzZNUUZFZGkwOHRod0NhTmd0YW1pT0pKMUJIQTRRS2xGbzUw?=
 =?utf-8?B?NDVxMGFFV0Y1NmFOWG5vUUNIcFlVeFhGNTQ4WmF5anZqNkVVeEVqbnJGYlUw?=
 =?utf-8?B?OVhGMThVdXJwMmNSOExZTTErMkFENEcvVjRBSHJja0V1MHpWS1B3VWZWM0s0?=
 =?utf-8?B?TVlHS05ZWTl4N3RHVE1MYnBnNUNxMWR5bVZjOWtFMVhzUXRqUCtaeXlOWjRM?=
 =?utf-8?B?N0xzenJ1YjNZclJJeisvQWxhNTlDdFpSZU9UcTByWWh2aWJTM2FKQm85WkFK?=
 =?utf-8?B?UVhKQXBjZTNrQXR4VzVuQUt4NC9JQWVBWE55LzdOK3dONDdCNGFEMzhMS2lK?=
 =?utf-8?B?WFlzbmsxN29NZEN6STNnTWhHT2NmMGN0dGVJT0hsdlN0SWVFQ2FjWWRXMVRx?=
 =?utf-8?B?c0dLckUwQyszTzkyK3ZCQkxUN0d6MXNLdzFOZGdDUzNSY0xqd1grM2ttZ3Q1?=
 =?utf-8?B?Wm12TTJyaDNVeFplSFVHd3hDMmd3d29zWnN4dldoMHd3a3ppelVSQzJuTkhO?=
 =?utf-8?B?dTdrdmZWWGtBZlEyWWg1ZUFzWkFBY1hkWGpuQXdqMXdsZVhNRnJXWnRTK1NQ?=
 =?utf-8?B?NnF5bFFoa1AvanUxWUkvT01qSFljSUdzaHhkVWNLdnNsWkY1NkNaclNwUEZN?=
 =?utf-8?B?TGxvME1sZzlaZENHbXdZZEptc0FQWHJjSDRCblVjbVkzUzZVZHJ6WHhMQVFu?=
 =?utf-8?B?UEhsSy8rNjArcTdPcEZPNjdNblVDVlhZdmNlS203YVdvdmVzbTByckJVM0Fm?=
 =?utf-8?B?dzVFOCtaZW5yV1RkcWNkZVl2YnY2NHNEWHR6ZTR5Z1VDK3djYnJxYmFwYnp3?=
 =?utf-8?B?aEN6SDlXWHRlSURacnEvWEp5dEFXaXRzeEpNYnRxRjBJQ1hja2xWTzNaVjhD?=
 =?utf-8?B?NjIycE9Hd0FjWktxOGkxZGUwbHExQ1M3V1VqUXJvZmFLd1NGSEV6UWtQajR5?=
 =?utf-8?B?cXB0U2Y1ZnBFcTJxRUZsODNDL1pmd24xMmhjRytOTGNIUzY2UlhNdzBVa2tq?=
 =?utf-8?Q?qKO0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR06MB10365.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UTNKQ2dkYURhTEZlZTBIUkFhakJnLyttQjNjZWpMUlNrWTNiWTQ3NmtZc291?=
 =?utf-8?B?UURQM1ZyZTVvRVcwdnZXc3U0UTRXOCtyTWRIb0dEN09LMzJEeTNFV05WYThx?=
 =?utf-8?B?aUtONXJDMDFMODd1VFlXbnlCK0tPNFpXQW0xSmlmOFExL2FBU0l1bmFwZnlk?=
 =?utf-8?B?RFd0aDErTCtNaTEwdDNzODBIU211bkJwTnZzdllUTVQ2eWJTOTVWcWRBdVkx?=
 =?utf-8?B?UXZSQWZpTlViYnRqL2ZXNGVhQkIxV3JCQzIvNTRjVkZBbkRiek1nOGxPVmRi?=
 =?utf-8?B?SzNwcGpwSzBWSzZlZWdxSHgxY2VqcG5zdDJZMGRTQnc0TU1wbnZPRGo1T2Ju?=
 =?utf-8?B?bU44ekJBRWpNS1hSdUlrS0dqMVJCb2JCMDYyeDZpZHhuUUs1RzFrc1dSeHRH?=
 =?utf-8?B?aVA1MnVrdDA5WE1ya3lhNEgxUHNXSW52aFdtVTZiUzBxOFpRWnpkU2s0OTNP?=
 =?utf-8?B?bmtnZ004KytiYkNLUWc2cSsvVVkxd0MwY3hOSGExczJRYnVhZ2ZaVld4QTRz?=
 =?utf-8?B?eUh2WHR4cGw5TmpXR1pkZEhDUW1QbGZCU1dLVkR1ZEk0b0FPMVhjSUFDbEFI?=
 =?utf-8?B?YTh2bTR1RGxDeFJvVlBVbTRFNVhLS3BjbWcrS2NHU09Sa3pHZDl6cXhPU1dx?=
 =?utf-8?B?bVZLeTBWWW9RN1ppMzJqZFNOUGVQczVHcnczZU9BRFgyZGhiUkh2Tkt2dkN3?=
 =?utf-8?B?K1E1TnRhM0doZk0rQkNvTzM3VXFUcG42ZXRRR1RFVFRCaCtCR1piQ1NhOXU0?=
 =?utf-8?B?dzZ2cFI0Vm9rNW1mY1BQWWZwVjJ1RkFaU2ZxUTFJL0xob0M3VitXRXRZVWhl?=
 =?utf-8?B?WUR2UmoyRDN6R3k1L0xlY2REK3lGQVUrVEhZamFaeE5jQjRSYVk3MlcxZ3pQ?=
 =?utf-8?B?QjBrdlk0aUVLcnJjc2Jocmw4VDUwNDRISEljeUxjNFlKRlVVOXN0SEdjek1V?=
 =?utf-8?B?WVRKbFcxSFNBVjUxazE5M1JkaVJ1dnNwWVFCc2pwQ2VCeHNlOWtocFNQVElt?=
 =?utf-8?B?QVJTeGhqc0UxUjZtZVQ5L3JYTnY3VDhUYXNHT01OQjBSQ1dyRDIySEUyUkkw?=
 =?utf-8?B?dW1xVlprK29KUjdHRCtFNXFldFV1R1ZaeUJlT2xPanlQRFQ2bEhuYzFEcjlT?=
 =?utf-8?B?VWllVzJHQ0VXUWdZemtqeUgxRHZxTFcrcVBUOVUvWkdQdUI3bjROMGJLV1gz?=
 =?utf-8?B?MzZhaUxaOVBTL3VSZ3hPc1NrK3ZIMUQ0bllwVldTSkg1R2Z3aE1GS0FOcFNW?=
 =?utf-8?B?SFJTaFRxOEN1RDUxbUM2U01YVlFkV2VhMGNuTWMxZStadGc2SVFWU3NCck1N?=
 =?utf-8?B?bXp5RkVhOWhHQWo5TVpyL0JOMGV2OXIwcURqSkFDTHg2Z2hHL3FlejRidndC?=
 =?utf-8?B?bWdmdjdHVXpMSDB4cEw4c3F5M1ZVTzN1d095UGtWRk1aRTFNN2N2OHRnYWtW?=
 =?utf-8?B?aFJFWjB5ME9WYjVuVUdHQ2plY091TFdYdEw3NWZrb3p5V1I3Y1o0OGlnaVNn?=
 =?utf-8?B?U2pMai9QZml4bE1Wbkg4cWJSVm5lYjR3VVQvYWVZMEpVU1VOV1JqQU00WVdE?=
 =?utf-8?B?bTZTbmZSa3J1eUo3S2h1YlVpSmlJcTJVTDh1c3dWOHdoN3d4ZE95VnhKZ044?=
 =?utf-8?B?MmJDVWdzS2JFdnRkODZOT2xMYWJMU1N3MUtONS9NMWFVRGUwc1BnQ2tCYmh5?=
 =?utf-8?B?dkQ3T2JwTDl2MUttcnFsa2F1dGRDbWJ3bkJaWDluMEt4Q1B4TWdJRUlva3Jo?=
 =?utf-8?B?TkdPd2Z5NlJFdW0xWWYzcyszd3lRQ1p5QnNEZEJLSlgrQkdWdjV4aWxrdlBN?=
 =?utf-8?B?enp1QUpHU3RnQ3BwVzk0dDUvM1RQaFZ3bGFuMGZTUGpTOG5OQWJGZXk1c2ds?=
 =?utf-8?B?bjR1aFlPOU8vUEZzdmlTZnR4SlRuZURhSk9YMUdsOTZWNEtPWGJtWHRCaDIw?=
 =?utf-8?B?TmV1NkNYeThlRzR5QjBQcDY5ZHcvTHNWNHloeXMzNnF4OGczRjBsN2lyNi9s?=
 =?utf-8?B?bExXY09uQXZ4cDNPbjQ3SzV1anFRZW1EOE1tTHdBTVNOSHF2dXlxSUkvL211?=
 =?utf-8?B?NTAxY1BEZWpxOWVsQkpMTFVtdC82NTZUMWpnTWl3SWQ5empQb0dKVmdIUjZC?=
 =?utf-8?B?M2RhUURUSDIwbnJDTllUNTY1RFd6QUF0S01nMUJwQVdxSGVyVW1KQ2JUSkNR?=
 =?utf-8?B?UkhjL244RS9BUFYveitRZi9jL1ZhSTd5SVB1MjB0MEhEODVOT1BaMmpxTGdV?=
 =?utf-8?B?T01MQlFpK3FoaW1rVEFYcVNmU2hsYU1KaVNMMGw1MURDRGFNLzVGeVlQN29W?=
 =?utf-8?B?UWJhQ1dNQ3B3eG9HSk8xNG1tQWV6ME11SzNoSUtIR240OVl6MU1MNmxtSkdw?=
 =?utf-8?Q?TU5B74uaUbTvNF0U=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b66f3b9-e48b-40f2-df26-08de64989ad6
X-MS-Exchange-CrossTenant-AuthSource: AMBPR06MB10365.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 09:26:13.0068
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IEyHYRZ2xiniQMuCxcsfccHIU8P3EkbM5lfYgSGyyVnZ5rGwClJSlRj/uhgdpgAnnU7M663FywO4I8eVirb/gA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR06MB8597

In many situations it is valuable information what
authentication method is being attempted when autenticating
with SMTP server.

Signed-off-by: Tomas Melin <tomas.melin@vaisala.com>
---
 src/b4/ez.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/src/b4/ez.py b/src/b4/ez.py
index 298e382227eb..758220a54718 100644
--- a/src/b4/ez.py
+++ b/src/b4/ez.py
@@ -2193,7 +2193,11 @@ def cmd_send(cmdargs: argparse.Namespace) -> None:
                     sys.exit(1)
 
             else:
-                logger.info('  - via SMTP server %s', smtpserver)
+                smtpauth = str(sconfig.get('smtpauth'))
+                if smtpauth:
+                    logger.info('  - via SMTP server %s using %s auth', smtpserver, smtpauth)
+                else:
+                    logger.info('  - via SMTP server %s', smtpserver)
 
         if not (cmdargs.reflect or cmdargs.resend or cmdargs.preview_to):
             logger.info('  - tag and reroll the series to the next revision')

-- 
2.52.0

