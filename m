Received: from mail.toke.dk (mail.toke.dk [45.145.95.4])
 by mx.groups.io with SMTP id smtpd.web11.8096.1608381294583700303
 for <tools@linux.kernel.org>;
 Sat, 19 Dec 2020 04:34:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@toke.dk header.s=20161023 header.b=SdGbGOVD;
 spf=pass (domain: toke.dk, ip: 45.145.95.4, mailfrom: toke@toke.dk)
From: =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@toke.dk>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=toke.dk; s=20161023;
	t=1608381292; bh=oBhMHDqKvyxFWG/L8wAQLU2RopReIScmHXFW4RqV67c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=SdGbGOVD0JlIzb97f0R5/fUUdUtqZ0yDaUohzbT1JxBXPUOxYYxwg/avw7n0kBr7T
	 Z/7Of4Gdgidvx116euh3rXtMeq2DDOVzwuoCYShs857Df+iiiH+PmjYONm8RijxtFZ
	 i+HJZWEdSJJdD6E8I7HXIU4ez723nK+9h+LT8km9FQTO90Ciy+cBohb47/jrT2cXCi
	 h7wOHxbz1cVYC7+HU/0T+PfZ7BZ8t2w1+RyVayz4Nu//xz52aQRtI8r1Qj+zUpPkSe
	 hHUZz0NiL79xKrOs93l2+mUC60EJKglOHmZJag+Bx+XxPIONI0aQWsnJeqTBpTF4TU
	 gSfwVENiJs6Hw==
To: James Bottomley <James.Bottomley@HansenPartnership.com>, Konstantin
 Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org, Jens Axboe
 <axboe@kernel.dk>, Arnaldo Carvalho de Melo <acme@kernel.org>
Subject: Re: [kernel.org users] b4: encouraging using the cover letter in merge commits?
In-Reply-To: <bdffc35910338117c6ed66f6dfac2dc13d6ed03a.camel@HansenPartnership.com>
References: <877dpeol5w.fsf@toke.dk>
 <bdffc35910338117c6ed66f6dfac2dc13d6ed03a.camel@HansenPartnership.com>
Date: Sat, 19 Dec 2020 13:34:51 +0100
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <87y2hum0t0.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

James Bottomley <James.Bottomley@HansenPartnership.com> writes:

> On Fri, 2020-12-18 at 22:32 +0100, Toke H=C3=B8iland-J=C3=B8rgensen via
> linux.kernel.org wrote:
>> Hi Konstantin
>>=20
>> Jens, Arnaldo and I just had a twitter conversation[0] about cover
>> letters and merge commits. Do you think it would be possible to
>> support the 'include the cover letter text in the merge commit
>> message' work flow in b4, maybe even encourage it?
>>=20
>> I notice b4 will already save the cover letter along with the patch
>> mbox file, but maybe it would be possible to automate the workflow
>> some more? A 'b4 merge' command that wraps 'git merge' and pre-
>> populates the commit message with the text from the cover letter? Or
>> some other trick?
>
> I think it's important to ask before we do this: why is the cover
> letter relevant to a merge but not to a linear patch application (which
> is what a lot of maintainers use b4 for)?  I think the answer is that
> it's relevant to linear patches as well, which is why we use the Link
> tag, but in that case shouldn't we be using the Link tag for merge
> commits also?
>
> We did toy with the idea of using empty commits for cover letters a
> while ago but they got dropped because of the problems they cause (and
> the fact that they get lost on a rebase), so it could be the answer to
> why merge but not linear is because we have a vehicle for the former
> but not the latter, but we should think about it first.

I agree that the cover letter is useful more often than not and ideally
it would be included in most cases. In netdev/bpf land the maintainers
do this by always creating a merge commit when applying a multi-part
series; here's Daniel applying one of mine, for instance:

https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/commit/=
?id=3D4e083fdfa39db29bbc7725e229e701867d0da183

I personally think this practice is pretty nice, and so I was hoping
that supporting this workflow in b4 could be a way to encourage other
maintainers to take up the practice as well :)

-Toke
