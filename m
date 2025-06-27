Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF4B35957
	for <tools@linux.kernel.org>; Fri, 27 Jun 2025 18:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751048628; cv=none; b=BLIdkJQUd9ad/iYKv1bGe7hV8O6sDWAMksPRjWdbCT2vkcTHnyOBn39xhWjr+jB0mvCbb+Dw9dBYt0twb7iyNbDxhHP5nGDGgplTErsxrJt9jfTG+Py2yqhpJB/QP7OJ7TYetFSxOx2noMaftMcRDXIumYYyeONXNZw7fLMzTMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751048628; c=relaxed/simple;
	bh=Hz7nY3D8owo7MVKLBWo3S+nTtDDZblzHMrlI7fizyU0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=BqJ5DteYswdtwP/P8Vtfj7mgB1GIWGSRKgSESyl8IUJ8juYPxHheZoIg51dASOl/3pxHPplioiW0NtNTIpWNghYwV21UM7/VxB49kFMQqxIrKuZTLAgWqxX/nOXRx1uPBBweXQzi/ZdPyM1hmD70LNy70sRn0Kx+Pvu+Kaf7RKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=l3BIom2T; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="l3BIom2T"
Received: by smtp.kernel.org (Postfix)
	id 878A8C4CEED; Fri, 27 Jun 2025 18:23:48 +0000 (UTC)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A647BC4CEE3
	for <tools@kernel.org>; Fri, 27 Jun 2025 18:23:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A647BC4CEE3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RAkT5A031577
	for <tools@kernel.org>; Fri, 27 Jun 2025 18:23:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=Hz7nY3D8owo7MVKLBWo3S+nTtDDZbl
	zHMrlI7fizyU0=; b=l3BIom2Ta6xzSFauCDgi+l4uWJHcFzaF6hYiIAB5WJgL/C
	qnszxfKIL2Al5zIM8MF01mVPBlDBrWDDQhdtW2j1zCnMTLr6yibgiWbgMFFY6/Rp
	Tp2UuTCCE1ygIYkTtb7IJjfpQkoeYSMosIAeRO+X7PptuIvCio9hxpH/hmjTiAUj
	yfUJUrS6HYC+fcA7cZU3wkTJzMKz6/fLtJSZ8tMjwVV3bJRxQmo2LF6+lOpaC2kn
	+jLZ1W7ZgEOgUjobUC0iZ+jLITqrWUEozaubY2YkFtUrUx4PDxrh2l/4C0aR72Lx
	KzeRFJiYBAiVxOiftoBK41YvhudpVak1/kt0E6cA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47dj5uf3cj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <tools@kernel.org>; Fri, 27 Jun 2025 18:23:45 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 55RILwmt010788
	for <tools@kernel.org>; Fri, 27 Jun 2025 18:23:45 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47dj5uf3cg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jun 2025 18:23:45 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55RGLMYj006329;
	Fri, 27 Jun 2025 18:23:44 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 47e82pnfa9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jun 2025 18:23:44 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55RINica26542794
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 Jun 2025 18:23:44 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 01A0B58054;
	Fri, 27 Jun 2025 18:23:44 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C217B5803F;
	Fri, 27 Jun 2025 18:23:43 +0000 (GMT)
Received: from d.ibm.com (unknown [9.61.173.233])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTPS;
	Fri, 27 Jun 2025 18:23:43 +0000 (GMT)
From: Dave Marquardt <davemarq@linux.ibm.com>
To: Juri Lelli <juri.lelli@gmail.com>
Cc: tools@kernel.org
Subject: Re: b4: Fail to send series with smtpAuth none
In-Reply-To: <CAE-h8tF9rp1B22YhC6PPUFntst9BEZzcCiyy-Mzjq2pQwEnAgg@mail.gmail.com>
	(Juri Lelli's message of "Thu, 26 Jun 2025 16:37:30 +0200")
References: <CAE-h8tF9rp1B22YhC6PPUFntst9BEZzcCiyy-Mzjq2pQwEnAgg@mail.gmail.com>
Date: Fri, 27 Jun 2025 13:23:43 -0500
Message-ID: <87v7oh3uxc.fsf@linux.ibm.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: nZ95DpEzBFLxavofdWvr2Z08TRt1T0Wu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDE0OCBTYWx0ZWRfX7h4a8kQtGWwz eP6/UHvBleuE7F+SG82p/CQpEd8z7+2hNB5FXdeDdRlhAXlj9VmaxOtmhIVh1EA1L0s5q16H9Ex bSVKjdATKssuYNCx9RZQDT7DSt+fCxRIxp6fj0ML6tt/Gw09ofjRG7wSrOEizd82+oQlnDW3l+L
 uEDD9XourBxO0ivzjpuSGqw72fOUZlDyTNqA/AjLci3JZW6JJZY73EBQjrTQhVdBJMSz3LM4zR0 Uo1JCG9iIvEOp61HX6n0F4N3YYa0R5DLxkYLB5fNgW6DWGtKDzPxWMT+pmb+il/zhkdP9fRcMLW ueAZt+fFt8792c6vF7BbLplWM/L+2GjJjGscIGz3W41svWFpCjt/UK0HmfCH1esTVDrYz/wqIgQ
 VfBRvBo7abLwCPuG6ef47Hc5qJBCWvs3cpzLZTn8VWkDxWbvuiZAx91xWy2MWELkMibnrCOu
X-Authority-Analysis: v=2.4 cv=MshS63ae c=1 sm=1 tr=0 ts=685ee1b1 cx=c_pps a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17 a=6IFa9wvqVegA:10 a=pGLkceISAAAA:8 a=v13aIAGV2Valhk8LlR4A:9
X-Proofpoint-GUID: nDqrpNSXsQU_y8v9ussWqkp2p8ditXjx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 mlxlogscore=619 impostorscore=0
 clxscore=1015 phishscore=0 malwarescore=0 suspectscore=0 adultscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506270148

Juri Lelli <juri.lelli@gmail.com> writes:

> My SMTP server doesn't seem to require authentication for sending
> patches, git send-emails works well with 'smtpAuth = none' in
> .gitconfig. b4, however, seems to ignore that configuration and keeps
> asking for a password (and then fails to send).

Oh, someone else is seeing this too! I was thinking about how to debug
this. Thanks for reporting it!

-Dave
