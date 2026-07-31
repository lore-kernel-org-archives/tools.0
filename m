Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC2F446831
	for <tools@linux.kernel.org>; Fri, 31 Jul 2026 17:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=100.103.45.18
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785520248; cv=fail; b=tAbUi8pXEn898FPx6ipZIAMc9fh8wo9q+OuSOF9WhlE79NdDSuArCYJKpK4GsC9ThaXovGg8H9XzfYrrDLnTDECER3b9iqyVUSf/nsLuuPgJx6N42YK4T34B9EdRm2zNP9b6fT86OOEddOXCGA82igL/vBHCf3c1VkJ2OPCewVk=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785520248; c=relaxed/simple;
	bh=zwNS94VT9UO95mhYwbVW75Oan126aOaceusYpBqQ7QU=;
	h=Message-ID:Date:To:From:Subject:Content-Type:MIME-Version; b=O6ewyu50g42wK7gSmk0pxpEwbl9s4ZzqxKbPUkHqaH5ia7uX/1vLkI8CoCRPyp6dsVl6OOi9Avdv2VLP8AkaVADyEctCLh/IAGJ4FMAn2xjteLmiD8kSu8xbZ1btci4FVE9V+nON/IZMSD21Bg9kiyqMimbXYFI00BEgXCVJz/4=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; arc=fail smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix)
	id 18E981F00ACA; Fri, 31 Jul 2026 17:50:47 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.169.75
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1785520247;
	b=GzZ9YC+6n6xuGXrkvSaF4NAZW26MT7h+Wyie8x96SOFhdbg3FS7oBOWzW0tPs81DSDw/
	 OPVonjrVwLvjBdJWLFJpTTW3M4goN9VJ4IErAFFy4NjvvGP20RoMS4SQqMkfh5njvOkeM
	 RNg34FiuUlpvIwHQTipLQoK1V8RFEW+TALmOGQ1TJnpIB8aLGXBBQBwKe3eLMylX86XlC
	 PBPxKuZZcSX8xzq+VsZn7bKNYYb9T3MBQJ2/w0YAXiIHs4OUPVkB/JJzMdZX7gY0TQgpT
	 ucyZYM2XNZbmCaNHM6fRHuk0stuBSTzRXxFe7XKibxNXXTQhpr9uoQvOOvZNeUwkikw==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1785520247;
	h=DMARC-Filter:Received:Received:Message-ID:Date:User-Agent:
	 Content-Language:To:From:Subject:Autocrypt:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=eHyuKaho17ivhDRHifc2XfTF3cFd2FxhiWrk0AixcVk=;
	b=cMjwyEMvgDVoV92YFgyG0iad42NkjLmMCnqz0ZvdKHgCkBj3AcnGoEUw184N4tkgiBW8
	 uUXQwq03NIT8Hu/dFd2gNpS+1o3nYtGG5wAhVtc0pQpvBBbatE41Ebi/0TMvM0jn6CKBl
	 QiWYcLtqSziF8ZBYC3kFY2/BZx3jBc+Kw+mKGCb+nL6za2IJ2CRcsXOMdl5jYNDZOi9Hw
	 eDmbq3v58LwSGxE7v/4aCbBkqnXyet/VxnQ1Wjjxai7kbwEnBz8yeE2TO5TFU5GB6o2f8
	 p5Y1pfutSStst4GZcMzIggZ6bUiF9t+cRWskLRMKZoVQxRMrQKQ23iotFnAnYqfB7PA==
ARC-Authentication-Results: i=2; smtp.kernel.org; dmarc=none header.from=siewert.io;
	spf=pass smtp.mailfrom=siewert.io;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.169.75
Received: from BEUP281CU002.outbound.protection.outlook.com (mail-germanynorthazon11020075.outbound.protection.outlook.com [52.101.169.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B07871F00AC4
	for <tools@kernel.org>; Fri, 31 Jul 2026 17:50:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org B07871F00AC4
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=siewert.io
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=siewert.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kwG5LAiphgCW8jgAJxcp/0rmxj7924JafBrheKg1A2xL1cCccWHYzogMW/UrUyQhdI/oKjhJm+GCxkND5tTKjDLd2gK2QTE3osvIbv1il+AeVfOK/vlRfzSLn3SqQ6/NPLaSiez8Dpe/1VFbbEuPrzbQ5HWZzIOloywZqYF3c6+3f/XNuDrSjot7XKuQ1ecQFpSyWtEugEfQvoiO7UQ6BCloih4yaVVLKmqwmkcBQE7jVBJKUnNruDaKdA514K/YERy4Qt3sv6Ej79qqD2Ptxw2RttFr4AipZuR4MFSIpJpddjpjj35YwZb7R8z/5eh4eqjCSHIXqdggTLT7Op79GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eHyuKaho17ivhDRHifc2XfTF3cFd2FxhiWrk0AixcVk=;
 b=BcpyidETtPhVrt55Kg9nIZ978LiuEd9EvP0m/RvpgDiGxsU3OeBlkwArbkkHXvWbzpsfFGgazAcQZ/z9Bc+ULJ4aWgHt+2Im0cbviUOuT9ezODvhGh4MbkDxmwCs0ct+zbT0iJdxGKp6kUq6oP8gT+bRBeu1UQ6HX6IMl52S//tOG832dAs7N0HhNMykHLNFE9htRlgCafE6qSb8fDCE4KTLmxUEnfgZBe9xIz0kEUENDpbsipdz566D6QM15v9Sk/gkz/NaxEbP8xqBzRdyqbfpB06lCp+v6iHDEnJZosYpLZGt2EuKF7/9aKFTtS0P1x12jtTfi/etctvoBfZD8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siewert.io; dmarc=pass action=none header.from=siewert.io;
 dkim=pass header.d=siewert.io; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siewert.io;
Received: from FR3PPFB3D0CF1D2.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d18:2::182)
 by FR5P281MB4035.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:103::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.16; Fri, 31 Jul
 2026 17:50:41 +0000
Received: from FR3PPFB3D0CF1D2.DEUP281.PROD.OUTLOOK.COM
 ([fe80::aa8e:db31:b886:2365]) by FR3PPFB3D0CF1D2.DEUP281.PROD.OUTLOOK.COM
 ([fe80::aa8e:db31:b886:2365%7]) with mapi id 15.21.0270.015; Fri, 31 Jul 2026
 17:50:41 +0000
Message-ID: <2c6bc94e-29ab-4620-85fe-010b02942040@siewert.io>
Date: Fri, 31 Jul 2026 19:50:39 +0200
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: tools@kernel.org
From: Tan Siewert <tan@siewert.io>
Subject: b4 send fails with "no configs found"
Autocrypt: addr=tan@siewert.io; keydata=
 xjMEXY4MwBYJKwYBBAHaRw8BAQdAdDPxHO4UUyhKcZXkztTv4iVAbjk/+F8ayCYnegO4q4zN
 HFRhbiBTaWV3ZXJ0IDx0YW5Ac2lld2VydC5pbz7ClAQTFgoAPBYhBJ1bd8XzFb0F9Kx5LnjQ
 kBYSrhG1BQJnqiY3AhsDBQkSJuqzBAsJCAcEFQoJCAUWAgMBAAIeBQIXgAAKCRB40JAWEq4R
 tbtDAQDyPybWLk2EYMeY+vv/WID8hk18+jp3fZCNp9aJp9GkJwD9GeQNvCO1LPDUjkMQqf8d
 DgMM9pmsvbJUFfViYbflbQ7OOARdjgzAEgorBgEEAZdVAQUBAQdAjtzTYeMaO9yG3M1uBtQy
 JB57UJXf+m+mNDhWkOY69DADAQgHwn4EGBYKACYCGwwWIQSdW3fF8xW9BfSseS540JAWEq4R
 tQUCZk72AwUJEibqwwAKCRB40JAWEq4RtUkGAP0R8RmddZqdGdqdod1MkVXpw/z5OOptToXf
 za1W8nsGmgEA5gvQzkN1LJ8oP9LB8YGAmJt82tPvJCmi4WzesI53kQY=
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0074.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::12) To FR3PPFB3D0CF1D2.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d18:2::182)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: FR3PPFB3D0CF1D2:EE_|FR5P281MB4035:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f511d1e-d439-4680-6b76-08deef2c3cf9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|6133799003|10067099003|56012099006|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	/oV8ezLb9RI6G8SqIoeBMbn6gvgjFTSDzFPH5mRHG8PH5JUzlbxKcsv+bwU5s2OMG5ljtJFmNUHFF/HlgvowWYY04roHBod/JUbZPHzvNpdkytcBd0RL3HEHfod3kLFaWSUhJoIIfuWOH6uHKhhUaeTxhlMK2cWMeX5RLK3ccm49sD7S9LlIXosOC+jz5Ej5o0py1gy3Mdy5MKWtErWG+MgDtsveRzB5ipDs30vXTJbnNUIuyTzbeDsgOYdhHerzi+RlbeRdbPWagTnzmPV+XbHc7nE1KPnvVeSQks5Ws5ZUZ0VOXEsYHFFSNMDXG2RihXOhkup8vmXa5Sr2GPU0wJwCMgaGSWQ7Unq6YMfN0HKUcBWdEwAp3yUoHTHgp76uTdvSsBli/H/f80rYtSEWZ9oWdWqeyuEvoYVi8SMcYg81314S+VYRoma5fk6WaUpYa21mCAs5zu6fOKSSRs+ynGQWSVgidm1xI3Vy+KF4gMISb7K133rfgYsBlejijCbvIRn7NWrkVhBsXMSIzxe5xp4vgwLo/zviFRXo0ehBTSQyjcn8GR2scDwF250Io8FgRNSMjlIqTqKOYT0j1QjGonYQ8O/5hKF4B9Ipuhb9WcUFCqVFaQYO0W9gUngeczCYUYzfRisMk2CtshXEmJNdV+AidfK6FUPyCfjxRmxDRW8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FR3PPFB3D0CF1D2.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(6133799003)(10067099003)(56012099006)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d0ZLNUVhUG1IQlNIWWRhTmZjZnFpVUZOR0YvKzdMV0Frb3FsVHR5NnIrcUsr?=
 =?utf-8?B?d2RXSURUak5HUlBUZzNya0NZOVI1ZGFham9BUDE5bTAxd3NXdzM4N00vUzlW?=
 =?utf-8?B?bStwUDhGdmk3QUwvZzI5NWlRWDdQQUJjRWM4bDZkUnNoV0FMMForZlFZY1ln?=
 =?utf-8?B?SHFKa1ZIb3RGVm1lYjFVMmwvWExtL1oxdE1RUnZKWU1HaDVnZW9GZ2p1bFFw?=
 =?utf-8?B?c1BmcTNYanFtTmlMUUp4aXNCb2lab0s1eS80WjhpajJ0TUhuTHFzMFhJSU5F?=
 =?utf-8?B?b2Zxem4zSlphWHBGSThxRnMyS0xUbE45Z0l4UXNHa3FwMTBjK1VUd2Y5MmRv?=
 =?utf-8?B?LzA5ZVNOWWs2WmpwZ0dTWHNWNXJISjNKZGZmRkdJQ2QzSWdCZDFqcTd3S1dM?=
 =?utf-8?B?RVlFcFEzdTA4Q1lSeVBHUDJzRElEbVp3Y1NCNEQwbnV6bG0vbnRaN1c2Nk9v?=
 =?utf-8?B?L0hQT3hZVmYzZVFYVE9DMDlNWUZNZ0xlOXBSekdKdmRlTVkxdHlZSmtIcS95?=
 =?utf-8?B?S2lyVFFGUGsxdnlEMXdLWFF0Z1NBdCtGSEN4SWVMWjVsSm1UK1c2TjhvU0ZR?=
 =?utf-8?B?ZHp4NmthMlBiazBrRlhJcWJUUFR0dzcyc0JQOC9ZdWFCeEtEa1BlQ2VMZ1Nj?=
 =?utf-8?B?akt6YUNRVStnaVREUjhtN2t1M2pnQTQyUUVuVUVmOXVORGtpR0wzYnpoS0Y2?=
 =?utf-8?B?MFhMc0hoWmlYUlVHOHlKN2V4c2d3NDhWeFhmQ3QwWTdGeUN4S0VuNC8xd1I5?=
 =?utf-8?B?cEhFb1djQjFTT21sU09iK3dKRHNpSnB0TklqY0UydjVXVGI4RHVvcGxVN09C?=
 =?utf-8?B?NzhZaHZ4NDVwMTZCdU5KcmhUdkF5ZzZDcDMxY3B3ZkRoVTJpNHlWbU4zRExq?=
 =?utf-8?B?RmdBQnlXVGJScEJPN2ZYY0lUcnBlNE9HbDdoK0ptSTQrcURreUZ5bUhCV09C?=
 =?utf-8?B?ZEVGNUNGR1VOQ1lqQzdSeEdDWWdZMncvUTdBNktKNk4xTXhuN05sRDZaKzli?=
 =?utf-8?B?MmZDWW5LQ0VDbHp5Qzd6empJbkc4LzNZbjNJdzNaQmwza2RSK3ZWck9YOUJz?=
 =?utf-8?B?YkV5Q0d0ekhzRkFQVjBoam1LNk5Rc2lkZ1RPSWFOTEMxSUpiSFlzVUI5Rm5a?=
 =?utf-8?B?YmcyMnZaaEhFeGFDMi9MTFRudVRTaFBDZWZqb2tPdXNUYWhIVmR0VHZVZXNx?=
 =?utf-8?B?M3hLWWRzYlJ4U0NPV01GMHpmYUJoc3JyODR6aXJna0FKVEpUcUNMV05JMkxy?=
 =?utf-8?B?RDhJZ3ZndHlVMlVUWVhZYXR6WUU5V2h0RkpQK3pMUEtweTJjaERObXJkcUh0?=
 =?utf-8?B?WHRISmJUWWZYcHBRTDdmR1ExcWZDYW1vbTZNZ2xadTIxQmcrWkZaUC8wVk13?=
 =?utf-8?B?WlhpdE83cEpISUtib1BpZXd2a3N6K1FDQUIvUkJpQnFlS21kdzJsdzlrSjAv?=
 =?utf-8?B?cHl6TllzTzU4M2pjdytIRzRBMyt4RzFMM2xnY2dyRG9yOUQ5QkliMXN5bDJ2?=
 =?utf-8?B?WDFlTnBmSkxBOUZpRm1TVVhKU0ljbmdMNTI2RDhFZkJqUEZxdjVudFZoV3VX?=
 =?utf-8?B?OStTOTBHeWk5eEd6MzVCWWwzOHZhNUpNMnFkdWxCc2xxeFg4SFUydHZqTnNn?=
 =?utf-8?B?bGtIVkNTNmE4SXVrZXZaUk9XU0Q2aE0zK2NiakNBTDVIK2hiQUNSTTFJdUJx?=
 =?utf-8?B?cGQybGRRVU1raUxSN0JicXY4cnN1dmdIZlVLVUN0Um5XVTlFQ01JT3QxakpL?=
 =?utf-8?B?eHdBejU5c3o3OUtFYWQrYmRyYW5wVEtwSVpydXhjcEVoZ1lxMVBMOFduMDFJ?=
 =?utf-8?B?cjArODRNKzQwZXVheHZJdVVPb3F5NmVZelNqQUJqV3k5a2x3L3dqNU5LakhU?=
 =?utf-8?B?Q0lybWRpSzVzRlQ1SFFSS3RjYmUrN3Z0S0VnSk9RcGFFYVhic1BoMHJpaUxD?=
 =?utf-8?B?Y3V4VXR4ZmNZcWtuUGdjaStrUkR2L0puNzB4MFVTNHMxK3RuS1F0ZTFlRzE0?=
 =?utf-8?B?dGNUUkRXQ0QvWTI0ejB2ZWNnRUhRZThPYThjQ2hpTGdQVTRpQ3ZSaDFGNHdy?=
 =?utf-8?B?T1NYV2JNYXovdGlaV3AzRDRycDhhNnN5WTl4aWM2a0cxcmJEdlp5alJSYTNC?=
 =?utf-8?B?TklHYm9uMVpiMk44ZVB3R3kzVmkxRDlVaEVXelhQVkxXc0s4ajBkcW9vK3Jv?=
 =?utf-8?B?bXQ5TE1aZi8vRWlTS1Z5US9HNUtSbHhoM1c3cVl1WjBIaEpxTGhreHN6MUw5?=
 =?utf-8?B?bDJIL1k5OFFHRU9GMzl1RlRZYXlzeUdQSm9vWE4rNGM2OVp0NUZ2Vk9oMDhk?=
 =?utf-8?Q?BhXJqkZ0aiJAe1OnQ3?=
X-OriginatorOrg: siewert.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f511d1e-d439-4680-6b76-08deef2c3cf9
X-MS-Exchange-CrossTenant-AuthSource: FR3PPFB3D0CF1D2.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 17:50:41.5887
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e8b4abbe-444b-4835-b8fd-87ac97451a7e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7+MuwaBcps/XlD4Y3xCXL0bKJB6NxUkzziJD9Zw6OKtJnEErf6qWqMIBIS+0HueS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR5P281MB4035

Hi Team,

I've been trying to use b4 on my personal system and can't send any 
messages via msmtp / my sendemail identities, because it falls back to 
B4 relay although I haven't set anything for that in this regards.

Version stats:
- b4: commit `1af191c5e` (I'm running on master)
- git: 2.54.0
- Python: 3.14.6
- OS: macOS with nix-darwin

When sending a preview series from branch `ts-x470d4u` (added to 
tracking when I migrated to b4) to myself I get this:
```
((venv-linux) ) linux git:(ts-x470d4u) b4 -d send --preview-to 
kreview@siewert.io
Running git --no-pager rev-parse --show-toplevel
Running git --no-pager --git-dir 
/Volumes/Git/git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux/.git 
config -z --get-regexp b4\..*
Running git --no-pager --git-dir 
/Volumes/Git/git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux/.git 
config -z --get-regexp gpg\..*
Running git --no-pager config -z --get-regexp user\..*
Running git --no-pager config -z --get-regexp sendemail\.[^.]+$
Running git --no-pager config -z --get-regexp sendemail\.private\..*
Using values from sendemail.private
Running git --no-pager symbolic-ref -q HEAD
Running git --no-pager symbolic-ref -q HEAD
Running git --no-pager config -z --get-regexp branch\.ts-x470d4u\..*
Got strategy=commit from branch-config
Looking for the cover letter commit with magic marker "--- 
b4-submit-tracking ---"
Running git --no-pager log --no-abbrev-commit --grep --- 
b4-submit-tracking --- -F --pretty=oneline --max-count=1 --since=1.year 
--no-mailmap --committer=tan@siewert.io ts-x470d4u --
Cover commit found in cb886acf5915184577aa216d3735731dfb4f8669
Running git --no-pager symbolic-ref -q HEAD
Running git --no-pager config -z --get-regexp branch\.ts-x470d4u\..*
Got strategy=commit from branch-config
Looking for the cover letter commit with magic marker "--- 
b4-submit-tracking ---"
Running git --no-pager symbolic-ref -q HEAD
Running git --no-pager log --no-abbrev-commit --grep --- 
b4-submit-tracking --- -F --pretty=oneline --max-count=1 --since=1.year 
--no-mailmap --committer=tan@siewert.io ts-x470d4u --
Cover commit found in cb886acf5915184577aa216d3735731dfb4f8669
Running git --no-pager show -s --format=%B 
cb886acf5915184577aa216d3735731dfb4f8669
tracking data: {'series': {'revision': 3, 'change-id': 
'20251017-ts-x470d4u-54b9e98e4333', 'prefixes': [], 'prerequisites': []}}
Running git --no-pager status --porcelain=v1 --untracked-files=no
Running git --no-pager symbolic-ref -q HEAD
Running git --no-pager config -z --get-regexp branch\.ts-x470d4u\..*
Got strategy=commit from branch-config
Looking for the cover letter commit with magic marker "--- 
b4-submit-tracking ---"
Running git --no-pager symbolic-ref -q HEAD
Running git --no-pager log --no-abbrev-commit --grep --- 
b4-submit-tracking --- -F --pretty=oneline --max-count=1 --since=1.year 
--no-mailmap --committer=tan@siewert.io ts-x470d4u --
Cover commit found in cb886acf5915184577aa216d3735731dfb4f8669
Running git --no-pager show -s --format=%B 
cb886acf5915184577aa216d3735731dfb4f8669
tracking data: {'series': {'revision': 3, 'change-id': 
'20251017-ts-x470d4u-54b9e98e4333', 'prefixes': [], 'prerequisites': []}}
Running git --no-pager symbolic-ref -q HEAD
Running git --no-pager config -z --get-regexp branch\.ts-x470d4u\..*
Got strategy=commit from branch-config
Looking for the cover letter commit with magic marker "--- 
b4-submit-tracking ---"
Running git --no-pager log --no-abbrev-commit --grep --- 
b4-submit-tracking --- -F --pretty=oneline --max-count=1 --since=1.year 
--no-mailmap --committer=tan@siewert.io ts-x470d4u --
Cover commit found in cb886acf5915184577aa216d3735731dfb4f8669
Running git --no-pager config -z --get-regexp branch\.ts-x470d4u\..*
Got strategy=commit from branch-config
Running git --no-pager rev-parse cb886acf5915184577aa216d3735731dfb4f8669~1
Running git --no-pager rev-parse ts-x470d4u
Running git --no-pager symbolic-ref -q HEAD
Running git --no-pager config -z --get-regexp branch\.ts-x470d4u\..*
Got strategy=commit from branch-config
Looking for the cover letter commit with magic marker "--- 
b4-submit-tracking ---"
Running git --no-pager symbolic-ref -q HEAD
Running git --no-pager log --no-abbrev-commit --grep --- 
b4-submit-tracking --- -F --pretty=oneline --max-count=1 --since=1.year 
--no-mailmap --committer=tan@siewert.io ts-x470d4u --
Cover commit found in cb886acf5915184577aa216d3735731dfb4f8669
Running git --no-pager rev-list --no-merges --reverse 
cb886acf5915184577aa216d3735731dfb4f8669..a07407dee77159d6c92881fc225ea8e50c16e5c6
Running git --no-pager version
showargs=['--format=email', '--binary', '--patch-with-stat', 
'--encoding=utf-8', '--find-renames', '--default-prefix', '--no-mailmap']
Running git --no-pager show --format=email --binary --patch-with-stat 
--encoding=utf-8 --find-renames --default-prefix --no-mailmap 
26a5545dae4ef8389d875813d9d1dd1b3993b4f3
Running git --no-pager version
showargs=['--format=email', '--binary', '--patch-with-stat', 
'--encoding=utf-8', '--find-renames', '--default-prefix', '--no-mailmap']
Running git --no-pager show --format=email --binary --patch-with-stat 
--encoding=utf-8 --find-renames --default-prefix --no-mailmap 
a07407dee77159d6c92881fc225ea8e50c16e5c6
Running git --no-pager --version
   [PATCH PREVIEW v3 1/2] dt-bindings: arm: aspeed: add ASRock X470D4U BMC
   [PATCH PREVIEW v3 2/2] ARM: dts: aspeed: add asrock x470d4u bmc
Running git --no-pager symbolic-ref -q HEAD
Running git --no-pager config -z --get-regexp branch\.ts-x470d4u\..*
Got strategy=commit from branch-config
Running git --no-pager rev-parse cb886acf5915184577aa216d3735731dfb4f8669~1
Running git --no-pager rev-parse ts-x470d4u
Running git --no-pager shortlog 
cb886acf5915184577aa216d3735731dfb4f8669..a07407dee77159d6c92881fc225ea8e50c16e5c6
Running git --no-pager diff --stat 
cb886acf5915184577aa216d3735731dfb4f8669..a07407dee77159d6c92881fc225ea8e50c16e5c6
Running git --no-pager log --no-abbrev-commit --oneline 
cb886acf5915184577aa216d3735731dfb4f8669..a07407dee77159d6c92881fc225ea8e50c16e5c6
Converted the branch to 3 messages
Running git --no-pager version
Translating aliases via git send-email
Checking if kreview@siewert.io is mailmap-replaced
Running git --no-pager check-mailmap <kreview@siewert.io>
allto: [('', 'kreview@siewert.io')]
alldests: {'kreview@siewert.io'}
Endpoint does not start with https, ignoring:
Running git --no-pager rev-parse --show-toplevel
No sendemail configs found, will use the default web endpoint
CRITICAL: cannot use the web endpoint with --preview-to
```

But according to `git config` I do have a profile:
```
((venv-linux) ) linux git:(ts-x470d4u) git config list
credential.helper=osxkeychain
commit.gpgsign=false
core.excludesfile=~/.gitignore
gpg.format=openpgp
gpg.openpgp.program=/nix/store/2yvjfckmvvlmcbq4s54fihhmifadgasv-gnupg-2.4.9/bin/gpg
sendemail.hetzner.envelopesender=auto
sendemail.hetzner.from=Tan Siewert <tan.siewert@hetzner.com>
sendemail.hetzner.sendmailcmd=/nix/store/ackfnzlkwbxvq5if1mr309hlx5s9gkjd-msmtp-1.8.32/bin/msmtp
sendemail.private.envelopesender=auto
sendemail.private.from=Tan Siewert <tan@siewert.io>
sendemail.private.sendmailcmd=/nix/store/ackfnzlkwbxvq5if1mr309hlx5s9gkjd-msmtp-1.8.32/bin/msmtp
tag.gpgsign=false
user.email=tan@siewert.io
user.name=Tan Siewert
core.excludesfile=/Users/toms/.gitignore
diff.ansible-vault.textconv=ansible-vault view
diff.sops.textconv=sops -d
filter.lfs.clean=git-lfs clean -- %f
filter.lfs.smudge=git-lfs smudge -- %f
filter.lfs.process=git-lfs filter-process
filter.lfs.required=true
init.defaultbranch=main
patatt.signingkey=ed25519:20260731
patatt.selector=20260731
b4.sendemail-identity=private
core.repositoryformatversion=0
core.filemode=true
core.bare=false
core.logallrefupdates=true
core.precomposeunicode=true
remote.origin.url=https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
remote.origin.fetch=+refs/heads/master:refs/remotes/origin/master
branch.master.remote=origin
branch.master.merge=refs/heads/master
remote.bmc-tree.url=https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git
remote.bmc-tree.fetch=+refs/heads/*:refs/remotes/bmc-tree/*
branch.ts-x470d4u.b4-prep-cover-strategy=commit
branch.bmc-tree/next.remote=bmc-tree
branch.bmc-tree/next.merge=refs/heads/for-next
branch.b4/b650d4u.b4-prep-cover-strategy=commit
remote.openbmc.url=git@github.com:openbmc/linux.git
remote.openbmc.fetch=+refs/heads/*:refs/remotes/openbmc/*
branch.dev-6.18.remote=openbmc
branch.dev-6.18.merge=refs/heads/dev-6.18
```

I've also tried to remove `b4.sendemail-identity` and the whole identity 
config, but it always tells me that I don't have any sendemail configs.

Running the commands manually also returns something:
```
((venv-linux) ) linux git:(ts-x470d4u) git --no-pager config -z 
--get-regexp 'sendemail\.private\..*'
sendemail.private.envelopesender
autosendemail.private.from
Tan Siewert <tan@siewert.io>sendemail.private.sendmailcmd
/nix/store/ackfnzlkwbxvq5if1mr309hlx5s9gkjd-msmtp-1.8.32/bin/msmtp%
```

I've also tried to find the issue myself by checking the code, but I 
don't see why apparently `sconfig.get('smtpserver')` fails.

Any advice for debugging the issue is highly appreciated.

Cheers,
Tan (they/she)
