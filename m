Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1275722A4F1
	for <tools@linux.kernel.org>; Tue, 29 Apr 2025 15:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745941507; cv=none; b=eDslflJx9ZblIq7NhYmm4kVI1235enbpRT3vasV6Y2Z6CF0zwy/eGSbTh6ETdYhK++9jed/LYK4MtX1Cx58QPkZycGe+eJcr9PkLrizdau9GJ4l6yDvr3shjoqUmKKeyelWRwO1QM+IMAkbsvGL6PH0WHKBcO9ocSwV6uZ8oaOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745941507; c=relaxed/simple;
	bh=2daqoZgZpIC0cGt2CK8myri+lwxYOg5cTq/oG/C+VTQ=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:Content-Type; b=JKGtpxT6ITl5f5m5xOqWsdX2PiAn+NoxQFM15RWskXLRX4S93nZBgW7Di5M8D90b+ELV4opNz/Vcotf0+nfdPhlJ3XKMoAmGbJ9b5/kYOJsdMQqgZruHUz+KtoAZW77/vQ8yLXdvk/S99xCFB0QUo5zo02lezlukI5uRIeClAwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=eLp9LR8M; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="eLp9LR8M"
Received: by smtp.kernel.org (Postfix)
	id A08D7C4CEEE; Tue, 29 Apr 2025 15:45:06 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9F395C4CEE3
	for <tools@kernel.org>; Tue, 29 Apr 2025 15:45:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9F395C4CEE3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TA2lXM030686
	for <tools@kernel.org>; Tue, 29 Apr 2025 15:45:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2daqoZgZpIC0cGt2CK8myr
	i+lwxYOg5cTq/oG/C+VTQ=; b=eLp9LR8MO5hYONH1DJ44TsFUbM1MEnZpWL7/sB
	9JFfBgb9B1BDb8/R4ZEgM+uQrpGcWGOq2v1vKCK3AykOOkLr4kSrh6dKYzZcT1uK
	DMwHn1bsbRrg3EzTwgL+HCUWLDKu7MbNf3BaxtDPJijZo9yae0VDuPpXMoCl3wm+
	gWBiLNwU6ZGb36nC/lUIwbzpkhLDYoVeORMnhjmyFHhJ1uVR16NjwLINjHoK7Dgf
	NvNd6yXmTg8FYHb5aS0qcvZYaqlg75JUePWzI4nx68Lmiavva097ukcYaj7AYQgK
	8XPyU42nXlTAE3jimp8fDCjJtppzEoUp+zRQDTGghOSubVOw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468pevm64b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <tools@kernel.org>; Tue, 29 Apr 2025 15:45:04 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53TFj3PB014023
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <tools@kernel.org>; Tue, 29 Apr 2025 15:45:03 GMT
Received: from [10.111.183.9] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 29 Apr
 2025 08:45:03 -0700
Message-ID: <c13db4aa-9130-4382-85c8-008efda3bd77@quicinc.com>
Date: Tue, 29 Apr 2025 08:45:02 -0700
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Jeff Johnson <quic_jjohnson@quicinc.com>
To: <tools@kernel.org>
Subject: Is there an incantation of b4 to pick up a single patch +
 attestations
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Xpd3wAjuCGhQLUos2FJcy_zODTE71irc
X-Authority-Analysis: v=2.4 cv=aeBhnQot c=1 sm=1 tr=0 ts=6810f400 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=dKQya-3kzhCsbe-w:21 a=3H110R4YSZwA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=-HLg3-jI5ykUx8sExn4A:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Xpd3wAjuCGhQLUos2FJcy_zODTE71irc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDExNyBTYWx0ZWRfX9KDjs9RjsrTu nKU8TOOtfl9aJe26V4mAE7hin8bQLnrMbEw5DcC1eLVGpMgb8pGkyspqEYMHwjsssZeOI9JFS4B Voc1a/thiBJKOgnXtnernIx39ywW2pZKPMmYsOoEx79kNzOeVVwNI4aqP+3UkPJ/OYinXlxfaP0
 EMuPDy2QLQ0XM5P5thLjudW9q3iwMS5pAtZT7XGPDx4nLoQI43h3hGY6NRKiU2fmx84OyCrpJG2 VyL6K1YQDM1KjsnRqKsWIX4vGElDN9DCfW9jIYslBrx47B5amVR2H34OtOEmF71itTKoMbGLz4+ Z+snnQy5Ce/SSTcA6B7a5753wN5wZYsOwdudeBPc7/tfslnGOItNlz4GRj5+rykJqjuKAHoUHVU
 TVTruA4LfC+L3eFm3V5ury7hGqvxwE1M11EOn1Iewn3x2PdZQlCmgI8kazaSMrRzlVyeTK3E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1011
 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 mlxlogscore=349 phishscore=0 suspectscore=0 lowpriorityscore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290117

I have two separate patchsets where I'm trying to grab a single patch.
The patches I'm trying to grab are:
20250327051320.3253783-5-quic_ramess@quicinc.com
20250408184501.3715887-4-aloka.dixit@oss.qualcomm.com

I'm using:
b4 am --single-message --add-my-sob --add-link --check --prep-3way --no-cover $message

For both of these this is retrieving the message but not the separate
Reviewed-by attestations.

Is there an incantation that does both?
