Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2054.outbound.protection.outlook.com [40.107.20.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904227C
	for <tools@linux.kernel.org>; Wed, 16 Nov 2022 10:45:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y+GHkukzqAgjXC6ZqjHSqprL4PiCk6JLFl66PENnh2GUAcZGexGMWcMZaMeQdzvqGvmS82gmPzl9MdQSaFKtw6bCklA2EYvwFSHrg2k1lUyi7xkEYxrMjFk099s6wvsurwVDKVOhtdppCuHdBsAt0BAUQWZt9mxc3qfm8UfDHRovpYCkwkyzmiF7Q3Hi8dWwdMkT6Uu4YNi8SpllBVcVSBliNVMjRBxyTtrXjkTponMQhstrJL3FV0xajp36VdIkM0g5QTXjtADZhaDq2Vn/p+WSd/wg35y2kGZcVEUFy0IvB3XPWASUv/W0FDJwIpmSLvxMBmksPfTQ65nZ3X4/fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BCq06YAFUqP7i2qeco2NbA27MEURN7Lj6un37M8wPB8=;
 b=iq1svI/ogDA/9lFy4YrOHdyIkLhizaypChqViEKTxsAP9mpARn9S5NWpGicNITz22o1IN+OwNetiT/34v05Q42v8fGHDCCWGhaYyNHkIcZRWmFd0T7UmC5Qmqx2KIHQ4M8XHRITdwOLucA06lrx6q+6jtXxvZysIkZSwI91ZLQpyZVOAP9LoHaR7O9U+ZqmQnv+4CVR/vAKumCov4jhLaMXXzf0BleS91QEQ5kOEpw/BioXEDvshEylS62R/K0gOgHLBj8D7+XGEmH3iAx6hThwBztC6RfhWQWtlry5J4TYMkycz7uHndk8D8EAbVznhon9s8Zx9RdwUYHbzHZKUdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BCq06YAFUqP7i2qeco2NbA27MEURN7Lj6un37M8wPB8=;
 b=GQ/NxgE8tjBU9z6cpwR9muE6mfyA5SsqKgz4pxK48WFuCfetdPiC6juR8r0e2VcAldNlxu6RV7Gl/Ev1H/dns6a2a11IY46teX7BV9WKtGrsJ0BTN4LPvgdRiXwmkuGeSHMfI+D3+Vga2CB++xp7v0RpLJ60l7EuaSwOi6OwAedlEM/zgkp8LNam02PKrndJqWcWMeQrrDJ3xn97El0gl2xNq1kKWbcv5icZkfIZRDEth86wWp/9oR3GBBNLRHuAgpSpvNcLImvrPvoOGYwIJr6HXDsE4PtQZmEtXNnCRissKuqF4aJoarLyFFwY0rYcTpV2D9WGqdX6Qo5NLJtFcA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by DBBPR04MB7833.eurprd04.prod.outlook.com (2603:10a6:10:1ef::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Wed, 16 Nov
 2022 10:45:31 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::9584:94ee:73c6:bed4]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::9584:94ee:73c6:bed4%5]) with mapi id 15.20.5813.018; Wed, 16 Nov 2022
 10:45:31 +0000
Message-ID: <d01d5645-eaa1-b28d-0546-6c0692a901cb@theobroma-systems.com>
Date: Wed, 16 Nov 2022 11:45:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v2] git_range_to_patches: actually add to/cc headers from
 cover letter to single-commit series
Content-Language: en-US
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Quentin Schulz <foss+kernel@0leil.net>,
 "Kernel.org Tools" <tools@linux.kernel.org>
References: <20221114-prep-format-patch-single-patch-to-cc-v2-0-70a9019eb90c@theobroma-systems.com>
 <0eeb50bf-9a09-6127-ae50-e838a9261042@theobroma-systems.com>
 <20221115194322.ms34zimtooyfsa4h@nitro.local>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20221115194322.ms34zimtooyfsa4h@nitro.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0101.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::10) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|DBBPR04MB7833:EE_
X-MS-Office365-Filtering-Correlation-Id: 420e92d2-8701-4441-1258-08dac7bfaf15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YpdI7EkPFj/BqasTP6w8oslCv0X3ke8QGVHisaZDyo02ViTNQoSe/8oRMJSxZyBa+rIiyN28op+f4fnKBiNNbio0htd0B6km9fIL9oLl/X8xNQulfN9+lIl792a5gMical2SGY+yB6XfQubG2KO4xFCrNNp8BIkNgR1CQQp+DD2yIKUbYDp8YSbtk/2vNh+KhT4W3yVxDqRXK2hOHdRkNMkj3DVwRcVuAVUE/XfJlpPqjS2VR3XfbMScF9M2Pu7we4mIvoCRqWAQ4eWD390iXNCYDFaH3mqeDth1sTUIeJJZrfeC309Hr7MlUUh0TKH4Josl5AjXWM8G8z9hj/7mUgLZ4vIuJr+WttQgN7n5vuweIi5OJXhcAHXt73lCAfs73qO5P5SAoi9XM1bN5kFwWSk1OaS8tj/VX6HAE18seZ+inpESAJMgrXoFHp/6o0kZUfizVc+aqkK9Ro3Ojl9sY7xaLYGTy3VoK6v0UUP9T+xdBRIsid8ASgJpnaeC+9sxb/MmzxJx7xt1YP7P3gOML+RC6Qj7/sRtzdF3i66telIOKeKvXCdapY0iIIgaePcciV/DSIKLnCZu+teNFnsUdDQxfWGgSu0SXeO1Mz1AN9sXZrgIe20tuK3GY6F/fx5dX5olMgEgwYNHqglD7hnDfaI2ve1bpxbX+F0ATWzph+saf0pM9u2yNEovdWg2tSkUr5iSPjQPbrANwBvv8NBhU+qG1RAz5H8J5bk21z2uRcci4E9Kuo4wNSwZ9bEpPahXn/BmSJQXPMlO/9uKLQwUldMMMeKV5fOQDgIYyHItdqk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(136003)(396003)(366004)(39850400004)(376002)(451199015)(478600001)(54906003)(6486002)(6916009)(83380400001)(31686004)(8676002)(4326008)(66946007)(26005)(66476007)(66556008)(41300700001)(36756003)(86362001)(6506007)(316002)(38100700002)(186003)(8936002)(5660300002)(53546011)(44832011)(2616005)(6512007)(2906002)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MVEwV2xMUFFlZGdtVGYvZy82VW0zOXNoS09PdTdZUVo5dWdENDdmU1BkY3Q0?=
 =?utf-8?B?OEw2d3NYVzllODY5OW8xOFNrYjVvSTVVVE1ZM3VXUXQzSURxaEN0Y3k5dXNr?=
 =?utf-8?B?VUxHbTMrTWVpdmRjTkExcW5EVnVWYjF3QjdrMUd3Q0RBRUdQc1pSOU9IRGgy?=
 =?utf-8?B?V2hnb25vZ1ptcFkrUVdtRC9ONzZjUFAxVVB3NFN4TkdTcHlzOTlvaGNjdjIz?=
 =?utf-8?B?Vlhld1NMQ1BaeXM2MHVzZmpRM0VkbmhEcHdwWitYU0R3RjE1NU9VeTJtbWtK?=
 =?utf-8?B?ang1bW91U0N6b2hhRFJuZlhDNFJyeVIrT3lTbGppM0hCZUptWWNPRHorV0Va?=
 =?utf-8?B?bWxnTUF2clgxVzNtUmJ2c1UwTXBHWDFUZjh4aFJ4QXJ2WGwvTGM2eFRlOGln?=
 =?utf-8?B?a1RkTXdWclYrSUxNLzdtOTJsempRY0lMNUh1ck91Q2J4YUlxcTdoaTVZdS9z?=
 =?utf-8?B?V0RlcjhaMFUwMDN1ZU9JZmlYN2w2dmYwcTdtM3ZmUGtSa1NPN243cm92cWhM?=
 =?utf-8?B?ak5SbUVVM0hiR2YvQlErTWNtTTNNanpTWjFVTFMvRElpbzd1Yk0zdm5tUmhO?=
 =?utf-8?B?cmV2OTMrVHVXRXFxK252bURJd3dUQ2VNWnNGcVNBbHdyQXhMc3Z6NWhxUDdX?=
 =?utf-8?B?allreGNCK0gvdzhzdS9xNzRqYXc4MDdhbGpBWWNoZ3ZlYlNTQlFKY1g3Rks3?=
 =?utf-8?B?MFBOQW1YaDc2QnpGMStBcGQ4NVhzNHFzSlhQMTJyWEdhNGpFZlBLdEtqVGt2?=
 =?utf-8?B?SHVJdE5ha1k2b2tIQXRwMWN3bDVSUUhnSDNGODRBSDV0ZHk4Vnh5ZnV5aEFu?=
 =?utf-8?B?aFYxOVlwTEVSQytwTXRyNkJuYncxYk5aanhlWm9FY09hT2pyUXFISU9ZREFR?=
 =?utf-8?B?RndhNHJDaFkwMzBoSDJ2MFRicWZCMVlyUm9zYXpqc0M1Z3FuM25DRm5BbmtI?=
 =?utf-8?B?WU1Xam4wei95b3FnYzN4MXdpanJkMUdoUTZ0WG81a2E1UlBNaG5GaFlKcWVK?=
 =?utf-8?B?U214OG5VdXNQWlR2YTQwaTJDMFlWVWE0My80VVpWOURKd05vTEpHa084QkE4?=
 =?utf-8?B?bDR6Q1VDVCtFZHY5Tk5Da1dWUS9UcnFUWGZaV2pnaWhhV01QTDd1UlVTaUN5?=
 =?utf-8?B?ZmFEaCs5K3dwNWtzN1V0RkJDdnhuVWhqL2p5NW9aN1JVdHJBV2hJUUJ6Sjlt?=
 =?utf-8?B?RVpuTnpJOSttUjlnQWxNL0hPbituWU1kVFdZR2QwWmxZT2p5TTB5VE1qNXIr?=
 =?utf-8?B?dU9zeVVnN2dEbjNxQ0NJNzNsa1RsdjR0aGZOTHd6VmQ3aG4xRHlNMGlMMnJo?=
 =?utf-8?B?VXFFOFdkUTV4cjVZdTVYOHJPZzFSaUJZUlpSaUVTWldpZVJYWHRZYTkvN1ZO?=
 =?utf-8?B?WlFlYnBwNWRYTDVRdWtOOExHOXZ0RlFXdjBZeERaNEFseDhLRy9mdFRJVUtI?=
 =?utf-8?B?S1lVc29ocnBYUXJxR3hJVElEa0grcGsrb3dVaXVTSWtyNlhhYks1czFXNUc2?=
 =?utf-8?B?aVIwLzN6OEpXUTkyRll6YnRDcGZwbitVZWZmZytpRXRFTG1JbSsyT294MzVr?=
 =?utf-8?B?aFpOU3VhdjRBNGRHcUFoMTBBeSsrK0ZrSGdjM2txbzdTdlRmWS9GNmk5Ykhm?=
 =?utf-8?B?Rll6N0xrTm9VZENGTEQrNlhkTmgyanZkZG93ZlJuaVFvMStaWmhRNStHQzlC?=
 =?utf-8?B?SmZPSTg1VWtHdlVxTjVpQVpKcjhGb0t4NWlkRXpjcU1YK0ZXbGg3YkMxcmNR?=
 =?utf-8?B?YnVOOFpoc3lDMGRFZkZTYTdBTGM4QnpXNm1VNHJPUVZhYlBEcDIxWHJ1WHVq?=
 =?utf-8?B?TTJXOWJaUFhFSEh5U3dzdjBUdFhSSUtTRDFvRklMbm9FNE9ibmNHUGxtaElo?=
 =?utf-8?B?L2Z5UzRlWVZmSFB2ZFVDMmx6bVc4aGpPc3JNdTYvWFpMSFRwOGZkcDVEaVp0?=
 =?utf-8?B?QmgwRXpTS2NuUXdIZldVT1VJM1RFVjhMS0JIOTQ3VVl0YzFUL21aYUhYZ01v?=
 =?utf-8?B?MDkzcjU3MS9ZZldpVUFrYUU0Q0c3SGdzekp3VFRXY2FiRmo3Nk9xTWxMbWN0?=
 =?utf-8?B?QXlnbTFXSGpxUDlVUjB4eHJSMEtJaVB4U1Y2WWlvY2tSZ1doSFNVTjg5djdv?=
 =?utf-8?B?SWhSWFN4QTNpU1J6Y3Rwd0NEUU5YZ2hFYmlta0tqUlhsMUpMcUxHMFJnQklP?=
 =?utf-8?Q?qH4fQ0pudJ/agiPF+4ZVGdc=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 420e92d2-8701-4441-1258-08dac7bfaf15
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2022 10:45:31.8139
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kUjFmA8P+zgciiJv3C5NSh88bQttstbgW+BEtpjg2LxOzuhVjvJzZ4R4BX5QmllLqYyrdaSSJwTZLSyQSM1KmYVKZGpKcRTfbMlBuMvUwfpJImrLJ0BQA0gQu4ihX5pi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7833

Hi Konstantin,

On 11/15/22 20:43, Konstantin Ryabitsev wrote:
> On Tue, Nov 15, 2022 at 06:31:04PM +0100, Quentin Schulz wrote:
>> The issue with this patchset is that it only fixes single-commit series
>> (which is already a good start). However, patches generated with b4 prep -p
>> patches for bigger series are broken because the Cc: and To: fields
>> generated by b4 prep --auto-to-cc do not make it to individual patches, only
>> to the cover letter.
> 
> This was intentional -- `b4 prep -p` generates minimal headers (i.e. operates
> in git-format-patch compatible mode). If you want to generate the series as
> ready to sent out, you should use `b4 send -o`, which will populate To/Cc
> fields (among other headers).
> 

Ahah! RTFM :)

>> I could suggest to *always* add the To: and Cc: fields from the cover letter
>> into each individual patch headers but I know some contributors/maintainers
>> like to have a patch series with not all patches sent to all people impacted
>> by at least one patch.
> 
> I did a (totally unscientific) polling and the results were that almost all
> maintainers preferred to receive the entire patch series and never just
> individual patches, which is why b4 operates this way. The To/Cc destinations
> are only tracked in the cover letter and when "b4 send" is invoked, we
> populate *all* messages with the same set of addresses to make sure that
> everyone gets the entire series.
>  >> I could see what I can do for the workflow where all Cc: and To: 
fields from
>> the mailing lists are added as headers to each individual patch in a series
>> if there's some interest for it?
> 
> Are you sure this isn't already done by `b4 send -o`?
> 

It is. I think I got confused by the name (I don't want to use b4 for 
sending mails right now) and didn't even look into it. This works fine 
for me, thanks for the pointers.

Sorry for the noise, please carry on :)

Cheers,
Quentin
