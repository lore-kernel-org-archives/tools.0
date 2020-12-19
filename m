Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
 by mx.groups.io with SMTP id smtpd.web11.11533.1608397436327605859
 for <tools@linux.kernel.org>;
 Sat, 19 Dec 2020 09:04:03 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@hansenpartnership.com header.s=20151216 header.b=j2TLp5OA;
 spf=pass (domain: hansenpartnership.com, ip: 96.44.175.130, mailfrom: james.bottomley@hansenpartnership.com)
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id C98161280734;
	Sat, 19 Dec 2020 09:03:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1608397425;
	bh=67n7Jz/tsJGQN+p4d6HfjTDuI//ANDDiFp7BXNC491Q=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=j2TLp5OAwHS1abppXcpUFGlCtp0khL2RhXjrDpElZ+r0y5QAOBZ/zC/WZKhE+qvIq
	 sh9cbH5Q+DGr9BRwRE68srpPRJePse+wkKdMWQdSNXtVQPkq0hfBdi5PIPqQp93UzN
	 Hkl0riBlgxNd2tbiEqz3/iuaoa9whqt4ghcSAGm0=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
	by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j0eJoSfJOdNM; Sat, 19 Dec 2020 09:03:45 -0800 (PST)
Received: from jarvis.int.hansenpartnership.com (c-73-35-198-56.hsd1.wa.comcast.net [73.35.198.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 54EAC1280729;
	Sat, 19 Dec 2020 09:03:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1608397425;
	bh=67n7Jz/tsJGQN+p4d6HfjTDuI//ANDDiFp7BXNC491Q=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=j2TLp5OAwHS1abppXcpUFGlCtp0khL2RhXjrDpElZ+r0y5QAOBZ/zC/WZKhE+qvIq
	 sh9cbH5Q+DGr9BRwRE68srpPRJePse+wkKdMWQdSNXtVQPkq0hfBdi5PIPqQp93UzN
	 Hkl0riBlgxNd2tbiEqz3/iuaoa9whqt4ghcSAGm0=
Message-ID: <fc05bad0b5517500e62b271b8896f142060b235e.camel@HansenPartnership.com>
Subject: Re: [kernel.org users] b4: encouraging using the cover letter in merge commits?
From: "James Bottomley" <James.Bottomley@HansenPartnership.com>
To: toke@toke.dk, Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org, Jens Axboe
 <axboe@kernel.dk>,  Arnaldo Carvalho de Melo <acme@kernel.org>
Date: Sat, 19 Dec 2020 09:03:36 -0800
In-Reply-To: <87y2hum0t0.fsf@toke.dk>
References: <877dpeol5w.fsf@toke.dk>
	 <bdffc35910338117c6ed66f6dfac2dc13d6ed03a.camel@HansenPartnership.com>
	 <87y2hum0t0.fsf@toke.dk>
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2020-12-19 at 13:34 +0100, Toke H=C3=B8iland-J=C3=B8rgensen via
linux.kernel.org wrote:
> James Bottomley <James.Bottomley@HansenPartnership.com> writes:
>=20
> > On Fri, 2020-12-18 at 22:32 +0100, Toke H=C3=B8iland-J=C3=B8rgensen v=
ia
> > linux.kernel.org wrote:
> > > Hi Konstantin
> > >=20
> > > Jens, Arnaldo and I just had a twitter conversation[0] about
> > > cover letters and merge commits. Do you think it would be
> > > possible to support the 'include the cover letter text in the
> > > merge commit message' work flow in b4, maybe even encourage it?
> > >=20
> > > I notice b4 will already save the cover letter along with the
> > > patch mbox file, but maybe it would be possible to automate the
> > > workflow some more? A 'b4 merge' command that wraps 'git merge'
> > > and pre-populates the commit message with the text from the cover
> > > letter? Or some other trick?
> >=20
> > I think it's important to ask before we do this: why is the cover
> > letter relevant to a merge but not to a linear patch application
> > (which is what a lot of maintainers use b4 for)?  I think the
> > answer is that it's relevant to linear patches as well, which is
> > why we use the Link tag, but in that case shouldn't we be using the
> > Link tag for merge commits also?
> >=20
> > We did toy with the idea of using empty commits for cover letters a
> > while ago but they got dropped because of the problems they cause
> > (and the fact that they get lost on a rebase), so it could be the
> > answer to why merge but not linear is because we have a vehicle for
> > the former but not the latter, but we should think about it first.
>=20
> I agree that the cover letter is useful more often than not and
> ideally it would be included in most cases. In netdev/bpf land the
> maintainers do this by always creating a merge commit when applying a
> multi-part series; here's Daniel applying one of mine, for instance:
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/com=
mit/?id=3D4e083fdfa39db29bbc7725e229e701867d0da183
>=20
> I personally think this practice is pretty nice, and so I was hoping
> that supporting this workflow in b4 could be a way to encourage other
> maintainers to take up the practice as well :)

I've got to say that creating a spurious merge for the cover letter
looks even more tortuous than creating an empty commit.  What
advantages does this have over the existing link tag practice which is
the one that we now use instead of the empty commit?

James


