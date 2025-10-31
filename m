Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934B532ED26
	for <tools@linux.kernel.org>; Fri, 31 Oct 2025 09:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=10.30.226.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761901743; cv=fail; b=Am7pzUcnNJVCYpamO/H+bDJIRt0L1+RwaBUn9rUrjNdOV1LqI2CxCLBBTQfMcQPX/n/DxC+vwpa9NyurBOLCyw3xTjRxMtkDWwnm+0sSB4mP3KDaP97YDL/T2m1E7B+YX6m6qvLbTVExNDeZBR/3zTRF23vlF6AnoCwG1xVLBpQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761901743; c=relaxed/simple;
	bh=t3dEAoE6Yoe3o4A7vvKDMH9n06fZWjVTeeypA3PXaK0=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=cveDI+h+ECTAD6YBXY4VRHh4cDdmQy1Kc5y2dvE2iOe+9BNXc8Tf2x5VHmY/Ue/Lpvf6NbawjvcmvLkk74VAo+p0RXehA06tze3/VRWlfpbIe+7NhAGMzKHyqBq8zRQVNgsIrtbBmwpOYHeOEMbtdYu6/6KMDNmjun2wgHURMlA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=est.tech header.i=@est.tech header.b=qPJJU7o3; arc=fail smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=est.tech header.i=@est.tech header.b="qPJJU7o3"
Received: by smtp.kernel.org (Postfix)
	id 65B0CC4CEF1; Fri, 31 Oct 2025 09:09:02 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013038.outbound.protection.outlook.com [52.101.83.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2D03DC4CEF8
	for <tools@kernel.org>; Fri, 31 Oct 2025 09:09:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2D03DC4CEF8
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=est.tech
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=est.tech
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LSdphcEQSxCmMDTigEDX+P31eBwwObf3vb99oMzgtpBAxCIrOryG3HuwmZx4pkmJfsv0z0/QfhR9Bvj+xEpOQw18aAFFfKZyJwWobKTECiiI3SkzV/14hJHH3Cks5SpdJZBAWwMosrKepgxlWRughWNad+Y8JPfgGUyC6ONIMM2i4qt6nJHHhelKperEWG+eFGL6oXniJKfIIOp7Pt9qjKoJ9B3HJHnsY0ZwHXBH6HlkgbFyQqEltytcULzE/hRbirovjgQQr6/WzVBDlmvYtgAhzPEt+hbyqbg0vadfCYMtewvSWD+AMrM8BW7Rz4n18L6Pa4JHRyVMG5hV8ODJYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L02f7IE48G5Si0c/LYOq9oD8AZMU9f3anRZ9nrXU168=;
 b=jqK8LpzCsckeTg6sZAZ7/NXg/mSsN2Yub+tUF+kHGVGYDAliYKIS+B3+9IeBUGQ7UjOA86ETu/LQJpEAg1TJ1Kgp+cWWiYD+eK+50E5lL3bUuodpMNcgm9jJnPn6+czLim1HRb7fWIotWQ+3WvDJoqVHRyzT536yRIzRPLB4SmWx1GI1z3NH9I2qu9rsaH0Roz8Qbk6znFroCRgKRVxqaQzT++GK1Hp/Mr2eu3WjZ4sVFHH9ALi40axrlzURaw2Q8Mpv+jAPNe3Q4EKHMCWEfpLYo41LhQlk4zqw9jY3ZVdxbm/3V9T046p0Qk+et47Cr7jSexKL8vAHD6okfmrjUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L02f7IE48G5Si0c/LYOq9oD8AZMU9f3anRZ9nrXU168=;
 b=qPJJU7o3T76EZgdrnOoCWO0DZ03mZv/Hu+rQDxCB9Oc/qQJHJ2vA7dad68NRKj36hr3/n0CD7D9mVfWiZqk5awYnQeU5esEI3oHzlAPTdqrCmQYqINxKsTj8IyO20+kXMFJG35OHq4OAN5plhzz3QeLGEJgMw1avA47qV4g3+i+pyX9L2IiGgAaLv2BRytluf+C+JeHm7QRNYDl4W/nmtbN/k3mqso0DqRFwdaJEdSJcbzIICWtQf5wtRsvBy/K6f7otLu0SlnnfKdMXKsVsm9g41s/2wcObjgyU8kpd2HeKniU6prn1GitLW6BYzEKMjkfnf4fMYyyAD+an2/Wc7Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from BESP189MB3241.EURP189.PROD.OUTLOOK.COM (2603:10a6:b10:f3::19)
 by DU4P189MB2755.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:570::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Fri, 31 Oct
 2025 09:08:57 +0000
Received: from BESP189MB3241.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc3e:2aee:25eb:1a0b]) by BESP189MB3241.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc3e:2aee:25eb:1a0b%4]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 09:08:57 +0000
From: =?UTF-8?q?David=20Nystr=C3=B6m?= <david.nystrom@est.tech>
To: tools@kernel.org
Cc: =?UTF-8?q?David=20Nystr=C3=B6m?= <david.nystrom@est.tech>
Subject: [PATCH] b4: Fix offline mbox --check case
Date: Fri, 31 Oct 2025 10:08:40 +0100
Message-ID: <20251031090840.3071473-1-david.nystrom@est.tech>
X-Mailer: git-send-email 2.48.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0320.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::19) To BESP189MB3241.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:b10:f3::19)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BESP189MB3241:EE_|DU4P189MB2755:EE_
X-MS-Office365-Filtering-Correlation-Id: c4d2003d-b4bf-466d-3cb4-08de185d1faf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RkdtcG1acGhnaTRWNTJ2UTBDN05jbTMrdzZNODUyUCsrQXdmbzZ0akFuTklr?=
 =?utf-8?B?MGlIQjhHT0tSSS9HUERsN2lhS3pyL0lqeldvdVBETEd1MjBhREJsMmprdWRT?=
 =?utf-8?B?Qm5sbGV3dHozOWJIQ1JkeDlRMkhOZ0lzWjA2NEgwVTIxUkF6a2owc2V5emhQ?=
 =?utf-8?B?VitSWGlkOS9uaTZwd3FyMmFDblJOaFpzQkZZMlIvZW9uOHRNVXI5am9VRm1Z?=
 =?utf-8?B?TzhIcGZYSVlCL3VkUW94c1FockgyOWtvc09BVlRsK1F5eklEd0h6V0ZPbmwx?=
 =?utf-8?B?S29rTWRGeW5uZkFhZjZ6eHlqL0NRUno3MCtHdjlGQ0psTlIzTmZMY1BQeVpW?=
 =?utf-8?B?K2t0aDMzQzArdG84TzVqR2tuSU1QZExXSG1xaC8xVGNFREtLOFkrUDE3OE5t?=
 =?utf-8?B?WWVuUXhILzdXM1Q3MGVjWGQ2M2pBUjNQcHB3VmJNQjhMVWg5TzFHRVArSUoy?=
 =?utf-8?B?SDZNbUpBMDlUZ3dkc1I2M2poU2ZURUt3aUlmSkJkR1IvdjVZM2VSdGgySkZM?=
 =?utf-8?B?cTNoYkU2VUMyUTM1N2YzdldQcmdzM1R3TXRIclB4UUs3eW5tSkUyQXozMW1o?=
 =?utf-8?B?dFZZRmJrZ3RVT3pVSjRTV3NUQnlSdDg1b1ByangrQXRoWkdia2ZyVVl5VXh4?=
 =?utf-8?B?elJKUnE5VUlnd0VTQXAveWJDb3l3Z3h1ZDZDejRXbjN0SzA0M1k4V1Y3RFVW?=
 =?utf-8?B?QjBXVWI4dXRCWldRSWpFTFNFbWJwd0orb0N4Lzk5eDlrdkordlpXYUU5SGNj?=
 =?utf-8?B?RUw3TitJd0Zsd1FjSHpJR0NrUnRnUG5JelJiell6MFpmS0xTWFNYUk5KeitQ?=
 =?utf-8?B?QzJiTHUrWlQvdFVtWFFUMGJHSXh6ZkdPb0t3MlV2dExUd2FCVSs0bEhQdE5x?=
 =?utf-8?B?N0c1UXlCQVZmUjZ3UUdMOUdLcDBYZHpaNTR2dGo0R081ZWNJSjZuUTJHeFI1?=
 =?utf-8?B?d2hNVTkyVlZWU3AyY0VNY1pwdEZQQzRzM0NKV3NDa3hlRzlUYnl0aVRvNVlC?=
 =?utf-8?B?UzV5dGZTSEZGcGF6TkdiUXBRRjZWVmUyV2Z5aW9oWWNTT3RKVFpOYzd3eFZ1?=
 =?utf-8?B?U3dvc3Z5OFJwM3BuMkM2MU1XdUZHSExOazhZS0RqZG1icEpvemZmbkxGMWFo?=
 =?utf-8?B?TzRWQ3RtKy9kY3RCUTdTZVV4QnpCTE81VEpPUnYyaFpBemhIeHRtWlBZc0p6?=
 =?utf-8?B?VWVXNy8xR2lLbDVyYUg5V0NyRmo5eDJGTm5CeTJpYXB6QStqSGpjWnRSdG1p?=
 =?utf-8?B?RHFlVnhZTVF2TmVuckY1ekdWVWhLbm5pUktsd3BOMmhPTklTV2dvQTZLdUt1?=
 =?utf-8?B?aGNZUlhRalFONXg2VE12azFFNHFQUkQrKzZlRnRuSDlYL2pTYjZOck9KSTFh?=
 =?utf-8?B?TG4rNU9QNmt3b2x0U2FBV2h2a1NRNmU4N0lYNDB4MCtkZ2FqanUvb3NiU2t6?=
 =?utf-8?B?ZDlnaVdKbGQrVjYyQVhwWTdWa1hlUTFobFBmVmhNcjNXbVVrNFIzWFplZGJB?=
 =?utf-8?B?WlZ4bG90Yll6UEhjeFIxQ2ZvSThWK2Y2ZVg1UThUbHFqY2xWa1JrWnJTRk4w?=
 =?utf-8?B?OUhHU3g2MStSQ05sTUltWFlLekl0SWMyYVpSM000Z1YyR2MrRkZkNm9QcjQ0?=
 =?utf-8?B?cnBSQUh5TDh1dFVOZERJNjJJVC8yRVBQZEpUU2hiQlJ3czJMck1pUnRVeitK?=
 =?utf-8?B?MWRyQkNpN3lkTFU5c290aWJYZjBSSjRlTTB6SFN5UHNhNmVlWGZ6UjE1UkJn?=
 =?utf-8?B?SDlTdFFsVFlBWHNTeWFWU1d4SjVmYUxhL3FiZk5WbXF0Zkp0Q2J2QXJLMWxW?=
 =?utf-8?B?RjFSQ0gycHd5M2NPNDhqMG44VWM4ZXF1YWdSM21pNnZWdEVOWWYremdnM25X?=
 =?utf-8?B?STBXOTZzbUUxUjhSbGU1NndxcGdEbHRhSm5EYUlBQVJ2OVdieEVIV2l5MjJ2?=
 =?utf-8?Q?dEBKV+cxgaOwNXNbTfUH2ezFzlREx4OU?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BESP189MB3241.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y2pVVkhqSzlDOVJLMFZhdVlKWE11cXRxekRUMmt1RWFQU3ZDTFIwamowY3Rs?=
 =?utf-8?B?ZHZKc25MU01vUFZFMTZuNXNsd0JESWxHcjhHQ3JIMDh3UkUzdm9wS1plK2tJ?=
 =?utf-8?B?N2E1L1FHRXVGaEYyalBjcXFGQ0pQQzlsbTEvdVo4WGFhOTBHVyt3YkNqNlNp?=
 =?utf-8?B?RzVvbnh6dGN1WS8ySXR3d3llME40Ymk5b25qc0VpMDU0RnN3c09LVzhENnNk?=
 =?utf-8?B?NUxNdmIvZ2JQS3NHYzFYTE5VbkdVamNWMmliQWlqU3M2UWtYZFppeDZRdElO?=
 =?utf-8?B?RndBZDZTU3JaSUxCcTJTZnFsSU9CU3pnUmQ3L2llWkgyeWVvQUt5TTdnZ3c1?=
 =?utf-8?B?SFlIQXJseWs4TCs0Zm5SWkpVY20xRStZTkF1TGEzZGVTTmV5QUZadFBnTnhu?=
 =?utf-8?B?NXZRYllrTWp3eFZUNWpvTDhHWFIrQlp1alMzK3lJTjQzYXY3Q2h3eEFyVUFY?=
 =?utf-8?B?VjVKTkQwWmtiZWhob0NlZ3hxcnNiSUs5WG9pMC9GbS9ESWlYSCt0SitxNzE5?=
 =?utf-8?B?YTVUc1BzM1dPcjlFbzhsb0xVRWZQMkt3SDFXU2hqdWRpVmJULzcyWDE1T2k3?=
 =?utf-8?B?K0pzTVRURFNPdzhCaElhbmN1QmtBRmZQVWRYa3VaQ2NxOFd6SGZ5NWpReUh3?=
 =?utf-8?B?S0lQRUk2SWVTNzlleXozenhVUXNvVnMvdjlPTHNkREtXaVNmUEQyVHIvdWty?=
 =?utf-8?B?WlFyd1lNWUZPTWdWcnFhT0JLN1FyZDNCMWl6blFaMG5CYU02OGVnb2RhWXZ0?=
 =?utf-8?B?dURhWkJSb2pBNlV5c292dVI5R1p6SGR4dFdEdGlEWkx2aEpTVVlaTlJjVWYv?=
 =?utf-8?B?TXRtUVg1aTdOcCtIWlNOTTVJSyszbUNVaFZaeXM4WG8zMk9MRlFnOTUzOUNW?=
 =?utf-8?B?TGl2VVRsNThROWtGZyt5MXpnMkF3SFBrWG9NRThOTzIxeDUzK0xDeGsyUEpX?=
 =?utf-8?B?WTZoM3EwMEF4dkJ4VE90Q3JyM1B0Uk5YYmRXckxaQ28vK0FuM1RXQWlJU2Fp?=
 =?utf-8?B?MVRtYUZYUWVKOXBQT0NLK21KZ0dPMjIvejZseXhuUkh3cnRqY0YyR2NpYTI4?=
 =?utf-8?B?d29YTmdsNUdnMmx3VXJ3R3ZHWjlSYy84MFE4WlpoRm9wcG9RUFF2clpUNm91?=
 =?utf-8?B?Sm9wR3VLWlQ3KzJNbXVEOWwwTHRZWkxTd1FSQnZ0Lzg4ZkFHNmQ5TWovc2Jy?=
 =?utf-8?B?NWlQNlRNTjF2VmNLQW5kamlzTWxVOGdTaWZtUHpqVEdvdjd0RnBPR0xFUzQw?=
 =?utf-8?B?bmFHSXYvMkdIK21Cd00za29XKzVFYTFUOEdNTGFYdHJMOFdTOStsc1dJR0Nu?=
 =?utf-8?B?anN6Ump1WTZkb3RnOHZCK0pObllvVjlzZlF3SlBUSGw2Nm00YWQ0N3pMYVB4?=
 =?utf-8?B?Q1NicnFZcVhBdWJ4a0I3RVMvRHBtOHp1M1IzR2RkQ0F2QStLUUZUMHRJa0lN?=
 =?utf-8?B?WElPajNwR0ptRk1CRGd0eTNXemxNK3E3K3RxTE9SY0FGZHE1TEVIYTcxTFBr?=
 =?utf-8?B?T1FKS1RRVDFQMFJwVk8yUGV2N0JqenV0am5rY0RReVlLR3dqTm5rbzhnRlVx?=
 =?utf-8?B?Q0UzSmpJdVowb3lQeDVwR3grZVpuRjh1WnZIYjRORk5QdWlBQ1NQSXhqVHl2?=
 =?utf-8?B?NjNEYzM5K2VzdEJMb1l4Mnc5aUowWFlJQVVPMW95QitScGdqcFpjelJtUkd5?=
 =?utf-8?B?a1FTNWpMYlUzclpQTnUvdTZLZzN3KzNoZ2ZSWUE1WFd3QzBxUndCTktPK25m?=
 =?utf-8?B?Qm5oT0lGaEg4UmNReGRyekJOUkExTFZQZjUzWE85MkhXVkZRSlJRaTZBY1F3?=
 =?utf-8?B?UndWWW1waVBhcjJxWlFLS0tDdzVpTjZ3bDhwSnVBaGh5Sll0d0ZKT3dGNUJn?=
 =?utf-8?B?eTlGaG8yT2dqSk9ENXZabTV4MVNBT0gvaFZRUlNhYVREd3B5OEZzMEhJbWhH?=
 =?utf-8?B?dFZ1cXNvWWJOUEpKRWYxUVVQbXN0RUI0c3lhTUFtaXZGQUFoL3FTOGVYTmRp?=
 =?utf-8?B?cFlVU0pHaVE4UVJlNWxsSlIydUpneUd2RTEreWtSOGp3dTF2NEczd1g3c3lZ?=
 =?utf-8?B?WjNWZmY1aXlBU0hmS0xuR0IvTGRjTGdFR2xPQWNGcXlSaFNFK05YanhQVit5?=
 =?utf-8?B?bUFTR2xIN1dKSnV3eGhlWDdwYnN1M0lqU0U3RHBNYXNYTkdhOGFwczFna2dU?=
 =?utf-8?B?SXc9PQ==?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: c4d2003d-b4bf-466d-3cb4-08de185d1faf
X-MS-Exchange-CrossTenant-AuthSource: BESP189MB3241.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 09:08:57.6897
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S0THoPoRi2iL1VKot4LLVYNYeZh5fxI5257+CY3anGq9wSkajp+0QBAq7dILSse/WaMe5ZvedMTcJZ2cmWwuQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4P189MB2755

Without this patch:
--
b4 -d   shazam --check -s 20251028140009.2164260-1-archana.polampalli@windriver.com
    ● oe-checkpatch-dump.sh: Saved /tmp/b4-check-eenY4T.eml (6150 bytes)

b4 -d --offline-mode shazam --check -s -m openembedded-core.mbox \
  20251028140009.2164260-1-archana.polampalli@windriver.com
Unable to get payload from message <20251028140009.2164260-1-archana.polampalli@windriver.com>
    ● oe-checkpatch-dump.sh: Saved /tmp/b4-check-YcwtJ7.eml (0 bytes)

With this patch:
--
b4 -d   shazam --check -s 20251028140009.2164260-1-archana.polampalli@windriver.com
    ● oe-checkpatch-dump.sh: Saved /tmp/b4-check-eenY4T.eml (6150 bytes)

b4 -d --offline-mode shazam --check -s -m openembedded-core.mbox \
  20251028140009.2164260-1-archana.polampalli@windriver.com
    ● oe-checkpatch-dump.sh: Saved /tmp/b4-check-QzxXnn.eml (11806 bytes)

Signed-off-by: David Nyström <david.nystrom@est.tech>
---
 src/b4/__init__.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index 33fbc3f..29682ed 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -1992,8 +1992,9 @@ class LoreMessage:
         bdata += nl.encode()
         payload = msg.get_payload(decode=True)
         if not isinstance(payload, bytes):
-            logger.critical('Unable to get payload from message %s', msg.get('Message-Id'))
-            return b''
+            # Ensure per-patch checkers always receive usable input even if from a local mbox
+            body_text, _charset = LoreMessage.get_payload(msg, use_patch=True)
+            payload = body_text.encode('utf-8', errors='replace')
         for bline in payload.split(b'\n'):
             bdata += re.sub(rb'[\r\n]*$', b'', bline) + nl.encode()
         return bdata
-- 
2.48.1

