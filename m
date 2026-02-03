Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07BB3939A5
	for <tools@linux.kernel.org>; Tue,  3 Feb 2026 08:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=10.30.226.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770106380; cv=fail; b=PacXIGZTh6Hq9vm+DYXtU34pQkzouSjd9cGTgcZw1Q8Jvg0kA1T55oVtBAFnapP5qAmMOTKgb4rBKwSfgXaFPOiKdWfxx0gjvaycpcRqT0qOwy/tkkrQZE5sYWu8989lfk9Pq/XYsGIXZn6L3zM7Ycqyb2cItBY9r9nvp6NESv0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770106380; c=relaxed/simple;
	bh=l154f0BfXu2UVpdsRO2JbBMMNONyaCOxPBLZbYjBjHA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Sv4Ot3E85Le6WzX86SrKvVPQ9LBDpn1FJTCvEJQjb8hTUsHJmsVhjwxgtT58X/S2XERe8FQUNpna1/00P9y1j8fb1/VjK6NAu5W95wQoWbcvNa/EkU7juJphJd/n52udDIVjN+fPayJsM9yZhqKiKkLJ91S15clfw5q0O8B1ThM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b=c8pteJAL; arc=fail smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="c8pteJAL"
Received: by smtp.kernel.org (Postfix)
	id 65839C19421; Tue,  3 Feb 2026 08:12:59 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013040.outbound.protection.outlook.com [52.101.83.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E4AA3C116D0
	for <tools@kernel.org>; Tue,  3 Feb 2026 08:12:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E4AA3C116D0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=de.bosch.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GXQXkYtR/X5CSCeCyqmi2YuI6KWUkHLA8mU88ezWHx5EQoH1tE+hTJPjF1sAPYSy13pmkF3mLCdckfPW6xkQuWGnW6Cs6iO/QqHqwv3ySvmioLdFyVb7gxZEUNI+FBFvwiCjNbqjGHbjWpOJLBZLgcYbyE/FeG0a55niyf/B2fYCCheUAIs4xy0f2L1ZEUnFFehpkFvMYMDnuFF/N40IPMPnhcQ0aoH5KYymhwT/doyi0KPCtP04yLRNVlC2cCNi6drPtOX2P3K/v695gUDgj9AUZHRQiqhJGjxK+TQbDOWhxcNDLb826OFUL/whLgpftcc1wvAsR/Eqdda8hNvZ0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xxrYI9i3i07afgFq+FLHi0ZYsWyAuTsPvldI8rudu2s=;
 b=bCh7oQkswfJ77BJOud9b+/s/TZpTis/pujMEsjc/PbSjlKWsi7fz+WA0PnTuSdYTp54H/ww0n+ZRzSMPCv0WGYk1MDUIhqUAGY+o8OPK1KELVNtT2dzBCPpqmHx/NOjT99YAvxmqDHhxHTd1cFo79cgri71hBggq4px6DWzW/1Ys8CaIZoVq6P3pDdV5IO4CP6ol9+aiFtxq7LymcleTbb/vjin5IYmhnBbpFZTE71IZD5zQ7hl83OVqkClW+WbynfOqQn99GLDICfat4CULVdtJlknDuMhVMWAWRhPZVZRnyMzj9fiNnwu5t97gxosSBZVlKTSm+IBf9gyNLxeVUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.205) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=de.bosch.com; dmarc=pass (p=reject sp=none pct=100) action=none
 header.from=de.bosch.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xxrYI9i3i07afgFq+FLHi0ZYsWyAuTsPvldI8rudu2s=;
 b=c8pteJALFSpETcYe1QbVBc3P0HY2NraKLZ11uOgh9rDch0wimqzC+Yuurt3063HWbmxTiSgyT7FX4lwPHhWPDZa58TEw0ZU115vHZ7wW4GolfwJwnBveK8PuFQuY17YRu03udb1SrdF2VGrEwkPVMXD0K9uND2k6JfhEkbKn3FJPgyrF+e0Jj6TY9A1+KJiex8FavyKGT9UiwO8HtNUqDo9dlVPKMTEjpAMAQMvBkILw18ga2fmR1YCWbZNGneDG9cWlM7acH74PMlZCrGiPzBRjcQuXJl+UelGBm1ummFfWwsDDOLyotWfU0fzeHKtequ9tIKP0aO8CFFz6juf7+A==
Received: from DU7P189CA0026.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:552::23)
 by DB9PR10MB5329.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:339::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 08:12:53 +0000
Received: from DU2PEPF0001E9C3.eurprd03.prod.outlook.com
 (2603:10a6:10:552:cafe::dc) by DU7P189CA0026.outlook.office365.com
 (2603:10a6:10:552::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.16 via Frontend Transport; Tue,
 3 Feb 2026 08:12:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.205)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.205 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.205; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.205) by
 DU2PEPF0001E9C3.mail.protection.outlook.com (10.167.8.72) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Tue, 3 Feb 2026 08:12:52 +0000
Received: from RNGMBX3002.de.bosch.com (10.124.11.207) by eop.bosch-org.com
 (139.15.153.205) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 3 Feb
 2026 09:12:52 +0100
Received: from [10.34.184.244] (10.34.184.244) by smtp.app.bosch.com
 (10.124.11.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 3 Feb
 2026 09:12:52 +0100
Message-ID: <53108b6e-658d-40ed-9963-32b909192ec4@de.bosch.com>
Date: Tue, 3 Feb 2026 09:12:44 +0100
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: korgalore: Mail directory keeps empty?
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
CC: <tools@kernel.org>
References: <5fd95298-afc1-4789-8b15-2b24e8886edd@de.bosch.com>
 <20260128-wild-honest-cougar-c002de@lemur>
 <29c56255-2e88-4bf5-abf6-c02aa8f953da@de.bosch.com>
 <20260129-crystal-dingo-of-serenity-659f4b@lemur>
 <20260129-active-festive-nautilus-e3aeba@lemur>
Content-Language: en-GB
From: Dirk Behme <dirk.behme@de.bosch.com>
In-Reply-To: <20260129-active-festive-nautilus-e3aeba@lemur>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF0001E9C3:EE_|DB9PR10MB5329:EE_
X-MS-Office365-Filtering-Correlation-Id: 906e2a2e-ddbc-470e-e437-08de62fc0756
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Tk1SNmJBTnZuRUdKdC94NE9sbTJUWGR6azVrWmIzNGRrT2pEL3BXVjdlWDV5?=
 =?utf-8?B?SUdrMDc0SjhRTFltajc3SUcxZkJrUEVWQUNoR0FNRUcrOW9RNnMvOFFUREEv?=
 =?utf-8?B?aFBRd3Y0Zk5PRWlzaHNSa2RaU2laYVRST0JxU3JDbGRabGhpank0MUJjM3dh?=
 =?utf-8?B?VWRvTHpJaVFUMlNqaitQNGtObGxWRmtPbWJyajU2UEZNNGJkTmtsVElOYU5B?=
 =?utf-8?B?cTVocFQwODlhSmlxSUJaNHd5bDAyMG4wOERIZjc1V3JQWWxvUWUycTV0WGxN?=
 =?utf-8?B?K1p5ZFZ0MDVnREtuT0F5WWZVY2oyZmhRbUhDN0tpWTBuaEVqZjZHQ0ZEWENv?=
 =?utf-8?B?RmMyNkthbVZ4aFd2Y0xVNjVhM2JIT3hLVVdDZ1RyaGVHaEtmeS9qV0FNRUdM?=
 =?utf-8?B?UVNZb3JyYTU0RW5ZVC9TZUp2WmZFK2k1U2F3bHVjdlNOWElZM0lackUwY0Zu?=
 =?utf-8?B?OEtYYkU4WERMWHRkV2VLMDZFeVZPRkMraW4zV1U2QXRFbDJ2N0tGVUhvdlBs?=
 =?utf-8?B?SHRmdW0vVFZQSnRoc2RvZzJDZUpvUE5JYnBUU09pS0w3TXZ2WlhrQU9rSU1W?=
 =?utf-8?B?TURuR2kvQkJRcnhtNzd4YXhVaVd0cnllY2xNK0t6SUVXQUJiM2ZSQWlVa0RV?=
 =?utf-8?B?a2ZKb00zWWs2S2FqRWsydWtFb2hTN0liaG1yQ1RQVE5YbnlwaDJ4ZHFXL3Vw?=
 =?utf-8?B?MWFUNFlGekRsY1kzVzJQY0VIVzgxQXJTYXlxdHdnVmRuMHlISEtMNUVkZ1lt?=
 =?utf-8?B?eWJDVTRZWXNPcHBwcENRNFpkcWM0Y2pqZlZrTnBCbXhrTjJybWw5MzFmYlJs?=
 =?utf-8?B?K3Fvc1V3QXBydXgwTW1LSW9GM2dXQWFYa2dtdVNPa21CckJXcTMvNFZhbDRB?=
 =?utf-8?B?Skc2cHJTMDJwWkVETGRsakZCdnpxL0pHUzdGdjNJVlpBWWpla3VXbFluSG9l?=
 =?utf-8?B?djBja3gxNDBUcGdtUDJ0d2szYnJDR2lETEdxSENLU0t1ekRmUS83ZUp1Q0dn?=
 =?utf-8?B?b05BTEtoMC83cThFbzloeDE2a3dacDlSK21tQ2J3SHUwWGhXNXc4SjhkTytU?=
 =?utf-8?B?UnVxbkw1N3BNV29MNFFkWndwc3VVU01ock9hNmdPUlcySENYaUp6OCtYNlJ0?=
 =?utf-8?B?aGttNzBmNWxJcEpFbit4UU5Ub2FFMmUvNmN2dVo5L3JodUFJQ1l6bVBlRVBt?=
 =?utf-8?B?VElqb242cSswSm1aUlVPTklKRHlPZU1NZk5nSmc5bUt4YStYZ0ErMEdxTkdR?=
 =?utf-8?B?SEVDM2NhQ3hQdVJ1a3Q3YTg4UDdncWJWc25saVRYSEVaSjE2V3BJTmxTLzlr?=
 =?utf-8?B?WE5VQ3o2dVdZLzBMR3lMT3lIcG5lUk94RmZHSHBIczJTbFhkaHl2MjJjVEdy?=
 =?utf-8?B?azZkUHUyNlZqZzJNVmVDREN1eWk4SVUvK3VTaFpwMmJkZDcxMjJGaVJqamcr?=
 =?utf-8?B?QUQrWlFwcS9sckp5NkdFSWxYWWtydHNaZ1VDMWVwc0VDUHJTRktNT3VTbXRy?=
 =?utf-8?B?N3pHVnNCbUpabVhoOUVjZ3owZnJ2TkpQNStveVJ1d2lKbTdmNWxOR0IvdFJ2?=
 =?utf-8?B?Q2pqUHpWWVByd3hwUnBvRllkVmR6eVV3anZzTGdGQ3ZidWZ0WE0vZkQrRHhD?=
 =?utf-8?B?cXM4M01zK3ZkU2Z2VG9jN2hNTytiMi9KSUMxTjdkbUoyUkp3UncvbmpDeFQ2?=
 =?utf-8?B?dWVSTW5jRFYrSEpUcE1HVW9yVmRoSFFDaGNwWFhibVh1akUyUG0reDJERGNW?=
 =?utf-8?B?YXZnRytBK0JKVUU1QmJROXdVTVpONExVOW5VM0Q1U1VNTXFEUXIyallDeTJq?=
 =?utf-8?B?OXZ1QUk5NTRLRGZTeTArMlM4bEYxNElQQUk3bE1Vd2JOWVY2T3JacXFuT2tw?=
 =?utf-8?B?dnc0SUp3cW5JKzF1aExDaFJBSGpONERmUDhtNDJXaHdJK3R1TnY3OTZlR2Z6?=
 =?utf-8?B?NmpzRHFHTEllZERwMjFodzh0WEpuakppTy9ubWJTMTlqRC9veDVNazRycDRl?=
 =?utf-8?B?Vk5TTUd2RW9LdVVsc1BTN29FaWFwMGFScVI5d2ljdGhwaHErVlRPUzJ0MXU5?=
 =?utf-8?B?QncrMGtvUzkzNFIwVFVtcVdBVVhLaGpKbHBRTlZIQ0xJeHV0V1Zib3Q5ZG9I?=
 =?utf-8?B?ZUxjb2ttbFpPa1NRZUNlWndZSUU3ZGFTLzBvNXRzb2NzelpPR2h5YnNyeGlu?=
 =?utf-8?B?NnMvbE9ibi9oaWlCOVlvMy9LcU1GWjJxOFd5b1hyOEFOYkt6MTZsOE5JUVg1?=
 =?utf-8?B?ci8wSUlzVTM0Z0gvdWNVcUwyakd3PT0=?=
X-Forefront-Antispam-Report:
	CIP:139.15.153.205;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ZazM/qxcfGiI2UyvPVAYXj7jLCp1PM9cxy1fGtXnM3mnRay4Mw2jIJ2Wf7qA3YrqI+m5ehvdbcWMZr40wL9CSUO38EmLB8q/uqtGccI48fOJqwBGa6agiMMPDHd6wKuJtucrBROHU8Up6ixoWeGMaJ50WgbSORkNWXFDMEvcILAoyKkaEmRSj5esFy/zVrFzEYov/nN+oyVLgMjl95fiqY/ZYKO25rFMnOjUl+ZEDdpxZhh+Te/BvMwLob2EUc7YXCf48hhqeFEBiFL/y0wKaLxl7rVtjsyAkIJY4X8IQnYjWqit6z0qNxZOI6I/0BQq7RHe7UOnQV0HJZZIwUDaCQBsnAWTlGmc3ZY2MLUtcHBewnne33wHQzLplbmwzH1M/lpmTUbgwbHzfdOtIrbLsjYOiOgbTQqi78741tgms5ydj97ZqqINKVVtuRd1ALCe
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 08:12:52.6627
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 906e2a2e-ddbc-470e-e437-08de62fc0756
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.205];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF0001E9C3.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB5329

On 29/01/2026 16:26, Konstantin Ryabitsev wrote:
> On Thu, Jan 29, 2026 at 09:41:10AM -0500, Konstantin Ryabitsev wrote:
>> You don't need to change anything -- it should work for you now, but I will
>> see how we can make it work after one step, not two.
> 
> There is a fix for this now in both master and stable-0.5.y -- the deliveries
> will start happening after the second pull, not third.

Many thanks!

Would it be possible to tag a v0.5.2 so that pip sees a new version and 
updates?

Thanks

Dirk
