Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B75D8350D76
	for <tools@linux.kernel.org>; Wed, 28 Jan 2026 11:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=10.30.226.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769599763; cv=fail; b=r+I2nZsrKQLfJ5U4+eE9rALN2xHsikQ/n3f9sbdqJAehmXB6kORhTj6x2vN3Uzv/V1RwR0c2J0/eERLpZ3Wz66WwPPZU4DnnGOIQR9ooRR6y5XxwyoT96W0OA3HYq5yz8ZHSYP03X016LqSco64SyBoK8+Xb09gxLTyz69yVGiI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769599763; c=relaxed/simple;
	bh=+YRgRRwkwv1YpCGrYURKlnwKMh/PUcrjZoU8SeTdVSE=;
	h=Message-ID:Date:MIME-Version:To:CC:From:Subject:Content-Type; b=c9S9UShlTOmEikeWwU9TGPI/O5ioUeiNmBYQzk2wHoqqsK7VS61cIzxnokNQnxsfxabjnFky2rtmgZVkyeF9y/8w1lUlGK+QvuUR3u4f0TwdZkDQ/5TFUH76mIs0OqI6xl7Uph/IholUh6W1NbrVMmgXneJWowtkHD8g1QEwaPE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b=Y5NXc/kq; arc=fail smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="Y5NXc/kq"
Received: by smtp.kernel.org (Postfix)
	id 67305C16AAE; Wed, 28 Jan 2026 11:29:22 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013071.outbound.protection.outlook.com [40.107.162.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 78DE6C4CEF1
	for <tools@kernel.org>; Wed, 28 Jan 2026 11:29:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 78DE6C4CEF1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=de.bosch.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yRcnO93Qd1e231RC0MwZcZ1GpGWIOTDP+S7+jP9qXc7owv/Wrm01yaAbG4kGdzMzlta5ac/d8xVxpkCgRBrpROUHFsodtbens7aXvEgMlWflvpm8Jrey7fp+9LgqCD/Mm23KHFaI2Da5uFPKzRCW+t2VLahJoXxK7avzHfmw65WQtyrcXTxjVevvT/WIXKRyMzsNS6BnH1rqEjAdbEQVkeHtiYqNlr9cR5n7tYUeRl/DhQ4XOSl8E0fzOQBTk0qRXufeBpI5Xah59Zi5uSV/LKQ999WqZuGxbfYjZjqPUmoNdqoS2Vc4zKHyOVgHjdA1T7hlfpxzvboF2xIf0ZwLew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HaEsXNUpy8wcEfiHq5ltRtyMu9EBiS2bhp8QgUX6XPA=;
 b=Rc7SQHipp6JYzh9Bbi98M2rEzouc8yRz+RdPglZyUwvfQlDBNWReeG2y6JPnBkimL6Ht5H0MVXSBRTseLhp5j+H4GtwUXgq4kwKvNL/cM5DqKZ959aoIaKOx7Qg1SkqHyEQ6rsXna5CknLkrXOTLi81XK6xh3Zln2H0EBil2POdiZq88fgC/F3SeqWTG52rTCL2O0QiUqdhx5kkvl22kgrmFvegHfvpDMBo7w55H2qsppBPeuKGe39Rrlx7Pq6QbC2fe/NvoDQgjl6ZM8mKHjbmJ2wozdhSeb/TvBiC8vglEa3W5+L1sZDVSFdcPKJ/K05gsJQo20Lk2Ep1B25D7Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.205) smtp.rcpttodomain=kernel.org smtp.mailfrom=de.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HaEsXNUpy8wcEfiHq5ltRtyMu9EBiS2bhp8QgUX6XPA=;
 b=Y5NXc/kqKAwsdbNfZ3VfmXo8kRAHbv5sK4RvcmPwElrVyZfkNo7FOe/52Qsosb6QD+TACK/J/E6alFeExBLFGxCkplGzyZyYG4dtzrBYwzLJSwttfF8picP+LF+Tz3r1OKOetp/cac67bZF3OJmWKfzALxPquI0NCtSFWYVtQhROuMB0bpbrLAuZw1wymTsUGzcvwzxYLHRvGIxekvlxLL9P7pRrV7CwNw/McpkL6oaofjsgbahernoARTo7YsCrIaUX0cDpFv8oU3h9y69/bt8ZRjkmtMypQ3sk3ipxqogcLWD2J917iMeWfaihwQfyb1Zsd4eOkGIQZdasKUy06Q==
Received: from DUZPR01CA0242.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b5::14) by GVXPR10MB8315.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:150:1e5::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Wed, 28 Jan
 2026 11:29:14 +0000
Received: from DB3PEPF0000885B.eurprd02.prod.outlook.com
 (2603:10a6:10:4b5:cafe::cf) by DUZPR01CA0242.outlook.office365.com
 (2603:10a6:10:4b5::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.7 via Frontend Transport; Wed,
 28 Jan 2026 11:29:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.205)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.205 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.205; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.205) by
 DB3PEPF0000885B.mail.protection.outlook.com (10.167.242.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Wed, 28 Jan 2026 11:29:14 +0000
Received: from RNGMBX3002.de.bosch.com (10.124.11.207) by eop.bosch-org.com
 (139.15.153.205) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Wed, 28 Jan
 2026 12:29:12 +0100
Received: from [10.34.219.93] (10.34.219.93) by smtp.app.bosch.com
 (10.124.11.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Wed, 28 Jan
 2026 12:29:12 +0100
Message-ID: <5fd95298-afc1-4789-8b15-2b24e8886edd@de.bosch.com>
Date: Wed, 28 Jan 2026 12:29:05 +0100
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Content-Language: en-GB
To: <tools@kernel.org>
CC: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
From: Dirk Behme <dirk.behme@de.bosch.com>
Subject: korgalore: Mail directory keeps empty?
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF0000885B:EE_|GVXPR10MB8315:EE_
X-MS-Office365-Filtering-Correlation-Id: d4a57635-57c3-470a-cb4f-08de5e607772
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NHBWNFVqMXhqbjVXTUZrYnpKT2wwdGhsWFkvY0JNSWFLbmdkMytCSHhMSnQ5?=
 =?utf-8?B?SjRyZVZTU3NJZ2wyUllxOXVkRU1zM1dYZGNaNDdSSnd2WThrbDlTY2NkQ1kw?=
 =?utf-8?B?ZEVDeDJKaFhsV0FDRXJMRFRMcU50RWNzeHJSblg1RkxLYlR6VG9ObE1oOGMy?=
 =?utf-8?B?SDNvbFI2S2lOSVdSb1YvZ3BIdXo4czBJVDd2aDA1Vlkwc29GK2tkK3RFdlRR?=
 =?utf-8?B?dThsK0hnaWtzOUVxUEhxTGlhQUcvZjhydExMMzhJeVgwRHZEQlhpLzlPVUJE?=
 =?utf-8?B?eGFneThMbUdnNnU0TFJ4SEdqV3l1cTFjMy9pSXM1VGZPdml6SGFaRFNKUmU1?=
 =?utf-8?B?Y1I4RFRwcmxDMFEzcC9ycVgySTdsR3E1emx1RHZjVWk3ZWxpUkdyUHRtQVk3?=
 =?utf-8?B?ZThKVEdKcUlEdjRwSTkvN1ZQR01OUFV1ZkNIL2xzbmJnRkI3cE9jazBqR3hT?=
 =?utf-8?B?Z2dsbUxGTDVyMTNoSXU5eGxOMjlHbnhpQy9rUFdRZ3FGRXNFWnZ0NiszdWJo?=
 =?utf-8?B?VGxnYlpVVFJnOE5Sb1pFV1RmK25ISzl1ZUtIZmlEUW1LSFUyK3ZwS1EyMHBO?=
 =?utf-8?B?dTJWZUpkWkpuVmNWV284Q1VHZTZlTVVJR2p5Y1ltRXpsSkQ1L0NvZW1GWkpF?=
 =?utf-8?B?a09nc0FsUU9Icit0SlRRcHI5QjFrR1J2TWZUZGYwMWhJaG5jdlkrTXpSTEFI?=
 =?utf-8?B?YlduTSs1NXE3RE9NSHhkd3B3SFU1SVI0SWR3ZDBYcEdCUkIzSGh2UVdwRWZi?=
 =?utf-8?B?NDlSL3FrcGs0dlBFMVNuMVliSWNrcjlSNHZadjZKR3ZPRTR3OTVVQWVubWhT?=
 =?utf-8?B?blF2V3lrbGtSS1hHVWVUd1Y3dXBjMUt0alVBcytUSVlCK1FjNXlXc3NWbStT?=
 =?utf-8?B?bGIzZ3d3WjRlaWlPRzF1Kzd1S0Q2b3N5aWsyVEpjK0ttTzQva1hHZEZBQ0Vl?=
 =?utf-8?B?Yk15VWNHNi85S215c3U5V0xLUEVBWTlHLzNobVlhb0hyeUFONkhRTlJETXBW?=
 =?utf-8?B?cGplaHNxelI4UTdsQmsyM3FFK2ROZS9GYm1PTUQxQjZ6aUs1V2pDVzU2RVhI?=
 =?utf-8?B?bE1LUGs2YXhqODFwKzBPUm1kNjBwM0VDYkVMbzBhMXpGMXlzbTZ0VFdEb1Nh?=
 =?utf-8?B?MnU5RmRPc3RiTzRQc1dlVSs1NEp6YzNEcXhOZXJjZmNXNllrMVNVdnRoZzlJ?=
 =?utf-8?B?YXdmVlhSK0dPaVUrQmhwZlZzcWRNa1Vmb3FqT2FzQTJsdXRmWW5lNEtPZ2tU?=
 =?utf-8?B?dU9sOU1KaFFzRmZ2SEhydGRlS3M1Q0lVRG1iK1ZQUlJ5ZkJrcGRHUXdMQkt4?=
 =?utf-8?B?clZJQWZpWmRoUjFkeGx1UWRkY2tnMUR5YTY2akZQN2N2bVNzbkpqSFY4YmVm?=
 =?utf-8?B?d2U0WS9CRzArTzJVNEoxTnlXc0kzeGwydjljTUpyZHNock1vQnRmbkdnSmdR?=
 =?utf-8?B?ZGRTdWQ4VzBZS0hZZFFTQ1JMejZ0T3RxRWt2azdmQlYrMDc1dHlZa3ZYR2ZF?=
 =?utf-8?B?UDhRNGlYaDEvNnlVb1Q4T25TdTB6WW9GY1NHbUNReDJkS2xOcmdWNW1DVmNQ?=
 =?utf-8?B?ZXg5Mzg5aDlxbktJUnJrSVN6OTcvdmZQQTErRDBOLzVJa1p4TUhoNDZZMExV?=
 =?utf-8?B?S1NYVVRURkIzUnd5ZWVoa0RUTWM5eXloNjN2dXY4OTVRbzFydUxrWUJqSGZZ?=
 =?utf-8?B?STdxVm41VEpURWpoeUtNdklVQ2JHalRuRjNVdnVEODFzcGM3RUowYllOOThy?=
 =?utf-8?B?SkdaMUxXMGl5elVlZXhlelg5THdnc1VBRGttQVNVbEwzekhvNzJIdG4zWUNU?=
 =?utf-8?B?aEtUK2Z6Yk50dGdRZnIxOFBRejlYUXRYOFhBYUsvNnRLUmFxM3BnT3FVd0J6?=
 =?utf-8?B?Z3FMcEhGOHdIdWVaWXlpMm84Zkg0a2szTVFqamR1anJseFlvSkRXYnZWbGpC?=
 =?utf-8?B?SlduQzBSc1NTd2xXcENoRFZ0V0ViUzJyeFEwSDR1dGk3Ykp2RVVOMVo3WUtG?=
 =?utf-8?B?bThTV3ptZ2l6dFBRcWdqS2U5ZHFjQ1BXNGI4U2Q4TVdKMDlTTVVsd1AydDB2?=
 =?utf-8?B?Y05GOWNpVHQwYmFMZXRWcnBkS0trMnFXL0t6TCtiellMM2Y4ZW5McGpGUUha?=
 =?utf-8?B?czNaZmNiQUFUMy9xMjJUeUFySUhMbGR5UWIybHVtNzEwa21tMkkyb2VJaWxj?=
 =?utf-8?B?U3NCeVFYb1lLeS9ZM3RBendFVE5DcFVUVGlHYWwzUTlkdHRlUXFocEFFZElm?=
 =?utf-8?B?V1FjaEsvV21TUGhVL1NxWUNkMVV3PT0=?=
X-Forefront-Antispam-Report:
	CIP:139.15.153.205;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 11:29:14.5957
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d4a57635-57c3-470a-cb4f-08de5e607772
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.205];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB3PEPF0000885B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB8315

Hi,

using korgalore 0.4 I'm trying to setup a maildir target. From [1] I 
learned that the initial pull is supposed to keep the maildir empty as 
its some kind of "initial subscription" (note #1).

But even a second pull some time later when new mails arrived on the 
tracked list still leaves it empty. See full log below [2]. There are 
some errors "maildir ~/Mail/rfl/tmp/ doesn't exist". Of course, because 
it was not created in the first run.

What have I missed?

My basic idea was to create a ~/Mail/rfl/ with the mailing list traffic 
and feed this to Thunderbird. Is this idea wrong?

Best regards

Dirk

Note #1: Does the argument for this behaviour given in [1] regarding 
gmail count for maildir as well?

[1] 
https://lore.kernel.org/tools/20260123-brawny-gregarious-pig-edcca1@lemur/

[2]

~$ kgl --version
kgl, version 0.4
~$ cat .config/korgalore/korgalore.toml
### Targets ###

[targets.local]
type = 'maildir'
path = '/home/dirk/Mail/rfl'

### Feeds ###

[feeds.rfl]
url = 'https://lore.kernel.org/rust-for-linux/'

### Deliveries ###

[deliveries.rfl]
feed = 'rfl'
target = 'local'
labels = []

~$ kgl -v DEBUG pull rfl
debug: Loading config from /home/dirk/.config/korgalore/korgalore.toml
debug: Config loaded with 1 targets, 1 deliveries, and 1 feeds
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
drwxr-xr-x 2 dirk dirk 4096 Jan 28 09:25 ./                     // <= EMPTY!
drwxr-xr-x 3 dirk dirk 4096 Jan 28 09:25 ../
~$ cd .local/share/korgalore/rust-for-linux/git/0.git/
~/.local/share/korgalore/rust-for-linux/git/0.git$ git log --oneline
164d6a6 (HEAD -> master) Re: [PATCH v2 2/4] gpu: nova-core: gsp: clarify 
comments about invariants and pointer roles
4bc11e2 Re: [PATCH v2 1/5] gpu: nova-core: use checked arithmetic in 
FWSEC firmware parsing
4f7c0aa Re: [PATCH v2 0/5] gpu: nova-core: use checked arithmetic for 
firmware parsing robustness
...
~/.local/share/korgalore/rust-for-linux/git/0.git$ cd
~$

// <= wait some time until new mails arrive ...


~$ kgl -v DEBUG pull rfl
debug: Loading config from /home/dirk/.config/korgalore/korgalore.toml
debug: Config loaded with 1 targets, 1 deliveries, and 1 feeds
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
/home/dirk/.local/share/korgalore/rust-for-linux/git/0.git symbolic-ref 
-q HEAD
debug: Running git command: git --git-dir 
/home/dirk/.local/share/korgalore/rust-for-linux/git/0.git rev-list -n 1 
master
debug: Running git command: git --git-dir 
/home/dirk/.local/share/korgalore/rust-for-linux/git/0.git rev-list -n 1 
master
debug: Highest remote epoch: 0
debug: No new epochs detected for feed 
/home/dirk/.local/share/korgalore/rust-for-linux
debug: Updated feeds: rust-for-linux
debug: Deliveries to run: rfl
debug: Processing deliveries for target: local
debug: Highest known epoch for delivery rfl: 0
debug: Running git command: git --git-dir 
/home/dirk/.local/share/korgalore/rust-for-linux/git/0.git cat-file -e 
1ff83f17d35ac13b6499d0e7f886be0e6f0e97e1^
debug: Running git command: git --git-dir 
/home/dirk/.local/share/korgalore/rust-for-linux/git/0.git rev-list 
--reverse --ancestry-path 1ff83f17d35ac13b6499d0e7f886be0e6f0e97e1..HEAD
debug: Delivering 2 messages to target: local
debug: Running git command: git --git-dir 
/home/dirk/.local/share/korgalore/rust-for-linux/git/0.git show 
8a69a61c23d6c9dc97eef8f681b49aaa6c0a0687:m
debug: Maildir target ready at /home/dirk/Mail/rfl
debug:  -> Re: [PATCH v2 2/4] gpu: nova-core: gsp: clarify comments 
about invariants and pointer roles
debug: Failed to deliver commit 8a69a61c23d6c9dc97eef8f681b49aaa6c0a0687 
from epoch 0: Failed to deliver to maildir: [Errno 2] No such file or 
directory: '/home/dirk/Mail/rfl/tmp/1769598446.M953385P720Q1.HI-C-005GF'
debug: Running git command: git --git-dir 
/home/dirk/.local/share/korgalore/rust-for-linux/git/0.git show -s 
--format=%ci 8a69a61c23d6c9dc97eef8f681b49aaa6c0a0687
debug: Running git command: git --git-dir 
/home/dirk/.local/share/korgalore/rust-for-linux/git/0.git show 
a09f7ec1930a534152d2a57082752b9f1c47b625:m
debug: Maildir target ready at /home/dirk/Mail/rfl
debug:  -> Re: [PATCH v2 1/5] gpu: nova-core: use checked arithmetic in 
FWSEC firmware parsing
debug: Failed to deliver commit a09f7ec1930a534152d2a57082752b9f1c47b625 
from epoch 0: Failed to deliver to maildir: [Errno 2] No such file or 
directory: '/home/dirk/Mail/rfl/tmp/1769598446.M957766P720Q2.HI-C-005GF'
debug: Running git command: git --git-dir 
/home/dirk/.local/share/korgalore/rust-for-linux/git/0.git show -s 
--format=%ci a09f7ec1930a534152d2a57082752b9f1c47b625
debug: Released lock for feed 
'/home/dirk/.local/share/korgalore/rust-for-linux'.
debug: No tracking manifest found, starting fresh
Pull complete with no updates.
~$ ll Mail/rfl/
total 8
drwxr-xr-x 2 dirk dirk 4096 Jan 28 09:25 ./                         // 
<= EMPTY!
drwxr-xr-x 3 dirk dirk 4096 Jan 28 09:25 ../
~$ cd .local/share/korgalore/rust-for-linux/git/0.git/
~/.local/share/korgalore/rust-for-linux/git/0.git$ git log --oneline
a09f7ec (HEAD -> master) Re: [PATCH v2 1/5] gpu: nova-core: use checked 
arithmetic in FWSEC firmware parsing   // <= New!
8a69a61 Re: [PATCH v2 2/4] gpu: nova-core: gsp: clarify comments about 
invariants and pointer roles            // <= New!
1ff83f1 Re: [PATCH 2/2] rust_binder: add binder_transaction tracepoint
164d6a6 Re: [PATCH v2 2/4] gpu: nova-core: gsp: clarify comments about 
invariants and pointer roles
4bc11e2 Re: [PATCH v2 1/5] gpu: nova-core: use checked arithmetic in 
FWSEC firmware parsing
4f7c0aa Re: [PATCH v2 0/5] gpu: nova-core: use checked arithmetic for 
firmware parsing robustness
....
