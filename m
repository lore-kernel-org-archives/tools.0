Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67443A1B6
	for <tools@linux.kernel.org>; Tue, 19 Mar 2024 04:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=10.30.226.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710824032; cv=fail; b=uYW24C+50y6ooLA+gKroUuhIUbjbRBY1G5UqcG5YCpz8E+RGBSJtcXiG1yms3Vu4OWm1tgaLMktmq/6D+JPcs2ONOYq4G6MgPyf+Rm54hVbxbLC8QA2owakNg2YVL7geSwWhrx3cEAKQjXgbJqQ2LndGd+yJIO6t5+NdxN2uCOQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710824032; c=relaxed/simple;
	bh=BCYL8EirlkMqqq1x11mB7b9C83/CHHjwL3VJSoTP3Ko=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Aa+OTQKv5KSxSK9b66vy8yaYwGt4kTNXYYCWt/DLNBUkuuv8wX0DPj4PzZj56Zj05AEnjQFYZ3B4x2ln4hdGCPTBxfaFZ/7kTJhgpbbdqi4e7Ir7NOhSoC1XbJVVkgoPe5lRdZ/cNCiWjoG5z8kO0txcdyIrmq9mfyJcsHvDVzc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=bVMUvgZb; arc=fail smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="bVMUvgZb"
Received: by smtp.kernel.org (Postfix)
	id 3F08AC43330; Tue, 19 Mar 2024 04:53:52 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2103.outbound.protection.outlook.com [40.107.241.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 93B29C43390;
	Tue, 19 Mar 2024 04:53:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 93B29C43390
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d90nhn7EVwrEnLMmJsmPIFI5EIpDbHbCiHGLz40iEX/r91iuwR78lixTwoa4bpGTOsk/kJyOSSRU+EduRsO+SMIelZua74Kja/eInL2mJ5PYqUlP2Ac/ggKGXvidt8mJAZgBrNV3L99DgiWcx5sQv1S0CGPA5t5qhOjC0szIwnpEPPSXhmELBHZiUDv1QJdh9bnvcGfegxcmK8jSW7nD2awYJN/IkZXzH/bLuCha2mIo5EeXgmX+XbWYrzH+W9WcTfei2hrv2liBc9cOb+PUEXsKQMNfrNpkrqdJIS9jGmvKkkf4cfoO8QHjfuU9CT0jHJ6otI2I7MGym9IlMz0UxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LIFpwXdwPrAPW7gcESndmqFhKdqFACEesRPp41nU1cw=;
 b=BvNNs2n9wY5nMODNwVO87MwpEJUf+8COT6xwUA1Byfes2tK6YjCY5NBrVu6pO+Jj5Wo3Ezti6vz4yNey5B+Xny0n+mTiqNc3E90bBqpR7cS1Bga7PSYOEKjDL7xGfW3bLoC2jaExQ2WxQyTa9eavB+rewembwHMpGS9VzY/JMChRdJDaeAWwdR3e/J1uNaZsAnrLwxQxqfXSlEAjoGnfZvtOmBNkJ2LURzbPuJ9/Ad1sccygitTCgcemPJHwTwO04uW8WFS+vrVi5AIloih84wi+9FYLi1TD67aoEIbjrUeP1Hul/p3/wLeGSeKwgSOeoUlNpFeTrkX/4wWl0CoxbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LIFpwXdwPrAPW7gcESndmqFhKdqFACEesRPp41nU1cw=;
 b=bVMUvgZbUpTxzSlTAwG78DNmhCyO3H2spcYhcMyIhFv/QsoFlqSDNihXKVePzc5COub/LHFlbjGjsOjLjX3upKuSWXqA4q0NZ2M3jaTPo2b8EyFk8QOjxLYXDTbsRij7pJH7YR4Tc8Z+vuaKD0eVSKqs05BxJpq/ImG4RcpbOw0=
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS5PR04MB10058.eurprd04.prod.outlook.com (2603:10a6:20b:683::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.26; Tue, 19 Mar
 2024 04:53:47 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::3168:91:27c6:edf6]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::3168:91:27c6:edf6%3]) with mapi id 15.20.7386.025; Tue, 19 Mar 2024
 04:53:47 +0000
From: Frank Li <Frank.Li@nxp.com>
To: konstantin@linuxfoundation.org,
	tools@kernel.org
Cc: robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org
Subject: [PATCH 1/2] prep: add --check option to run necessary patch check
Date: Tue, 19 Mar 2024 00:53:31 -0400
Message-Id: <20240319045332.2304950-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0P220CA0027.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::18) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS5PR04MB10058:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iO41R7swZWEwIMm1qzq2kZz1h5hjG+6yrCs63qICus3KXBYy7eBncn9BlyXNzWYtri8a7EbHnoADmbVqz6yJjB5R7iOhgtd1VbKfqoNQO2h8+pQpSdayRtr0DAxSLeO9UKOQ/0ciSaek+GQYE7KM+3annPnPtfNO3I6qHfCTugrdx73wPg+XTOT+PZpNBz9EdhVXSZ5zfbZIgmpNdUr2FCirLbu5CnQN+QDh5igyiSkWvek76XGR94h+lQtewXO5gsLlHoiATei3M5ktbXPFygHOG3pskvd3jWZN1kbZNR2hoSRpMr3T41lRXPQzX/fR7PKk2qE/0pWaDoAUbP8KxZyRq7Nw9gr3exQZAJtLrpNcSJ7IB+5UZ+pUm+lCTHSkEj1789sZ28Mq4/Mx9vl4khtQfd8fU6RZeIXIJztE70S0tjaEd2HhlnQUMe5R+5eXB1T1mluIVUulVFWZycy/3AoQfldpLCyap/vq24nufvvkDL4czswnB+buG+LhJoKlSownr4xsw1jnAmE6dLUsE+8B8pZOGp7sPhSDFVdLV3xL8SO1DlA1PGTfYv7+Ze8nvFIBPJnHfoL57m6mUOX0Jvqt6xBqwqJ7pVKVSm+55kPO+NkHSKX1j3sECOkUpzxssOBxXKvqTAk9n9iuhr1i1k4zEBgNEbQVGbLI65/lXOt07+c3Cno6zzH5bneau7KLA242HXwwJB6r2MluDON8xOxY8iNzY9EN2927AUqJNjI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(52116005)(376005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Kgea3MjfHetwGKEPdwUXvxtb9783BhKiVrbSJzqJguBpfu4+QAHGNyqqKxFw?=
 =?us-ascii?Q?pQ6/XKQapvldgiBnH7gsnCW6gS8Al32EoIeXm6QVgT6yvUpWoFZmVFyxThdp?=
 =?us-ascii?Q?sh5ztfrJfV8qBarJiI87scT+i2eyaRrSD1ZkqqSk2P6mIjSvgPYjRJCw+X91?=
 =?us-ascii?Q?tx1r9XaerM0EmTp9GZPwLa3aa4t3S6ooKOqWaC+sg2TFOKZgzChr1rNqNgPb?=
 =?us-ascii?Q?nM3GrVyFUmEOLZctPmsSxjT1nLy9RysA8AWoBpaeANpqhRgZ7fhwSanyq7KW?=
 =?us-ascii?Q?G1gf7O63X4j43six+OIvjdP4jxg2MWhlUnljdkJRhkJqlaI87fjAtrKFrmyf?=
 =?us-ascii?Q?fLiNhmbmD9FbAe1s47Z4OyVEp3SMRh4BZp2byHnhJddT98qfZTM684p5Si/Y?=
 =?us-ascii?Q?f6fNnbhnk2k2yRqHT2ELm5XAeyX7JToX2F1hANUsGTXrBn3AOwfM051tzxr6?=
 =?us-ascii?Q?MrleS7y/F4Lj0mAvy9tr4BsPxjJvwEenFklqE2UgjncHIOfPPqnlA7T638OG?=
 =?us-ascii?Q?yxhon1IptTFt7x9wBVyspqs+jQWblUDlIgIbsF9gpxCR8b2oUtPIBD9qnQFD?=
 =?us-ascii?Q?kN+uddhDnb71OUIB7YxLHkBEQJlQp2QbgppLIO7yomUiol8WNTSZtYWxlUvy?=
 =?us-ascii?Q?PhsUh+mAW/Iur+DwNyFIWu5AHHp4HwJdzb3KEdXnfXYZBrsMaBe5izLybDUc?=
 =?us-ascii?Q?XXEWY/zaaxtYucBroO1RypQ/U/xpT6MKLd7xv7G2q2rF8ypJZebIhgX6Q34v?=
 =?us-ascii?Q?C/GiZsufIfJyYgvoKOsLz6YyQxlreANt0SdlWVqEeIOaKUY/sRdGvrut2yZz?=
 =?us-ascii?Q?wNKZ2mYNE2WM9T9ax52zoTEjSk5CVJiSroR8/slkV68fHu/FNyOYbH6MP1eY?=
 =?us-ascii?Q?7v8yz8V5Mz6VNYU7Y8bAscYodFHnjve6dNPwSYtrdh4e4IjFqPTXdkK3kqmr?=
 =?us-ascii?Q?2A9c0V4i46JFsrxhcqMAlk8IkYRrRyi+ofop9WyiS9N4d6724B/6ofl4V0mp?=
 =?us-ascii?Q?cw6OPl3x6SfX57vpg369kRMwqihjQPdqU2jnJcEdFyaYtc3YCKXW3M0DbWVk?=
 =?us-ascii?Q?psDY9b1cUCHh7KwzJeTxQjdWRVikuQToAPkSt8gZkpmAeOhmy8+HxM30LSL6?=
 =?us-ascii?Q?56WRrVC6eLKeGjoDDlvIzySvhI/NB20QMoNnksS2CrThrKoGwo66uGr1VZ1h?=
 =?us-ascii?Q?wZD7wFYtwN5L3elVfauiITmY+3dDWEsauTOby0KVehuPjEVVjXvxCU9dyQ3m?=
 =?us-ascii?Q?/ubtgEsLXu0I6sqPzNQReKBrdgm2h653BfHFm/b9tyeB5Y7XoelNQ3gRXmyp?=
 =?us-ascii?Q?Mky6suJjaSJoAygXAbVCccUeuZae5b6Ic3ae7qZJsm5H2iGW3wRIOVK+YUd4?=
 =?us-ascii?Q?KVjs3qCrwvrRwDqVk3QqYvH0b8my29k3SwNtHeal5VlrQQc9jw8WN+iJh9rX?=
 =?us-ascii?Q?NW/TXaruoPM4iRVXrL7nQHiafo8/yRDsqFYFsb82b0KHXZZ6so/d7x6kaGsw?=
 =?us-ascii?Q?62RkXaENsB7kmI+bYx3MdZkYzBjWaJ1rJT/nKst1QT/gO2GmoWNo+ZTUCKGZ?=
 =?us-ascii?Q?QHK5zYN6gF2qFQw39P4ZhJyfy6jteAMJbXtHZ4S9?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3cdc7aa-e331-4cd7-a68e-08dc47d08fcc
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2024 04:53:47.2792
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rjH7mTjkEnEwRCpfQ1ZAXmCr0c0kIgvhsSbiIKFMhBr0Lb6VsQGwK/fsi35GgfruvYVKQ4PwNiQjWDgaJO11gQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB10058

This just run script/tools/checkpatch.pl

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 b4/command.py |  1 +
 b4/ez.py      | 15 +++++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/b4/command.py b/b4/command.py
index f4516b2..5d3bbc7 100644
--- a/b4/command.py
+++ b/b4/command.py
@@ -291,6 +291,7 @@ def setup_parser() -> argparse.ArgumentParser:
                          help='Force revision to be this number instead')
     sp_prep.add_argument('--set-prefixes', metavar='PREFIX', nargs='+',
                          help='Extra prefixes to add to [PATCH] (e.g.: RFC mydrv)')
+    sp_prep.add_argument('--check', action='store_true', default=False, help='Run necessary check before send patches')
 
     spp_g = sp_prep.add_mutually_exclusive_group()
     spp_g.add_argument('-p', '--format-patch', metavar='OUTPUT_DIR',
diff --git a/b4/ez.py b/b4/ez.py
index 9207282..bcf6363 100644
--- a/b4/ez.py
+++ b/b4/ez.py
@@ -2181,6 +2181,18 @@ def set_prefixes(prefixes: list) -> None:
     else:
         logger.info('No changes to extra prefixes.')
 
+def prep_check_patch() -> None:
+    logger.info('Run check patch.')
+    base_commit, stc, endc, oneline, shortlog, diffstat = get_series_details()
+    topdir = b4.git_get_toplevel()
+    getcheckpatch = os.path.join(topdir, 'scripts', 'checkpatch.pl')
+    cmdargs = list();
+    cmdargs.append(getcheckpatch)
+    cmdargs.append('-g')
+    cmdargs.append(stc + '..' + endc)
+    ret = subprocess.run(cmdargs)
+    if ret.returncode > 0:
+        logger.critical('CRITICAL: Check patch failure')
 
 def cmd_prep(cmdargs: argparse.Namespace) -> None:
     check_can_gfr()
@@ -2245,6 +2257,9 @@ def cmd_prep(cmdargs: argparse.Namespace) -> None:
     if cmdargs.auto_to_cc:
         auto_to_cc()
 
+    if cmdargs.check:
+        prep_check_patch()
+
     if cmdargs.edit_cover:
         return edit_cover()
 
-- 
2.34.1

