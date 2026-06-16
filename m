Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7E831714A
	for <tools@linux.kernel.org>; Tue, 16 Jun 2026 12:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781614362; cv=pass; b=VAs0t/R08KefwnecO8jsHwF4Bg73C6D7xd0vUCGxwW7ntZveaPFoHabP8IoCD3XHhgWYM5qGjjQsnz4abo7LPH3gwrUvUHX94Igg5q67m7kL+MO0AYmSkma11d4nj/UOJpUfH1lGRA4q7LCCWiKAR4t459C0njEV8yHK23gbxek=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781614362; c=relaxed/simple;
	bh=anWBRhrrlUvXNHWiTzWePc9cDaUqJEcyi60rrtaT2Hc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=PEGCFQRnexDqDM/dhhkrV8ZMhTUIrAAhm6BLpEaC+lXhSjujDX0lxYScsTJb6GahB6NXzG1jhzWD+U6+MvTjWArvejtdJMfaHDsMevEbt92itwhaHUFPVhe80ELjAbM1MF3M/Ozj99chPvZ3JcnKubehweUy5XjW7CbgOd5cDQI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=Dc3aiUXA; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="Dc3aiUXA"
Received: by smtp.kernel.org (Postfix)
	id 91E5C1F00A3A; Tue, 16 Jun 2026 12:52:41 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1781614361;
	b=w+XwhNTbcTmBjQI/+JOpd2wYckSzHGu7SBPbIX07WyRBAA5g61DKWzLSdp+EsU2U6TEl
	 2XGZVfgx4C7p0dtlXnEwgyYsHpvwHGEd0jOnKx5JKdE24MhEccvmMFT77jedUUvLfgjMZ
	 jwWF4mFmDOHXr8rfNX7p/VjqfSrJj9lER+LwRw4T60s/3eEyuIIN2lpDn3ZpsEo9rKiK3
	 FHmtGIbJyQmcaVsTAkkKy1QJzpr9APZSYd/PSt8ZrHZWXYsdKmI21q2dRnRhLM9enTQqQ
	 s8mSfjGBqoJ7lelrk4IJWo2pQHap5Btrd0k5XIjHSnwhHIX5UgN5WINjbLwArRNco7Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1781614361;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:From:To:Cc:Subject:In-Reply-To:
	 References:Date:Message-ID:User-Agent:MIME-Version:Content-Type:
	 X-TM-AS-GCONF:X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=0eLShnodH+ucQpLXxXtfKk9Mjykr+JnjYDrX0kMskCI=;
	b=EgnYASYdUGKsocpXa2/KsYysgEzJ3Iuzkilw0jmpEarWQP1qU7zNOIDMPw1pplUiU3Hi
	 +o36gMj2B5RvlVA1mkIhysS8qLn7rapCe4wU2B9u50VGYkQoEiSli279X5bC+HI25cUQC
	 N+GleekLqa+ozhnrFCzE+tOHN7fN7yilTIqZQloni147cnKP7X/m4U1QRE+UvNjIADSfJ
	 rx1oLXI5X0cP24Boo0yYYI3/WIMbYE8HtzEDst08L7fdL5aewDGRQGLvZsj8JxewrURHN
	 PdbWet9u7db1F8AYaQ/xjp7xysbBjtsGP6sTfIlH2pY8PawBmIBG7HJOVgbcxjHdu8A==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Dc3aiUXA;
	dmarc=pass header.from=linux.ibm.com;
	spf=pass smtp.mailfrom=linux.ibm.com;
	arc=none smtp.remote-ip=148.163.158.5
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DFFAA1F000E9;
	Tue, 16 Jun 2026 12:52:40 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Dc3aiUXA
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org DFFAA1F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GAIV7x1156302;
	Tue, 16 Jun 2026 12:52:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=0eLShnodH+ucQpLXxXtfKk9Mjykr+J
	njYDrX0kMskCI=; b=Dc3aiUXAj+fJBBBvHGKfFdUUGjcl2y2tj8Wmoq0kkQT2p7
	9P+NY2D8j5pxtrbsUV4bYv+jmAtZzTd1y9EdodDIIlV5dg/MyoKE9uT5hcZbV9OP
	1XXaBWu5xmj5kdoMWLHKWWV7NyzVM64iUS8N0ignOG7XjkeYitqifvuAm0e7Uhu+
	y03FildgzCmNszBiqn3vbZvBeaBh0lZn3wrVnrErZ31rz6sVWq2jFubwgPUcabLG
	Y55wtxvv8G1WGGhWqPE5wdGvthyuV+TeZDMvfUzxpqeevEtqzcRLh6+U+LDh4lo3
	zRDLUokfVy9IdsM7JgbJkz8SISFHMrmm72EAZC5A==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4es1eg55gs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Jun 2026 12:52:39 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 65GCnbpE026987;
	Tue, 16 Jun 2026 12:52:39 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4esjhk3bkd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Jun 2026 12:52:39 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 65GCqbGh27787858
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 16 Jun 2026 12:52:38 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AFEE358059;
	Tue, 16 Jun 2026 12:52:37 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6FFE55805B;
	Tue, 16 Jun 2026 12:52:37 +0000 (GMT)
Received: from d (unknown [9.61.20.230])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTPS;
	Tue, 16 Jun 2026 12:52:37 +0000 (GMT)
From: Dave Marquardt <davemarq@linux.ibm.com>
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: tools@kernel.org, Tyrel Datwyler <tyreld@linux.ibm.com>
Subject: Re: [Tyrel Datwyler] Re: [PATCH v2 6/7] ibmvfc: register and use
 asynchronous sub-queue
In-Reply-To: <20260615-smiling-kelpie-of-temperance-4dd61b@meerkat>
	(Konstantin Ryabitsev's message of "Mon, 15 Jun 2026 17:51:39 -0400")
References: <87h5n3o69j.fsf@linux.ibm.com>
	<20260615-smiling-kelpie-of-temperance-4dd61b@meerkat>
Date: Tue, 16 Jun 2026 07:52:36 -0500
Message-ID: <87cxxqodez.fsf@linux.ibm.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDEzMCBTYWx0ZWRfX1mVCeCb8Z7ew
 lk8NHxe45Zj3z9A2iWESl6gUCjzFSn28iNDTsp0MFxnCsth/LCCU0hSA5R2RY8vTeuD9rFBciWj
 WAqxevWdYNutoKo9rwqqIqHFXDDLG7c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDEzMCBTYWx0ZWRfX9ZrfpY/NWLuK
 vuMiDEROKGQiiqNKuXmyP6oL4GjEUfSOmEXIPUmd9gGuGaabpuPUWdwltiiLWPQe4QfvJqhiOdX
 3dRX0Sxgww6+o6tCiFnGqVVQtDnbWK4OQWDBSjaWN9zEFAtF/fixJAXrVvoCcH+ZBiC+nzSbtEg
 Zg7GspepHzjmQPPXcnPPJzGbKQHT+e8iQUdQ+McpjURS1dl3LPYVsOaXAWU/lLvz8f72f2iWGIO
 cr3mViBYydKFY12vt2cDQTHzrU4IT5flMqfE9ovK1fBktMu3GHKZGmZ7yMjbxToTZDTIu/psHkG
 cuk/lNVxM3ymzXmuCZjDhXIdT0XHv/EHLGDcxA4GZmBOCDOnupHhVu0twLK/Pdi88ZDA1TKVaNR
 XUkEF4S+Zp+gYah8b8IzsuMSUBPlUENYi/SRQNEP3ugzcuCo44+aZZye5OTHIaNY0tuboDlgA1i
 tCyg2ZoY87HiSBoBY9g==
X-Proofpoint-GUID: ESTX7CSkBcz9oH3pAdymvKnGvpVNBffI
X-Authority-Analysis: v=2.4 cv=NuDhtcdJ c=1 sm=1 tr=0 ts=6a314717 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=V8glGbnc2Ofi9Qvn3v5h:22 a=VwQbUJbxAAAA:8 a=fyQQCtO3a4J-0CZA60EA:9
X-Proofpoint-ORIG-GUID: ESTX7CSkBcz9oH3pAdymvKnGvpVNBffI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 impostorscore=0 clxscore=1015
 phishscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160130

Konstantin Ryabitsev <mricon@kernel.org> writes:

> On Mon, Jun 15, 2026 at 04:14:48PM -0500, Dave Marquardt wrote:
>> 
>> Hi Konstantin. I'm using b4 to send patch series. I get these comments
>> about not having a Signed-off-by: tag. Should the tag be added by b4? Or
>> should the patch attestation be enough?
>
> That's not really the right way to put it. Different projects will have
> different DCO requirements and it's not up to b4 to enforce the presence of
> trailers. It's not the same as patch attestation -- the attestation's job is
> to mechanically attest that the patches haven't been tampered since they left
> your system. The Signed-off-by: trailer is more about the actual code you're
> committing.
>
>> I do notice that "b4 prep --check" flags some patches as missing the
>> Signed-off-by: tag, particularly when I've chosen to not fix some
>> warnings.
>
> It's speaking to you, then! :)
>
> You can either manually run all commits with -s (which is what I do), or you
> can set up a hook to do that for you automatically -- but since it's supposed
> to be a deliberate action by the committer, I recommend just always
> remembering to add that little "-s" after "git commit".

Thanks. I searched and searched the b4 documentation, and now, from your
explanation, understand why I don't see anything about Signed-off-by:
when submitting a patch series. Would it be worth adding something to
the manual? (Yes, if so, I'm volunteering :) )

-Dave
