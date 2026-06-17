Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FBA233B6DA
	for <tools@linux.kernel.org>; Wed, 17 Jun 2026 22:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781734231; cv=pass; b=isyuqMxxFRQEiLp5pnX376LHgAn1QQ7PoWH0iau4QN1/r+2jr0CdAWu2ookE5tNK9wb0ESvCnNeNWWz7S2o82qBZusK+Jz0qNnHMR8C6QrPulW9BbJNvUdCA80r/NsxFhfu0MnDNp74wyzabbPo5ufbBV446xRKo46EQVjGUEks=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781734231; c=relaxed/simple;
	bh=dlUW+r0gZZsoKs0/9KaYFfoRgulEIP+1rO0yf4vHEJk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=LZqpQOdjeE+33cywDxAfMHQqIosprcBiB8Q2/Dy7QUGryHsxy8Zp28d9ndE1wBO2BaTWsC0Tnyt2PyZl+ymOElnqL5EgowqCWEuax7uyORm6PHHvzsJKilS63/q0irhLs+tK3uV7LjJBjduj2vZPlMXn4b0oeEBjKZOmefZ7BQ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=rKMDn4cJ; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="rKMDn4cJ"
Received: by smtp.kernel.org (Postfix)
	id D96FF1F00A3A; Wed, 17 Jun 2026 22:10:29 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1781734229;
	b=WmgtGUc4N+iFEfHymOU6M8LdMtCF3AYSpivpHuZvQ4ZvUaTYASSOvaoAjU4WAFVt+saR
	 QVTWDm0SmEFdkecY2Qj1+1jhJotJFaAYKgtPBWVZSkWh6zkmrj65RLqrCT9pBjahPB0hd
	 weVZUgb/F6WPC9TdmoAoyXVaH+0x5VYCltvsWJ7j+ABtb/DJPM51KkNiqiVSDkI7J2ZPR
	 vTbwOi5CpBTzIJGxRgVGxoB/qWiOsL1mOfbtgRshxJqrIr4CW1+1puw85KHBCyR93fvAM
	 Xtb/IyU3dBWZw3xHeQGD9vE57/vVj7kJ0/NNmWhywLSaaD+K0z3IrI0lXTHRom/CaRw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1781734229;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:From:To:Cc:Subject:In-Reply-To:
	 References:Date:Message-ID:User-Agent:MIME-Version:Content-Type:
	 X-TM-AS-GCONF:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=8zcn7VjCz2gLW/75uRg1ZstJJWo+8ZbmhsIlXFxgaQc=;
	b=z4WHhpKzAApfodqOT82fsxKdHN7+6xqtFOXKSpO7d8pcQxLRNaMryqOuyaxhjlChl1dm
	 jZFs+mE9zmXHJ41ep9acZNWA2XDQHdsW3Hs2KRTd2J9T74RflNCyR2t15I6c2X4mYiPPO
	 vMtm1CS6fmnGf1JlXTBOAmk4dZ545DGUmXryaCycX/exhAMTihMuI5I31n1Lw0pZs3i1f
	 FIwuPkyArRXm+XsuItvasGhnYyDDKO4S58xFgtLMwhQT2V34OEsp+sUUwlDIDviQD9fWI
	 xeITj3bWWjbr2HwXJ33hFKCvyWxH+NFoeRsz5ubGh7NH0LieqPnANJSjAYfFfVPVK1A==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rKMDn4cJ;
	dmarc=pass header.from=linux.ibm.com;
	spf=pass smtp.mailfrom=linux.ibm.com;
	arc=none smtp.remote-ip=148.163.156.1
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 447AF1F000E9;
	Wed, 17 Jun 2026 22:10:29 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rKMDn4cJ
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 447AF1F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65HHmL1O1106778;
	Wed, 17 Jun 2026 22:10:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=8zcn7VjCz2gLW/75uRg1ZstJJWo+8Z
	bmhsIlXFxgaQc=; b=rKMDn4cJyjpQ+exJrp3c8uO7yVybvIjhJMkd2Gy3kBdaSY
	l7U7qloL+BanxH1uCNg6h/pLgRg7XNnGZPcZXZuWq6GwxCQc7j9WcdEvxtA53cDu
	UW2kUwn67WB6zXV8GeJw5mriSlpYhufqlCFTrrMt5wbwc33NOMQ9V3c48boA3qVU
	6dkoY5KK2Jj3Dyipn1NtGzE/SY44y8wrEmfnL1WJDXNYEc7O4tJYcEUiSUvxO8cF
	BjF5/v8t5csAQg2TZyQQRyZ17M0ZKozh7LGPhhCts7C1hw42q4zMerfn5ISK/Bl7
	2v9eU1tpgExWW9M4mq6kUKEG4ipP00Qi7hgxHenw==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4eueqtn8ee-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Jun 2026 22:10:28 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 65HM4cg3000672;
	Wed, 17 Jun 2026 22:10:27 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4ev1720q9h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Jun 2026 22:10:27 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 65HMAQ2g16319050
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 17 Jun 2026 22:10:26 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 756BA58057;
	Wed, 17 Jun 2026 22:10:26 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5918358058;
	Wed, 17 Jun 2026 22:10:26 +0000 (GMT)
Received: from d (unknown [9.61.134.149])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTPS;
	Wed, 17 Jun 2026 22:10:26 +0000 (GMT)
From: Dave Marquardt <davemarq@linux.ibm.com>
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: tools@kernel.org, Tyrel Datwyler <tyreld@linux.ibm.com>
Subject: Re: [Tyrel Datwyler] Re: [PATCH v2 6/7] ibmvfc: register and use
 asynchronous sub-queue
In-Reply-To: <20260617-true-spiked-wallaby-4834ad@meerkat>
References: <87h5n3o69j.fsf@linux.ibm.com>
	<20260615-smiling-kelpie-of-temperance-4dd61b@meerkat>
	<87cxxqodez.fsf@linux.ibm.com>
	<20260617-true-spiked-wallaby-4834ad@meerkat>
Date: Wed, 17 Jun 2026 17:10:26 -0500
Message-ID: <87eci4yg19.fsf@linux.ibm.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: uwk7sO8bRLa0vbNAFTmeWGBOb-qC-roE
X-Proofpoint-GUID: uwk7sO8bRLa0vbNAFTmeWGBOb-qC-roE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDIwOCBTYWx0ZWRfXzXv7r7QeUnHE
 1uEnawP54xafo5WhWggyHGbacLxdrK0PBIvUyRYIMPhG8lAk78Q0iQIGcY2ReDImVq6IX1554uT
 orB2UjpJklHOFNN2iV94MAKinAt/HK35Uadp9MhXeFqSpLvVZ+uULN842vjz4NQBP2sGt9lrIfc
 LrONLYVdE/ZmoRn7Xg/I98MYVap6w0/OuZXJS4+zB40kyEd+pfhE5z458ZvK15KEIsDz1nUb+Iw
 7APhjokADKrroesyjJuXbdndlvdLzmPAOQLE/IWzQdVxSXtZId6j2Gl7RW+oWjUGFtkjGS+ZpDc
 v7A4SMFnbEpNUCkFmXu5Z+Jp9WQt3k6KqkGS/cWbp/BP4b37K3DHaQZKY6vRU9MtnO8S3OuihoC
 IWFUYE6u1NTVIs1KTPm+0qSYr4+NkrjRs9rPAe69I/lB1at1c/0HVK90UnpgOLGqToexpaX7BT4
 b1fn7ToOnYJlaHb8vgA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDIwOCBTYWx0ZWRfX7DBESf0G2y4U
 zAifxp7+XXARXf/ChTi/REk1wDkxrmTGPso3TwRg4iENNXHwSqzOkaEv/eIabmJ72DLp4t8IY+a
 fwGdDad1hwUETNXRwf5i/z3hlrdyYvo=
X-Authority-Analysis: v=2.4 cv=B4KJFutM c=1 sm=1 tr=0 ts=6a331b54 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VwQbUJbxAAAA:8 a=nOipqOGIHY4C__rgqX4A:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_02,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 spamscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606170208

Konstantin Ryabitsev <mricon@kernel.org> writes:

> On Tue, Jun 16, 2026 at 07:52:36AM -0500, Dave Marquardt wrote:
>> > You can either manually run all commits with -s (which is what I do), or you
>> > can set up a hook to do that for you automatically -- but since it's supposed
>> > to be a deliberate action by the committer, I recommend just always
>> > remembering to add that little "-s" after "git commit".
>> 
>> Thanks. I searched and searched the b4 documentation, and now, from your
>> explanation, understand why I don't see anything about Signed-off-by:
>> when submitting a patch series. Would it be worth adding something to
>> the manual? (Yes, if so, I'm volunteering :) )
>  
> I don't think so. The Signed-off-by: is common, but not at all a requirement,
> and since enabling/adding it must be a deliberate and well-understood decision
> by the commit author, I don't think it belongs in b4.
>
> I know we can spell it out in the b4 docs, but I don't know if people are
> going to be more likely to read them as opposed to the actual kernel
> documentation.

Fair enough. Thanks.

-Dave
