Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2063.outbound.protection.outlook.com [40.107.104.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0FC1210FB
	for <tools@linux.kernel.org>; Wed, 31 Jan 2024 22:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706740276; cv=fail; b=iSRXYJvIMKop5IItY3rw0xZRHEi9Ic497c94eFx0Om8EYEWxktHiuxFjL4EI60AJnagBkJZgp9wuQhcKtYweFowVQRovAqhDt0Fxi569Lhq2ncZVRBdahpxWYLVFdVlLJT6bC4mD9QAEjthxX5QQY8pAn1nJs9qnMNIBept6izM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706740276; c=relaxed/simple;
	bh=oTL9qfnh+wUGv1tS8SaI8RPtlgvTRrsUvapfey+Q69g=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=ABoPxoHPzPoD6tjyaBqpZq3xkf2LqBc9qbyXAWk+CQM3BUaigLL3bd/5xoDknGikS2WyyPOrTeYc1RtLtp5C1BRPfkVUqRAXYMlLH0D/fVZUjpINMlcHWfMUA/wtAip4tYeMcn8FsHFnLGLVHYzrQzyQIxM3Oov4nPwZfyxYhRM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=PzKkyGx7; arc=fail smtp.client-ip=40.107.104.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="PzKkyGx7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZEKqgwBlHg4objL+t2abu6Rt7UEs4o8ywUzoQQHx8SeyRM0wSWlfwiW38pG5fuq8s5FIIIBcAAQi+xZ8L606ug2Bmzt0oN6jjXGGuoImoE8DI/EXoLkh6a/20qpLTFTeX/bJsyn2qRjDHbjByjkBbXV6MRCP3n6fH2efJLi5aZCfqLHtJEuwKSfgqH5HUgo9ZlH7iZM+vo/TPmYmd6L9cwMk0Kqn02KW+/AVnM4+h1H20yPC5sCSQVwI/kJgxM6xi2sNtmEwJziqldxF+EqHy7HxRTXBkQGp1eek+Tz/Bio5cA8ALfUN6nrjmwehfbAprQElRnOprdfFegU/1EA84A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZvW/Bd8zyDIzLx2LxsoFRFAxkMxy0iOExf459Pzj5FE=;
 b=n9o6+/LRDsat73V23BdSHIqt+lJ8hfq7VuXSkY9JAa5EQTcJDu6dl4MB3uPNOrcoZWmYym1c0x0nXhHo3O+llzZxgqEEfmybjb2NykYCHY0XRpKtQXkYRjgAs+BVDWfFQq/CmFmCgTMTxo9pgs+6i099oh5R7OOIyB6C3T6HKKuMJK/2YKlIAReL9XarA01Dgubp7dJlsJhHMyifHWKLIKfi7Y/CNuFRf/G2a/RLpHferKhdsKDlu8Iv2IDEAVWGKtL5TplbJn/EmJp9pftwYlJ786TeRKTpEKaCZHH710VWZ3EfMCFWp5nXJwOZMmfCS1bZfeIm7Ul6Z2bMbUVlOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZvW/Bd8zyDIzLx2LxsoFRFAxkMxy0iOExf459Pzj5FE=;
 b=PzKkyGx7xtAtZ1dcMr973qD/fb7Fpdr+D41GMv7fah3m6nXRyPB6NnSSG+mtVWboRZkTYxe03k3IiVeAz1Steqhz+glJ58Q1XlhZTVeHpiUdQ2vtN3UpLo0Fni5aDOTgivft5oNO7PRtEHb7+PVMOnB90pDR2qPFjQrAlQhqd0k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DB9PR04MB9355.eurprd04.prod.outlook.com (2603:10a6:10:36b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Wed, 31 Jan
 2024 22:31:08 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::c8b4:5648:8948:e85c]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::c8b4:5648:8948:e85c%3]) with mapi id 15.20.7228.029; Wed, 31 Jan 2024
 22:31:08 +0000
From: Frank Li <Frank.Li@nxp.com>
To: konstantin@linuxfoundation.org
Cc: tools@linux.kernel.org
Subject: [PATCH 1/1] add --notes at git-show command to include notes in patches
Date: Wed, 31 Jan 2024 17:30:54 -0500
Message-Id: <20240131223054.371692-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA9PR03CA0022.namprd03.prod.outlook.com
 (2603:10b6:806:20::27) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DB9PR04MB9355:EE_
X-MS-Office365-Filtering-Correlation-Id: 65184222-cdb1-4d2b-e966-08dc22ac51b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5ux7nFQ3QTTPH2qgfAw4Z3Dq64TydSOmuceMF0cxpn1tNYtbSALCvJ/aO435Z/wAqJ61aIIdB4gbAy20lZH+z31+4Q222ptbLI76Ku04UBsLHDh/+fl16+P9W+yu8apdcg1gWKkvw1/VqE14MyvQnt5cYLFxxTR5DT0bukJr0P0Cm4w01dSCdCEPYMmzShl7yPNkgBVFyF9A1MVunRRrOOEFD+uqNKcx6N3KaTzfflbDt2LBDiMgsY+aBec+0xNgAeBq2t71KYvjGsS4c54w4l0XLImnRJ848UGukroXv+V2Aa7QuUrnxWTTtowsYoRz5Tdk0U+mIVQDLhtJ44dupdKuscjUO1SRBps4N0CuQNWRqSWmb3xAC0kq6/fd0RVKORVGvnrO3WLjPT1lPExyQMBkI6j7fE/d2e76CXZf3/BDs2so8hzjqKsnOU3Ogc1H1t0LYzxrgBF7V6L8gjHhPkwMjYx1/gXmahcdMO65fsEkMKiIhKK0/Y4Kt8LkRoJsQFjn+s8gkFo+QCwzpkRG+U/EN5TzQu2WFFwqzLocmuk+EIwdAKWIiW7DBuUh+FK7CDEOTn3DL741t4bAXwmO0NzCIqfXhwoM71sS7qa6OEj1YZOLeQl95qk5b7joequP
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(396003)(376002)(346002)(366004)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(66476007)(4744005)(5660300002)(2906002)(66556008)(316002)(8936002)(6916009)(8676002)(4326008)(478600001)(6506007)(66946007)(36756003)(38100700002)(6486002)(86362001)(6512007)(26005)(6666004)(38350700005)(41300700001)(1076003)(52116002)(2616005)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ghLbBqg2kJg7uhS/MlCLS612VbXzkKZEb/QQCAH0G/AnM2Do+p3un01Ikr9Q?=
 =?us-ascii?Q?l9YD/V8SIX7pZtz+1LiOwTpwOrjiw4dCh1VSGal7KESlmqB7JUm8bldE7tfF?=
 =?us-ascii?Q?W3IcX1ggHolS0ot3oODPo4hL64YsjpBD2vwTsOlYdaF9fjer+hEjFid5sZUg?=
 =?us-ascii?Q?2ztYbcGyzjzSTWF0S1ZFVZy9DAyaAvONhuo2E5UGZwpGz3w0no7sHlZHzZCv?=
 =?us-ascii?Q?XBFTLR112ivhmadtWbk1X7tmu1zKgngegNgpNcsOdie+67XShZMi2j1tcPps?=
 =?us-ascii?Q?puZFR0cON8uM7qX0YwMbFSUg5yG64mJd5bl+XrdbnEIxX7Tngah8haL1If0H?=
 =?us-ascii?Q?g5q0RVmAA/YZtoeMw+0h0dFHRngg0vpIXZWR6BW3S8JsdSjuHMOYYW1iq011?=
 =?us-ascii?Q?sQ6jI57Q3Vnn7I9viVRGpE3xe/iTUrq6f9oVEAwhi6nmS8AazmNdKop2cI3v?=
 =?us-ascii?Q?Jt1yggIk0F49ckQsc2wiMa/Pdd7Y05p0GE/6qTsAuXYhH+xMMCJdcYqd21oD?=
 =?us-ascii?Q?QinSzwE2c+lOtec949rdPZXICufZUETD02f3/8Bf9ZG7ZjhR1zWzWikaiqjD?=
 =?us-ascii?Q?DhKJPqZgZj5fWeRZ+Ttr0VyiZPFmOI8UOOgcmGhBIZiNGR1bT04S7l8ANuAi?=
 =?us-ascii?Q?03t8jAoywdEjUcwDq1bnWECIG5g/cJScIy4Qawa5CgZbEQiJLaktfOxvPEm0?=
 =?us-ascii?Q?PfUGTd7IKO4h2Nynjrcr6JNxvf+bgMxOdjVWmkMWErKdI0II6ExWu1DmiNha?=
 =?us-ascii?Q?QIKkCgFXkhSRCC7iQ5T9I0vj2R5UPGojBdZMQ33bX7dATIypgOK4aSP54bWE?=
 =?us-ascii?Q?YTb2+dOBZwDbX+XsMZjQE3pkMbgVHeJ18cX/AaKekFlk1FhvzcjPEhs9Wrbn?=
 =?us-ascii?Q?JygoGLZuWXGDU/7gFXAfXu10XEvRhWEvwmhFDhF6NRJSEh5sunieV59CEy/h?=
 =?us-ascii?Q?3j+/1UIrMrw17RfL5R5Q0DgvR96Kz1up2ghym6YSXmIXf5BSUNRQ100e5aMQ?=
 =?us-ascii?Q?PwCV0YVZihPkjy48Tz0XLARruXfwZ2/lxttZrgIz4QyJ/iM3Ov1SpQk6IT8N?=
 =?us-ascii?Q?s1zcIAeqfMrWysbWV+jzVPSyjrwJduQbLNNBW7YDIZ60AP/RxuXhaqPnP/6S?=
 =?us-ascii?Q?tChYI6Dj3nRWe6c82prajnkLaFYi91kDUVqWzUXzuEJ4JuZ4qPM11kSZIlh3?=
 =?us-ascii?Q?SBQDpB+3UyvECy5w/uGIcKWzOMATqbchte3psEY7+0cvCNTswws7hCRcqW+o?=
 =?us-ascii?Q?k3wCo0Aa6eJDCnZR19Wd/93hjAPbHGDbKMY5wmymoCWIsF00s6FXDYmT5zvN?=
 =?us-ascii?Q?6gyAWjnM3je6ZlW5i62bhHpuZpZOdnB2jxeraS7wamstIaNxCKcBxSoDCNlC?=
 =?us-ascii?Q?pNDYW/yjot4ldbNGwMasXFFzYD37gLriwZvmI6uroG1iE8ei3ZRfWdhbnDqt?=
 =?us-ascii?Q?8hjPYmiEpNGIhEhw2UWLSKhVrWs/CaaknjoZEsXVYHyFWTLImua8oMrgfpV3?=
 =?us-ascii?Q?DiUovFfO8YXHB6KV1iqR5dr6NPSMoDET4oMG2Igm10yjIvCYSSzqwViOoKt0?=
 =?us-ascii?Q?gmqyzuAcP4HxOziy3zbzF31JSN3om79fVeyqvyGy?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65184222-cdb1-4d2b-e966-08dc22ac51b6
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2024 22:31:08.2948
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2K9CIuIAh4n4dmLqBi1l6urGyYZ20F9nh5aRbsVxRmNBJH8gdhHHykBayY/52ULz5Iwj01jVJYXjDNFu4e2ATQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9355

I using notes to record patche's change log. b4 send will discard this. Add
--notes options when create patches.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 b4/__init__.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/b4/__init__.py b/b4/__init__.py
index 06a0518..a765820 100644
--- a/b4/__init__.py
+++ b/b4/__init__.py
@@ -3277,7 +3277,7 @@ def git_range_to_patches(gitdir: Optional[str], start: str, end: str,
             logger.debug('Ignoring commit %s', commit)
             continue
         ecode, out = git_run_command(gitdir, ['show', '--format=email', '--patch-with-stat', '--encoding=utf-8',
-                                              commit], decode=False)
+                                              '--notes', commit], decode=False)
         if ecode > 0:
             raise RuntimeError(f'Could not get a patch out of {commit}')
         msg = email.message_from_bytes(out, policy=emlpolicy)
-- 
2.34.1

