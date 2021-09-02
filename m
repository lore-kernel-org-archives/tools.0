Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam07on2073.outbound.protection.outlook.com [40.107.95.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B013FC1;
	Thu,  2 Sep 2021 23:38:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oqa69ND6xGoi8hqntgR62F4HE1gsuGQxluqTXw0VR5ulr3fZNpiRityR7QKS1vaSiQI+pXdpPn5BPvzFP6TqXj9xrr9bEebAXk7pf7IVxAMj1mWzBYb+CJjvNEaJwpB2JXhyqEoyXvtZxeuCr7Ln6G+/j5XwNqiilUHjWn+sG3Y3AmrmdVBm1Cw9Txw510TeyNpsO4o4KzyV5HO9ee7w75ijhy7xjN+QhPwvzaKaRu8akhL6vByEFXl7qZ42lwvPDOnp7AQ9etsGStxoQeBRPyPUr1hajcIb9KA4pR4QMg20qZwTqTSjB7GrvFyd6ePbC7Ai03/cvpnW4cVCl5BxHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=rY10+RstihDXB2ctATP45vzZAk3bWCBgiU7/odD1lIk=;
 b=XbO8I3eKA3nGqXDwmFmfnOwMT5TD6e0iorgVAnwWbGFsG60uR/GU7p3EIRUumxNyCiowFwBK2YK/wkKsepXeCB9bCpPivchcIh4F9BK305edfNewM2sL4WfZyOC8u2b9CwC2VDDCvoAwQo3LOSpxTcv11LCg+0kn5K69HKRgpvrBsKTuYrAt3pmvS1Ir55aZ8FRewYs90vWCM6RZWg/191TqaP56sl4nehxpMKsgwsWiNw1+ynYERAYvmCbMjCLTl3mM1c+p8q370fqUpo+68/gZOtv5pGOYIf6c008/EzfeM5ec0047y2XAFbbXBB4/f2mThurEkaNy9xVVkCQoFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rY10+RstihDXB2ctATP45vzZAk3bWCBgiU7/odD1lIk=;
 b=FiuSCkgntRJA25JbL6LpzxF/itpDnWURgd4wF27n4Rf/TBxbCkfPQ69MH6xVU6nw31pSCwjyipDS/xMCHsykMpDKkFYwE9duZMyyZHlXwqsJDDZGa7/UsPCMfXDavqUs1gyUZVYdkdKlWnkx9hQfbjxuipcpAa8KHRSm75UlfNaJDE2NugxN5ydq6OJrP7M0yJ1WmUQLYkvvvrI9YJa8M9w2uTUt/kcRPzSxXP9sRkREh2GPZ/qcdkTmLHK9xUAJizvLGKL3t1Xsk9u3PCXgRt5GYK+Dh6nDb91ZJ50LdB7QtEefyq+4H5PrTy9hBu3Knyu6tDPOOsVyLd/Dgutvag==
Authentication-Results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5192.namprd12.prod.outlook.com (2603:10b6:208:311::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.21; Thu, 2 Sep
 2021 23:38:08 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95%8]) with mapi id 15.20.4478.020; Thu, 2 Sep 2021
 23:38:08 +0000
Date: Thu, 2 Sep 2021 20:38:07 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: New version of lore available for preview
Message-ID: <20210902233807.GA2505917@nvidia.com>
References: <20210818190750.g3xedu7j24sqndo2@nitro.local>
 <20210902195332.GA2493828@nvidia.com>
 <20210902201402.bbdttirbb5ckrtiz@meerkat.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210902201402.bbdttirbb5ckrtiz@meerkat.local>
X-ClientProxiedBy: BL0PR05CA0003.namprd05.prod.outlook.com
 (2603:10b6:208:91::13) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Received: from mlx.ziepe.ca (142.162.113.129) by BL0PR05CA0003.namprd05.prod.outlook.com (2603:10b6:208:91::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.6 via Frontend Transport; Thu, 2 Sep 2021 23:38:08 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from <jgg@nvidia.com>)	id 1mLwHX-00AVzR-DT; Thu, 02 Sep 2021 20:38:07 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 97d58324-bf30-4717-dfa0-08d96e6ab7e6
X-MS-TrafficTypeDiagnostic: BL1PR12MB5192:
X-Microsoft-Antispam-PRVS:
	<BL1PR12MB5192179ABCA9287619DAA8ACC2CE9@BL1PR12MB5192.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Q2JDSlkShCC3UQz2b7x4EfGVsD+OfqPajkA7E4ru1lWtJseyBPnyw98yZHNZNbLVV4kYihIOhUgrSc7dbTJnwSE5DocvY6ejzCwnBPs8wibprkGh+LxWV+WDklXAu2PXSZVBcoGSNo4vd+2ibgwd+WhZsWa5yPSOitjUhKlFpNa2iR8dFVs0L5ih03NP77Lr6DIZ0shdDV4pFqZTia3spX6eT9hjzGlm8UwCxVJVc1HNE0NnYnjTthdTM03s/pAfM1VKZtrogI+u0QJQd2dSOdEDBxKkxflngGIAQHjnhUz8Q5wurQnDS6JIQ8EZoG/zvjBJ1/M8CexyyBtykZTt+iAkuz2q1dbkpUq387zd8M1WWyQspUcSP5ox45fCkP5PpiNMdCB96MLzrta531Tgsj0J2eh8f/uWMtNmEbsVMlArLw9DB7r2l3Xnwiwsp+tTWny9vZmT6/b8aJQS6jGN3B4QMTbE0sGVFbvPJ3xT4lhZUW7to7IS/KGOKVC3RyFKbeKKxqRYFkhHMTsQusAjJFkZTbwOEZQslH3qubYj57UVzVwKQx4UxZ8OMmRoVQVonLorJrFGBtpYnLUXmKiYKJl2Teqih1AchnsldzyF6A++NKsPcRitARPbON1iLrbnFjdlm/vHjO56XUTi8NnVWWdOn+VpaSP3sLJ74XrWKfZtUprhZQjPm9npJ+Iqc5wjxyrGXZVzuNkBzi7BUP+1pWdleOXiD+pcT1xDzrmTIRtbEBHukOK31vXWu7r0AiQ7vCLa9aGeckpPJdE6AOtu8g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB5506.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(396003)(39860400002)(346002)(366004)(478600001)(8676002)(316002)(6916009)(2906002)(1076003)(86362001)(66556008)(83380400001)(66476007)(66946007)(26005)(5660300002)(8936002)(38100700002)(186003)(9746002)(36756003)(426003)(33656002)(9786002)(966005)(2616005)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?F3qlRXCUXOSj80z9ORV1feaF3khr2qmE2RYnP5DjzH5N0fJddnMmXCVw+Y3h?=
 =?us-ascii?Q?OpMxLViaZem8r+RrQnwuXgo03aLGw3RYhwQHJYtL4ux9pRak5xA2+l5oarRb?=
 =?us-ascii?Q?nAt3GxkDMENbCb/yWhvb24j8+9JhzEseMQJTaJzqz5ReuXv2JiixCp6P33Op?=
 =?us-ascii?Q?RjHRvG48p9pKqiVbkAa3lmUGmfPAelhxNMfo/NbK+7/EOEzpdwF9pqTNQ3n2?=
 =?us-ascii?Q?iH/DVf7LmPnCiu87xz6KIBHEB7ibQi8vTC2Xu8L8yM2IaLrEblRWFJzQtlk6?=
 =?us-ascii?Q?0Ss4Zl3POV2XPv1GNZ98axf9lGzGU+44amunrmufvonJ6kVoo6hd24ZBlMov?=
 =?us-ascii?Q?eSsGpVWGWxVnkS9dA7R7FrEQjQdNhzk8BRkpRbHHTaNFC6U+SIK905yOJIza?=
 =?us-ascii?Q?zle/wu0e9ryazZwScBbzfKGj2zwbqGc3xntb6oKQ2vZnQuvfbc9+uiS7PeoQ?=
 =?us-ascii?Q?zJ17HqXZ8Dmh13WidaaRVAijHd5EBgs0vXyn520lmM4p2BROTP6a5yMUQbM/?=
 =?us-ascii?Q?1BwDhzjbGIDg659YWnHImwoCw8UJpbd+9Ilcz1geNtWiSpP/avQrqCR+VOvL?=
 =?us-ascii?Q?bX9pVmjXpohDQbItgEftD6Ny3Su0WBsZ8zkIkLyvoO4ZJjEoE9Npq6lj0xcc?=
 =?us-ascii?Q?4xciWcTI3q2GpW8d5QpVX2RDXG18SXwjbmliw0I/W8EITOHbBIma+b5RkJDw?=
 =?us-ascii?Q?IlE8Z88lzhXMCX1zOkaReTE/VL24Z/m+3xrRSjKHrVqLbxCAgsedO3ad9FCN?=
 =?us-ascii?Q?zOFeMC8KrwGwDiYJlnOqz2lmemGjhS8r8JA6kjOLUXibOvWxEOzsipaOPpKx?=
 =?us-ascii?Q?F57G4C9eFSJ2F7EBgChXws9VRH4X4tbLgaSUfdl3SJUenYQiyPVvLx4dncwd?=
 =?us-ascii?Q?Klghgu3PxVe0yrbcsJyRRPIHXai3/IYEIYAHUdxgpAlxOpDnpMov2uBDnHcY?=
 =?us-ascii?Q?gQMQVfFkmNT3/WV2uzLuNVk/91GqlM35R27n2z2koZFrV2g87gS5riDo7HiN?=
 =?us-ascii?Q?TpEkTPvkFJT4dApOgaGr5C1zmfLJ8z0WH0EBLlH1W/9Xe8/si/ofuf0cC5Ku?=
 =?us-ascii?Q?ZlSrBxfwxDDunOqiyRp7zeAqyrvI4yQJTYHEhAOBg+Ew3dt9iFaGYsulLAj1?=
 =?us-ascii?Q?W8F/8inDgbLNx7++C6sakZHX5JZmTI/dvRcTxdzgt14jYbFqXWguEox0VHMO?=
 =?us-ascii?Q?YJscyQG7C9r2tm0WdRa8FSY+ZdCbmHm+U7LngBpdCyn7uHFeCqY9Q7GvUr1K?=
 =?us-ascii?Q?fSbTnP8KcaXFskLX9rjfpxxMRY1eLdy+cjbGAP4Gz3pf2bPbvRdlVAw8ipDO?=
 =?us-ascii?Q?RCgm2z2JdfophHPNWDHtLEM9?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97d58324-bf30-4717-dfa0-08d96e6ab7e6
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 23:38:08.1431
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: to1oSCc6+LI+93l+g7NwWPRPBsD/mHzkLXbgLTF59wXwxC1zR3S/AllVehwX0aiE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5192

On Thu, Sep 02, 2021 at 04:14:02PM -0400, Konstantin Ryabitsev wrote:
> On Thu, Sep 02, 2021 at 04:53:32PM -0300, Jason Gunthorpe wrote:
> > > Please report any problems or hiccups that you discover. There is no specific
> > > ETA for the new version go-live, but if all goes well, the hope is to have it
> > > in place by end of August.
> > 
> > Hi Konstantin,
> > 
> > The https://lore.kernel.org/lists.txt URL now gives a 404, is this
> > expected?
> > 
> > If so does someone have a fix for lorifier.py? It is very unhappy to lose
> > this URL..
> 
> I forgot about the lorifier. However, the upside is that you don't really need
> the lists.txt URL any more, as you can just blanket aim things at
> lore.kernel.org/all/<message-id> -- if it's on lore, it will be there.

What is the difference between /all/ and /r/ ? They seem to give the
same page now?

> I pushed a quick fix here:
> https://github.com/mricon/lorifier/

Thanks! Without that it is completely broken if you don't already have
a copy of the lists.txt

Jason
