Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851D021E0BE
	for <tools@linux.kernel.org>; Tue, 19 Aug 2025 01:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755568108; cv=none; b=qt1dIR4LqsbzCPwR2Sq8cJIWcywsG6urAHV4YjTcqUJjO+PRr4Po90GlHHpa8p/+GHfNsZDtjzqKMBzOsYzH66DnT8E1bRlZvqugQtSUGAsMoVZdmS2PoP1U6U9afHHqOZvt5LjxmLgbqd66pQVcAbmjkY6lf0265r4+CpJm7Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755568108; c=relaxed/simple;
	bh=t0j0CqkQMJLt3dtw7L/sKdMIa5uk6gdAAC49ZpAT1+U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VYOZO+oKUdSmNqimINdfTuGXy+RE0tOsXE5iCxI2WeQRhi4kRzMEybbRZIx5ZdI1KJYVUmmjxEv7o0O9EzRgUe9sgh5dewguboMseYHk+jG938BPjnJNDU48DTbGBVD7TN/hUs9XkjFyzZQEkXxa7gNdH6wAr7LSpzuUWXIiEXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=neS0QbV6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="neS0QbV6"
Received: by smtp.kernel.org (Postfix)
	id 1181CC113D0; Tue, 19 Aug 2025 01:48:28 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 332B9C4CEEB
	for <tools@kernel.org>; Tue, 19 Aug 2025 01:48:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 332B9C4CEEB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57ILfPuh024505
	for <tools@kernel.org>; Tue, 19 Aug 2025 01:48:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S/6yKEwwIs+1N81N+cgxvQHmVPyW5A6avbXetSRPqag=; b=neS0QbV62lujKTEE
	NcrVUz2FYDFFJgvXdJxUvRCKAvbf9LHLIk1BcO9qvgzePS/QdtRT/y5T9ll0Ltzq
	yw8pzGKzeUsw6WsgFa+5O6u4IQGhtn38emvj58+wXiOVgJaS2B2mOu+cZX8GEm45
	tKHVTEfs5hmwY67fazbOE6qOmL2l89feMdRP5bky8cEVg+a49c44yA/ZqalB9aod
	9127wn5QNOqHichHPhXt56vzNba7+QIcuDOPE+qQRO///dt4e3mSBEKc7/ELXUFv
	P5dsiZU/6I58zOpRbH0E39GseqO8tM3UKhUHmJe0cjUWvP02UiHWa5aVwnUOroSM
	/6HB7w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48mca5geuk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <tools@kernel.org>; Tue, 19 Aug 2025 01:48:26 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-323266ce853so8903548a91.0
        for <tools@kernel.org>; Mon, 18 Aug 2025 18:48:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755568105; x=1756172905;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S/6yKEwwIs+1N81N+cgxvQHmVPyW5A6avbXetSRPqag=;
        b=RwXRjVPL86Jzt6GdPmOzvXfBxvuxeiogOtQd4Hkq+sAjiVMvWY/LUQoLOSc7+tSKPh
         wGvX4cUaIHgTvfVZZJzjDJ7VUabrFj3pU+OsZoWiKAeYAHVaOHY/JRQNHo3XfYRzLB4c
         DbTNferLnCh27ceBtMMEFJlgIkNA8zHVC1FuDf9YhjGNjin0ew3VOE+y8aCghAUjorsD
         t5k0Lh6enCrs2l3dmKgVfOtXwk4seNO6Tf9advbeviGI4RmGxg1UJXU748G96igmm+QH
         KJ8y6Edn0C7cFqSssAXwBEntbKvFMs4jjXlG8stxF0aIVsldGKAG2+p5WvOmit89+aaj
         WW+A==
X-Gm-Message-State: AOJu0YwsJamu2dN1pKl9HwKfNmPGHnBAso4eHtbKLIj3UDDGTluOTW18
	QQ866gQTl7uvaMh2rlbiLm+DIL6mwE5MDVzebFy7PB1n4frnbLzqxD2PFavC/asGqLWedxTFvc3
	yU0ho0o6+JUO9d63WATomnHR7vFPeVI5ealkEX8Tm2+in0rk3JUk=
X-Gm-Gg: ASbGncvaFRhy112zFWRxrZZO3Vt6nQ+zdc/DFsra4W0brXozIVCM3aGEhstEjX1gK4j
	2UjrB7UjOF97xxSbfiurWHVekK6TZFgM2x+IeIMQdaNmXFQLRgbMcQyVgotCWPBy9YjlVbeMdwJ
	Ae32+83y1gpR/LtPC5XeoitEacreD5xk12jY3uVuBfcdkGZzYI76fgEEcRIT2Fwa1rGZTYPnxyQ
	5NfjqymFwUPiv3niQlgDM3YnpznGrN/Bf0oBT/JxPNs/Tz3lMpEH/PDFEaThIwshd4KETjFxHz+
	FiOEHSimINrI0C9+vDa455WGoO14hYL0w819ae/1oVpn1bi+Fdm1MJyYFQnStYfqCviSK2iE/am
	rOuS4XYo7VNCHeNV76tqAnc/ySW1695vT
X-Received: by 2002:a17:90b:4ec5:b0:31e:b77c:1f09 with SMTP id 98e67ed59e1d1-32476ad450emr1369316a91.19.1755568105191;
        Mon, 18 Aug 2025 18:48:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENvsK+KY7sPRPi3pTi0TMZbxTjRI2eUpI1EKl1AhjKRrUao3kn5kOq0AYlqh9piBcziUHadQ==
X-Received: by 2002:a17:90b:4ec5:b0:31e:b77c:1f09 with SMTP id 98e67ed59e1d1-32476ad450emr1369299a91.19.1755568104779;
        Mon, 18 Aug 2025 18:48:24 -0700 (PDT)
Received: from [10.133.33.88] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b472d19a02fsm9233399a12.0.2025.08.18.18.48.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 18:48:24 -0700 (PDT)
Message-ID: <06c57238-3b31-4d0a-bee8-e525fa39d20f@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 09:48:20 +0800
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH b4] Add Git version check to prevent crash with
 '--default-prefix' parameter
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "Kernel.org Tools" <tools@kernel.org>
References: <20250815-ver_check-v1-1-9fdc9f201bac@oss.qualcomm.com>
 <20250818-tough-poodle-of-politeness-feea52@lemur>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <20250818-tough-poodle-of-politeness-feea52@lemur>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FdU3xI+6 c=1 sm=1 tr=0 ts=68a3d7ea cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=zo6fIjJfBq1QBSPtc2cA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: 8pNDsbxtEytSs8aSkZ7AQgbchjJsChcB
X-Proofpoint-GUID: 8pNDsbxtEytSs8aSkZ7AQgbchjJsChcB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE4MDIwMiBTYWx0ZWRfX7ilXKd88WXnP
 HYSZQtJnsJGAyXH8WU4TpV8D6smn2qxR+fdOoFGvj3FFGGhoGtNtFlzVNmxKjrrcvqSZudM3KY6
 AoMfzUGs4Nlw90Nz59WxTJ1FcECFS+LxSa97Ws0oX3As1PUd0OG8Qez350VfKoeSPi+GZiHBGxS
 9FcZIZ1IvfY+lKSXtzq34NpETVR2oIJBuRC1D66SW6HzsLE6jopQ2azaY49fgA7MKNzaMUJ+5fF
 NUWzh85i9cD4wDWj+7RImbPsEpql5h/mlyBfLlHRQC0dB7BiZFGHVbwZx22J76FBA8XJYQcyEYo
 A91XrE613bVwmKvFZ1xoARp0BhI72ih8P0o067pxXCYWDIPnmIPy11DNHs1hbPPitnazAKbpsC2
 Jf0Q3wHS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508180202



On 2025-08-19 00:55, Konstantin Ryabitsev wrote:
> On Fri, Aug 15, 2025 at 05:05:12PM +0800, Yijie Yang wrote:
>> The '--default-prefix' parameter was introduced in Git 2.40. Environments
>> running older versions may crash with errors like:
>>
>> CRITICAL: Failed to convert range to patches: Could not get a patch out
>> of 5f8e8d5b2c840f8fc5185c2f90d6d275535a6aea
>>
>> This change adds a version check to ensure compatibility and prevent such
>> failures.
> 
> We'll probably benefit from this in a number of other places.
> Do you mind making a new function in __init__.py like
> 
>      def git_check_minimal_version(version: str) -> bool
> 
> The function should use git_get_command_lines and return true if the version
> is equal or newer than what is passed as argument.
> 
> Then you can use that in the check for --default-prefix.

Happy to do so.

> 
> -K

-- 
Best Regards,
Yijie

