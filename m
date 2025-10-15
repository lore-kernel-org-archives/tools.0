Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3638321B9F5
	for <tools@linux.kernel.org>; Wed, 15 Oct 2025 17:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760549690; cv=fail; b=KTDH+pzyVcmtg4VBgBfcRW9KFKQvkMHN3Kepw3BbdT0MIxq3TIUShaNbfdDW5YQ1hhEYoKBUVMCTfplaNtWBZ4LBjhIjEAE4FE41f+yiZhE1eZ/+PXkZZvcSphmTQJxo+B2dWuURBA3XddfqVtnJ4WT7wPrSTvYIVbFwF08kSjM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760549690; c=relaxed/simple;
	bh=zPvNI1+TKfKWErY4OBBINQp/LimRAPjx5IoqQ1x6vtk=;
	h=To:Cc:Subject:From:In-Reply-To:Message-ID:References:Date:
	 Content-Type:MIME-Version; b=IaVu37Kwg0guKJeVb7OzUiBwTHfrO9qCCtoYJKUYCVk64iuZF/u3uoRMIbAvu4XHoVrj6UwtZRwOCo5B/liw4/SBTtACHfbaZq5epb7zzx5uoWNrYcJdlX+s5lNk1SWHsH0PaaETvfIgaPqi70Mmqre2HXcrKQCu74Yubv/iOPw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Ml3ZhAAx; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=mzqqZedH; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Ml3ZhAAx";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="mzqqZedH"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59FGC6kC002086;
	Wed, 15 Oct 2025 17:34:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=DJDAeUG6tsUnQAYyNg
	aMcoLNBfecwajwQCUlAbdDCQY=; b=Ml3ZhAAxHJ6e40qCc6yycVR1MtsdtHpUoa
	J9WObJL69hI6dr50ZwBvcHUyC6X3ZPA6mqMCxolK72XjBS4SM7s4BSPHx1UIGx3V
	3BQzZrXWIw8VJc3Vlcna0+MVWUANN3LyKiy8zuwmyO3qusYOZ3JeDrqNAHhoYTDV
	TlGstXCZowBo1OIGjolylNcsI6f84L9AoIP7PEHEnne0162hI/ZJuPBRO5DgaOTj
	I3cHVZbYxak2Fy3JzqaMOqZuIVZxX0XhTeGAPDiakNJ3Xg22THia0FM2mc4iAkmn
	PkzC8ys1S7UiStkmkjoJbhEV54R1fL9tUzOuCX9MjspRSnbL/90w==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49qeusy5vc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 15 Oct 2025 17:34:43 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59FFxLlx038211;
	Wed, 15 Oct 2025 17:34:43 GMT
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010027.outbound.protection.outlook.com [52.101.56.27])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 49qdpgnr59-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 15 Oct 2025 17:34:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UpTtEEQNuB9vVhx6NUEWZXUXUnD5qC69VU+hbGerb1Hl3oC0G0OpCGS6QWZmEuEz/2CWRjCCVibNrKT9P09i4OXpN4b3/yNtZwPKqw0P3BTLdE7+SpJWmHZQAzPl+GSeOsffvnFpZf1gF0vgu/GgTTLdhl2Vr61/WKJsb/CDgBLQLwJMIdhTtQIaH1lxceO3JNd2DX9mOCkXoyaV5bnBMSR+zessmdM284vSaLct3xKhBkPcb3qoJzUSF/kjES6+qCKmRg8FFvoYjautY3dcYHVnV/cKywnsQcabJ852GYJAVLASQVNrzIpCYL5j+E141ftYKsk/6fDvW5DaiaEm1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DJDAeUG6tsUnQAYyNgaMcoLNBfecwajwQCUlAbdDCQY=;
 b=hFsLDIkiMYUXQSC7WYjPyzwPWWwNp96vsBqVCU3z7OXrG0ezMWWv9/K0qP2i9aeaV3NhgAmkpN8PDUi6C67DL9ZW9aglnISxvc5vWb1eYXsBndr3KK1YUYzetUXcVb699S2VBeubyCk2/s9tU9nkWhV47QGzVGqRVEezZApARfVOkJ4SKbWxG2R5OZUNGIH1p+QbO//qZe7vLM+EkNGHEUy3L+rKOnv0u/aZr3u/kyJhQhx3Wb+DC0pyNnrW71iHjMuQiFr4cQTFybAEJdnnp3+PuS73hBhTdN7tr3lbYFT9CZd0Cc9ys0mY1Bvcp9LV0C+Ekioh7q3+cDNz4sZ9kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DJDAeUG6tsUnQAYyNgaMcoLNBfecwajwQCUlAbdDCQY=;
 b=mzqqZedH8BxaNoOK8FyrP+Iq7Nrj5KetkphEpunKbK2Xjm5dAmk2cm3JUa5IufAw69QhlJMcci+Bat3zEmmW1Vbq+G7P+O8s9SC3JaIyQtvJAHc7E0nzxuJP8IMT7CSJPZogNVi5V1z/wel29Xbr7XnyMeeAw4kCCY8Ce+TtvMY=
Received: from CH0PR10MB5338.namprd10.prod.outlook.com (2603:10b6:610:cb::8)
 by BN0PR10MB5159.namprd10.prod.outlook.com (2603:10b6:408:116::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Wed, 15 Oct
 2025 17:34:41 +0000
Received: from CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::5cca:2bcc:cedb:d9bf]) by CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::5cca:2bcc:cedb:d9bf%6]) with mapi id 15.20.9228.012; Wed, 15 Oct 2025
 17:34:41 +0000
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>,
        Geert Uytterhoeven
 <geert@linux-m68k.org>,
        Linus Torvalds <torvalds@linuxfoundation.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Paolo Bonzini
 <pbonzini@redhat.com>, users@kernel.org,
        tools@linux.kernel.org
Subject: Re: In defense of Link (was Re: [b4] initial "b4 dig" to supplant
 Link: trailers)
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <20251015-zealous-debonair-bonobo-575799@lemur> (Konstantin
	Ryabitsev's message of "Wed, 15 Oct 2025 10:16:37 -0400")
Organization: Oracle Corporation
Message-ID: <yq1jz0w9izg.fsf@ca-mkp.ca.oracle.com>
References: <CABgObfY5agTRsB-bCqCYbA0erFn5cVbujtTNBiCti8g_68nCWg@mail.gmail.com>
	<20251013081536-mutt-send-email-mst@kernel.org>
	<CAHk-=whSShtPG1_+02Cc4yDuEJxVqX=G8tAx0gW7UjA7cuBp-w@mail.gmail.com>
	<CAMuHMdWxMhM1J3zHC8OkN_fd8XsJPFA6jM_3JFU=ySKhnX6ESw@mail.gmail.com>
	<yq1qzv49yb6.fsf@ca-mkp.ca.oracle.com>
	<20251015-zealous-debonair-bonobo-575799@lemur>
Date: Wed, 15 Oct 2025 13:34:38 -0400
Content-Type: text/plain
X-ClientProxiedBy: YQZPR01CA0164.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:8c::18) To CH0PR10MB5338.namprd10.prod.outlook.com
 (2603:10b6:610:cb::8)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR10MB5338:EE_|BN0PR10MB5159:EE_
X-MS-Office365-Filtering-Correlation-Id: bb99d0bb-4975-4e8f-fcdc-08de0c111f07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PR7tON7E04+laa2fDqv0zkmVyLK6rPSQpH6rW/PUs3F6SysmbFi9yIHF2IlX?=
 =?us-ascii?Q?wjZLstK9AczGoCUPtVk9bSIrPANcNN0H5sntui55J9FesWKbxwhImUjtI7Qz?=
 =?us-ascii?Q?E9m9luTVsDui2GWj5KCu0/lxvSobOz9MxIhFQFOv0LRHiu4m+n4MoQCV3lNa?=
 =?us-ascii?Q?oNX9cxSLi4YxKtib2i8UDSDDm8dr6oJxQCOh7NkVnViIkY3vYFdaEo5r6Ctz?=
 =?us-ascii?Q?1p9hPIIwOVyDTbrgkCKC7B1l8/eOa2DQQtHJwNxk2w1l8wZ44CKL9ziUkUrF?=
 =?us-ascii?Q?bPC3fp2cuqjdYVJfudXegM5mH4keyubA5IkKX6F4AUvq7KrGzRgoNI7Yvikb?=
 =?us-ascii?Q?m+4sG2LxvWBqFv+cRcz/0eRYnko2SFALrb1mYq1BTEu+QCyi5EedDOmbn/L2?=
 =?us-ascii?Q?vquqgdt7YrQkYwDzhbGgI08PX3td6Y0WqepwwrkuU7F4DbpCQgHPp3WF155y?=
 =?us-ascii?Q?qj2S2vfq1xgbj8yr9NDZMmdxQ9Vkh/2Itqma/5gGBRcnDIF1IOA1Ko+Bgwe8?=
 =?us-ascii?Q?1jWRbOk3CdACueuv9hxgSlVCBKhJCDgwO9ElGmhBLyj6cYd5p3AqmZwARCmO?=
 =?us-ascii?Q?3STslGSBN3q9yvgZ/1tg48cawKQ4nt9CVU6zs5va4aV1GEskg6qkjPXOl+q5?=
 =?us-ascii?Q?tsYGT2hrl+4d+aij7f4B2KNZVUGYxPxK9kqUkyWKH9MnQaFJJ5hkFgu1XLaP?=
 =?us-ascii?Q?qml/XVuDg6ttKdzW0nU7f8xdFowU+Eu4CH3iftZMN/dO8gAc+GzLtL9/QTeH?=
 =?us-ascii?Q?Fo+odjH8D1o7ZPa98twAGdVvoalD2UGuRlLD0I2l58V2l2LW06+pZZINaWXw?=
 =?us-ascii?Q?gEWV4HGtnjNbhhXTLIORmFVxCiY/a3Z/r5ATaJ83752cTEAE0z+JzD3W8jPt?=
 =?us-ascii?Q?hU//Lh9wrt69qev1bbOlJvyCGZ8TEK+OMyP0Cm1vikiYnjIWaEjPRqrnfbc8?=
 =?us-ascii?Q?ESU2MEzlgUCPkHKtPMEpVhSaCIwo4lNFMRSwiCRkVzzSEz8HHAT+wBnNo3u+?=
 =?us-ascii?Q?jFw24HuJ9iPIwxP8Lg2h1ezeXH41es1wwyaO4QxlqaRZIQHJwT23ZvWZJ3jf?=
 =?us-ascii?Q?tr3TrB+u2D6LV0QJDYG8e5JxK+K8RpPFKZhrzFOyNZ5Kl7Y153dvHc73FkiB?=
 =?us-ascii?Q?b89ihGR/wxoZOIwf4G0E7XavXhKuMMI8RFCJACjmH+q75NHRSOUku/i+eEel?=
 =?us-ascii?Q?XA+HLWw0ovgUCKVnggJzYEsnzvHucf5NFpBPu+d6tpGC4Cp3KJ01V7kSq44w?=
 =?us-ascii?Q?jaXH/u2Za1F2l8YEdQXbLu6Ba/SGT6JqmyI8hG1fkkEpJnLT2cPbYVgC7KMr?=
 =?us-ascii?Q?KjyL8kV+mep4T+G9Fe4RFjovASmOYTkczWTe/Q5uj++sQfMZSyKVgrQz8WRM?=
 =?us-ascii?Q?oQa6qkyCPQrznDdV/Bna3kohuMTplVRXyUOP5NFEqjqMjlO1htu8hjqWj2KM?=
 =?us-ascii?Q?7VyHEacfWNK4hKgjnlnIkvtUIvT1FPdn?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR10MB5338.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?efl5it/ajGITaL9+ypw2qMyC5ovjn+6Hv3atZAKMRhUT3N92WuTzAy6jwh/8?=
 =?us-ascii?Q?t0xKcqh0bcR1kI2VSbiCHq7mbBFQL16omUr1Fbn5gxrKt5t4rWoKAWRSX8Eh?=
 =?us-ascii?Q?Stj+Jti80xqe3vbtjLDhzv0NAbS9l9HhvsSZvvIHJEZLTUGidHgiIWPit3jy?=
 =?us-ascii?Q?fDS95GxyzzKOxbkXn5QCLGu69PCbpmkebT9S+ewud+xk6tlRS/Ce7QKsfV6n?=
 =?us-ascii?Q?eX2leLAoY+M+MfT+FGP4xJ2EaE+dWaLsRlJHla3YyWp0HqVUoubEIgc/HrdV?=
 =?us-ascii?Q?V5rz/VOgDSE09Vf/2zDg6HX1hDkzSgn0+z9MPFG0DlCxd3IQDprbT3lgTIry?=
 =?us-ascii?Q?gVF4KTK1PVToZ/rx6E9BwaTn/iGl8veOzLeM1GdRByvw2e5+m2Lwb1gtf3z/?=
 =?us-ascii?Q?jEcx8CqY7lzlfg0tvjtZxBjhsg6Sqj68qThhZjVOVIJIb+rWxhwR7AzLOHpz?=
 =?us-ascii?Q?rBT2s0kOIopni4avwK3z27+Qos7xc5zSSDI0KP9U6qST9x8sF42Iz8hx1OAE?=
 =?us-ascii?Q?r/6tQ4bGcf2seJ/nMdjKdskmsdhfxpOC6OKmR8FzOgoYMJF5wN4AtETCWTDh?=
 =?us-ascii?Q?mHRU1Ma6OWpKMMmQGhcTBiCOVsqCtG4qwqGlmB0D1pAsA5Qk+hmEIxCPCOYg?=
 =?us-ascii?Q?0YFsMO0h0xChpMaP+BnLBTpP/4sjsDsalcytGkrtIqpnGtWIoPrDEKoTmxq8?=
 =?us-ascii?Q?hi/VvYugXzowbg5KSyLgkgFmUBwamRAEk/iW11GYuAkj1Ce5zzMstN6EtbY/?=
 =?us-ascii?Q?kWGamIyET8iSRqpufe8JEqEXJlkzuEq4AeyCdVRvdZEW8x52qQEA6FQPLGpi?=
 =?us-ascii?Q?P9dtmZJI1A7/eEjCXS/Y0LHfAbMcu6wUSFZnl1znxP0Ky+ezNTU7PGwSmkfq?=
 =?us-ascii?Q?HUV8twIC7VbiRMM5gyx7yA9kcaKRotcTQ1Dolyw9eXCU4wdiI+ef82a96cWv?=
 =?us-ascii?Q?rJlwcIiRiYPPlW1msu7AgeWEFLpalGmJH0zUGHm1Q5a3TJG2FuUV3nAzWUwP?=
 =?us-ascii?Q?vro8X2H3jVmwSIY4+vDFtlk9spvfKDT6wlMI3gfME9usevhjnFA62GF7PXvh?=
 =?us-ascii?Q?qzd3ZpEtD3jQJSB99gQUEPHkePAwG0tx/QPa4BCIIFe55sL+iCebCiY9C5fk?=
 =?us-ascii?Q?+Cnp4ypHHRUq/vks2SXabD2cwaRy472aB8u5YxF1VNHXi94ZrZoixcxW4a4b?=
 =?us-ascii?Q?K8m6+l4zPTQCqm5uc/P4s5gOHLkU1dh8loo6/uE3VgGcFPniYB80/uJEfd7f?=
 =?us-ascii?Q?F1suFBZP7OWJYRXikcabs3OwH3fsQH9NgrqKqtcufhl8Dfmj0CADgxfLpwpm?=
 =?us-ascii?Q?2DQKz3i+2orz+HF/77JPOvxSe8V77UFt+Hs4J4vIINVO0mfl+Ci8eiDIwQ24?=
 =?us-ascii?Q?l6oVyOnWntX3uAYgRpw+qcmDiFJj553lqciDTsUw7Wz8d0ruHiVro5OwYUh1?=
 =?us-ascii?Q?tAlqF+bCSjN5BLI25xcBJ8Pw5BNIdy8sKyw3zAagJXniafiWRr0psHwx51B1?=
 =?us-ascii?Q?8JIZ25wSxSEz7bWOukCzr4FNxURnApUy81B1KSQtDToJeprN3/1kqxZk0cUj?=
 =?us-ascii?Q?R/N3zdB7btXArSt6NIy3uXU4i2edQWl6xt/Ly+MHvfD3oJJBj6b5RtAaNOd3?=
 =?us-ascii?Q?6A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	pVkjA+GSR76vSMfMLPT989DKVGXW//25DcIFz860CkfehX4o3qiIHhmFYKWUX7Cvq+zzTlfVeVj/iByp4TwbPB1ZNDTL4D+PhcpmteTeTniiPkKxf/jhudyrF3+0tgu+15OUCZuQpujlwX/sSzbacUIaecsXwzHaVrejR+Y9EuILCJHg12IlFfonHX9Y+ISaN55QOyi2FGHm6OAUwkUCnr0D/YN0DT2TByrJz+UuGq3uTwsdF+op4T8hIVSXCgUNPI5qE6lQh3NQ1TnZAh1LzwIQrjALAur1HM+6JPJHJeZVfUmAJ5+mq9bGrslIXSdDMEMhhqC0/PwoIWATQVY8xufjGt778O6X/uxJrbOTzKB9H4XIJYToX9IXNDtAbVunGv4//DSz9lgkJThG0tbfyeFEeJV0rNzojiaThNGR3gkhJbk5G1ogsR8OZHzLVhf6xg8BwP9jyMidaZCvxX6+mVPoNFLUZ3WsarLX20fvcdfOTbns7mL1xhVVzd+JpBr0acKLi0j4Jn+3xGnVGojgLqg9Zt3bjtTrlvZMuunr0FRshSiZ336CQSmDkHVXgxhJWaQ73T41tfkIOaafj+9FQlP+7aN07c4018MQoT4jr1k=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb99d0bb-4975-4e8f-fcdc-08de0c111f07
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5338.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 17:34:40.9430
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rs4Z6adULRQczigtsFKbU59ylG0EUaI17rdm8MwRsYcqqwbdk50QNkYuSoYppVRwVbqST0+xdKdjzQAUrusRqHqflI/yC2iAt1sL11s88co=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5159
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 malwarescore=0 mlxscore=0 spamscore=0 suspectscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2510020000 definitions=main-2510150128
X-Proofpoint-ORIG-GUID: UnL3YWSKJ1SaWC57VpkNyEJgAJZ7h8iu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxNCBTYWx0ZWRfX3qRAJ0k+ricH
 FybKk+yxmi9+Y/fkLMeQrfHHldnDxIsaim/ssO43sfJ79JhEOXHq1NI2D9VtDQS8EeECtSAAtMM
 ASwStGKOQLG2NA9SZJ/brUCIn74a9at5GSZFuvzXri9fWPbvtN5nwYuKoJ7EoCHH3G/p+GAmufN
 P3ngkKbmTktOYOnTeqrj7tyuZkZJbCDtH3Yclc2ZsLoUhdAZ11zV1EFJlA+tGgIO9sXqZDTdLnH
 laU2x2bz4VmDMvOaZ3atAt/WWzb/ZY4qX3wDmxBhvSM2VZ1vd3OQpbvQ859tpqju/L988wRe4Xo
 8KngJObX79hEMjKHIF9V4WvQvuIZ4RBu0+WPFZ7k+Q2m4y+m+0OKXOf2Xyomui8RtJmA/i0FMYU
 wcp2ZUHlmkWbHPPqTSTuY0IbVkmCUcBPzCq9vqxxP7yuB807f/s=
X-Authority-Analysis: v=2.4 cv=E7TAZKdl c=1 sm=1 tr=0 ts=68efdb33 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=XVhYnLVLl6VWzs8UY_QA:9 cc=ntf
 awl=host:12091
X-Proofpoint-GUID: UnL3YWSKJ1SaWC57VpkNyEJgAJZ7h8iu


Hi Konstantin!

> On Wed, Oct 15, 2025 at 09:51:20AM -0400, Martin K. Petersen wrote:
>> With the edits I regularly do to fix typos, add line breaks, or
>> otherwise fix formatting, the effective patch-id hit rate is much lower.
>
> Do you normally edit them before applying, or after, when they are
> already applied to a tree?

Subject fixes and any tags are added to the b4 am output as part of my
initial, semi-automated patch validation scripting. Commentary, code, and
formatting changes typically happen after the initial commit passes
build and test. I don't want to invest time in fixing things up until I
have some level of confidence that the patch is correct.

-- 
Martin K. Petersen
