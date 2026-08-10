Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08E33B05BF
	for <tools@linux.kernel.org>; Mon, 10 Aug 2026 11:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786362711; cv=pass; b=dkrh10PgYwEaHHwCaQmdkMB6MkCLX4UFU2A9t0chVKjhUHzHTrOz1ovldG0DXNMQdlLcCRPBhXKyuuXKIkVI53CkQg5ICuIMp8XKS791PD/q+4fNc8ky6bq5Z6MMXWRCxpOO1meBxWcHryJJw/EvPokNmBnNUCKLKkACp7nMrgc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786362711; c=relaxed/simple;
	bh=TcVudtyFN7jIRvfK6zLPEIq1V5bLmZxpuKxOH30OOA0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pDa14XzKKARoXvt80DICjdUT0gbVrg8kjzWdmCrqVk/M6qOSkFBwWS3m1+F76HorJDeJVoj9msK5uwajazzBuPw88Kkr2clCpUZfUAUqE8DKcH2c+z/flw7N8010St+g7cY91JBGMF2c9INSPHBMKcXkabWBtRW2xBJtbplmmUk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VTUjKT6v; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=uM7ZJJgw; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VTUjKT6v";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="uM7ZJJgw"
Received: by smtp.kernel.org (Postfix)
	id B97521F00A3A; Mon, 10 Aug 2026 11:51:49 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1786362709;
	b=qsmfFJLiJYnWBvX5ea8A8NYoWG3las6O+IZd1DBaQW6GvVXApFksfTHa72FjAcwuMEAY
	 jEYFRbwfy4iNtQJTxSsTuunlyIaGg/Qwn/Ui26tYktLE0aBz79w/NICRJSBvQ7ZDUO59H
	 JQiaeipyZH0pqN5SPgyi+Ey9/d5mP7eueWNK2TNC6m5S7Prk4YcYiKWWR1r3yt+j85CGG
	 lteiN9P2+e37Zy4QAmbhLIWC0IT9a5tXibf8PcSAie+5y0KaubZag/bDasxkqtZX/Usx4
	 O6k8/oPecBOKeVw50vnIK9FV9TiAQCIyWJUDyFY7LLi3D9J1BSioPlVfnRgPYuBCtWg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1786362709;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=CYerMZoun1qCT8lRUkLg0talV9CuNHJQUBQqJaSUEow=;
	b=qiJg5n6afjEotuwQ7ZFxrIEeO0PGwP3FgpnT3h3UejhUqwo1IJmuyPt9uUpVDGmoTD4l
	 PgpNH2j65ar25e125g/w9SEATzqUcVI7t9tVjwh8DF6rGH1Nuy+O0Zls3/QXdGNhFtyBF
	 HW4Mz5MPNNzoVFOcw0p3bG/NiAH+EeNUvJQrlmto3dfx+cNXO+YKALmjwtYWP6k/uMw8x
	 KIyvbmrMcpch2OYFbs8McbubAELkW6baomPOUhQZxvnuWWjgzdnBdZd8TGSAHu9aBGbac
	 Z1wEXmfxUympmT6De9qqQZjj/o1QJI+rMAmUl7Gh9SRWgQYpIeuc1OqMmsJpBm76tkQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VTUjKT6v;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=uM7ZJJgw;
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1B6A41F000E9
	for <tools@kernel.org>; Mon, 10 Aug 2026 11:51:49 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VTUjKT6v;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=uM7ZJJgw
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 1B6A41F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786362708;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CYerMZoun1qCT8lRUkLg0talV9CuNHJQUBQqJaSUEow=;
	b=VTUjKT6vB3zBC5loOzfODRgfmkvdPnTMneUtwLK5MvTVLs396G6mjaRe6uosy+9KKc5zEf
	E5yuDebLarHVaztwnuBZdKrS2pC2zyEnlugf1/ULULjPsndcyqeT+rvWhCN1Jm1AjHZBUQ
	iU+QJa9WmXTbWd7e9VOMO4Q+gjUL8n8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-643-D87yZa26MzG4G2XEOw6vJw-1; Mon, 10 Aug 2026 07:51:45 -0400
X-MC-Unique: D87yZa26MzG4G2XEOw6vJw-1
X-Mimecast-MFC-AGG-ID: D87yZa26MzG4G2XEOw6vJw_1786362704
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-47f753a0aa0so1170730f8f.3
        for <tools@kernel.org>; Mon, 10 Aug 2026 04:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1786362704; x=1786967504; darn=kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CYerMZoun1qCT8lRUkLg0talV9CuNHJQUBQqJaSUEow=;
        b=uM7ZJJgwzbPbyF5In9FIp0ASh6g8YLg9dhZTZFOpMwdLO+O4+gkNjx1IHg4ycOFYON
         xzTOBkL90oos3wM0A0ji3JbHQNDdSIOrXE/Ab3tHtRciHn0z7NbTYjbUHA+7ALBnlww1
         b80iDPf9ZYzG2fbrxtlakU9VadwAYLCbPCF3H+iQ5Xq4DRGoslurQXqokrYu+BmeVSlI
         XcvGUNyBUGeH5NTZf+zHRCRf3pUGoyLrc5zBCu4/V0HEo7abRJykkhOldYkRgKPMgkoS
         znSqNjQW5PY3p32YGLdFOT8qNdjxK72f36MkMbMtp+AsOqizk98uQC3N6Iu7D2Jwt8jv
         GkEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786362704; x=1786967504;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CYerMZoun1qCT8lRUkLg0talV9CuNHJQUBQqJaSUEow=;
        b=YQPE4QtYeQ/57zI+G4dTrnHLWaA6rhkP22tq69VffVqgmm7a37JoaasOS8EHi8kGVL
         rICvca07wkupETcJSKEXNISzqIpSR12G+e72hKf4YHmCFsw1dsbyKRmcFcJ6KhikTYlq
         ofmp91f8Z3/94VaekHVBFcbV1BJlJXWG7yG+Lq0niak46MhS7+VPi5bxmjt8umhLUyU+
         66QwznrV7DytqLzsgf0L59Ng1o+IZeFCYvnoqO/7zeDlof96cD6zJJ1/2SCBIZAyc6Tb
         0VzplbsMBvcOFZCWhrfNwiq8+iLm2PhEAp1aXmdiZ+jqzlbbLZOM1d082PTA0PQLYVXP
         sSZg==
X-Gm-Message-State: AOJu0YzR4eA1qv8Ky+TMJxcQIKzwISvgsHcBeb81e0qXl/YVh2MjfvGK
	QfvjD+kxwrXoXei2AJfbpexa17SujsZ9fgnhsfHcMRlSdZ01EToX+ccCYZa0Np4N7Zq1k1seclf
	+Wxk5YEekKY9RM0p2KYfMgTXLgN7MuUKOmQR8yXaMcnJIPKCRGA==
X-Gm-Gg: AR+sD13qiXI9h4Lwa0vX99e+87oYRPeWZR/vOhmL9I9K9mlpV2zyOA95kEB4TCwIR61
	walP0XcvnN29/1QK8oWsM/xRSONm8PcEK8U97B10o1nidOgkfP77WvU5gMqKQ0eImEGaiAJnYW2
	yqZH+QAeuZmnDsqTiDK8YvWs0XNM4DCVhBevmAo1ZaRPdahTKMn9b/mGiOvg8kxfBcG476xbZie
	ix5lv+DquO3NX6SNokXThcme3/oSUoktpkAYvPBavf+VUIhdpi95+4XVmtBVyZ9UtazyoGHO/sJ
	w4d27nqo5jNghyKscM0hPuSdAnwzZCeClPEVQ1g0IXS/bifY571AzLqjtApN32tn5eeUTdV3Qw=
	=
X-Received: by 2002:a05:600c:4ed3:b0:493:e983:806e with SMTP id 5b1f17b1804b1-4994e72f795mr575874445e9.3.1786362704419;
        Mon, 10 Aug 2026 04:51:44 -0700 (PDT)
X-Received: by 2002:a05:600c:4ed3:b0:493:e983:806e with SMTP id 5b1f17b1804b1-4994e72f795mr575873695e9.3.1786362703905;
        Mon, 10 Aug 2026 04:51:43 -0700 (PDT)
Received: from localhost ([2a01:e0a:a99:9822:ca7f:54ff:fe01:374c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021e7b34sm33717134f8f.19.2026.08.10.04.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 04:51:43 -0700 (PDT)
Date: Mon, 10 Aug 2026 13:51:42 +0200
From: Maxime Ripard <mripard@redhat.com>
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: tools@kernel.org, users@kernel.org
Subject: Re: b4 0.16.0 released
Message-ID: <20260810-urban-hamster-of-brotherhood-0b9bb2@houat>
References: <20260805-alluring-arrogant-grouse-ece17a@meerkat>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="x2wyiukzvz4y53qa"
Content-Disposition: inline
In-Reply-To: <20260805-alluring-arrogant-grouse-ece17a@meerkat>


--x2wyiukzvz4y53qa
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: b4 0.16.0 released
MIME-Version: 1.0

Hi Konstantin,

On Wed, Aug 05, 2026 at 01:01:31PM -0400, Konstantin Ryabitsev wrote:
> Hi, all:
>=20
> B4 v0.16.0 is now available! Install or upgrade using your usual mechanis=
m,
> or start from scratch with:
>=20
>     pipx install b4
>     # or, if you want the review and bugs tui stuff
>     pipx install b4[tui]
>=20
> Full release notes:
> - https://b4.docs.kernel.org/en/latest/releases.html
>=20
> Getting started guide for reviewers:
> - https://b4.docs.kernel.org/en/latest/reviewer/getting-started.html
>=20
> Full release notes available here:
> https://b4.docs.kernel.org/en/latest/releases.html

It looks like the tarball hasn't been published? Is it on purpose?

Maxime

--x2wyiukzvz4y53qa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCanm7SgAKCRAnX84Zoj2+
dokzAX4kj+uojezp+Fs9cOl9etaiGWfhKNNzep56S8VXxXzZytkbi0ET9/Qh8scC
A9KTHqoBfiTiMncjnfBu2q0fJtntY9bxx3JRf2oMuGtT8SFPFdq8clx2G3O+WIUR
KXjXDCf+dw==
=PlLr
-----END PGP SIGNATURE-----

--x2wyiukzvz4y53qa--

