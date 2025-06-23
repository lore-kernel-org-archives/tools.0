Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A5024678E
	for <tools@linux.kernel.org>; Mon, 23 Jun 2025 13:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750685051; cv=none; b=iA6B3U9Y7+GgMCWWP8f5qsy1Jt8w8soq6GdO2K8gcciWmZo/NgHrZNeEtHqzUffc0LkC2EBd/1ad+2JtZXJfNrUrnv2RdET22YuYEtsLlCsgc4Zulc8wjRcYkrFd3Y+FClTuMBNy4JhqO83K0xjvOgg9sX8Ok+8x1Qq1piuRROY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750685051; c=relaxed/simple;
	bh=xPdcg7I1fAQzDUxwy0XRv/8ZfJcdSQVf0uAJYftSU4M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=YrVJNHeTHnFwkytWkGgWelZsUCL0KEYFQB25ifkHgTXmlhi46+kdzw2m+uNbreaAAnpb/Eseb/KM9I6fvbvn7uMX2hHUtx1pCNQROp4D/qkASMm1BmcHyy2cf6coDDjlnjBiENIx4LZNkp+7q9WZldJQdiXBD4HeODREs0qxyQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=b6kekkI1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="b6kekkI1"
Received: by smtp.kernel.org (Postfix)
	id 3A265C4CEF1; Mon, 23 Jun 2025 13:24:11 +0000 (UTC)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 65CE1C4CEF0
	for <tools@kernel.org>; Mon, 23 Jun 2025 13:24:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 65CE1C4CEF0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N9VRoj029832;
	Mon, 23 Jun 2025 13:24:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=20i+IOLYpCz/7kllhQfLIRkqBC1XbU
	3l/lRbltJ7cGM=; b=b6kekkI1BlsSy9IVP9trizfYNRTG90r+4D7i21MrNKauPm
	X95Ea5eTyUD+GvyvEwoOaYcc3CrQ+VCrfRKU6Dm1OANAR6xu8uhgUMD52dLdKidl
	OI2oqZqXVUCpA4633kS+Vo6HDofFWzPxDderMKOVc4UZQLSwIWUjOk5G8ciRG6t5
	eWvadzZKPQ9RhbvtnDsF7GzWRKhd3ZTHa8cKHPFMShtiXFKdvzJjTOQcVtHABqan
	JbRU/t+LOjfSPpFAd8kYq4ew4Qj1KRnEPO/IDXQpZxRqieMwB9VkxqVgZOANKjti
	9AqEN2Gw6RDFsjdV/Yx2cb8pw2NEUgabNVwiR2XQ==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47dj5tjat1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Jun 2025 13:24:08 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55NDI6rs015028;
	Mon, 23 Jun 2025 13:24:08 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 47e72tf1qr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Jun 2025 13:24:08 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55NDO2kh12124692
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 23 Jun 2025 13:24:02 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3204858056;
	Mon, 23 Jun 2025 13:24:07 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 148205805A;
	Mon, 23 Jun 2025 13:24:07 +0000 (GMT)
Received: from d.ibm.com (unknown [9.61.54.85])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 23 Jun 2025 13:24:07 +0000 (GMT)
From: Dave Marquardt <davemarq@linux.ibm.com>
To: Lucas da Vila <dev@ldv.ar>
Cc: tools@kernel.org, konstantin@linuxfoundation.org
Subject: Re: [PATCH b4] docs: Corrects minimal typo
In-Reply-To: <20250621160732.1066586-1-dev@ldv.ar> (Lucas da Vila's message of
	"Sat, 21 Jun 2025 13:07:32 -0300")
References: <20250621160732.1066586-1-dev@ldv.ar>
Date: Mon, 23 Jun 2025 08:24:06 -0500
Message-ID: <87v7omioax.fsf@linux.ibm.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: zOs98_wSJuDVVeGos_ytlwEwy5q7860r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA4MCBTYWx0ZWRfX5FKcriWudj95 ZRev35EykKnvvV8D/vYxUGS2OnJ5x1jqFJg3bVht9IjiikljcCE95sNbf6bzI0h8Xs1+6VFcaQt CHsuIc6NbF8xMy1fn/osuh5bE7OGTnj73QOp4HUkgnUhs3Ueq5VxjXdnxgFuLd/4pOUHJp5z5KQ
 Tp7NU5Bc/H5x5L26BXFcODbot2KXmxHTcME1jjt5UZZLt+uq7f0uFXlIlV+UpTM6va5/smF5fWs 2HeELY3jR9oWWajVebfI8RXgOrTFqDtKKJa+qbMHk0agyXA9KfZDrUYn/VNxrorwSzMvWbEbpIG 9TDVA4oMxe72Z+2B7AnxJqW00rLnMnC9QETrK/DNl21QCQjHTGM/dHX5xfMP/AJhIB/Ra59EKMq
 /CTo7EzIBrtHWupwEl87ruPYlfGd+BwbSLRhvKHJxyoKoNrgJwemdudmWqMrPtSTLRBQK8hF
X-Authority-Analysis: v=2.4 cv=MshS63ae c=1 sm=1 tr=0 ts=68595578 cx=c_pps a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17 a=6IFa9wvqVegA:10 a=VnNF1IyMAAAA:8 a=mSesI42UwC0EMN6MsM0A:9
X-Proofpoint-GUID: zOs98_wSJuDVVeGos_ytlwEwy5q7860r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_03,2025-06-23_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 mlxlogscore=519 impostorscore=0
 clxscore=1011 phishscore=0 malwarescore=0 suspectscore=0 adultscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506230080

Lucas da Vila <dev@ldv.ar> writes:

> Signed-off-by: Lucas da Vila <dev@ldv.ar>
> ---
>  docs/maintainer/am-shazam.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/docs/maintainer/am-shazam.rst b/docs/maintainer/am-shazam.rst
> index c243027a7975..b6917064a485 100644
> --- a/docs/maintainer/am-shazam.rst
> +++ b/docs/maintainer/am-shazam.rst
> @@ -43,7 +43,7 @@ The two commands are similar -- the main distinction is that ``b4 am``
>  prepares the patch series so you can ``git am`` the resulting mbox file,
>  but it doesn't make any actual modifications to your current branch.
>  
> -The ``b4 shazam`` command dos the same as ``b4 am`` *and* actually
> +The ``b4 shazam`` command does the same as ``b4 am`` *and* actually
>  applies the patch series to the current branch (if it's possible to do
>  so cleanly).

Reviewed-by: Dave Marquardt <davemarq@linux.ibm.com>
