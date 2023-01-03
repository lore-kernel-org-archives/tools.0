Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2084.outbound.protection.outlook.com [40.107.241.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C76320E
	for <tools@linux.kernel.org>; Tue,  3 Jan 2023 12:25:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h9NDsnOpYfsa2gkJ0eYXW+EOvIdHlTIBBHoq5sli0idRmUROdgZrYjlSoohjUwPTxMh2tW/QEu/S0f6C3yc0Dua631xyG6QQkXFH/tnM0SiXQiHbwYLdRlJ9ZJ2RGUj4Z3yWaG2adPGujZrWogsnPpF1yerftLgVTuW/obvHedGdNkLiLtFlod5i+btwp5/4ECG4rU6VfF9KIjvK8yANFdh3iwpOF5X0FMtnCa4gGTUixQDrvAoWS9xI/ZvWTaFdhPmSwp/3ephwV2fZSGz/t8sTRMtNaOlIfD7jZQ9QZRKwyY+b5NVq5nXm0wQeh2nFYddZQrU7dCZ5CeoDP6E5Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RwTV7UGKiu8MGvRaS43uHKG/6pvRVDrdy57SWfZL4Xc=;
 b=HJ7a07jizEcOlWMksrDgudPFM4IANTPx028+WDKgPuxVDxHATJi8tQwAKJsaBvqFOjNyYHj8AB+0B/ac3QX3gSn1egKnODqBibSXEO4cmNmFhdrXVDiAPM1WY5Us1RPC0aBxFwG4nrU+klrvG9oVsfs4YZhKcEwGQzQ8VY5/wLiCKKmp4LDr+461L1KH4FjLtG3y+TTXtdvUXIBcGzF4jp8PFS82T99r4xipGDdmDVe1YBSwUiSxGmcqiIFt9gYuCH1xEmA/M7etg4LvsRccOxO+WBZ7sJcmlLShh7uWfF9hFN5+RrFk9SHH6Y/zR+W06sJgprlyYDFlOXyDPaNxrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RwTV7UGKiu8MGvRaS43uHKG/6pvRVDrdy57SWfZL4Xc=;
 b=E9cmHxAbUfJLZ+A4FLH9piKquNVYWA03QuKn5OtwLhR4dWWkmRJT5GPFDWsuE+QndJl/PaZHMfwn+CB8mg7h+utiBHET23arkrJ9XeMqTOQEerAFZhsfEBHnEbV5QRrdtdcaEQdQ29jadEORa3RofrLgxmhUJ7CdHc2d9HJE/EiXw2OZKiSof8JZP5bAxCEFU26SrYp6/NJZeK0jE3kvA7sXz5iIdyQm8v83B9yNrU2LzDf/zmgdkz+MWc95xIkG2LUjdvLWU9JeOK+4uRVCJPsJxPhm1AyZrBNidXKd0u6m9g8c34MKja5NTWriansGmgkX1+dHkTi+7NiuE21n7w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by DB9PR04MB8074.eurprd04.prod.outlook.com (2603:10a6:10:24a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Tue, 3 Jan
 2023 12:25:03 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::9ebd:cd48:9396:76f6]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::9ebd:cd48:9396:76f6%6]) with mapi id 15.20.5944.019; Tue, 3 Jan 2023
 12:25:02 +0000
Message-ID: <b79c49b3-5815-7100-e99c-440e1840b3f9@theobroma-systems.com>
Date: Tue, 3 Jan 2023 13:25:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US
To: "Kernel.org Tools" <tools@linux.kernel.org>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Subject: Regression in b4 send since 0.11.0 when commit title length >=55 <=62
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0401CA0003.eurprd04.prod.outlook.com
 (2603:10a6:800:4a::13) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|DB9PR04MB8074:EE_
X-MS-Office365-Filtering-Correlation-Id: 386ff585-0d99-49bd-565a-08daed8589f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1TgbhXLa2tSH/wFXgXYjhv4IQJCf8+pit7An+8CEB7mAqIwyd9uz11O71vmiH8+S2lEOaAaue78QLFPxhikRaSfpNLmk6HDTXCwbNxyoExibYhCzan6lMkldTfcDf94fFg/6/5GPdK5D3xGQHY65i4c7OjabSljcNwJBC7QBczHZyg3cYfOZ61Dw+vbXKxNtUlw2VywucEIwa52d360qPZzOgYhaDMUDxIr7jKY/MMb0QekDoN8B1tJqKEVLNGja3C22yormIXjJinYA3D9+DRWUin3IPQw41E+NgN8LAUpYKIbY0hMFzdoKeCf7uIdM8EAU7xIQPPRJAQ8hhsV8cz7gYpZPR/Vz/zrL+FeXxlHkDF9U8QA+XdnCC1HCbAg5LyH+gJoqgYmotoFiRQ1WM3IefbKUKSWbRMnvZb0gj25Bq0LkNDahqIfrPGFKt7zWZpCTGs6xrbBgyQLjBweB/vOGVN9wIRkmxlZ3WgKqeLOWWqoF5kjqs4I9G/EJUPiJmVsVNSs30GjP/pyUU4tYg7q4hhIv8Pc3gr7T8aaUFkDDxBonPluXvmbt47HXWapjGeRJIQaNE0LvTvBt1QCmHEVrhiDozcfK7ppS3TuqeFk1LoYfrqbuv2w70lcCVX5hMENoM4iNG4RnwlH+QHoxms4NCj51BJVQrgJmMUjEuvKhhH4+zXXx0Fh8KVDYlhedUyqE5egPjsWlR9azkWo6Fh16bCza1tukDW91sL5OVvYk0soq0QkMwgPaViTiNVme
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(39850400004)(396003)(346002)(366004)(376002)(451199015)(83380400001)(6512007)(186003)(2616005)(6506007)(86362001)(31696002)(36756003)(38100700002)(41300700001)(8676002)(4326008)(2906002)(5660300002)(8936002)(44832011)(4744005)(31686004)(478600001)(6486002)(66946007)(66476007)(316002)(6916009)(66556008)(22166006)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V1czYW82V2ZOYURQdXZzRWJDd1R6ejMyRGlaVTZkQldZbjlZcEt3T1A2T1lD?=
 =?utf-8?B?T0NGSlp2WVQzaWc0UDV4VnY5QWxoOVJoUUxDWjhjYi9WRFhNMGhFMVJCa0l1?=
 =?utf-8?B?REdyZkR3UDI1ekRsbzlmc01ZOHA3QjJYV291SDFCc0syc2VrYU5CUHQwV0VE?=
 =?utf-8?B?VytWV2JPYU0xd25IQmdNSnpoSDRGVFVFRmsyQ00vMkNUNUxmdHZBeEFqMWFW?=
 =?utf-8?B?RllqZ3VpYkNrT2kxay96NFRzWjh6MkJGTU1YanJPbnk5eDhWTHY3SUI3ay9Y?=
 =?utf-8?B?aWRvQWtSMEdrOVJ5VUZGdEs4eHdDaitocCtSTmhHM0w3N2d6UExCSG5HZnNy?=
 =?utf-8?B?V2R5cXYvcURzeDhJQ0RCbHdNOFV3V1JkQjhMRTQ2NXo5dlUyVGxJRG5HWW1M?=
 =?utf-8?B?bmdHbW9WaU1rRklTM1JUaW1rQkl2T0F5U3kvNFFHVDc0anNHZ09DVHZZMEhP?=
 =?utf-8?B?NjJqTVg0TGFrVUdVU3RuSFJVNHdBUENRRjdFRmNOSUFJYXpjTGU4NWhJaEVv?=
 =?utf-8?B?emxUWFo5Vk1sck5LTUI0RldmTUhIMFJqWm5zODRKZnAvNTQyVFVSNi80TXlU?=
 =?utf-8?B?YlN0UmNoZHlscDYzN2VjbWJSa1YvbkdHNEtMYWEzbFdZaFl2b1NvLzRIQVJl?=
 =?utf-8?B?VFNicEozbTllM0JOc0JDUnBMTzBtNnoxS2gwRkM3K1Zvd0lqWEYralhkSTVz?=
 =?utf-8?B?VFBvUk0xWEFrSkxzdy8wazkzUWZqQ2NYY2xRcHpSeGdZbW9DV0lmODJJL043?=
 =?utf-8?B?czgvWXFCbzNGdy9vcm55QXF5TGJHS1h2NFJjUjM3MzUydDBVbUFRUzZENVRk?=
 =?utf-8?B?ancxOURReE94YXBVZUVXVGllRnVvWTBjeDRKdHlVSjFnaFdXUWdlMTdJQm5i?=
 =?utf-8?B?S01HcmZRMEZmWFEyOEpmZHNHcHdkTDJUWWRlcFo0ZmFCV1lLOUh4THZEWkls?=
 =?utf-8?B?WG1kZFRQS28ySXNxZTU0MmdYdW53bzJmYTlOblBldmJSUFZGQ0JlZGhpZWxr?=
 =?utf-8?B?V1NJMmVSWVdwTGNSRTlqaWtlYXJQMDk3Y0xyd21jMWZuOFArcGVYM05lM3lr?=
 =?utf-8?B?bmtFUjNDT2ZmblZjdWgwblcybjJ6TTlSbVZBVGJ1WGNVVHZ1Rm8yV0VxRCtE?=
 =?utf-8?B?UlVsb3ZtWFM1eHNCODJVWXQweWpSZTE1MEpyWFFvRVZFU2FJMFFiUEtnRU9r?=
 =?utf-8?B?a3FaTXhSZWFjeEZVSkRicUk5OVc2clc2N0lRSkpWQXBjSmtRdER0djNMZTJM?=
 =?utf-8?B?YVlKcG1laEtCYnErRE5xTUZJcTVPT2xybnZEa1pzcG9QNTV1WTRkeWtkTGZM?=
 =?utf-8?B?czI1WHpFYm5MRVZMTTVPZkFYWEFHbzVKbGhCU0dFRnZmOWx5Yk8yQTJJSEl0?=
 =?utf-8?B?aGdVR0c3TGJkUHhJL3NNUHBscjkrTDUwQ3dnUXc0VUtsazhjWXJRcjRtMUh3?=
 =?utf-8?B?SzNqamxqS3BmMENnRWhsbzl0ZSs4YkZrOWpJQ0w5NVZjbGZYNXB2S3dXQm02?=
 =?utf-8?B?SDdzck0vaWE0UmpOeFRhSGlPemhNdFhGa2lOM3FGeHpZVE1SbGFicTJSaFZV?=
 =?utf-8?B?cFFZYUVvVHJjbE5hRWV5blc1S3UyQ1YyOEc2YitjdEg3ZXloSHJPRGxmRWU3?=
 =?utf-8?B?WlJaSnV0YUQwRGhKL3p3Tkl0VzBaalcwVlVsRGZmS0VOdFkzQXkrQS9HNit4?=
 =?utf-8?B?MlpYMitIU1ovUkdPbmU0UExVNWY2Q3FyRkZXeUdXK01Cbjc3OTRDYmh4R1hz?=
 =?utf-8?B?WHM3c28yZ1NCRDkraHpLeFd6aTNpUjUwZXJ2eGczZFMyQUFPNmlFWUFOZkQz?=
 =?utf-8?B?YmpaS0gvT3B0d290SWpJZ1kxc1JhUlNldk1TWmlYdUdPUGt6VXAzRUp5bmxD?=
 =?utf-8?B?Q1R4STB5ZUtSK0k5L0p1SDJHOS9TUEVkNnlmNWt4ZHU3cWVzQ2tQeWNFc3dY?=
 =?utf-8?B?VTZLQzBNdElMd3hUUGF6bEhzYzREWEdGVjZFZ0hUa2JQZExkYzh5ZFNyMldp?=
 =?utf-8?B?UTdaY3g0a2ZNa2JuMEorc2dwVFFGS2xDS2FZUDIvTVprd0NOTUxwU0o0dER2?=
 =?utf-8?B?SUM3SGdJV3piSzhKSTVlWkZTVHNRRTVjT1BWYVhLMlJBRSs2NjJMYjJreTdC?=
 =?utf-8?B?dFVDUlRMakhlaC9sKzNtZ0cyTkxCR0U5NDNvNzkvb09HVGp0dHhaUnVaQUVl?=
 =?utf-8?B?K25ZYjU3WjlRUzdmTHFTSnQ5YVFISWx3VWtqbE5hSjJHd2ZnWG44dldCQjVt?=
 =?utf-8?B?STdCNjRrTVcvTjd4Q3Nia2hpWjNnPT0=?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 386ff585-0d99-49bd-565a-08daed8589f5
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2023 12:25:02.8899
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZPVUwOyOu0ln0aS3qQwcwlDcs2JRqFa8YTFz92SMzbIY4en9YUfzzDmI+0lMZHBu+s7ct7/Y+9aJm25HezvY8p4dyOSUW/XHEuZOn66mZ0uz8As+Ab445IkCm2fvvz6/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8074

Hi,

I've recently updated from 0.10.x to 0.11.1 and have an issue with b4 send.

When a commit has a title of length comprised between 55 and 62 
characters, the Subject header content in the eml file starts on the 
next line and makes git-send-email unhappy.

$ git commit -svm "arm64: dts: rockchip: sync px30 DTSI with Linux 
kernel v6.1"
$ b4 send --no-sign -o patches
$ cat patches/*.eml
[...]
Subject:
  [PATCH v5 4/5] arm64: dts: rockchip: sync px30 DTSI with Linux kernel v6.1
[...]
$ git send-email --dry-run patches/*
[...]
No subject line in 
patches/0004-arm64-dts-rockchip-sync-px30-dtsi-with-linux-kernel-v6-1.eml? 
at /usr/libexec/git-core/git-send-email line 818.

This is an issue in 0.11.0, 0.11.1 and current master but was working 
fine on 0.10.1.

git-email.noarch 2.39.0-1.fc37
$ git --version
git version 2.39.0
$ b4 --version
0.11.1

Lemme know how I can help.

Cheers,
Quentin
