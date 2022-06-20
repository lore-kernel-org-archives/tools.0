Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C9677E0
	for <tools@linux.kernel.org>; Mon, 20 Jun 2022 06:31:27 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1o3AwR-00039y-E3; Mon, 20 Jun 2022 08:31:19 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1o3AwO-001ajD-FG; Mon, 20 Jun 2022 08:31:17 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1o3AwP-00HX6M-9B; Mon, 20 Jun 2022 08:31:17 +0200
Date: Mon, 20 Jun 2022 08:31:17 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: patchwork-bot+linux-samsung-soc@kernel.org, helpdesk@kernel.org
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	tools@linux.kernel.org
Subject: Re: [PATCH] pwm: samsung: Implement .apply() callback
Message-ID: <20220620063117.ggowp5g3kmsdzjam@pengutronix.de>
References: <20220328073434.44848-1-u.kleine-koenig@pengutronix.de>
 <165450388336.27627.15000754926080179182.git-patchwork-notify@kernel.org>
 <20220619202152.y7jvzs4jtkvdl67j@pengutronix.de>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gmgm2vaffmqdrjgo"
Content-Disposition: inline
In-Reply-To: <20220619202152.y7jvzs4jtkvdl67j@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: tools@linux.kernel.org


--gmgm2vaffmqdrjgo
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 19, 2022 at 10:21:54PM +0200, Uwe Kleine-K=F6nig wrote:
> Hello,
>=20
> just a short note about a few things I noticed about this patch status
> mail:
>=20
> The To is strange, didn't try to understand it and just keep it to
> learn, if it does the right thing. Still looks wrong. (For reference:
> 	To: =3D?utf-8?q?Uwe_Kleine-K=3DC3=3DB6nig_=3D3Cu=3D2Ekleine-koenig=3D40p=
engutronix=3D2Ede=3D3E?=3D@ci.codeaurora.org
> )

I learned it doesn't work, my mailer daemon told me, this won't work.

Ah, I reported something like that already earlier, see
https://lore.kernel.org/tools/20211018134444.k5k45xiy652cklyl@meerkat.local
expanded Cc: accordingly. I keep the context below around for the new
recipents. Note there is another issue pointed out there.

Best regards
Uwe

> On Mon, Jun 06, 2022 at 08:24:43AM +0000, patchwork-bot+linux-samsung-soc=
@kernel.org wrote:
> > This patch was applied to pinctrl/samsung.git (for-next)
> > by Thierry Reding <thierry.reding@gmail.com>:
> >=20
> > On Mon, 28 Mar 2022 09:34:34 +0200 you wrote:
> > > To eventually get rid of all legacy drivers convert this driver to the
> > > modern world implementing .apply().
> > >=20
> > > The size check for state->period is moved to .apply() to make sure th=
at
> > > the values of state->duty_cycle and state->period are passed to
> > > pwm_samsung_config without change while they are discarded to int.
> > >=20
> > > [...]
> >=20
> > Here is the summary with links:
> >   - pwm: samsung: Implement .apply() callback
> >     https://git.kernel.org/pinctrl/samsung/c/daa986d5f8d8
>=20
> This is a bit misleading, because the patch was actually merged via
> Thierry's tree into v5.19-rc1 and (I guess) only entered the
> samsung-pinctrl tree via an update to a new upstream version.



--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--gmgm2vaffmqdrjgo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmKwFDIACgkQwfwUeK3K
7AmF3Qf/dZrtxoLLu+yXStnjBLsXqLso1JkB2AhEb+GDYcZlM0dkN1EhJgpRQJzJ
Tpy1jU4xv/KhclJRk3btl4dNKvKadkZLVpv5b/q5zOvBxOqTi9/5cTuU1JHjCSDY
ZNPq1OiVLj9Tz4fN33iFwpvWzCejanilhe5Ua/PtpRmuGwL5ak3DXCefxX1WvMag
jEGOGRBg1U5uxUpCCFIj2I4xaU9ZDK99HPGAnW/t4EIeaQjUMPrQCb4yjR+oe8Hh
ReMI6FUEfykx0pknvyilusNIEqDRV+Vw4EcAKhxozzeSIn7qWZTZOuYUA7PZYHtX
Mw5RK3oUCYqU9cdTm5zg5z++P2K8Yw==
=uTXW
-----END PGP SIGNATURE-----

--gmgm2vaffmqdrjgo--
