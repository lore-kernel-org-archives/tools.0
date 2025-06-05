Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20A31F9F51
	for <tools@linux.kernel.org>; Thu,  5 Jun 2025 23:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749164750; cv=none; b=lUb9KL7cdVeapX3N9h/mGTsbWTL0BdJw3QzGirUDmBiEDa3kTmnoIsSBsrsawLPfh/bA3dLw5tIqSJdRl53L2xH7T0M0YtQml01nsxOSoH3wmKu0ItZDAZEKSp5cNkTiIFim1BzcXT3eR5ilhXRYx+09p8jcqjORlihsUA6dUDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749164750; c=relaxed/simple;
	bh=I1UexvPCq1VjSP1XGToKq+Cb6BCp0uONrsINPdhmwBA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=fpyvi37l0cpQuXff0ES/WfL5m6cISHRvHbpTae7XV+N82VTi5Z00mwqodXEnIXOYZB8NYyn3gFCGYvai57kkbloePmfFdvt/8TVYh4PHsbV/gJgVEDyfWHAw6Les2Ufqk5ok3pScGz2AltpM9toH6UPkP6ECXHoWXQjI7XJH44M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qxymq0m2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qxymq0m2"
Received: by smtp.kernel.org (Postfix)
	id 32F93C4CEEF; Thu,  5 Jun 2025 23:05:50 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E6906C4CEE7
	for <tools@kernel.org>; Thu,  5 Jun 2025 23:05:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E6906C4CEE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555M690C011546
	for <tools@kernel.org>; Thu, 5 Jun 2025 23:05:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5zDEkIpWfSMkCwswmNHwk/nnCufhwQi+T+Q7SCJa6IM=; b=Qxymq0m2TIn5JgK/
	HY8SrV2XOMWlClyH3iEhZzYZxwCXKa6bmhgMAswOgdp2kC63/AgKc1R8f8AGztNE
	evAxBqVYzJEFeN1W62SY5V0r7rSp6sLOjgvTZTjEVC/jY4BVpSKqk56hr0hrnMMc
	0t/SN1RDFkoT1IxSwyWsHaHFRrcaIhX6kdkv/VU8ZkcghM2NhnORod9ACQcrRe2t
	U4un4XeMdtClp0NRxThCWHVRffGgxubDqQHDSpx/NVU1Yzm5l+t+lVvzgVnZf68N
	+c1eihn5Mdi7GWht0c0TPdwY+1PKKEbOaZROWjXgWHPj4iNGOvk+sRPPCoWmKJtB
	A0vp1g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47202wggke-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <tools@kernel.org>; Thu, 05 Jun 2025 23:05:47 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-235e7550f7bso14637255ad.3
        for <tools@kernel.org>; Thu, 05 Jun 2025 16:05:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749164746; x=1749769546;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5zDEkIpWfSMkCwswmNHwk/nnCufhwQi+T+Q7SCJa6IM=;
        b=eycF/jvJyJqZMLBX5VC/ChKN8ATf0cDCuATt/srHCV3+1M6Rbw+XW+nMzASWsirYeG
         L3iASzIGHgXnIPXRR8RB/674BRLxVlFMShrU9Mk3XqN6kFScLoGasv32kF6W6HSttxUB
         ynLkehkpUdyhTiCLde4uxbOKK+dbehLMWd27v69345ywiN/uQ/thYTZFmiprUP/XUckj
         O401fF6xv0asJC32v+e6zT1uLC1397BT+s6TXBuxtL6FrqJRP2ttnQMj3MLxpDVLrRLa
         mu5i+JiUw5qYyKOIET09j+JSaHFQE/u2NCTHeGedCb75DKop5R4bIPI+wMIlVn9XszMl
         HsdA==
X-Gm-Message-State: AOJu0YydVAN6FqRVoOj1WItyDyehQYs1XNXIVZuLcD8iUPsNxnSzPeqp
	eVbTNzi0DhQ50o32DcpAtdJotQa7EdjSL6ah9G5hdR9ASwVwYG9JNxppDIQaHlle7Yc2ol+UoFO
	8D0rf/A3gmNTX40YuCUXlUq0qSF1YpnQ2Q3HNuWEXeFw6HG98P97nLZgI+8I=
X-Gm-Gg: ASbGncsD4GZgbyj6p/6EuyvQ/sV2Zo7ZpirmTYHmxjfnbya87vdpSMw8jG2HBYEs5V6
	OFcwAepWFQsS13thHLhF8AVodRVPMx/SyrD5TbOGZAqf9JUTfObXV8cYmfY+HMaP5+V3MDTmo/y
	vrK9qniYSQGvfFmDP9r6nknHqCZefc5HLRh1sZGJzC4FmG1DyNUvE8dsOA6omPXa6meyiU1mh7k
	e+yPuSBtZOvuLsK6ZSICKnidYH2afF7d9deVeH4e3dPR3lEHWKstM743lZ+OXRmywjKC2ZbnZVA
	/8+DGk1hUOcoX6pm83rP/leSunKR0vmZSS+sG0u+74Q7KoE/3CUBKUiHEEEV+yYaPNXTge0lpBv
	IURXw
X-Received: by 2002:a17:902:d50b:b0:234:8c64:7878 with SMTP id d9443c01a7336-23601d0416fmr17966585ad.11.1749164745934;
        Thu, 05 Jun 2025 16:05:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgwpVu9qGtZv4oBq5KZUhXUrMGbSmq4ErOuE+U+dQfpsCCK1ZXTM0sNQ0ZX0ATviRttQRmug==
X-Received: by 2002:a17:902:d50b:b0:234:8c64:7878 with SMTP id d9443c01a7336-23601d0416fmr17966255ad.11.1749164745477;
        Thu, 05 Jun 2025 16:05:45 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236032fe704sm1248775ad.138.2025.06.05.16.05.44
        for <tools@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 16:05:45 -0700 (PDT)
Message-ID: <811aed03-7717-4e04-98d5-e91f05df26e1@oss.qualcomm.com>
Date: Thu, 5 Jun 2025 16:05:44 -0700
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Need clue: b4 working with dependencies
To: tools@kernel.org
References: <67f86f2e-d3ac-4fbe-87d6-186487de5721@oss.qualcomm.com>
 <20250528-sparkling-expert-taipan-5ad429@meerkat>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250528-sparkling-expert-taipan-5ad429@meerkat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Qsi3ZeV4USre-DXvyLmFDKHzCwvPjM9_
X-Proofpoint-GUID: Qsi3ZeV4USre-DXvyLmFDKHzCwvPjM9_
X-Authority-Analysis: v=2.4 cv=Y/D4sgeN c=1 sm=1 tr=0 ts=684222cb cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=voM4FWlXAAAA:8 a=NEAV23lmAAAA:8
 a=VwQbUJbxAAAA:8 a=yBYpec10AAAA:8 a=UqCG9HQmAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=EnjfRS94meNa2RFSpG4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=WEDqQ-4R3nIA:10 a=4b4ywMqCX7kA:10 a=aWhxIMAnu1oA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=IC2XNlieTeVoXbcui8wp:22 a=zbxmTX4fiVD2UiCe4Dha:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDIwOSBTYWx0ZWRfXwEf0FuEmhCaK
 hYLjoU6+EvyWB37h9wdvpzQkXC6hZnzBPBRiwSorXZLjHM+JaI5BARFEaXl119AmvdEngopfafS
 Fky4Y4Zvqs/Lzfy9o/Poq/ICl7llB+G2lMAG76K1FD2mbauAdOGRf5Qk9xWA/QSsV0Mn5ZDvHdE
 EH1Q6CVK232y73BC3Ivkz00n7ykQensAECqmgSkgiDtBJLIhi2W7wYIwc3ioWGd/Up1Q1fNMni4
 JMEkjVIW26E4RgusKLSnYx2Mm1KzT5xt5SeopE3Owu8cDBh7qJJleUANJ/nyh6qOz3C/rAEH23Z
 GzFZfDBJucD24HbTCrl8I9HjlG3o79ZKrmHnhGwpKZuoxUMYYW51LYzyLcGUp4V2bppZxqIAQYf
 I71FUm13eAksxMr9pTi/Iv0lbSDwM9QUqDcFm1ipWPYQ3HdqSBPQ6hR53UGdvoPPtb5hvuZq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_07,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506050209

Moving this thread from workflows to tools and renaming...

On 5/28/2025 8:22 AM, Konstantin Ryabitsev wrote:
> On Wed, May 28, 2025 at 07:19:55AM -0700, Jeff Johnson wrote:
>> patchwork itself very recently formalized the usage of a 'Depends-on:' tag for
>> flagging patchset dependencies:
>>
>> https://lists.ozlabs.org/pipermail/patchwork/2025-January/007465.html
>> https://lists.ozlabs.org/pipermail/patchwork/2025-March/007490.html
>> https://github.com/getpatchwork/patchwork/commit/bc2d1b1dcf89c619e027ae4dfd3036cba30e5583
>> https://patchwork.ozlabs.org/project/patchwork/list/?series=442332&state=*
>>
>> Note that this support is only in mainline and not part of any release yet.
>>
>> Curious if the Linux Kernel community will adopt this approach for flagging
>> dependencies.
> 
> We've been supporting something like this in b4 for a while now, but we use
> prerequisite-* trailers (not tags) and always expand that into
> prerequisite-patch-id, since that's the only format documented by git itself.
> 
> E.g. here is an example of a series using prerequisite-change-id:
> https://lore.kernel.org/b4-sent/20250526-sip_svc_upstream-v3-0-6a08a4502de3@altera.com/
> 
> Here's another one using prerequisite-message-id:
> https://lore.kernel.org/b4-sent/20250514-ipq5018-pcie-v10-0-5b42a8eff7ea@outlook.com/

In this example what adds:
prerequisite-message-id: <20250317100029.881286-1-quic_varada@quicinc.com>
prerequisite-patch-id: 210bd857b2a3ce208c6c66389d2845616dafae60
prerequisite-patch-id: 27a1070861e75cf1dcb03f1e440618bd77b32043
prerequisite-patch-id: 4dfad74bedd5e7b3b628ead0b23baed7de8b88f7
prerequisite-patch-id: 79ded164c537cfe947447c920602570626eddb3d

Does that come from the tooling or from the human?

> 
> The documentation is here:
> https://b4.docs.kernel.org/en/latest/contributor/prep.html#working-with-series-dependencies
> 
> I'm not sure "Depends-on:" as an actual commit tag will be accepted by the
> kernel community, because it's information that is only useful during
> pre-commit stages. However, if it's passed along as a cover letter/first patch
> trailers, we can recognize it as an alternative for "prerequisite-message-id".

I'm trying something very basic.

In my ath.git tree I have a base tag ath-202506031604 (hash c3910de7bab7)
I have a public patch I created with b4:
20250605-hal_reo_cmd_status-kdoc-v1-1-e59f4b814b88@oss.qualcomm.com

This has the b4-generated trailers:
base-commit: c3910de7bab78afbc106206aed5ec8e79458fbee
change-id: 20250604-hal_reo_cmd_status-kdoc-c3f3a25237c5

Now I want to create a new patch based upon this published patch.
I tried:
b4 prep -n hal_reo_cmd_drain -f b4/hal_reo_cmd_status-kdoc
make edits
git commit...
b4 prep --edit-deps
  (add the following from the published patch)
  base-commit: c3910de7bab78afbc106206aed5ec8e79458fbee
  change-id: 20250604-hal_reo_cmd_status-kdoc-c3f3a25237c5

b4 prep --check-deps
Checking base-commit: c3910de7bab78afbc106206aed5ec8e79458fbee
Checking change-id: 20250604-hal_reo_cmd_status-kdoc-c3f3a25237c5:v1
Grabbing search results from lore.kernel.org
Grabbing thread from lore.kernel.org/all/20250605-hal_reo_cmd_status-kdoc-v1-1-e59f4b814b88@oss.qualcomm.com/t.mbox.gz
Testing if all patches can be applied to c3910de7bab78afbc106206aed5ec8e79458fbee
  [PATCH] wifi: ath12k: Fix hal_reo_cmd_status kernel-doc
Magic: Preparing a sparse worktree
---
● change-id: 20250604-hal_reo_cmd_status-kdoc-c3f3a25237c5:v1
● base-commit: c3910de7bab78afbc106206aed5ec8e79458fbee

So far this seems ok.
Then continue:
b4 prep --auto-to-cc
b4 prep --edit-cover
b4 prep --check
  runs checkpatch, gives Success: 1, Warning: 0, Error: 0

Finally:
b4 send --no-sign --reflect

The reflected message has the footer:
base-commit: c3910de7bab78afbc106206aed5ec8e79458fbee
change-id: 20250605-hal_reo_cmd_drain-801771bbf653

There is nothing that reflects the dependency, and the patch in the e-mail does NOT apply cleanly to the base commit.

So I'm apparently missing a step to have the prerequisite-* tag(s) added.




