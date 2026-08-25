Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFBE8485CC3
	for <tools@linux.kernel.org>; Tue, 25 Aug 2026 18:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=100.103.45.18
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787681281; cv=fail; b=a7o1yuQGO9tvYECdaMeCrO/JqlbCqVRwwnkHKm8YbtTtPn5Iyrkp07h0rjhBFMhGS7wlmfstl96ZXn4Ngh7jmsMiRwG/G+T0qaw2vFR9pK50yhHFMW1vwFoPWDkTWahQ2MzTb1mKeQsnkLuQz3TOMwmxxl3TSrb7NntXNW7YoGY=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787681281; c=relaxed/simple;
	bh=W6x+RwWKBB5LuAzL4rKhf/1XlWSCAXEQwF6Za4W/C0U=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=nMMFLykIccUmlXC2nllLND216y1LH/TaeDEMCSX/bQfxTrO1UGvwd9oudsAYKY7dGHjUjDrps7RErsHICZ9/dTRknwbdUosmyU8DxqaU/GiA089qbg65INbkNWjr1Oxiaf8fvowhCzx4Xg0Q0VEx6sfoBgc5O3obJ53UoRhA7hc=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=SBV96ytJ; arc=fail smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="SBV96ytJ"
Received: by smtp.kernel.org (Postfix)
	id 79C171F00A3A; Tue, 25 Aug 2026 18:07:59 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.200.20
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1787681279;
	b=FgB9M35Hj5P4Qf31/qOWkE8Cq7q2JJ/0dL0P0OGzxwqeNiG0Gzm4cDO0fGHIVTn98cmd
	 0vzmF/4cRgUit6krXb3xNkLEUwJ2nvnfGES7hlmmNxGPFrJLP4/sG/vdH/SxlR0aJEcGh
	 PbLT2oUoUWYu0sCPKQJjNULX+E+dlBnKcIHwc3r9YmU04ygLVY+YT3Not+7zmq5BYTZJF
	 zvZfo15nAGyO1rTGvFb1tVzukNCbk456n39CPcbHn7J3HxLUyqwNHAZX/F0HNhwqOmlC3
	 4R+CzD4tUpFFWIBW5wPGYi4POdxlLl6TnDIqtHI+aeHCzOysd4pT9BwovF4lPxRX+Rg==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1787681279;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Subject:Date:
	 Message-ID:Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=K2b5+C7TppbknUdV9MZBI2dPu5AvbDYdzjwoqX5m97Y=;
	b=f3BVRkgcWzgdfmBwNyd3Eckl84/vmBzVnu2UZWokrvyzUgFAdnHvPADlG45eJnlUh7Sx
	 TXGfZiD6z2s8XEGJBgyrA1F5uptzRbXzaqca9rvf0zqOmHWbQUlIGTf8Q8FhFdIaGYVfT
	 l6u9jg9aYbxQYvBasy2ob+4qd0rVeGvMt2u8ppD2oXBUbyzyWYapSUhYmBWMfEB97mp02
	 cRQ8BXGCkCZ04WdiLUcBhcPu1fVw/uHg4XPX4vK5EkWdlspCkg9W+d1gzrgNC2s5TAyg+
	 iT0EAW+hfXABHRw2ALcRWaKIUHZNGMhzX1cc5dPUqZJbH29cNZm32XPTJ+iTpTcKJRg==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=SBV96ytJ;
	dmarc=fail header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.200.20
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012020.outbound.protection.outlook.com [40.107.200.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BD0521F000E9
	for <tools@kernel.org>; Tue, 25 Aug 2026 18:07:58 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=SBV96ytJ
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org BD0521F000E9
Authentication-Results: smtp.kernel.org; dmarc=fail (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UxPgCqoSEXjheq3eELO1o2h1CV/qb5gbXbr125Hapj8Am2ZB0vSkcu8vZyDnhcO6n91WGKG3afw/LziwYq0vvf12dEmo5yLvxeA9MnO3vHH+6nw4ph9d+go7HWHr5vSWN3OdnyrsWpPr3zQSzG57SE+oBStj9JUBJQ45e7ASvpT81ob9Zp5x96V8GdYynZFoZD9bv3sR1WgNI6p+ALoYHP07xxJeSD0jsCkLEpaGC0SvBwTB3BKDyiV4wcks8dw3FUiQOg4bkJI7BDBoxlfSOuihWYxiHwpHc8v+U3Cj4NNivylCGgGCJgTr0vnOTDOWw3g7do7e12GZ/tHM97fANw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K2b5+C7TppbknUdV9MZBI2dPu5AvbDYdzjwoqX5m97Y=;
 b=iWXk/4gq5WGzw/A0Jpf11HcPeCRWZAcL94AP78L5uPsQlrwuKycNFkuauRVWCKoyl646Gymu3ZUxWuTWxiHuk1R+FQ+YYwOE+0yogMf1PwBAGObNMtuqH8CZdPfxMIcdjgxi+C9uO+x5PtHhQ532+TFVlj6/MdYFSc0WZeUHoAtKEhMYTeBD5CjDPymimU1CQdam5SHVkW5IfA8JYzu4DeRmgTiOw74gEPFRgWoFAtnsagzBou7g5SX7KHa6wIYF4Cmc+GQIvxvWtTWxHEOvKnYpVQJQrvg9puXQGovFQKryfXr47VyVjoordK6zOGdbaV5nrICxiRRoLG21+r4CoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K2b5+C7TppbknUdV9MZBI2dPu5AvbDYdzjwoqX5m97Y=;
 b=SBV96ytJjbCo/fcJKZFJaQ8YNjukkKamO6lUjdFowJSN5q56zft4JQXUapXaRK+bgwIKJ30npIJIUbxjmH5Omle28vHK0GLrXpmT5RK+XjSolpdgyAjfLjpgsDK6K6ptRERica3/hylnS+6in7vtHy+GS56aK4yFdOzjK7VznNKLxKaErQzdxlsVcNvffKUU3+fUK0856dixLJ0Ts57kyb1xItN0xU42b0QHa2XDugz/h+s+o8b6d7oV8cxSyNOLkkk8kPoTsgjD2T4hXn/zDidOVjMEJUgJqES5RSnPVPewPwtNLY2vAIJzowyifiq/k0qFVlIKR8UcdbW+Fm8PVw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by SN7PR12MB8003.namprd12.prod.outlook.com (2603:10b6:806:32a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 18:07:54 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%4]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 18:07:52 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: tools@kernel.org
Subject: [PATCH b4] review: emacs: add customizable line backgrounds for quoted vs own text
Date: Tue, 25 Aug 2026 15:07:50 -0300
Message-ID: <0-v1-b7509406782b+2711e-emacs_background_jgg@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0064.namprd05.prod.outlook.com
 (2603:10b6:a03:332::9) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|SN7PR12MB8003:EE_
X-MS-Office365-Filtering-Correlation-Id: 78c436a3-980c-4bdd-d809-08df02d3c7e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|10067099003|11063799006|56012099006|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	iPMGVEpR0/j6ud5uxxqKal/VR2m/cP2HPI53wOsqxxYqPRsOsQDxBqceLe8Z92YM4gWUqwpjSxhu/CpUahe3c/PhRGmgcBxbYn8Z5wxmpp7Ss/tgApJN3LDBYnAVEDypL/4zp0hUYC/wUg0fFgxunsN7g5Z4aWnhgTLq+gcl4NWolKMHs+2T4E5qQ8bdw0CZ8Aqqw/JnStdPmoBIvrhBorLY16dTIE6+wxaumE2urqAfvCBuXcCc7P83pHACrtCv+be41sHTKc8FJ9HrKyPLPnkMm2P8lrBWzbzClxJERJx0ufRv7Pn1+wC9DG9O2muFo74TxmqBY4Zcs8CjiBI2cRp5Wr3S5bS2hnnKQmM6p+UAjSXlnWEvLj4blqjK+kc6z2CroeTg0Y9VbCKtt5xpEux0oNWlbLMe2kJTPSOaIfNvBmIXmvf1MYeEORtVlYx6n3hC/5z5jfy++zSiNq67HEirmuOW3TMgOr/53JuzUxsUHFc7UpiXSsiPVYUeK+y/fzMwqEvXwoPlYooc/D1VY2DwSikOl0wA9pclSiEASnjUP9W7J7IX7vhLzVVDh1c1XreLtfiKtzwot+2oZBGWNLDWHHUhm4dVY7TJa622cvG5npSGsk98blbhUxNTICr3DA8E5wGScZLYvUF5AxxE6F3KNoJVNNA2S2FTyHnP8QY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(10067099003)(11063799006)(56012099006)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dU51RDdYenFWbHRNWnZ6MFBreTBLRmFINTBIZUtiOTU2OGdDWllsTkFsVEEx?=
 =?utf-8?B?dGw5RW9JR2hXZ3psUXNGZitOdEQ0ak1remkxQUtsYlgzMkx1ZlpwdzVFYmNQ?=
 =?utf-8?B?V3FOMjIyMXk2SDU2Rlp6S0twSk43ckJLTGh0Y01ZMXVraTZPRDNhQVZ4R2Q3?=
 =?utf-8?B?SE95YkdjVTU4aXRXVG5JOVh4ZGpFbXJDTXZ4RVRIMnFDaTMzR2xTa2NBRVQw?=
 =?utf-8?B?RG9GOW52VjBYcnNLMUpvTXhHWkgyMWU1eWkwbnNYRTV2YytqOThXWU1TWEZN?=
 =?utf-8?B?SnRpVW1XSWxKU3BkcjRwN2h6S005V2Q5YVd6TWxOQmNqc1pxcEgrSG9RZEhP?=
 =?utf-8?B?S25qQ3JvMUpURmh4L3NqTlRvL2xiSVBVVkErWjZLNU1wd2V0eVdzNEJlMFBl?=
 =?utf-8?B?Qm5JbGdMOFp0RW9lMGZxa0JjS215c3lhZkVJc2pDc1JJaTAyQXhFTGhIQ3JX?=
 =?utf-8?B?Mmtpc0dLazJKTmJWblYwRFRNaE9UTTZ5cVBWb0FNekwzRnRURU1COG05YXdU?=
 =?utf-8?B?cUpNWmcvUTBGeDc2cDZQdTIrWlJobUFJUiswSnlBaS8rUzd5Rk9YNkxqWEx4?=
 =?utf-8?B?RTNCN3RsYldHN3RVOEpQb3pmRG9RVjV4cWN2TlNxR2xxQkFTY24yZkYwN0t3?=
 =?utf-8?B?SmFKMDl2T1FSMFViR0xrdEJiWEZTUUJ0TE14TWFkcXhLUll5djJsZE5XRnBn?=
 =?utf-8?B?Q0tHanVSSFJ5cUt5OVJnS0d4d0J2SlR3U1U0TEQxMVYvTVErL0x0OExOOU5z?=
 =?utf-8?B?cGNNamhLR0pzMjJhZm94M3JOcjh6ZDBpSEVEbnJjL01QRnJGbmRZWXBkR00x?=
 =?utf-8?B?U1huK0V1bHA2VkF4c1NPbmI0Q0VXRUxuSERNTjRTYmorYWFjUHpEVnh2SnZi?=
 =?utf-8?B?Tzltc3dpNUo5VkNXTFdrUUdqQzV5S1NwZno3UDYvK0cwZXhvdnExNHZPUG9n?=
 =?utf-8?B?RlVxQnh0Q3djYitrdEl2Rkd5a1ZIdnA1ZzhhK004Z3lzNUlXMnUwMW1ZR1FE?=
 =?utf-8?B?clMyN013MGlWbFNtaGgwQmJOOTBzckpsZ0puYVBCYjBMNnJOV1JRL0ZWVjFU?=
 =?utf-8?B?Z2plaS8wQ1pGT3lCVGRvZnZ3cW1aT3FnRHhpbFBXdWs0Y1FWR0RqN3VVU3lu?=
 =?utf-8?B?T0VwNkE0bW1tZzhwWjZJOEQzZFVyK0xibUY5bkJ2RndIZ002T09xVGU2R0xs?=
 =?utf-8?B?TWY2MWtsb1RSSUR2bnQrOXR6UWUvWTVQSFh6ZEl2QlphbUw5TjNGc0FJK1Rk?=
 =?utf-8?B?Vmg1aTBVOEtzTmd2bkR0QzZGUGhWWDJEbXRMbTVIM2hsSE1kSGFqZEtmOGpT?=
 =?utf-8?B?Rk1qMyt6d0szOHZrQnJYRGJod0g4ZlNvSjhZQ3lZYlhJTCs1MG1BTEtQd2lj?=
 =?utf-8?B?MWxDTnNYVEcwQytJMGR4eHBWOHp5MjFmM3NiUjBTaTREZGV1Q1hIYUpXa3dF?=
 =?utf-8?B?MTBRaVk3WkdUTW5iY21Qek9rSFZvSmsyWHBPblF2R2NaZThZWE1BdG9paXor?=
 =?utf-8?B?MFdCeTVuNVpaYTBwQzBaQjVWSTJOMUQvTWdzOWQxdWJDcUxIV1Jmc1Ntdm9K?=
 =?utf-8?B?T2VVUVg5WUNlcjFBd3lJVUlsL051Um1sT1Z0VEVlNG9taW1GcG80YTZRS1cz?=
 =?utf-8?B?UFc5YldxOVA3bWJET0JLK3RYZnJwMWUxcTJEdEpTN3pEWFNnN0Z6REgvMVpr?=
 =?utf-8?B?QUozZFN1SlhERFhrNy9HSjVSS3pmbURHVzI2R3ZNcG1RZHZLV3FQWGttQ1BW?=
 =?utf-8?B?emdrSDh3eFFndzFPZ21CWXc1ajFYb1FmVGZtZVBRWjY4ZWxlelNsR1NCTUtj?=
 =?utf-8?B?QThwZlVWTHBNaUpJaHA4ZVdUUG1JVWM0aklLK2VKenJ4Q2JUYXRQQUpKQVkv?=
 =?utf-8?B?OXdzVFNEQ0xEYmlSbVBvWkxFMmwycDF0U1RWVGlBaURCbHFkeGdVWGUyMnpr?=
 =?utf-8?B?K3cvMSttc1lCbkRjUnB5dzJ6U25wY0ZDU2lFMWdJM0lPQTdZZDk0dmU0bWlG?=
 =?utf-8?B?b2NpYTRRQTVYU05mRjVLc0l3QUx4T3FZUFVHRFp4SC9kT1BDTTY5SnpHdHpO?=
 =?utf-8?B?SFN5M1M2RW16aUd3ZGh6K0FQY0FUZS9DVkZJODgwb3J3Y3NXZis2Z2s0SDFY?=
 =?utf-8?B?OWRiR0tlNEtXdTQzUmdibGtjZVlJN0dkR004VEFlcVFWdVF0L2RGS3d4ZTVu?=
 =?utf-8?B?OTUwNWhLSDBZMVVvWE05UXI5VEk1cU5VVnJRZUFJNjF1MzNXaU5kOVRjOUt4?=
 =?utf-8?B?bDBDUHVadFpMZlROamV5aGJjQ0NBNittSEZEa09RQ1BxVWhTeTdZalAzOHNU?=
 =?utf-8?Q?8Q6G/OyMDMrPVY7Gve?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78c436a3-980c-4bdd-d809-08df02d3c7e1
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 18:07:52.6284
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RPLmPWYyyJL0Ndz2zT7FwWztSgEFZe0TQJ1rXgiAtYDMuekxcxiKCjsOLGRqInkd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8003

Allow customization to increase the visual difference between the text
provided from b4 and text added by the user. For example I'm using this
with:

(custom-set-faces
 '(b4-review-quote-background ((t :background "gray14"))))

With an otherwise black background the original text gets a slight gray
distinction. The colour fills the whole line edge to edge. Add the
matching b4-review-own-background to allow the reverse option if someone
wants.

Assisted-by: LLM
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 misc/emacs/b4-review-mode.el | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/misc/emacs/b4-review-mode.el b/misc/emacs/b4-review-mode.el
index eb1b67542d77d8..c2342ff29bdf4b 100644
--- a/misc/emacs/b4-review-mode.el
+++ b/misc/emacs/b4-review-mode.el
@@ -111,6 +111,20 @@ whole-line deletion worth a breadcrumb.")
   "Face for instruction lines (# ...)."
   :group 'b4-review)
 
+(defface b4-review-quote-background
+  '((t :inherit default :extend t))
+  "Background face for prefixed lines (`> ' quotes, `| ' external comments,
+`#' instructions), applied underneath their usual foreground colours so the
+background alone can be customized to set them off from your own text.
+`:extend t' is required for the background to fill out to the window edge
+on every line — without it, the fill stops at the last character."
+  :group 'b4-review)
+
+(defface b4-review-own-background
+  '((t :inherit default :extend t))
+  "Background face for the reviewer's own, unprefixed comment lines."
+  :group 'b4-review)
+
 (defvar b4-review-font-lock-keywords
   `(
     ;; Order matters — earlier rules take priority in Emacs font-lock
@@ -153,6 +167,17 @@ whole-line deletion worth a breadcrumb.")
 
     ;; Instruction lines
     ("^#.*$" (0 'b4-review-instruction))
+
+    ;; Full-line backgrounds, appended on top of the colours above.  Matching
+    ;; through the trailing newline puts a face on the newline character
+    ;; itself, and `:extend t' on these two faces (see their defface above)
+    ;; is what makes the display fill the rest of the line's width with that
+    ;; face's background instead of stopping at the last glyph.
+    ("^>.*\n?" (0 'b4-review-quote-background append))
+    ("^|.*\n?" (0 'b4-review-quote-background append))
+    ("^#.*\n?" (0 'b4-review-quote-background append))
+    ("^[^>|#\n].*\n?" (0 'b4-review-own-background append))
+    ("^\n" (0 'b4-review-own-background append))
     )
   "Font-lock keywords for `b4-review-mode'.")
 

base-commit: 1f2f768cfa57721bbc235451dbf0a777b876945f
-- 
2.43.0

