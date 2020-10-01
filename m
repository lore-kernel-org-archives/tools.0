Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
 by mx.groups.io with SMTP id smtpd.web11.1117.1601577672523386817
 for <tools@linux.kernel.org>;
 Thu, 01 Oct 2020 11:41:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail, err=mail: missing word in phrase: charset not supported: "iso-8859-2";
 spf=pass (domain: rere.qmqm.pl, ip: 91.227.64.183, mailfrom: mirq-linux@rere.qmqm.pl)
Received: from remote.user (localhost [127.0.0.1])
	by rere.qmqm.pl (Postfix) with ESMTPSA id 4C2MQZ6F6bz5q;
	Thu,  1 Oct 2020 20:41:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
	t=1601577670; bh=qUQN7NjUMHOLg4S9FqIvmQQw48RVnvLBJ2qqxNt6WtY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h+UllmQb2zPj5KBwqxU6RzaAwIT7Hz+Ew7soy30s/GIkAGGxF1r2+BaMC4NkWv9ou
	 QMh7vEKW6s5dOHaXKWVbD25JXyc6lDmJqKlYVBla4iNWoNZ65mwOydvngx2+FA9eL9
	 7X5ofmOWsBFF5c9s9O3+jUKHeyj9Enc1PYHILOwTAqa0eYcTQUtFue1xOt6OBDQ+RH
	 bLek7AXTEt76b86xT6RqCemD0ChU+hf9HM7G7WYkXussJcuVAi2bDyY5/sYJtV5LcI
	 189RQErQ34XOG+aw1mMHNGsUvpFH8nP/a0+ybqCRLQgsPDpvFXfnyEmN9kq0dWI21z
	 J+PE+XABME2qA==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.4 at mail
Date: Thu, 1 Oct 2020 20:41:09 +0200
From: =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: Re: b4: UTF-8 in replies
Message-ID: <20201001184109.GB23339@qmqm.qmqm.pl>
References: <20201001171405.GA17873@qmqm.qmqm.pl>
 <20201001180541.poupp36rtajzkihs@chatter.i7.local>
 <20201001183647.GA23339@qmqm.qmqm.pl>
MIME-Version: 1.0
In-Reply-To: <20201001183647.GA23339@qmqm.qmqm.pl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 01, 2020 at 08:36:47PM +0200, Micha=B3 Miros=B3aw wrote:
> On Thu, Oct 01, 2020 at 02:05:41PM -0400, Konstantin Ryabitsev wrote:
> > On Thu, Oct 01, 2020 at 07:14:05PM +0200, Micha=B3 Miros=B3aw wrote:
> > > I'm writing to you because I can't find a bug tracker for b4 script=
.
> >=20
> > There isn't one. Just email tools@linux.kernel.org (cc'd).
> >=20
> > > The bug is that when generating the reply, script doesn't include M=
IME
> > > headers but is using UTF-8 in the body (eg. when replying to an aut=
hor
> > > with non-US name, like me).
> >=20
> > Hm... is that causing you any problems? We make sure to set=20
> > "Content-Transfer-Encoding: 8bit" in the headers, so unless you're us=
ing=20
> > some extremely old SMTP software, UTF-8 in the body or headers should=
n't=20
> > matter.
>=20
> At least K9 Mail on Android requires MIME headers to properly decode it=
.
> The additional headers are actually required by RFC 5322 to include
> 8-bit data in the message.
>=20
> I guess the fix would be to just include Content-Type (and others) with
> charset=3D"utf8".

According to RFC2045 those should be enough:

MIME-Version: 1.0
Content-Type: text/plain; charset=3Dutf-8
Content-Transfer-Encoding: 8bit

Best Regards,
Micha=B3=A0Miros=B3aw
