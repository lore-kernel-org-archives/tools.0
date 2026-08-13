Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8447F36DA15
	for <tools@linux.kernel.org>; Thu, 13 Aug 2026 19:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786648685; cv=none; b=J155CFw9JdEx1j2FROXuKF2dHaJGwtUjVsq76YgmGpe4Hal0X9SL3Sb7cophei63SMbqZdoVUJbXQWGER0i6vbk5s7QJFNt4N34T5SHSRBL7THPS8UIVnEiOJUS9JqCGjMIEvhRldUgizo8AxLE186gMqmV7P5lYQDPxYTXdf18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786648685; c=relaxed/simple;
	bh=SloIf6nHpwrx2opeCyY60rsYFb8EM16z6rumdgYAVmM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GKiD9V2I7hsyb/DUHV+0IBs0DPpy722e+pU4COBQPSOFi+YqZKnomLfBEe3zjInDoTA4M+k887+pskCZpqFiguwfLKlFzs0KERi+hSd8EWe07Qk5CM8BOlVlbRXQaFje9RHq9y8uwNJfz0X3XQQJI7tjpJFs5nNl87iL/2MXM8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fbnbnv68; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fbnbnv68"
Received: by smtp.kernel.org (Postfix)
	id BF6141F00AC4; Thu, 13 Aug 2026 19:17:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D1501F000E9;
	Thu, 13 Aug 2026 19:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786648679;
	bh=Y3/wUAj0eY/YRCsd3H3ezsFJjzQ6rNpdhZSuaHywqYc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fbnbnv68x27j3Ea5bQ1hcpJt1kW0aANqqWvUuB3ke3Yh9tAWFE3f8jzltn2+S+DLQ
	 FQUoydO5P0SMEnORk1s0jMdu1N4dRu+xcBzWq5CI7MwMJxBxItLnCspAMqzrGBW8QD
	 5fde1hFUFpqsx2HaZUVrhKB4RG6Oa5cErbpabMNOwXlEcEbu8V8AFORClfWcHckVpU
	 adjJVa/AnkeCM7bqbh/s16C+Pq3jsPhiyASJTd/3yW7AWMAachHKjyeRcr5jenW6uG
	 7se+4CNHu2Qc/aRg3L/43voxxnKpSSZh+zZVXxJUpr2qTTdP3IJNJfC8a0vVeVERgd
	 BiPRKTZ9CD7HQ==
Date: Thu, 13 Aug 2026 20:17:55 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: Re: b4 review crash
Message-ID: <0026503d-6adf-4c22-8785-6a17cf8252d7@sirena.org.uk>
References: <1bcfac04-3a85-4d8d-a0a1-094abe5dd807@sirena.org.uk>
 <20260813-athletic-therapeutic-armadillo-cdd2bf@meerkat>
 <20260813-rigorous-sawfish-of-protection-1aecb4@meerkat>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qK3F7+Co7rzaoStd"
Content-Disposition: inline
In-Reply-To: <20260813-rigorous-sawfish-of-protection-1aecb4@meerkat>
X-Cookie: Immanuel doesn't pun, he Kant.


--qK3F7+Co7rzaoStd
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 13, 2026 at 02:04:48PM -0400, Konstantin Ryabitsev wrote:
> On Thu, Aug 13, 2026 at 01:35:44PM -0400, Konstantin Ryabitsev wrote:
> > I'll add the fix.

> The fix is in now -- it will pop up a warning message with an override op=
tion.
> Please try it out.

Gets further but still splats:

Preparing fake-am for v2: ASoC: tas2783-sdw: add firmware download status c=
heck
=E2=95=AD=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80 Traceback (most recent call last) =E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=95=AE
=E2=94=82 /home/broonie/git/b4/src/b4/review_tui/_tracking_app.py:1864 in <=
lambda>                                             =E2=94=82
=E2=94=82                                                                  =
                                                    =E2=94=82
=E2=94=82   1861 =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82   base_hint=
=3Dbase_hint,                                                              =
            =E2=94=82
=E2=94=82   1862 =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82   subject=3D=
series.get('subject', ''),                                                 =
           =E2=94=82
=E2=94=82   1863 =E2=94=82   =E2=94=82   =E2=94=82   ),                    =
                                                                           =
 =E2=94=82
=E2=94=82 =E2=9D=B1 1864 =E2=94=82   =E2=94=82   =E2=94=82   callback=3Dlam=
bda base_sha: self._on_base_selected(                                      =
           =E2=94=82
=E2=94=82   1865 =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82   base_sha, =
lser, series, ambytes                                                      =
         =E2=94=82
=E2=94=82   1866 =E2=94=82   =E2=94=82   =E2=94=82   ),                    =
                                                                           =
 =E2=94=82
=E2=94=82   1867 =E2=94=82   =E2=94=82   )                                 =
                                                                    =E2=94=
=82
=E2=94=82                                                                  =
                                                    =E2=94=82
=E2=94=82 =E2=95=AD=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80 locals =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=95=AE         =E2=94=82
=E2=94=82 =E2=94=82  ambytes =3D b'From git@z Thu Jan  1 00:00:00 1970\nSub=
ject: [PATCH v2] ASoC: tas2783-sdw: add f'+4873     =E2=94=82         =E2=
=94=82
=E2=94=82 =E2=94=82 base_sha =3D 'ba5401135aa508f0cb5414f269edba1fe90460da'=
                                                    =E2=94=82         =E2=
=94=82
=E2=94=82 =E2=94=82     lser =3D - Series: [v2] ASoC: tas2783-sdw: add firm=
ware download status check                          =E2=94=82         =E2=
=94=82
=E2=94=82 =E2=94=82              author: Baojun Xu <baojun.xu@ti.com>      =
                                                  =E2=94=82         =E2=94=
=82
=E2=94=82 =E2=94=82              revision: 2                               =
                                                  =E2=94=82         =E2=94=
=82
=E2=94=82 =E2=94=82              expected: 1                               =
                                                  =E2=94=82         =E2=94=
=82
=E2=94=82 =E2=94=82              complete: True                            =
                                                  =E2=94=82         =E2=94=
=82
=E2=94=82 =E2=94=82              has_cover: False                          =
                                                  =E2=94=82         =E2=94=
=82
=E2=94=82 =E2=94=82              base_commit: None                         =
                                                  =E2=94=82         =E2=94=
=82
=E2=94=82 =E2=94=82              change_id: None                           =
                                                  =E2=94=82         =E2=94=
=82
=E2=94=82 =E2=94=82              partial_reroll: False                     =
                                                  =E2=94=82         =E2=94=
=82
=E2=94=82 =E2=94=82              patches:                                  =
                                                  =E2=94=82         =E2=94=
=82
=E2=94=82 =E2=94=82            =E2=94=82   [0/1] MISSING                   =
                                                          =E2=94=82        =
 =E2=94=82
=E2=94=82 =E2=94=82            =E2=94=82   [1/1] ASoC: tas2783-sdw: add fir=
mware download status check                               =E2=94=82        =
 =E2=94=82
=E2=94=82 =E2=94=82     self =3D TrackingApp(title=3D'b4 review', classes=
=3D{'-dark-mode'}, pseudo_classes=3D{'dark', 'focus'})      =E2=94=82      =
   =E2=94=82
=E2=94=82 =E2=94=82   series =3D {                                         =
                                                    =E2=94=82         =E2=
=94=82
=E2=94=82 =E2=94=82            =E2=94=82   'track_id': 1304,               =
                                                          =E2=94=82        =
 =E2=94=82
=E2=94=82 =E2=94=82            =E2=94=82   'change_id': '20260813-asoc-tas2=
783-sdw-add-firmware-download-status-check-3faf17a2a9c2', =E2=94=82        =
 =E2=94=82
=E2=94=82 =E2=94=82            =E2=94=82   'revision': 2,                  =
                                                          =E2=94=82        =
 =E2=94=82
=E2=94=82 =E2=94=82            =E2=94=82   'subject': 'ASoC: tas2783-sdw: a=
dd firmware download status check',                       =E2=94=82        =
 =E2=94=82
=E2=94=82 =E2=94=82            =E2=94=82   'sender_name': 'Baojun Xu',     =
                                                          =E2=94=82        =
 =E2=94=82
=E2=94=82 =E2=94=82            =E2=94=82   'sender_email': 'baojun.xu@ti.co=
m',                                                       =E2=94=82        =
 =E2=94=82
=E2=94=82 =E2=94=82            =E2=94=82   'sent_at': '2026-08-13T10:14:50+=
08:00',                                                   =E2=94=82        =
 =E2=94=82
=E2=94=82 =E2=94=82            =E2=94=82   'added_at': '2026-08-13T11:59:57=
=2E727998+00:00',                                           =E2=94=82      =
   =E2=94=82
=E2=94=82 =E2=94=82            =E2=94=82   'status': 'new',                =
                                                          =E2=94=82        =
 =E2=94=82
=E2=94=82 =E2=94=82            =E2=94=82   'num_patches': 1,               =
                                                          =E2=94=82        =
 =E2=94=82
=E2=94=82 =E2=94=82            =E2=94=82   ... +11                         =
                                                          =E2=94=82        =
 =E2=94=82
=E2=94=82 =E2=94=82            }                                           =
                                                  =E2=94=82         =E2=94=
=82
=E2=94=82 =E2=95=B0=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=95=AF         =E2=94=82
=E2=94=82                                                                  =
                                                    =E2=94=82
=E2=94=82 /home/broonie/git/b4/src/b4/review_tui/_tracking_app.py:1880 in _=
on_base_selected                                    =E2=94=82
=E2=94=82                                                                  =
                                                    =E2=94=82
=E2=94=82   1877 =E2=94=82   =E2=94=82   if base_sha is None:              =
                                                                    =E2=94=
=82
=E2=94=82   1878 =E2=94=82   =E2=94=82   =E2=94=82   self.notify('Checkout =
cancelled', severity=3D'information')                                      =
   =E2=94=82
=E2=94=82   1879 =E2=94=82   =E2=94=82   =E2=94=82   return                =
                                                                           =
 =E2=94=82
=E2=94=82 =E2=9D=B1 1880 =E2=94=82   =E2=94=82   self._do_checkout(lser, se=
ries, base_commit=3Dbase_sha, ambytes=3Dambytes)                           =
     =E2=94=82
=E2=94=82   1881 =E2=94=82                                                 =
                                                            =E2=94=82
=E2=94=82   1882 =E2=94=82   def _discover_newer_versions(                 =
                                                            =E2=94=82
=E2=94=82   1883 =E2=94=82   =E2=94=82   self, change_id: str, current_rev:=
 int, review_branch: str                                            =E2=94=
=82
=E2=94=82                                                                  =
                                                    =E2=94=82
=E2=94=82 =E2=95=AD=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80 locals =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=95=AE         =E2=94=82
=E2=94=82 =E2=94=82  ambytes =3D b'From git@z Thu Jan  1 00:00:00 1970\nSub=
ject: [PATCH v2] ASoC: tas2783-sdw: add f'+4873     =E2=94=82         =E2=
=94=82
=E2=94=82 =E2=94=82 base_sha =3D 'ba5401135aa508f0cb5414f269edba1fe90460da'=
                                                    =E2=94=82         =E2=
=94=82
=E2=94=82 =E2=94=82     lser =3D - Series: [v2] ASoC: tas2783-sdw: add firm=
ware download status check                          =E2=94=82         =E2=
=94=82
=E2=94=82 =E2=94=82              author: Baojun Xu <baojun.xu@ti.com>      =
                                                  =E2=94=82         =E2=94=
=82
=E2=94=82 =E2=94=82              revision: 2                               =
                                                  =E2=94=82         =E2=94=
=82
=E2=94=82 =E2=94=82              expected: 1                               =
                                                  =E2=94=82         =E2=94=
=82
=E2=94=82 =E2=94=82              complete: True                            =
                                                  =E2=94=82         =E2=94=
=82
=E2=94=82 =E2=94=82              has_cover: False                          =
                                                  =E2=94=82         =E2=94=
=82
=E2=94=82 =E2=94=82              base_commit: None                         =
                                                  =E2=94=82         =E2=94=
=82
=E2=94=82 =E2=94=82              change_id: None                           =
                                                  =E2=94=82         =E2=94=
=82
=E2=94=82 =E2=94=82              partial_reroll: False                     =
                                                  =E2=94=82         =E2=94=
=82
=E2=94=82 =E2=94=82              patches:                                  =
                                                  =E2=94=82         =E2=94=
=82
=E2=94=82 =E2=94=82            =E2=94=82   [0/1] MISSING                   =
                                                          =E2=94=82        =
 =E2=94=82
=E2=94=82 =E2=94=82            =E2=94=82   [1/1] ASoC: tas2783-sdw: add fir=
mware download status check                               =E2=94=82        =
 =E2=94=82
=E2=94=82 =E2=94=82     self =3D TrackingApp(title=3D'b4 review', classes=
=3D{'-dark-mode'}, pseudo_classes=3D{'dark', 'focus'})      =E2=94=82      =
   =E2=94=82
=E2=94=82 =E2=94=82   series =3D {                                         =
                                                    =E2=94=82         =E2=
=94=82
=E2=94=82 =E2=94=82            =E2=94=82   'track_id': 1304,               =
                                                          =E2=94=82        =
 =E2=94=82
=E2=94=82 =E2=94=82            =E2=94=82   'change_id': '20260813-asoc-tas2=
783-sdw-add-firmware-download-status-check-3faf17a2a9c2', =E2=94=82        =
 =E2=94=82
=E2=94=82 =E2=94=82            =E2=94=82   'revision': 2,                  =
                                                          =E2=94=82        =
 =E2=94=82
=E2=94=82 =E2=94=82            =E2=94=82   'subject': 'ASoC: tas2783-sdw: a=
dd firmware download status check',                       =E2=94=82        =
 =E2=94=82
=E2=94=82 =E2=94=82            =E2=94=82   'sender_name': 'Baojun Xu',     =
                                                          =E2=94=82        =
 =E2=94=82
=E2=94=82 =E2=94=82            =E2=94=82   'sender_email': 'baojun.xu@ti.co=
m',                                                       =E2=94=82        =
 =E2=94=82
=E2=94=82 =E2=94=82            =E2=94=82   'sent_at': '2026-08-13T10:14:50+=
08:00',                                                   =E2=94=82        =
 =E2=94=82
=E2=94=82 =E2=94=82            =E2=94=82   'added_at': '2026-08-13T11:59:57=
=2E727998+00:00',                                           =E2=94=82      =
   =E2=94=82
=E2=94=82 =E2=94=82            =E2=94=82   'status': 'new',                =
                                                          =E2=94=82        =
 =E2=94=82
=E2=94=82 =E2=94=82            =E2=94=82   'num_patches': 1,               =
                                                          =E2=94=82        =
 =E2=94=82
=E2=94=82 =E2=94=82            =E2=94=82   ... +11                         =
                                                          =E2=94=82        =
 =E2=94=82
=E2=94=82 =E2=94=82            }                                           =
                                                  =E2=94=82         =E2=94=
=82
=E2=94=82 =E2=95=B0=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=95=AF         =E2=94=82
=E2=94=82                                                                  =
                                                    =E2=94=82
=E2=94=82 /home/broonie/git/b4/src/b4/review_tui/_tracking_app.py:2001 in _=
do_checkout                                         =E2=94=82
=E2=94=82                                                                  =
                                                    =E2=94=82
=E2=94=82   1998 =E2=94=82   =E2=94=82   =E2=94=82   if lser.complete:     =
                                                                           =
 =E2=94=82
=E2=94=82   1999 =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82   _checked, =
mismatches =3D lser.check_applies_clean(gitdir=3Dtopdir)                   =
             =E2=94=82
=E2=94=82   2000 =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82   if mismatc=
hes:                                                                       =
         =E2=94=82
=E2=94=82 =E2=9D=B1 2001 =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82   =
=E2=94=82   rstart, rend =3D lser.make_fake_am_range(gitdir=3Dtopdir)      =
                               =E2=94=82
=E2=94=82   2002 =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82 =
  if rstart and rend:                                                      =
                 =E2=94=82
=E2=94=82   2003 =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82 =
  =E2=94=82   logger.info(                                                 =
                         =E2=94=82
=E2=94=82   2004 =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82 =
  =E2=94=82   =E2=94=82   'Prepared fake commit range for 3-way merge (%.12=
s..%.12s)',                      =E2=94=82
=E2=94=82                                                                  =
                                                    =E2=94=82
=E2=94=82 =E2=95=AD=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80 locals =E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=95=AE =E2=94=82
=E2=94=82 =E2=94=82         _checked =3D 1                                 =
                                                            =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82          ambytes =3D b'From git@z Thu Jan  1 00:00:00 1=
970\nSubject: [PATCH v2] ASoC: tas2783-sdw: add f'+4873     =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82      base_commit =3D 'ba5401135aa508f0cb5414f269edba1fe=
90460da'                                                    =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82      branch_name =3D 'b4/review/20260813-asoc-tas2783-s=
dw-add-firmware-download-status-check-3faf17a2a'+3          =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82        change_id =3D '20260813-asoc-tas2783-sdw-add-fir=
mware-download-status-check-3faf17a2a9c2'                   =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82 checkout_success =3D False                             =
                                                            =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82           config =3D {                                 =
                                                            =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82                    =E2=94=82   'midmask': 'https://lore=
=2Ekernel.org/all/%s',                                              =E2=94=
=82 =E2=94=82
=E2=94=82 =E2=94=82                    =E2=94=82   'searchmask': 'https://l=
ore.kernel.org/all/?x=3Dm&q=3D%s',                                    =E2=
=94=82 =E2=94=82
=E2=94=82 =E2=94=82                    =E2=94=82   'linkmask': 'https://pat=
ch.msgid.link/%s',                                                =E2=94=82=
 =E2=94=82
=E2=94=82 =E2=94=82                    =E2=94=82   'listid-preference': ['*=
=2Efeeds.kernel.org', '*.linux.dev', '*.kernel.org', '*'],          =E2=94=
=82 =E2=94=82
=E2=94=82 =E2=94=82                    =E2=94=82   'save-maildirs': 'no',  =
                                                                  =E2=94=82=
 =E2=94=82
=E2=94=82 =E2=94=82                    =E2=94=82   'attestation-policy': 's=
oftfail',                                                         =E2=94=82=
 =E2=94=82
=E2=94=82 =E2=94=82                    =E2=94=82   'attestation-staleness-d=
ays': '30',                                                       =E2=94=82=
 =E2=94=82
=E2=94=82 =E2=94=82                    =E2=94=82   'attestation-check-dkim'=
: 'yes',                                                          =E2=94=82=
 =E2=94=82
=E2=94=82 =E2=94=82                    =E2=94=82   'attestation-dns-resolve=
rs': None,                                                        =E2=94=82=
 =E2=94=82
=E2=94=82 =E2=94=82                    =E2=94=82   'attestation-gnupghome':=
 None,                                                            =E2=94=82=
 =E2=94=82
=E2=94=82 =E2=94=82                    =E2=94=82   ... +22                 =
                                                                  =E2=94=82=
 =E2=94=82
=E2=94=82 =E2=94=82                    }                                   =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82       first_body =3D 'Currently, the firmware download =
is unnecessarily triggered on every\nsystem resu'+4527      =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82         linkmask =3D 'https://patch.msgid.link/%s'     =
                                                            =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82          linkurl =3D 'https://patch.msgid.link/20260813=
021450.1897-1-baojun.xu@ti.com'                             =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82             lmsg =3D msgid: 20260813021450.1897-1-baoju=
n.xu@ti.com                                                 =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82                      full_subject: [PATCH v2] ASoC: tas=
2783-sdw: add firmware download status check              =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      subject: ASoC: tas2783-sdw: add fi=
rmware download status check                              =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      reply: False                      =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      resend: False                     =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      patch: True                       =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      rfc: False                        =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      revision: 2                       =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      revision_inferred: False          =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      counter: 1                        =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      expected: 1                       =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      counters_inferred: True           =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      prefixes: PATCH, v2               =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      fromname: Baojun Xu               =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      fromemail: baojun.xu@ti.com       =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      date: 2026-08-13 10:14:50+08:00   =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      in_reply_to: None                 =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      --- begin body ---                =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |Currently, the firmware download =
is unnecessarily triggered on every                       =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |system resume from suspend, causi=
ng significant wake-up latency. However,                  =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |this step is redundant if the AMP=
 remains powered on. Furthermore, certain                 =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |memory pages (addresses > 0xc6000=
0) are skipped even after an AMP reset.                   =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |                                 =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |Signed-off-by: Baojun Xu <baojun.=
xu@ti.com>                                                =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |---                              =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |v2:                              =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      | - Update register address from 0=
x07 to 7 and keep the line within the                     =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |   80-character limit.=E2=80=8C  =
                                                                   =E2=94=
=82 =E2=94=82
=E2=94=82 =E2=94=82                      | - =E2=80=8CRemove stray/unnecess=
ary changes.=E2=80=8C                                                      =
 =E2=94=82 =E2=94=82
=E2=94=82 =E2=94=82                      | - =E2=80=8CChange variable type =
to unsigned int to comply with API requirements.=E2=80=8C                  =
 =E2=94=82 =E2=94=82
=E2=94=82 =E2=94=82                      | - =E2=80=8CReplace usleep_range(=
) with fsleep().=E2=80=8C                                                  =
 =E2=94=82 =E2=94=82
=E2=94=82 =E2=94=82                      | - =E2=80=8CSet idle_bias_on to 0=
 to enable low-power mode.                                         =E2=94=
=82 =E2=94=82
=E2=94=82 =E2=94=82                      | - Reactivate the AMP after resum=
e.                                                        =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |---                              =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      | sound/soc/codecs/tas2783-sdw.c |=
 55 ++++++++++++++++++++--------------                    =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      | 1 file changed, 33 insertions(+)=
, 22 deletions(-)                                         =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |                                 =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |diff --git a/sound/soc/codecs/tas=
2783-sdw.c b/sound/soc/codecs/tas2783-sdw.c               =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |index c217da5fccdf..8fc679d460d9 =
100644                                                    =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |--- a/sound/soc/codecs/tas2783-sd=
w.c                                                       =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |+++ b/sound/soc/codecs/tas2783-sd=
w.c                                                       =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |@@ -97,6 +97,7 @@ struct tas2783_=
prv {                                                     =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |     u8 rca_binaryname[64];      =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |     u8 dev_name[32];            =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |     bool hw_init;               =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |+    bool first_hw_init;         =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |     /* wq for firmware download =
*/                                                        =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |     wait_queue_head_t fw_wait;  =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |     bool fw_dl_task_done;       =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |@@ -783,14 +784,16 @@ static void=
 tas2783_fw_ready(const struct firmware *fmw, void        =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                    *context)                           =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |                     file->versio=
n, file->length,                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |                     file->dest_a=
ddr, file->fw_data);                                      =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |                                 =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |-            ret =3D sdw_nwrite_n=
o_pm(tas_dev->sdw_peripheral,                               =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82                      |-                                =
   file->dest_addr,                                       =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |-                                =
   file->length,                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |-                                =
   file->fw_data);                                        =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |-            if (ret < 0) {      =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |-                    dev_err(tas_=
dev->dev,                                                 =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |-                            "FW =
download failed: %d", ret);                               =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |-                    break;      =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |+            if (!tas_dev->first_=
hw_init || file->dest_addr < 0xc60000) {                  =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |+                    ret =3D sdw_=
nwrite_no_pm(tas_dev->sdw_peripheral,                       =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82                      |+                                =
           file->dest_addr,                               =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |+                                =
           file->length,                                  =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |+                                =
           file->fw_data);                                =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |+                    if (ret < 0)=
 {                                                        =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |+                            dev_=
err(tas_dev->dev,                                         =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |+                                =
    "FW download failed: %d", ret);                       =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |+                            brea=
k;                                                        =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |+                    }           =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |             }                   =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |             cur_file++;         =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |     }                           =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |@@ -801,6 +804,8 @@ static void t=
as2783_fw_ready(const struct firmware *fmw, void          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                    *context)                           =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |             ret =3D -EINVAL;    =
                                                            =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82                      |     } else {                    =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |             tas2783_update_calib=
data(tas_dev);                                            =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |+            regmap_write(tas_dev=
->regmap, TASDEV_REG_SDW(0, 0, 7), 0x22);                 =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |+            tas_dev->first_hw_in=
it =3D true;                                                =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82                      |     }                           =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |                                 =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      | out:                            =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |@@ -940,7 +945,7 @@ static s32 ta=
s_sdw_hw_params(struct snd_pcm_substream *substream,      =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |                                 =
                    TAS2783_SDCA_POW_STATE_ON);           =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |                     if (!ret)   =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |                             brea=
k;                                                        =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |-                    usleep_range=
(2000, 2200);                                             =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |+                    fsleep(2200)=
;                                                         =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |             } while (retry--);  =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |     }                           =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |                                 =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |@@ -1038,7 +1043,7 @@ static cons=
t struct snd_soc_component_driver                         =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                    soc_codec_driver_tasdevice =3D {    =
                                                            =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82                      |     .num_dapm_widgets =3D ARRAY_=
SIZE(tas_dapm_widgets),                                     =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82                      |     .dapm_routes =3D tas_audio_m=
ap,                                                         =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82                      |     .num_dapm_routes =3D ARRAY_S=
IZE(tas_audio_map),                                         =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82                      |-    .idle_bias_on =3D 1,        =
                                                            =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82                      |+    .idle_bias_on =3D 0,        =
                                                            =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82                      |     .endianness =3D 1,          =
                                                            =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82                      | };                              =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |                                 =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |@@ -1171,25 +1176,29 @@ static s3=
2 tas_fw_load(struct tas2783_prv *tas_dev, struct         =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                    sdw_slave *slave)                   =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      | static s32 tas_io_init(struct de=
vice *dev, struct sdw_slave *slave)                       =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      | {                               =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |     struct tas2783_prv *tas_dev =
=3D dev_get_drvdata(dev);                                   =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82                      |+    unsigned int val;           =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |     s32 ret;                    =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |                                 =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |     if (tas_dev->hw_init)       =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |             return 0;           =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |                                 =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |-    tas_dev->fw_dl_success =3D f=
alse;                                                       =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82                      |+    regmap_read(tas_dev->regmap,=
 TASDEV_REG_SDW(0, 0, 7), &val);                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |+    /* Check if the AMP is in re=
set status. */                                            =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |+    if (val =3D=3D 0x20) {      =
                                                              =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82                      |+            tas_dev->fw_dl_succe=
ss =3D false;                                               =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82                      |                                 =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |-    ret =3D regmap_write(tas_dev=
->regmap, TAS2783_SW_RESET, 0x1);                           =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82                      |-    if (ret) {                  =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |-            dev_err(dev, "sw res=
et failed, err=3D%d", ret);                                 =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82                      |-            return ret;         =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |-    }                           =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |-    usleep_range(2000, 2200);   =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |+            ret =3D regmap_write=
(tas_dev->regmap, TAS2783_SW_RESET, 0x1);                   =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82                      |+            if (ret) {          =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |+                    dev_err(dev,=
 "sw reset failed, err=3D%d", ret);                         =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82                      |+                    return ret; =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |+            }                   =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |+            fsleep(2200);       =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |                                 =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |-    tas_dev->fw_use_fallback =3D=
 false;                                                     =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82                      |-    ret =3D tas_fw_load(tas_dev,=
 slave);                                                    =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82                      |-    if (!ret && tas_dev->fw_use_=
fallback)                                                 =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |+            tas_dev->fw_use_fall=
back =3D false;                                             =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82                      |             ret =3D tas_fw_load(=
tas_dev, slave);                                            =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82                      |-                                =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |+            if (!ret && tas_dev-=
>fw_use_fallback)                                         =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |+                    ret =3D tas_=
fw_load(tas_dev, slave);                                    =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82                      |+    }                           =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |     if (!ret) {                 =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |             if (tas_dev->sa_func=
_data)                                                    =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |                     ret =3D sdca=
_regmap_write_init(dev, tas_dev->regmap,                    =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82                      |@@ -1197,7 +1206,8 @@ static s32 =
tas_io_init(struct device *dev, struct sdw_slave *slave)  =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |             else                =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |                     ret =3D regm=
ap_multi_reg_write(tas_dev->regmap, tas2783_init_seq,       =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82                      |                                 =
                 ARRAY_SIZE(tas2783_init_seq));           =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |-                                =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |+            /* Re-active AMP aft=
er resume. */                                             =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |+            regmap_write(tas_dev=
->regmap, TASDEV_REG_SDW(0, 0, 2), 0);                    =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |             if (ret)            =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |                     dev_err(tas_=
dev->dev,                                                 =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |                             "ini=
t writes failed, err=3D%d", ret);                           =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82                      |@@ -1357,6 +1367,7 @@ static s32 =
tas_sdw_probe(struct sdw_slave *peripheral,               =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |     tas_dev->dev =3D dev;       =
                                                            =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82                      |     tas_dev->sdw_peripheral =3D =
peripheral;                                                 =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82                      |     tas_dev->hw_init =3D false; =
                                                            =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82                      |+    tas_dev->first_hw_init =3D f=
alse;                                                       =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82                      |     mutex_init(&tas_dev->calib_l=
ock);                                                     =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |     mutex_init(&tas_dev->pde_loc=
k);                                                       =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |                                 =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |--                               =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |2.25.1                           =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |                                 =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |                                 =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |                                 =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |                                 =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      --- end body ---                  =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      has_diff: True                    =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      has_diffstat: True                =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      --- begin my trailers ---         =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      --- begin followup trailers ---   =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      --- end trailers ---              =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      --- begin attestors ---           =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      |    mode: DKIM                   =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                       level: domain                    =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                    identity: ti.com                    =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                    signtime: 2026-08-13 10:14:50+08:00 =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      keysrc: DNS                       =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                     keyalgo: None                      =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                     passing: True                      =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                    have_key: False                     =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      errors:                           =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      --- end attestors ---             =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82             lser =3D - Series: [v2] ASoC: tas2783-sdw: =
add firmware download status check                          =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82                      author: Baojun Xu <baojun.xu@ti.co=
m>                                                        =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      revision: 2                       =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      expected: 1                       =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      complete: True                    =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      has_cover: False                  =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      base_commit: None                 =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      change_id: None                   =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      partial_reroll: False             =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                      patches:                          =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                    =E2=94=82   [0/1] MISSING           =
                                                                  =E2=94=82=
 =E2=94=82
=E2=94=82 =E2=94=82                    =E2=94=82   [1/1] ASoC: tas2783-sdw:=
 add firmware download status check                               =E2=94=82=
 =E2=94=82
=E2=94=82 =E2=94=82       mismatches =3D [('sound/soc/codecs/tas2783-sdw.c'=
, 'c217da5fccdf')]                                          =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82             self =3D TrackingApp(title=3D'b4 review', c=
lasses=3D{'-dark-mode'}, pseudo_classes=3D{'dark', 'focus'})      =E2=94=82=
 =E2=94=82
=E2=94=82 =E2=94=82           series =3D {                                 =
                                                            =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82                    =E2=94=82   'track_id': 1304,       =
                                                                  =E2=94=82=
 =E2=94=82
=E2=94=82 =E2=94=82                    =E2=94=82   'change_id': '20260813-a=
soc-tas2783-sdw-add-firmware-download-status-check-3faf17a2a9c2', =E2=94=82=
 =E2=94=82
=E2=94=82 =E2=94=82                    =E2=94=82   'revision': 2,          =
                                                                  =E2=94=82=
 =E2=94=82
=E2=94=82 =E2=94=82                    =E2=94=82   'subject': 'ASoC: tas278=
3-sdw: add firmware download status check',                       =E2=94=82=
 =E2=94=82
=E2=94=82 =E2=94=82                    =E2=94=82   'sender_name': 'Baojun X=
u',                                                               =E2=94=82=
 =E2=94=82
=E2=94=82 =E2=94=82                    =E2=94=82   'sender_email': 'baojun.=
xu@ti.com',                                                       =E2=94=82=
 =E2=94=82
=E2=94=82 =E2=94=82                    =E2=94=82   'sent_at': '2026-08-13T1=
0:14:50+08:00',                                                   =E2=94=82=
 =E2=94=82
=E2=94=82 =E2=94=82                    =E2=94=82   'added_at': '2026-08-13T=
11:59:57.727998+00:00',                                           =E2=94=82=
 =E2=94=82
=E2=94=82 =E2=94=82                    =E2=94=82   'status': 'new',        =
                                                                  =E2=94=82=
 =E2=94=82
=E2=94=82 =E2=94=82                    =E2=94=82   'num_patches': 1,       =
                                                                  =E2=94=82=
 =E2=94=82
=E2=94=82 =E2=94=82                    =E2=94=82   ... +11                 =
                                                                  =E2=94=82=
 =E2=94=82
=E2=94=82 =E2=94=82                    }                                   =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82        top_msgid =3D '20260813021450.1897-1-baojun.xu@t=
i.com'                                                      =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82           topdir =3D '/home/broonie/git/apply'         =
                                                            =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=95=B0=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=95=AF =E2=94=82
=E2=94=82                                                                  =
                                                    =E2=94=82
=E2=94=82 /home/broonie/git/b4/src/b4/__init__.py:1516 in make_fake_am_rang=
e                                                   =E2=94=82
=E2=94=82                                                                  =
                                                    =E2=94=82
=E2=94=82   1513 =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82 =
  =E2=94=82   )                                                            =
                         =E2=94=82
=E2=94=82   1514 =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82 =
  =E2=94=82   return None, None                                            =
                         =E2=94=82
=E2=94=82   1515 =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82             =
                                                                           =
         =E2=94=82
=E2=94=82 =E2=9D=B1 1516 =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82   ms=
gs.append(lmsg.get_am_message(add_trailers=3DFalse))                       =
                   =E2=94=82
=E2=94=82   1517 =E2=94=82   =E2=94=82   =E2=94=82                         =
                                                                           =
 =E2=94=82
=E2=94=82   1518 =E2=94=82   =E2=94=82   =E2=94=82   ecode, out =3D git_run=
_command(dfn, ['write-tree'])                                              =
   =E2=94=82
=E2=94=82   1519 =E2=94=82   =E2=94=82   =E2=94=82   if ecode > 0:         =
                                                                           =
 =E2=94=82
=E2=94=82                                                                  =
                                                    =E2=94=82
=E2=94=82 =E2=95=AD=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80 locals =E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=95=AE =E2=94=82
=E2=94=82 =E2=94=82      at_base =3D 'heads/asoc-7.3-1-gd5061a86b9dd'      =
                                                            =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82   bound_hash =3D 'c217da5fccdf61b215d0ed5384c81ab80c643=
482'                                                        =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82    cachedata =3D None                                  =
                                                            =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82          dfn =3D '/tmp/tmp8f1tmf8f'                    =
                                                            =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82        ecode =3D 0                                     =
                                                            =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82   end_commit =3D None                                  =
                                                            =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82         fmod =3D '100644'                              =
                                                            =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82      gitargs =3D [                                     =
                                                            =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82                =E2=94=82   'update-index',             =
                                                                  =E2=94=82=
 =E2=94=82
=E2=94=82 =E2=94=82                =E2=94=82   '--add',                    =
                                                                  =E2=94=82=
 =E2=94=82
=E2=94=82 =E2=94=82                =E2=94=82   '--cacheinfo',              =
                                                                  =E2=94=82=
 =E2=94=82
=E2=94=82 =E2=94=82                =E2=94=82   '100644,c217da5fccdf61b215d0=
ed5384c81ab80c643482,sound/soc/codecs/tas2783-sdw.c'              =E2=94=82=
 =E2=94=82
=E2=94=82 =E2=94=82                ]                                       =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82       gitdir =3D '/home/broonie/git/apply'             =
                                                            =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82         lmsg =3D msgid: 20260813021450.1897-1-baojun.xu=
@ti.com                                                     =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82                  full_subject: [PATCH v2] ASoC: tas2783=
-sdw: add firmware download status check                  =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  subject: ASoC: tas2783-sdw: add firmwa=
re download status check                                  =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  reply: False                          =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  resend: False                         =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  patch: True                           =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  rfc: False                            =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  revision: 2                           =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  revision_inferred: False              =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  counter: 1                            =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  expected: 1                           =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  counters_inferred: True               =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  prefixes: PATCH, v2                   =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  fromname: Baojun Xu                   =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  fromemail: baojun.xu@ti.com           =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  date: 2026-08-13 10:14:50+08:00       =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  in_reply_to: None                     =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  --- begin body ---                    =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |Currently, the firmware download is u=
nnecessarily triggered on every                           =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |system resume from suspend, causing s=
ignificant wake-up latency. However,                      =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |this step is redundant if the AMP rem=
ains powered on. Furthermore, certain                     =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |memory pages (addresses > 0xc60000) a=
re skipped even after an AMP reset.                       =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |                                     =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |Signed-off-by: Baojun Xu <baojun.xu@t=
i.com>                                                    =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |---                                  =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |v2:                                  =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  | - Update register address from 0x07 =
to 7 and keep the line within the                         =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |   80-character limit.=E2=80=8C      =
                                                                   =E2=94=
=82 =E2=94=82
=E2=94=82 =E2=94=82                  | - =E2=80=8CRemove stray/unnecessary =
changes.=E2=80=8C                                                          =
 =E2=94=82 =E2=94=82
=E2=94=82 =E2=94=82                  | - =E2=80=8CChange variable type to u=
nsigned int to comply with API requirements.=E2=80=8C                      =
 =E2=94=82 =E2=94=82
=E2=94=82 =E2=94=82                  | - =E2=80=8CReplace usleep_range() wi=
th fsleep().=E2=80=8C                                                      =
 =E2=94=82 =E2=94=82
=E2=94=82 =E2=94=82                  | - =E2=80=8CSet idle_bias_on to 0 to =
enable low-power mode.                                             =E2=94=
=82 =E2=94=82
=E2=94=82 =E2=94=82                  | - Reactivate the AMP after resume.  =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |---                                  =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  | sound/soc/codecs/tas2783-sdw.c | 55 =
++++++++++++++++++++--------------                        =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  | 1 file changed, 33 insertions(+), 22=
 deletions(-)                                             =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |                                     =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |diff --git a/sound/soc/codecs/tas2783=
-sdw.c b/sound/soc/codecs/tas2783-sdw.c                   =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |index c217da5fccdf..8fc679d460d9 1006=
44                                                        =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |--- a/sound/soc/codecs/tas2783-sdw.c =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |+++ b/sound/soc/codecs/tas2783-sdw.c =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |@@ -97,6 +97,7 @@ struct tas2783_prv =
{                                                         =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |     u8 rca_binaryname[64];          =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |     u8 dev_name[32];                =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |     bool hw_init;                   =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |+    bool first_hw_init;             =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |     /* wq for firmware download */  =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |     wait_queue_head_t fw_wait;      =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |     bool fw_dl_task_done;           =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |@@ -783,14 +784,16 @@ static void tas=
2783_fw_ready(const struct firmware *fmw, void *context)  =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |                     file->version, f=
ile->length,                                              =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |                     file->dest_addr,=
 file->fw_data);                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |                                     =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |-            ret =3D sdw_nwrite_no_pm=
(tas_dev->sdw_peripheral,                                   =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82                  |-                                   f=
ile->dest_addr,                                           =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |-                                   f=
ile->length,                                              =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |-                                   f=
ile->fw_data);                                            =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |-            if (ret < 0) {          =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |-                    dev_err(tas_dev-=
>dev,                                                     =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |-                            "FW down=
load failed: %d", ret);                                   =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |-                    break;          =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |+            if (!tas_dev->first_hw_i=
nit || file->dest_addr < 0xc60000) {                      =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |+                    ret =3D sdw_nwri=
te_no_pm(tas_dev->sdw_peripheral,                           =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82                  |+                                    =
       file->dest_addr,                                   =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |+                                    =
       file->length,                                      =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |+                                    =
       file->fw_data);                                    =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |+                    if (ret < 0) {  =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |+                            dev_err(=
tas_dev->dev,                                             =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |+                                    =
"FW download failed: %d", ret);                           =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |+                            break;  =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |+                    }               =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |             }                       =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |             cur_file++;             =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |     }                               =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |@@ -801,6 +804,8 @@ static void tas27=
83_fw_ready(const struct firmware *fmw, void *context)    =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |             ret =3D -EINVAL;        =
                                                            =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82                  |     } else {                        =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |             tas2783_update_calibdata=
(tas_dev);                                                =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |+            regmap_write(tas_dev->re=
gmap, TASDEV_REG_SDW(0, 0, 7), 0x22);                     =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |+            tas_dev->first_hw_init =
=3D true;                                                    =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82                  |     }                               =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |                                     =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  | out:                                =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |@@ -940,7 +945,7 @@ static s32 tas_sd=
w_hw_params(struct snd_pcm_substream *substream,          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |                                     =
                TAS2783_SDCA_POW_STATE_ON);               =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |                     if (!ret)       =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |                             break;  =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |-                    usleep_range(200=
0, 2200);                                                 =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |+                    fsleep(2200);   =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |             } while (retry--);      =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |     }                               =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |                                     =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |@@ -1038,7 +1043,7 @@ static const st=
ruct snd_soc_component_driver soc_codec_driver_tasdevice  =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                =3D {                                   =
                                                            =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82                  |     .num_dapm_widgets =3D ARRAY_SIZE=
(tas_dapm_widgets),                                         =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82                  |     .dapm_routes =3D tas_audio_map, =
                                                            =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82                  |     .num_dapm_routes =3D ARRAY_SIZE(=
tas_audio_map),                                             =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82                  |-    .idle_bias_on =3D 1,            =
                                                            =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82                  |+    .idle_bias_on =3D 0,            =
                                                            =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82                  |     .endianness =3D 1,              =
                                                            =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82                  | };                                  =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |                                     =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |@@ -1171,25 +1176,29 @@ static s32 ta=
s_fw_load(struct tas2783_prv *tas_dev, struct sdw_slave   =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                *slave)                                 =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  | static s32 tas_io_init(struct device=
 *dev, struct sdw_slave *slave)                           =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  | {                                   =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |     struct tas2783_prv *tas_dev =3D =
dev_get_drvdata(dev);                                       =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82                  |+    unsigned int val;               =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |     s32 ret;                        =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |                                     =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |     if (tas_dev->hw_init)           =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |             return 0;               =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |                                     =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |-    tas_dev->fw_dl_success =3D false=
;                                                           =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82                  |+    regmap_read(tas_dev->regmap, TAS=
DEV_REG_SDW(0, 0, 7), &val);                              =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |+    /* Check if the AMP is in reset =
status. */                                                =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |+    if (val =3D=3D 0x20) {          =
                                                              =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82                  |+            tas_dev->fw_dl_success =
=3D false;                                                   =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82                  |                                     =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |-    ret =3D regmap_write(tas_dev->re=
gmap, TAS2783_SW_RESET, 0x1);                               =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82                  |-    if (ret) {                      =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |-            dev_err(dev, "sw reset f=
ailed, err=3D%d", ret);                                     =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82                  |-            return ret;             =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |-    }                               =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |-    usleep_range(2000, 2200);       =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |+            ret =3D regmap_write(tas=
_dev->regmap, TAS2783_SW_RESET, 0x1);                       =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82                  |+            if (ret) {              =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |+                    dev_err(dev, "sw=
 reset failed, err=3D%d", ret);                             =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82                  |+                    return ret;     =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |+            }                       =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |+            fsleep(2200);           =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |                                     =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |-    tas_dev->fw_use_fallback =3D fal=
se;                                                         =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82                  |-    ret =3D tas_fw_load(tas_dev, sla=
ve);                                                        =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82                  |-    if (!ret && tas_dev->fw_use_fall=
back)                                                     =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |+            tas_dev->fw_use_fallback=
 =3D false;                                                 =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82                  |             ret =3D tas_fw_load(tas_=
dev, slave);                                                =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82                  |-                                    =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |+            if (!ret && tas_dev->fw_=
use_fallback)                                             =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |+                    ret =3D tas_fw_l=
oad(tas_dev, slave);                                        =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82                  |+    }                               =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |     if (!ret) {                     =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |             if (tas_dev->sa_func_dat=
a)                                                        =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |                     ret =3D sdca_reg=
map_write_init(dev, tas_dev->regmap,                        =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82                  |@@ -1197,7 +1206,8 @@ static s32 tas_=
io_init(struct device *dev, struct sdw_slave *slave)      =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |             else                    =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |                     ret =3D regmap_m=
ulti_reg_write(tas_dev->regmap, tas2783_init_seq,           =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82                  |                                     =
             ARRAY_SIZE(tas2783_init_seq));               =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |-                                    =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |+            /* Re-active AMP after r=
esume. */                                                 =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |+            regmap_write(tas_dev->re=
gmap, TASDEV_REG_SDW(0, 0, 2), 0);                        =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |             if (ret)                =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |                     dev_err(tas_dev-=
>dev,                                                     =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |                             "init wr=
ites failed, err=3D%d", ret);                               =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82                  |@@ -1357,6 +1367,7 @@ static s32 tas_=
sdw_probe(struct sdw_slave *peripheral,                   =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |     tas_dev->dev =3D dev;           =
                                                            =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82                  |     tas_dev->sdw_peripheral =3D peri=
pheral;                                                     =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82                  |     tas_dev->hw_init =3D false;     =
                                                            =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82                  |+    tas_dev->first_hw_init =3D false=
;                                                           =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82                  |     mutex_init(&tas_dev->calib_lock)=
;                                                         =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |     mutex_init(&tas_dev->pde_lock); =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |                                     =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |--                                   =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |2.25.1                               =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |                                     =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |                                     =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |                                     =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |                                     =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  --- end body ---                      =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  has_diff: True                        =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  has_diffstat: True                    =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  --- begin my trailers ---             =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  --- begin followup trailers ---       =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  --- end trailers ---                  =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  --- begin attestors ---               =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  |    mode: DKIM                       =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   level: domain                        =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                identity: ti.com                        =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                signtime: 2026-08-13 10:14:50+08:00     =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  keysrc: DNS                           =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                 keyalgo: None                          =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                 passing: True                          =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                have_key: False                         =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  errors:                               =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  --- end attestors ---                 =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82        msgid =3D '20260813021450.1897-1-baojun.xu@ti.co=
m'                                                          =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82         msgs =3D []                                    =
                                                            =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82          nfn =3D 'sound/soc/codecs/tas2783-sdw.c'      =
                                                            =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82          ofi =3D 'c217da5fccdf'                        =
                                                            =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82          ofn =3D 'sound/soc/codecs/tas2783-sdw.c'      =
                                                            =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82          out =3D ''                                    =
                                                            =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82    seenfiles =3D {'sound/soc/codecs/tas2783-sdw.c'}    =
                                                            =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82         self =3D - Series: [v2] ASoC: tas2783-sdw: add =
firmware download status check                              =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82                  author: Baojun Xu <baojun.xu@ti.com>  =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  revision: 2                           =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  expected: 1                           =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  complete: True                        =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  has_cover: False                      =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  base_commit: None                     =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  change_id: None                       =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  partial_reroll: False                 =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  patches:                              =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                =E2=94=82   [0/1] MISSING               =
                                                                  =E2=94=82=
 =E2=94=82
=E2=94=82 =E2=94=82                =E2=94=82   [1/1] ASoC: tas2783-sdw: add=
 firmware download status check                                   =E2=94=82=
 =E2=94=82
=E2=94=82 =E2=94=82 start_commit =3D None                                  =
                                                            =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82       topdir =3D '/home/broonie/git/apply'             =
                                                            =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=95=B0=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=95=AF =E2=94=82
=E2=94=82                                                                  =
                                                    =E2=94=82
=E2=94=82 /home/broonie/git/b4/src/b4/__init__.py:3323 in get_am_message   =
                                                    =E2=94=82
=E2=94=82                                                                  =
                                                    =E2=94=82
=E2=94=82   3320 =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82 =
  # find the offending char                                                =
                 =E2=94=82
=E2=94=82   3321 =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82 =
  for at, c in enumerate(line.rstrip('\r')):                               =
                 =E2=94=82
=E2=94=82   3322 =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82 =
  =E2=94=82   if unicodedata.category(c) =3D=3D 'Cf':                      =
                             =E2=94=82
=E2=94=82 =E2=9D=B1 3323 =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82   =
=E2=94=82   =E2=94=82   =E2=94=82   raise BadCharsError(                   =
                                           =E2=94=82
=E2=94=82   3324 =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82 =
  =E2=94=82   =E2=94=82   =E2=94=82   self.full_subject, line.rstrip('\r'),=
 at, c                                   =E2=94=82
=E2=94=82   3325 =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82 =
  =E2=94=82   =E2=94=82   )                                                =
                                 =E2=94=82
=E2=94=82   3326                                                           =
                                                    =E2=94=82
=E2=94=82                                                                  =
                                                    =E2=94=82
=E2=94=82 =E2=95=AD=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80 locals =E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=95=AE =E2=94=82
=E2=94=82 =E2=94=82  add_trailers =3D False                                =
                                                            =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82      addmysob =3D False                                =
                                                            =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82 allowbadchars =3D False                                =
                                                            =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82            at =3D 22                                   =
                                                            =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82             c =3D '\u200c'                             =
                                                            =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82       copyccs =3D False                                =
                                                            =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82        extras =3D None                                 =
                                                            =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82          line =3D '   80-character limit.\u200c'       =
                                                            =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82          self =3D msgid: 20260813021450.1897-1-baojun.x=
u@ti.com                                                    =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82                   full_subject: [PATCH v2] ASoC: tas278=
3-sdw: add firmware download status check                 =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   subject: ASoC: tas2783-sdw: add firmw=
are download status check                                 =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   reply: False                         =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   resend: False                        =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   patch: True                          =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   rfc: False                           =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   revision: 2                          =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   revision_inferred: False             =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   counter: 1                           =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   expected: 1                          =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   counters_inferred: True              =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   prefixes: PATCH, v2                  =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   fromname: Baojun Xu                  =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   fromemail: baojun.xu@ti.com          =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   date: 2026-08-13 10:14:50+08:00      =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   in_reply_to: None                    =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   --- begin body ---                   =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |Currently, the firmware download is =
unnecessarily triggered on every                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |system resume from suspend, causing =
significant wake-up latency. However,                     =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |this step is redundant if the AMP re=
mains powered on. Furthermore, certain                    =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |memory pages (addresses > 0xc60000) =
are skipped even after an AMP reset.                      =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |                                    =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |Signed-off-by: Baojun Xu <baojun.xu@=
ti.com>                                                   =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |---                                 =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |v2:                                 =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   | - Update register address from 0x07=
 to 7 and keep the line within the                        =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |   80-character limit.=E2=80=8C     =
                                                                   =E2=94=
=82 =E2=94=82
=E2=94=82 =E2=94=82                   | - =E2=80=8CRemove stray/unnecessary=
 changes.=E2=80=8C                                                         =
 =E2=94=82 =E2=94=82
=E2=94=82 =E2=94=82                   | - =E2=80=8CChange variable type to =
unsigned int to comply with API requirements.=E2=80=8C                     =
 =E2=94=82 =E2=94=82
=E2=94=82 =E2=94=82                   | - =E2=80=8CReplace usleep_range() w=
ith fsleep().=E2=80=8C                                                     =
 =E2=94=82 =E2=94=82
=E2=94=82 =E2=94=82                   | - =E2=80=8CSet idle_bias_on to 0 to=
 enable low-power mode.                                            =E2=94=
=82 =E2=94=82
=E2=94=82 =E2=94=82                   | - Reactivate the AMP after resume. =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |---                                 =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   | sound/soc/codecs/tas2783-sdw.c | 55=
 ++++++++++++++++++++--------------                       =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   | 1 file changed, 33 insertions(+), 2=
2 deletions(-)                                            =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |                                    =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |diff --git a/sound/soc/codecs/tas278=
3-sdw.c b/sound/soc/codecs/tas2783-sdw.c                  =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |index c217da5fccdf..8fc679d460d9 100=
644                                                       =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |--- a/sound/soc/codecs/tas2783-sdw.c=
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |+++ b/sound/soc/codecs/tas2783-sdw.c=
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |@@ -97,6 +97,7 @@ struct tas2783_prv=
 {                                                        =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |     u8 rca_binaryname[64];         =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |     u8 dev_name[32];               =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |     bool hw_init;                  =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |+    bool first_hw_init;            =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |     /* wq for firmware download */ =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |     wait_queue_head_t fw_wait;     =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |     bool fw_dl_task_done;          =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |@@ -783,14 +784,16 @@ static void ta=
s2783_fw_ready(const struct firmware *fmw, void *context) =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |                     file->version, =
file->length,                                             =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |                     file->dest_addr=
, file->fw_data);                                         =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |                                    =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |-            ret =3D sdw_nwrite_no_p=
m(tas_dev->sdw_peripheral,                                  =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82                   |-                                   =
file->dest_addr,                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |-                                   =
file->length,                                             =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |-                                   =
file->fw_data);                                           =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |-            if (ret < 0) {         =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |-                    dev_err(tas_dev=
->dev,                                                    =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |-                            "FW dow=
nload failed: %d", ret);                                  =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |-                    break;         =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |+            if (!tas_dev->first_hw_=
init || file->dest_addr < 0xc60000) {                     =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |+                    ret =3D sdw_nwr=
ite_no_pm(tas_dev->sdw_peripheral,                          =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82                   |+                                   =
        file->dest_addr,                                  =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |+                                   =
        file->length,                                     =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |+                                   =
        file->fw_data);                                   =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |+                    if (ret < 0) { =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |+                            dev_err=
(tas_dev->dev,                                            =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |+                                   =
 "FW download failed: %d", ret);                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |+                            break; =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |+                    }              =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |             }                      =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |             cur_file++;            =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |     }                              =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |@@ -801,6 +804,8 @@ static void tas2=
783_fw_ready(const struct firmware *fmw, void *context)   =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |             ret =3D -EINVAL;       =
                                                            =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82                   |     } else {                       =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |             tas2783_update_calibdat=
a(tas_dev);                                               =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |+            regmap_write(tas_dev->r=
egmap, TASDEV_REG_SDW(0, 0, 7), 0x22);                    =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |+            tas_dev->first_hw_init =
=3D true;                                                   =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82                   |     }                              =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |                                    =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   | out:                               =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |@@ -940,7 +945,7 @@ static s32 tas_s=
dw_hw_params(struct snd_pcm_substream *substream,         =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |                                    =
                 TAS2783_SDCA_POW_STATE_ON);              =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |                     if (!ret)      =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |                             break; =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |-                    usleep_range(20=
00, 2200);                                                =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |+                    fsleep(2200);  =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |             } while (retry--);     =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |     }                              =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |                                    =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |@@ -1038,7 +1043,7 @@ static const s=
truct snd_soc_component_driver soc_codec_driver_tasdevice =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                 =3D {                                  =
                                                            =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82                   |     .num_dapm_widgets =3D ARRAY_SIZ=
E(tas_dapm_widgets),                                        =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82                   |     .dapm_routes =3D tas_audio_map,=
                                                            =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82                   |     .num_dapm_routes =3D ARRAY_SIZE=
(tas_audio_map),                                            =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82                   |-    .idle_bias_on =3D 1,           =
                                                            =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82                   |+    .idle_bias_on =3D 0,           =
                                                            =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82                   |     .endianness =3D 1,             =
                                                            =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82                   | };                                 =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |                                    =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |@@ -1171,25 +1176,29 @@ static s32 t=
as_fw_load(struct tas2783_prv *tas_dev, struct sdw_slave  =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                 *slave)                                =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   | static s32 tas_io_init(struct devic=
e *dev, struct sdw_slave *slave)                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   | {                                  =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |     struct tas2783_prv *tas_dev =3D=
 dev_get_drvdata(dev);                                      =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82                   |+    unsigned int val;              =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |     s32 ret;                       =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |                                    =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |     if (tas_dev->hw_init)          =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |             return 0;              =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |                                    =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |-    tas_dev->fw_dl_success =3D fals=
e;                                                          =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82                   |+    regmap_read(tas_dev->regmap, TA=
SDEV_REG_SDW(0, 0, 7), &val);                             =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |+    /* Check if the AMP is in reset=
 status. */                                               =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |+    if (val =3D=3D 0x20) {         =
                                                              =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82                   |+            tas_dev->fw_dl_success =
=3D false;                                                  =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82                   |                                    =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |-    ret =3D regmap_write(tas_dev->r=
egmap, TAS2783_SW_RESET, 0x1);                              =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82                   |-    if (ret) {                     =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |-            dev_err(dev, "sw reset =
failed, err=3D%d", ret);                                    =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82                   |-            return ret;            =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |-    }                              =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |-    usleep_range(2000, 2200);      =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |+            ret =3D regmap_write(ta=
s_dev->regmap, TAS2783_SW_RESET, 0x1);                      =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82                   |+            if (ret) {             =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |+                    dev_err(dev, "s=
w reset failed, err=3D%d", ret);                            =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82                   |+                    return ret;    =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |+            }                      =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |+            fsleep(2200);          =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |                                    =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |-    tas_dev->fw_use_fallback =3D fa=
lse;                                                        =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82                   |-    ret =3D tas_fw_load(tas_dev, sl=
ave);                                                       =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82                   |-    if (!ret && tas_dev->fw_use_fal=
lback)                                                    =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |+            tas_dev->fw_use_fallbac=
k =3D false;                                                =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82                   |             ret =3D tas_fw_load(tas=
_dev, slave);                                               =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82                   |-                                   =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |+            if (!ret && tas_dev->fw=
_use_fallback)                                            =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |+                    ret =3D tas_fw_=
load(tas_dev, slave);                                       =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82                   |+    }                              =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |     if (!ret) {                    =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |             if (tas_dev->sa_func_da=
ta)                                                       =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |                     ret =3D sdca_re=
gmap_write_init(dev, tas_dev->regmap,                       =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82                   |@@ -1197,7 +1206,8 @@ static s32 tas=
_io_init(struct device *dev, struct sdw_slave *slave)     =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |             else                   =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |                     ret =3D regmap_=
multi_reg_write(tas_dev->regmap, tas2783_init_seq,          =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82                   |                                    =
              ARRAY_SIZE(tas2783_init_seq));              =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |-                                   =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |+            /* Re-active AMP after =
resume. */                                                =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |+            regmap_write(tas_dev->r=
egmap, TASDEV_REG_SDW(0, 0, 2), 0);                       =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |             if (ret)               =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |                     dev_err(tas_dev=
->dev,                                                    =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |                             "init w=
rites failed, err=3D%d", ret);                              =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82                   |@@ -1357,6 +1367,7 @@ static s32 tas=
_sdw_probe(struct sdw_slave *peripheral,                  =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |     tas_dev->dev =3D dev;          =
                                                            =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82                   |     tas_dev->sdw_peripheral =3D per=
ipheral;                                                    =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82                   |     tas_dev->hw_init =3D false;    =
                                                            =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82                   |+    tas_dev->first_hw_init =3D fals=
e;                                                          =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82                   |     mutex_init(&tas_dev->calib_lock=
);                                                        =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |     mutex_init(&tas_dev->pde_lock);=
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |                                    =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |--                                  =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |2.25.1                              =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |                                    =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |                                    =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |                                    =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |                                    =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   --- end body ---                     =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   has_diff: True                       =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   has_diffstat: True                   =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   --- begin my trailers ---            =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   --- begin followup trailers ---      =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   --- end trailers ---                 =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   --- begin attestors ---              =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   |    mode: DKIM                      =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                    level: domain                       =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                 identity: ti.com                       =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                 signtime: 2026-08-13 10:14:50+08:00    =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   keysrc: DNS                          =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  keyalgo: None                         =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                  passing: True                         =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                 have_key: False                        =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   errors:                              =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82                   --- end attestors ---                =
                                                          =E2=94=82 =E2=94=
=82
=E2=94=82 =E2=94=82         ucats =3D {'Pd', 'Nd', 'Ll', 'Cf', 'Zs', 'Po'} =
                                                            =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=94=82   unicodedata =3D <module 'unicodedata' (built-in)>    =
                                                            =E2=94=82 =E2=
=94=82
=E2=94=82 =E2=95=B0=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=95=AF =E2=94=82
=E2=95=B0=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=95=AF
BadCharsError: Suspicious unicode control character in "[PATCH v2] ASoC: ta=
s2783-sdw: add firmware download status=20
check": ZERO WIDTH NON-JOINER (0x200c)

--qK3F7+Co7rzaoStd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp+GGMACgkQJNaLcl1U
h9BVjQgAgEBoScz8IpyQ66OO3mmu6fn/KHghZRHekaSCWTmiFiVAG9fbb3qR8TMh
VaRWJUmy7H+Y/jy+sDPV59bg9nV+cCUWOIAY0FsUBMA7waX8m0f0TDHf6sfH/5Eg
oeZjAMRBj7/AvzVzLEpJ4diAjDYqdMZilADQF8dMc6QvL+T+GX5Hmm30Gj35Be0j
K+FP/NKK3LvJPM9+lulBuY7AFYOmc7p7R9BrQVKXGMB6yCsETcs7sDrMOjG/QIe+
jK+qUoP/MFp26wjLO2bmc2tlLx3USruQU41IAmBl82nQCzuJwscUSf94dSqmvvFA
LZZVbJDjiOf/Y/n+fq7Nx9U+6zP42w==
=5jxu
-----END PGP SIGNATURE-----

--qK3F7+Co7rzaoStd--
