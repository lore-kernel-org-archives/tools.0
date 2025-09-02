Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 235FB150997
	for <tools@linux.kernel.org>; Tue,  2 Sep 2025 11:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756811731; cv=none; b=dpbyhKZloqxABerZDdj3dV1U58vWItxvZPWJ9Iu1Zqvo5MNwPNxISj/UfISP51oMIopkFhH+o//K0LRU4pl4OX87iqtUp1MeyD9Rj5TUs6PVdEslj8eqQj3B1C/wXjw2q4uhz8oGUcFjKH5YKj2tJrvrEfwlxT3jgOTp7NFqKSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756811731; c=relaxed/simple;
	bh=XGX+DeulZC29je10moNcnOtELxMN3HPuGTu3xbK2L34=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XpQl6mW1/MZoCVsObWa78RwkijyP3sX9FtnBc+1JO4iJD2fHJKXRgQDrPmf0+0bRXapJUQsJ4lyCggv9GMmK8d3+QcdUOw9zlQZBYEcy4px6t5fkDK9SwKB25DSK9/pI7DR7XQR4sIuRk/TmrQ/ZrOLB8VpAB2fLR8Z9KeOxQZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TDDhL8tL; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TDDhL8tL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756811728;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=n2JYLgzCN9dHts6JlfY4tPiWqeuzeyjTAWvnqagd0wE=;
	b=TDDhL8tLXsp0MbSxMAZAF9LtBJKt7BpJnNYFn0hjJAsdJBp60Xar+4oHnj4PYC+2Hk7MXj
	n8CwHNHJvH4msToU7Hx0PcbVDavqYT72L+7XIxd6VNKEpqrg4KdSN2W62ry9h1dKnbqdi2
	Tx6I0pgKm76qSHY2O0s/VlPnD10CXng=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-538-QTEHnPUSODqVvuXMVmUzGA-1; Tue, 02 Sep 2025 07:15:26 -0400
X-MC-Unique: QTEHnPUSODqVvuXMVmUzGA-1
X-Mimecast-MFC-AGG-ID: QTEHnPUSODqVvuXMVmUzGA_1756811725
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3cceb92ea73so3057956f8f.0
        for <tools@linux.kernel.org>; Tue, 02 Sep 2025 04:15:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756811725; x=1757416525;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n2JYLgzCN9dHts6JlfY4tPiWqeuzeyjTAWvnqagd0wE=;
        b=j+DyeiuTsRJRLfy/OaN9aMYI+PaUln1V7OVSsASB4UCBRWOOz9to4+OoZpTO6ixeyb
         lAQmyNvrHZSfuuugmm3ietN7ihwgSzu9on4ftIxOP5pBGcUgipQPB3wx10xLtrIXOD+0
         e2RdDsVfPBtQI1f0Z8rnb5BXx62sPFXzz3OAw5D0vsXoT2vDTyuHrU3VT1ZcQaR8T64z
         9RvxUK8BrDmufX+GBF/jsHU4Z1SKXwoiLF4mnbQceu+wTJw60UD3l3l/j7a2+88Tl30Y
         JwuDc8HXW/kl42U+VC5wryV8S1fNcXsW+1cs49OSNcGnsibxSQHSe9BbleE8zghndstb
         IbCw==
X-Gm-Message-State: AOJu0Yyt9y05oRslPTKa5FlEBEIqyOuBXwt0pvN9pQGLs7m718r3xS8y
	hxWPQ8pkgOkBNUWyrN6H5g8xxzaXuAoQVxwtvIit8EfTXuEXJF3aYRmVuqVirrhBQC0Am6r6/lP
	MhxD1a/r+0bv9+wabsxbEEch/VDsYVe3MZnprEfxZXLMBSvsmhrBf9qCiNQ==
X-Gm-Gg: ASbGncvcvp34bLi1y3DI4vbG0QvTH6RHIrP887eeSceEhhSXEc0mhB2wH8jVPfBR00J
	nnJfdu2mVP6PQWBppXV8yj3SQaVImKeAbeqePexfv1m1GgCWy66nj+z+Nv3W7m5ER4AitbmUc2r
	N52x4T4IMzPf/UBJOpmOzQ6wDBhZH9zK42KFUY1/AKzgVq4nIwIf71voqx1n3SerVgVeyKC0E/m
	+20vOgOqtmoDGCePMAldx2tvFi+A2ovr3qnESljdl9nX0zwKPwxnfsrvURFKvqr3LX6NNXPJRT5
	juShYks9/7OX1gA=
X-Received: by 2002:a05:6000:2283:b0:3a4:f66a:9d31 with SMTP id ffacd0b85a97d-3d1dddef293mr8207675f8f.16.1756811725376;
        Tue, 02 Sep 2025 04:15:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGNvxfrJVqiodMiAGxO10p4BByKGOh4PA6YGK6ypTX5Vxn1QDlhoRJy+c4kT4CcFF/GzJKZpQ==
X-Received: by 2002:a05:6000:2283:b0:3a4:f66a:9d31 with SMTP id ffacd0b85a97d-3d1dddef293mr8207656f8f.16.1756811724849;
        Tue, 02 Sep 2025 04:15:24 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d15f7b012csm16091515f8f.63.2025.09.02.04.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 04:15:24 -0700 (PDT)
Date: Tue, 2 Sep 2025 13:15:23 +0200
From: Maxime Ripard <mripard@redhat.com>
To: Brian Masney <bmasney@redhat.com>
Cc: tools@linux.kernel.org
Subject: Re: Suggestion for b4 prep: new flag to collect email addresses on a
 per patch basis
Message-ID: <20250902-robust-adorable-dragonfly-d034ef@houat>
References: <aK9q1S_Xvzof7IiV@x1>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="s4cmhahb2y6qjvp6"
Content-Disposition: inline
In-Reply-To: <aK9q1S_Xvzof7IiV@x1>


--s4cmhahb2y6qjvp6
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: Suggestion for b4 prep: new flag to collect email addresses on a
 per patch basis
MIME-Version: 1.0

Hi,

On Wed, Aug 27, 2025 at 04:30:13PM -0400, Brian Masney wrote:
> Hi,
>=20
> I recently had to send out this 114 patch series that covers changes to
> drivers/clk to migrate away from a deprecated API:
>=20
> https://lore.kernel.org/linux-clk/20250811-clk-for-stephen-round-rate-v1-=
0-b3bf97b038dc@redhat.com/
>=20
> 40 of these clk drivers have entry in the MAINTAINERS file, so
> 'b4 prep --auto-to-cc' adds everyone to the To line for the whole
> series. Most people only have 1 or 2 drivers that's relevant to them
> in the big series, so it creates a lot of noise for people.
>=20
> For big series like this, what do you think about adding an option to
> 'b4 prep' to have it only put someone on the To line for the patch(es)
> of interest? So for example, let's say we have two patches that make
> changes to drivers/clk/driver1.c and drivers/clk/driver2.c.
>=20
> - [PATCH 0/2] clk: some changes  # Sent out to everyone. Union of all
>                                  # email addresses below.
> - [PATCH 1/2] clk: driver1:      # Only sent to driver1 maintainers
> - [PATCH 2/2] clk: driver2:      # Only sent to driver2 maintainers
>=20
> I could have sent out maybe 80 ish or so small patch series, but there's
> downsides to that as well for the maintainer.

I had to do a similar thing today, and ended up doing:

git rebase $BASE -i --exec 'git commit --no-edit --amend -F <(git show --no=
-patch --format=3D%B HEAD && echo "---" && git show HEAD | ./scripts/get_ma=
intainer.pl --nogit --nogit-fallback --norolestats  --nol --nor | while rea=
d -r line; do echo "To: $line"; done && git show HEAD | ./scripts/get_maint=
ainer.pl --nogit --nogit-fallback --norolestats --nom  | while read -r line=
; do echo "Cc: $line"; done)'

It's quite a mouthful, but it added the list of recipients for each patch a=
fter --- based on what get_maintainer retrieves.

Once that's done, b4 properly picks up on it.

Maxime

--s4cmhahb2y6qjvp6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaLbRywAKCRAnX84Zoj2+
dt8hAYCXbnNou+KDJFPSbPcMxY9zrAq5IXyNNgBIvDprPLPR9joZ5YRbwIiL4KD3
kOKwUJkBfiF6/MzoUlV97wj+81mDQgLBL57OLBH0QsglNYSfwd35cvwckjX8TMku
WeNaV3pDkw==
=hDPy
-----END PGP SIGNATURE-----

--s4cmhahb2y6qjvp6--

