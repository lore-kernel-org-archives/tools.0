Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C46D2DB7BF
	for <tools@linux.kernel.org>; Tue, 24 Feb 2026 21:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771970396; cv=none; b=F/QblL1knp5c8MJbgTYLVU2z/Rg/v3Qcd4+nzQOT2MSs69sYQV4Cyy2X5ZgJWX5Rf5iYFRa/nx6oC9LkmqX9oxoYH/wEgUaTHUclB+0Q+sp0fTO2s70SUPV1rstzo7YNKxrqxPo8HlYVCdubUsBwxDqwsqWUzM0cj2IT1bYoiJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771970396; c=relaxed/simple;
	bh=RYh68ZTZZ/shG6Aze7GCKuRt43H8uHQigQFUNzDiY6Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=gndxtKu7pA0WyKM1VMVGws8IORhg+c02Kdln+VkvocYU74JeJqiY323q3WiYJQB6/ip3pOfGqwL9ntspg3+OZ+cqHOGTtR3vdKi9Z+KkzPZUe83K3um0oDgPaARRdFSMY3QlIr2a6PY1ILf/3xkYYLiEWBn0dwI/f/N/tXwGkbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=lht8cQBB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="lht8cQBB"
Received: by smtp.kernel.org (Postfix)
	id 5DEF9C2BC86; Tue, 24 Feb 2026 21:59:56 +0000 (UTC)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5A52EC19423
	for <tools@kernel.org>; Tue, 24 Feb 2026 21:59:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5A52EC19423
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61OJTZVi1879767;
	Tue, 24 Feb 2026 21:59:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=jVll9cvghjUNKhmCkPSgrVLx8bPApX
	gyRh0xgGo99xY=; b=lht8cQBBaxP8scVxaRSCWsZ+CDV30FEfM71DOocwEvI4iO
	qi+2lpd0r6kLaLglcRGUsIkhqsvSJ355ZKB0FzZWl65gB2w1kBRrhMdRO6CRTtYx
	W9VGbso9MaobLdeqSBHbfCCY6v03N7cKW2flSlFGf45V3MNnvf6nGGQhtmVnH9Y+
	Fo1uvz29gPNK5w9Ipp43cFaOXLqvnket1KjWSIiX1NWFMOaiJmTOrlvJJaMzf6mM
	iwLhJJ3BZw11jB6YbWwgtT6RSj7RPmDMkR9leUV98SfH1y698r6i5ydt69MzQ0An
	APaVVOfLtyaN2kQ8mPXLR3C0dPdwzpgmBqwWE1Bg==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4cf34c53wn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Feb 2026 21:59:53 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 61OLXO3u030259;
	Tue, 24 Feb 2026 21:59:53 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4cfrhkapq8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Feb 2026 21:59:53 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 61OLxrMO21299914
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Feb 2026 21:59:53 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E43C758055;
	Tue, 24 Feb 2026 21:59:52 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A8C4C5804B;
	Tue, 24 Feb 2026 21:59:52 +0000 (GMT)
Received: from d (unknown [9.41.102.181])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTPS;
	Tue, 24 Feb 2026 21:59:52 +0000 (GMT)
From: Dave Marquardt <davemarq@linux.ibm.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "Kernel.org Tools" <tools@kernel.org>
Subject: Re: [PATCH RESEND v2] Make edit_in_editor use temporary file in Git
 repository
In-Reply-To: <177196128601.4027376.7838697675997419538@lemur> (Konstantin
	Ryabitsev's message of "Tue, 24 Feb 2026 14:28:06 -0500")
References: <20251118-edit-with-tmp-file-in-repo-v2-1-0b633b471ddb@linux.ibm.com>
	<177196128601.4027376.7838697675997419538@lemur>
Date: Tue, 24 Feb 2026 15:59:51 -0600
Message-ID: <87zf4x246g.fsf@linux.ibm.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDE4OSBTYWx0ZWRfX5QrQHN05+XW3
 Os0asXamK2P4PZIdsqkkCGj1RGT4ZU8wjjg/o0FjJ3pRiMjHCt8ZhjeGxpEmqNLDcaRH2UdTfYm
 F+eOSyCuwvkoo9Eodcuup/tSllyCvBOTsGSqM+Pe1OQinrGFYT86xCHFbTgZpKq1Boy78IY2A4B
 zscAnoWGwPZM/G0C//O60qRQUdlAZGf2yZDaaKk2BNHOQ2sYhuzROFXGpCXtigsRVbNcyixyDTy
 0WtKQcUAH+K2ElVB6DBVRLYD5EudP5KTkVIN0CXgF/kCF+mMiispfJdYzFsfw6byZ82g/rNHGn1
 0ohzoshS4Ut7Yqe3O5GozrLYWqexzhzD5kCQOrEeCivwArxvT16T31O//TbBQc5nJgjjLvsiUUk
 S8qab3fyh2adt46hiunoPEnwGdrgzmpbKZEr1/3HD7tyXt1WUlPe9JUJOsnoyuY2xiG5tJ4Q++0
 XS4mkl3z7kOWQeWGv7w==
X-Proofpoint-ORIG-GUID: 6Br2Y2YYXEgNNJ_ISXywdy19AMgGe96O
X-Authority-Analysis: v=2.4 cv=F9lat6hN c=1 sm=1 tr=0 ts=699e1f59 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=ag1SF4gXAAAA:8 a=VnNF1IyMAAAA:8
 a=i4Q5uCyYQVFG6ZnuuTkA:9 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-GUID: 6Br2Y2YYXEgNNJ_ISXywdy19AMgGe96O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 adultscore=0 spamscore=0
 clxscore=1011 suspectscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602240189

Konstantin Ryabitsev <konstantin@linuxfoundation.org> writes:

> On Tue, 18 Nov 2025 15:34:25 -0600, Dave Marquardt <davemarq@linux.ibm.com> wrote:
>> diff --git a/src/b4/__init__.py b/src/b4/__init__.py
>> index 7689550..cc7623a 100644
>> --- a/src/b4/__init__.py
>> +++ b/src/b4/__init__.py
>> @@ -4575,8 +4575,16 @@ def edit_in_editor(bdata: bytes, filehint: str = 'COMMIT_EDITMSG') -> bytes:
>>      corecfg = get_config_from_git(r'core\..*', {'editor': os.environ.get('EDITOR', 'vi')})
>>      editor = corecfg.get('editor')
>>      logger.debug('editor=%s', editor)
>> +
>> +    topdir = git_get_toplevel()
>> +    if topdir is not None:
>> +        p = Path(topdir)
>> +        p = p / '.git' / 'b4'
>
> Hardcoding `.git` will break when b4 is run inside a git worktree,
> where `.git` is a file rather than a directory.  This will cause
> `p.mkdir()` below to raise NotADirectoryError.
>
> The existing code in mbox.py:395 already solves this correctly:
>
>     gitargs = ['rev-parse', '--git-dir']
>     ecode, out = b4.git_run_command(topdir, gitargs, logstderr=True)
>
> Consider using `git rev-parse --git-dir` to obtain the actual git
> directory and then creating a `b4/` subdirectory under it.

The current code in the b4 tree includes my changes from Nov. 19, commit
ab9639a7685a0e488f7d32783d55aaa2101acc68, and that code doesn't do what
is shown here. I think there were more iterations. I'm not sure why
we're discussing this old thread.

-Dave

