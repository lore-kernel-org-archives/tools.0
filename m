Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA323F1653
	for <tools@linux.kernel.org>; Mon,  7 Sep 2026 19:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=100.103.45.18
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788808981; cv=fail; b=c5PwMzgyRjNzCT3mClbmcYY5ifXBzHizkNMrwGoPSt6q72iDmfmH/tL+Ht39r1G2gVtxS5R5SPwcIDkhlwmfDkYxyICUvDUOH+nhwlH4LAHUAer3ExxuvcPplWG0x7fwa9+LM41VsoB+MsZRa8A8b3vI6zLZCr4/E/3rj7L0wVA=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788808981; c=relaxed/simple;
	bh=HBqEr+7xbRSTIpzDBrkCMX2t2zOQBdLnGbTrwbq6/D4=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=jrpvXnxCk/VjAJuMhSQ4eN3tWJYgeZqScvY1E4QL2eieYWdUoIDFrEFVKcnb4azniihqidWU2BTrC8yw63dK0Pddp9sLCKTlE4Dhh3HX6SFdm/HfjfyvdNi4+DQsNLMp/RUogkmTWq9f7VNMBhXST4u4QTt8gesVQu0M9mvvNH0=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=IPa5pi7S; arc=fail smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="IPa5pi7S"
Received: by smtp.kernel.org (Postfix)
	id 6EDB21F00A3D; Mon,  7 Sep 2026 19:22:59 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.23
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1788808979;
	b=bNElU5isAaCwMf67PJlo/9xwgyFVKVUDQ+AXoDxcl9zKKvQS8vuTIZEUyPUkD28hxHV+
	 GfUtT+Hq0SH1/jcgFJ0E7F0fycpw1l6ohPU0V0MVn8gWGT/kx3TgoN0GIOOaOTkqyqF8E
	 ccnHGqGFM3/cFwd8w2ClMP+138KsEyUzqWaalVgLxMBMDbxFlQqYsEEPiZ9Oy7od9VCQs
	 n470tgT0dpDkAZzIiqL4QRd7onWUnSqiaCI39BS8rSR1/R/OhFuFVEmu+l/8Oe0nrUg9L
	 ba7eKJ14/Oze9QV4MoSDTrj2p9ej7oWRniIOaeE/C62WcGEF6hcqevop6+Oz941iQ5g==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1788808979;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Subject:Date:
	 Message-ID:Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:
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
	bh=qgJMxlDUyCmGNA/brAgymZPHsZ5xtYDQz7803IjVyKE=;
	b=sB8LEUSBqnCvcuCRO8OLOiTD4SQwxjOxUFua5qjvt3Tesx37a/G7eAORpWoj4SQoKVBa
	 GHSWDtLzxCOMDTWVEleU3QmV5+fN6FcfQK8oTj5zSuyZNNQst50FBvZ2PDHO7AI6SX1TW
	 4IQNCP3reWHiiMEXH50qac7pRt8lHkwH8EQJHDBTyQAdyIdHl/oyAvghIL+Rr70ybue+r
	 JiMPqMYlER+XzRvqp2LuiSVI6UL4gNNlkOunhAmv7D/rpfw/um1fXB5CXy9amU/a+tYel
	 GpIT8niPI8FNCuM6CmXsN9W18Xwigni5NsyZCxvEC78KBgpg49U+/WSfDOUUExhA99w==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=IPa5pi7S;
	dmarc=fail header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.23
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011023.outbound.protection.outlook.com [40.93.194.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id ACAD01F00A3A
	for <tools@kernel.org>; Mon,  7 Sep 2026 19:22:58 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=IPa5pi7S
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org ACAD01F00A3A
Authentication-Results: smtp.kernel.org; dmarc=fail (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fQRosylnLwphNuZVQTcz8A8zSTCGXiAJCglQkQRViPrDJdebOxd4HBPlvJc24jEvZWxVxGjVrF7iK6zbA6V+EE+tiynkwpt7Xj0d6XkMgNHpZQiC+/+abgdV4JmL0S+R1ufJOGI3yX+4SUhofBB+Dh5S9HDj4lKG1Qm+xI9ubcoQqTjOVc8i6TLwGUXOzLZ7PO1GeWVOEn704hc0Wduq5FBLN2B697OXG0VDYZeSaQCsKVH0d8jC90thqt2qviW7U0JvtDk4Si2SpetjlsgW5zvYwPjRWNVx8wr+xZtHe6+M+m8vAzZGJqZ5U1GWSLSn+eTGL9fhcfB3sttHYaySEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qgJMxlDUyCmGNA/brAgymZPHsZ5xtYDQz7803IjVyKE=;
 b=zSGFOXOGYw0FeQnNQgBRkxKVB+te8BQ607YQpWYIfVAeQ3/qfXzHJ3cMyMHiZ0I7/KDe5K2x1QWcR1AJ7A35YKEHi2K7onptAD9WDjtkcy8gdp19Dvp0wApLH8umJeMp/KGNz9rsmsgG8H2ZIElmAOovaBx2OOP6foCeNBqTEylYaALgaHyh9jW4lXHTm92BE764iLecDwLotC9xkyaGrr8fjZGExBSrMSm0lGWD7uFHQCXmMIsAPSzxYmhG5rwhyapgezMCJyLjOJs1xZh0HOhSG1PDYemMK7DRmSKX3jkP/0cR4KU88fvxe9QHK2RFXmsy/C5fODK2XsJHmwmwcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qgJMxlDUyCmGNA/brAgymZPHsZ5xtYDQz7803IjVyKE=;
 b=IPa5pi7SaZ2xxS3bZhqitu42BZx8F4lVgCEWm7isIZgEz0lRzCeFweeall2HfstYjlcbT1CI2o/1as9Twsx4v8ihMksEjguIlbWe0VjwS0R2pcdC0BtUyTvDq0D92m++tTAGwZMtOZ4g9QGjY8cwwONijYbbdLWDsaz9n/60anB2x3OlubKeBXhZJPZY+PsEUj3Cepbk2hxAZXSEvoFnVOQ4V50MYMFPWj+0FzPNgHNYJWdMPirMXtpNeVcqH31yt5YgupMocksXwbvDjVAfU9Kg8PaGkqZLnj5gXJ9TBej0eVoGAQCU1a4wyMog+krK+iBomirAk9bvFR2XrfwKaQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by DM4PR12MB5844.namprd12.prod.outlook.com (2603:10b6:8:67::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 19:22:55 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%4]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 19:22:55 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: tools@kernel.org
Subject: [PATCH b4 v2 0/4] Improve email quote trimming
Date: Mon,  7 Sep 2026 16:22:50 -0300
Message-ID: <0-v2-de162fd5fc4a+2b7-trimming_jgg@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YT4PR01CA0222.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:eb::8) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|DM4PR12MB5844:EE_
X-MS-Office365-Filtering-Correlation-Id: cd788389-1354-4746-5520-08df0d156b3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	wcn5YCH2oaYuZUCgxH106cJoolSFyKCy9PJlJ117zUZoKF2XWRxIS9lFU8CToXCLaT6w+qmRb3eEK132jwG24WixcmM7UX0Mdi2YWWsE4CSG+AJz7gMvtO7TzsCiYNfbePOPbpsChEQZ1cuhO/QER3TsjwUAMDJy/SaWMPrIejvd+iHzdaDH+9/6TosZOai3ZBF8UGBC1flSfdIKVvTu4YxR8W2spHHoKU5gMPyTIHpvLP5NCOJR08QMq8YZai6FfKwUozBXfQpMF2vkbGQRywLJV96IihdAHUMPsGQPO8t2wECq1MQ9K5U4kZoH/Cq+G3rOzxkA/0unZe3j22BAvLODPMaceShmuRVe3DdbGKu0BGK1tZByLCoYFwhe5qsxXjy8jRFy8lsqkQPBizfn28YhLE5VVekhzRrDNaDDw+GHqHMSRVtBVutBKQ5lYD/yezYrf22gLyMpIxwPNUsRsIrRDeDgAxZate6Xm2DNiQu4o8Ww8Fv/SLR/eu8kg/3JJHxYXIjYTdsgWvQp/txh/fpqxHBudmSZla0m8nBylrN1UYnduXZhA3GZB3UUn4Ogy/nIdnrNKQrcCbF2Ny44CT3Y7iow1Q14Hl0DfY6Xk3CBd/Xu/+AxRA2ImAayuZqg
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oXHkjahqyvlJD8e/wtBMUva9a7qFWv6ctpBQDcShUt35ghUqGBdCgYnEBs7x?=
 =?us-ascii?Q?+PAsqDHUucoThVwO7HqwB4ygxWqZ9tDjdze7bQBfC66LxIbtJ4nw0h+82wRc?=
 =?us-ascii?Q?X6C+luhlrIKRF20UfWTIPT6CvjsHZ12cbi+pqkGmlBJ973uWwgzJdoKbAyBo?=
 =?us-ascii?Q?GetVtzgEDLu+6T20tLWJJ8l9jacjzLntnwpF14q1xVTo5sbZFCyriYdmxugB?=
 =?us-ascii?Q?vugx5x5BamxNnq/iF1F33pePP0HO7m886N6PsMQkqffI2bOTWJ4CqAbVRLJO?=
 =?us-ascii?Q?ALewUnmfTwKw0zafvUIhAAVAADogUdWltDTC9BRo1Cd120EYiP2W6SO5ICWK?=
 =?us-ascii?Q?8fWDe/G/vt5XQjmWg/Sdf0SkOFTk2zRGkx9flXYGKSUh/977gSRIWN+vM9g8?=
 =?us-ascii?Q?klVIiAHps6vBmxH8hOPIvV3nV51R4JNqLU8wmOnZhB4ZkJobKClFZxyXsQZ+?=
 =?us-ascii?Q?e12TEwsH/yQdEmiMgwMTrq7ZUEqddGGII5Iy/g5+42QAFQuxPwvH6kS+Wp6f?=
 =?us-ascii?Q?S00ulbD8YZ+WX+xfB1QhBrmgbMc33+e6UyHmqUOKriOaUzHsV6/66sfaoy+O?=
 =?us-ascii?Q?VdCyu47pfCyJYlHWSRPrHkMgxxYqoadvIR7QIEipWVhTU38ecjljilZJ/NSX?=
 =?us-ascii?Q?HqxT4b4z5kOS/ArITExTyl71ffhpuK3GCdS6KMkf9fz9UYsP922cN46z+tg6?=
 =?us-ascii?Q?CfEFObd66UjPk3QNVrOrgyf0I6G17aB1FTP7RFxQo4FCt4S5xHBca2kNNw8p?=
 =?us-ascii?Q?bJ0mo08vzJjQZynB2DToT8meQhsbizLdwE3gnSlIe0kS1/OKpH586ytcJ0Fk?=
 =?us-ascii?Q?BEC71eqCrEeHwJ+T36APTtMQdy9K/jyGeXnbwvyceHrKx/9OLItl0Grfl4RD?=
 =?us-ascii?Q?drUBQWIaMwn6YUTg1TBTTZJlGd+AIJVPr0e4FIjwtDarpgO9eS3Y3hfYTnpQ?=
 =?us-ascii?Q?br9pdavSlX4oxSOJFKlGlRqmz4qZvFd7/xPVuqQj5S7Y9hkiCzhQBiwBeVXD?=
 =?us-ascii?Q?lv6a72tmWrxt+mxTbJTgEolwGBwS2MRLjXo4+pDEhYig7+9Jb/qjzPCPifOs?=
 =?us-ascii?Q?gyznsrJzFeZYCvW+w09gsQCx8bi3PVn8gUn47gpVQbDCuJuKSvKzWdF8Ibqn?=
 =?us-ascii?Q?Kuo+duYkYvyrDPCilYf2Qxc1xERqkG+0V3/gzxfUJhW7Q8Z+dQR2+Q1sLdDv?=
 =?us-ascii?Q?+eLvYL+zGgKDXNgTW7TGoZh5nSM9tY9sJkMmvr9rKYiaogqONOGKBHgLfzvM?=
 =?us-ascii?Q?+IOsbAa9O6XQeYUD9+/c9SeY0GltbrxoFjZjBfJsLI2o+umK/Nr6n6uD9kp1?=
 =?us-ascii?Q?CtdsNjijo8CL5/ziVP94p0McKecp5O9vXyD23j3D9PtHZitOpPSkIIYDYvHY?=
 =?us-ascii?Q?WGOzFw1msl4V2KY70jbGDsjHjdUMVAmDl08dgA2m1d+n4Z2cWg5FhVFIVYk7?=
 =?us-ascii?Q?PR5gIhRURQMUsb1XWHxsTstJCHOxDtGRtiUo7Atf7A6fJcxCiALP7zZJ/d0P?=
 =?us-ascii?Q?ut04RL3zRVTkmBqggJav/6yUqgxo81PApo8+cpvfGQFhSDKO41tDZxAdeuQT?=
 =?us-ascii?Q?TyTL0ly83sa4WbZfzOv0E/DvmtBaKxHL/rk4ruJur1O4V+O/hMGfUhux/eS8?=
 =?us-ascii?Q?aUX8L0q+Q1jDa2S8kaArlGX7nYJW9K3mVeQ5mh+V5qkGC2tj2sf0OW5288ww?=
 =?us-ascii?Q?tgYtjE6cp2lFy/r0ogJKzFeZXe0/uCL9srOAwJTd/DVTRbVu?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd788389-1354-4746-5520-08df0d156b3b
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 19:22:55.6270
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tyH7Flv4psrJBqIafVOOeqN/jnPLjcEVLP+y44p8scfDkJcuHxLCUIAPag0+xZ4f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5844

Patches to make the automatic trimming more versatile and work in
more cases.

I would, broadly, like to edit the messages without editing or removing
any of the existing quoting. This is because I tend to make a few passes
at things and once quoted text is deleted it is a huge PITA to bring it
back.

Introduce a >--cut-- marker which tells b4 to cut the quoting and then b4
can reassemble the message similarly to if the editor macros had been
used.

Along the way fix a few corner cases in the email construction that
resulted in sub optimal email generation.

It took a while to get this generating emails the way I think it should,
I've included several of the cases that didn't obviously work as permanent
tests.

Include some very basic support for emacs to generate and highlight the cut marker.

I've opted to leave the existing editor support for cutting out quoted lines
alone, but I think it would be better if it could use editor folding and the
cut marker instead. That's far beyond me though :)

v2:
 - Rebase
 - Change cut to >--cut--
 - Add some basic emacs support
 - Consider mixed > and | quotes when trimming the reply for a trailer
v1: https://patch.msgid.link/r/0-v1-5f6173f1d4bf+3e9-trimming_jgg@nvidia.com

Jason Gunthorpe (4):
  review: trim trailing quoted when adding a tag
  review: discard blank lines between | and > quotes when trimming
  review: add >--cut-- inline marker to snip quoted reply context
  review: emacs: highlighting and keystroke for >--cut--

 docs/maintainer/review.rst       |  24 +++
 docs/releases.rst                |   9 +-
 misc/emacs/b4-review-mode.el     |  32 ++++
 src/b4/review/_review.py         | 150 ++++++++++++---
 src/b4/review_tui/_review_app.py |  10 +-
 src/tests/test_review.py         | 317 +++++++++++++++++++++++++++++++
 src/tests/test_tui_review.py     |  69 +++++++
 7 files changed, 586 insertions(+), 25 deletions(-)


base-commit: c363dd22f0f87689b63d6d32fb65bf07b73d6e66
-- 
2.43.0

