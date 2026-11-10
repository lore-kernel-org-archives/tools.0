Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794336651;
	b=YrFXMhp8vButFL1oL3G1IupYB3ENQyeCfFIbfMYuTud3UT5chk4BPvojSbLJnJR8/XKe
	 1G2qycxdhnmt6Xou7XaaZnc3HYpi/TW8cycn+78La07DqVkk667GxZzjCUwHf5NPwJCBe
	 XMnqZCCS7QJSm8ZG3WvwonWlW8VWbcOk2mJ7qPQ8qLV2ElMk149d9/FamLCZMl+i3Qv6g
	 Qk89Fo1IKatpAkiavDzHMQkBEDKeePfR6PTT+WN1dDc8OsG94a+FNg+BooUgUXbyXEDa6
	 NDmytc6+zfXiy63I5czsTDoojPxAz9txVlZf6dn3sY+7+lWgDLkmQsmqZEVtAidviIA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794336651;
	h=Received:Delivered-To:Received:DMARC-Filter:Received:DKIM-Signature:
	 Received:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Content-Language:From:To:Subject:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0RA56yDyk2Xs1HCDVUzt3RfZuvqeLITx6R3suZIU7qU=;
	b=3K2NLuhC/Qu7TS/K0KvJ59L4RCw0XDn2IvB3EGNSFBQqdJv0MLynJOf3Q1Jr9ati55He
	 V4iioyZhpyfmKI/IKn3uvNckjK8NOixU7PpLjORaykPboui/AC26tuQG2oYjB+AvvtH6I
	 JuOQ+KGR7+M9tpxgqof/182Ova+l8ZioDzLyGJVWLA+NyiRZJXgFQS4wuWVFNBTsU/dMA
	 02i3GdEip1PmN/hcN2GPL/Kn75AYzA5bDOwif3P1qIZXEV2s0kW1P8tnYaSd0TZ9+RiPP
	 5m6JNqGkkRJvVceYlYGbF3rIku4r8Z4XnUhlOjLfYvgaXQknWgodeF20rBI7UNrp6CQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BliqKdFE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CuOmLeFM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A19260A2600
	for <tools@linux.kernel.org>; Tue, 10 Nov 2026 18:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BliqKdFE;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CuOmLeFM
Received: by smtp.kernel.org (Postfix)
	id 8AB321F008A7; Tue, 10 Nov 2026 18:50:51 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794336651;
	b=MHf07qd39LhETqqssue5e6J6yu93IxO/1oo2/b2MHmnLqR/DbYwz8XOUhN4s+rQATTFe
	 qfHUAX5ydhgWmfUKffNJPYBUXyodCiLnLcIaUPci93hyGOjGGmHnzVFVRQj4ejOa96E17
	 dTnVAIxWy9rtQtswyHPMJjCQtLvgnaDGkV32r4RIN+qEjQ1SbiF1kdeHZuFFsc1dWPv1Y
	 ArhCLksqq8LTBIxjlCANH61umvtHR6i9W/GjBYcCN3TgYMnkWpq3NNKxmQA2erTA9+Rw0
	 6c0Qrnn3qg8HfKSBhvjW2ZzcQJLjywRS9Pa5TTyydI3NwJkJEc+VpWgMqhsn7WvzASQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794336651;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Content-Language:From:To:Subject:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0RA56yDyk2Xs1HCDVUzt3RfZuvqeLITx6R3suZIU7qU=;
	b=T3Da65mWPzyTc0fwLp2nkXDfGYcNV2LucOWBJnHtyfdgvk1oJvlDWoHSgYSM0Gl0eXLR
	 GQXwidse2J5+uQlGIoi1I2rHi0aNSGESfZjHfxp/bYbR+dwMnpwHUz18CEkQYFaODk/Q6
	 9q3mWvQ4DGa+HZtPnT6fzoa15Qc+5sPRJKKNcJUIpZ02V4yl9IgQQRS8a6qgJVUf8Phhy
	 mPI25j8kFS4ZaIuiLrm6TN4YURTXIqL0ssmEpdATVOC5XBKFqtTAO9YlLmujVwIHjw8WI
	 L+3urvMQnWBjoorZDD88iUBKTdYSG1GUEJv3vfOLrDhVuvFqjmLX/yTGM5V85sXDllA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BliqKdFE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CuOmLeFM;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D5D7A1F008A1
	for <tools@kernel.org>; Tue, 10 Nov 2026 18:50:50 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BliqKdFE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CuOmLeFM
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org D5D7A1F008A1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAIoU4D999611
	for <tools@kernel.org>; Tue, 10 Nov 2026 18:50:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=0RA56yDyk2Xs1HCDVUzt3R
	fZuvqeLITx6R3suZIU7qU=; b=BliqKdFEwSkEje7FvEr17u2D2zCkm9SFSSpZHI
	QZpEcFsugYAmlwgNc8W+jn1RqKBbJaZ73caG31aXHDg5s0Ipuaw/BVNQPxybdQlm
	VzoXFa5mwOtqVSm/a7LNcFojCQ9cMa+y2mHXFMd6bQoBmdlp8dYDAlpgof0Akc9T
	GkDjmWfckmn3PH0POkPb0DwGQ8/Xdse4jEvm/udPQxaIgQ34tND/FM7F1QSg2jRJ
	YKOE6Sqm4+G8qcj2Fng9GR4UJ+ZPMp25n3WmJIbHWnldKp1fdPF1hlXgjiorc8er
	gk7piKptnx7YoNFO794ohtoh4HvUOkumwhnxQ0xdkxVdXFsA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huyvwjb5t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <tools@kernel.org>; Tue, 10 Nov 2026 18:50:49 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36ecd5db581so3055868eec.0
        for <tools@kernel.org>; Tue, 10 Nov 2026 10:50:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794336649; x=1794941449; darn=kernel.org;
        h=content-transfer-encoding:content-type:subject:to:from
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0RA56yDyk2Xs1HCDVUzt3RfZuvqeLITx6R3suZIU7qU=;
        b=CuOmLeFMRdx4YSf1bK0QiFfWUvWs/Jeb0byhBQbGGOkVoHvy6Vs5sUiSLfqDt9TYt9
         lir3izHalW5/4E93YssoOa3m6wIppPzT5QPmfvVvb5tJv353VFHHVFyiq8qV+bkpcwK1
         y4iE5Ii34v7VeQNfPBUig5mwVUcsMp60PfwluLQs0juockEw2MDR3cbdC/CQ00x7RXAA
         I3lx3XzbaD0KgSHGIEnN0sqeni5NMJujAQ2DvKicv43k9HVddAvKXt4iFVTNr8yRv101
         JvYjPquaBKy2y4eJamVhyYx3PelHcrveRcJIkm+nfUR4dUH01o0+Pss3QMKTxXW6X8t9
         dTDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794336649; x=1794941449;
        h=content-transfer-encoding:content-type:subject:to:from
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0RA56yDyk2Xs1HCDVUzt3RfZuvqeLITx6R3suZIU7qU=;
        b=siURRSC/O/bEjizEyLnGRJxmt11vQRBfwPRu3eTW5PIo7hHC21MTauszOLoNy/sZyU
         bYoi4UejJK2LtPImlkcYXij4qa7GHIlk2k01z7K6jfHdOzHcRY5Q0jFc2SB4AxYnisFc
         6oF3mxnkMiqU0+PH3x/NtRWo+Iyof6QxTN3aWg6C95VcdBa21cRATbX3CTg6u+OilDO8
         zX0+j+8GgWU32T86TUVdVrf7QVtUoJAj3qTaeWUh+4o+ATmxzr4QJnNwPQTRIGpky7YE
         MxqHvcm7GDNNPCkTw3YcyeN+a4+PsmZB3rklVQkJlW70aKds5ln9ajAA2XQ1kTpYnlg5
         9l7g==
X-Gm-Message-State: APuU4Z/ezQk9BRxQcIDlmnpSOcwzRsAslavgUM1nQUZaLE2YsXxh+jCz
	HuUFt37w4mZZOqDlZEdgcWdXapgInwfq0NbL5acdY9lnJWPwjHqQo9sNBVA+V8reNX4IZwRFBKT
	uU/91C5Z7Dl2JflT7Uxjp6sLZiTSRYUCQh8JOZ+GyoUCJ/ZjXwFRjIfERuhM=
X-Gm-Gg: AYBFou1CG/1WJyBG0asihhRlnksOdDklMqdoKrRf8OK0O1JeLow7b4rf754JjgbdYvc
	8G+PKgl3IoPcnyDJr2GkOitihgBTU1fjK2pr4/3ojDFXn4RzXEDyRXdUPpD1TIQxOfyTUyq0L+v
	ZWdlLbLsXUBK+nVBtdG3sLBT2yXvDPf1Ll9pjcLGfpMIjA17iQyKGUxYetH1dZ+Ykj2atgMr/Qc
	U6Qk9u4PGW1m/psucymynPBBeZS6pbYrfVJKCMGjE5tIFtzMLfkaHOSzlo8uOGwiDkOYDxVxNS5
	4HltXP5SLPprMNpB79E2DJGM1ObGlRBdIaVpVILgUhparqdf5Kdy/unSXuxZdSy/WhfrihOVmVO
	tz0uuvvFdm8r7REPn+V9t0Pu33WVuEAawvwU8+ZPr7myyZyJXyqVaoKpCqthmR3PdJp9FJrkmIK
	U=
X-Received: by 2002:a05:7301:da17:b0:369:f97f:72c1 with SMTP id 5a478bee46e88-3768721429dmr181278eec.36.1794336648784;
        Tue, 10 Nov 2026 10:50:48 -0800 (PST)
X-Received: by 2002:a05:7301:da17:b0:369:f97f:72c1 with SMTP id 5a478bee46e88-3768721429dmr181230eec.36.1794336648029;
        Tue, 10 Nov 2026 10:50:48 -0800 (PST)
Received: from [10.0.0.50] ([76.133.89.231])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212e9e03sm17990679eec.23.2026.11.10.10.50.46
        for <tools@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 10:50:46 -0800 (PST)
Message-ID: <342fd0c1-671b-4487-8a42-44adecda502c@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 10:50:45 -0800
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Post: <mailto:tools@linux.kernel.org>
List-Help: <mailto:tools+help@linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
List-Owner: <mailto:tools+owner@linux.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: tools@kernel.org
Subject: Should get_maintainer.pl ignore obsolete Qualcomm domains?
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: E_1AUVyCqpuT_L2WctFAKiOXZbC7zTnv
X-Proofpoint-ORIG-GUID: E_1AUVyCqpuT_L2WctFAKiOXZbC7zTnv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA3NSBTYWx0ZWRfX514IA/sQ/Weh
 +/A0WaMRlyMAWmS6PENjLgT40OMx7TTol/IHphtQrf+0G29V4xanQCp+IQ/ZzjYUiwYzvLaW+m/
 9S6GdstvvgWNmKam3jU+1SkLoiuXTb8=
X-Authority-Analysis: v=2.4 cv=NNpAaE6g c=1 sm=1 tr=0 ts=6af36789 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=6LbA7P6A7bvUEkAB8wivVw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=LpQP-O61AAAA:8 a=COk6AnOGAAAA:8 a=oSjsqYdVgYqbHi1PBhoA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=scEy_gLbYbu1JhEsrz4S:22
 a=pioyyrs4ZptJ924tMmac:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA3NSBTYWx0ZWRfX/cXjNlqHqG/D
 ilprY7sZv2NDvT7y+jk6qn8qKe3R+mJPimznM9OL6d4hn2WA6Z30fr6sPsvR8V5CVQ2aM5YrXeZ
 jp8xYr+ggnY+jot2cKtulHf7zi8qxeUgXb8vh03j8QjnbLINfFSnJt6uw+UfMXKecSQkF/5dPYJ
 LsG/fUAyoP8Q51eF1gmD3qJvxU7M2HfBQpb956Vppgb9tQLWktxpeJzubMmdxPR94TEoBPBjTvL
 Ai5HuvWRqKMlNX19n6DXMvcOrli7kvmclaCC3Ejqna2zdR1yGxbJ2xm+zhyJkYsPUeNFpMMDsyz
 bM6XzmCsX5A7UXr5qwIbqkaSsvLBiqZmnGGo15ndPR42npj8NBJwSTt0VftSgwaBTtaA9JNI60P
 XZzjout3jmRPC2ZXbqh2314aILYX6nm2aejNweCj0Jjy1m2101yNquHfznyGn8hDLfv42k2NEYq
 lGiNPXrS4ohuwn/GIPg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 clxscore=1011 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100075

Qualcomm employees have contributed to the Linux kernel from a variety of
domains. Current guidance is to use some form of *.qualcomm.com, with
oss.qualcomm.com being preferred. But prior guidance was to use codeaurora.org
(up until December 2021) and quicinc.com (up until March 2025).

The current issue I see is that get_maintainer.pl can return codeaurora.org or
quicinc.com addresses in some cases (i.e. via --git-blame-signatures), and
codeaurora.org no longer accepts e-mails and quicinc.com cannot be accessed by
the engineers. And there are also cases where employees have left, and have
not established a new .mailmap entry.

So I'm wondering if there should be a mechanism in get_maintainer.pl to avoid
reporting dead domains. Or should we just enter all of the obsolete addresses
to .get_maintainer.ignore.

/jeff
