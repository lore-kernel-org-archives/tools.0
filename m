Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A02C3CBE6D
	for <tools@linux.kernel.org>; Fri, 20 Mar 2026 15:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774021812; cv=none; b=M4O/dhAc2NqmxgtiNYojua7xdF5aOsfZoA+w0yMAnct/SGIQODjF2q3lVSvSPhGQ4WlrfSWAjLCZRotd46pkxrBYGdbif/G2tPNCWpkSPMdD401cbLgE1MDQ/hJNNgqtYN+7QNOZIG9Yrh3/iGE6ccTK2m9S6XDa38vKaZ7/HMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774021812; c=relaxed/simple;
	bh=jFX46JHJz/ErqicAsyDHCAv3CpqkXqbo6K9+fsxJs68=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=MyfAT+SpIFy0ceApKGhZvctSPo4/cPsu+1q3U0PY+4wAMYOx1MSx7vV8aBkgx9nyqzAaczzDFVVOkbUlcJjig7RsJaFaBvly3R0mDgFGGWVPlQjov84i7OHsA9GjRPyo/HvQ1gw34GtgzGg3CkTCYVyk1NLVoqsxi4PtpSfUHSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=EVI/gCfF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="EVI/gCfF"
Received: by smtp.kernel.org (Postfix)
	id EA0B5C2BC87; Fri, 20 Mar 2026 15:50:11 +0000 (UTC)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 034AEC4CEF7;
	Fri, 20 Mar 2026 15:50:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 034AEC4CEF7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62K2k6hk788085;
	Fri, 20 Mar 2026 15:50:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=Er0yLd3GmpWbPj9LkmHUHk7fh/pf/r
	moe/sBk1766g4=; b=EVI/gCfF1OYgPz4J1hJuFqvHv3ThZhrwJpDNlPBWpbKfHX
	vqye9oBwkzkdL/zelprTW1LlZkSKtgm1/OBH4zJbAbf9OdkojFUiIdq2f0ItnpgY
	xUxdFD860Zsy3mNEhYGNihyTzN4agOXcLOE36xjwr7VIFWEAX08m6G8vyqwsSJ51
	fbvTQk9/heEsLUbSL4HbHjf6DNPC4qZpEe06ri9K/ToieUIPE71EwuIQdS80w4Tt
	rttjO3nXKSHl95T0c/48+eTeMPx3TnvS0l1zJ48MeD5f9UddtOlOzOddlrCYU5eM
	NcFVtZqoAXvcy4JDSmkwGnLD7uA28MKzz9XLIWBA==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4cvybsm9tk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Mar 2026 15:50:09 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 62KDTNRu028496;
	Fri, 20 Mar 2026 15:50:09 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4cwmq1qhmt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Mar 2026 15:50:09 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 62KFo85p29557438
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Mar 2026 15:50:08 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AB5C758055;
	Fri, 20 Mar 2026 15:50:08 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 923B858043;
	Fri, 20 Mar 2026 15:50:08 +0000 (GMT)
Received: from d (unknown [9.61.7.108])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTPS;
	Fri, 20 Mar 2026 15:50:08 +0000 (GMT)
From: Dave Marquardt <davemarq@linux.ibm.com>
To: Matthieu Baerts <matttbe@kernel.org>
Cc: tools@kernel.org
Subject: Re: b4: prep --edit-cover emits strange message about "Already Ran"
In-Reply-To: <4c5b1214-e3ce-4da0-bede-6ee7ab252217@kernel.org> (Matthieu
	Baerts's message of "Fri, 20 Mar 2026 15:52:54 +0100")
References: <87v7eqd0lz.fsf@linux.ibm.com>
	<4c5b1214-e3ce-4da0-bede-6ee7ab252217@kernel.org>
Date: Fri, 20 Mar 2026 10:50:08 -0500
Message-ID: <87eclecxfz.fsf@linux.ibm.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=MMttWcZl c=1 sm=1 tr=0 ts=69bd6cb2 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=uAbxVGIbfxUO_5tXvNgY:22 a=VwQbUJbxAAAA:8 a=JJMOmphfiCO0zuuMRckA:9
X-Proofpoint-ORIG-GUID: 10d9Y90ImxuBeO_HnYCxJfDnfQnY7XEy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIwMDEyNiBTYWx0ZWRfX6PINxE3SL7Nu
 Yw5MzAdFxlGdwZKKuufeKj5hggOVXWLOOOmFe/0Y7U8ZpYuys2eowPWuL59A9nwAPUQ948Ouj+f
 /J5fzKPx8CERbOmUPOA0nK3ipfFI4pdXF/OQTnTiAmj3s2aydKqM5AVjNDfxrPGcNonwH+rYGu2
 D4Q6BBkWsuHGGdpTZFfoXZS6uYxZMa/YtFWxVLxy5FNUNQl5s89xAz5ABJP7TN/Fzx44fgIMY6j
 U5YeJCc+7HpjpfxLMkgQx3MCS+5mmQdP7xwVv4x1BvicIdUmOYS3hA6zc/9vpTOe60QgQG5b3nZ
 PspXGeX0ULek0hfiQZY7hKszssT86W8xnmo9eT0SxJamER72PB4IS/MM4bhWu0xJnxI+4TgPfxL
 5Tk/6VT4zOH+h+OX81lU/eRCZO6RpDhpG6REC/OahV3Wvjt4ESKU29DCQpVRQ7YIPFcz3Ln7vO2
 NY0inngGLUMoxdxFQbw==
X-Proofpoint-GUID: 10d9Y90ImxuBeO_HnYCxJfDnfQnY7XEy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-20_02,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603200126

Matthieu Baerts <matttbe@kernel.org> writes:

> Hi Dave,
>
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

Okay, I have this code in my local version, and I think I know why it is
not working. This code uses

    gtl = b4.git_get_toplevel()

and b4.git_get_toplevel() uses

    gitargs = ['rev-parse', '--show-toplevel']
    lines = git_get_command_lines(path, gitargs)

But git-filter-repo uses

      git_dir = GitUtils.determine_git_dir(b'.')

and that is

    d = subproc.check_output('git rev-parse --git-dir'.split(),
                             cwd=repo_working_dir).strip()

Since I'm using a Git worktree, "git rev-parse --show-toplevel" and "git
rev-parse --git-dir" return different values:

    $ git rev-parse --show-toplevel
    /home/davemarq/linux/ibmvfc-fpin-bis
    $ git rev-parse --git-dir
    /home/davemarq/linux/linux/.git/worktrees/ibmvfc-fpin-bis

So the b4 code is looking in the wrong place.

I'll send a patch for this.

-Dave
