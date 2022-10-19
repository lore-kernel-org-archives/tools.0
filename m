Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2087.outbound.protection.outlook.com [40.107.104.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D1C7E
	for <tools@linux.kernel.org>; Wed, 19 Oct 2022 16:23:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D1Lc1jjdf8ho8Zyw7RIoRpHRQ6D5FHcTSqqMsLmoNmIRYpypBeKCBznM2Pyt5JlXCM6hLnwCKL5+41Bo9jA1W/cRC/C+MAnf59e4a+satKo7zLNmdbF3Fw3tag9Co5NffC+tsNzwsj1H7ErDYH/TwvWg8GTtjhnAnDNvthRz3O8UoInzyUvFqlZ7PJHkVUNkR5yFjIfPdLzEeuc8JUxq1XC0/TyxM9a125HibbgaVs46BgoOdgZoO1XEaz/YW8Tzynj2a2pZ458Z+FgwotH0WJYCx4oWbjvVPUDs2f3iH0gpxpvY/9wASJd7zkTiOmpcFCHMuUhrX7HSepWy9V9CqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Snr2EfL/1KFlzKnfYDqFjtA2CVOWlLP5sbd0jiiN7Js=;
 b=cAA+nQAIPw0whkHonNkHVdA1oIQsZseNum+lOkUwCVvrlrn48V8nRLEw2C9oGRkuDLuG9ZuhOj5HFY7op36gmPv6XH2p7jcAPdPQkzxSCxSSTsvT5Sd/k5sHWJGLJjtmMvIXfjW618Aj6RwE0WTzLYeMkopWR0f0vcOXx1igxrbu9GYn6xaee7o7bol0QnTjp9l97vPHJdzz6iN/8NizzlLOeGUR2mZyDDh7E+yhej67SnrzWrCn++GwWpvm46xYGK4NgTEAEfn/jk1NX3K1K+etG5ES3oyvp03kl/1qOsDzrpTcABBF55mOv00bGZ4heO9JLz19fmUbOqaclz1a3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Snr2EfL/1KFlzKnfYDqFjtA2CVOWlLP5sbd0jiiN7Js=;
 b=T1LUcGozpALTXM4R+SHgc3RLALJ/i+25PearCHvaafpdXRElbDolj7t0wG/0H/eCgmUnffxoP4RHt559KhC8cKYWowVF0aXMfMJTOISb6Lu23oVM02dL5mOkmcgQuewKRqcXO7OJJXXAndPqZlQONpI7p0+Xk0mvQOXWdNPbr3xs01YDGa31TpAO7R9RskPWMoFZ3w0k+3Tjtvcbxi2vc2k0zByU72ecXxZTAadHmZq9+LYo/4y9lS5303YQY3egVJosGt4VGaFDtkd7Fi8NiEJ429UKqhFvZC55CbsQ2aCVbNgD7c4ZY2sknzwaeL4N3hR5xCacl2YmIpZrLAHvWw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by AS8PR04MB9063.eurprd04.prod.outlook.com (2603:10a6:20b:446::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.32; Wed, 19 Oct
 2022 16:23:10 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5e5e:1989:e5ec:c833]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5e5e:1989:e5ec:c833%3]) with mapi id 15.20.5723.034; Wed, 19 Oct 2022
 16:23:10 +0000
Message-ID: <9bdb42f7-661a-77ed-97e5-33ba7a31fd9e@theobroma-systems.com>
Date: Wed, 19 Oct 2022 18:23:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Content-Language: en-US
To: tools@linux.kernel.org
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Subject: b4 send --output-dir eml's sent with git send-email creates two From:
 in the mail body
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0059.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::7) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|AS8PR04MB9063:EE_
X-MS-Office365-Filtering-Correlation-Id: 68353bca-06f2-4dc0-60ce-08dab1ee36c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4nDyQcLFD2ceiRNDanPdPMJ5B/FYKt30mRBLsM+8eGrFRPNPB/CQLq1HbasQJaqxY7MDC6K5kE9mFZJmbrgzhldfP9yLHfIHsOfRfjMH6xw9xaogb3AauraZfqpD7GQmmxPJ8ukoO88hQ1hoo62+FchNja7I9JURLbc3kScJyaUn+kQ8cqpwsz38YVlYL0RVJoApacYlD0yTp4PZHqY+yvIv1anO3C9kF0L+h0tjx3louN72fNxBx5SASIggv8BzC/SLUsWsD6A+1H3blejlvoRwqDYXmE73YPYmCGFgMZLeK6HMHn2vkOO3hbjuDAPw93XD1J0cGLg8Ui+VGj3DSFF4fXRwczwOJxNzXjb1/nGHogtTHSRDhLV4pEdW87wD4jvTkYvHWpbSyuc9G2zzj96RimelGPrTBYHj3xec3CqJQrUslDpG1EUC0nrLyS0X8RftcV1fn4NqF4cN1BJMMZyq1aCgOl2vbJoAmh7AY04DSh3teZGSiaPIoAwBrDRGr0g96J+qQ6mCmOsIlsUgsTZJrWXLJdB1HjPr/nOeh/8tOx95MuQz9ldxugOA4HnV13bBFTGE7WmpILq5gDzXzxP3PsSJ5XvoJCjEflup6dwHIyTHs8Dhz7NEVHe/Rttn0mNglCqu++dY6fzj4KFNlw4GCbYWuL6iFQbAKwySWj6Z4snTbtgTHMkgHFp/V28So3qvCbmz+2yOCEtiCWpKq1JNgUvLcC7sSR1v19A5eKYbKD42IkjSngJ6llZ3yALfrh36SfmGQlWf47GEOrMbo5jVcBvwh3yYVOHIbWwXgUdRAYHvLOYHasIS1NYrQUhe
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(39840400004)(376002)(366004)(346002)(136003)(451199015)(316002)(31696002)(86362001)(41300700001)(8676002)(6512007)(26005)(6506007)(8936002)(44832011)(66556008)(66476007)(36756003)(6916009)(6486002)(478600001)(966005)(66946007)(5660300002)(38100700002)(186003)(2616005)(83380400001)(2906002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eU50emU1bU5UbzBqZnlOQ1k0aTd2a2RwWUYyUFhVbitZQ1MwcE4rMUlJZmZq?=
 =?utf-8?B?dElESDRWNk1ndEplZ0cvM0VlTlMwL2ZMK04zRGpEd09VWmtOY2dOOVI5S1lI?=
 =?utf-8?B?OUM5c3dpL0s4SEZjbVgyYUFEanRMRUUrZDY4b0hkVEI3NERPZG5DZnJGUzhL?=
 =?utf-8?B?QjRYMXZVTFo0bDh1K0NYRHUvTW0wZU12OGVZVWRLRTZmYmVIa3ZIa2dkTkYr?=
 =?utf-8?B?UlRsYlVENEF1NitLNENCektoNFllZFNXT2huYWtuUXVPbnFhbkVpRHpjdzBC?=
 =?utf-8?B?YTlpZXJkdXFmaUUxZlVjN3VPRjFWTHJYUms2dC9wRmgwM1h0UnBZc2lLL1ll?=
 =?utf-8?B?ZWcwSUNDRmJOcW9CeWNYQ2p1M2p6VHhZR1BvZnpicFBXTXYvNmdZSFNUdUpt?=
 =?utf-8?B?NXZ2QUUwUm1lNDJVOXNSVUt5bTBYQXJMZ2Y1T2pKazlkN2o4VCs0eFhwaDY5?=
 =?utf-8?B?KzFmYkJvbzdXcldZcFJBWkduVi9sbVZBR3RzR1BuSzlsZXIzRUhIeGlpb25N?=
 =?utf-8?B?TkJrNi91UjgxSzZ1eDN5Skd2UFpkeUgwSDFqdFAydDJhczMxSExGWDE3TG93?=
 =?utf-8?B?VWp4dUtYS1BSTmZqQVQxa3J4SlZoUEUwbHd6K3NtOTlnbW1VcWlZcTVmdjRP?=
 =?utf-8?B?YnFKa3B4cDUrdVpSNTduNVo0TWtUMjFtTlM2VXhSUmNiQS9qOGJSdDNORWVw?=
 =?utf-8?B?eXBNdzZ4N2dGaUl5Ump0VXRCbnY2YktqQm1lTTZUckM3cDYvQ0N0Sm41TmpM?=
 =?utf-8?B?UGVrdkdBYy93VHRhTXJ3NHp6QXh5MVArYjFqNDhjeTl4SGRCTkpNYnFackJn?=
 =?utf-8?B?L1hxMFF4QWVYZldhL3JFaExZaCtoUWhKSUZLQlZvTFBPVURoY1licVFzWkdZ?=
 =?utf-8?B?RklQMVhRc3E0MU1sTTFkdUhMZ2hOelVCL1JrcWE2MnJVNlByT1N0TFRxeHkw?=
 =?utf-8?B?c2hGNEJpOG5SWlZBQUIzVmpQYlhOT2JHTEdQclNxV1NnckZIc3FqbVFneHdV?=
 =?utf-8?B?MWpaNm1xNm1FYjA1bUM4NGVueUJ0SGpwSUZJam41TTNWLzVpYUx6bUpkbTd0?=
 =?utf-8?B?S3BhWEJTdW9za2o4dEl4dWlkWHRETHVaUFdGN1hBQldiSzdRZ00wTis5YjF3?=
 =?utf-8?B?TXlWWGswbE56ZWx1TzAyU2lsOUZVcUhpUHZ6N2JYaG9zOTFEMFBDUmZ5WFdC?=
 =?utf-8?B?MmxyNFFnZmJTdWxuNlFRU3o0SEVzN1pJZWcvbWxnZGdhMUVXQ2RtYnhhdVdY?=
 =?utf-8?B?azZGamgrcTdrQ0RMRFJpTHYxem1BR2doejJYWVpsaUxVK2tMNWJtZmNqV3V2?=
 =?utf-8?B?ZEdqNFZuQUhjYXlLTzRNYVVLVkpUaVVVWWxmK3ZUOWFDSDZlL1VrZUlTWTNZ?=
 =?utf-8?B?cTdpUzJHM1lMMkdJR1pRS1VLR1JFZDE0S29qeDEza0pSL1lHbTB2QXBYSlk2?=
 =?utf-8?B?aVM0TWluSkFObTVTb1I0VlB1cUsvZU1tWU1IWm0yOUo1NzFacit0cTNRTXFE?=
 =?utf-8?B?UjVGZkJVNXlBVGJHVmpMK243UGpPSzFOUE5ydmZPODNkQ3RNTUpvMjlGSUhQ?=
 =?utf-8?B?dk1OM3VsSXFPbW5FS2hMWEVwaEVVN0hsZDh2b3lVOStSQk9ETytyOEMwZUhv?=
 =?utf-8?B?Q1V0RDc0Z014TjFlN3Z3b0hSVVZtL3ZtQ082THVCekxqUGZxeC9FVkhNalcz?=
 =?utf-8?B?bEh4SWtQQnNTM3IycWdFcEUwMm0xc3VjWUdDYW9LOWdkSGliZndITHp6aDBW?=
 =?utf-8?B?dlZMdGFmOXVWd0lBM2lpek9JQ1RGUmpRSWthQ3hPaTYvU20zT0luUHhHdDhh?=
 =?utf-8?B?aUwxNnhHSWkwR0FIdHNPMXZxbjFyaXBXczh4aEwyZ2t6a2t0U1Fpd1F0b28z?=
 =?utf-8?B?Q0F6Wm9Ua3VkV0E3azc4eFRIT2FiaEQrbTQwRzE3Nlg0M21RNWMxd3JQMDdr?=
 =?utf-8?B?Wkg3dVRwdEVvS2tZaFR3TWN5VW5rRW9sMUhwWDFUVkx1YUpuWjVUMjlCVXJV?=
 =?utf-8?B?OUkyNHNRSkFNL2tjeGxFUWNhUENGZ3kzYmV3VCtkQVE2K2Z1b29WZWg0b0lE?=
 =?utf-8?B?TzNOQ2FMQm9ib2huNSt1eUV2UnhwNTdwZzQ1WWFNMWJLd0owT0VIdmwrMCtm?=
 =?utf-8?B?WlA1Y0pZMXYvQ0R6VFVVWGlUc0pDWnRYaDdpZ1ZXSFdQb3ZnTnZ4TXFoQU9T?=
 =?utf-8?Q?IKDtBRITijICQrZ0T1UkfUE=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68353bca-06f2-4dc0-60ce-08dab1ee36c6
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 16:23:10.6587
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FFs7QfiZFLoYR0IU/GO/eN5OqxfJLV9XVcKyChij8ognos+OrErhfe3kxOxXmY53RFl0jOZ6jHDwmf3LgGxF9zZALgVcW2+fFPuJl6fcQJ5BviHsDrNOCqZhODQFqmsm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9063

Hi,

I recently encountered some issue with my particular setup.

https://lore.kernel.org/lkml/20221019-upstream-puma-sd-40mhz-v1-0-754a76421518@theobroma-systems.com/raw 
is the problematic mail, note the two From: lines in the mail body.

This particular patch has a git author (Jakob) different from my local 
git identity (Quentin Schulz <quentin.schulz at theobroma-systems.com>) 
which is different from the sendemail.from configuration (Quentin Schulz 
<foss+kernel at 0leil.net>).

The eml file created by b4 send --output-dir has the From: field using 
the current git identity which I assume is the issue. If I then send the 
mail with git-send-email tool, I get two From: lines in the body, which 
is not ok for git am (since it'll take the first one, which is incorrect).

I tried the following diff:
```
diff --git a/b4/__init__.py b/b4/__init__.py
index fe03834..b8e057e 100644
--- a/b4/__init__.py
+++ b/b4/__init__.py
@@ -3210,6 +3210,8 @@ def send_mail(smtp: Union[smtplib.SMTP, 
smtplib.SMTP_SSL, None], msgs: Sequence[
      for msg in msgs:
          if not msg.get('X-Mailer'):
              msg.add_header('X-Mailer', f'b4 {__VERSION__}')
+        if fromaddr:
+            msg.replace_header('From', fromaddr)
          msg.set_charset('utf-8')
          msg.replace_header('Content-Transfer-Encoding', '8bit')
          msg.policy = email.policy.EmailPolicy(utf8=True, cte_type='8bit')
```

but this then messes up the patches where I'm the author, because the 
From: line will not appear in the body and the author will thus be 
incorrect once again.

Any hint on how to fix this properly? It could also be a git 
configuration issue on my end, not ruling anything out :)

Thanks!
Quentin
