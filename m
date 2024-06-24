Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10E6C45C1C
	for <tools@linux.kernel.org>; Mon, 24 Jun 2024 22:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719268929; cv=none; b=b4lGUt47Wahu1/SSXd0FVFLg9GVOaMEegQbqXWUywLYEgTG7Q77xREVsaM3Rbxs7wqoo7bq2Bz+e0hxo/vFh2F7E6T5CzC7TGUatu+JEHHTa2C/yLDE4xgek4pQr+fCYsCtsim9cK4kIBbyK6cPTbafz0L5r1nwxwlFrEOjjT+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719268929; c=relaxed/simple;
	bh=fMtkDqXbJUX8HLd0YBMCwcykDwExd8jiG21bbE5ICC0=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=kFHL+t1rN8Tp8DMJZsutQIzcm4AwHBMF1TwGDRN54rqdSvhR+zcxixy7pG68OBhgNwpGt0IsJwRQbygB13pykydaQxbc2Mw1H3q9/NmLQd9Bm2krwlH2tgsDR72p5lACRFI61v36q1ig2sBtkLqF154RPTh1POuCOOWVXXmmBLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RN3AHVh+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RN3AHVh+"
Received: by smtp.kernel.org (Postfix)
	id 75F67C32781; Mon, 24 Jun 2024 22:42:08 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9124DC2BBFC
	for <tools@kernel.org>; Mon, 24 Jun 2024 22:42:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9124DC2BBFC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45OHuIea007935
	for <tools@kernel.org>; Mon, 24 Jun 2024 22:42:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=fMtkDqXbJUX8HLd0YBMCwc
	ykDwExd8jiG21bbE5ICC0=; b=RN3AHVh+lCI0eT/3tvZVPCJqVPTqiLRyRsGykI
	+8B4iOblTOAXwxaR/1bMkVPz4Ap4zfLEOwF4GTu5w6gHSbzplfNDEUv81OmzVXM3
	p14CDa980iCmH41q9jztfFRdaML7sJRt4evdHkH04oDTWzUMgNJfxdFht5jlQ6BR
	yTbObv9vTF078oS7t38V+v1osfi+5dqyrOoq3YsfNSvldXRGarOeFu9rc38GRFf0
	1CETnKr6QpqcSQ7ee43h1Gk5DQ6ysdxzcNRnsYbQSkoVPXcTsfCpFf2GtI4DsVlC
	bFilb/NZDaN8bflg3xWG1Vbp7TGXCajtCR92x4zV3hk7pZnA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywnjrw2hs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <tools@kernel.org>; Mon, 24 Jun 2024 22:42:06 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45OMg3GM011281
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <tools@kernel.org>; Mon, 24 Jun 2024 22:42:03 GMT
Received: from [10.48.244.142] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 24 Jun
 2024 15:42:03 -0700
Message-ID: <fd4e083f-fd5b-490c-b0c6-4cae0acc6214@quicinc.com>
Date: Mon, 24 Jun 2024 15:42:02 -0700
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: <tools@kernel.org>
Content-Language: en-US
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Subject: b4 prep confused by rebase from linus/master to linux-next/master?
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: YjPzkH3rgyrBFiwk_yWTTKbv9XKYvu7i
X-Proofpoint-ORIG-GUID: YjPzkH3rgyrBFiwk_yWTTKbv9XKYvu7i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-24_19,2024-06-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1011 mlxscore=0 suspectscore=0 adultscore=0 mlxlogscore=437
 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406240182

I have a b4-managed branch that was originally based upon linus/master.
However that patch had a conflict with linux-next/master, so I rebased my b4
branch to linux-next/master and resolved the conflicts. But that seems to have
confused b4 since I don't get the expected results from:
[jjohnson:development 8934] b4 prep --check
[jjohnson:development 8935] b4 prep -c
Will collect To: addresses using get_maintainer.pl
Will collect Cc: addresses using get_maintainer.pl
[jjohnson:development 8936] b4 send --no-sign --reflect
[jjohnson:development 8937] b4 --version
0.14.0

b4 seems to be acting like I don't have a patch to process.

Is there an easy way to "un-confuse" b4?

/jeff
