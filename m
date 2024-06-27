Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F6C17F3
	for <tools@linux.kernel.org>; Thu, 27 Jun 2024 02:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719454993; cv=none; b=CDZZIOViVpDWH/gBpSe9OVraI+Rd1ziDeYDjn/3+rxtpB1AoU+WCGQj5tz49nO/fkNAq3t0rgVl7UjcWYufEootGFJrUR7yemB3XlyjycqcatUQZyCGlsIih2WpAzn48AO9ehBIRaW8mhKmVXeN362UyeHlAU10mmR4A5r/wAqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719454993; c=relaxed/simple;
	bh=YMN5teyI+gmK82lgMuQP+F2PJsQfBOYd26SmKSfItMs=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=qVvHpFMjIZvWbi64quVkCbMYTl59TUT1XHHNCJZvfmVsB/vHzNV7EAHc4DFHcZ5KjEkobTY2ph2JrOWdOH3GaFYCONZr3SSaepc7jR7dtkSd2Q7BVdVrKW8G/oUBhOx28A5KjzLTMW9OEaBh7LLNWpyHQzaER058EtCPVWGkB10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VoVzaxPE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VoVzaxPE"
Received: by smtp.kernel.org (Postfix)
	id 15B1FC32782; Thu, 27 Jun 2024 02:23:13 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A3301C116B1
	for <tools@kernel.org>; Thu, 27 Jun 2024 02:23:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A3301C116B1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45QLWwxi016787
	for <tools@kernel.org>; Thu, 27 Jun 2024 02:23:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6A+/QejXlh3oIvDU8gm1gf
	pWtIEr0C6DqbP6fe882bk=; b=VoVzaxPECG2KrhnRTXi3wiDnoZz44tuDcu0W5S
	TjtFmX3ePgrue3m23tMqNXCQjEEn6aY0QSVzhXB6wk0NdXcAqAN3I4r6Ql5m6kXt
	t32Vt+y+DFRVJtAlKXq7ouBY2DS8JkT8qehmuQqn45ndd44eWkMgCQamL2heJYuk
	vCV+qhYz9y2phLH7rMB9w8JVNgIPu+eSNXfb2reyq5YGpFu5F3rY5oJjbNPPCBXv
	lEV3b+7G7d3NZ99eI8OI5yU7SfkEnEVRelETQQSgD3VTlKplV9kqHRobxG/UieEy
	ssqCDzZ+S2oh7WuBwfiGJnUIjvrfyUj5/60Ke5x8LpwoRq7A==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywp6yu3q7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <tools@kernel.org>; Thu, 27 Jun 2024 02:23:04 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45R2N2nS014700
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <tools@kernel.org>; Thu, 27 Jun 2024 02:23:02 GMT
Received: from [10.48.244.230] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 26 Jun
 2024 19:23:02 -0700
Message-ID: <ca8f8cab-e62c-4784-bdf8-9c92b2c0202c@quicinc.com>
Date: Wed, 26 Jun 2024 19:23:01 -0700
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
Subject: b4 prep --cleanup failure with cover-strategy: branch-description
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ja5QwtK-co5sjcxzZeJQRvrd76dxPMms
X-Proofpoint-ORIG-GUID: ja5QwtK-co5sjcxzZeJQRvrd76dxPMms
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-26_17,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=796 bulkscore=0
 phishscore=0 adultscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406270016

Here is an edited capture of one failed cleanup attempt

% git checkout b4/md-drivers-devfreq
Switched to branch 'b4/md-drivers-devfreq'
% b4 prep --show-info
branch: b4/md-drivers-devfreq
cover-subject: md-drivers-devfreq
base-branch: linux-master
base-commit: a693b9c95abd4947c2d06e05733de5d470ab6586
start-commit: a693b9c95abd4947c2d06e05733de5d470ab6586
end-commit: ec30a61ebb797c2b9763c495f7ddf1beac1ab0d6
series-range:
a693b9c95abd4947c2d06e05733de5d470ab6586..ec30a61ebb797c2b9763c495f7ddf1beac1ab0d6
change-id: 20240605-md-drivers-devfreq-42b19b2594a1
revision: 2
cover-strategy: branch-description
needs-editing: True
needs-recipients: False
has-prerequisites: False
needs-auto-to-cc: True
needs-checking: True
needs-checking-deps: False
preflight-checks-failing: True
commit-ec30a61ebb79: PM/devfreq: governor: add missing MODULE_DESCRIPTION() macros
series-v1: a693b9c95abd..c24a39e01a87
20240605-md-drivers-devfreq-v1-1-d01ae91b907e@quicinc.com
% git checkout linux-master
Switched to branch 'linux-master'
% b4 prep --cleanup b4/md-drivers-devfreq
Traceback (most recent call last):
  File "/usr2/jjohnson/.local/bin/b4", line 8, in <module>
    sys.exit(cmd())
  File "/usr2/jjohnson/.local/lib/python3.8/site-packages/b4/command.py", line
417, in cmd
    cmdargs.func(cmdargs)
  File "/usr2/jjohnson/.local/lib/python3.8/site-packages/b4/command.py", line
83, in cmd_prep
    b4.ez.cmd_prep(cmdargs)
  File "/usr2/jjohnson/.local/lib/python3.8/site-packages/b4/ez.py", line
2766, in cmd_prep
    return cleanup(cmdargs.cleanup)
  File "/usr2/jjohnson/.local/lib/python3.8/site-packages/b4/ez.py", line
2332, in cleanup
    ts = tracking['series']
KeyError: 'series'
% b4 --version
0.14.0
