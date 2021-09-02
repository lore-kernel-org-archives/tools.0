Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam08on2042.outbound.protection.outlook.com [40.107.101.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A129E3FCD;
	Thu,  2 Sep 2021 19:53:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ApJSP4ebgYDxB+eBnXWywxkFvNc25pz7UM5R8muFUCIBLflpxdnEKq/puIa0KSHlLWZncPLVhwwSrlMY1kFrjLVbejJwuY1CfcFN3Enx9Jdk62oYwoXEi6X85rYoDTPdim01Et6CyfGg2IGeKusQqud5jcTw79aPu6yFgBHfnldXbieDD2+XuPmNG1ZzVsJr/owkBahNR1pKmbbSBE91hMQXxmNpi7+EEIPdNvdzdkVYsplIJLd4X3fQqB4a9C7XW7/GEKNsCSOsSbGui7W2wpBuWYe7Vtwu7a1L5t6Fk55Du1QoMDRoubg1paTml8nQg4uZ6Eu+BvRfv1Mie7RUPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=JRi+z+X6vULw7W+CwDhNAad4zJlfbLqUNZnvtxrKvQw=;
 b=fBfGNN0jhOe4jn2kkDJrDGrOwkE7XHLivlkX3vrVL9HOfkiF+dHJJlGuJP08yZRS6ltEh5tKUqM9XrEtwzpAQm424EFrf3oPSxpp5bAREr9BHwx/qn6LAQiPm0BDXhYGl/NsHKMiI1VbcG4ydaRUuZUUVoNrryvWYJX6OrNWuSnQtjW00V9QsLueC+/21BdK/jGNPaY4NEfZaY3adGF9W7f5iXORns4jGM8GjQA8tWKBNsiG/ORlz0Joarx+2OSAgPogItACRK1YSc+PaI3udP7lvVdWN6dLDsWR8R8ZfuPbkGSdXPtvc/iV7x7rnUSMv2ghZ344+0IqM7LXSdnbyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JRi+z+X6vULw7W+CwDhNAad4zJlfbLqUNZnvtxrKvQw=;
 b=X9WL1UY/SZZYKlhJAAnWvZnFCEZ2dpvu1ZtKy5aiytKDmTfGrODAwNKb+4/ctUkPaXXKGq6T/TQ/Cqn/IdOFs2DvX3dkL7yfaC5t/8BU3dIVr5QGalxrhGujgEnEu8Q0ctRTG5Q0qF9MlYeTk8QRPZAuuJsGDQWJ0QPCBi1bnSMhLkJa6NLFTeMFQ4nEmjfo4A0pnhPkumVALNWmob7lp4g6To3QvJv+8uHI0nmpHYR2GYHzQiJb22iPI6n6koq/2G/bfN5tudGIOyME7nk+Nn6sRbMfHKNk4xyHLn79O0tRYeWyZm/8ea5gnY8aIwHo+Tx77uLkCdUagQULmf1uTQ==
Authentication-Results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL0PR12MB5505.namprd12.prod.outlook.com (2603:10b6:208:1ce::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Thu, 2 Sep
 2021 19:53:33 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95%8]) with mapi id 15.20.4478.020; Thu, 2 Sep 2021
 19:53:33 +0000
Date: Thu, 2 Sep 2021 16:53:32 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: New version of lore available for preview
Message-ID: <20210902195332.GA2493828@nvidia.com>
References: <20210818190750.g3xedu7j24sqndo2@nitro.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210818190750.g3xedu7j24sqndo2@nitro.local>
X-ClientProxiedBy: MN2PR05CA0021.namprd05.prod.outlook.com
 (2603:10b6:208:c0::34) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Received: from mlx.ziepe.ca (142.162.113.129) by MN2PR05CA0021.namprd05.prod.outlook.com (2603:10b6:208:c0::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.6 via Frontend Transport; Thu, 2 Sep 2021 19:53:33 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from <jgg@nvidia.com>)	id 1mLsmC-00ASnG-8T; Thu, 02 Sep 2021 16:53:32 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5dcd61b8-6cef-4e17-4e56-08d96e4b5854
X-MS-TrafficTypeDiagnostic: BL0PR12MB5505:
X-Microsoft-Antispam-PRVS:
	<BL0PR12MB5505FEBE887802F7ADBB4D8CC2CE9@BL0PR12MB5505.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KDdbVN88UJ6a83UN2ojoDU3T4ZYufYbCNbb54pnQF/GjLaUWGt/zvi/qZZOqozxZ13K0//vGQR+pNn75MWzskvXyn/lth5fK6UyHglgN7P1MEYfH6sKZ7EffqtU/RL3F8+spAdXCfkH2AeSqSdTQnLaB/UFaHtYPuUI0UXLHninqIt3x9YBu4C9dVnhIaCqiyPqv/lYbqBrJ+N6ld6iAb/Ua7FbjYj4esAXdIyzTrgxt/Rua5hwCxRoRPlUj1Q2A4ByEjBnH6HbTMwBOE1XbFy8B+PAI/6oxLNmJBV42qm4jk4jCUVRARDUCcO5xL88ReI9qhwXVwtPoKGz0czXl2nwGWOVhNpxjbUVAHYUQZI+u7Uyd/4QqOc7saOnbh04dPUkTVcWE6sEW3trTV0UKAw+VS+SnG+KtSSQWa8vCPolmC3ZUgwp9ZpUItbREbLxu7fMKr87zihWimf8Ucj2ouvHu9wFqe6QwKinL4r1TvAVZG6kni+rBCCTeZxZ9npnfWuFrrXc8JRw3FazUpcjaq/OdbfG5PkRUOZkP43g4Z9EhAcsfbr4JiQpMSfvlUZjlITWCKZqQ3ld04cC7BgNFST7/lBd7d2xFJUyNSlEvdh4/ezz2RtA5ANFRGphXsq3XCzo9br7xCLJI+2rOwCSTrDKVQ+fZvkqtU/2rqUDpotXI/Qjz4711QAYS/MuKGqMPdywBNMN191orjZ/Dt8RPR5LE519HiSqjmDT1d1Q5o6s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB5506.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(366004)(396003)(39860400002)(26005)(316002)(9746002)(9786002)(33656002)(5660300002)(8936002)(6916009)(2616005)(186003)(36756003)(1076003)(4326008)(966005)(38100700002)(8676002)(66476007)(426003)(478600001)(66556008)(86362001)(4744005)(66946007)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AU52ENm4YZlc4+M23c5CqtUfc0Ej3yadsEYQpEj+4qFwfoNsCxLb5if8SFLh?=
 =?us-ascii?Q?hpezLJNT65Jp9kaLw/RHdBiPqcCxwF7uuaWMFd1JTvsZ6hh4j9BtRsqvx/Ns?=
 =?us-ascii?Q?KmF+kw43UPlSJ9wrVmZ0QwgslDuYEhsIbiZ47/1XjqEDoerPaLNgRWXL3dAG?=
 =?us-ascii?Q?0mW6i0ANHYRiYck9rgJ11MH4rdF4mC+MpB4xB6y+p1T7I1+viDyevE/uHqe2?=
 =?us-ascii?Q?ak0r+/e8O81HcQHHF8LQ0CJY1infMMIOkc+KIzOZMRb6+q/dFFvBS1xPlkLF?=
 =?us-ascii?Q?Nq08gAx0FIuIFkQJkuQJpr15fvoBwe34OCpu3/cf94rOJ5MAl9zbZ4u2dua7?=
 =?us-ascii?Q?u2e6i7is4q1DLVkl/MxbzUSnLUvDgM5MexnleeHM43HPc43jA6n2GcoB4c8D?=
 =?us-ascii?Q?emxSApemAjfYkND1BfmsohB4y+/FGPcU8EphNr7Iwcbxy8DC2RO0417EmOYo?=
 =?us-ascii?Q?3zsgGfnJX7vH1lgh9Zh+V6CgMmqWvqOMO6KZjyFpbvT0QlPXXJCw4WzTpRTw?=
 =?us-ascii?Q?f3b8Prk6FlS5jMWjiRSILLiifJALQH//1vOt9VNze0j+rR8PhN8acQEG43yy?=
 =?us-ascii?Q?zz6GJ7wVUcJIFPAMx+smFY8Nh+77qGiu78D0bnN3XgnHyp2MgPtMczx6MgnV?=
 =?us-ascii?Q?8XopZBeSbqZMlvlmCG3K4NG6DJSB/O/bDnrQlJX9cMKo8JjsWukdOEipF0AB?=
 =?us-ascii?Q?mMN0FGhFKY+V/psemRLkLX0cgMyoqc04mpzuBo7b1xGP+QTn2b/4AFJ1sNvI?=
 =?us-ascii?Q?ekqzVQdGf9EhwOGzluxJz4ppiI1gVE6SOpAw3J6nZzJpgVXZ3WoPe8IrBMQT?=
 =?us-ascii?Q?8hUKug10bQFwFvU91S0GgMGCIG8yeDJlGmSa/flydoB3MsLDizCuPZQZikvh?=
 =?us-ascii?Q?anJG7yBotHVH6BZblQC1URjEBSmnR+Awe2JOoNfYAsD7nbmkhDiSzAa9Usf2?=
 =?us-ascii?Q?92qqUxLJ+64XqDy4z6fVlDHvDga+1ETSe+54WD4e/kgKnu2PHcOYGyfPwUUE?=
 =?us-ascii?Q?3WedabkvBlUGWFJiErNFUEU1/2mBUcZ02yteJS5ud/sHghP1XHL1huC2tQAt?=
 =?us-ascii?Q?IRyf2C1qtg8iv8TaBljfOC19DTKroxL1kkul3vVmv5McqLhQQuftwLsZdIY7?=
 =?us-ascii?Q?uAyzIJIf2HhLD6TjrQ2XkbYZyQo9l9k47+0CNcLtDD81BvQizvinvcP5vaEW?=
 =?us-ascii?Q?tgMzAMAcfSBMGgl+PPtaHo0FiO5S0LeqQyhCWg7dp/WWszJkaBbBxyGmRSTj?=
 =?us-ascii?Q?Xmmvv0bL+BdG0N5GBKeGUdEPCW8RfbOHDJGHhXRkFloX2h/FCrGeESQ/+kpo?=
 =?us-ascii?Q?c3v0pB0apf3Ah2CS2h6YobGy?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dcd61b8-6cef-4e17-4e56-08d96e4b5854
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 19:53:33.6205
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pt5pGfI83l/5bhzoFl6gjMx5Vq/rkuMsfgns+C9sY2IntanKO99tkSC6a4N+rxJW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB5505

On Wed, Aug 18, 2021 at 03:07:50PM -0400, Konstantin Ryabitsev wrote:

> Please report any problems or hiccups that you discover. There is no specific
> ETA for the new version go-live, but if all goes well, the hope is to have it
> in place by end of August.

Hi Konstantin,

The https://lore.kernel.org/lists.txt URL now gives a 404, is this
expected?

If so does someone have a fix for lorifier.py? It is very unhappy to lose
this URL..

Thanks,
Jason
