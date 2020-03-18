Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web12.721.1584569888097742762
 for <tools@linux.kernel.org>;
 Wed, 18 Mar 2020 15:18:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fPW8OJUf;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.67, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-wr1-f67.google.com with SMTP id v11so373996wrm.9
        for <tools@linux.kernel.org>; Wed, 18 Mar 2020 15:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=4rK3ZpG6FmNa69ENvoWDupoWdI4RfWyrGHJtUS7Xvno=;
        b=fPW8OJUfxpx26+6lIgqxyN/+DHOp9nvfGHRRarQreBleSlqz2nbGjluJ/d6HmBJt1a
         YRbf1Y4aYd9sbHRmGFLEau1TX0fkRKWWt6BhlOclUatJopMYmevzSaFs14c8PV9zpJ/n
         N38TetuK6p1QqRKWiy+Pt5YXngHUlmilVz6XY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4rK3ZpG6FmNa69ENvoWDupoWdI4RfWyrGHJtUS7Xvno=;
        b=J7NVzjNfNaCzMVTd3F6VaWgtK6DUn/zN+QoFMLPtmMKthepmfmqXnOmiphBwvasdgd
         H7Xd0/N2FwmfOuRLnqmViYO0SjcI3tqMi29OaqjEtwvJPUo7xhBR9s9ggKr6nMY6dRaG
         Qdvp1oGKiMlZDVO8+y34rA+fRLEmOj9NCypCoSg2X2PI/eD5kqhDlIkgw/+salS4BoQK
         yGv9wEB/fFaehTnUUnblKfM85mtwHcLEpsjgIh8+k2wbzwrJjLsay68mS5gAJ2pfluAF
         d/zQYEd5zxp0rXGG5s5gZW7jV8EUhK1BtMVSdgSNqPCXSQmeKLsfHPLZADr1ZJtLEoUj
         Op+Q==
X-Gm-Message-State: ANhLgQ2+gpGaPbpyMiwnlG+TtFNpjIjgQM/AO+09K/Ddcbshk0+vXaKY
	v7xFcPKvV6v8v9JKCnEeESHRow==
X-Google-Smtp-Source: ADFU+vv/wHLjzFRyGafT5pj7XM9YP66F4kPRb6Jp6ekQaIEyW4Uho/kydNsaRVqC3waEpLov1NzOAQ==
X-Received: by 2002:adf:f1ce:: with SMTP id z14mr116454wro.68.1584569886452;
        Wed, 18 Mar 2020 15:18:06 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local ([185.220.102.6])
        by smtp.gmail.com with ESMTPSA id e1sm286795wrx.90.2020.03.18.15.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2020 15:18:05 -0700 (PDT)
Date: Wed, 18 Mar 2020 18:18:02 -0400
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@linux.kernel.org
Subject: Re: b4 not finding patches
Message-ID: <20200318221802.25sxldeocw7dchsi@chatter.i7.local>
References: <20200318202335.GF4553@sirena.org.uk>
 <20200318203838.jb2q4g4sxstob75e@chatter.i7.local>
 <20200318205914.GG4553@sirena.org.uk>
MIME-Version: 1.0
In-Reply-To: <20200318205914.GG4553@sirena.org.uk>
X-Groupsio-MsgNum: 7
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="l73xbpepfsvvwrq3"
Content-Disposition: inline

--l73xbpepfsvvwrq3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 18, 2020 at 08:59:14PM +0000, Mark Brown wrote:
> > I'm not sure if there is a reliably clean way of handling this=20
> > situation, but I'll think about it. For this particular case, you=20
> > can just pass -v1 to "b4 am" to grab the actual patches.
>=20
> ...but not the tags added to the cover letter which is the main reason
> I'm doing this :/ .  I do see the issue given people sending new
> serieses in reply to existing ones though.  Perhaps some heuristic about
> lack of ambiguity (eg, if we're looking for six patches and find exactly
> six patches)?

I have code that properly handles this situation in master:

------
$ python3 b4/command.py am -o/tmp 87y2s0olg6.wl-kuninori.morimoto.gx@renesa=
s.com -t
Looking up https://lore.kernel.org/r/87y2s0olg6.wl-kuninori.morimoto.gx@ren=
esas.com
Grabbing thread from lore.kernel.org
Analyzing 13 messages in the thread
---
Writing /tmp/v3_20200316_kuninori_morimoto_gx_renesas_com.mbx
  [PATCH 1/6] ASoC: soc-core: Merge CPU/Codec DAIs
    Added: Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.co=
m>
    Added: Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.in=
tel.com>
  [PATCH 2/6] ASoC: soc-core: Merge for_each_rtd_cpu/codec_dais()
    Added: Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.co=
m>
    Added: Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.in=
tel.com>
  [PATCH 3/6] ASoC: soc-dapm: Merge for_each_rtd_cpu/codec_dais()
    Added: Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.co=
m>
    Added: Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.in=
tel.com>
  [PATCH 4/6] ASoC: soc-pcm: Merge for_each_rtd_cpu/codec_dais()
    Added: Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.co=
m>
    Added: Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.in=
tel.com>
  [PATCH 5/6] ASoC: soc-core: Merge CPU/Codec for soc_dai_pcm_new()
    Added: Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.co=
m>
    Added: Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.in=
tel.com>
  [PATCH 6/6] ASoC: soc-pcm: Merge CPU/Codec MSB at soc_pcm_apply_msb()
    Added: Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.co=
m>
    Added: Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.in=
tel.com>
---
Total patches: 6
---
Cover: /tmp/v3_20200316_kuninori_morimoto_gx_renesas_com.cover
 Link: https://lore.kernel.org/r/87y2s0olg6.wl-kuninori.morimoto.gx@renesas=
=2Ecom
 Base: not found, sorry
       git checkout -b v3_20200316_kuninori_morimoto_gx_renesas_com master
       git am /tmp/v3_20200316_kuninori_morimoto_gx_renesas_com.mbx
------

You can try that directly from the repo (if you set PYTHONPATH=3D.), or=20
build your own package.

Alternatively, you can run:

b4 mbox 87y2s0olg6.wl-kuninori.morimoto.gx@renesas.com
(edit all subjects to add v3 to them)
b4 am 87y2s0olg6.wl-kuninori.morimoto.gx@renesas.com -m that.mbox

I'll probably release 0.3.4 tomorrow with a couple more fixes.

Best,
-K

--l73xbpepfsvvwrq3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQR2vl2yUnHhSB5njDW2xBzjVmSZbAUCXnKeGAAKCRC2xBzjVmSZ
bPkaAP9tkMrjB85rm7OsQo0J5wnJ0DDYwUvIlMEwo7jEcZK1OwD/YAIaZjt5UdoZ
Qy49obu0wDAXJw2X3MdrNS98Fd3lEQU=
=bqQ3
-----END PGP SIGNATURE-----

--l73xbpepfsvvwrq3--
