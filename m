Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1991F7575
	for <tools@linux.kernel.org>; Tue, 18 Nov 2025 22:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763505730; cv=none; b=b+Bjc8nLSD7a3kxXE0r2eKOUSAXYHuzeeMmWvP3fNUEv5cgw1Ax8GO/VyhpXVZi4SFVlowi/qng9yONVNVNUpsn1/oz6EKWL4DKmaKY58ALnwTi8ZiOXDF/ifEg0fr14tbd4UiTCfPg5vac8YdpQ3UKdcutbdGAhj0ode8ulvQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763505730; c=relaxed/simple;
	bh=vj6kBpCMrFM0Z6vHsj0mtICX9AAYhlLpEKyN4BJbCuc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=E59YrwFEAuaoNogCK1nmpZaZxL771XeBLSHGn4ZOuDzdXYA5QqRE5+oibkyOiaj7DUnnfcGb2Qzw8QZcAC+zD49SrxSmEGNLAcD4Au7K4UZY6O1osM0exnIROhQzx8eQ9vqvcTPo9fZ5Xau3j+0K/d3Dr8v+ABBvNySezq7RhXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=b4y7hPid; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="b4y7hPid"
Received: by smtp.kernel.org (Postfix)
	id 26691C4CEFB; Tue, 18 Nov 2025 22:42:09 +0000 (UTC)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EE2A8C2BCAF;
	Tue, 18 Nov 2025 22:42:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EE2A8C2BCAF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AIHtWWN003458;
	Tue, 18 Nov 2025 22:42:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=+qBK/jsJm9KSjVGWG/6I7k+E1ufyni
	ETOv7Y5B0rbIA=; b=b4y7hPido11J0/WROiy3T6AuZ6S3OmfIZueWpowic7NV94
	n6OSeWRqnXGH5lXKXzjxZATBBRxyhNXNrkEzfL02PGvLMGuQ2rI1VSV4xI8ElL3h
	0+TqnFMBcvarUXs69Sc4KuEE2zlmbPlrv8QOoCvUkaTGtQBksWzqbKS6TjI542ES
	JiLQ+DmSt7675kW1Ou1tWy1CafX5/uuCNwp1mrtpjBW4rYHt7CjGUcpQUWcgY4Sm
	Nro3ANgPQLzVUoj8kEqeCvLoBHcqoSYZXuq/lmz+e78QDF/k/3l9twDW2fzRaKJm
	JRN6uai4f7A6Cf4z06koSn4YhQopspAjzl+aoRBw==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejjtvwvb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Nov 2025 22:42:00 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AIJ5oSg005111;
	Tue, 18 Nov 2025 22:41:59 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4af5bk5j4p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Nov 2025 22:41:59 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AIMfwng32965132
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 18 Nov 2025 22:41:58 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6618458060;
	Tue, 18 Nov 2025 22:41:58 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 258D158056;
	Tue, 18 Nov 2025 22:41:58 +0000 (GMT)
Received: from d (unknown [9.41.102.181])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTPS;
	Tue, 18 Nov 2025 22:41:58 +0000 (GMT)
From: Dave Marquardt <davemarq@linux.ibm.com>
To: Dave Marquardt via B4 Relay <devnull+davemarq.linux.ibm.com@kernel.org>
Cc: "Kernel.org Tools" <tools@kernel.org>,
        Konstantin Ryabitsev
 <konstantin@linuxfoundation.org>
Subject: Re: [PATCH RESEND v2] Make edit_in_editor use temporary file in Git
 repository
In-Reply-To: <20251118-edit-with-tmp-file-in-repo-v2-1-0b633b471ddb@linux.ibm.com>
	(Dave Marquardt via's message of "Tue, 18 Nov 2025 15:34:25 -0600")
References: <20251118-edit-with-tmp-file-in-repo-v2-1-0b633b471ddb@linux.ibm.com>
Date: Tue, 18 Nov 2025 16:41:57 -0600
Message-ID: <87a50jrmiy.fsf@linux.ibm.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 4hUWxFvzPEimyo3hV0Y4VOwM2XPh1inT
X-Proofpoint-ORIG-GUID: 4hUWxFvzPEimyo3hV0Y4VOwM2XPh1inT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMiBTYWx0ZWRfX0nbFzJjdZa+L
 yVhjy5xnPaqxcWjZJ4EOTnWnlJT8osvm6dyVu6kkfzwImjkPIbaqqsPQtzf1dZ7HWu+ZsQm2lpm
 mJSoj4cXTZXngvImH5nxFhadTsPDGJD+1Q06JNgTIaKugoSWZZY4/Gwq+442j7GSzq/ds3nvbrv
 XjvALEjouXNmrG/Sy/t5Dy2ZHty9j9RYWJijOjsSeNFawex4trOaKOY9pIH7tnXrAeg4MFEAjD0
 SQh3p8gPbfsdvzvg164vykf0w0AM04K2jt8M/MukJaNZ8om7Wiyv/mmt8/sxraUXn5cBPFb3cka
 ZmJnI8CqbsF+2jHWhXLYM8VOWp5A2pcDbNByUlAcwTTl37HGbeg+wmJZwX7vpUxCP+xyGrhO82L
 wIb27ta4ozAfousG9xzCuEqtSkHeWQ==
X-Authority-Analysis: v=2.4 cv=SvOdKfO0 c=1 sm=1 tr=0 ts=691cf638 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=8OnYvAs-TxKVyRaGDQEA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_04,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 clxscore=1011
 suspectscore=0 phishscore=0 adultscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510240000
 definitions=main-2511150032

Dave Marquardt via B4 Relay <devnull+davemarq.linux.ibm.com@kernel.org>
writes:

> This is a resend of a patch I sent in June 2025. I noticed on
> reinstalling b4 that this hadn't been included in recent releases, and
> I couldn't find it in the master branch either.
>
> In edit_with_editor, create temporary directory in toplevel/.git/b4 if
> git top level exists. Otherwise let tempfile.TemporaryDirectory use
> its default directory. This avoids issues with Emacs and Magit, which
> insists COMMIT_EDITMSG must be in the repo's directory tree.

Since I sent this, I discovered this doesn't work with Git worktrees,
where the Git toplevel .git file is a regular file, not a directory. I
tried changing the code below to use Path(topdir) / '.b4' instead, and
that works fine. I suppose if you happen to have a .b4 subdirectory in a
repo or repo worktree that won't work.

I will send another patch for this tomorrow, when I've had more time to
think about it.

> Signed-off-by: Dave Marquardt <davemarq@linux.ibm.com>
> ---
>  src/b4/__init__.py | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/src/b4/__init__.py b/src/b4/__init__.py
> index 7689550..cc7623a 100644
> --- a/src/b4/__init__.py
> +++ b/src/b4/__init__.py
> @@ -4575,8 +4575,16 @@ def edit_in_editor(bdata: bytes, filehint: str = 'COMMIT_EDITMSG') -> bytes:
>      corecfg = get_config_from_git(r'core\..*', {'editor': os.environ.get('EDITOR', 'vi')})
>      editor = corecfg.get('editor')
>      logger.debug('editor=%s', editor)
> +
> +    topdir = git_get_toplevel()
> +    if topdir is not None:
> +        p = Path(topdir)
> +        p = p / '.git' / 'b4'
> +        p.mkdir(parents=True, exist_ok=True)
> +    else:
> +        p = None
>      # Use filehint name in hopes that editors autoload necessary highlight rules
> -    with tepmfile.TemporaryDirectory(prefix='b4-editor') as temp_dir:
> +    with tempfile.TemporaryDirectory(prefix='b4-editor', dir=p) as temp_dir:
>          temp_fpath = os.path.join(temp_dir, filehint)
>          with open(temp_fpath, 'xb') as edit_file:
>              edit_file.write(bdata)
>
> ---
> base-commit: a6db3f06ce9836a7fc8921f588452804fc62bed1
> change-id: 20251118-edit-with-tmp-file-in-repo-bc0d0465661a
>
> Best regards,
> --  
>
> Dave Marquardt <davemarq@linux.ibm.com>
