Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D545B3B52F0
	for <tools@linux.kernel.org>; Mon,  9 Mar 2026 13:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=10.30.226.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773062002; cv=fail; b=eyJX55ee+X37cQOnq/ncBk74ZSS7hSKhDyXLm53lFnJSy/biZXeyFfcVriCHZ0LR7exdos6pG8msNeVED6wc+5vUbItxFom2fO9oRNQzYTH4tP6rfD+dey5YNvbh3NTFm6CR6sj/UsOLB9E4zdxT0DXhhyeRncEX29NS1fmbQsE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773062002; c=relaxed/simple;
	bh=e4ye9D21L9qxvAEmhHerMKjSyIVvDNVZxdWW8JVE00g=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=p14ch1MXaOELqEPnMuLHPXBxMJHiX7j/RFO1sHsMrhlya7kbB3S6zuY+wAgj3h4vCI4fMZfY0eZxYxp7dySKUU74qb5CUDtrDENOBWsFhL46Vi7dZc9BWoGfcLtiV/U4NtGotO9yVIZ0y4ASLVnM2O2h/qMItgfuV+ByYw0EgBM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b=xEobBFWm; arc=fail smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b="xEobBFWm"
Received: by smtp.kernel.org (Postfix)
	id 49ECFC2BC9E; Mon,  9 Mar 2026 13:13:21 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11023090.outbound.protection.outlook.com [40.107.159.90])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DFDD4C4CEF7
	for <tools@kernel.org>; Mon,  9 Mar 2026 13:13:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DFDD4C4CEF7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=vaisala.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l/Hme8yGIlRGk+aeq01XDH9b/IdxzPhcn3j7zf7pL+shjL5N76K/unTABOyLiH2Yvg2TuKSMJdKVMGyAzuF3FnS30DCFwe2JoF1jOi1DR9XxHKOwF6y945BhK4bbuLUPG3ACAp/p8Uw0Njnx6gAPk0zPZnJtXMe0Zv6iCZCFiJ5yZl3ilgTbGLkRVYKSSXZdCnuHRdbWfHPz75ZLVXgZms32V4MziTqjjSnt0IY/idV5K9EEiP0m9PRRLwizmcfXio5nwKGfrZIWcz9IbPQvJ1/dDtgfFbWZMOlHzX7/aSWhQCrkXN4TUaaIPtqlRWugaD5n3rEOqOm4Q3eanSx9fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tCrbpdd2KPokY3Z5fF1jgVHSiVO3eM97sSRhi/E/3sc=;
 b=H10pgHnRltSkE9i28RSaVveivHEKEDBDqEZwtwdd0/1G0OFNYCv008S+MWOHGkrW2ukdL0I1SQLf6Vw4XQIb3y3QGuuFLNepyCCTItN0QIiWX1lj0F8Lra/Wo7CiG+VWN9ZguWc8S0hNzccOzTliqZiZ1PfqIRZGqfvcCVNG4q/A/GUe8l3/3xtwqk1+kDDsJOMhd4u9U+FM9CpxZJZi1bxY1A8TEHD7sied47fQxmBbI+C8WPQS8jgfuKuHdQJI7uIGT5XJqdLoaPtioTyi1fybklBnLc7n23u5X9V/MfJygsg0EuaEQcaqBXSrW2IE/5mCXnFTKN5NXqMiqf9IzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tCrbpdd2KPokY3Z5fF1jgVHSiVO3eM97sSRhi/E/3sc=;
 b=xEobBFWmAdb/FLpnRna+SWadIhwn9C+K+6fnNOWTNt2u/NTaAs7PyYIubLW4d2BcgD9BRLCsst5vA8w46JWnp0BV7EsgeqDrEGoxsoYXBlY9Yc349XgrJrYlTZRAcd3qXdcwibWHqGogt/fEHkE/WPN3BRr9mnonq3pGiLkbrF+ETCsDcZhR9SOZSRpImSKVWsEpF3HTTzhumT9LBdE9FE7pCwrMsiodSTnj/3S4uh5xUDfy0DSEeGChMWd6Xr/8V2uYfxbANZ9rfVh6lbhfu3b7RIo6UINqFrPAyiBJ7ReIhrC8Uhgg7/MiD8/xKqbt+O3sx+oRmP0UecZKUlCDLQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from VI0PR06MB10639.eurprd06.prod.outlook.com
 (2603:10a6:800:2f4::10) by PA2PR06MB9657.eurprd06.prod.outlook.com
 (2603:10a6:102:415::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.24; Mon, 9 Mar
 2026 13:13:11 +0000
Received: from VI0PR06MB10639.eurprd06.prod.outlook.com
 ([fe80::3a41:90d:2091:bfee]) by VI0PR06MB10639.eurprd06.prod.outlook.com
 ([fe80::3a41:90d:2091:bfee%4]) with mapi id 15.20.9678.017; Mon, 9 Mar 2026
 13:13:11 +0000
Message-ID: <852cd789-33e5-40ee-9324-58a6ebb24702@vaisala.com>
Date: Mon, 9 Mar 2026 15:13:09 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH b4 v2 2/2] b4: add support for xoauth2 SMTP authentication
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "Kernel.org Tools" <tools@kernel.org>
References: <20260205-smtp-oauth2-outlook-v2-0-6a5eb233b285@vaisala.com>
 <20260205-smtp-oauth2-outlook-v2-2-6a5eb233b285@vaisala.com>
 <177196210936.4027376.5259967458341555197@lemur>
Content-Language: en-GB
From: Tomas Melin <tomas.melin@vaisala.com>
In-Reply-To: <177196210936.4027376.5259967458341555197@lemur>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: GVX0EPF0005F6F0.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::258) To VI0PR06MB10639.eurprd06.prod.outlook.com
 (2603:10a6:800:2f4::10)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR06MB10639:EE_|PA2PR06MB9657:EE_
X-MS-Office365-Filtering-Correlation-Id: bbc3c9cc-4c19-470f-0059-08de7ddd9d19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	EWy765NQSPmUAkX91rJvIB86uAl7J6DTxbC/OReq0S1z/QNSxfIfP0XJSYwmdypyGwcnXE3WSM4pRsMokNM1MehehPH+JG7Y49pkRDpoCVt7ygv9Y57CNW/V5YGFzbdKjvkGZavRiVM0VBBR8kOmjB+P13yTKPyvAm2fUnpJd7W9smmSfUMq/ki5EmPFx8lk/AMEm5v1V4U/WhM6dhwXBvEzMgZMxCCdQ2hSRyuYrBiDV3niG8N5Ksnyh8zipNElWLLb4FlsjGwDMXK9cpAohLmTPYy9lmQ0JWFoDVf9pQZR1Oq7ma/AjtymdfTQ5+zv4LHwu4hX34wzVx5jHNWmTYOoAdob6V/O6Rm47NZSauXIew72DkSvyN5MYbnOQZJyGEOGQx17EPNjpydYiTdlw1dCIbOWQJ1L9IsMoiyz106MOsiLNS4fnJnw9x/8+KDTKcX7aHwUvvE+JKrfvlmXEeAx+/VMijaLHsOJPCJXBi16wXVK2p5gK5ZBie02h3UUmBTaSNN+V3YJ61kGiGw8ni9OnVss4zjAnWJSKBX2EKTcpFT3qjy1lhIYELixc3g02vMMroUt7dUkEdILSSeyhyaHxqMeW6syBY/AxXNL06KaqHFmdZVYTMNgSgSDqkprDt2Oaz25aUQMfTLHcrc5I1esgXYlpoeaQ14wDVOWV5Fu5XziqffczTx0X6p4K84clKrho/p4ZJ17TDfYwB2quww3ZUlmVsBHNmRspCueD7o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR06MB10639.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SzYwM3g3YVRmWkNOUmgwZTlnNnBuWDhpd1g4Y2l5MVlRdDFSNDBZc2xsVXJN?=
 =?utf-8?B?bDF6dUZSWjFnM3pPckRjdis4R0ZISkpneWgyOWYzZFVPSHEyTEJRR3hNekIz?=
 =?utf-8?B?bzNHMzRZaVlGVUxRdlRTNlZDSkNWSWF1K3c0R0hnb2YxMWRWVTZ6d3dRTG5R?=
 =?utf-8?B?KzRLYnJmTlhRWjNkTFcwRzNxcGxNNVpwMWpueEFOeGVraFBmM1VWcmxyNXRm?=
 =?utf-8?B?ai9LSUVibmxNb08rSTdvMW1jUC9xWDNtQ3NwMFNuRGdtVVJ0Yjd0empvRmR5?=
 =?utf-8?B?RVRUVHdGZTNRMXU2ZHI5N1p5WDI1czFTdzU4UzFkRDNUR0pIOVhSbk1CenpK?=
 =?utf-8?B?VEJHWS9ubE45bmFIcVVtOFhUc3Y3LzNtdENPUGZKYWtONUpWYWJhNHBVdVpz?=
 =?utf-8?B?K1FURTBGZkkxYW1qVXN1L0w0YzREY3Z1YWhUbk9jQTJVdjcwVnczN1dibmNP?=
 =?utf-8?B?eXJGRnVxZDJ6bTB1YnpFd21mRXA2UnRjRGpJdmdEeUtCL0Jld0Z2LzJmRnN6?=
 =?utf-8?B?M25IWEhoV3lmTHh2MEpvWU16RC93amhkbWxxa1JsZGwvSldQd1ZLRW5LaGo2?=
 =?utf-8?B?Vk1QU2dLT2QrbW5GL0pKb3ZNVFJ1OXUrM2hKaDkwZVlIeTN5Z2tQS0dQS2tz?=
 =?utf-8?B?RFljK0k4VEgveWVmT1puY1A0VnJ3UXREUFZGNTFId3RvV0pYRHF1M3NWckRH?=
 =?utf-8?B?TlEwbFgrSi9oSjJGV1lJWnBNa3RYNVJDUEE1c2xMSW5pMGhoeGNLSUl6UEF0?=
 =?utf-8?B?d25EL0hmVEhvUWV2WVd0MXRvaGdLYzF3d2lzQ20vS1BkWEhNQVprVExGU3ZE?=
 =?utf-8?B?b1l1OXFoczN4WTVLdmtRVHBGc1VUSlU5elRxbUtmbkdJVG45RG1aT2lvV251?=
 =?utf-8?B?WGw3V29RZVJnL3lhb2poNERuKzBOV0o4OEdRK3NPa3lvL1dpM1B6em9ueitm?=
 =?utf-8?B?THB0cFNVVUdyS3UvdjAyMFhETmxBYnEwWExFeFJ5Vm1IRW81bzRQWXloU3BR?=
 =?utf-8?B?OXlGZTJyUXMyT1RqNlp1cEZLT1REUGFtaHJHSVBLM1NjK0lMMEJOSlRlV2pR?=
 =?utf-8?B?WFJMSXltZWRTcmk5ZjNWZ2tXQjQ3SEV0M2J3ajVqa3NKN0tCYThoNTFVZ2xZ?=
 =?utf-8?B?NWh0SmpLeWgyRmRqZnpHaUFWUGZ3djRINDdCVFBGb211ZmxxNmVMUGZRRk9x?=
 =?utf-8?B?dzNRUEJvdlMzQXRLYldDSEdkcUpKbWMrUXI2TzcrSGRENVpoZmRFSFg4NGwx?=
 =?utf-8?B?UUpqMCs4L2pVZmlmRzc2bHppcGJ0WDZrcC9oL1pwRTY4NU5ZMURNSWhWMFRM?=
 =?utf-8?B?d0phWjlPTVZzZ3E4SkhGaS9jaW5hTW9nQVE5STBYekozWEVRekc0SzdxKzls?=
 =?utf-8?B?Y3dwS1JZNzVRcUI0cW9NVU81SS9IM3Y1eHZEV2EweGFUR0xJWGNBWnNuMlND?=
 =?utf-8?B?ZmxDeUkrQXZ5NkxvUDZsUGJLT1NtcnNLMXB1RWVFeVMrZHJWcndoQ2hMeTQz?=
 =?utf-8?B?dEpLMndNRWxodENWT0tZdXMwOXYwNVl2UjQzdUVwenFYb1Z6WjF4RzhScmJV?=
 =?utf-8?B?a2phaWt3dGc2K0J5WEVlaktwUkVwMXdmRkVNWTBRTDlCMVF3WlRXN2RmY2Q5?=
 =?utf-8?B?a0pCc1d3U0lXT05wdzZUM3puU1JsUFlGRkVpekJhTytvRmRoTzErWUZKSDVE?=
 =?utf-8?B?SWQ4TnZ0Tkw0UEtobmd4bjNoN3h5WUNHVXBGcWhjbHhvYzh1VitqOTJXVGIy?=
 =?utf-8?B?SUNrUWFMd1FQK1R1WDVUajlndFVCNDY2bUdKanZxOHNpRFdmQjRtQjFPUnpY?=
 =?utf-8?B?NnEzYjBtM3JiWk0yY1k4QlpIWlFRUG8xUENxcEVFYjZpaUdSQnovY2FOYWh6?=
 =?utf-8?B?aHJzdjRjNlpCdnBhaGxlVjV1a0F3bW4yTVM5YUhrMFcxMlBPbk9UYk4yZklQ?=
 =?utf-8?B?cU5ibzNXWWMzelMrc2k3cnBHYWp6L1J5NVU5YWtaMGJHTUxCVkpzNXVDQWlW?=
 =?utf-8?B?RmRMRTY4OUVrWjdyZVlSZ3lzR2J5ZWhvSnBwaHNRM1VMU2Fia0RTMEx1QXhK?=
 =?utf-8?B?c0pBSFY5L2ZqYVdaUmEzRmZpQVF0N09ZbE4vbSt6UDZlR0xJT011M2s3dXY3?=
 =?utf-8?B?VW9tMGR5ZXFDbVJES20xckZRSGdrb3hueExPdU9qTDZVSGVZUnE2S1NDdGNw?=
 =?utf-8?B?bGY0Slp4SUsxWjlLbjVuYm1YQ3VoYk4rZEo4NFV2QkJyaHhITzR5NlhWZ0d5?=
 =?utf-8?B?VTNwY21ZaVV6SXdybUVXZ3dZd3JVUHZaK2pMS0RRdllSY2ROemNvTlUwbUo3?=
 =?utf-8?B?eEgzMFVUVWJNM0RxWHh1b2pXTnBodkNBYUYwQmVDNmUrckladTZNRWdRYmFE?=
 =?utf-8?Q?PpUtC5f4fGOYE81c=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbc3c9cc-4c19-470f-0059-08de7ddd9d19
X-MS-Exchange-CrossTenant-AuthSource: VI0PR06MB10639.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 13:13:11.1655
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: by1O2m7n6HIMCbjOSS6zuvx+bcc0ZrIk8OssUT8oINXMxyH3w8F8r9654LotEfRA/46IoMrXmS10cGC1ufYgaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR06MB9657

Hi,

On 24/02/2026 21:41, Konstantin Ryabitsev wrote:
> On Thu, 05 Feb 2026 11:26:02 +0200, Tomas Melin <tomas.melin@vaisala.com> wrote:
>> diff --git a/src/b4/__init__.py b/src/b4/__init__.py
>> index 3d774f7..645659c 100644
>> --- a/src/b4/__init__.py
>> +++ b/src/b4/__init__.py
>> @@ -2826,7 +2827,7 @@ class LoreAttestorPatatt(LoreAttestor):
>>   
>>   
>>   def _run_command(cmdargs: List[str], stdin: Optional[bytes] = None,
>> -                 rundir: Optional[str] = None) -> Tuple[int, bytes, bytes]:
>> +                 rundir: Optional[str] = None, shell: Optional[bool] = False) -> Tuple[int, bytes, bytes]:
> I'm not really happy with *ever* accepting shell=True for a subprocess, because
> this opens too many opportunities for an attack vector to sneak in. I know this
> is defaulting to False, but I'm still not really happy with it here.
>
> I'd much rather have an _unsafe_run_command() method that is used by specific
> functionality than a generic way to run commands unsafely.

While the other discussion is ongoing, I'm updating my series.

Since this would be only user of the _unsafe version,

I'm thinking could we just implement the call inline like this

-        ecode, out, _ = _run_command(cmdargs=[name[1:]], shell=True)
+        sp = subprocess.Popen(name[1:], stdout=subprocess.PIPE, 
stdin=subprocess.PIPE,
+                              stderr=subprocess.PIPE, shell=True)
+        (out, _) = sp.communicate()
+        ecode = sp.returncode

I'm proposing this format, unless you think that it it is still better 
to duplicate

the _run_command functionality.

>
> (As a side-note, the type annotation Optional[bool] is slightly misleading: the
> parameter is never expected to be None. A plain bool = False would be more
> precise, but, like I said, I'd much rather not have it done this way at all.)
>
>> @@ -4118,6 +4154,17 @@ def get_smtp(dryrun: bool = False) -> Tuple[Union[smtplib.SMTP, smtplib.SMTP_SSL
>>           if smtpauth.lower() == 'none':
>>               return smtp, fromaddr
>>   
>> +        if smtpauth.lower() == 'xoauth2':
>> +            logger.debug('Authenticating to SMTP server using xoauth2')
>> +            smtpuser = sconfig.get('smtpuser')
>> +            if not smtpuser:
>> +                raise smtplib.SMTPException('No \'smtpuser\' specified for xoauth2 authentication')
>> +            auth_b64 = get_oauth2_token(server, smtpuser)
>> +            (ecode, msg) = smtp.docmd('AUTH', 'XOAUTH2 ' + auth_b64)
>> +            if ecode != 235:
>> +                raise smtplib.SMTPException(f'Error: {ecode}: {msg}')
> I think msg returned by smtp.docmd() is a bytes object. In the f-string it will
> render as b'2.7.0 Accepted' rather than a clean string. Use msg.decode() (or
> similar) for a readable error message.

Will fix this using msg.decode().

Thanks,

Tomas



>
>
