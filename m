Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16BD2145A19
	for <tools@linux.kernel.org>; Fri, 11 Oct 2024 17:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728666019; cv=none; b=o3DzrPez73WZeth3s19ZdDj8vv/s7AnkoaOd2ePWazN5MOllBPi6MwahEu+v56P20t2tjTo7t5uO3sqbMkeeBm6EEgxusrfwegymYP85r+jzk4Y+D7XQge0mrF9O+vMCuVm9oXSo/dlzJSoSLL0yyoKJMAxZuJVLUMj1VSwHvQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728666019; c=relaxed/simple;
	bh=jmCyElzHxSO4zGrkI5k3hYI3/QNcDVzCPUuWQyYecLc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=aALpgDSNIe1fW6qA8eBeTZEVesTlazOLNTvzv+6fhztZKi0dWBtOuv2VhR1kCGrEikLT2psYKArO3YnUKdCQj4x3bS+Uiq8JjdYhM4CkY+u/hmZP7B6iG4YVI0Wjc7ubyHEuVko8hTUjKWGVkLsENq/3XsCqXgCHmKtMIBZDGBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=collins.com header.i=@collins.com header.b=CviMvUN5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collins.com header.i=@collins.com header.b="CviMvUN5"
Received: by smtp.kernel.org (Postfix)
	id 08C18C4CECE; Fri, 11 Oct 2024 17:00:19 +0000 (UTC)
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com [67.231.144.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E050FC4CEC3
	for <tools@kernel.org>; Fri, 11 Oct 2024 17:00:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E050FC4CEC3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=collins.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=collins.com
Received: from pps.filterd (m0346906.ppops.net [127.0.0.1])
	by mx0a-00105401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49BBYEBn024393;
	Fri, 11 Oct 2024 17:00:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=POD051818;
 bh=61dUqlYo7HexkRF1Q4KbGhWs+t8zalavvmE1aWHtMpw=;
 b=CviMvUN5KLqFLLnlUW64S9aOxhi4Yudt22sbERvWXyxFliLRg/ac4x2W5AUyHAApxhdw
 Yboff8iCx/iWq7KdBKDGL1mMCVGUY95w5Lq1eEkOGud4kia6Ew+S654UI9EJ+icXjtST
 ZbBpy2Lmvqo+kQCXu697x1033n+HR19WJTpWI/MaiZgrlFyfyNrJNmBnp21jknjFKea3
 PDYMHP7xmxOqztbX7eSR6OBlVe9vCSFuFPvyCwxwL+JcUk6kv17Dr4TaqgTtTaSxvCQK
 sGzfKAM++GTqHBHjDbZOylXzWLq6EhR5yjNdjYSK9OaxWbDTZuOPb1aykPHaZkMx3O2H SQ== 
Received: from xusxph004rp050.rtx.com (xusxph004rp050.rtx.com [128.13.120.147])
	by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 426pfafyt3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 11 Oct 2024 17:00:09 +0000
Received: from xusxph005rp020.corp.ray.com ([128.13.121.224])
	by xusxph004rp050.rtx.com (8.18.1.2/8.18.1.2) with ESMTPS id 49BH07K9032398
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 11 Oct 2024 17:00:08 GMT
Received: from ciulimr02.rockwellcollins.com (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
	by xusxph005rp020.corp.ray.com (8.18.1.2/8.18.1.2) with ESMTPS id 49BH07KJ004836
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 11 Oct 2024 17:00:07 GMT
X-Received: from localhost (unknown [10.148.204.208])
	by ciulimr02.rockwellcollins.com (Postfix) with ESMTP id 3D0D91002800;
	Fri, 11 Oct 2024 12:00:07 -0500 (CDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Oct 2024 17:00:07 +0000
Message-Id: <D4T4YGGNY30T.29QNDWMMTODP9@collins.com>
Cc: <tools@kernel.org>
Subject: Re: [PATCH b4] b4: support optional shell completion
From: "Brandon Maier" <brandon.maier@collins.com>
To: "Emil Velikov" <emil.l.velikov@gmail.com>, <cdwhite3@pm.me>
X-Mailer: aerc 0.17.0-0-g6ea74eb30457
References: <17fd26a64c611f64.779eeb9e361f5655.8f7af20c5282c140@lt-cwhi-0222> <CACvgo50XO5M1ZHQPO-J8D+cSUftKqUFytJTwHmMnNMhMSEBJ1A@mail.gmail.com>
In-Reply-To: <CACvgo50XO5M1ZHQPO-J8D+cSUftKqUFytJTwHmMnNMhMSEBJ1A@mail.gmail.com>
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-11_14,2024-10-11_01,2024-09-30_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-11_14,2024-10-11_01,2024-09-30_01
X-MHapp-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 adultscore=0 phishscore=0
 malwarescore=0 spamscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410110118
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 phishscore=0
 mlxlogscore=999 suspectscore=0 bulkscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410110118
X-Proofpoint-ORIG-GUID: poounixMAJAqiMWr8mBxFxgCJQIyMCA5
X-Proofpoint-GUID: poounixMAJAqiMWr8mBxFxgCJQIyMCA5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-11_14,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam policy=outbound_default score=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 mlxlogscore=999
 malwarescore=0 clxscore=1011 impostorscore=0 mlxscore=0 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410110118

Hi Emil, Caleb,

On Fri Oct 11, 2024 at 4:39 PM UTC, Emil Velikov wrote:
> On Thu, 10 Oct 2024 at 18:12, <cdwhite3@pm.me> wrote:
> >
> > > Many tools support this by having a command line flag that can genera=
te
> > > the completion scripts. In the original version of the shell completi=
on
> > > by Emil Velikov this was supported with `b4 --print-completion bash`,
> > > but it was decided against to avoid bringing in more dependencies[2].
> >
> > I would recommend using a `completion` command instead of
> > `--print-completion` to generate the completion scripts. E.g.,
> >
> >     b4 completion bash
> >
> > This is a more common pattern and is used by many other tools.
> >
> > > +Shell completion is provided by the command ``b4 --print-completion
> > > +{bash,zsh,tcsh}``. To enable shell completion run::
> > > +
> > > +    eval $(b4 --print-completion bash)
> > > +
> > > +To make it permanent on new shells, add that command to your ``$HOME=
/.bashrc``
> > > +or ``$HOME/.zshrc``.
> >
> > While this works, the more common pattern is to echo the output to a
> > completion directory which is auto sourced, for example (bash):
> >
> > For global installation:
> >     b4 completion bash > /etc/bash_completion.d/b4
> >
> > For user installation:
> >     mkdir -p ~/.local/share/bash-completion/completions
> >     b4 completion bash > ~/.local/share/bash-completion/completions/b4
> >
>
> ^^ please, or the equivalent I had in the original patch. Better yet,
> if anyone has a nice reference to explain these kinds of things, just
> use that.

I haven't seen any good reference docs for this design pattern. All the
tools I've run across document this manually using either the `eval` or
bash-completion methods. Same with arguments, `b4 --completion` or `b4
completion`.

The shtab project also doesn't have any opinions and supports both
approaches for arguments.
https://github.com/iterative/shtab

I have no strong preferences either way, I can resubmit with these
changes.

>
> Mind you, I never fully understood what the dependency concern was,
> considering it was optional since day one.
> Then again, it was never a hill to die on. Plus b4 is an awesome tool
> - thanks again Konstantin.

Agreed, b4 makes managing patch-based workflows much easier!

Thanks,
Brandon

>
> HTH
> Emil
