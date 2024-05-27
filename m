Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3DF62030B
	for <tools@linux.kernel.org>; Mon, 27 May 2024 08:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=10.30.226.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716798051; cv=fail; b=FlXjg0RkdB5c9D8Wo6RNUsRDZrjI79UELY5vUUgPEgLHvUQCqFXp/CkVLbryIRLS5X/F6LOu5Zucf+ITaeTPBQsSle8+2R0AAlM5bLVRJbaJIw/sef9V5PpzbusDyB9g/FFQ6T2Sjhkl4VSyyWjwA5+ZiTJScj3hdo2l3UxGPZk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716798051; c=relaxed/simple;
	bh=9ujmp4QmpzIIwlDwtGf+N+LSzzALDhFnM66K6WxptPE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=LoUJrS+xaYqi83wHYhNovEXqxsILefEFWPa1MolYrnmOFKGlZyikkfdVEJndOcO4ZErCHyu2fY6a57jqT2ObHDz5Fr/lN47d5fUmVyvJmAIRrzKeDgyg5XBA+hQ6bWzbxfXRnR+o1YJUjRDlviD+DuNnHbfSgYIvXDE5hO2Yzow=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=iTUv9zye; arc=fail smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="iTUv9zye"
Received: by smtp.kernel.org (Postfix)
	id 7A87CC32789; Mon, 27 May 2024 08:20:50 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2106.outbound.protection.outlook.com [40.107.22.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8DB6FC2BBFC
	for <tools@kernel.org>; Mon, 27 May 2024 08:20:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8DB6FC2BBFC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=cherry.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ERa0Pp9FNP2wY4ox/dH+dj5DiTCudMVxniu/uaDE4EhUAfWShl5TKbfnS+cB+QVySJxJP8cIsh1d67Xv9eoljl7yxPzA89QSmrk+Cwpg/ZEkdzGRRkZj0W84Fx5wpjIb1uPxmkR2FL/JOgH9fD894cPSlrxbR6/F52Xo7taZo6RBF/TRq2xGDWLaQw9931OE9ApxERbet3mcvakGBfolZlBKp7W865taUTpITPHNQetjUbZOw3p87GikYvUTtLuCpknjPxqaBr2eSyGZkrARO5KfznpXGa23RZeWLOCqVnVFHDNOxwaGSp7Goel8C5ZOqdcAXf2nwocjF3Zktp0X/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fSJmNHoE/fRL73P8fZ7jMdHrtR/0pPue2oNgTDmSugw=;
 b=MPE+AGZwfDvV0/FUBtVuBrfvTc4Wa4Nm+eT2DLNprwOSjhIAdbVCR6rQUIcebN49sTd2aS7neYfqUgnxBGE5dMA6avnRgksVDrEWCQJZZfltytSEBbXENcuieuzVo+W61DUs3zoC77x+j5VNdzu37xlpXNwemdnPAUnB0+laYDAVnjtIsX0jWVQoPX0qzapmKFEj3bWiChes/4voXUN/lnUHzEkNs15FkyzbbNLTOdbRO0gb8Co0ienv2eWT7tB33wD9b5zoZIjTmZMxZ38cZ5sj+Amhvy7SKVHORiuNLLPiYScblf1uRp3T+drEgICmKeiVPd/pELywakjbQs0GGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fSJmNHoE/fRL73P8fZ7jMdHrtR/0pPue2oNgTDmSugw=;
 b=iTUv9zye7cakIjKk6fVupus2WYNnuAkGvQ2X+w37/EeSOGcVybnaQHM2KB3ToyL1LtLjKSH14U+4EPrOeogL/7CqrAsz1itLIIvy4qzIS/ManHz1suWGEEgIv9se/WA8QD3An5fcpKFyd52b0cffMi+VV/HRJ4okSOTMz1+rxNI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from VE1PR04MB6589.eurprd04.prod.outlook.com (2603:10a6:803:128::25)
 by VI0PR04MB10369.eurprd04.prod.outlook.com (2603:10a6:800:235::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.29; Mon, 27 May
 2024 08:20:41 +0000
Received: from VE1PR04MB6589.eurprd04.prod.outlook.com
 ([fe80::8476:1b2f:f236:db31]) by VE1PR04MB6589.eurprd04.prod.outlook.com
 ([fe80::8476:1b2f:f236:db31%6]) with mapi id 15.20.7611.025; Mon, 27 May 2024
 08:20:40 +0000
Message-ID: <90b301be-b631-424b-b985-cf8748b560e2@cherry.de>
Date: Mon, 27 May 2024 10:20:39 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH b4] docs: document b4.send-prefixes conf option
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Quentin Schulz <foss+kernel@0leil.net>,
 "Kernel.org Tools" <tools@kernel.org>
References: <20240524-doc-send-prefixes-v1-1-c6465822ad8c@cherry.de>
 <20240524-great-fanatic-whippet-caec89@lemur>
 <20240524-nebulous-ibex-of-finesse-c2ec8b@meerkat>
 <2e1d55cb-6692-4ea3-86b9-06e2af45f739@cherry.de>
 <20240524-radical-silent-seal-8d1cb5@lemur>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20240524-radical-silent-seal-8d1cb5@lemur>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0034.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::7) To VE1PR04MB6589.eurprd04.prod.outlook.com
 (2603:10a6:803:128::25)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6589:EE_|VI0PR04MB10369:EE_
X-MS-Office365-Filtering-Correlation-Id: 0dbaedf8-b878-4d9d-1d8e-08dc7e25e54a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZVMxRktkakphVVN1dnU3MzVQM3BDT3MyYW9mVmd3cC9oQ1VNRVZpR0NqQXho?=
 =?utf-8?B?WTkzWmlCaHBUajVmcnZ6Ry93Q1gyWmZDbXVmd3U0TmY2a1R1RWVaMFNEbkJV?=
 =?utf-8?B?ZjRVR3Rka3dpclpIVnNVQ21hcFNOVzVPbTFCc1ovai9GZFB2QjRRUTNPajZn?=
 =?utf-8?B?R0xyQTVJaHc1eWhiTW1ZSWMwaDJaeUZiWXhVRGhtME5yWVdVM2lQNjg5eGxi?=
 =?utf-8?B?SlVUTEZ2VEJvTko2TjVsVXB6dC9QbTVkOFdOTFlHdjRyMU5jRlViaTVYYzBK?=
 =?utf-8?B?UjVpeEdwSlp3STVHNmZKK2NFdVhPb3h1VHhESUhMMmh6cW9NN25uZWVsUjcy?=
 =?utf-8?B?RlJzcDVUUVN3eTNjanhnNXM4eTJlbHlYU1RaMkZsSnU4WVFLemZOVnJHd1l6?=
 =?utf-8?B?MFpVSUtDVDliZmUxTDhualZIV2hEQWtRVkxKdGRwcHU4WVVmaWJyZjltVDZX?=
 =?utf-8?B?U3ZXc1h6M3dBMlJmRUhNUjNEM3pBQ2trTVhPVXhVcEd5cEc4UnVyNVBVN011?=
 =?utf-8?B?a0xrelNPdFU3Tk1KZlhSbkxORE5ubjhkTXZIc3FiTVlpSlVjTWF6WkhoQ0lm?=
 =?utf-8?B?QXhFN0NTbGwxcXBNMDkxZGVBK3gyQzJOUHlnN2FnU25pL0JHb1VYdm9MRmxq?=
 =?utf-8?B?MnVJQmxwWmdMVmpqL05DUXpMQVVLL202V3A2ZjNxa2RQYnFjQWdHRVBORUI4?=
 =?utf-8?B?RXNOUkpGWmlnSDZQL3QwL0M0Nzl2YjdYeHloeGhERGtWRDRJVkNtWW1WTERo?=
 =?utf-8?B?OHdndWRpNlRRb2RLdk1UMysvVENPN1BvalVhdTBjNGJsTS9UUVRJRHdXanNB?=
 =?utf-8?B?UE90aDJSaDl1eSt6ZmgwMWs3RkZRZ1QzN3RQTlFQaWdMbTk3Wk85ektwSWFy?=
 =?utf-8?B?byt6TTlPd2dNUkdlL3FpRFFRTHd2YVZsTDBaMiswbFdOQy9UazZJTEx0WFJj?=
 =?utf-8?B?NDJtbGhYaUhXQkVzYXBYbVIwcGhGaUlZRzNvNXpGUm0vLzhCMnJFdkprQmhv?=
 =?utf-8?B?K2xmc0htand2bHhDeVFHUkppV2VzTTkwaHEvRTJ3eG9uK1QxZWZXM1p5UWNq?=
 =?utf-8?B?emRlbFZETjVZdmNveTRibUZ4bHNDeWRGN09mb1I0S1V1aTl1OXg0QnBHdTFh?=
 =?utf-8?B?cVo4RFpiSWpoc1FiVXkwYit1NzdrT2Z3MGlLRVcyR2gydkVFcnl5SFYvck16?=
 =?utf-8?B?c3JCRmZFb1MvbXhLVWRtdHNWZ2VnZDVaZWUzNlhYOHlNWjNJT3EvZkVVcFRu?=
 =?utf-8?B?WGxCRkVGWG1RR3dYOWJibGVuMklzSzJZaUVETHB4aUQvcEhTZThBRW9hUVdO?=
 =?utf-8?B?eXZVNWtTcStFa3BnTTNJeStlRUZCNXdLT3phQWtRblozRk5KYW1LQ0VzdUow?=
 =?utf-8?B?SWh4b2k1eDNWRzRmVjhQelJPdXUwTThvaEJqT2JYQUxmbVEvanY3K2VSZVRr?=
 =?utf-8?B?S05ZQTd6akVGcWV4RTh5UUVsZmxLRmdNZU55UlhZYWNNUzRuM1lqTjB5ZnBR?=
 =?utf-8?B?STE4bWpSNFZvRk9JTFU2TE5UM2lvZkhtNXowSlBHQmYyQTVuclQ3eUFiU3hp?=
 =?utf-8?B?MmZrQlBDVTcxT2xNU3dyazhKNzZndSs2dGV0UCszZWJPSVFWVVpBUDNVKzZE?=
 =?utf-8?B?dFlOT1ptN0JHVEJiZ0VEaDhjWWRQdTBZMG81SjdkRjZ0b2dQRm5kSGx5YU10?=
 =?utf-8?B?NWJrSzZaUWdxZWZWTVQ5bnh2Zm53WUNHeWlGbDhWNnI1TkdmRXMxVjB3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6589.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?KzJVY0R5WXE1OEpEK3JReUdWY0J0VUM2b0xKT3crLy9ObkFYbzY3ZHgxaHVi?=
 =?utf-8?B?ZnlDUU4vc1kvVGR4N3p6YU5ibnNzbkZ4WlBxVWU1MmZLRXI3QStvVUxxSjVv?=
 =?utf-8?B?ancvcS9LWWVHMXZ1V3p6cU85bXdnckhjZlF3R3prR1lYT01wK2tQanQ1dmVV?=
 =?utf-8?B?Nmx0T3Jxd3VGR2hZVnRpZEN4VUtXSVFBU0Z0c05sMjBGZFlscHhhWGd3OExJ?=
 =?utf-8?B?dHExQklMT2owTVlZZGR6ZjNlUlFzZVpyOHBWZFhxZnVyMlhxYnNsMjMreUF2?=
 =?utf-8?B?MEU1R0F2Z1BhM2E4RUtEL0hBWXkxWW9ZWnRPNGNqNGsyWEdHWVk1akFpa3Bv?=
 =?utf-8?B?M0NMNXBsejZaQmNzRDVhUkxkWVQwY2d4YlRoZnNCb3RjR1pJUGpTUUNHTmR2?=
 =?utf-8?B?YlJhcms1dkJZeFFEQ0tIVHFRbnV5Mi9BMDNzU1VJanNoZUhLNHczVTJFMjQy?=
 =?utf-8?B?dmNrRi9pV3VpNzU4cjZST1BTVjBuRExHT01NNGVaQk9abGltMFlyOU1rUWZV?=
 =?utf-8?B?TnZYQ2NRdUxhL0s3bFFoZlFKbmZZeDBES1RYQjZ3Qy9yNFBkRElMby9vakZk?=
 =?utf-8?B?VW9JelRuVXgzNU8yOFVpemN4RElSZHF5SHZVOWRaUjhkQTlyMWVyMERNUTZr?=
 =?utf-8?B?cDlNMnNYYkdXRzVFeUpDRC8zQUl5eTVKSVhUTTFicjFaRWoyZXNuQWJyNStG?=
 =?utf-8?B?R1FxdXJveFdmenpzVVZXOHJLUmhZalhMbjVGSmxRVmRWRTIvQ3FPWnk2TXp3?=
 =?utf-8?B?eENvcG9mUUpOcUQwM1JJdzVYUFVmQ1hma0VkK255citwSzNReVRENEJHZnFz?=
 =?utf-8?B?cWNxNHhiMGFOa1F3cERFaHZMNnJ3Y1ltSUNpUCtoRUx3dUtMK012djRXWGNo?=
 =?utf-8?B?Z2MrR1RpS3NLb2NXYURjTiswYnhVTFB0QXhHQlZVQXhRWUgzOU9CZHhQK2Fu?=
 =?utf-8?B?V1dxT0JmV1h2STFvcVdEb1NpU2NOYjF1dWpITmlvcTBuU0NQQi9iaGhZM1gx?=
 =?utf-8?B?S2dYNUozdzkxYlFXUER6NjVyV2x4OVhoODByZ2F6NzhlYnVCTXU5Z0czTHVv?=
 =?utf-8?B?UE8rTlVydE5odXN5TnFGSm9IKytGNmpXMEtPS2Y3blFodU1meVh4VkdJMmV1?=
 =?utf-8?B?bDRLVWtCQ3RuUjV0SU1iSG1RZGJIN3cyRGlBTDdCclV4YnBIUlJSWFo2TkRh?=
 =?utf-8?B?ZllFSnN5WklZdloyN24wMyt0WDFYTVY1Qk10WjFFaFJzL09Bdlh5MFF1VVNj?=
 =?utf-8?B?NE1zMVU0eTdxZDh1VE5zY1lqZk5hdkdIbzhGVmx3dHFVb1F3QzY4dUkxbGZi?=
 =?utf-8?B?eWhUYUZtNVFSUHRXbnB5RFpJNWVxMWNrOFlHYnBlcjg2eXRVNU1xejRDRkNw?=
 =?utf-8?B?K0pIQ04yQ1JOTXdXOUdYTkVJMEU2RWlkL2s2OEFWYWlqczMwTUxCeU5lTE85?=
 =?utf-8?B?R00velY2a2VJM01XVXpwWWhqbUVNUkY3NGU3OUdlSHhBalVkeVJ0Zk51enpL?=
 =?utf-8?B?cEpMUVIrYTZnRzExQzM0eHhhS3QwU2RmTVZpamNOSnlDbjJueE9vTCtMeDhC?=
 =?utf-8?B?ZFhCcTB5MEp2dlBSSGNnYmpOR2VCUFBCK3NVbUorU0NLVzAyanQ1YkU4VGp0?=
 =?utf-8?B?K1BZWWNuU0UveGNtb0VBVERlb2lBeXUycDN1OCtraW9MU05lNUhKRGJEUzc2?=
 =?utf-8?B?eGphbWVaR0ZmMkRxTXVmS05ISFRuTjkwb0hPRlBJOVFFeXFEa2pkaDNDbndx?=
 =?utf-8?B?M2pPbitYa3c2NkVWKzU3Y01TdEJhUUlSZE5HNnFGWkw5UWRqTnljaFVZcWh2?=
 =?utf-8?B?ZGRKSGRJZ05aYWFFanlaQUtORHd5NFhFdGhHZm0xMWdyQk5ROGxDQytJc29i?=
 =?utf-8?B?S2lyYUFQMUhnWXpPZysrY1JrTTdhQkxjNnVGS281UmRDU1FSckd0OHFOeFFh?=
 =?utf-8?B?VWs4bnhxaHNlQkEzUTJVRUppNStLK20wWEdEMk53L1BCVStTbVFvenV1bWJO?=
 =?utf-8?B?cjZ5cDFvRFZCWEIySjluRmx1eTBiSmRXYmlObjFGWEdzM0M5cFlESjhWQXlt?=
 =?utf-8?B?V1lUaXhKNDFNQkFWaVU2M09uaWZIZEFSQWNidEtmSWpJem9uUURBTnpWZXdr?=
 =?utf-8?B?YmhMUXp3TWVWR3pwdTBHMWlsMS9BWjg0ZzI1NExVeEsyNEhqL01QR2E0TDIr?=
 =?utf-8?B?OVE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dbaedf8-b878-4d9d-1d8e-08dc7e25e54a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6589.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2024 08:20:40.7215
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +Ba2bw5toIidE/yQiCaDN7QrzbC3haBQqawngf2Y+3WZtFe9j1sfO8qoWUqxJIQ4wFz0V1M044v++0USHCwZzSWL3762BJqhrjfb5pYNaOQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10369

Hi Konstantin,

On 5/24/24 10:25 PM, Konstantin Ryabitsev wrote:
> On Fri, May 24, 2024 at 05:07:53PM GMT, Quentin Schulz wrote:
>>> 3. switch prefix management to always be in the subject line of the cover
>>>      letter, as opposed to being stored in the tracking json
>>>
>>
>> That's an option but then it'd appear in git log.
> 
> Not sure how you mean. Yes, it's in the git log, but since it's just the cover
> commit -- it doesn't really matter?
> 

Not sure anymore either, too late on Friday I guess :/

>> Additionally, I'm not
>> entirely sure everyone wants to blindly have all strings matching '[.*]' in
>> the subject line be applied to all other patches in the series?
> 
> Well, it's stricter than that -- it has to specifically be at the beginning of
> the subject. And wouldn't you always want the same prefixes across the entire
> series?
> 

Yeah, I guess this would be fine actually.

>> I would go for 1., probably because I thought of it as well and that 3. may
>> add a lot of corner cases and I'm not sure how to handle them?
> 
> There's another option of just using --edit-prefixes the same way we do
> --edit-deps, but it seems a bit overkill to kick off an editor just to edit a
> couple of words. :)
> 
>> BTW, I also had a "surprising" issu when the cover letter title is the same
>> as a patch and I added a git fixup, a git rebase --autosquash would try to
>> fixup the cover letter rather than the commit, which makes sense, but was
>> not expecting a git conflict at that time :) So if we go for 3. maybe that's
>> also a way to add some logic there for that, if that is a "problem" worth
>> fixing.
> 
> So, you mean the cover letter should always have a subject like:
> 
>      [COVER] This is the cover letter subject
>

That sounds right to me?

> That could both help visually distinguish it in a git interactive rebase
> session, and then clearly show where prefixes should be added.
>

One can identify the cover letter in a rebase, because it has a "#empty" 
at the end of the line in interactive mode. It's just that the 
--autosquash doesn't handle this properly and takes (I assume) the first 
commit in reverse history (older first) title that matches exactly 
what's after !fixup in the fixup commit, trying to fixup the cover 
letter instead of the actual interesting commit.

Have we agreed on solution 3) then? What exactly is next? Just to know 
what are the expectations from you and me?

Cheers,
Quentin
