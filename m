Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 793C115382E
	for <tools@linux.kernel.org>; Tue, 25 Jun 2024 16:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719331519; cv=none; b=mmjNbUt1iGON/oa3lqlxarnqiDbzcDrTioaH6P4h85C+qJEj3bxFx1nuV4le391a4a5dzQlWUdyQG4KPvmk1oYlNft2W1Ejl4adlCC/cM53O/uSeLg5wuCMUtirwOcSDtQXFMrRGgZeQT9M255mqfvSJlG3j4LxGn856QL+RBEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719331519; c=relaxed/simple;
	bh=BDBbCqtQHdn5lzsZysgf4teGRpagAMN4zdzP4C0nmDI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=dDGXuY4tfcuzgl1VW9XHPDjc6rbKUWDf+h3IggMXj00DxVFKw8/CAQmgi2tLz8xfbg7nJ7nuUf0OCPYoCR1LydpzwTdCS7NC+nf8dpUXO3g5aobVxf0xUY1Z28VAnWNoCmObWblORnQi2JPHxCQuNwxWaMo/GfcdGScYDl24vU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=C9K1Hi1m; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="C9K1Hi1m"
Received: by smtp.kernel.org (Postfix)
	id 25AC8C32782; Tue, 25 Jun 2024 16:05:19 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1B11AC32781
	for <tools@kernel.org>; Tue, 25 Jun 2024 16:05:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1B11AC32781
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45P8IU9J023780;
	Tue, 25 Jun 2024 16:05:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/VBGe4/WTE1A0uUk7SE3eogx1ajsZGqokvPSjm2BmUQ=; b=C9K1Hi1mODrKZFLG
	UbTHOVeIRd8NIjmDG4EcBMJ279zIvirwCVPTigAFH36Ipn9Ui+ZjVLuSDb19OKyF
	QG8wu5UAEiCJtmxn/EFhX3yNzzlJTS8fhHrq5Ygo2tHaMr3zLoO/A+zZC52SLUf1
	1xLnx+aCVNEHHt/nWANiWSejS8xKDakN0lhN3ljiIj1ciyqtlDJBB/lUlrorgy08
	uGyndI1CUlNh6ntx/srD+F++thEX0Vs6kjJQRw65evqhzPReAQJ+gd8Dl4Fge31k
	o0ASeafMAvvx5SHaygXO8fZrAAl3TvNm0ezKQu3say+uK9Z6Q0/VpgQdndDpmFY3
	4aMzwA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywqshq4g5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jun 2024 16:05:16 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45PG5G9l020961
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jun 2024 16:05:16 GMT
Received: from [10.48.244.230] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 25 Jun
 2024 09:05:15 -0700
Message-ID: <b4bdcc6e-95fe-41ae-bedc-9fc4ad385570@quicinc.com>
Date: Tue, 25 Jun 2024 09:05:15 -0700
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: b4 prep confused by rebase from linus/master to
 linux-next/master?
Content-Language: en-US
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
CC: <tools@kernel.org>
References: <fd4e083f-fd5b-490c-b0c6-4cae0acc6214@quicinc.com>
 <20240625-sepia-tarantula-of-diversity-adee66@lemur>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240625-sepia-tarantula-of-diversity-adee66@lemur>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: m8I18q6bdtOYpgvdnqeS6uxtYErTs59I
X-Proofpoint-GUID: m8I18q6bdtOYpgvdnqeS6uxtYErTs59I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-25_11,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1011
 bulkscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 mlxscore=0 impostorscore=0 mlxlogscore=722 priorityscore=1501 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2406250118

On 6/25/2024 7:20 AM, Konstantin Ryabitsev wrote:
> On Mon, Jun 24, 2024 at 03:42:02PM GMT, Jeff Johnson wrote:
>> I have a b4-managed branch that was originally based upon linus/master.
>> However that patch had a conflict with linux-next/master, so I rebased my b4
>> branch to linux-next/master and resolved the conflicts. But that seems to have
>> confused b4 since I don't get the expected results from:
>> [jjohnson:development 8934] b4 prep --check
>> [jjohnson:development 8935] b4 prep -c
>> Will collect To: addresses using get_maintainer.pl
>> Will collect Cc: addresses using get_maintainer.pl
>> [jjohnson:development 8936] b4 send --no-sign --reflect
>> [jjohnson:development 8937] b4 --version
>> 0.14.0
> 
> Can you paste "b4 prep --show-info" for that branch?
> 
> -K

I was already able to fix this by manually changing base-branch in the metadata.

/jeff
