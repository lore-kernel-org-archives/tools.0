Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794763101;
	b=Md5FZtebAml3wC5eINlLyFEUwbqTMGhvhPEjX5J9XEM3chVKyuf9g2Dgtha6QyUBI+Yz
	 udhfHo5l7a/MPHPgrymNVUEKeIZbb+17FoTkbGbvHfoywHSHczzr8Qcj54mxIaikyfz79
	 lAH2aYNIy/BuWR1R+7ag03NGzD+Qc70xtJdVRrPkOjfYAs7wAKALNmZdT7SXL+GXBJpjM
	 h/8RyWgQNvbei2XR0oJ/hbfhi63ZfNYFE+irTNR6YemfLeDussFsFiHl1F8G39HMhApG6
	 9727rbLMdsLidk0CV2Zo8FDvxVYMgifyC/lkgo4p/SDifakA/qmC3Rle4ac96B+o87A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794763101;
	h=Received:Delivered-To:Received:DMARC-Filter:Received:DKIM-Signature:
	 Received:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=WQjGpjeMpLtmVpJ7ChNpRk+V/TXmE45La6vnqLDq8bk=;
	b=cMO3d9LaxwMYcItaaasHwEAC+Z9omNoSLbU4T3XxRYAmloqc28G2BP1wZvTtIrC2I1bc
	 uRWoivbG0bON/F18Yze+CwQhGS2qg7i2txc1KLu8k/QI0Wz1Y+bbmOwvmk3u/1dr2JjOh
	 95AQYpMLKFUcCu809xeig5kGKaKYiSHuQS5YCJ2hQEI7udyAQaxcoUlJLvKnTIS+kjzcu
	 Ow5wK2YGAvmSv93hKX+cMfPwk+2DKOZHwc7dxrx2+a4x+Dl0xQbBhVxheNQzbY37Qi+7T
	 mmhxLyfhtIX+euMO9x5gt3gdKyRlPehxxYpUottU5zXV94l0o/YzCOPSG+Z3ug2lBrw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WZuhvalG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PzfSOXzA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42FB606A31F
	for <tools@linux.kernel.org>; Sun, 15 Nov 2026 17:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WZuhvalG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PzfSOXzA
Received: by smtp.kernel.org (Postfix)
	id 854781F000C5; Sun, 15 Nov 2026 17:18:20 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794763100;
	b=xm9QiC673DyfhaTu0iMHMCHnO91TmLsMOFaaWwapucjirR+YpWyrNnzwlrGH5TaHGs1U
	 GtNYKWt+oySt2Bl1YN1ulf1KkK46UAoSRGXzC1a9IP0Mm1YjOXeYMUjkk79a0QQiZHCae
	 FuXEgyDwyaSPE7Gx/vea5iTWEJ3ZPuFdZjLvKcE5bp7ZTMBsuSuUE46y++oRjybzeNR1j
	 3AtTGeJmUZ16huqizKemwgEQwEscLXlUGUmlqYhfrmzB8A1mX8Kgex1617W5n+xPlhrWv
	 1Rt//sEoS5DP/O5PJi6uoIDOXmNiqDOhhQowrXmvAbj9lqVz8wyqek1mEA/PvjMdsBA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794763100;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=WQjGpjeMpLtmVpJ7ChNpRk+V/TXmE45La6vnqLDq8bk=;
	b=IfOvv2DJHG17efP3K9UmDax2ak+NWBLFXzrEGpA6L/r84pK/R4iIQSPs5nzEfiUnV8zh
	 H4VE63zeesHuLWXk8odeQwIBlPODZnJop8lHYwmEAFTDVkKMENsl1sTWjaG8IJpEdsK8W
	 b4owhalW+e1CIYu0G5NuxC0nKc12PoMPIP+vxpXAS5Y2GLjQRv6izoldThPCz8nOtejcm
	 lFqkWixNexlqb49ot4Xos0ijmbg4c45CWKkGu/y6FkDDkhLLzNq/wFm3ch9+2Cyg7va/l
	 FGFtFprsrk/BbnQZjPmuRsu44eZR5dpF9RwRr8VBqnrq2mdTLpWscbSM/C2/h0gwFhA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WZuhvalG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PzfSOXzA;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8032E1F000C4
	for <tools@kernel.org>; Sun, 15 Nov 2026 17:18:19 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WZuhvalG;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PzfSOXzA
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 8032E1F000C4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AFFB3gx2749735
	for <tools@kernel.org>; Sun, 15 Nov 2026 17:18:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WQjGpjeMpLtmVpJ7ChNpRk+V/TXmE45La6vnqLDq8bk=; b=WZuhvalGigvr+eVm
	fM0lBk29sU5jbANqM7mbtFf1O+QWfejUa3RxxCNpw336uR0lM1Ou5lYOX7JPnIjF
	lfYqQPxdfchHTAve8h+URi6z2upzGonFmClzqQSu11JR9QczKSfgMduF0JfAWg2Y
	ulBzETxto2g3yB0NX6KvV9M9WpOaXgRpBanWD9cN5un1TFPI5T+A49KUV4jL3iLj
	fLGREN3R9t9aIy3TU+CcWeDiozpxaFK/0idi2tHX2Ji41aghFSOHrTISMWxc04I2
	wGG5ls3f8WyrDyz6hFw3bX7Y+DjCBu8ptDqn1c3Wfym+tdv+Y5o/tf486xUWEhOY
	7R3O1A==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhnx3gxh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <tools@kernel.org>; Sun, 15 Nov 2026 17:18:18 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36de26cb4b3so3331882eec.1
        for <tools@kernel.org>; Sun, 15 Nov 2026 09:18:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794763097; x=1795367897; darn=kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WQjGpjeMpLtmVpJ7ChNpRk+V/TXmE45La6vnqLDq8bk=;
        b=PzfSOXzA1zm/c2UxRB7m1cExT2GLUeweVNKLbv6+3ZzB4pSzOfF1WW9fNF9Vj6yaJe
         4TbexjpwetZXC6U9sJoGal7MEhtehn6DAgR6bPiHDf5Hbjfkg2AwI46CiZ5Ug2ddEhTp
         UDfoXSMxtjKuAa8mTi6iAyBTIERO5qyotG0CfgeCcNcP/Ud9DaUyl94LnmfdqNLwRX6X
         MsSPH9pbGuy+4D06NtS7BCRuKmcZhf0jVVEYY3zetSOdP1cTR7+dqcw2adC4YRRthSKm
         GnfHHR1JxmWyUk2WErfPl7To1zSsNiYFEKsEPwExbJR4bPIVpky2mELOEDGFrn/jrwYn
         2f4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794763097; x=1795367897;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WQjGpjeMpLtmVpJ7ChNpRk+V/TXmE45La6vnqLDq8bk=;
        b=hl+5SAu8SYDvilrie96daLXqKFI4MxVgxsE12BnymF2l3J4hweA8uOxO4bNYUG3RFq
         Og/2H8pwc8qZVBwZoux3QMvXLzaRktVdpNd9cnreyjm4a278pMddSykCQnMcxdOtDliV
         xE6RORuVWMKHx4sX+8tXI9AxHwgw5mDShoH0orEkfiIwC35Mp6jSlNW62qVenTPnjV7h
         cTsVaZ6QRdQCfooq/PH04cQkZFJwyXvFRhillN4Qq8S/5mVHOCPMThnNtE69Rlfa+Slt
         5hoc/G6C7jPe1G3xU4hLRwfeFivIlnjqAP/sThh+l2weacA6afo8Bxt/8cPwlQ69zqNG
         p2xw==
X-Forwarded-Encrypted: i=1; AL+hErGGo3YpmGAICrydMZ/6ZHE6G8IGs68zLXsfr041pQKoA5rzWjuTitig5rAaFBGThvPngeb8bw==@kernel.org
X-Gm-Message-State: APuU4Z/sJk2pYITnc5kuNG/Eoqm4rW+JmX78446mTBFEUgK6zmfh8Un/
	lPgZsCbKwgeJ/5DsX7BOaA5Kjoo5DXRZR2ObO2/jhaYnnpI8Xw+Lm5djH9hb7YpvX5hH1HZaHfy
	v3I57WabE++gGBg4V1PJsU+tUywxODC3II7UBbmuGqleCGW6eGrpZX+/86h4=
X-Gm-Gg: AYBFou073Vkd/iXedZbo8voPJ0cHqxQL4N4qBvCH4yqKJc/2exWLmzXd823D8irpHUo
	pL+yzEkyCfBZcGRhIWuNjvToGssXkiGHPkJ0rZPxUp/PmEa5yXpdQFdB7EDhdPlshgJtGSy9fvd
	ur01tT1HtJr2xrcdB/z0M8yTl+IOvYoyJhN/gDhTJEc6tzRXFYi0I9r1JXgnhbZeoQp8jSBCeNU
	LvkqWX9FSm0FeXyF1CO3Mn/MzljLhewiIHoUhdUdXpzFRL8OFYa6Woix3lxZxvLirEn5WEIvDd1
	zW80QBtufLGGfZY6TjCx7P2MGm9dmVzrLilssi7uIjdAjLtu24D1gpAkyGXfvJLFCA9J241s0hQ
	Eet5Um6myh3BRE84qBbDAhiuXHt7qNRLvuldk0m3zP+6u5eG7ggPf+DETknXdpP2d8y9R6l60sE
	6hoUM+ojwWBRtiMliK0yO/jICHWmEc
X-Received: by 2002:a05:7300:b284:b0:35e:2c6:d46c with SMTP id 5a478bee46e88-37966e3abf5mr9100302eec.10.1794763096954;
        Sun, 15 Nov 2026 09:18:16 -0800 (PST)
X-Received: by 2002:a05:7300:b284:b0:35e:2c6:d46c with SMTP id 5a478bee46e88-37966e3abf5mr9100271eec.10.1794763096080;
        Sun, 15 Nov 2026 09:18:16 -0800 (PST)
Received: from [192.168.1.20] (39.sub-97-215-59.myvzw.com. [97.215.59.39])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795533170csm26970458eec.7.2026.11.15.09.18.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 09:18:15 -0800 (PST)
Message-ID: <648e0ee9-b686-4273-aad5-274e29eb81ce@oss.qualcomm.com>
Date: Sun, 15 Nov 2026 09:18:14 -0800
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
Subject: Re: Should get_maintainer.pl ignore obsolete Qualcomm domains?
To: Krzysztof Kozlowski <krzk@kernel.org>, tools@kernel.org
References: <342fd0c1-671b-4487-8a42-44adecda502c@oss.qualcomm.com>
 <b02133f8-4819-4615-b99d-3df8eb1aecb2@kernel.org>
 <3aafe4ad-ce14-4ea7-8bd3-4a9484db6787@kernel.org>
 <fd6aa860-0d88-4e7e-b2b9-7cfbb738cf44@oss.qualcomm.com>
 <2b1da3e1-939f-4efd-afbb-628f7d6e7a63@kernel.org>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <2b1da3e1-939f-4efd-afbb-628f7d6e7a63@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE1MDA2OCBTYWx0ZWRfX7EZzaolOTLKC
 I5wbflby+K6UptUvtj0pKUX719U+pboc49Us/Wv0Q0Tsdku72C3g031LBs1fKxhMMHNc97db17j
 Y19CnylycLNaVc+yYwmP/e9jEXExS1ZO0IR6B/iRkat+6tFLzW/ZC4e+DSYLGNrcbYT+U72061f
 vQ7+YzGQNbq6qeD6y11D/hfxK5uu4UWUHLtgDUQb0Y9W4P8129pxJT/owwWS3cIK6i8/XfrxaaL
 Td1dVafnJZF9baW27aovEMhuDyZCyw6njaph0D+YfmhX0/TSO5MqsgZgk3fIqE5/FIRIql1NAEU
 gp6lMIFTn2gV3hDVP/hC9bCuHPnXyHxgnIkyYpiEnLOi5Q/va8Zb3bgFvHzAYnOP9Bmoegn4CpH
 /RJW4Hb7wNGr7LPe/U585KtyZAgBukPpoVbQZZdiVdXuVCGPgjKtVZKACtM7ME2OEKlZhHoXXbJ
 cBQB8sKsNTxfI9UhltQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE1MDA2OCBTYWx0ZWRfX4r5R2pSBhiFW
 BWK0hZYDOxM+FU1LkZs2j85gMYHPr3zjO6Pya8Vpx5JNcfO9JBzemZ4FRA1sqw3ZqDSq2j6x/Gd
 hhXfEDywXMUhBb3KbJR4+v6K5MYe9OI=
X-Proofpoint-ORIG-GUID: _xnlvzpIlZ5T3n_sr0bijI2RTtZpezvE
X-Proofpoint-GUID: _xnlvzpIlZ5T3n_sr0bijI2RTtZpezvE
X-Authority-Analysis: v=2.4 cv=Jr5kP84C c=1 sm=1 tr=0 ts=6af9e95a cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=7UwXyAtrHAWG9Tdc5CO1EQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=COk6AnOGAAAA:8 a=LpQP-O61AAAA:8 a=_fmzbySdB_YVwVLW9igA:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=scEy_gLbYbu1JhEsrz4S:22 a=TjNXssC_j7lpFel5tvFf:22
 a=pioyyrs4ZptJ924tMmac:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-15_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611150068

On 11/14/2026 9:40 AM, Krzysztof Kozlowski wrote:
> On 14/11/2026 17:41, Jeff Johnson wrote:
>> On 11/12/2026 2:17 AM, Krzysztof Kozlowski wrote:
>>> I think I missed partially your point - you do not refer to
>>> --git-fallback, but blame for fixes. Well, yes, for that I would just
>>> drop entire @codeaurora domain. quicinc.com is still working so for me
>>> it is litmus test if maintainer is active.
>>
>> Interesting. My access to quic_jjohnson@quicinc.com was terminated, and I was
>> told by IT that was true of all quicinc.com mailboxes.
> 
> 
> Well, my standard user@quicinc.com works, so I guess you mean the ones
> prefixed with "quic_" (quic_user)? That's a bit trickier, because domain
> is valid just usernames are not.
Thanks for that info. So it would still be nice to /dev/null codeaurora.org,
and then the quicinc.com ones can be handled via .get_maintainer.ignore or
.mailmap depending on whether or not the developer is still active.

/jeff
