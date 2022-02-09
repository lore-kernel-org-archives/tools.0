Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1anam02on2072.outbound.protection.outlook.com [40.107.96.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D6F2F24
	for <tools@linux.kernel.org>; Wed,  9 Feb 2022 10:32:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IrVQz9uwwFx48U/weOq33KoyYacm/8x8/gNyYD5P+vEdL6soT5X4bueJaRKja9eToAwLGiSqi0CUnYQcskhbyTSwMkCUAGqtRPd0UWP8nJQ58hpbMZES8uSRb4BSN1E+pEsrw/BmRjsDUXQJTorTfTNM60XliGPUJ0X7PzGLyfo2oMnL/S6ja0BopLYTVs3NxODPUsyq3p3o3uyKATxgLyT2pT9btRyx0008tv/CMi0PR4vpBiG9KIzNxbf/MOXQbWERNPsCknVAG5f0Y0a8YEZ8Hv9Zd1Sx5C2vzAK3HE82EPJo9yWCgoVcA2cUJiERjEthcXzuqBbIXmylrYTatw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vO6/1gIWov7iPtUYV9ZQinE+6a/a57M5z/4CJ5KDi0E=;
 b=ikpgBgZgnLHlzeN5yKuvm7Rb5MAlrPG6Fp105b3TQnrvw2719MCICsvQlcLV8u5sjea6GI5+At8rkPDHBaXl+Zk3YF4K+K2n4TjqakaDBu+WrEsMPbzPPQnrEZ0tF10rsvrReDtb8ohpAFOkqYOgaXW8aRetjPkoPVQ7lewtJF+8IDfggW5ybTtHniSLqgEb0yTY55IvjbQ9DXPyuR29WibnyG/huWnoD6cOWDhijaBbwkeZGp8zJjwLItsa6ysDN1TkmYXDPN4HkV+pIMCRSIF8nKSCQNE5TUbQY4QbAS7xVZ1PzXc1WuLWCKKH47IXml54h+w3+qctl+FtwEnznQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=linux.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vO6/1gIWov7iPtUYV9ZQinE+6a/a57M5z/4CJ5KDi0E=;
 b=JyuJU2QV8NEc6vyCYmaYiTqpMRkpyZuHCSa5XPYv63qNkFuOar6Vwiw9zn0kcirydxTTcCGgQtAliz2N9bteTbiHD2R05Iq3/Vyc7soBWnHGl1zOo5tkNoXE+sVD/AlgY8K1/UwfyzS7q0ohAh+FeIrgc07VVoUk864o3X9BsKs=
Received: from BN8PR04CA0015.namprd04.prod.outlook.com (2603:10b6:408:70::28)
 by BN7PR02MB5332.namprd02.prod.outlook.com (2603:10b6:408:30::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Wed, 9 Feb
 2022 10:32:53 +0000
Received: from BN1NAM02FT010.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:70:cafe::f1) by BN8PR04CA0015.outlook.office365.com
 (2603:10b6:408:70::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11 via Frontend
 Transport; Wed, 9 Feb 2022 10:32:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT010.mail.protection.outlook.com (10.13.2.128) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Wed, 9 Feb 2022 10:32:53 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 9 Feb 2022 02:32:51 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 9 Feb 2022 02:32:51 -0800
Envelope-to: tools@linux.kernel.org,
 konstantin@linuxfoundation.org,
 arnd@arndb.de
Received: from [10.254.241.49] (port=45586)
	by smtp.xilinx.com with esmtp (Exim 4.90)
	(envelope-from <michal.simek@xilinx.com>)
	id 1nHkHL-0008Jv-NI; Wed, 09 Feb 2022 02:32:51 -0800
Message-ID: <e6ddc3ca-74bc-14a0-6ebf-8cd331706899@xilinx.com>
Date: Wed, 9 Feb 2022 11:32:50 +0100
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Content-Language: en-US
To: <tools@linux.kernel.org>, <konstantin@linuxfoundation.org>
CC: Arnd Bergmann <arnd@arndb.de>
From: Michal Simek <michal.simek@xilinx.com>
Subject: b4 can't pick up patches in another patch series
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7ac28a8d-cf58-4dd0-fefb-08d9ebb78781
X-MS-TrafficTypeDiagnostic: BN7PR02MB5332:EE_
X-Microsoft-Antispam-PRVS:
	<BN7PR02MB533297D0DA7A9EDCF8F0C090C62E9@BN7PR02MB5332.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	C8/BNumdG7XzYz50UCqFAKN0swWwxz+if0234/B4GJEZKhQzz5a3XBf8DIzb8EOigOtz9MYwVB1B9UTqr4QnKZGBUEIPTl7WsPN2SrcXYsqxSnihtWZHvvKO2bEP6+d/bmwgke1KT0/ORhR723vgOw0W51Vy7EDl2J+Z63AjieHBJo2wfyh7sh3FeCIUJxcadIWym2W48ZsCy282q/H7Nad+mHiFO5Ah/govW3EG+8EzLMT01Xd+W6fD5wv7gCwKIrWrTk5Z6cUq6LQLaZYcz9toaH6uaMiD60Oj6jsqZaoTxBs+NrxqYl4b2BbfxyFBcpkEnQfKI0sTpjjZRdeTZsm3x0ckBV7jMvdg8dOhA5u0VnqOU0iV+4mOtGK2w/TipMBOg2Ybcp6ZFwF0keMwcRlXQ4Iy7DQ9eKNL2LNazriN0UW4Gt2ACQR0jODPw9UmOlDbn9AN1ZE302ysWveVni9fZusMevKfWlfOGLl9m8q28JrDe+kQvi6Q2joBR9Z96VOFf8bs1UyHlYD/xMQJy+wAOtCapYoE3Tl9vh4PKGEXGCTA9qkicrr2a4yKjeRtFLd7DA5PRFrzKv/bVOOa/8jN3CNHrQy/vQXCeuExxxvXoxu+cHJklgol+TCKC0i+jX+SPp7M8tDgE1WC+b8eHGQswdNsUCVdW58cxyQBwCcHbdDbihArkNT/dWq19/yZ3fsb0q5J22hLu6eFcmc9TbOfaZY8QSktkA7xnFSqxBqgxowakhRjP/8CRSeNbKfwVpwTB8BCwILKO4TYF3bk9vOqDnC7UQ4ZTgBiZYPvAVzfgD6FDw+cZF2ENvkgfPcJsEg/aQ3HJ/PJ/M/4WzYXBA==
X-Forefront-Antispam-Report:
	CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(8676002)(36756003)(83380400001)(70206006)(70586007)(356005)(5660300002)(9786002)(4326008)(47076005)(966005)(82310400004)(8936002)(31696002)(7636003)(110136005)(426003)(316002)(2616005)(31686004)(2906002)(186003)(26005)(336012)(508600001)(36860700001)(44832011)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2022 10:32:53.3215
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ac28a8d-cf58-4dd0-fefb-08d9ebb78781
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1NAM02FT010.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR02MB5332

Hi Konstantin,

I am using b4 for quite some time without any issue. But I have just found one 
issue in behavior.

I want to pick up this patch
https://lore.kernel.org/lkml/20220117132757.1881981-1-arnd@kernel.org/

but because it is the part of another series the whole series is pickup and this 
patch is ignored. It is understandable how origin series is found but I think in 
this particular case Arnd's patch should be taken instead because it is clean patch.

Log is below also with my b4 version.

Thanks,
Michal

[linux](master-next-test)$ b4 am 20220117132757.1881981-1-arnd@kernel.org
Looking up https://lore.kernel.org/r/20220117132757.1881981-1-arnd%40kernel.org
Analyzing 119 messages in the thread
Checking attestation on all messages, may take a moment...
---
   [PATCH 1/2] signal: Have prepare_signal detect coredumps using signal->core_state
   [PATCH 2/17] exit: Coredumps reach do_group_exit
   [PATCH 3/10] exit: Move oops specific logic from do_exit into make_task_dead
     + Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
   [PATCH 4/17] exit: Use the correct exit_code in /proc/<pid>/stat
   [PATCH 5/10] exit: Stop exporting do_exit
   [PATCH 6/8] coredump: Stop setting signal->group_exit_task
   [PATCH 7/17] ptrace: Remove unused regs argument from ptrace_report_syscall
   [PATCH 8/17] ptrace/m68k: Stop open coding ptrace_report_syscall
     + Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
   [PATCH 9/10] kthread: Ensure struct kthread is present for all kthreads
     + Tested-by: Nathan Chancellor <nathan@kernel.org> (✓ DKIM/kernel.org)
     + Reported-by: Nathan Chancellor <nathan@kernel.org>
     + Link: https://lkml.kernel.org/r/YcNsG0Lp94V13whH@archlinux-ax161
   [PATCH 10/17] ptrace: Return the signal to continue with from ptrace_stop
   [PATCH 11/17] ptrace: Separate task->ptrace_code out from task->exit_code
   [PATCH 12/17] signal: Compute the process exit_code in get_signal
   [PATCH 13/17] signal: Make individual tasks exiting a first class concept
   [PATCH 14/17] signal: Remove zap_other_threads
   [PATCH 15/17] signal: Add JOBCTL_WILL_EXIT to mark exiting tasks
   [PATCH 16/17] signal: Record the exit_code when an exit is scheduled
   [PATCH 17/17] signal: Always set SIGNAL_GROUP_EXIT on process exit
---
Total patches: 17
---
NOTE: some trailers ignored due to from/email mismatches:
     ! Trailer: Reported-by: Nathan Chancellor <nathan@kernel.org>
      Msg From: Eric W. Biederman <ebiederm@xmission.com>
     ! Trailer: Suggested-by: Al Viro <viro@zeniv.linux.org.uk>
      Msg From: Eric W. Biederman <ebiederm@xmission.com>
     ! Trailer: Link: https://lkml.kernel.org/r/YcNsG0Lp94V13whH@archlinux-ax161
      Msg From: Eric W. Biederman <ebiederm@xmission.com>
NOTE: Rerun with -S to apply them anyway
---
Cover: ./20220103_ebiederm_exit_making_task_exiting_a_first_class_concept.cover
  Link: https://lore.kernel.org/r/87r19opkx1.fsf_-_@email.froward.int.ebiederm.org
  Base: not specified
        git am 
./20220103_ebiederm_exit_making_task_exiting_a_first_class_concept.mbx
[linux](master-next-test)$ b4 --version
0.9-dev-e7823
