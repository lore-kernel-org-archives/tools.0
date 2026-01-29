Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A3437F8B8
	for <tools@linux.kernel.org>; Thu, 29 Jan 2026 09:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=10.30.226.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769678594; cv=fail; b=A1yKCAFurcOFW+8yQ90TheWjewNM5NVGNVYKykIf5VuIP1cLiYSfh+vDrFW7NqMJkpHsdi78kqAqbt8dB+jqciY1wqFi6rw1/GLsoK+HhIEpaSDGjJ67OTUv34/anJlt8oUOYluhKpHJvtt1Z2tZPlYqjOj3gqCtB8c0rfF1KKU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769678594; c=relaxed/simple;
	bh=zP1MDddG603DdgVvZkVsfMhIQXtbeQd+C/cPwotuJec=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ZZcKhuu2rloDkpYIf1r/kuycSAYQfgJNhBMMfRUXDXQAjMjcxy3QPSCyD1Njw/f0Ho7G1jHXfYESAyHWq9A+keW+L9F2UGq8KuUwPNf3q2iEeHIxJvZKRjUNyBn1o4VyEDgUmCGK0dovY5FrESyrcDFMa4DrDBRbDWT1ChwO4Yw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b=HLcqEkTO; arc=fail smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="HLcqEkTO"
Received: by smtp.kernel.org (Postfix)
	id 88A91C19421; Thu, 29 Jan 2026 09:23:13 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011007.outbound.protection.outlook.com [40.107.130.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 40B74C116D0
	for <tools@kernel.org>; Thu, 29 Jan 2026 09:23:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 40B74C116D0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=de.bosch.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hfuQnmdj3F1HB4ElVEWrp2UfFAK+M4/lsL1Z9JJQJ+inzwYho+2AIQkzSde9Wd/y77z/VgEyWW2qR+Bv4QjZZ+LlIPi9lgaPslDZPdLa2izdMNrSkDv8ZzaFCHcEL10xzU32nH8sWUpvp0dxOwHim9kTTn8/kW0OLyJ2yP5Bp9SOJvl5Ov1Ga1sHcDrbbQSnMq0IyEe4AQ89vXH9aQQFGYwNtwugdtjF3EkbniM9xUGUhKrG3tajOo6Xt+BUgbg1SHm/O1u1FwJOpgxat4P/3OzbLPq9UX61LXGWHaXsDU3kcTrfQzdkCqfpKS6IpMb68LpssE2o3UwdZe2gZc1/rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OwTTQz2oLSqY1U/UFeOK77id3LuHFQW1AYYdgYovCr0=;
 b=TUuUVdCjr/TycBSqU5dFSi4l67DRzIDDEz/M+pB1HdRVJd64s8hCosRpOe+FQLs3S+27gj7YlKsV+8nZzzLeb62kqh2XSKKaX2YnQmAr/PGes9a1bWuHq3DvEaPLATeGvroZP94AjMBlJ/Lq7G/1PMGiM5CkIZ6OyCz8X+AG8o9hB0nSvzqJe+KAKIsLm9hKK92V8XlTrZ4/sL5M2Fdw8XPsWoejv/r4TIjNh/2/1G4rYszV//0q4doZ3yUTdaeVsGnFamDxltY9qgNopbhIV6FqWFRraNX80lbH2ViYg9uTlPIInBSm2mZG4wE7V8PgSuTAfhwVrUksrtlXRCYweQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.206) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=de.bosch.com; dmarc=pass (p=reject sp=none pct=100) action=none
 header.from=de.bosch.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OwTTQz2oLSqY1U/UFeOK77id3LuHFQW1AYYdgYovCr0=;
 b=HLcqEkTOa4BkD7iaoPyf2oNSe2DLBCCJcf8I0Nsn+HTabpFpwtv5jPfL0uMfGDnF8SzUcGJVDRqMnJuQTzLHIkDHQl18l6XLorhvezUX+GED00iM7THa4uiYFN/W68N7VuZsbtlvBr6uu7Pk+4OJ7HTOX656XV91bD0FBrpCQ+upFrO9MrQAJaij+2JJ0QcfrcCtJ6QJ+zC8xqRUE3AZ9waq62Rb8OL0noew5PksA+yKbOg7Ku9AANCd/yeckMpp/DXLh0xsAn0BuW8Z6SwV8kjU2Gwwbr5/cAB9Os0CMmCqJ2PlHzpMAb/KAyhS3D/ZXcbCjJvdLTNgOy9WkJ/FNg==
Received: from AS9P194CA0008.EURP194.PROD.OUTLOOK.COM (2603:10a6:20b:46d::27)
 by AM8PR10MB4034.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1e2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Thu, 29 Jan
 2026 09:23:06 +0000
Received: from AM2PEPF0001C711.eurprd05.prod.outlook.com
 (2603:10a6:20b:46d:cafe::f6) by AS9P194CA0008.outlook.office365.com
 (2603:10a6:20b:46d::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.9 via Frontend Transport; Thu,
 29 Jan 2026 09:23:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.206)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.206 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.206; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.206) by
 AM2PEPF0001C711.mail.protection.outlook.com (10.167.16.181) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 29 Jan 2026 09:23:05 +0000
Received: from RNGMBX3003.de.bosch.com (10.124.11.208) by eop.bosch-org.com
 (139.15.153.206) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Thu, 29 Jan
 2026 10:22:55 +0100
Received: from [10.34.219.93] (10.34.219.93) by smtp.app.bosch.com
 (10.124.11.208) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Thu, 29 Jan
 2026 10:22:55 +0100
Message-ID: <29c56255-2e88-4bf5-abf6-c02aa8f953da@de.bosch.com>
Date: Thu, 29 Jan 2026 10:22:48 +0100
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: korgalore: Mail directory keeps empty?
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
CC: <tools@kernel.org>
References: <5fd95298-afc1-4789-8b15-2b24e8886edd@de.bosch.com>
 <20260128-wild-honest-cougar-c002de@lemur>
Content-Language: en-GB
From: Dirk Behme <dirk.behme@de.bosch.com>
In-Reply-To: <20260128-wild-honest-cougar-c002de@lemur>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C711:EE_|AM8PR10MB4034:EE_
X-MS-Office365-Filtering-Correlation-Id: 36c2c671-b150-4745-b3fa-08de5f180282
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dm54SkR6d0IwT0F2WWZ2MnpsZ3l4NGJGcjBseGVGUFNkTGd1ZXdRWHF3dnph?=
 =?utf-8?B?RGFYTGN2WjJONnRJZDVoWjJiQjRUL3lDTkNEc2ZETkpTNnlEczNyRFhGNi90?=
 =?utf-8?B?Sno3TkFoa0luZi9GWlBodmxLWmFLczV1MVdZem4xQTRFTExNS1k3bVZ1MEM2?=
 =?utf-8?B?MHJxajBuUDNFT3BEV1hLdDVPUkRTLzlsb3hOK3ZKYTI3OXZyaGxkMzU5VXRo?=
 =?utf-8?B?MFp6WFZKTnU1djB4M2FvZ0hRdnMwTXRsOWNhNjVOcnI3ZEtzS1JvQjRDbTUy?=
 =?utf-8?B?NkV1ZFg4Q1ZiUXFuOWdkTHJuTzE2TmFSTDJLaVp0dHBzM3JKZFJ0d0NBWWt3?=
 =?utf-8?B?N1d6V3hjNno1UGlEZUtYT0F5VXNVREF1M2VJK0IxNlh2MVpJSUs4cExzcC9m?=
 =?utf-8?B?S0svUEROeEd0aUFRN1NTcEJxZGpabWhyS09yZU5UV28yc2FLTEJhU01GdFEw?=
 =?utf-8?B?M3ROR3dnMHdUaGVpWW1ycDBpWTI0QXRRSHdDR0RYNytmc1IyR0UrYzlWeTJN?=
 =?utf-8?B?ZkRrbkwzK1dvSjNsdlhMcVFXZU9KdW4ySlF2enA2YUk4MFU0NWtQSmFnUUdk?=
 =?utf-8?B?VXlWYVdtQnU2aDZlN3UvdE9GSVA0d0NlY0NyNG0yZlZMUlpSMWJOQ2x6TFNt?=
 =?utf-8?B?VjdKRlFCV2J0NVQwQWFSUzlsV2FkZTg4OUxxQ2wwbFlpL1dYRjNlcWowZGZR?=
 =?utf-8?B?eGNzRWNMdnYzSlJ6Y1Bmb2ZSTW5xZUZSUlJpZ21MM1ppM2hWNG5PMzFFZ2xs?=
 =?utf-8?B?cUJHQlVrc0FyN1NKbzlxaktoNElDVW9CWHpKWTNQbmNWNm9xMDNkK2hIVHFs?=
 =?utf-8?B?d3h1Zk1hMnlKanJJako3akhsckNTUTM4czBWbDFZTzdoUjZrZlBKSkl3Mkpp?=
 =?utf-8?B?Lzl1K283WVpZQVlqcEVIY3JNUk0rTjAvbkpFUjBMdC9SeEZtSXFYZ09Lc1RF?=
 =?utf-8?B?ajZiVHppUisreVN5RE0ySnFuV1NjbDRtQkZVMWQ0WVMwSEkydmdCMnNEc1Jj?=
 =?utf-8?B?S2RHbk9iaE1IY1FuZWFOcHVjUkp1bEFOTzZOY1IvL3FQdE53SEJZMDVRTW9X?=
 =?utf-8?B?ckpPbmVnMmVaOVhhWEtGK3hRY0pMM3pBUmhydG5udmE5VHFxMFZRVTZEYnZW?=
 =?utf-8?B?RDZBVVVSd0F0azNVblBTeER2b29MMmVXUUw3VHJZVkM0S1NKay93bVhOa1Rp?=
 =?utf-8?B?b2Q0SldJNUkwTlp2MmV6ZXJESHpqYVljQXdHZ2UzVWMycGMxUk81WUYrTyth?=
 =?utf-8?B?a1krVmNhUVN4dUUwY0k0eDdMSHk2R0ZEeU5YZSsvR29PTFBUU01jUnBVSjJI?=
 =?utf-8?B?bnVhRjVLdWkxdHgzSlFTNkZ5Ti9CQ3d1TjlodDhpdTNPQ25aZmFOR09ZQmtS?=
 =?utf-8?B?YkljanhORmRhcDl1aXk0a0NNaUs1SXVmSWJHL2hzdmF6T2JoK3hRQm1Cdzl4?=
 =?utf-8?B?cUkweVIyYU1seDVVS2RGd0xUWE80OXM0NzY3d0ZYMnY2aHAyd1pMWnBFekhS?=
 =?utf-8?B?Y2pYQjV5eHBIWGFaSFNSWnhQNm5JMUVkOTRaVm5hMzNHMlkwdjJXSGdOaWxU?=
 =?utf-8?B?MVJlRWczVDQzaVFxdmNOUFBtOVFKcU9qSDVlSXhTMDVzZWtSSm9sU2NrRHNT?=
 =?utf-8?B?NCtiS3VMVGRHYmZLcVVGeU1mTUNlcDBHYjNoWWIydlk4aFNmOWhxVXdMY0FN?=
 =?utf-8?B?NWZiZ284L0FoTnY5LzI1NDA0OFcxMW1EdzNMWXFZOGI5UlY2WG01L2VQam5r?=
 =?utf-8?B?QUxoQzhUZHRXM2tuMEplQ1VPMFY0RUZoT2xLcEJpVkFaU3Zoenk0bHdvUnpD?=
 =?utf-8?B?ZFo3SGNmSnc2cE42SG8yU2JlTlkra0htekhGL1RSY3l2QlVWcWk1ZVZSUlNw?=
 =?utf-8?B?eTN2dG9zT3ZPQThxN3hMWlBKYmxBR1JQWlhpaENWOEhaNUtmTkhxTnBDdWli?=
 =?utf-8?B?MEFHU3gzRGEySVgwbXdSckd5L2VxTjdza3F6WGdYa0d5NHBWdTd5ZERocG80?=
 =?utf-8?B?dXBxR3N0T2hPSnhYQlFYTVJncGxkVjdmd3ZRaWJ0YmdhNSt5MUp3ZnN5Z2Vr?=
 =?utf-8?B?VnM0Ti9wTmUyOUdyang0SjBONm1EV2VwYnZPRVJ1VXBUZk1FSEtMTEtPZnJT?=
 =?utf-8?B?VysyMFZGZ3ZUMGdPN0xRTlM2Mkk5YlNiSVF5VGtnTFpnS200WUlaazczZlBw?=
 =?utf-8?B?dTNWaHg5a3N0Q0JSSGdOeEhsbS9TeVhaQmZ2KzBVcWxycGw2ZzNod05xc1k2?=
 =?utf-8?B?czlaS1dKeGo5b3RESkRDRlBDdnF3PT0=?=
X-Forefront-Antispam-Report:
	CIP:139.15.153.206;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 09:23:05.8327
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 36c2c671-b150-4745-b3fa-08de5f180282
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.206];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C711.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR10MB4034

Hi Konstantin,

On 28/01/2026 14:26, Konstantin Ryabitsev wrote:
> On Wed, Jan 28, 2026 at 12:29:05PM +0100, Dirk Behme wrote:
>> But even a second pull some time later when new mails arrived on the
>> tracked list still leaves it empty. See full log below [2]. There are
>> some errors "maildir ~/Mail/rfl/tmp/ doesn't exist". Of course,
>> because it was not created in the first run.
> 
> Thanks for the report. This was a bug in how we initialize maildir
> targets. Python's mailbox.Maildir with create=True only creates the
> maildir structure itself (cur/new/tmp subdirectories), but not the
> parent directories leading up to it. So if you specify ~/Mail/rfl and
> ~/Mail/ exists but rfl/ doesn't, the initialization fails silently and
> subsequent deliveries error out.
> 
> You can make things work with 0.4 if you run:
> 
>      mkdir ~/Mail/rfl/{cur,new,tmp}
> 
> This creates a valid maildir.
> 
> I've pushed a fix to master that ensures parent directories are created
> before initializing the Maildir. I hope to have v0.5 out today or tomorrow,
> which should contain this fix.

Many thanks for fixing this that fast!

I switched to 0.5.1, deleted the .local/share/korgalore from yesterday 
and with this started from scratch. There are no obvious errors any 
more! But even though there are new mails (commits) the second pull reports

~$ kgl -v DEBUG pull rfl // 2nd pull
...
debug: No new commits for delivery: rfl
debug: No deliveries with new commits for target: local
...
debug: No tracking manifest found, starting fresh
Pull complete with no updates.

and the existing maildir Mail/rfl/ keeps empty.

Full log below [1].

Best regards

Dirk

[1]

~$ kgl --version
kgl, version 0.5.1
~$ cd .local/share/
~/.local/share$ rm -rf korgalore/
~/.local/share$ cd
~$ kgl -v DEBUG pull rfl
debug: Loading config from /home/dirk/.config/korgalore/korgalore.toml
debug: Config loaded with 1 targets, 1 deliveries, and 1 feeds
debug: Set GIT_HTTP_USER_AGENT to: git/2.43.0 (korgalore/0.5.1)
debug: Data directory: /home/dirk/.local/share/korgalore
debug: Mapping deliveries to their feeds and targets
debug: Resolved feed "rfl" to URL: https://lore.kernel.org/rust-for-linux/
debug: Acquired lock for feed 
'/home/dirk/.local/share/korgalore/rust-for-linux'.
debug: No failed commits to retry for delivery: rfl
debug: No failed commits to retry for any delivery.
debug: Running git command: git clone --mirror 
--shallow-since=1.week.ago 
https://lore.kernel.org/rust-for-linux/git/0.git 
/home/dirk/.local/share/korgalore/rust-for-linux/git/0.git
debug: Running git command: git --git-dir 
/home/dirk/.local/share/korgalore/rust-for-linux/git/0.git rev-list -n 1 
--all
debug: Running git command: git --git-dir 
/home/dirk/.local/share/korgalore/rust-for-linux/git/0.git symbolic-ref 
-q HEAD
debug: Running git command: git --git-dir 
/home/dirk/.local/share/korgalore/rust-for-linux/git/0.git rev-list -n 1 
master
Initialized new feed: rust-for-linux
debug: Updated feeds:
debug: Deliveries to run:
debug: Released lock for feed 
'/home/dirk/.local/share/korgalore/rust-for-linux'.
Pull complete with no updates.
~$ ll Mail/rfl/
total 8
drwxr-xr-x 2 dirk dirk 4096 Jan 28 09:25 ./     // <= Empty
drwxr-xr-x 3 dirk dirk 4096 Jan 28 09:25 ../
~$ cd .local/share/korgalore/rust-for-linux/git/0.git/
~/.local/share/korgalore/rust-for-linux/git/0.git$ git log --oneline
74f78e9 (HEAD -> master) Re: [PATCH v2] rust: block: use pin_init::zeroed
3ae1de6 Re: [PATCH v2] rust: block: use pin_init::zeroed
...
~/.local/share/korgalore/rust-for-linux/git/0.git$ cd
~$

// <= wait some time until new mails arrive

~$ kgl -v DEBUG pull rfl
debug: Loading config from /home/dirk/.config/korgalore/korgalore.toml
debug: Config loaded with 1 targets, 1 deliveries, and 1 feeds
debug: Set GIT_HTTP_USER_AGENT to: git/2.43.0 (korgalore/0.5.1)
debug: Data directory: /home/dirk/.local/share/korgalore
debug: Mapping deliveries to their feeds and targets
debug: Resolved feed "rfl" to URL: https://lore.kernel.org/rust-for-linux/
debug: Acquired lock for feed 
'/home/dirk/.local/share/korgalore/rust-for-linux'.
debug: No failed commits to retry for delivery: rfl
debug: No failed commits to retry for any delivery.
debug: Highest local epoch: 0
debug: Running git command: git --git-dir 
/home/dirk/.local/share/korgalore/rust-for-linux/git/0.git fetch origin 
--shallow-since=1.week.ago --update-shallow
debug: Running git command: git --git-dir 
/home/dirk/.local/share/korgalore/rust-for-linux/git/0.git rev-list -n 1 
--all
debug: Running git command: git --git-dir 
/home/dirk/.local/share/korgalore/rust-for-linux/git/0.git symbolic-ref 
-q HEAD
debug: Running git command: git --git-dir 
/home/dirk/.local/share/korgalore/rust-for-linux/git/0.git rev-list -n 1 
master
debug: Running git command: git --git-dir 
/home/dirk/.local/share/korgalore/rust-for-linux/git/0.git rev-list -n 1 
--all
debug: Running git command: git --git-dir 
/home/dirk/.local/share/korgalore/rust-for-linux/git/0.git rev-list -n 1 
master
debug: Highest remote epoch: 0
debug: No new epochs detected for feed 
/home/dirk/.local/share/korgalore/rust-for-linux
debug: Updated feeds: rust-for-linux
debug: Deliveries to run: rfl
debug: Processing deliveries for target: local
debug: Initializing new state file for delivery: rfl
debug: Running git command: git --git-dir 
/home/dirk/.local/share/korgalore/rust-for-linux/git/0.git rev-list -n 1 
--all
debug: Running git command: git --git-dir 
/home/dirk/.local/share/korgalore/rust-for-linux/git/0.git rev-list -n 1 
master
debug: Running git command: git --git-dir 
/home/dirk/.local/share/korgalore/rust-for-linux/git/0.git show -s 
--format=%ci 06f5fc10d237ca604f26ac12aeef6f95f289f5c7
debug: Running git command: git --git-dir 
/home/dirk/.local/share/korgalore/rust-for-linux/git/0.git show 
06f5fc10d237ca604f26ac12aeef6f95f289f5c7:m
debug: Highest known epoch for delivery rfl: 0
debug: Running git command: git --git-dir 
/home/dirk/.local/share/korgalore/rust-for-linux/git/0.git cat-file -e 
06f5fc10d237ca604f26ac12aeef6f95f289f5c7^
debug: Running git command: git --git-dir 
/home/dirk/.local/share/korgalore/rust-for-linux/git/0.git rev-list 
--reverse --ancestry-path 06f5fc10d237ca604f26ac12aeef6f95f289f5c7..HEAD
debug: No new commits for delivery: rfl
debug: No deliveries with new commits for target: local
debug: Released lock for feed 
'/home/dirk/.local/share/korgalore/rust-for-linux'.
debug: No tracking manifest found, starting fresh
Pull complete with no updates.
~$ ll Mail/rfl/
total 8
drwxr-xr-x 2 dirk dirk 4096 Jan 28 09:25 ./      // <= Still empty !
drwxr-xr-x 3 dirk dirk 4096 Jan 28 09:25 ../
~$ cd .local/share/korgalore/rust-for-linux/git/0.git
~/.local/share/korgalore/rust-for-linux/git/0.git$ git log --oneline
06f5fc1 (HEAD -> master) Re: [PATCH v4 4/7] rust: num: add `into_inner` 
method to `Bounded`
d201eba Re: [PATCH v4 6/7] sample: rust: pci: use `register!` macro
4ffb2b7 Re: [PATCH v4 5/7] rust: io: add `register!` macro
48e8660 [PATCH v3 5/5] gpu: nova-core: gsp: fix improper indexing in 
driver_read_area
bae86e3 [PATCH v3 4/5] gpu: nova-core: gsp: fix improper handling of 
empty slot in cmdq
f9c9433 [PATCH v3 3/5] gpu: nova-core: gsp: use empty slices instead of 
[0..0] ranges
0694cf2 [PATCH v3 2/5] gpu: nova-core: gsp: clarify comments about 
invariants and pointer roles
d1f4ab2 [PATCH v3 1/5] gpu: nova-core: gsp: fix incorrect advancing of 
write pointer
7f6f4e2 [PATCH v3 0/5] gpu: nova-core: gsp: fix command queue ring 
buffer bugs
74f78e9 Re: [PATCH v2] rust: block: use pin_init::zeroed
3ae1de6 Re: [PATCH v2] rust: block: use pin_init::zeroed
....
~/.local/share/korgalore/rust-for-linux/git/0.git$ cd
~$
