Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 347BE23A564
	for <tools@linux.kernel.org>; Fri, 20 Mar 2026 15:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774020423; cv=none; b=Ne2lkN3STEIjJaqNXGPKcy+u9bhbnM4iZOLLvoZfDeJI6c1sBhc6zB0do8/mvo+vMkIN/fMH+MRhyjUf0YodE4EEtwmvoQyT6vyXkk1+rrqf8pROEy/3ui6e0kmr8Z9DNcP9kSTtx3uL9fkQwPm7hl4ZG8YLY9+Omv/NgEiFAtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774020423; c=relaxed/simple;
	bh=TvGaRRFCkE57B5CFzc9uLXv7oflEz0VKahhqsWT1VY0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=B5HcGYZBwJm1uHZo9SUj8WV3K2CV49Go9faJeNDQBeK9pJd6Qg/MCPOVKiOe0fpnt1vubQ/Mfb0HxDKwnzMUV4uKjNKMvtFrl9Y+5ZRjq3eEzPSHRgexrtpkBd8NA7C2Wh8Gw5OyvL+/Hw2a62v2UDGuKXWt31Au1UDsZezEbvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=sg2rvioF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="sg2rvioF"
Received: by smtp.kernel.org (Postfix)
	id 02867C19425; Fri, 20 Mar 2026 15:27:03 +0000 (UTC)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 13AC8C4CEF7;
	Fri, 20 Mar 2026 15:27:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 13AC8C4CEF7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62K8bNKK734854;
	Fri, 20 Mar 2026 15:27:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=Dqb26QKhERXavfubplVcNPWQoXUbVw
	V9+BmSnH6yOhs=; b=sg2rvioFdH9EE2FSzCzE1zO8ZrUWDLPC2rFBzza87QYX2/
	BW2+5z9d3yy/tZ3VSel11fSdeL6TqU/AM6eiC3qQF24MtG+l9MyGz6fupspqDClk
	uyIOPzwTKot2pSlpvWVd2GAdDdSGmcrLCZD6sYgENg4lL4hy9StWCLixQ6N8wA/i
	/UqWfIFDHc2B5Ai+lLjUOv7JZzEWQ7njzPXe/AMMbbOXyrE/LLvAZ4vz4XV8n/Pp
	TreTdXJldYpHTG/sruWu8OZYN74Zk8mzAuK0hHz4G1qrRyxArlvI4j/ukV/LXz/1
	vUlrFvXy3C0PkvAZ6QVsjxCMnD9L0wkccoyJitZQ==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4cvybsm7ej-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Mar 2026 15:27:00 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 62KBdVW6015648;
	Fri, 20 Mar 2026 15:26:59 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4cwk0nqpfm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Mar 2026 15:26:59 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 62KFQxnT44958172
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Mar 2026 15:26:59 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1906D58059;
	Fri, 20 Mar 2026 15:26:59 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ECBBF58057;
	Fri, 20 Mar 2026 15:26:58 +0000 (GMT)
Received: from d (unknown [9.61.7.108])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTPS;
	Fri, 20 Mar 2026 15:26:58 +0000 (GMT)
From: Dave Marquardt <davemarq@linux.ibm.com>
To: Matthieu Baerts <matttbe@kernel.org>
Cc: tools@kernel.org
Subject: Re: b4: prep --edit-cover emits strange message about "Already Ran"
In-Reply-To: <4c5b1214-e3ce-4da0-bede-6ee7ab252217@kernel.org> (Matthieu
	Baerts's message of "Fri, 20 Mar 2026 15:52:54 +0100")
References: <87v7eqd0lz.fsf@linux.ibm.com>
	<4c5b1214-e3ce-4da0-bede-6ee7ab252217@kernel.org>
Date: Fri, 20 Mar 2026 10:26:58 -0500
Message-ID: <87ldfmcyil.fsf@linux.ibm.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=MMttWcZl c=1 sm=1 tr=0 ts=69bd6744 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=uAbxVGIbfxUO_5tXvNgY:22 a=VwQbUJbxAAAA:8 a=tvlIENwqjR91iMBqUG0A:9
X-Proofpoint-ORIG-GUID: K5K5eOYVnJk5dSLPiq1wJCMbMkgR0zoB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIwMDEyMiBTYWx0ZWRfX+rdtkxW9rmmb
 J+UVOQNb8yOdxz3EcEYs+B03jivBCXqhF+0zdU+NZnkSdiTQrxXCNw24kBDOawzb9WZXHkUhfjq
 5qbGb+LP7Un4BrkTgbIHhg83lsylAI7vjhuuPe9qJP/nP0JJ6EMxqSbONXRFpLxHIkRZJlmBwkb
 vXExlv+zg6LEZJYKjWRoCbAQIFu1xOp2RaLt4w6b7VJO7nesluw/eMlwn82kAW5zAjifS1qjqDW
 pNUDK6o8WkgDre1nR3P9yL2U+GjQhBulNHivKiW1Zriw2GV2G60HhrPPc+C/0yATkPVD2pvnmjP
 7Grxp3tKeTNcegcpKiOniGPk0STl1M8kKvg5gDDNLJ0HRj2DkC/qUcTp8L1GbipI9CHkanFw61h
 0RotBQ8HrA6uEJWUHQXEn0xagIQGfhGwQaOBSgizCkEUGEf3TubpgS7WdGETTRrv3d9HlmfqX8O
 2vdo/pL7Im1JpyHnrFA==
X-Proofpoint-GUID: K5K5eOYVnJk5dSLPiq1wJCMbMkgR0zoB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-20_02,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 clxscore=1011
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603200122

Matthieu Baerts <matttbe@kernel.org> writes:

> On 20/03/2026 15:41, Dave Marquardt wrote:
>> I found the message here a little confusing, and had to go code
>> spelunking to figure out what it might mean and how I should answer the
>> Y/N question.
>> 
>>     $ b4 prep --edit-cover
>>     Waiting for Emacs...
>>     Invoking git-filter-repo to update the cover letter.
>>     The previous run is older than a day (/home/davemarq/linux/linux/.git/worktrees/ibmvfc-fpin-bis/filter-repo/already_ran already exists).
>>     See "Already Ran" section in the manual for more information.
>>     Treat this run as a continuation of filtering in the previous run (Y/N)? n
>>     New history written in 612.22 seconds...
>>     Completely finished after 612.53 seconds.
>>     Cover letter updated.
>> 
>> I first searched the b4 manual, and found nothing about "Already Ran".
>> Eventually, on reading the b4 code in ez.py, I found this was from the
>> git-filter-repo package and I should check its manual. I found the code.
>> There's no way to opt out of this check and message.
>
> Yes, there is: simply by removing the file. That's what b4 is doing for
> a while, and it has been backported in the last stable version (0.14.3):
>
>
> https://git.kernel.org/pub/scm/utils/b4/b4.git/commit/?h=stable-0.14.y&id=e5369681808b
>
> Is it not working on your side? If no, which b4 version are you using?

Yeah, this is weird. I'm running 0.15-dev, which is some snapshot of the
master. I just looked at the code that invokes RepoFilter, and here's
the code:

            frargs = fr.FilteringOptions.parse_args(['--force', '--quiet', '--refs', f'{commit}~1..HEAD'])
            frargs.refs = [f'{commit}~1..HEAD']
            frf = fr.RepoFilter(frargs, commit_callback=fred.callback)

So --force is what should remove the file, and for some reason its not
working.

I'll debug at my end to see if I've found a bug.

Thanks!

-Dave

