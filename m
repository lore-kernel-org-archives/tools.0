Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com [216.71.145.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E491FAA
	for <tools@linux.kernel.org>; Fri, 30 Jun 2023 12:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1688128617;
  h=message-id:date:from:subject:to:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=wLsgfQbsodS4bfXvARTy0E/13Ut7OrfUPrN6KFOSn3s=;
  b=MhhRR5L2+qw/YKHumKsyJl406Vyn6GGEnd1kcRFqhSdN1RvfEt9ANeJF
   4/0H9YSHE64G9ud9ROm6owv0LsEc3PEaVjdfvdmAQ8FvHt/DeJYKgIYZB
   GBpv4V/3fcVzANF7RuC3UJ5LyPFVogJUTwMhG+HAqL7mfIRumrLWdFWkJ
   o=;
X-IronPort-RemoteIP: 104.47.59.176
X-IronPort-MID: 114759120
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Z4cMWKqGloRYvLkt6wryAooA9fxeBmIpZBIvgKrLsJaIsI4StFCzt
 garIBmCOareMWD1LY1xbduz8U4C6MCAnNVgHQVkrXthQ3kU9JuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKq04GpwUmAWP6gR5weAzCFNVfrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAC0oXk+Dg7is+qyQdKp1u88mIfSxF4xK7xmMzRmBZRonabbqZvyQoPN9gnI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jemraYWLEjCJbZw9ckKwj
 2TK5WnmRDodM8SS02Gt+XOwnO7f2yj8Xer+EZXhr6I13QzKnDR75Bs+UQv4g8GFjnOEZPVDG
 2E53yUtlagRzRn+JjX6d1jiyJKehTYWRtVaFPES6wyXzKfQpQGDCQAsUjlGbMcOsM4wWCxs1
 VKTmd7tQzt1v9W9SnWb7audqy+zPwARLGkfdSEDUA0J6sXip4d1iQjAJuuPC4awh9zxXD31n
 TaDqXFkg61J1JFVkaKm4VrAnjSg4IDTSRI47RnWWWTj6R5lYImiZMqj7l2zAet8Ebt1h2Kp5
 BAs8/VyJshXZX1RvERhmNkwIYw=
IronPort-HdrOrdr: A9a23:YuwJDqHOIyyig5i8pLqFrZHXdLJyesId70hD6qkRc20hTiX8ra
 vBoB1173/JYUkqKQ0dcLy7WZVoIkmshqKdn7NhX4tKNTOO0AGVxepZnOjfKlPbakjDHuU079
 YeT0AXYuedMbAQ5/yU3OF2eexM/PC3tJmNwcPi5zNVSwduApsQnTuQyGygYzNLrM0tP+tIKH
 JYjPA31gZIAk5nCviTNz0+Ru3eoN+OvIv+CCR2fiIP2U21lDa177y/OASZ2xp2aUIz/Z4StV
 LdlhD/5OGFu/W2oyWssFP73tBtgd78zdkGItKKhtN9EESLti+YIL55XqGEvnQOgMzH0idTrP
 D85y04Oth16TfqcnqrrQDL0w3tuQxekEPK+BujmH7+ps68ez4gEcpGgutiA2Hk13Y=
X-Talos-CUID: 9a23:GJs+f2C7f7kUTgz6EzRCxBEUHpo/SGP28jTJHkS9BFszY7LAHA==
X-Talos-MUID: =?us-ascii?q?9a23=3AP/zYAg5PxfcEEhotrPStq1d8xoxss+eMMHwJrK8?=
 =?us-ascii?q?5nNW0GAFVNDSljBeOF9o=3D?=
X-IronPort-AV: E=Sophos;i="6.01,170,1684814400"; 
   d="scan'208";a="114759120"
Received: from mail-dm6nam12lp2176.outbound.protection.outlook.com (HELO NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.176])
  by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 30 Jun 2023 08:35:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N+hEqPF69qbO7DPEPv4JPFqaRpY1Xf49TjkOu9SmxAkqnUyoJw8/QV4yVYLkYDXdwgtY8lEIvXIwJFbJM2iKjv3cgQMg18rsUJs5hruJrNH28omaIK7MrKrFhBkcQ8+v7kUGdJmcVCnDnH5ikwTMrraGR8ZZ5MO6MgI1oXm3XXqIOuOz5PNOymgyds2qtVfcpoq1m5VPvKQte/2riI2G8tiGgbq/gezF5FwDea0LPc5boUuyTU4LyHFLtDYnLk6jZiQUnzVwWIHF+SiDJ4NT+gVUTQzvblvDjkdzT0Omkf/LCVEZ5CKxjFM8l44h9wcqkWwt6Xh2+ejccZDmTCx3Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wLsgfQbsodS4bfXvARTy0E/13Ut7OrfUPrN6KFOSn3s=;
 b=hq5VkgiwR5xkWD3nFBMnPQ9z52jmS3ID5CKtKsyAPW/RlcAWT2/fO1nqX8jIQcXHktvXsG+hSXvdsFqaNww3no4Ir2kkGMjfq4SEGQVL/rGZ4ScnR78PEzxkyRsXqjb4FUkgMPjLx0Od6pyFxrZK90qoVUMKhLR2zwrSKB6n4DX4T71YI3DarWKPYxZt7XW87S7fFFKl4CQRT4OY72Zgs/JvYPtceutvnvmKlbFv91EmBZRS00ObsXn4ifbR7orx3uUQVIovOP4rJwY2uk3/WjXoLzFUOmEbeAMJNqevBggsbgpEJo42EMGDjwBjl3FVy8wLEAvvfdHovbVoqml5WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wLsgfQbsodS4bfXvARTy0E/13Ut7OrfUPrN6KFOSn3s=;
 b=xntB9ZFGVQ/v2qQxZ/GnRUvHvDYSX9+H1tl1pxwqO2RJPNqRJ4BSj+RHSxm2fWrVR7C7bJO78y+Tz0zyyCWpmey831goo3c+SYHHKk10PW5ERDWtR/JGcNlUevNtnJjBG7X8TDaQi6LhCfTDhzvNhpGU7ym6crtMZEMuZqw4AGY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH0PR03MB6769.namprd03.prod.outlook.com (2603:10b6:510:120::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Fri, 30 Jun
 2023 12:35:42 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606%4]) with mapi id 15.20.6544.019; Fri, 30 Jun 2023
 12:35:42 +0000
Message-ID: <5eb64879-485c-47f5-abd1-e237ea3978e6@citrix.com>
Date: Fri, 30 Jun 2023 13:35:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: andrew.cooper3@citrix.com
Subject: Re: b4 shazam in a subdir
Content-Language: en-GB
To: "Kernel.org Bugbot" <bugbot@kernel.org>, tools@linux.kernel.org,
 konstantin@linuxfoundation.org
References: <4e4757cf-7351-9aff-fada-2b03ff82b2dc@citrix.com>
 <20230622-b217393c2-04f4c2d35abe@bugzilla.kernel.org>
In-Reply-To: <20230622-b217393c2-04f4c2d35abe@bugzilla.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P302CA0029.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c1::20) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|PH0PR03MB6769:EE_
X-MS-Office365-Filtering-Correlation-Id: 35914612-733a-4dd6-ca28-08db79668437
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dOHeyYG0OWleuv5KqveY6AW+4pciM+MCszirgoV7t/YMi6qprExZ37jlw+tJm2ctv/yaoSLXP/l3cdDXMtOmtnC9zECCx+IVsGjnttzaRHUUcRWu9BUPJT7v0sfyVAf8Vj/hXe/cZvzE/2LDfGwkyQt89WacPHmpWc2BRFwjGR3gMxP91eUy0SASMZidfAm3X3qZmvnnBhrl8/auED2ELuPjSrszKMLX9QSHx0+qKM8pxGegYiX86GwWhBebonb6n1himpY7u5JRpV9zjme7BvNfuOCKuW05vmPFvxotrovJbzhow6kE0Ie57JkMG+Xd+YJ209aqWYjG2sxaIndwvtxlaVLx7jbqDvvkSOxExyydIBk15DT9/nSEaO+Lgk9ZYn2IzPGYXyylo9o+aYlD9YKaXVvJ7sL8Ir+k6UISGn8fG9dKUoymhTpoGKg4RGTADui9On8dS86ZLa5NiW0EkBAIPomhvyrQHTE0I1B1w1ZtT+Bu5N9UO10WT1r8mCUsKaNvlOE6wDnylLbQITv4Jl3mrWwFMO/C8QKWcrjuzOdNnIEYyNgsCR/VN3hS+0LdyiBxloxbXmOqf3NSJSHq8NOVJZDCQCQeu2W+I5H1fMc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(366004)(376002)(396003)(39860400002)(136003)(451199021)(38100700002)(82960400001)(31686004)(66476007)(5660300002)(186003)(4744005)(66556008)(6666004)(36756003)(478600001)(8676002)(66946007)(86362001)(31696002)(6506007)(6486002)(966005)(26005)(53546011)(6512007)(83380400001)(9686003)(8936002)(2616005)(41300700001)(316002)(2906002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Slc4emhNdGYzU3lHOFRTbWZPVm4ySWxQSitKc215M1hJUXFabDZwblRadzRy?=
 =?utf-8?B?ZEFIZ09uRThYRVZ2aWdraXlGN3hUNXlnbzB2aW55WHpDSzFWSWhwWXVOdnoy?=
 =?utf-8?B?a25ZR0ViYi9TZzM4ZkpiOXNHcXkxYjR2YTY4ZitsZ2V1L09oMythVFNUOHIv?=
 =?utf-8?B?bkx6RGRveXhPRmJHazVrTHlMTlJMTUdldy9BQlVQSWorNTY0cWpma285NmNi?=
 =?utf-8?B?MEdhOWQzYWo4OFdHVndoR2RqZkNsaTZlc1FBQUQ2aUZ4U0NlSFFBWE9JdEh3?=
 =?utf-8?B?dEErWExBcC9TV1ROZzdIcXhaK2pOR1I4dmpkQlYyNlNJRlZCRTBYb1YyR0h4?=
 =?utf-8?B?OWJtcDZYRkJnM0xpZkVSSnZQeEEzMmZsQ0o4OWhUNmdJNDJqeVoycFFhaCsv?=
 =?utf-8?B?N1ZrK2ZCTWtFaHFVQlJLNW5ZMHBuaWhGZWREL1Vlb2pmRUFVcTNEblE4aElP?=
 =?utf-8?B?N2ZDekVIYkRJbCtneEkwVng5L0tSYkxuYlFTK3V1N1NUQ1JrbWJsZTdUZkhY?=
 =?utf-8?B?UEFzVndBUVNCNHNrQ0RmSXYzS2lQNzJEM1BCR3RFalFUYTFQNHRKZi9jKzlr?=
 =?utf-8?B?QlFab2FyZWVDRmNBbUNMZmQrczlYNXFYMlZPbkJwcHFwZ29xMkk1TWFGYlpH?=
 =?utf-8?B?a2hZcUVTNEhqYzZsZk4wYmp2YzZLNlZBVEhFeEVISTAwTmFOZVNqcUJlb1lj?=
 =?utf-8?B?UmtSem5CWmJPVFJ1ZnN6Z0RQTmxWM29MZEtSR1drN2JoczlHSzBtNFdxYmYz?=
 =?utf-8?B?N3orR0phc09mb2x0dTBxMnpNVXNERThGaXJZS1ViSnpzbGtHcWZrSHBzVUti?=
 =?utf-8?B?WFl3VVZPTmdWNVZzSFJuZWhlSlN1WFhYbktuTERUZEhwNk9OZTNxZzFiT1Bv?=
 =?utf-8?B?UzlGcFNNZ3ZXc0h6NldjbThsQ1Q5UEJ4QVJQVWNqZGErb1BjQ01sbGZFVU9i?=
 =?utf-8?B?UkFpSThuVU5iWitvaFNJMmxxejNKN0F4WU9UcXBPOWRKbmo4RlZNQ1JiRjI1?=
 =?utf-8?B?RlFVNG83em9YWk9BRk81cTc5WjdOWEhOWTZLbDVRUHpGV0o5dXFFTm9jUFFh?=
 =?utf-8?B?ZUVEc2YydGVSRlQ4UDlkanRyV2VteEtQTlZnL0pQdjZuWHdiRlZMTlhmYm9S?=
 =?utf-8?B?S1JUNEpzY1E5NVFSazQvVDNSRGc1eHhJdzI2TCtRR3RjUm9nTHNpNHQ5aXYr?=
 =?utf-8?B?UG5NWjNPQlFPM2QzbUJhNVJiVXQ1ZWw3OWI4eGtjeldkeitkc0o4QUxXQTMr?=
 =?utf-8?B?QnVqZU9XbUpDV0xNUlozVUJVTEU1VTVTcldjamd4M2o1TmdhR3RSNVl5elA0?=
 =?utf-8?B?SGN6UHpXNTF5eDVKUVdrNENhVkRJYS9sUFQxRXY4WWRRY0ZYK1l1QXl4M1Rw?=
 =?utf-8?B?MFYyTERWWVJka204Rk05SnpMend2b3ZRUFpvNjJ0b2RCcWsvYi94OE9ZeUx2?=
 =?utf-8?B?cFB5OW43bU5oR1QzcHhRMS8xUG44b0ZSTWxvMEUvMnY2NGtnbFlXU2RERmNS?=
 =?utf-8?B?eERKd3ZSWTlYUjBLWXYwZXd4cE95QWwvbWRtTW9tSkE3WFZib05PZ0RhRDlt?=
 =?utf-8?B?b0hPRjFpeHVCNFdkRE9mZzhtT0VJZVFRbWlNemhSc2NLTTJjMDdwMDV4ekNJ?=
 =?utf-8?B?OTVnUUhLMzdtaklzNVU4Njd6VFgvM0dxUEM5V2NPV1N2REQvMTdjMGNVUVZt?=
 =?utf-8?B?UjlUbFRpOWsvR0RHakg3RURveHd4Q1Yyb1VmWitOeHJLYnVxODRiK0JOWFpu?=
 =?utf-8?B?TVdqMUhIUW10ZmZleW9jYTg0OVlWWDF0OC80VlRIQ1VXd1puY2tLT241aHIy?=
 =?utf-8?B?d3ptbTNIWHQvaGV5dFpnaDRzUHlwS0E2RmZBYzVmbHU0UHNVSC8rUE5xK3Ax?=
 =?utf-8?B?dktkdGw3UFpIbmpoVEdrTEwvQ1QweXozK3Z3d0pXL2t5V1NoQWwwd3NURCtt?=
 =?utf-8?B?Um1MWWhldWhUd2pEWGNyNk1zZFFpNGVnUTlRSWZDdHl6N2UzeFJoZHBIY1JC?=
 =?utf-8?B?OGpOcitxSVFtMjdINjJNRFZFaWs3cEFtaEFUSytFTVNwcFlkNEJIT083Z0RR?=
 =?utf-8?B?bi9ZYW4zWCtBNlZmTTRUUlMrTmRnQzgwMC85eW5OQWRuclM2RERmU2xMZGRZ?=
 =?utf-8?B?RUthdkE3djBFNFFjL3J2M1V3RVc4eTJLb1NEamZEV2lNeVdoTEkyR3JuWEx4?=
 =?utf-8?B?MkE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	hrTVmfDzEllA4DhdUfsXh1Osj+Lt+hDJ2NMPM77DCJTCjhCzVfd9xnOREdpba/0bkiPr4t6SRI3XDBcApPRC88t0DtoewPz8EKBlRib6aPteeHFFsLatxQbGQKyFBTQcikHqzCnyoVtVGLHtglWW8WW8Y2YQMyy2tLfgyir+sDAtDxejt6uhiITnhTVwSDPJtMeAvScS6Ju7HxeLZyQZbGFue1tJN+P8UN9zbjWF0H4e6Ugr5ZngFfFvH/3bO0c9NipseTwrt0MxukqPJAtOSjC3hJ3urwTg8nzUlaQ9Sa1jCUoYN6uZawpc2h7ZdQRp91yjp7xp03EZWOVAiyBIePMlMhJcxETIbb1P3HOWlX7igRfGx2G20Hlszi3jN6Z+oN/Sa6wznREtI7OxLcik9G8JQUx3s6O60jenOD7fRT43JQdQT/g0Fi0IEm3/DtRbnYiqcqg6n4vi9gnbFxrkj/thahtXiUTmJPVFM+pmCwss9sQU4kJuzu1QO4BDyQYgbe92f9THXRkGgucpAroV+PngGo1U4DNty0MhMgSh1AhqOqegCOdims0n5tHYVpcRi5qwpGmaHYe2o3nkeEFI0ViX09aCqLM4+DIYJzcUlkxe9z1+WjRN4a77ifYp4xL1v7WO9CfmuHTMlGcKKHT1BjQEVcgIDSiBKMETBMa7MbvLZwgJ2UU1rWWT17hU2r27EdKc279IvAKPiufYf4K7UyDVXiHwbjeK7/EEUMhnOHudWvn02UB3y5zVLMGUH35GI8eVxKrx6e2U409cxBjN78JM8bF1x+Jr4y5Y0VF8YVS4OYMXYFvLfDUKpRz/U3EFDjP2v2GWg2lJ5qIN9kvXKsh2cimEUWZ1UCfNFDdNURw=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35914612-733a-4dd6-ca28-08db79668437
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2023 12:35:41.9872
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xgKGArYbg9nBmpx7GQxsRbmrFiRkUxM8oH5rwprHzYGQp2RcXbw7fv1yEQ0IjVofhXuvkptFzm4UOLaWvNUFaFXduk93/pf8LR9VdUWNwRI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6769

On 22/06/2023 9:21 pm, Kernel.org Bugbot wrote:
> Konstantin Ryabitsev writes in commit 73291165599839de9a2dcf4986c35a2041b22d09:
>
> shazam: switch to top of git tree before running git-am
>
> According to reports, running "git am" when not at the top of the tree
> can result in the dirty tree state (see linked conversation). This
> ensures that we switch back to the top of the git tree before running
> "git am" and then switch back.
>
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Link: https://msgid.link/4e4757cf-7351-9aff-fada-2b03ff82b2dc@citrix.com
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217393
> Signed-off-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
>
> (via https://git.kernel.org/pub/scm/utils/b4/b4.git/commit/?id=732911655998)

Just checked v0.12.3 and this is working now.  Thanks!

~Andrew
