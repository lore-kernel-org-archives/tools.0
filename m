Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web12.19934.1589567487449725821
 for <tools@linux.kernel.org>;
 Fri, 15 May 2020 11:31:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Er6yqNqg;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.160.170, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-qt1-f170.google.com with SMTP id t25so2826448qtc.0
        for <tools@linux.kernel.org>; Fri, 15 May 2020 11:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=nQIigbyhw6nHV6Z5rh8ZOrey3uHWWUaH8AoaorpWUkU=;
        b=Er6yqNqgNrDToei27xQ90xLgEQtSS5AHGy2TIo2/MXyVVR1+3ooQOcqWBp1Dmea+Xs
         mVkUOwL+iU4aH/fwe5nem9/qHi5EoKQMf5AAQiZrp40rdgudZKYlaV8IgbMHZeMqHfFu
         O79osbW0SYnKLca/AVQzPz3cFEUZqUq6JZLn0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nQIigbyhw6nHV6Z5rh8ZOrey3uHWWUaH8AoaorpWUkU=;
        b=sAbigMUYi8pRqdFzH1MeHcoUw6HoOQr4IPdhT0sj4LT1qJih51A2Ko4+N/XSSv5ASZ
         s9f3JqOTiz8XTAyYl4OTnP9oIeOHDetqNeOzh+rA3LJfDrWxgv/VK/YArNxTIKtGUCID
         xSVmIe6SpNeccjlwXHM07ny2+++syt/xxRA3udP/k3nJwJU/IFIK3XT62w5cEGgzjBgD
         AUedxlLnYxZfjFaoXbIpnDEXLDNLo7as38WNk49kw0OdgJuNEPVTyv857kOxCsN4DxqF
         2hqiubnHdr7wo+wgEnh5qZcleFB1c6y69OTior37mC1ePPuvd+et/nBoh5vSpfWYwWc2
         76Fg==
X-Gm-Message-State: AOAM531V3teYQM4BVLtzIrBwBmoeUy7at+03aLhHNjo/QaaiAibRh9Vu
	p9hFFbDvaJAz4yuEL68XQHZ+xw==
X-Google-Smtp-Source: ABdhPJxzk/R21J+lMP0363j5f1uw+LGV2ALnvb+WH/w0BZ7XoXAslYibjPjTQpLRq13pHVFcO0Ek3w==
X-Received: by 2002:ac8:7249:: with SMTP id l9mr5055973qtp.224.1589567486512;
        Fri, 15 May 2020 11:31:26 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from i7.mricon.com (107-179-243-71.cpe.teksavvy.com. [107.179.243.71])
        by smtp.gmail.com with ESMTPSA id g5sm2101982qkl.114.2020.05.15.11.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2020 11:31:25 -0700 (PDT)
Received: by i7.mricon.com (sSMTP sendmail emulation); Fri, 15 May 2020 14:31:23 -0400
Date: Fri, 15 May 2020 14:31:23 -0400
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@linux.kernel.org
Subject: Re: b4 ty issues matching remote branches
Message-ID: <20200515183123.ya7z53275szbn5xz@chatter.i7.local>
References: <20200515180542.GM5066@sirena.org.uk>
MIME-Version: 1.0
In-Reply-To: <20200515180542.GM5066@sirena.org.uk>
X-Groupsio-MsgNum: 161
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hwfyrvjlobougpyk"
Content-Disposition: inline

--hwfyrvjlobougpyk
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 15, 2020 at 07:05:42PM +0100, Mark Brown wrote:
> Hi Konstantin,
>=20
> Having updated to the latest master a command like
>=20
> 	b4 ty -b remote/foo -a
>=20
> has started to report errors like
>=20
> 	Requested branch asoc/for-5.7 not found in git branch --list --all
>=20
> This is true since "git branch --list --all" lists remotes as
> remotes/name/branch while most git commands accept name/branch (and git
> branch -r lists them as such).  For some reason tweaking to add a
> remotes/ on the front doesn't seem to work either, even though grepping
> the output appears to confirm that the branch is there under that=20
> name.

I think I was trying too hard. I've committed a small fix to current=20
master -- that should relax our sanity-checking logic.

-K

--hwfyrvjlobougpyk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQR2vl2yUnHhSB5njDW2xBzjVmSZbAUCXr7f+QAKCRC2xBzjVmSZ
bKvKAP9LfbCbzXQ/NX+XtgRaC14qkGS8DY2I+8oSFwuZiailoAEApCjpp8ABxOt+
m/cyrsPkQ3EBOS+EogISFZZnMH0ytwg=
=BImH
-----END PGP SIGNATURE-----

--hwfyrvjlobougpyk--
