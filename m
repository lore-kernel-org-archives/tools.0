Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48616480DC7
	for <tools@linux.kernel.org>; Mon,  5 Oct 2026 13:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=100.103.45.18
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791205732; cv=fail; b=heuOiAn2zkl4YBG2ZhERmZ7g1HrmT/m9KirdxAKgQDXuDX2KoROv8VYFahpVL3IvmzgrDw9RjVUAPPWvg9Cb7lpgnndbFOqRxaIGtwuHLdOY455iVDlzcWL95UWYaiOAGiUhpLWCfftEnU6SE0Zzzn7txRc7rNjGpD4B4EuELcE=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791205732; c=relaxed/simple;
	bh=Qf6TwLv2faufhaRpyE9shChVSH9ASD7n/PrYy9EYbQA=;
	h=Message-ID:Date:To:From:Subject:Content-Type:MIME-Version; b=WeoZWVIea1N6k7MAn2OaVgrZ6ptCXaEbmHXMhJfVTvcjfztSP5Ig23U4YQbjJhItqItygaSoJWRQMlxcktZK64flnBU0vQUcl7TyN/LMttD6CMiShVtvbO0hcKEZlzhziK6m6tKEapYIA3s0t0wzFqUFAIT54TS+wFV5YgQVcck=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Z9NRP5h8; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Z9NRP5h8; arc=fail smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Z9NRP5h8";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Z9NRP5h8"
Received: by smtp.kernel.org (Postfix)
	id 0C4141F00893; Mon,  5 Oct 2026 13:08:51 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=2 smtp.remote-ip=52.101.72.48
ARC-Seal: i=3; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1791205730;
	b=qyHoxFJyLjFuALoJlYRFg2o6D+xWk2DLutB86MRHlaS8uwbVs7T12llsj2ok4UYXUlr3
	 t8f+7Q08IT3yWIBJBxdm4crPhYL5xOIxJVkcnP9BdZ5n2HV+T/GylrrTl+4qGi0BcyhjA
	 csSM8Fi+CFLWmYKe/qzlAK3Te/PXDeoztbmxGc/c6XeKkQ59nXQn7uAA6fIDg59XdrpII
	 axbK04I1MMM/anl/EFHiY5axnAm20ydgjskMAdThOS4Udue+t96gpfpflwzEvTYDxtxnd
	 qKqel2qZUKTfNAKQmVaM1qNcE2g72wG292OihqRLf+Z+iibjy3FVgNyjAjIHy8JPc0g==
ARC-Message-Signature: i=3; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1791205730;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:
	 DKIM-Signature:Authentication-Results-Original:Received:Received:
	 Message-ID:Date:User-Agent:To:Content-Language:From:Subject:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 x-checkrecipientrouted:NoDisclaimer:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam-Untrusted:
	 X-Microsoft-Antispam-Message-Info-Original:
	 X-Forefront-Antispam-Report-Untrusted:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-EOPAttributedMessage:
	 X-MS-Exchange-Transport-CrossTenantHeadersStripped:
	 X-MS-PublicTrafficType:X-MS-Office365-Filtering-Correlation-Id-Prvs:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=Qf6TwLv2faufhaRpyE9shChVSH9ASD7n/PrYy9EYbQA=;
	b=tMO5Pwu/k601DLdDoCcpC3RvTMIFLvCKUaPMc9+wM5lUBa7MfD3Kb89nn+aBlZI4hoD/
	 uisOs6NF4Wg2k/0rFkeY7/NxIoT23CrycdRS/OnNCrdx0YY/SE0D2mhevCDTBOrNUdoI0
	 sWcwog9MuL0bdoxCZ/iHjj/nqS6Zy4gwHlVJYzIk/o9rL2sgoGSfhF6+RSjfkPl/K5sqC
	 UNcj2mk0Vkx+FO/+0l6d3Rdomtt8XX3FZu5MT3OrMu0UyObj52mgqmR0YJz2PLcBe4X9I
	 MrnEeQhSbkS7rw8rZpO0EOKVN8hNbeUmPjBrzfVR/sdjxmcVdSdnpuK9YTbNdJrYi4Q==
ARC-Authentication-Results: i=3; smtp.kernel.org; dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=Z9NRP5h8;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=Z9NRP5h8;
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	arc=pass header.oldest-pass=2 smtp.remote-ip=52.101.72.48
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013048.outbound.protection.outlook.com [52.101.72.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9453B1F000FF
	for <tools@kernel.org>; Mon,  5 Oct 2026 13:08:49 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=Z9NRP5h8;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=Z9NRP5h8
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 9453B1F000FF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=cfSkcCxSBfXBdRDz2qi+i2iUbVSp0tbfKdsLsJnqOMh7nV24zqpltDKg1r6LplKfrED0FYH6PMFgv5a/l05NiP6F5vd1m3yZlQRfes6GWgF0XJLVcyKoyGLossFKUKWUra8uH3HKCo/64fmN1045I/fuw2Xv2XEmmjOQMwUqxFcIdiNjn+sL89fyhXNEvtue4ZrYd4bwZYTMRM2P619cZh7jwtpEGunx0YvpJtKoyq3zGGe0D+z4Jj2TTNysxgOHXUIM5GGg5eVeK9+nltou3/f/CjC7A4C26h6v3pzT9Ai/rnE99TmyZgDg4NMP4LViCHKkhvma7nWNu5BE654dwA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qf6TwLv2faufhaRpyE9shChVSH9ASD7n/PrYy9EYbQA=;
 b=YA+IBHU3NA9kds1JbxTIx5VKH+2nOwU8yfPw1nrRneUOsKLtiUvIarzqfA36VLrsvvE7UnGbkQygzWSJR2foos/NcQSWyH7SiRFfSZ6/GhJG8znHstu53esajTRHKPPuYlR/WmEKDjxCDyyhcvgxvTaqa/jOl6Lv0UIoSVuyAW5zAKLEPF/QZBONKQc7jhlhOqB6nRXGOFQD2onQoUxBn8z9ThkfthlftaufswvzQzyfc9CK2tCGEYTR0TnGlDjOsOpl5JzMEXwErS0irmKkVg3mUSkZrf9XuviYpnAhJ+fVsvHL4RIksAno2iPaGk59tmQVbwsXYaPO0fXCcDmEDQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qf6TwLv2faufhaRpyE9shChVSH9ASD7n/PrYy9EYbQA=;
 b=Z9NRP5h8mxyYjdBR3p4KnRM4T54DBSIMpAMEHXKxAaRJEEtrGXf09nEoAiajcUi/sv3s7NXKovR0MRobmh/u2Q0PM7S/FOu/dqr1NoycoDKtq5JXAnPmyfL1ZDVpuQR8YNe9H8u11Ce4QmpAGU+2Frh7GeUTPh7cUU71XiY/zfs=
Received: from AS4P189CA0004.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5d7::7)
 by BR0PR08MB197270.eurprd08.prod.outlook.com (2603:10a6:2c8:45::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.14; Mon, 5 Oct
 2026 13:08:46 +0000
Received: from AMS0EPF0000056D.eurprd02.prod.outlook.com
 (2603:10a6:20b:5d7:cafe::62) by AS4P189CA0004.outlook.office365.com
 (2603:10a6:20b:5d7::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Mon, 5
 Oct 2026 13:08:46 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 4.158.2.129) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF0000056D.mail.protection.outlook.com (10.167.242.123) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14
 via Frontend Transport; Mon, 5 Oct 2026 13:08:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NUTrsFvNvRgBxob+moaOzBiCz4eoqbvWn44TqImNgPz+f/g/TajycnsuCkp2+Vdz5cviIZSiiy7tsivFhBV2tZOlykaGzBhgF2xf/j2eM5u5rqHdW/LmgFiV3Yfjv6CHn6lo9NuLsTUn7SpsPskzNCcPeZSeZKRn4dIT5xKoCvVvzNjdQMG2CWOOZAC8KhNqFChczEQCfx8wqGfUXOWB/fCHwsm8ypVxrsfIN/bI2evLe/tfjJkgNAY4qC9uuuc2BFerZPZZRHBXoEQAZIjj5XcdWAOWyLNcZfrkwB41XRMAnagPmQl3njqNMhhzVChP4Uc9YPdO9Y3YENPxqJTmuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qf6TwLv2faufhaRpyE9shChVSH9ASD7n/PrYy9EYbQA=;
 b=YuOx3VcX8Xr9fj52j2KsSFGGVAF99nWsRg0mGGHe8lrTXT1QfmovnPG/u6roLFnamw64LQJwMvHoizRR7L1TKPi9G4MXCBChl/xtGKBj0dipxd9uXbLD9xfCwwYzYg1+LgiJ/BhL+YKEYf06NWOw8ha+xu67//Kcjp+qzUFVMf4HZtc2sZc9V9olbTyXJn/w64+HH8c1PckVsxQk6gEkENguEaIci3es6BzniDKHoV5I90DVa9j5mmAkfIXTBjJYcSiEHkbjSBwhBNfmzbNKBm21ar+lyv8egRJhXjKgBb9MXez2TONkAHWJrGnpJLCA885LbhUKgDeIqvyaTiIzGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qf6TwLv2faufhaRpyE9shChVSH9ASD7n/PrYy9EYbQA=;
 b=Z9NRP5h8mxyYjdBR3p4KnRM4T54DBSIMpAMEHXKxAaRJEEtrGXf09nEoAiajcUi/sv3s7NXKovR0MRobmh/u2Q0PM7S/FOu/dqr1NoycoDKtq5JXAnPmyfL1ZDVpuQR8YNe9H8u11Ce4QmpAGU+2Frh7GeUTPh7cUU71XiY/zfs=
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10455.eurprd08.prod.outlook.com
 (2603:10a6:150:16f::10) by VI1PR08MB9982.eurprd08.prod.outlook.com
 (2603:10a6:800:1c4::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.14; Mon, 5 Oct
 2026 13:08:11 +0000
Received: from GV1PR08MB10455.eurprd08.prod.outlook.com
 ([fe80::af66:6019:a08:d04]) by GV1PR08MB10455.eurprd08.prod.outlook.com
 ([fe80::af66:6019:a08:d04%5]) with mapi id 15.21.0496.010; Mon, 5 Oct 2026
 13:08:11 +0000
Message-ID: <a7c5f068-be55-4df4-a7f2-5a4e44957b3c@arm.com>
Date: Mon, 5 Oct 2026 15:08:09 +0200
User-Agent: Mozilla Thunderbird
To: tools@kernel.org
Content-Language: en-US
From: =?UTF-8?B?QmVuY2UgQ3PDs2vDoXM=?= <bence.csokas@arm.com>
Subject: [Q] Release calendar archives, EOL calendar?
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P123CA0223.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::12) To GV1PR08MB10455.eurprd08.prod.outlook.com
 (2603:10a6:150:16f::10)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GV1PR08MB10455:EE_|VI1PR08MB9982:EE_|AMS0EPF0000056D:EE_|BR0PR08MB197270:EE_
X-MS-Office365-Filtering-Correlation-Id: ce8178a9-1b50-4d9c-ed55-08df22e1c94b
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|11063799006|56012099006|10067099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info-Original:
 6gXfiacoSGpxajykzC16qa40cfsLm7DgaQFkA3abCRB/6UjTDwcB6CO2gD2FP0UGa2IBwexkZYr/Ii1B5hyJ0n2j6ht3Hlys5elJ41TnLY5aLr6KM4UZ3XU2A20FZuhQXS4igJU5PNx25lY12Kb6VqYDype347ewLFiicis8XwsCmdB1sCR85/VIx5eVbJ/iWCLTmu9iFXm1qXGzSng9OIZ9EpPEP5NttZfOV9GAWHSYxAjP3jOaJgv2Ci0I8SW2GiKjKnJVch0FrJm2/CAa12HDlXbVxtguKqlvP/uL608mBu7yRd65TKxiJ6y/gQUQN0pqZatcPOwatK4SuqOBLPtLVXYH3u+H9uxrXII2JFTmnkjL3w1eqEfvXyQnHJ+uV7z6EeCFF0vWhknpVo6ZXHIzjnd1jrctC7Zdco+hf1RD0rbE6i6/aw1Xi/ACfu+4bO0e6qrzHgHPVxBtIlX3sSI0Cmzag/xSMWwIoeao09RqRmZdWcO2LwJWYka3NKLMBwNcfLtZNRMFAGZWOezgnM4ZgZFPkzSpDBzH05I5iS7LmoNm/2mBl08znhn75e7ZJiwjVa8pi/ytNE1VIneRvW6tw1tUOyYiXfFnz8LPypI=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10455.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(11063799006)(56012099006)(10067099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 K7unQ3Im9R4HQ0mO5UTHZEzt/zuVQ9J1rcgGvRfeTlrQXU2A4pvVa+yFoF5kkVdUex7dJtbk79vsgZ4K0Qfkq++QuTNB58wiwhtah7Wb2xvugsySYq6rc/loVXoX5GJZ5gGuOYLFxBuZoWT/MUQy96et+Zj97pVSpawXQ4WltieQPOL/uc4n3frtkS21Tp1aa0MnfpH+3+n8LjJtumSynuosqEiWAho0tFoT54ERXej+6TecrpPPEl9I56xLMCyj+zlfus+W+c3gkiWFO8gFLGkjG8TVAUkllihJZvqKwL2V1idnLx2RKaA8WLtrH0fnfKYdJBC64P2Ie+oWbhhaFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB9982
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF0000056D.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7e65671f-97e3-48c1-6d61-08df22e1b51b
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|35042699022|36860700016|23010399003|14060799003|10067099003|56012099006|11063799006|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info:
	to00+GB6eho/DanpqaVRiPkR2z2fE4P57pUu2zQnmbAWE24jH8DPfwEYGPSTaxPnOLJ+jVBP6c+mORmLBuBYrmZWwAF49WxwnEW16N1g58Gc4IbFJmXMC8EHwArmmbOll1pHMLDZYv/0jqhOMZ+nU8DeNCbG1RxlTUxZOZ9GHoWFjywbXM9oiudPzgQzhYM9TuiYVxkZ77jcyfnv5X7l3ZuD37bhekx3zu0JD/u21fVq5u6Qo2x1M/s/7IAFu040ln5ZaM59NJ9Nboi/VHLnqx9NANVAsSzx1vY6AGpzDaQ8TGoEHkzaxF/rUCZD7weQWHIbxptDv1vf7g6QW98dDN94de1rxTLnDxjitZnmrylFmzPlixwWA/bv0n4qZVHMHEMpuUef1nz/EQk9W7yvDmveRP8Z071BSQPyFkbBZ4Oy2YMUFnWJtUBzJJbaOw8Ofw1DFgxeFHbdqiOC8QcIkHqIGhol4Rob/zdw4C84kXkH+gUAoDN6EuMzk+qQgH66hsKZvBatblIamFqr8/ssQMPoa5HXVAGdWsEFu74ZAl6qel6oud9Al1jVoSc8AdD5848cqumQHhSJuwhbtvoIZ4VEly9CVUvTGMh407/3E87bvISS1regd6lDUUeglsjWm6whWwzVoxWdkOEzJRNwhw==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(35042699022)(36860700016)(23010399003)(14060799003)(10067099003)(56012099006)(11063799006)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	MqTJfFGbSzslWHpsLDDy8IFSB/Dd+W/n4lRv6HM9AY4fougytwBUYQSeO/diiclpqPFsvRqFHDIRgCj4WKPdeZMMWJFxTls49FdPuxyOBmRWsK6ML/y+FU4NltpZ9oBELp/Pd848mmHohPhgqLfFH0u8jgfiqY0s0FbySuG4Ikf/OML80cQL0IxyWMZaSQSO/PEH66dhuoZBKcVqOWqfeF4ke8HTWMCk68aYEVVqEhTTkTZDVNd4WRw5b49TL/wCJ7l7W93YUUTtqjKHcxBqsVvqore/CAWCID9eu6WpPf9RLQuWl3eJs+0wo0IwAMu8uRXnVZDhB2EoMesY8ItdKE1qw/+y1R2YUbb6yqaGAnLG+tkMxXwrbjrCRqht2aKEK0odtpJvDBHRZsLRxk6RGi+/RefK67wolxGiKAgPzRjCHK4kNvaNse0vTN9CI1dP
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 13:08:44.9747
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce8178a9-1b50-4d9c-ed55-08df22e1c94b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF0000056D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BR0PR08MB197270

Hi,

not sure if this is the right ML, so do tell me off if not...

I'm a big fan of the Linux releases calendar [1], I've been using it for
close to two years, and have it added to most of my Thunderbird instances.

[1] https://www.kernel.org/releases-calendar.ics

However, I've noticed that after a while, past events are deleted. So I
was wondering if there is a calendar with the historical data, i.e. the
actual release, -rc, MW etc. dates.

Another thing that would've come in handy is a calendar with the
projected (or past) EOL dates.

I know this sort of info is readily available on the Web (I, for one,
have been referring to Wikipedia [2]) and on Git and the LKML, but in
certain occasions (e.g. bugging managers by copying calendar items to
them), it would come in handy if it were available in iCal format as
well. Does such a thing exist?

[2] https://en.wikipedia.org/wiki/Linux_kernel_version_history

Bence
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
