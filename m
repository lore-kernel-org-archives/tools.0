Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
 by mx.groups.io with SMTP id smtpd.web09.785.1608331127790703176
 for <tools@linux.kernel.org>;
 Fri, 18 Dec 2020 14:38:47 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@hansenpartnership.com header.s=20151216 header.b=RYu6lkOF;
 spf=pass (domain: hansenpartnership.com, ip: 96.44.175.130, mailfrom: james.bottomley@hansenpartnership.com)
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 05A6C12809D0;
	Fri, 18 Dec 2020 14:38:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1608331127;
	bh=otg86WNakOoWzIcmKgFGmMqJyHcGDlCL0B+OY8Huolg=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=RYu6lkOFBSnuqhGl43Dbtw5oR+yFUsJjLoBHTRAnxEaqSwf5aTrU7x2VR5DIH/QNU
	 /HiqcAwAo/0uJlqLvsUcubbEJ1lpS7lXP/Gmkb0zj4/W0uUUSjJrNFRK3ry99+PM5T
	 izKaPCNd8BjuIg4HCbxtOmW7JtxSJvFOlb6rahNQ=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
	by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OIuffPTE22Nu; Fri, 18 Dec 2020 14:38:46 -0800 (PST)
Received: from jarvis.int.hansenpartnership.com (unknown [IPv6:2601:600:8280:66d1::c447])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 51EC012809CF;
	Fri, 18 Dec 2020 14:38:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1608331126;
	bh=otg86WNakOoWzIcmKgFGmMqJyHcGDlCL0B+OY8Huolg=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=g2ecJ0YBU++OwMDBGUkT/2/fNqlkpu0MCWLEyrIXjCigHVRqnzEhH/NYnE5ysxTFt
	 gK0T21qnjt+VL6yw0ZU2B60rly3HDjlilba6STm9Wg6kT+gF+3CZnyATiNBup8whGH
	 q2k7qLpjcuOVIlkX7ppabHjmuvjrqrOrZomyrRMM=
Message-ID: <bdffc35910338117c6ed66f6dfac2dc13d6ed03a.camel@HansenPartnership.com>
Subject: Re: [kernel.org users] b4: encouraging using the cover letter in merge commits?
From: "James Bottomley" <James.Bottomley@HansenPartnership.com>
To: toke@toke.dk, Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org, Jens Axboe
 <axboe@kernel.dk>,  Arnaldo Carvalho de Melo <acme@kernel.org>
Date: Fri, 18 Dec 2020 14:38:45 -0800
In-Reply-To: <877dpeol5w.fsf@toke.dk>
References: <877dpeol5w.fsf@toke.dk>
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2020-12-18 at 22:32 +0100, Toke H=C3=B8iland-J=C3=B8rgensen via
linux.kernel.org wrote:
> Hi Konstantin
>=20
> Jens, Arnaldo and I just had a twitter conversation[0] about cover
> letters and merge commits. Do you think it would be possible to
> support the 'include the cover letter text in the merge commit
> message' work flow in b4, maybe even encourage it?
>=20
> I notice b4 will already save the cover letter along with the patch
> mbox file, but maybe it would be possible to automate the workflow
> some more? A 'b4 merge' command that wraps 'git merge' and pre-
> populates the commit message with the text from the cover letter? Or
> some other trick?

I think it's important to ask before we do this: why is the cover
letter relevant to a merge but not to a linear patch application (which
is what a lot of maintainers use b4 for)?  I think the answer is that
it's relevant to linear patches as well, which is why we use the Link
tag, but in that case shouldn't we be using the Link tag for merge
commits also?

We did toy with the idea of using empty commits for cover letters a
while ago but they got dropped because of the problems they cause (and
the fact that they get lost on a rebase), so it could be the answer to
why merge but not linear is because we have a vehicle for the former
but not the latter, but we should think about it first.

James


