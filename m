Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEFA223BCF2
	for <tools@linux.kernel.org>; Tue, 29 Apr 2025 16:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745945090; cv=none; b=Az7VBzgjXu8OcrCvCjfQwrRXEECV9CLo/+Apv/zGHPhNZtHNTemql6AupXUbxqrYkayWublSupxsgM04ijDOxXBRvGGZxxoo8gq9LbTNffoWgi8TWeou6/z8tgQeaWpbmnP7PH4YtnCvYJ12n/lJu6VHaCuG/9YfI5jIoM8Nbkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745945090; c=relaxed/simple;
	bh=0R4JpV0EzYN1dNArahuwgoQNHxctVt+uDjd385Mumbo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=QGwQUUf+RqrQB/gBO3H0TsiaawBvW/sGyagqW+3PZAUgbrpuBE0BE+aWcard8M1Q6Y24h3gTdT1PhlW3dW4/++axxLFk+xCsKCMvRbeRu1cc4+4l4sn6n+8PxjEa5ycadbFOXBxUAI/LEUjJM4O8XGzbeYvHbGlNN+jSvs5lVow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SNN/T6V5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SNN/T6V5"
Received: by smtp.kernel.org (Postfix)
	id 694C6C4CEE9; Tue, 29 Apr 2025 16:44:50 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6D526C4CEE3
	for <tools@kernel.org>; Tue, 29 Apr 2025 16:44:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6D526C4CEE3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TAKutA031232;
	Tue, 29 Apr 2025 16:44:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tg15cBzdaNqv4yQJjBhw7JcQQas9Za7YFgekd9JqyKs=; b=SNN/T6V5nntbqTBJ
	wQuX7BXVACZBeZgMJreO1vJB59iXYFQMGa5Gpd7x3aJL+5mXoz3+7Zhlayt47Oj/
	06CIkX8+AnXbcQXB7YTg8gefaf0yRZjc73BVOlMwg9xlO/j8tnkJu5wBEUxcdOAn
	xJrx6I3rmjQci+OZbu+SROGdGDOBAgjBHAtZ9gBz7F2NOit12I5pWM1pw2SloPvj
	S3L52y2VgFB2am3zkv7YtKXHGw4gMyD3UorEmfZ2WS0i0KMQDZbCyQZvBv8Z97yB
	yb9rcGqT3gpEP9LB0Txpkkq+T5KAh5zHgi7/KWNsZqPyGPdicChrESldfkYjIR0s
	y62oZA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468pevmb47-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 16:44:48 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53TGilEd017891
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 16:44:47 GMT
Received: from [10.111.183.9] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 29 Apr
 2025 09:44:47 -0700
Message-ID: <5634f16c-6870-449b-a051-9f9c4cff56f0@quicinc.com>
Date: Tue, 29 Apr 2025 09:44:46 -0700
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Is there an incantation of b4 to pick up a single patch +
 attestations
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
CC: <tools@kernel.org>
References: <c13db4aa-9130-4382-85c8-008efda3bd77@quicinc.com>
 <20250429-opalescent-augmented-hyena-df78f0@lemur>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20250429-opalescent-augmented-hyena-df78f0@lemur>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: KyKaozRAEYWemJX4fTJK3wXbQ4iV_2jR
X-Authority-Analysis: v=2.4 cv=aeBhnQot c=1 sm=1 tr=0 ts=68110200 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=x_-F_r_KSF7iF5XX:21 a=3H110R4YSZwA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=xA1uhl1qXQiQALtHiuMA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: KyKaozRAEYWemJX4fTJK3wXbQ4iV_2jR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDEyMyBTYWx0ZWRfX9j8BSFaEvEar jU4sGV8YU8dxM+lUQoQzxlA2pUbPwb3aOdNjf6en7ze+1BZ+/ch883swt8a21tYzEv5fFj+WMC5 rrsICMgjxYyt/ExHt1+AgQV5NOH9TrZK1RK7Jd8fKFgaELDMjLUMHGBzMY09NYvBEOtIk9dBX9T
 KyscL47HiboG6H2wFoU/yx9rCnqsvJ6chi8qoFD68te1/qK+kp44sC4icNUd4bBs9cao5mXA0hH 25vhQUnqbCybXthgevfAIYslJAtbVQI7YDKbxQ20wHmyt9h86bix4fjvibF+tWwrbB8CD29x+/M un+s9giGGJq8jrbPPg1X5F9I61cx0deR6Cbn36LTie5LaQ1sayIaAbtf9eFjc14hqxa2lqorTHx
 whbDm4H5sLI3UYA4lK+v9OgJIPLb7dgg/NeqjlQCoG5Efb7UzQnJtml1C9LWblimgXwlPHVz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1011
 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 mlxlogscore=528 phishscore=0 suspectscore=0 lowpriorityscore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290123

On 4/29/2025 8:54 AM, Konstantin Ryabitsev wrote:
> On Tue, Apr 29, 2025 at 08:45:02AM -0700, Jeff Johnson wrote:
>> I have two separate patchsets where I'm trying to grab a single patch.
>> The patches I'm trying to grab are:
>> 20250327051320.3253783-5-quic_ramess@quicinc.com
>> 20250408184501.3715887-4-aloka.dixit@oss.qualcomm.com
>>
>> I'm using:
>> b4 am --single-message --add-my-sob --add-link --check --prep-3way --no-cover $message
>>
>> For both of these this is retrieving the message but not the separate
>> Reviewed-by attestations.
>>
>> Is there an incantation that does both?
> 
> Looks to me like you're trying to cherry-pick? Don't use --single-message, but
> pass -P4 to the first series and -P3 to the second.

Thanks, that's exactly what I needed!
