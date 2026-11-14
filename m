Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794674522;
	b=0HK0SEYL24Im/Q0Z9IIn/fkw3fTFR7q3UCceThPc/bF8xLvkXlUL0DhLSy2xj+ZAEJL5
	 rU3dnUZQ/8Pc/KvHTSZJ47yaH3Um40LyZsE2F/99ThMMQsOBp6VrXntDd3ny2qNB924j6
	 jfqH58X4NbfCAk6GeOTyVPnWw3tp0pncIbSjmtU/fUlHSIIdnfbOpj3UrWy18ZIbKYo5n
	 9FLwRf7+BhpBjtnQUMzv75r0X9FiE1PXughi5g6FBt/6CJ/Wfk1LfA9rYI3MWpRtOiozR
	 5LS8gCRQYdUyh/ZYsbyamYV8KwsMaY14wmtaY9FjnH/Q5j484vOy7BsVkJznxmFiypg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794674522;
	h=Received:Delivered-To:Received:DMARC-Filter:Received:DKIM-Signature:
	 Received:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:References:From:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=eKALz0DAaI9NL2TRZYNFtDA3vkzkXUKbcUkdKSJ3mjM=;
	b=WUcPLxKhlsdYD67TNES6Ps+EKbJlhFYB/y811QXNbeY65l6cYzfHc2kNBFyeaBIuE+UX
	 S8emuOOtAhM1tOAM5QS5mn3BsocBayfWySbjQ6DZhBcoonM2uDANPELUnnkLM4HF30sHR
	 6c77X9Fpw8/8CZgMcCsPJLA4YogpsMY3fhT5MHOVTMW/5H1KJIzLhrdxZAymK0yT3sY34
	 E1Wv6rSxKUoLjVuXYvcugwi4eC+ra8vWkW28IX4wMTMoAiGBbDlthfMk/auxdmXbscPsY
	 IIqmEP7yAFuvw9NMFjyhvZPj+xul0JZUH4zL7hINH01//WPY2Vb2txgNAVmCo/TReZg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Sds9X/jc";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=InFI7SBx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C98460A260B
	for <tools@linux.kernel.org>; Sat, 14 Nov 2026 16:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Sds9X/jc;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=InFI7SBx
Received: by smtp.kernel.org (Postfix)
	id 0ABF01F000C5; Sat, 14 Nov 2026 16:42:02 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794674521;
	b=lqm0wq66tF4q/4yIXUME+/J1j5243DImqbT56YbIGknsUcWitKOpaTcZZEwtzPmUmUQw
	 3uRK/yzd3Ev4qdP8KDM9cKYrWexYRxVpKWrD+pFwdUIOlEROn1RJsI4m3BFNWBzUtE7B3
	 mAYS9i+DE199mkF++lOOJyjUizk+1wJ4QCk+ToEd/Qowhcl6zLvm9RTlYbG1nrD8De3x/
	 I3SYL2iwRV2eAf6TRvohTp9a0gWeIL+aBg+9Wo85lkaAjsikmuy5YynjTP7aMjhTHACLK
	 vLOK0Vlm8qyWR0C99YCQ+PzHNPCaRL1vNrNgjQTaRu2Hnwk4NjQCkKD7hM/Ck/D5qkg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794674521;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=eKALz0DAaI9NL2TRZYNFtDA3vkzkXUKbcUkdKSJ3mjM=;
	b=Jgar5t24UOJAbv2wMhUsUb8AIEhVoqUiGzZO6jGASzeBWJaMi6yxZBOfpQb/wglaCmdu
	 MqD19+551VPe+PyzG6uqn1nywLh/99fsmKGXpgx3reSudxtf7csyJ4VXSL7xW1nPI8Xm6
	 uYd+uP20KpuLP4Lm0KMa6U3uu9NWahakBE+mB6Kik36JIJXkgEze57BT9A8i42RbRQsx+
	 L/VRqaSIRkiUZrTGkIWlcC99pSOqeiFkMZ82On7kQQhxhVwYqY7V0+WJW3XsEZo0aYanK
	 B+ic87/39KgzSQ5p5Pl8pf74cu9zpmtrV6mVRqU2bfLSkHtoFMrQmgGIOBqRMdmxLAQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Sds9X/jc";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=InFI7SBx;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 54F171F000C7
	for <tools@kernel.org>; Sat, 14 Nov 2026 16:42:01 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Sds9X/jc;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=InFI7SBx
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 54F171F000C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AEDkQb7640559
	for <tools@kernel.org>; Sat, 14 Nov 2026 16:42:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eKALz0DAaI9NL2TRZYNFtDA3vkzkXUKbcUkdKSJ3mjM=; b=Sds9X/jc2v31l5tV
	kWMnzkcQaWg90isVCRbBrPWtDmcYUu3Du+oHB1J5weqyqPGPhGi0vFATLagv2p4y
	vqWziSRWh7PH1l24XhQ85p0nM1ai39+8S82ZeUKty6jbDxOHKqADFDh9S+OoB+Kt
	+yRrtKSnPGHoqkITLpabQ4Qc14HTSPFZHYhQzT2EiW73uj7GYm64d2ClVbDdLA3I
	ttmgL+B5VQZIxrSlMe6VgBn9cZ8jJhmNUGd+z4WABa7r578a03BMyngHgkD0HmD1
	Y36H9tFzv7LgUHBitlqduf/7VfyRPQ530isix6yjdnwXKHiC4H4wxi4G5UJTtWh3
	/68nnw==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmah6yc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <tools@kernel.org>; Sat, 14 Nov 2026 16:42:00 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1b3a348a6dbso3604648c88.1
        for <tools@kernel.org>; Sat, 14 Nov 2026 08:42:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794674519; x=1795279319; darn=kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eKALz0DAaI9NL2TRZYNFtDA3vkzkXUKbcUkdKSJ3mjM=;
        b=InFI7SBxNlstjRJOBgGlC8erZxlGkBaLRItGYtIi2wIL+A2zQFIJMm3O3AaRCrvcn7
         IxPVz+Y9J2NovlvjQKcoBbe/lDQqqn9VXNRjdUsVAK9H8GOoTcvFF5gRQ+uUcZCzCmPx
         kuARlUi2/jOGYFAAMRmK//Kns3E5NgJLsHUAECMrab2dSs2PWLp+0APihA2tto7Hs5wF
         RmEMjTtMZ2bH0kpFep3FDc1PEVIJV2/+oIntTufnQtWbQ2aXLCORuaLcod2dEW8p3nCt
         yLIq/Ekb9kPSXQ2sZWiYLuSiwRjKFULU4dM07V9mqH5yklgf4J4BntlBNwn/SnUUl20Z
         kNhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794674519; x=1795279319;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=eKALz0DAaI9NL2TRZYNFtDA3vkzkXUKbcUkdKSJ3mjM=;
        b=lKVtrdPu/aW8GqC9owaNiQKP7V2GStp9xhHbr1w0qSFBkthTAa3xVYCwdTrYyIzrKr
         VaSnoBFW86Ds+7OhCFJudpAxFKfc8mVffGUTGJ9IYkLe/E4C0D/UWOm6D77dgov8XuV/
         LfocemUg0da94ZdKQ3mjlQfJkcNyun/SNKQeeH1WjUVFkd+/GIuRI4sbKHJymcR3S+ea
         jDjIvHpaGOxLtnF7vhduMfIv35ApjvFo6dXv8k3BOMupqVSNmhEUnLKTMverGLL2YhY8
         TDHQcZqpGy+GrbpiBK1OrKZp0ztGxoOMW0XvOtyI7H7DLkiu3aIW+fZ+q4quMYfMFdBY
         qk/g==
X-Forwarded-Encrypted: i=1; AL+hErGf5l4e+bZuNbIbCWQn74553p80KOvC8NPFp88VH8JbJZgOROdfDQPr9GN11Sg1RulzmFcgBQ==@kernel.org
X-Gm-Message-State: APuU4Z82JPFt/WopmXCP5kGtBCbbBsMqBv2h2NnDTaL4H/uu6cRLdIB8
	hS9cyxRFGFV1FcFi1D2Yc3HUyN5dYHlhuNGbJVLlP0jCvdxSM+mijrPbbHsUXOStP4WxbmkBKy2
	/f4m5jcUR0nZzfzRUH8kr/pdnhbTcSjHZIQHW6Y2n3RSGap6Ff3uGYf+8l6E=
X-Gm-Gg: AYBFou3t6EVXrfbRRFI9q4i1tzhgfXFMBbAPG89uwmkYckd/GbgAEfXYCabfU3D2ca1
	Grv0dKA82wmd9S8hdR12eWeS/R8wnnUpt8KyyCzz2mk58SqgnNhkIQTq4hAUWDTdEJ970P5600K
	MlPRAiYjDvW7Ce1sWNbtUe7vt4a+y6bMl/fsn5j+324S51Kfc5PCLNm4Uo+vQCGKMVTX2eK4bA1
	TS3LeDVsA0ZoDYxvgkVi73tznb4JtTenfhUxnmw6q8isisHvw6mQh7QFufwfX3e+ZL8qWOj1SSU
	sRHphyBzfPjifGpBacgaU2AiTjHWKHbNF7vN+N9QY4O9SE08tEn18BYBmOQKhAewssRzc+IeJOD
	WXbEVC3Pn0gUvSBM5jd4ibBAxA5XjRhboqBtdRltPH/OpcKA99yqaxJdY91Rs+iDFXVTWq/HQHu
	k+JzO+8ZbADQRxUKSfy2bdWJk8OgkY
X-Received: by 2002:a05:701b:2202:b0:1b5:e9d:c641 with SMTP id a92af1059eb24-1b50e9dcabfmr3415600c88.18.1794674518726;
        Sat, 14 Nov 2026 08:41:58 -0800 (PST)
X-Received: by 2002:a05:701b:2202:b0:1b5:e9d:c641 with SMTP id a92af1059eb24-1b50e9dcabfmr3415583c88.18.1794674517976;
        Sat, 14 Nov 2026 08:41:57 -0800 (PST)
Received: from [192.168.1.20] (39.sub-97-215-59.myvzw.com. [97.215.59.39])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm20368293c88.5.2026.11.14.08.41.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Nov 2026 08:41:55 -0800 (PST)
Message-ID: <fd6aa860-0d88-4e7e-b2b9-7cfbb738cf44@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 08:41:54 -0800
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
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <3aafe4ad-ce14-4ea7-8bd3-4a9484db6787@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: O2nHyNiLEDQkBiWCBQKfLLPEMNlFsIHK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA2NiBTYWx0ZWRfX24U49oHs59Al
 xYyT2CGWZ8aK6kmYyA4N31coVLlda1L/b/bOQJSJbzZIRMImq91F7w/AURui5FyKQEZdzyLoCwR
 5wrUs/AheOTa0PaOkV4ijZk/tmEDCwiJBKerRuptBwWA1YvI1agtyuj5j9ZdGXpXqJzvhPcvV72
 +QWWtiqLPep4GvF/JbWYfH7yjZ4s7GEo67eWkk6FoNT84e56zmmOkAxgEjyB7rdm+9PvvITllRk
 5wBW+F4WmKcnPRLfCcxTpZUuYF0entUCVGE0Gs2E2iUtnmcgcfS9ylolB66mrHtAYTK/YINiJZO
 dbiX5RcdwCQhq3kJAvXKiSdBkA7wC6/82u8mJOh11B6wDWhmxcWilDXNkZvEhcLbjO/1nZh0yvy
 WRuGfwBcDTx3OQbwdFD5V4TGLuVIHa5jySd7WVdA20Uh6yM8P9iC02fYd4KzwkrAL8PSRjF6WDw
 8H2EjVibfwCGqm4c44Q==
X-Authority-Analysis: v=2.4 cv=NdhzRGD4 c=1 sm=1 tr=0 ts=6af88f58 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=7UwXyAtrHAWG9Tdc5CO1EQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=COk6AnOGAAAA:8 a=VeaxtS0nsKZS58XROF0A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=Fk4IpSoW4aLDllm1B1p-:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: O2nHyNiLEDQkBiWCBQKfLLPEMNlFsIHK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA2NiBTYWx0ZWRfXzrfT0+Y7LL3C
 +HsISaYor8f9VBOIkwgst9YxIBnaJzUH4IoJ3OlqupqfSOFxI4xlLVtXh6qOH/vXCMRDcr4+s13
 yrfKH8AcS6f0pGQyVKVZ+HiJ3vxqKxs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 spamscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140066

On 11/12/2026 2:17 AM, Krzysztof Kozlowski wrote:
> I think I missed partially your point - you do not refer to
> --git-fallback, but blame for fixes. Well, yes, for that I would just
> drop entire @codeaurora domain. quicinc.com is still working so for me
> it is litmus test if maintainer is active.

Interesting. My access to quic_jjohnson@quicinc.com was terminated, and I was
told by IT that was true of all quicinc.com mailboxes.

/jeff
