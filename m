Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F2D3B784
	for <tools@linux.kernel.org>; Tue, 19 Mar 2024 04:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=10.30.226.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710824034; cv=fail; b=qqQ5p7qXKDx/0qafeLTIrqa4tI7z4zb6GJB77wEcm0Fm2jbG+TumvP0OT2ZJFebQKNf68XP8fmNQCG8wkFPmPs6Dw0S/0YrNz8nSOAnBe4izXX7/QbmxbNR/8pojBQojZBjcCyUJ8XCG1oW/kiUZd0q1alFV5uZOGSl91pfoMn4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710824034; c=relaxed/simple;
	bh=7gvfeVhwis5+hyofdRFzInuotam4y1jDTsVtCIPWmmE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=H7xmash9lHNGtkTe+2fEire7A8YFpOJVabBEqnGj3c63dP0rJWPe5L1bNiY3zIgjz4ohlzSZ4/2H0t+3p8UFYpxFXG7542dnwcp3oPS+1zJRnDIG525R8aEQDc47+7jG2vfeefOXVlfvkZhJw9cUzCUo01lgiCddgGVVg2gpX3w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=XdmT8DMA; arc=fail smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="XdmT8DMA"
Received: by smtp.kernel.org (Postfix)
	id 29800C433F1; Tue, 19 Mar 2024 04:53:54 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2103.outbound.protection.outlook.com [40.107.241.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 76ACDC4166A;
	Tue, 19 Mar 2024 04:53:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 76ACDC4166A
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q5aAquwA/FkONgWeM2wqC1pte3Z1/ia7NSrbxDAPTsuz1UI9/OQ8X43qcc1Zx+bptoZVPIERT95ZqwJ+C1hXwsHMMoEzUShC9TJTX1gEb1XFWXntJOYBXa9UpnB00ozcpPmZXMsqdrzBs8SdU78zOn7xsZ0xy5gwOoST9++rOaXhPF65SQNQlUOxe2VOT9gXcCtIvEpVVrTdkflkj2STISANHyEh81YKYARnb4cNhtjP5lacqKJ/ciO9nDlOIK9udJqV6JkGyeSPpgtv3yNHIzPF/h7z7Ml3J65EArpV/K+UMSorc/O5pulnFLKnXKFu+2pG7Zcv1ClWaQ8X+YH2ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CAf9gOtCO7lezdCOwI1aw38fEFj8BOnRAVBpDSrSMw4=;
 b=gmHEHojko0Se5e9izJc6UKPVfhZgWBGeVrqtq42gpy5HW4JXo+HJ1+GBDeXwlSiYCiydzG5bJ0DiZHVgR/w+q0XxgpD3VY7VQTSmS+YV/lzp7Ip3hjEU8vjEzsbCM1dk4LNSs0XSZecMTn8M/qUXBzqQXe230xfJh+ds1ZOejrb/Eyf4wpomvNC3EuASUUTldXo0U8zl1MtZjYpn1IWc2bSSm1PkNEWARwPvoJqwsGBcLtPn7J5xXd3ShqCx3zgeOHc3aP2gXk9ei+KC2rVBF/GJVzxykULKgvOuQfVdBdl1defudOSRVOKewU7qEMlkgZ8GfQw5Wkropl+ZtUiF8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CAf9gOtCO7lezdCOwI1aw38fEFj8BOnRAVBpDSrSMw4=;
 b=XdmT8DMASHpAK7GR3zzAwFR2wzTxW0H7lSDhqyNnPTAYAQ3igIumdf3MGE2/Sn4fnVsVzMGcL9gM3/6h88OhRJXayLeeyLcPxerGTumUQSxRQ5yE2ljM+/I2zu/JbCRR4CVmpSiQ8SJ/WdafPV5qPIgjT5tizWD3vPCSMDfcXes=
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS5PR04MB10058.eurprd04.prod.outlook.com (2603:10a6:20b:683::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.26; Tue, 19 Mar
 2024 04:53:49 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::3168:91:27c6:edf6]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::3168:91:27c6:edf6%3]) with mapi id 15.20.7386.025; Tue, 19 Mar 2024
 04:53:49 +0000
From: Frank Li <Frank.Li@nxp.com>
To: konstantin@linuxfoundation.org,
	tools@kernel.org
Cc: robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org
Subject: [PATCH 2/2] prep: --check run dt_binding_check when patch include yaml file
Date: Tue, 19 Mar 2024 00:53:32 -0400
Message-Id: <20240319045332.2304950-2-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240319045332.2304950-1-Frank.Li@nxp.com>
References: <20240319045332.2304950-1-Frank.Li@nxp.com>
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
	EzoCAeNHoP3olARI74YUwaTIFpRoSHQ1cyQvCIxXEYILyIFFJyg4ojZEFPaK4+YdJ80MQhP/5O4QQO07wFCq0QoZxVjoy25Kq1huepZgcdQGsMNkzooFZCe3ijWQ6E2645nycztbzr5SXsrMxziOwr2Af8C52aWo1NYZDbjONbaul0YB4OK8O+uZrF4b5qYrwPfGyGakf2p5LqMRFLOrO4VAU0lfYbHCVxUxCS49Kb0rCponzhCnk0drf6oz8BO1d0kMh1ob1Ib2xPefiWD4swh7eI9HcSbVWhJ22rPVTBMPd1LCmgdwC416nGfNm5Herby9T+tVG1qz7Cke5/LMn8ay4i3Nmww3tppeyomdWFBmGB/+OzKKogW85IWu484crykzuwAV5I23yxMrxVfCfxrPl6m2VO78SZx8yOjh3rZEc0QkMQ74+kchi9QIZ/uWSKT2l2LCTgrsivaf+VCnrUnJtoacrGlP209YaWSK2FUZrqZhNTO46RmHrEh/aIuHD5uB5Kv3CbrsojSu+HqdMyNsafhUSB3omuDPwZz7In5CXHkJsn75WadWcDKV7Gcgt52/2UIWyEHzwrZ/sE/HztzvJbS+4pR/U/YHmQDwwWAI5/gEED1FPxj1s8GmN5PDNKYudlc8A0paSqJIbR2uZhTsHYZabH438lq7vv6dIwzNI7NgLMEfQ5LJjR2y31mgU1POzVFebY21K9NtDg3r65KBhwxi/zSZpAv6/hZEOMg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(52116005)(376005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?haqGhXeVbIFsX1qWaFT8gn/bHZxqqpwJXamycAl6Sj4nO0PAQOa7oj/u46C1?=
 =?us-ascii?Q?s0+I6KOqYJoqPlwinq842HRoiFaB0vpHaLbnKRz6M61xxSVvAjZPxFCjs+Aq?=
 =?us-ascii?Q?vx+VTk8w35Qqz7L/okiCUD9ikALdZlVI5N6kGNMD4HRl025iUeP5saZSXM6k?=
 =?us-ascii?Q?RLW6u4rQF9vtB0Fe6+e2GfXZ5eon0ijylnko26TozyrFWe4N9MTM0Tla+J/0?=
 =?us-ascii?Q?3uqzcAYAeYNEmLO1SINCQdvQi9bZVuIu4x2Tmd+wVrmhTZtGI+bNkOdqAhxx?=
 =?us-ascii?Q?seF0gS2USX1yuIbarMRYuM0ZbmXIUlAja9jtdI3Qgn87WlMXufPAU6rx/0Tu?=
 =?us-ascii?Q?tKUYQJ3wsMDVisZnMGpk2z5Ja24hlwm3+RUmLFXujWfLSoHi2T8s6NJxVJ7A?=
 =?us-ascii?Q?XawSi64C2il2p+AUlh7dFAfo7BBsBALnZnKDlRWYHHQIt0aqehKFRoLQTqw0?=
 =?us-ascii?Q?ymsu2rH6Jd3hfrsIxa0S/UsT2rsQ4LuNQIUtpdee00LxYrIhrI8a6W8wnFnn?=
 =?us-ascii?Q?MJ8/DhYnrvetTdD96QmNiKF+TWnaLDJonzoIsoVebKZtR5802C/b3sgL0m2M?=
 =?us-ascii?Q?29072rSojNh9xPr+Nib9Aln+6clCoRJAAy7KUFZtX5FjZ1mUsBlzGKJCGUzg?=
 =?us-ascii?Q?g1oyH8SG27qDo24+llSduC1eNuDYrhW43rc+cfQDl2APzjkPZHm59c08DWLF?=
 =?us-ascii?Q?lk/ffIRRKtfDfqc+pG0gjZKFR297OkuABLYaWnis+evYlqK+bya2rJFLSGjZ?=
 =?us-ascii?Q?aWHgeoc3XyRoHi/kZ0Ex66Exee0Tt3eM38jKtLBmi9dx1jqG/tmaU2yrV02s?=
 =?us-ascii?Q?LKZOpAsbqUWbiDO5ZDvTOQI/bJNDSd97hNx1IWFVweYawfHEwBEYoV9clblT?=
 =?us-ascii?Q?A+NThtWp5g8r4Hptn+JQPQugt0hx54wdGOUDdbLoJ7wC7zbHUi1hXE3Rmk3b?=
 =?us-ascii?Q?ZZh8m5vp4F2R4REBt6dtizVUjfLOWrUz83GkfgnQwPdSD+sxhnZPz0xmDqd+?=
 =?us-ascii?Q?CfQTr5g/HMH61am7cZlmwgLxUdgRpEIhzbK7vj+YY0MXiqTT3GRDCeBp3h13?=
 =?us-ascii?Q?RflvKMWRqwLegANFph/p82/yimLuIOoqLYxsvCedVn2iZMlOwTx94wJMr69s?=
 =?us-ascii?Q?y1so5c+v7/cqUsCW9H918HLHh8ExXIztvItv7ef/E/aRYgUqVuYPXl0RAWmj?=
 =?us-ascii?Q?vwHdrP5DEO3E1/Hh1FeX7CeSeiMhXYSgzmPdHab3FD9hgs5LCBLhPNUAr0dM?=
 =?us-ascii?Q?N33GFCgPZ+0dqToyuIS4Gj+JHhPruAOrEKNQkR7hUvE9S/jFGlgt2fYuQSg+?=
 =?us-ascii?Q?1rK4fC7R9IzNDg8o7pNoXaz6p5z2iSYbdpICOcHt1KA4f+9CcuytUL60SAL5?=
 =?us-ascii?Q?wK0Gbq3IEVHka2HjmepjS71zocR7VSAv7lU0dtarzFEvCnm5UV4ceQP1B1tR?=
 =?us-ascii?Q?p1CG2Hp/3WHKvUeHvloBrS4VuwflblUncJIgHTF6GnOIztGg+3gQyY43bsGS?=
 =?us-ascii?Q?4QQest7U5vdtW472L62XEoulovh+/TWN0r/CzV76gyO0kNzr3dfIE0lTYwau?=
 =?us-ascii?Q?BLEyPsB/wBNHqQLfqBYcfCHIthzrtIWefJ5zX5u0?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a60f909-917c-4092-e474-08dc47d090d5
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2024 04:53:49.0001
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4unvl5HGWfpdh4giYau9Amq/KvntEHKRp3YchuuorjrtczFnqdPohGHES/B/o43tkOsXxH86ETY0H1GM5HHJOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB10058

When patch include device binding yaml file, run dt_binding_check

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 b4/ez.py | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/b4/ez.py b/b4/ez.py
index bcf6363..c3bffa0 100644
--- a/b4/ez.py
+++ b/b4/ez.py
@@ -2190,8 +2190,30 @@ def prep_check_patch() -> None:
     cmdargs.append(getcheckpatch)
     cmdargs.append('-g')
     cmdargs.append(stc + '..' + endc)
-    ret = subprocess.run(cmdargs)
-    if ret.returncode > 0:
+    dtret = ret = subprocess.run(cmdargs)
+
+    gitargs = ['diff', '--stat', '--name-only', f'{stc}..{endc}']
+    ecode, diffstat = b4.git_run_command(None, gitargs)
+
+    for file in diffstat.split("\n"):
+         if file.startswith('Documentation/devicetree/bindings/'):
+             directory, filename = os.path.split(file)
+             if filename.endswith('.yaml'):
+                 touchargs = list()
+                 touchargs.append('touch')
+                 touchargs.append(file)
+                 subprocess.run(touchargs)
+
+                 logger.info('Run dt_binding_check: ' + filename)
+                 cmdargs = list()
+                 cmdargs.append('make')
+                 cmdargs.append('dt_binding_check')
+                 cmdargs.append('DT_SCHEMA_FILES=' + filename);
+                 dtret = subprocess.run(cmdargs)
+                 if dtret.returncode > 0:
+                     break
+
+    if ret.returncode > 0 or dtret.returncode > 0:
         logger.critical('CRITICAL: Check patch failure')
 
 def cmd_prep(cmdargs: argparse.Namespace) -> None:
-- 
2.34.1

