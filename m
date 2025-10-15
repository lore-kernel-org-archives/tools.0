Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3632FE06D
	for <tools@linux.kernel.org>; Wed, 15 Oct 2025 18:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760551552; cv=none; b=oEaQNLnzOOXZ6/DsAyTga6rh9LSyPzgfymvgXYnmiyw10hJHaVYfaNfs6MAhGCIFeU5ewYfCrH/qLB+9tJxaIB2JC2TVGuWcuBXBgBT3umePSd/dA9TBTkWYBYY2tfotcm+JJLpasxEEoK4CPxe2USD2/iw2L1M6Vbu8sNUcqCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760551552; c=relaxed/simple;
	bh=hH5kYg7uVdVDEwWZn/rn88bgFWZ8LiNNorPXkkIdoKs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uUQYn3GlM5kLHfYNbJ7o6iFOQP37wteXwW6RD/On2jwD/we9HngqPIZPtkZw2qUIBcuyASgScXH2inBsECASaMBURzeV7uuIznB5Nj/kpyMKJlNXAIyPTyAq3uw/Q3cGLsDrTw8iRfwsQEFLYQ3zHeCBIN7rPL/ZAQ3lGWWv8/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AGJwtkQf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AGJwtkQf"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59FAponp017425
	for <tools@linux.kernel.org>; Wed, 15 Oct 2025 18:05:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hH5kYg7uVdVDEwWZn/rn88bgFWZ8LiNNorPXkkIdoKs=; b=AGJwtkQf3zQX63FC
	g4ALeVyH7YXp8PUYrK5WGp4WDVk4+JLcbecLS676egebix6P2eLNEJypsAxA8uZY
	Igs7eUd8xVjp0zA8wOGQkEUQwDJRsl1VE/4qfv2d+nb97ZZZYBi7WG38alPibNNq
	XHeyfwDUUTS1K/2Yso1bxldYTs1m31/m1VG1eQj826bIuxmsc4Mzc38fVpyWiwCR
	CHCnoL7Kx2VNH9HrHnPDvx+k1OLaPgy9ad5LuwIGhosXPQ/VS4+GcitDfKJ4NrQk
	qowHwLoSNPs+rBmQlxkBV2NnJijT69TH1BZ36A9X9hxsSEfjXiMt8zv0F2rrn/Su
	UyuA6w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49rtrtadvk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <tools@linux.kernel.org>; Wed, 15 Oct 2025 18:05:48 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2697410e7f9so242751565ad.2
        for <tools@linux.kernel.org>; Wed, 15 Oct 2025 11:05:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760551547; x=1761156347;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hH5kYg7uVdVDEwWZn/rn88bgFWZ8LiNNorPXkkIdoKs=;
        b=tQiUxu5Cn54DQtS8zBEv8gc1ac0qhD5NU8iFC4D9IXLkO+jUpE8TjJ6Ddl09Da2Fht
         61ezOZ/rRLkHIqNDojE+7GbErLgHELgqpOoH/PWLq2Vhdpnlw2vGekerQkeZJSh79/I4
         U52KjQGn3rcZ4A/OuNhbS8CGYge588h76Bcs5KjQqQiZC+SygvarcfY1C2dShfEsgpp2
         Axlpx3HAwZLwqvNnbTaeBEFgecucgjcJYUcgWfzZi0ZEC3q+AfW4TtE9TBodB5yDXk9e
         F8cP2/WIvGyMd926F2JYdYJjvUJrm1BM39JBILlaCOer+TNBMZ3glSptxEiFRQvOPXCc
         WtBA==
X-Forwarded-Encrypted: i=1; AJvYcCXLGvFJ97ZTzJWQi3BNHw+JAwZWRcGjAvAFoZvzY0imaXENIK2vkLOOafrO75bLLNpuP29UKQ==@linux.kernel.org
X-Gm-Message-State: AOJu0Yz9bkYa63RzHs0frQenJhzl/G49jVRwYci4q2HzsXdsqLkfX5v+
	MS4R5v1Q4q3dTuOmnfry6qXTqmSuoCAZ/VV0kUtP7+gIy1i4btblIAUPou9nvmcu150RBXTSfQ0
	LKzG/4k8A2SukUQurjVjHt+zh7Gts8WIWf39De9KLrtsIX5eQax9w9bbEbeU=
X-Gm-Gg: ASbGncuq0WAWNbe3TeDYSi+iBmxxe8fJqdZP8D3pURVJvgnvarug1IQyqM4/mTHyngY
	uWZ8jmTNL8tGjCP69GznFXFJAbtXWDsl5NWKAGUisIoXiHL9G0+RTOkW+4y/LINKgRSBxMfSHHT
	qKhz/gAbAhonIxttBS3xS9B9nFO/dgeyLDUnodYpSfb4sdUt196gkPAKK3C8QwyFx9T49gEtSsD
	1SfSxva8bniC+xxXYrXEVfo5qiiJYhGFO/oZTm5BZaiDQTZN2BMyiqQJFxRUq0emFKDW8U8Tfd2
	+CpmTGOKmLrwg/iaQ8sRhTtsDp4OmQ30coK0wIAfwaadGWRjR1wpH5DNxTiWy8Byj4K8W7Q8XkO
	U5vvW45r4tDVDnR/VNk/3E1l4
X-Received: by 2002:a17:902:da8f:b0:265:9878:4852 with SMTP id d9443c01a7336-2902723d410mr446919115ad.15.1760551547248;
        Wed, 15 Oct 2025 11:05:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7EMqd1O/OF6tuTxa78tEOx55DDfv9Sl2/HIYcnSnx/5BcC2UWGUWhpVNlpKV6G+gpVjl4qA==
X-Received: by 2002:a17:902:da8f:b0:265:9878:4852 with SMTP id d9443c01a7336-2902723d410mr446918805ad.15.1760551546848;
        Wed, 15 Oct 2025 11:05:46 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2909930a96bsm2993565ad.23.2025.10.15.11.05.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 11:05:46 -0700 (PDT)
Message-ID: <9769efc8-f995-44e7-a7a8-92aeccd6da20@oss.qualcomm.com>
Date: Wed, 15 Oct 2025 11:05:44 -0700
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: In defense of Link (was Re: [b4] initial "b4 dig" to supplant
 Link: trailers)
To: James Bottomley <James.Bottomley@HansenPartnership.com>,
        Paolo Bonzini <pbonzini@redhat.com>
Cc: Mark Brown <broonie@kernel.org>,
        "Vlastimil Babka (SUSE)" <vbabka@kernel.org>,
        Jason Gunthorpe
 <jgg@ziepe.ca>, Willy Tarreau <w@1wt.eu>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        users@kernel.org, tools@linux.kernel.org
References: <CABgObfY5agTRsB-bCqCYbA0erFn5cVbujtTNBiCti8g_68nCWg@mail.gmail.com>
 <20251011061351.GB23024@1wt.eu> <aOoyhUzNDgwiyl5s@finisterre.sirena.org.uk>
 <20251012232725.GC3938986@ziepe.ca>
 <d884ec6d-856c-4dce-b8bf-cb6116c87bcb@kernel.org>
 <CABgObfaL1Pki1QCgO_vb1Ex_1=RgVwzOmD8Z+q_KnPw3jHwBpQ@mail.gmail.com>
 <19d8800c-c48d-4b98-ae4c-f52053b97ac5@sirena.org.uk>
 <4f9d75f4d024bf9340f5d6936a2a2dd73c6eb1f3.camel@HansenPartnership.com>
 <CABgObfboX1k8FxERevPc-BkNegEJuQVd0E1OjznCkk1BqxQQfQ@mail.gmail.com>
 <fe3500f401a6cd2666c908a73a3db93ef6982e7f.camel@HansenPartnership.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <fe3500f401a6cd2666c908a73a3db93ef6982e7f.camel@HansenPartnership.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: RMtYXELPU3xT_rnCzWBSEAdjG4tCDxjd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAyMiBTYWx0ZWRfX0XlLedeY5Ihd
 10NN9ual1w86VJs/loX9p3fZZAiiTxxYUaxW9u3Ca4hGx6f+LQxFwUVV2Bt7Ovzulj23h8dJ7Jo
 EUKvX3MOpIBHA/tFv4hUVoPzh4/w7O2dREc6UW9XCTtUK9bNkRaYjthqWimJmxy/IlFjgTeJTcU
 6mGnok2Fa04+i0tRIZI0s+4ck0J2Venvh6ycUAgmk0I3zGPuXeNGiW9oS7CQgPmZvj08l15l3v+
 MfF+ZGqcO/I4MuIoA+CK9Zl058bFU8/BEIsZ9DOL0xMEjRABleCTS6lQXT1jmxgILsmPh/Nysjk
 wb0dsbVyhZk4mzXxxt2q78XzIvNpALY4gUodVJntXo7vC8Q1ygrIs/WXOb0hqFh07DcWBOn03Bq
 UQ/gH+UJilFthRZeDaohhh94XuiwqQ==
X-Authority-Analysis: v=2.4 cv=SfD6t/Ru c=1 sm=1 tr=0 ts=68efe27c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=SV4EvT3766SWaHPKV8UA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: RMtYXELPU3xT_rnCzWBSEAdjG4tCDxjd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1011 adultscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130022

On 10/13/2025 5:47 AM, James Bottomley wrote:
> Perhaps what Konstantin should be working on is a server side version
> of b4 dig that tries to pull up the entire patch history (perhaps with
> an AI summary of the discussions) and then we embed that as he link
> still with a message-id last component.

There are a number of kernel.org information consumers who work entirely from
their web browser, so a link of this nature would prove very useful. Of
course, the servers are already overloaded by the AI bots, so I'm not sure if
we can foist this on the servers. But if we could, that would be neat.

/jeff
