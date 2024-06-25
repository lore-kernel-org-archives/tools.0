Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB83135A69
	for <tools@linux.kernel.org>; Tue, 25 Jun 2024 17:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719336950; cv=none; b=Q3VDE0KdkGlEQeJPGhxZFA3bX4J/hn0Ak5qYxshgBPDdxmzgheJHW3xfVa3z5otvRHDZ4koCRQv94g3lXHr9w+0XmVQa+hJQJXy4mCvJQSe2JvHakhAG8DCluNkCFoIzmePBCeliPGq/TRae1nzV9zsR7cBJS+1ND5bNlM3BO8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719336950; c=relaxed/simple;
	bh=46b9SEHETyBFfaqaIwJYPG7dxU7HFRXqvIKua1PK8ps=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=kgkhBgg08BBgTSQ2EwJvwth4mcZPXkDqcNucwwwq239ZxH1RdKILJiz0WK/K/cjlHAGXrIozPL0HHLI1cVejUI7LFhqJhzCOyVLJ6rT02BwZLTCpBY1V/ImJk0qqjNnyfry5zlFCQiayfSdqoINpQoTetn7Ppr5ObTwH0wYm5DI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=AulNyz1j; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="AulNyz1j"
Received: by smtp.kernel.org (Postfix)
	id DB672C32782; Tue, 25 Jun 2024 17:35:49 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0FCB7C32781
	for <tools@kernel.org>; Tue, 25 Jun 2024 17:35:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0FCB7C32781
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45PGaA68001878;
	Tue, 25 Jun 2024 17:35:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7p6Rmo1VTxzU5pLq7Zw4RALjyZVSndjWF7avxZ4D2hw=; b=AulNyz1jiQ2LLspG
	kYt/rM/LJnei+lxaYgxuN8fAiMteB92eN0R8RcxpsrBer3LsDgLN8neS7teokPIc
	q0KzSsJFBU92BU39UcO4JkmjDwoUFjGnwz3wn53WpfFIJ8eBX3IxfvfeyNws0wzU
	cdp05tjkI2C5idkq67sBaY+wDrhWTmFvlA6u4JckTlTH/SvzFnEghgQ6Sn8e3mFB
	jRr5oYj1yTH38reGJQHXrF+TYqwLSoz2TPBOc42wLdwyX6XxXSFJHGQLMBdxaQ9z
	Gx9n20L64MPLJgqgD0cPys00At5rC9jS6Z6I1mAzCSkyLITlho1om0vjCC5uTKME
	Dvdhgw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywmaeynk4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jun 2024 17:35:48 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45PHZlY8017673
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jun 2024 17:35:47 GMT
Received: from [10.48.244.230] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 25 Jun
 2024 10:35:47 -0700
Message-ID: <9cff56e8-c529-4acf-a66f-82e0a3c533d8@quicinc.com>
Date: Tue, 25 Jun 2024 10:35:46 -0700
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
 <b4bdcc6e-95fe-41ae-bedc-9fc4ad385570@quicinc.com>
 <20240625-voracious-flashy-galago-7632ec@lemur>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240625-voracious-flashy-galago-7632ec@lemur>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: FAR97RfM3jRzkTJyGMY7xUwZthjrF-OX
X-Proofpoint-GUID: FAR97RfM3jRzkTJyGMY7xUwZthjrF-OX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-25_12,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 malwarescore=0
 clxscore=1015 mlxscore=0 lowpriorityscore=0 priorityscore=1501
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2406140001 definitions=main-2406250127

On 6/25/2024 10:24 AM, Konstantin Ryabitsev wrote:
> On Tue, Jun 25, 2024 at 09:05:15AM GMT, Jeff Johnson wrote:
>>> Can you paste "b4 prep --show-info" for that branch?
>>
>> I was already able to fix this by manually changing base-branch in the metadata.
> 
> Okay, I suspected that you have a non-default cover strategy, right?
> 
> -K
Correct. I'm currently using cover-strategy: branch-description
I kept stumbling across issues with the default strategy so I moved to the
branch description strategy.

And it seems that doesn't work well with b4 prep --cleanup either since it
seems to remove the metadata but doesn't actually remove the branch.

With my recent MODULE_DESCRIPTION cleanup I made the realization that having
the metadata in-tree would have been better since I distributed the work
across multiple repos to have per-architecture builds.

So at some point I'll probably go back to the default strategy.

/jeff
