Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343001CC8B7
	for <tools@linux.kernel.org>; Thu, 10 Oct 2024 14:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728570183; cv=none; b=NXQDXW4ErKMRx5SeZK0AjKTEaELPyBIJThaHif3EeRls6jGEgMI73EaN34oWUo0anN5nmQMevALNbwIMyHP19pKGaS88C7NlMykmvU8y1g81mzwRwYf1WUGosw9givCXnRAFJJ0qJEwRwY8GtoVhKHw1PLYhQu3O5UmzChU+69c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728570183; c=relaxed/simple;
	bh=mow/11R1F5tszDbwyOTnBdNsHA/VMMA4ElPRVLsy3e0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GCmu3C5uzJrFewYsa0MFKbUeyGkuOZBP7udxmwZm5XEWjxgrqLuIlajYkaAJo8evMMG3Wri3FEdjHm5wqZHFrA0qD+l0t9TxRfBUc6fIf19kixi8NvfkqL2eLViYkT3VyEyJO7fHhTMwZmcx4Xx1lnKALrtksCjbRZUiUkD9lao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b=DMGKWphI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b="DMGKWphI"
Received: by smtp.kernel.org (Postfix)
	id C33A5C4CECC; Thu, 10 Oct 2024 14:23:02 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EDECCC4CEC5
	for <tools@kernel.org>; Thu, 10 Oct 2024 14:22:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EDECCC4CEC5
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=heusel.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heusel.eu;
	s=s1-ionos; t=1728570177; x=1729174977; i=christian@heusel.eu;
	bh=ziePkMnuReuPJebv7+fSehbgEF1EY77buEeMwHaElwY=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=DMGKWphIh+lGAfSCPdMlXjbqqyrUY0BmnyJE9cIFtu1ocRMUspvr4d7MWlMRRYLm
	 urdyioy93i0/Vyb3i1wGYPB9v9DC9WNs+NTavxfj6Jjio9VjSLvAyoEvVZyBiE+Vi
	 7g1fzAOLI+V49ye2MvDBPY51btZw1cTng8DqFT0EP8QNcjrx/6aANW55+bKmF3zVV
	 P9s5OruoYGnNJvPQarpdIn4pnlrbQdI2Oxw65chDzBISZIHbSwqdPbhq8E8MqDco2
	 +dTt4DdMz22wICNPdrB4l/t7Cpx3fiRrGap3Wou2Ayz0H4K8sXZRhsXNHfFYmcqE9
	 lnqZ8SlPC+YZadxGFw==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from localhost ([141.70.80.5]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MelWf-1tWan73vBF-00hzKE; Thu, 10
 Oct 2024 16:22:57 +0200
Date: Thu, 10 Oct 2024 16:22:54 +0200
From: Christian Heusel <christian@heusel.eu>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: Re: b4 crashes due to type error when signing with gpg key
Message-ID: <c57f3c63-9996-4a77-b361-c34675b1137f@heusel.eu>
References: <9ebef39e-ec9d-403c-a0f2-9a3176d71c1a@heusel.eu>
 <20241010-refined-important-mole-a56fc5@lemur>
 <52dc54e8-b7a3-4892-aec4-067d8e8c331d@heusel.eu>
 <20241010-qualified-airborne-muskox-2cdf05@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="igulgmev7c3jt562"
Content-Disposition: inline
In-Reply-To: <20241010-qualified-airborne-muskox-2cdf05@lemur>
X-Provags-ID: V03:K1:J1JV3RZ35zsOQFR7CBoLh/GYJMS2yFHQAMB5sfrmzvKZPR6PZs8
 Tt4vkMeliEZYcHxP5HYAxMESMByMP3pOU3siJgjuxG5XgfYyUKqQBK3sVVS55U/6EaG3xAS
 B9AmJHz0DvPgLfHw+QgVWxd5NWN715sXK8gBbrlBNCD3intUUyDzDyvUtLKHbfhuZCOxb4x
 it7qFtEPGS1IijVCWDSlg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:NadSN6Rwm6I=;kJOPQfj3COm3JIt/cwEnEiWnPNN
 3e+3ItgJRgQT7lnM7Hi3BX5z4cTLxYdUY5ZykTm6YIrcbXrn17v6eZBw/czkf6pwH7mWc5ea7
 GjCSKBoE7XAb1tHToNm//vV3QzZM9uPVAVpzHW18EjCSi5rxmVmf8sicIHnZmiqzr8C/epCfj
 PVIrAmiGDgut480aMleZMMHhyEtfwFASEkfT/YC7YC537JDpbWUiMzoUH/HeIh0OKuKAwHMiK
 fjaStdBorw9FanuiQRkCEcjlHC/A16IX4XLBGoRVBYHeF+mqHi6C9/MLatLeit6vS63Z+5Zjn
 KPX5c6c9KPMTZwgQkGfAp37JD4iM1BxeU/xJKwRzj8Yf/uy3r4NIgHIXZsZchIhBRHEkONBw5
 0E8xfsSDtW32lZguoojb2eiF0QsrT6J3XR6bIPwoLEcZhj1BcSkWzuNFoB35SW9qA4i+/s2gw
 yomBX5rsc0PrcT9TZHj5244EGIltDGNaud/DB5isEOO7JYQgEEbtj2eVSBdwRdfD65Uy/gZl8
 8evNb0XZx7r3/trYIPTd2UPCjIvc5KB2ASnNPbbcqjxkK0iHB+8V1VxBc6p36Elh0K4AXqmne
 QDLOxei+Q0VCo7XDIfS7OG7JP3DBMxNtEHFHBiJVFGn4AROnCA2Kg8w0Z3Mf0vbxZeaZ2ys01
 EZSDTYd/RWqeWe4UZejLvAmu7BsOm+6qD86D8xH3Dyy7W302H13HzBdERjFjuBtPPX4KUpGR6
 J9CFgT6Y4um59SngKf5WyfnC+4eKL52Gw==


--igulgmev7c3jt562
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: b4 crashes due to type error when signing with gpg key
MIME-Version: 1.0

On 24/10/10 10:08AM, Konstantin Ryabitsev wrote:
> On Thu, Oct 10, 2024 at 03:51:03PM GMT, Christian Heusel wrote:
> > Note that I have moved the "-K" forward, since in the order you sent it
> > it just printed all the keys.
>=20
> Woops, -K is just my signature, not a PGP flag. ;)

Ah sorry for missreading that, I thought it had wrapped around due to
line length ... :p (also -K/--list-secret-keys  is a pgp flag that would
have made sense in this context, hence the extra confusion)

> Can you please rerun with just:
>=20
>     gpg --with-colons --fingerprint "$(git config --get user.signingkey)"
>=20

$ gpg --with-colons --fingerprint "$(git config --get user.signingkey)"
tru::1:1727197441:1804773157:3:1:5
pub:r:4096:1:A3AA55C37A759E7C:1476016014:1633696014::-:::sca::::::23::0:
fpr:::::::::801158F31949757E4E59526AA3AA55C37A759E7C:
uid:r::::1506954544::EC73D33378091A6E253D239CCE7A85F5DB161CA5::Christian He=
usel <christian@heusel.eu>::::::::::0:
uid:r::::1506954594::48746678F1EAE23BDDAC4B526F5C571FAA987931::Christian He=
usel <c.heusel@stud.uni-heidelberg.de>::::::::::0:
uid:r::::1513380925::8DA8B6040D8A9417FC1D97826EDC7C33981A9B6C::Christian He=
usel <chris@mathphys.stura.uni-heidelberg.de>::::::::::0:
uat:r::::1523546931::2C6D4374116128B02AD6A5A9625F638A62F5DD6D::1 15135:::::=
:::::0:
sub:r:4096:1:52D3F824EBE5D7B1:1476016014:1633696014:::::e::::::23:
fpr:::::::::5CA51C3E7BCD44EE60708A0852D3F824EBE5D7B1:
pub:u:4096:1:C047D4F328B52585:1634302979:::u:::scESC::::::23::0:
fpr:::::::::6F779ADE247A6B8A0F72CC13C047D4F328B52585:
uid:u::::1634303292::EC73D33378091A6E253D239CCE7A85F5DB161CA5::Christian He=
usel <christian@heusel.eu>::::::::::0:
uid:u::::1634303162::48746678F1EAE23BDDAC4B526F5C571FAA987931::Christian He=
usel <c.heusel@stud.uni-heidelberg.de>::::::::::0:
uid:u::::1634303192::8DA8B6040D8A9417FC1D97826EDC7C33981A9B6C::Christian He=
usel <chris@mathphys.stura.uni-heidelberg.de>::::::::::0:
sub:u:4096:1:B5CACC35EF9F1204:1634302979::::::e::::::23:
fpr:::::::::BF020F0DAD135CC6C0237F6CB5CACC35EF9F1204:
pub:e:4096:1:28A14EA281DF9942:1536070753:1567606753::-:::sc::::::23::0:
fpr:::::::::E2E738B0FFB722FAF6C4778228A14EA281DF9942:
uid:e::::1536070753::AF046BCD7ECC0B0900111A39598B4D9C5D606127::Chris Heusel=
 (...) <christian@heusel.eu>::::::::::0:
sub:e:4096:1:2FB2A750FEFA2501:1536070753:1567606753:::::e::::::23:
fpr:::::::::CF75FB07012CAB2A59461A262FB2A750FEFA2501:
pub:f:4096:1:F75B286A54AA66AF:1647093157:1804773157::-:::scESC::::::23::0:
fpr:::::::::3A7C7BA0DD0BE85C3DB780D4F75B286A54AA66AF:
uid:f::::1647093157::8624E6F0D640CCCF15937933B05ADD7B7EF1FE2C::Christian He=
usel (...) <christian@heusel.eu>::::::::::0:
sub:f:4096:1:387ED3A6376A9A78:1647093157:1804773157:::::e::::::23:
fpr:::::::::16781FFFA95F93D62A0C0916387ED3A6376A9A78:
pub:f:4096:1:B4DF3F75F61EE435:1653307717:1810987717::-:::scESC::::::23::0:
fpr:::::::::815B81F48EA4B3DF6325D58BB4DF3F75F61EE435:
uid:f::::1653307717::DEEBD4AD13E776531A2FE81454A96307A9EBE5A8::Christian He=
usel (...) <christian@heusel.eu>::::::::::0:
sub:f:4096:1:7B4E9D4DCCB22DB6:1653307717:1810987717:::::e::::::23:
fpr:::::::::40019994F70C3AB367D7E6537B4E9D4DCCB22DB6:

After thinking about it for a moment I have replaced my email in the
value of user.signingkey with the gpg key ID which makes the problem go
away. So probably an extra safeguard to detect situations like this one
wouldn't hurt, but the issue is fixed for me.

> Regards,
> -K

Regards,
Chris

--igulgmev7c3jt562
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEb3ea3iR6a4oPcswTwEfU8yi1JYUFAmcH4z4ACgkQwEfU8yi1
JYVL1g/+MaGqZ5yadbuQ0DCTdcix5de4UawJEvWI1k8/AyEmWCiGyQ+hBFS30g2r
iDVvUGyvzmAyPhD16fkx+v4bjHVBE4yp+LCyqqmkjYavE4v3uxgWMOJ4BNHryusn
juAIpsN6aInFVc7OXyurGbBOQ/9MFWTXJKulQqvdbyZVR8HC3SeQt1MP4ZKe2Fdv
9FwJzjv44PbBQQqX3YgbTE7+LSXF68uiN2JecwF1gf1ZRz2TI6H26zMZtPlVs9bC
tgZzbgI2F+Y4M+Pz/HhJGBTqIJtrvQoW55NqAYCk68EN7ENvbqR5n5+E7j+KaHQj
qgoyqSlkF4J86gHBe2E0wCL35XzG10VrBaG5u/pt2xwDZmuuL3jc692Dp8BzqDSq
xP43hVmqD6kJFjaI8zzh9gLiJlV/WkUTGopKCT2y5w2yidsj/mor2lpNoh79WjBr
b6mD/HyEkG89cRFBPI8Ou+yGvcF/RwB+cRkPJEtmcp0AQ7n0+ExfbjSlNz8AV+fq
oMISoQ2ZKpV0PGIFiv8pj8PMpP23Y3WIg7LEAtjdyGJsIVWtN2Ymb7CajE/d7jey
+0dtKp7WpC28EBwr/pzUVBq0u7V8msUr3Jt2ALFf//vPtU55rOogLycB00YP8ief
TUxuDN7H/BRLPgZqmKRu10fhqPSsdvg6ZOUQ42Mizszg/83EuJ8=
=mNiJ
-----END PGP SIGNATURE-----

--igulgmev7c3jt562--
