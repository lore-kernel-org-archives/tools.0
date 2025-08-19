Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D75EC1863E
	for <tools@linux.kernel.org>; Tue, 19 Aug 2025 06:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755583283; cv=none; b=MkpQQkqXPtH7XmN33+CHnEI4UsmlBhNM7bV+Ui74yIZdfFhJakORQhqrGAUziSTxcNR//3ZBS6d3AH5YBnHL72ceCnFb7htBY9dCQuWRwCbroq3JAGmQwbx0VfEtp0W02RjRz9QE1tWyQSd1UkKqspbbq+TMMAGl/Gcl4IvZrvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755583283; c=relaxed/simple;
	bh=KFo4fdn/j6IwNGx8X6vtPiUWSjwxVtDXCj8HoeiW6mc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pR7puen6tpowqH35dAZO0k7e32bSNAOPoRiDGwqnFbeib42FX4ZLkeTjLVWVM+6LQJPQjsCT3eoERgFI3p6rAkfExRCecrNnSkWoyI9gHx1gAwa23DVowm9g1kF++HKQDmeJbZIpZYi5VMHQlDbO/AWAlgynpJ9raGpDZRLKmvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=flwUW0Ai; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="flwUW0Ai"
Received: by smtp.kernel.org (Postfix)
	id 80F1CC113CF; Tue, 19 Aug 2025 06:01:23 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9818BC4CEF4
	for <tools@kernel.org>; Tue, 19 Aug 2025 06:01:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9818BC4CEF4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J3CPHW017560
	for <tools@kernel.org>; Tue, 19 Aug 2025 06:01:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AAREMGR3T0eOVEpVRn+vMXAHH8myGgSLzUmNR3APCPE=; b=flwUW0AilbLSU1KH
	AXkcYAziZIF1wIeC2VHc8ptzQUwCVIaCknqXPqg5JBaBaQjGl+62kffTwZ7HGWnX
	E25gTWhFNwNdJFB+Y1E51eXQkr0QNH6KZnHaMZxkkjig6bl6bFcGhrzC/h5V2MX3
	xl4r1r6Td2KnX/9lf7lQYliXT37Argt6vxhYiAeKrbFGq//ommpDuJv+07MKhdOr
	F/MRiGvx01GYlZpP+20Xqvyu4XKZmONCjXdg9XrhGcr8XnQ+DbRTYV3Gi5TqruL9
	gHEPeq/tSlzKoRAt1F5ZqQ4l7QrTm3C74hD3t4dmHE7DA1xwpnp4Jz0CQW+thkY8
	1Vx+nA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jh077d9g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <tools@kernel.org>; Tue, 19 Aug 2025 06:01:20 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-32326e017efso5067675a91.3
        for <tools@kernel.org>; Mon, 18 Aug 2025 23:01:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755583279; x=1756188079;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AAREMGR3T0eOVEpVRn+vMXAHH8myGgSLzUmNR3APCPE=;
        b=HpkyUKBJBgr18Yy1hzMCVGHbDlVTHwpftIANykHzT1I6azjiXBqe2Ac4ZRMA2xfkT6
         Cenn60Vh1fYaOCfIq/tlj93d60+v2yfUy8tzDaz7f/KEL5aO/b+EkXUX6Dhp/olvrIV2
         whZmBBr+DCAHhDIvWY9b2GUiKWWtn36/pWuyhnxNlSSYAn6H/pQQp276LnXyRNAvdxY7
         ehBpm6uR1UYSEvkWDkwrCIfVYrh8DlFN0N+bJ2dLx7zW9z7hw+SOVY+OyNfz+jhxwlx6
         tOMLFfyMxqQJptq1b6lmSaAOhf4HmEZQs7+wQiKbPCL72pDGo9F4acuTPCGwL1XhP9lq
         lGBw==
X-Gm-Message-State: AOJu0YxLTcDIuyqmpXVfZA9lyAv/+ajnIs4/QPIhsMFIGxed8/dNNjsk
	Lj5drb+m/XNp96E1de8h0frk4kyz5NFWh1xyTHH1T0lwVedMWLqktCeyT7OV0a14j1iD2xniJz3
	gjL10T9AUiBhhpKpsdZlNrbzUcYXbUED5oJvbELCMhr8HqH/YoQ7TihIbha/sQw==
X-Gm-Gg: ASbGncu2fCJOp+X1bg1CtBsBZrkpWg6WI0n0uS1kgglmUycAKHfErmA6NcDnGZWbzQg
	g6KQQD78kOziMpQVY+bMpQe1WOB04GMs4ZnFaHzqwS2rLorqfRIDeDCqX2MTlvtzsKvwRLf5D00
	Vin+xLS8+f6r7YfunUHmOY2anUKV+pHFRx6nWKRTAcUi800Yl0hU2PNAwDkHM1arbpGdgf9b+H0
	xp61p+e1mpHnf7B9R7CpMN0/Wupwf7GXJFRfrp+TomkPL0hxkUW8PkRLpMlcIasDcQHraQCHb0W
	zYjME3anIclM/odwffDMM0IJzcAQyXiAjDzmRoko1Ij+SRBoAri4Ag8e94fxm4Y1jSumGLrtMVQ
	ByeJf2tkGPD1ufJopO3fcs3JFOr29uX95
X-Received: by 2002:a17:90b:3f0e:b0:31e:cee1:c5e1 with SMTP id 98e67ed59e1d1-324970ffa6amr2083153a91.30.1755583278786;
        Mon, 18 Aug 2025 23:01:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6S+WzgEWpD07ree+sjOi4LabpXEucSPf64T7wdmdGcRtOkny8emIq6siUjpeUokrSWNIpUQ==
X-Received: by 2002:a17:90b:3f0e:b0:31e:cee1:c5e1 with SMTP id 98e67ed59e1d1-324970ffa6amr2083109a91.30.1755583278293;
        Mon, 18 Aug 2025 23:01:18 -0700 (PDT)
Received: from [10.133.33.88] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3237e3da70esm1700262a91.10.2025.08.18.23.01.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 23:01:17 -0700 (PDT)
Message-ID: <056886f8-70f4-417e-8ddd-6257ac36f172@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 14:01:14 +0800
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH b4 v2] Add Git version check to prevent crash with
 '--default-prefix' parameter
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "Kernel.org Tools" <tools@kernel.org>
References: <20250819-ver_check-v2-1-46faa2d6c934@oss.qualcomm.com>
 <20250818-cyan-pogona-of-promise-6a4bc3@lemur>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <20250818-cyan-pogona-of-promise-6a4bc3@lemur>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: oDlxZp4I_6pirYHJrzd7ocP79l9WLSeR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyMCBTYWx0ZWRfX+vBEMD77ae7b
 lL5zwKojfx2hzP3jWgTyrV+Ashff6ZTybExBDCq4rKh1MZ7e8ssZLS6M7kI8Ofpvf3/dlKbO0Uv
 RN55KWSLSLwTyB44CllJEYbVMPwJPDSTulqIetKg/SrXIZ90Bj/WayGwZBSTKZJ8NH+5t5nnaTs
 wvmR0YvVZHtcslUXxUYldyH3SEwpOQ/1+8gR7oi5g6DmoEfbCplPubIug+/KUIU7v6DMt4RQgqi
 RGW/irv3elDk2q+eyoNp1YdgTzT6othPSkPthu9OPesqoJMGWWhnAjWEZ6wQPbpt/EsBzd4mIYl
 RamDOMjwuMmYqf0nhKA2of8rvLrsejTM0LvJvi1ObUMxEYR1LbukuTl32QqH5lMPlgodhsuQ5kJ
 rRGr3evy
X-Authority-Analysis: v=2.4 cv=a+Mw9VSF c=1 sm=1 tr=0 ts=68a41330 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=zo6fIjJfBq1QBSPtc2cA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: oDlxZp4I_6pirYHJrzd7ocP79l9WLSeR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160020



On 2025-08-19 11:33, Konstantin Ryabitsev wrote:
> On Tue, Aug 19, 2025 at 11:02:26AM +0800, Yijie Yang wrote:
>> The '--default-prefix' parameter was introduced in Git 2.40. Environments
>> running older versions may crash with errors like:
> 
> Pretty good, just a few minor improvements:
> 
>> +def git_check_minimal_version(min_version: str) -> bool:
>> +    ecode, out = git_run_command("./", ["version"])
>> +    current_version = out.split()[2]
> 
> It is better to use:
> 
>      git_run_command(None, ['version'])
> 
> "None" is because this command doesn't care which repo we are currently in,
> and is more consistent than using './' here.

Will do.

> 
>> +    if version.parse(current_version) >= version.parse(min_version):
>> +        return True
>> +    else:
>> +        return False
> 
> This can then be simplified into a more pythonic version:
> 
>      return version.parse(lines[0]) >= version.parse(min_version)

Sure.

> 
> Best wishes,
> -K

-- 
Best Regards,
Yijie

