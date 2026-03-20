Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B99C2BAF7
	for <tools@linux.kernel.org>; Fri, 20 Mar 2026 20:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774037814; cv=none; b=GheGgeb7Wpv1lDwOTptdzOk2zo4jzN3EcuNYDb9ajzG+5MFazbtlXaWQii9aBx9hzwlvwfAQ084sQv+r74n0DHE3ELx9Y6jPL5/hjZM0g4+xJAnT59svaeJ6sILJ7EufgQT2upk1t4objtrY2zQ5ZzeXhgQD1bCkm1kfK6hEmj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774037814; c=relaxed/simple;
	bh=oOHzK9ryHFtvMCNPMl2k8h8axu7VIeAgOz6452ipSjU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HMTUKswA54dTBUq0upUC6tW6ocVcHznySIEnTI4r4kVJOmkeAWzNbqoXb0mpPvR9U/rO/U3kpa+naA+NhlxlWdjNdQ/3OK5/I5uODzJZqtLB4us7Q0Ej2pHuPC99TxOFyXgyYD+wHe71MwKdzznp59WC1bb4fbEplbHsoL+6U98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=nbdD93fz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="nbdD93fz"
Received: by smtp.kernel.org (Postfix)
	id F2E45C19425; Fri, 20 Mar 2026 20:16:53 +0000 (UTC)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 04B1AC4CEF7
	for <tools@kernel.org>; Fri, 20 Mar 2026 20:16:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 04B1AC4CEF7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62KISEKB706946;
	Fri, 20 Mar 2026 20:16:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=PG5+YuEBd3eXjUl9N0BPqtxQgSiM1M
	haJERxnTpmmHU=; b=nbdD93fzQ16KhjN9rRfcEkQXT9h3lkgo8Kmwfu45QS64SC
	nF3yZ/i3oFaIfGH9Zn5Y89F+1r+Nr4C6GudEpkSzXVQV3yCz32DZCgqcZDPRlVkS
	jDIbhP304QRB0nM0X82IMYBaHUNTFl5DgHFrt/5vDavsEa7cWam1PUfyCDUgk34T
	3q6s7WJtupwxjyWycQdfhCBdNSMigHUomEksypH8iW8xDObM8c6kMqXwx+doybN1
	4aUnH9O9PC4G/YZPuLMaUM89s+UAE4fNiVuwWFANIv3lPtJNjyzxCif4LypVwqpW
	oRzz3CJNjnASaT1uGgSLIw7a7ggD5HI7qqFGUCxQ==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4cvw3jcgnr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Mar 2026 20:16:51 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 62KHQd8q032320;
	Fri, 20 Mar 2026 20:16:50 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4cwm7k8ped-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Mar 2026 20:16:50 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 62KKGQsM29754064
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Mar 2026 20:16:26 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BBD7958055;
	Fri, 20 Mar 2026 20:16:49 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9805158043;
	Fri, 20 Mar 2026 20:16:49 +0000 (GMT)
Received: from d (unknown [9.61.7.108])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTPS;
	Fri, 20 Mar 2026 20:16:49 +0000 (GMT)
From: Dave Marquardt <davemarq@linux.ibm.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "Kernel.org Tools" <tools@kernel.org>
Subject: Re: [PATCH b4] prep: Make `b4 prep --edit-cover` remove already_ran
 file under $GIT_DIR
In-Reply-To: <20260320-ambitious-hoatzin-of-argument-0b1d72@lemur> (Konstantin
	Ryabitsev's message of "Fri, 20 Mar 2026 16:05:42 -0400")
References: <20260320-fix-edit-cover-with-workspace-v1-1-6023305b0f93@linux.ibm.com>
	<20260320-ambitious-hoatzin-of-argument-0b1d72@lemur>
Date: Fri, 20 Mar 2026 15:16:49 -0500
Message-ID: <87a4w2cl3i.fsf@linux.ibm.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: K7vL_hh6QIUsW8qXsA9UYaP4-9NSLQZU
X-Proofpoint-ORIG-GUID: K7vL_hh6QIUsW8qXsA9UYaP4-9NSLQZU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIwMDE2NSBTYWx0ZWRfX7OCXjrsv4Bza
 DqYYPFiGa2Y5QNymNTPAYA/bhUa/Uiq/if0T8Zd6L5IzyFRMLqX9iPwvhC7gjSioQSvlPRy6dNG
 egEd3w94O3KkzBARqHQzxRmTC/mNNOgrwlqWMvkus5r+ISd5t3Fvu+yTQ+p0pfj1v+/3nNGSA8l
 x686n+Z+aBBrkYiKQLhBIqTPGQCxmH7c+HTb9Ce11APodM0Jr6hjI0bhZpNcweK/iYj0DXgsTzg
 WflioIuHmVlKsoQsjSElgMxEY5v3L5AF6n+0JFsOFLpS1m9mMZ0r6FEVuSwIz9EZZkw1019vn9O
 Qa081fR7m2Od+v2PMgqc5hFnLNBb5uHd8XzUtQiyPHQxdARD1W1qazkFNc+YwssZiSb81LWwHWn
 SD34dy226X/QrP35ccj4SuI/gIP1f+IEm2BdCyJzcxalc3mIYzVvGg6UtHRZLFxZQMcsOi3jw5t
 dDkVE4uW5AngtsqzwfA==
X-Authority-Analysis: v=2.4 cv=Hf8ZjyE8 c=1 sm=1 tr=0 ts=69bdab33 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=ag1SF4gXAAAA:8 a=VnNF1IyMAAAA:8
 a=yO6_pvAJIGNM50E30jMA:9 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-20_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603200165

Konstantin Ryabitsev <konstantin@linuxfoundation.org> writes:

> On Fri, Mar 20, 2026 at 02:57:24PM -0500, Dave Marquardt via B4 Relay wrote:
>> From: Dave Marquardt <davemarq@linux.ibm.com>
>> 
>> 
>> 
>> ---
>> The `b4 prep --edit-cover` code calls git-filter-repo to update the
>> cover letter. When using a Git worktree, the user may get a confusing
>> message like
>
> (Unrelated to the patch contents.)
>
> I wonder how this happened? Is the content below '---' just the cover letter
> and the commit itself is without any message?

I feel like we've had this conversation a previous time I submitted a
patch, several months ago. Yes, I think you're correct, the actual
commit doesn't have a message. I also recall you looking at this before
and I thought you had attempted to fix it.

>>     Invoking git-filter-repo to update the cover letter.
>>     The previous run is older than a day (/home/davemarq/linux/linux/.git/worktrees/ibmvfc-fpin-bis/filter-repo/already_ran already exists).
>>     See "Already Ran" section in the manual for more information.
>>     Treat this run as a continuation of filtering in the previous run (Y/N)? n
>> 
>> There's code in run_frf() that removes
>> <top-level>/.git/filter-repo/already_ran, which may have been left
>> behind by git-filter-repo. This doesn't work for Git worktrees, where
>> the file is $GIT_DIR/filter-repo/already_ran. GIT_DIR is set to a
>> worktree-unique directory under the repository top level directory in
>> the worktree case. This update uses $GIT_DIR, which works for both
>> repositories and worktrees.
>> 
>> Signed-off-by: Dave Marquardt <davemarq@linux.ibm.com>
>> ---
>>  src/b4/__init__.py | 10 ++++++++++
>>  src/b4/ez.py       |  8 ++++----
>>  2 files changed, 14 insertions(+), 4 deletions(-)
