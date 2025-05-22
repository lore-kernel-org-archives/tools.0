Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1D814B08E
	for <tools@linux.kernel.org>; Thu, 22 May 2025 17:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=10.30.226.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747936418; cv=fail; b=MlQ4J3/VlTnJK5gzW1kUAXgVHDXfug3KuGzcKR6Sd4t26v+D5g4/lXerQQssUT1kt0fU2xA45IwenDNBsgey/z2HoCynQuRvAGOdRlpOdL3CpNO/RRF49M4HdY2emBtIqo88bNnGTGZGeoGNG30KLSJ3orpm01cxHX6aaMV+zGw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747936418; c=relaxed/simple;
	bh=bvL5I5WSi+eEJgMpD0ab4Ow14i4mRMVWk4WL9+56iQA=;
	h=Content-Type:From:To:Subject:Date:Message-ID:MIME-Version; b=BsERObxpk3T8dXrlF2PvQDxGINiuaSuCKH38P1d6UljtfeIS4+/G1nyQ0nDBh0XJqOQoz9UMOsPQlAhZUS2g74oXOG125OoVf0sZ6WP5dl0gHUCU8FiV/cKKlZAN0nnvMktsA2EA3uEnhE/UF5+G1G/ubvO39CqawqIfH0h7ico=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; arc=fail smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 8DA1CC4CEEA; Thu, 22 May 2025 17:53:38 +0000 (UTC)
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020104.outbound.protection.outlook.com [52.101.225.104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 535E3C4CEE4
	for <tools@kernel.org>; Thu, 22 May 2025 17:53:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 535E3C4CEE4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=aquatechflow.cloud
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=aquatechflow.cloud
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tKeNX2THxhi/Vg8tebfc4zmRMA3VxVEmyGi/eWFlduZ2h+Hr6lJqgF+jR7PujHU70Y4O796mkOwsKml9kysZ4eXTXyrjuijxuntjcunDC+TZhorDrEoa1uv6fzQQM7xtfueKo0oALYX9Jc8PPsc0dZMRuH3+JMsqyCe33Qep2heJmIZtgTu2zeiufg8UsHKeo3J8ZftIKJNhhYgC8rGRW3XEZA4rdTkqVAI4d0xu+yeDPhHmXRWfL7unbRv9riDUu+JLovUcOlk4semeS9ttGbDdSlTXIw1pqLywiDJh64v1kJ/lRFIQCvSy4K2U/WhkYm0LvZJ58trf+645IhyQ+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aOWU434iijUZSOrYhfaaCpHxSYUKw8F28mIYh0KykNI=;
 b=nBXvFJsfEDE+8nay58K2gARZtSJr7fiaQ0oK1Dpwif5MwJgIDwM1xZaMDMA3ghXgZ2k2rv7cVWporKS5LpLQE9hJRIJIXcadhRqFByMyqFvbzEgL5fmyv0EKfSeVtcvDzLd3uMW5nCRw4HqXen4B1SgbiNhWIJsrDNUkItM8PjzbqDi5SexE8jSknlDDwNHlnQXaGKATqvgKdAIzyMGy8O+Qqe+3YR0VwMHRJFdPDirKOhB9YOLNb3YoPo7qJnFdMWDhzii9idZhv9dZUPl1IJeSZN1Rv3C3vB7Lqoo1rdUpEY4Bb76l6pPbcLYZgmEmoHWpXV5IbQiXL90P+CywUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aquatechflow.cloud; dmarc=pass action=none
 header.from=aquatechflow.cloud; dkim=pass header.d=aquatechflow.cloud;
 arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aquatechflow.cloud;
Received: from PN3PR01MB6888.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:a8::10)
 by PN3PR01MB6886.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:94::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Thu, 22 May
 2025 17:53:34 +0000
Received: from PN3PR01MB6888.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::4e80:e0a8:bac5:72b3]) by PN3PR01MB6888.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::4e80:e0a8:bac5:72b3%3]) with mapi id 15.20.8769.019; Thu, 22 May 2025
 17:53:33 +0000
Content-Type: multipart/mixed; boundary="===============8841433650373006813=="
From: karlly.willson@aquatechflow.cloud
To: tools@kernel.org
Subject: Hospitality Industry Technology Exposition and Conference 2069
Reply-To: karlly.willson@aquatechflow.cloud
X-Antivirus: Avast (VPS 250522-4, 5/22/2025), Outbound message
X-Antivirus-Status: Clean
Date: Thu, 22 May 2025 17:53:33 +0000
X-ClientProxiedBy: MA0PR01CA0037.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::7) To PN3PR01MB6888.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:a8::10)
Message-ID:
 <PN3PR01MB6888220FA8A4B746A50D25FEEA99A@PN3PR01MB6888.INDPRD01.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB6888:EE_|PN3PR01MB6886:EE_
X-MS-Office365-Filtering-Correlation-Id: f0d269c9-f1de-4e95-96a9-08dd99599204
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1032899013|10070799003|69100299015|366016|1800799024|52116014|586017|376014|8096899003|13003099007|4076899003|2066899003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?h6ibdWe35yAxu/MycysYaZDX4Sn5PD4NUIg2Mfv3cH6Fw5nnmaQVJWErWsGU?=
 =?us-ascii?Q?pAiDKyTFL6A2LT3YWKJyCpRCCL9Utuh1A2ew0GinTVKFPr7HKhoaxV7qiAnc?=
 =?us-ascii?Q?owTENqo9nUA7NkdS9eEs6484g2zsYmPMIisF9JcBQrvQL0PZNt+ydHTIxFn/?=
 =?us-ascii?Q?kZTW3TOZkYY7S0JDlwNNROaAQdwEVyt4qNUXTsWe4FsbKaM4hdOJBCcH3ytn?=
 =?us-ascii?Q?2ou2PKHW6BWrRf6iVcH+aKzh9SdiLIfsUNdyNB1fGk0hCBfofZIylGqENDxN?=
 =?us-ascii?Q?vT6+kQYtDMX87tCvK12rQKbjTwZxFpG3oleI8HBkOBAteYMb7xzKdXwEKylc?=
 =?us-ascii?Q?ZXNEq0qqMxjPgm0ltUR2JAFirF4awxHgCF0sbcygmkehC+gQEZ7A7ogZYltZ?=
 =?us-ascii?Q?cZ3NA1qr/NqDtrM8J9ZoEi/imaH6z5GWkVb+cbeT9hTFbwJrSThd/dwSe5R9?=
 =?us-ascii?Q?flleUVSIRXF6OM5/c4YZBRsjRd/dLZv+ZjxqvzD+CxQ2913Rc+BTb7tfHBDd?=
 =?us-ascii?Q?XV2ssRzwjFjB7K/S/RQDUhabjxpHogDwTOP/ZG/2aol5SCYYN5N6W1Jiq8jC?=
 =?us-ascii?Q?yoN41spD3H1CNNYCMW41GEvwbcEvu3YRWkxYn1soCbxaZmZt6LzdclnWDHz0?=
 =?us-ascii?Q?mX5jLpb1BtrCWqs6X9Xt/H8whDSbdVHp7BgdI+pJ0D0thX+K8Aj2La9vQVo2?=
 =?us-ascii?Q?jbscUL9CyRhUUarOh4sNzf1c1avRhJ6l/I/ZswU0OeENIen8cy3y/IT8/SEa?=
 =?us-ascii?Q?cBFE7Sw/wT3m9BNz1TBRnwmGmlFSoshrLaukHdX7Rt+GySLBUgeAr1nOKEQ/?=
 =?us-ascii?Q?BcLmHejT4LBcJg+ApxdLoYOmRYXWKGAJ3+wftyv1/qqUEIqyUoOrADW/Pmtw?=
 =?us-ascii?Q?CL4AnwXbPaCOei1V7Q91Pxl5tT8a3kmKyCPJnk6SVM40vCMcD9VJQ/7KVZow?=
 =?us-ascii?Q?qQX0kUeCmmSS0EQWbzCVubtkXlidtB49ueIoPPcrKuzWIg1oMwwcz0xAxZpI?=
 =?us-ascii?Q?LNyUV81uFMQFyPEJStT7l44w6gjIFcSp3RzfZKCVWQ/2j5x7prh6dd2jF3rY?=
 =?us-ascii?Q?cWuHcVdHLtCE5rsjVjPkPvx/XavIZyGsk8hTs/ZKFzKxu0walxlLc3yjHCMv?=
 =?us-ascii?Q?I3I0jbHAC9nKIbWm1Tu7wHc9fhSy13LjtOJKovoE0zglbvxMQtcUm0lahY3S?=
 =?us-ascii?Q?y4KBUdHnafsm9M5rVqjwbln1XXZBY0/QHKImBVgBSz49CffrFqfxZ4CXBS5Y?=
 =?us-ascii?Q?gSAi0HGaSFOcDs1AsNubBn031pNmSVRxTbTKhqYMI3ZTvdXO2S1Ywg79T0Bt?=
 =?us-ascii?Q?9CKZZdeYTQZq12Oo9j3dNx3QzLNLM6TSP/nnbjm5hIMn4hE/K2fjdbNfEbo7?=
 =?us-ascii?Q?XmpjMc0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PR01MB6888.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1032899013)(10070799003)(69100299015)(366016)(1800799024)(52116014)(586017)(376014)(8096899003)(13003099007)(4076899003)(2066899003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XWHYMhVCUFP7iyOEZjf/5OTNtycjJq38T5Rd60vWxe121DhFgaLGkmbVwpzQ?=
 =?us-ascii?Q?rbKlzvFvWlqFzpiChvdWJU8Vl8zkz4moTdvVpGS+AvNAqd+JqsKP5/Rd8pad?=
 =?us-ascii?Q?OgyNOvyIWA3RSkYP27E/n8ZQ7oVHHppC9RO0LYcFDJZsfNI+SF5OStrE2Asa?=
 =?us-ascii?Q?sws39yp4njFc3nMkt48uEP7yzN4XiSk+ddV/+0xLx36kOeLYX+Dlipu4QO+x?=
 =?us-ascii?Q?luwoB/sU+mGJp1/26oEJae3jhm9sQoQrXkWp8ZdB/ViG98kHEb97/3aF0zjq?=
 =?us-ascii?Q?Y7Vr2v2/bMtRO6pXlnvXLvDWfAK5NReXWbNsErjuPJdMN451ouqxOrzgL7nu?=
 =?us-ascii?Q?6eTm+LZPLswVfyx92yi8DOQs25HuJ8G6XxQBMPuIzzYmQHf5JJ7DfhTaovYl?=
 =?us-ascii?Q?Kj8HfYevCyQqU+eF1elOJMP/WkAHob9UGlEVsSXCd+sOsEN52c1w1BSvPJY8?=
 =?us-ascii?Q?K7zQLFMw4P4E7l0Fq+F/fbXRh/0TY76ObjhWVF3Sp2S0N/Y6pOLsP6A4Yuy7?=
 =?us-ascii?Q?Tmu/tp3ERZXzs974pHIrio2TrnW3XaVhuCHwmeOUchQbFIv1/zglCKfGEjv4?=
 =?us-ascii?Q?FecWNwZgqKnxjajKP8qr0V4uhbTNvrOJ4LKQypT/hlESD+Fx355wZxtZpoGa?=
 =?us-ascii?Q?MbzccKVOOw8IpfYRak7pmk1YDzJQemFYbmAh7y08W9AcHUQD0UA15eu1lsII?=
 =?us-ascii?Q?3lPVvgVNOQP9RE5Sx7WVFEEOQ5+PU6UApfyjSiVmNwIVZuo2QbnyslAqaxYP?=
 =?us-ascii?Q?yMzdENUkozDfSZmbtv7QB1/0fa8PzA5QxRTTBh4hcBGcvcbUFfxH+69GBI5s?=
 =?us-ascii?Q?jsR+av5r+Ecv3YCMoHQVa3XNqSBngb35Ib2JLBVklwyPtOyhinTNM14yX1Tq?=
 =?us-ascii?Q?NwAH9xfLOcp6IC9aTtSukqeSkylgjm1Ncu/Or7rMUBss6I437NrmETuLMFYz?=
 =?us-ascii?Q?sA7L/ZPxGNpeYi7Pb83lsc1R0JbGmQ5sH8kNfztxvzppfyyCsj79JzaqUHGb?=
 =?us-ascii?Q?Doi9l+ysS3b5SESi6MbMaVF/Bv4TcyldwdMt1uV48KFQPkc296Z2fORaZ9Zy?=
 =?us-ascii?Q?Zz0k/JQRKAAJohFzvMY/i1zZWTxmNG5T1tQdFJwxmWfaIbKECqEmnn3PAaH+?=
 =?us-ascii?Q?9dlUkh7OV27Evn5BgOobXCX/ovbrWRge5Uc0kJZ9f1UGnPmXxZuJG8TZXfw5?=
 =?us-ascii?Q?HQRUTj6tk+LBifmMGzAY1ItZivsFY97NN0RXL8j2OYfgRLLGNe9qelIH1ima?=
 =?us-ascii?Q?TSPsj3y1Iza7sZfQQMCP0O2Vm9Q46KX/BTWGhuniee985IMlKpakyUHuJ0Yv?=
 =?us-ascii?Q?3e7U5Pe7tnQNnXqA2slRdPoxJDBTshWnwgsHavc48WJLWtu/2aHP5FKIe5Vp?=
 =?us-ascii?Q?8czLHJ0XvqB6TNXCHQbKU3nFJXj5jaKY/l/kxY/dOXaBL0i+8YvUhfNBg0ag?=
 =?us-ascii?Q?x1BmfwIx6Y5fzFzYvxD7s8jXGv6K3qELEdiwgzbJjLIZuqsT2Cvymap6nqQg?=
 =?us-ascii?Q?Vg+iO/n5lDJULr/TUYmz7Hcra4+jVlSB60j5Z9blTRKdejCiDnb8BKhrfRIt?=
 =?us-ascii?Q?hJxwti4jtSot/Qx144l0K8meseun3f8WxLiVuqbryeIgAjgkFDBbij1Qn9u4?=
 =?us-ascii?Q?mpwzQitjAM+xk3qFOihRKcRp0OWgUstrIgIi2o79Hi0WTgXzoR+14DU51bD8?=
 =?us-ascii?Q?lOo5AVA8FkcR12032z+BkBYbX7s=3D?=
X-OriginatorOrg: aquatechflow.cloud
X-MS-Exchange-CrossTenant-Network-Message-Id: f0d269c9-f1de-4e95-96a9-08dd99599204
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB6888.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 17:53:33.8223
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5df15d51-1012-494f-a18f-877c32178e1a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mnH4JDd6n/Mczp1wCYTYvDtzk1DhuSEErQj1kOjB83umiePCiw4LiFemBeFn9XWVt2ZI1ZEqAiiKjJQ8T1/Ypez0qyTDxhxzdRF2rlWQSixuKmObci9r0leMsObDcmDd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PR01MB6886

--===============8841433650373006813==
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html lang="en"><head>
<meta http-equiv="Content-Type" content="text/html; charset=us-ascii">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hospitality Industry Technology Exposition and Conference 2025</title>
    <style>
      body {
        font-family: "Gill Sans", "Gill Sans MT", Calibri, "Trebuchet MS",
          sans-serif;
        color: rgb(2, 50, 104);
        word-spacing: 4px;
        font-weight: lighter;
      }
      span {
        font-weight: bold;
      }
    </style>
  </head>
  <body>
    <p>Greetings Exhibitor,</p>
    <p>
      Following up to confirm your interest in the registrant list for
      <span>Hospitality Industry Technology Exposition and Conference 2025</span> in <span>Indiana Convention Center, Indianapolis, USA</span> on
      <span>16 - 19 Jun 2025
</span>.
    </p>
    <p>
      With <span>12,000</span> contacts, this list contains
      key details, such as names, titles, and emails...
    </p>
  <div id="DAB4FAD8-2DD7-40BB-A1B8-4E2AA1F9FDF2"><br><table style="border-top: 1px solid #D3D4DE;"><tr><td style="width: 55px; padding-top: 13px;"><a href="https://www.avast.com/sig-email?utm_medium=email&amp;utm_source=link&amp;utm_campaign=sig-email&amp;utm_content=emailclient" target="_blank"><img src="https://s-install.avcdn.net/ipm/preview/icons/icon-envelope-tick-round-orange-animated-no-repeat-v1.gif" alt="" width="46" height="29" style="width: 46px; height: 29px;"></a></td><td style="width: 470px; padding-top: 12px; color: #41424e; font-size: 13px; font-family: Arial, Helvetica, sans-serif; line-height: 18px;">Virus-free.<a href="https://www.avast.com/sig-email?utm_medium=email&amp;utm_source=link&amp;utm_campaign=sig-email&amp;utm_content=emailclient" target="_blank" style="color: #4453ea;">www.avast.com</a></td></tr></table><a href="#DAB4FAD8-2DD7-40BB-A1B8-4E2AA1F9FDF2" width="1" height="1"> </a></div></body>
</html><br><span style="font-family: Calibri; font-size: 12pt; color: darkblue; font-weight: bold;">Thanks &amp; Regards </span><br><span style="font-family: Calibri; font-size: 12pt; color: darkblue; font-weight: bold;">karlly</span>
--===============8841433650373006813==--
