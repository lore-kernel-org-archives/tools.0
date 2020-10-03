Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
 by mx.groups.io with SMTP id smtpd.web11.4224.1601720287144807541
 for <tools@linux.kernel.org>;
 Sat, 03 Oct 2020 03:18:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail, err=mail: missing word in phrase: charset not supported: "iso-8859-2";
 spf=pass (domain: rere.qmqm.pl, ip: 91.227.64.183, mailfrom: mirq-linux@rere.qmqm.pl)
Received: from remote.user (localhost [127.0.0.1])
	by rere.qmqm.pl (Postfix) with ESMTPSA id 4C3N993NWDz6D;
	Sat,  3 Oct 2020 12:18:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
	t=1601720285; bh=OXjhzKJsI4ZXwt5uDNQXfwFQJzmSAoa5KbMpS65cJ6U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jm8HH675rkXkK3gv3Mdfyo2ihrnqag1sPIRtS+6DwbHlkHS9Rso6ZKy1Z7bhNajSK
	 33ylsx1+oiAJCGIIy40q2KULkloqQdNAk7cwbYQSIDoO5BuALnbyitcy4h1QjejrCQ
	 DKcTpTJyIykSmjqvCKSr3ejPcnmrKeQt/ESxs5nK+VRU6PP+k8R45vcF05W27M0V6p
	 Hmypu3s8u6LtyV/3kzCdxLuq/AwzINNu1/gufNIoq1W/kE1fr8j0ae/Tc4xAzJ5oGi
	 /jz4tzeG53/S/ytlpBGZ3lm75CMIGMCqy/6XFa7DGWNNcestItUblUV7oDFOp5/rhv
	 8y4PMFZ1o5f8g==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.4 at mail
Date: Sat, 3 Oct 2020 12:18:04 +0200
From: =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To: Mark Brown <broonie@kernel.org>
Cc: tools@linux.kernel.org, konstantin@linuxfoundation.org
Subject: Re: [tools] b4: UTF-8 in replies
Message-ID: <20201003101804.GB4163@qmqm.qmqm.pl>
References: <20201001171405.GA17873@qmqm.qmqm.pl>
 <20201001180541.poupp36rtajzkihs@chatter.i7.local>
 <20201001183647.GA23339@qmqm.qmqm.pl>
 <20201001184109.GB23339@qmqm.qmqm.pl>
 <20201001192600.fo2rivqc4nklw4oj@chatter.i7.local>
 <20201002210950.GH5527@sirena.org.uk>
 <20201003101345.GA4163@qmqm.qmqm.pl>
MIME-Version: 1.0
In-Reply-To: <20201003101345.GA4163@qmqm.qmqm.pl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 03, 2020 at 12:13:45PM +0200, Micha=B3 Miros=B3aw wrote:
> On Fri, Oct 02, 2020 at 10:09:50PM +0100, Mark Brown wrote:
> > On Thu, Oct 01, 2020 at 03:26:00PM -0400, Konstantin Ryabitsev wrote:
> >=20
> > > Hrmph, apparently my assumption on what headers will be generated b=
y=20
> > > policy=3D8bit was pretty wrong. I pushed a commit to master and=20
> > > stable-0.5.y that should properly set the charset and generate the=20
> > > necessary headers.
> >=20
> > This fix seems to have caused some issues for me - using msmtp with
> > kernel.org on 1594818110-786-1-git-send-email-brent.lu@intel.com I'm
> > getting headers with:
> >=20
> > To: alsa-devel@alsa-project.org, Brent Lu <brent.lu@intel.com>
> > Cc: =3D?utf-8?q?linux-kernel=3D40vger=3D2Ekernel=3D2Eorg=3D2C_Kai_Veh=
manen_=3D3Ckai=3D2Eve?=3D
> >  =3D?utf-8?q?hmanen=3D40linux=3D2Eintel=3D2Ecom=3D3E=3D2C_Pierre-Loui=
s_Bossart_=3D3Cpierre?=3D
> >  =3D?utf-8?q?-louis=3D2Ebossart=3D40linux=3D2Eintel=3D2Ecom=3D3E=3D2C=
_Takashi_Iwai_=3D3Ctiwa?=3D
> >  =3D?utf-8?q?i=3D40suse=3D2Ecom=3D3E=3D2C_Guennadi_Liakhovetski_=3D3C=
guennadi=3D2Eliakhove?=3D
> >  =3D?utf-8?q?tski=3D40linux=3D2Eintel=3D2Ecom=3D3E=3D2C_Liam_Girdwood=
_=3D3Clgirdwood=3D40gma?=3D
> >  =3D?utf-8?q?il=3D2Ecom=3D3E=3D2C_Amadeusz_S=3DC5=3D82awi=3DC5=3D84sk=
i_=3D3Camadeuszx=3D2Eslawin?=3D
> >  =3D?utf-8?q?ski=3D40linux=3D2Eintel=3D2Ecom=3D3E?=3D
>=20
> RFC 2047 section 6.2. suggests that this encoding is invalid, because i=
t
> encodes structural characters (commas in this case) -- the MTA/MUA
> might treat the whole 'Cc:' as one entry. Also, section 5 point 3 of th=
e
> RFC forbids encoding the addr-spec part (mail address if I understand
> correctly).

IOW, correct encoding might be at most:

Cc: linux-kernel@vger.kernel.org, Kai Vehmanen
	<kai.vehmanen@linux.intel.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.intel.com>, Takashi Iwai
	<tiwai@suse.com>, Guennadi Liakhovetski
	<guennadi.liakhovetski@linux.intel.com>, Liam Girdwood
	<lgirdwood@gmail.com>,
	=3D?utf-8?q?Amadeusz_S=3DC5=3D82awi=3DC5=3D84ski?=3D
	<amadeuszx.slawinski@linux.intel.com>

Best Regards,
Micha=B3 Miros=B3aw
