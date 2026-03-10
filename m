Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F049334844C
	for <tools@linux.kernel.org>; Tue, 10 Mar 2026 06:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=10.30.226.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773125346; cv=fail; b=Tgvn+wKfs2W/S/OUhMPgdVCHQ18hj/G1W28xItCwtIQSY0opUovRoqelHQKs5Qnb0Os4Q9ocBFR/c/84U1PKC0xi65Zlr4NHoT2yYEH9i5SFV31Rf9nPJsWkiZEUdZc3IjtqhwAAEl0mj8kIvfqprMpLxt/wZiby5Hf/f7FJydA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773125346; c=relaxed/simple;
	bh=ZaePENzSSBrWyB004gTrLar3htNgM/dqH/4xlclXmX4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=sqEhz61t6Mqtwj/1tQDa4RnjvmLorX2qJCyoID7ZhO2H/FK8gOYzZ5uJ3e2Ly2cW9gr1/lzNaNlWxat+ehZkcmpjmYwUBirAbNczfEL/wxtr1Yuwv/6Io/eoVpZRzh04qAJpvvQYY1VxeN8/PNKmoxDNY5g4HUm+zY5r9gCK2lw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b=z1XF53e1; arc=fail smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b="z1XF53e1"
Received: by smtp.kernel.org (Postfix)
	id 91F50C19423; Tue, 10 Mar 2026 06:49:05 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11020123.outbound.protection.outlook.com [52.101.84.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F3F25C2BC87
	for <tools@kernel.org>; Tue, 10 Mar 2026 06:49:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F3F25C2BC87
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=vaisala.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rvlg9mnpdO1GZasanVWuP8Nm/re1R5FjxnR39qU2F3eM4hZx3tWjC226i7+YoiLTwv08ghfzjUlIr99MYKPeSTblgyBiK6k+/PgXdKszsAitw7D6pg1bfeEpEaQtz0uD6K0gbnnvNCgeB/ZRiTwNplk5xvEP4rEuD9A2+dEXVUku8uQc3kF8impxtOwJRSrRQbnzDWHhKgb7Y3UeAQUyUeuEz86bZTePsXOLfEnQ51Bnfhh1esaD8YXqVKbFbO9tzkj2CMHEXuzp4DmGHV2hIZ9j/2Dng2J4ycbRVAUzrdchYN7QI1+EGzb4ghUgKpSk5M5O/AAQSsMoWvJlhDmG2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/3jXl0KrO8K7kHxDctBms9wrhzeQ/xd3hZUsmHBq3a4=;
 b=Z/cyA6xuNZAWbn2ApFTCjZNlkGDWPJpUJh2uc4L4TabucPKblEQSuRDJ7kPBT9AQI5FJaOWeCONqSICENtpelyAEGKRKX464602a2NlUBzLHvuYpBFNunt3WV0sGEXxpJY7h/pwoiRguv+ztRoJrPeMGeBFebO31O2maeWFvozJTe8/kNfbNlC48RHpnECIan7qUgBqdWWbCItM/L6bj3kjk7iTtFZp9WzqG+ltVgo0sgNHreL2yfVwvzgMy67+XkapP50PY476MoDlWbDrkQLMF5HRtYu8lCp/MBjdixnpvAUop3Cyp9bXMv8oYO7z8xTTo32HDfW+qkNrvLpoOvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/3jXl0KrO8K7kHxDctBms9wrhzeQ/xd3hZUsmHBq3a4=;
 b=z1XF53e11/726sNfIanbpzLoK9ofnRgbPk3oXZVl4Vfcd/OSRXXuxxFdi7SSU47++sNvSx+T3xcxYdeMTDrVhMNyh+wiJ/G1ZjETU1XCzSMZrvtSFinHJbCgA/6R9s3qjbeIlOGgcrmenlcgOnxMgQ7TZ3JHCBAvxP34ahL8Wx1T/frOczraXrgvDNV3nKA6wd8kql9g6ogAK8isE6Mf69bk2vAqHDh2vhiK26UiJGAi7uJapKF5mYu1FnH45vcAYe+pT+672D5TNnNBD0IGVhN5rfURSv308pmMXQUGnaH4L1L2x4o8SqVrqUxyMZdi2sJicvDYE7rGumsCl4pvPw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from VI0PR06MB10639.eurprd06.prod.outlook.com
 (2603:10a6:800:2f4::10) by AS8PR06MB7382.eurprd06.prod.outlook.com
 (2603:10a6:20b:33b::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Tue, 10 Mar
 2026 06:48:57 +0000
Received: from VI0PR06MB10639.eurprd06.prod.outlook.com
 ([fe80::3a41:90d:2091:bfee]) by VI0PR06MB10639.eurprd06.prod.outlook.com
 ([fe80::3a41:90d:2091:bfee%4]) with mapi id 15.20.9678.017; Tue, 10 Mar 2026
 06:48:57 +0000
Message-ID: <dd4ed10a-2648-4ac5-9df7-6c453114a820@vaisala.com>
Date: Tue, 10 Mar 2026 08:48:55 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] b4: allow using xoauth2/bearer token to authenticate to
 SMTP servers
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, tools@kernel.org
References: <20260306162020.54683-1-dtor@chromium.org>
 <177281752583.2015423.2312633416921696209@lemur>
 <aasPUY9XWOBy96rx@google.com>
 <56dc34c8-c63e-47c8-9ea7-4420d71574f2@vaisala.com>
 <aa54CjijJk_1S4dd@google.com>
 <466569ed-7b4e-4ab8-a6be-3c5379fc3544@vaisala.com>
 <aa77-EczsZt2eRln@google.com>
Content-Language: en-GB
From: Tomas Melin <tomas.melin@vaisala.com>
In-Reply-To: <aa77-EczsZt2eRln@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: GVX0EPF0005F6A3.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::28a) To VI0PR06MB10639.eurprd06.prod.outlook.com
 (2603:10a6:800:2f4::10)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR06MB10639:EE_|AS8PR06MB7382:EE_
X-MS-Office365-Filtering-Correlation-Id: 27dec98b-f1ff-449c-e8d3-08de7e711a4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|7142099003|7053199007;
X-Microsoft-Antispam-Message-Info:
	eJaoHYh/X2zc1bAckvIHVipgd2Wx/poyMXFWu+lkjHdv6bOFDU+FwLKnMU4Jc2M8IgrKXqEO2cy6HfPR0jsc6jViwAopXw4I3d0wkYct/2xJyYM3DwjvGnrTKwIjND8QIGTO4UvElRtHgYD88U8GvH5dcaN+9IoiWj3HqQZnoV1+hye1J6Xy0heTZzzSF5yBDFbaolyBgjlfdGPOKRhTBGporIl1U/i7qudQlxd2q6i95S72D/LgJQPwwLpGMi7viybJ5y89M80jJCnO0LJWL3fprLwRSIk8ImXSrcLtiymls4x7o3NhFcPksbWUKJduvs49BUX0bhtRihIDRTK/lte9j1zijOI5C24MskCB5KTNxyA8b34JSyuIKuW7kHYb0Eb62YvEhutEs+sFwejc7XJN/JnWxuHA3Ims3J4c4MK8PBSeh8R1BD7EtYIlIxsFxFvk9FXqWJ+gvfhFR6lOB72ND3Ygo2+fRTSNcISrNH++4Ah2BLETXllJsIE99LLtabgIwpKt7gKMoC1RZ1Q+O0y7qDW3z2qcIf1/jnitYP4MP9x5hoUkbxJRCgv5DqQf83mSD+OLx30m+TKOKvBe4a8E/noyrAF08THbUShbfviYGe6+fznpiUY0FU3vtg7WuDRvZNV/RFN69t5v61CYBL6ufQoAdB0USBMwr8ICUQdKcYaSjutsB/VJQbOxA8Z0
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR06MB10639.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7142099003)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a2hJWC9jdmR2eUs3RXdYMFR6UHJpS0Y2RnFTZXI5ZXFLcXpuVGRmNzJyTktL?=
 =?utf-8?B?U3FBRDJPaWJjRTlWbkhLWEY5ZHQrQkR5cGNpQTdmZ1FRL3ZhYjNQb3I3WnNy?=
 =?utf-8?B?TDNxWldaLzVjTjNtTUhpL2ZGL0pWa0pqbzliMzYxNFlvQ2VYWGVGMzE2S29S?=
 =?utf-8?B?MnBKeTZTcEV5ZmdyT0JBelJvQ2I3REJyNjNDVDNwdm1hN3lzZzcyVFlNd0Nu?=
 =?utf-8?B?ZVdzbzMwSmx6MEU4NFFBaWZiTXZHMk53RG1BUE9QN1NncTYwSnlOVXE5Qi9L?=
 =?utf-8?B?TkdLUnhDV0pIM2JsNUJxN3hCbHNSSUZkS2JoTXhEZDFQSHlsRnFPdGJzTlBw?=
 =?utf-8?B?SEJZQmJyNGVUMlljNXZxUjJxeUc3UW0yaG91bEtOT083K0N6TERKZSttSVRn?=
 =?utf-8?B?UmxCQS9rcFdhTFdyT0xLRkxYdk5Uc056TFIxVlVIb2pBTlY2by9TTmpkcFQ0?=
 =?utf-8?B?NmJpSHVCRVdxZ2dJRWtRWkUwM2laUW5QNnJRUkZ6WHhqSzNia3VpWTJWQ1Fa?=
 =?utf-8?B?dFVDcEoycXhZRkw1dzh0ZTN0VktyaEhKMzU1SzRnN24vNWQwZm5qK0ZYQTdV?=
 =?utf-8?B?N2YxaE9WT2JzTVhsaTNIK0lkbTNCVC9jTE9kUndoQmkvek5wYlBYTjBmWGZy?=
 =?utf-8?B?Y0ZLN2JBM3c0dzB0MTl0amJIbW9RRWY0ZERKVFZ0RThXSCtQaytLaHBsRXpa?=
 =?utf-8?B?eVd2SytpUlR4ZVRIZTZxbkQwdGptVjNKTzVRYlNzWU9EVEorV2hVT3BaM0Zx?=
 =?utf-8?B?NE00MkJIVDhNZGIvY1krWlkvSzNieEtNSEx2MDNXZUFXc21hNWhEMHNQaTBV?=
 =?utf-8?B?c1ZSUkVRK3V4VXZHYi83VVRFc1ZJRlVtcjZacXZhTThpa3JBVCtURUlzTGVu?=
 =?utf-8?B?OW4rQSsyc0NkaUVtdWVtMTJRN0M3Ym5kSUl5ZXBUS0xoMDhtUDZCa3hBcjQr?=
 =?utf-8?B?YU8yNTBNanFXaHYySlowWEd6RkJlVTcyMmdleFA2VEZuRHQ5QTVFVnBRenBF?=
 =?utf-8?B?MlM0N2pHVmVxcmV2WVhOYU51SC9MTFM5OEhuTTE4MEtzUVV3RERtNXVFL0g4?=
 =?utf-8?B?cVRsSEVtMGM1dW9UYkV2Q3Y2S1c2UVdoak95eENzblkvMU9rcHp4cnhqaWVh?=
 =?utf-8?B?U2FFNCtKeWFvUlQ1ekIxWG9RWndSYmROQkVEWUhqTWhwTVpqZ3U3czFWYjdI?=
 =?utf-8?B?b0xrZDd6Y2FvYmNoc3ZRU3lSQjBzNHZRaXFDWjVMWjc5b1d2NTFPMTNCYUdJ?=
 =?utf-8?B?a1dLQTdGYlBHMnhCc005aUp6RW9teFhRd2xxeURVTkhXSnRUQklaS2JJeS9O?=
 =?utf-8?B?Z251N0ErUVN6UXB3c2gwNURjYUZEUG52TlU0OEZ1MG9BK2VZZDFYVXlxR3Z6?=
 =?utf-8?B?ZGZUZzBCazM3V2dmVDlyUHpYSGY2cUFjRUh5MllZNkZlNW8rTEJHRHlLb0RM?=
 =?utf-8?B?NUF6WkR2Z2RFQnlHSWJpNUZ6WnNMdkFTRElKZlpFRXlqemhwSGVBRksvTzFx?=
 =?utf-8?B?N2tKN0FwWURZcFVpNWdNcWh5Uzd1dVhJa09zdWN4S2RvOFkydDRsS1VRTWpm?=
 =?utf-8?B?dEN5ZmprZU94OHRoSytoOVVjZmEyZmpDQzhPeXRLV3ZiWCs0N1FqZ0VrcXN5?=
 =?utf-8?B?NHp2Z2tha3c4UzhrbEVESU05QWYydWhVdHRrUW1VMmd2dlR4eXRjTkpndmh0?=
 =?utf-8?B?SWVZVnVPSUo4dHIzejI5WW9oMmhRNFFTMW0vK1pzeWs4S1hmcDRSRUswMkFD?=
 =?utf-8?B?bmpXUXd2bUlJaHFaQ2JBYk9PZWpjaGFYNklJZ1ZCODA0aVlzNFJ1YVI1eVl2?=
 =?utf-8?B?bWpERFZsWGhyTWs1VktYb3JXcGhXSEdDRWM1RHFqNC9FbVVpOW5zRmQxOXZM?=
 =?utf-8?B?MjRucWhQa0VSZzFNUXNzbFVNMnR3UTBmbUdRVTByOXk4Wno1ekVFUGNaOEQr?=
 =?utf-8?B?SHBBRUdCUXI5Mm1qZlJQUW42R0hGWVYrcGNQTzBOVzg3RkZZakJmbjVzQ3Nn?=
 =?utf-8?B?OW1HR2Uzc21SeW4zUWs2VzJrejBTVHJKRzNvZ3F3MERkM3VLbzlyQjJtQ0ww?=
 =?utf-8?B?cUVBSmxNallKYXdPUk1uVmxNcHprMzFNTnhqZXRBaVRwLzhhNTZObFIvNXMz?=
 =?utf-8?B?TUNiTWNrcEo2UVVwQ29hdW56eGxtNmJFVUVDQ2JXZUFPK3VSbFZoNGlMUGp5?=
 =?utf-8?B?NDMzaThFdG1jK3BpNXArc0FscUNRSGhrOW8vbzVNWmFYckkxR1FCU3hXQld2?=
 =?utf-8?B?SUFQaFFaT2pzWjRiUldKbzNqREdjYitpZlJpRzRSVjg4TFl3WU1ZcGZSbU9J?=
 =?utf-8?B?UGFSWDhiVmQwSHZ4ZndOelpxRGM1QUk2WTc3QUJhbUZ4RE0zMmYzTUNNMHJa?=
 =?utf-8?Q?JefksJoDfZPvhv2I=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27dec98b-f1ff-449c-e8d3-08de7e711a4b
X-MS-Exchange-CrossTenant-AuthSource: VI0PR06MB10639.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 06:48:57.1866
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jWI5w3W4mckcvVnAQF9iUGpxqjofjry4u5hwhQwAoPwPQjyQd6hCnedazYtQ22a8JCc1Z6gsdj7dj8ObPwOSqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR06MB7382

Hi,

On 09/03/2026 19:13, Dmitry Torokhov wrote:
> On Mon, Mar 09, 2026 at 11:50:40AM +0200, Tomas Melin wrote:
>> Hi,
>>
>> On 09/03/2026 09:49, Dmitry Torokhov wrote:
>>>
>> In your case, how do you provide the new token to git credential?
> git credential itself calls into configured helpers and the helper does
> this. You do not need to replicate this logic in other places.
>
>> How does you .gitconfig for this look like?
> global  sendemail.smtpserver smtp.gmail.com
> global  sendemail.smtpserverport 587
> global  sendemail.smtpencryption tls
> global  sendemail.smtpuser dmitry.torokhov@gmail.com
> global  sendemail.thread true
> global  sendemail.bcc dmitry.torokhov@gmail.com
> global  sendemail.suppresscc self
> global  credential.helper cache --timeout=3000
> global  credential.helper local-helper
> local   sendemail.smtpuser dmitry.torokhov@gmail.com
> local   sendemail.smtpauth XOAUTH2
> local   sendemail.bcc dmitry.torokhov@gmail.com
>
> The local-helper is a custom python script that behaves similarly to the
> gmail credential helper, but the difference that it supports different
> credential stores - either based on secret storage API or GPG-based so I
> can move my configuration between a headless workstation, a VM, or my
> laptop easily.
>
> The beauty of credential helpers is that if they do not know how to
> handle the request they simply skip it so that the next one might be
> able to resolve it.

Yes, indeed then this looks like a cleaner solution to the 
authentication process and

the approach proposed in your patch should be taken instead of my 
initial attempt.

FWIW I tested this out, but for some reason I was occasionally not 
getting the

token back, instead it falls back to password authentication prompt 
(which then fails).


Thanks,

Tomas



>
>>> However looking at your patch I do not understand why you want to parse
>>> configuration and run the helpers directly instead of having "git
>>> credential" return the data for you and rely on it to figure out what
>>> helper to use and how. It gets protocol, username, and host and should
>>> be able to figure out what should be returned. It is not b4's role to
>>> interact directly with git helpers.
>> git-send-email also requires similar integration with external helpers
>> https://git-scm.com/docs/git-send-email#_sending_patches
> No, it says that git-send-email makes use of "git credential", it does
> not say that it calls out directly to any helpers. In fact, this is
> git-send-email code:
>
> 	$auth = Git::credential({
> 		'protocol' => 'smtp',
> 		'host' => smtp_host_string(),
> 		'username' => $smtp_authuser,
> 		# if there's no password, "git credential fill" will
> 		# give us one, otherwise it'll just pass this one.
> 		'password' => $smtp_authpass
> 	}, sub {
> 		my $cred = shift;
> 		my $result;
> 		my $error;
>
> 		# catch all SMTP auth error in a unified eval block
> 		eval {
> 			if ($smtp_auth) {
> 				my $sasl = Authen::SASL->new(
> 					mechanism => $smtp_auth,
> 					callback => {
> 						user     => $cred->{'username'},
> 						pass     => $cred->{'password'},
> 						authname => $cred->{'username'},
> 					}
> 				);
> 				$result = $smtp->auth($sasl);
> 			} else {
> 				$result = $smtp->auth($cred->{'username'}, $cred->{'password'});
> 			}
> 			1; # ensure true value is returned if no exception is thrown
> 		} or do {
> 			$error = $@ || 'Unknown error';
> 		};
>
> 		return ($error
> 			? handle_smtp_error($error)
> 			: ($result ? 1 : 0));
> 	});
>
> As you can see it does exactly what my patch does: it calls to "git
> credential" and expects something resolving a secret (password) in
> return. Then XOAUTH2.pm SASL module takes that secret and produces
> that "user=$username\001auth=Bearer $token\001\001" string that is
> needed to authenticate.
>
> BTW, I am not sure why you are using smtp.docmd() and not smtp.auth()...
>
> Thanks.
>
