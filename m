Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BDD91E0083
	for <tools@linux.kernel.org>; Sat,  4 Oct 2025 18:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759601769; cv=none; b=jI+mpXt65t9++nl69PTaltElSWO6zoj5hVRbLKmC4Ejz9h20WLDTxHmyWFY7qrSjoCNSFXbzCFKHMTw0ZkYwGdvAzr2RwNizbZvD/2f5+uMHkGIUta41NjDHIx9JMZX4jZzugO0glqKXC6lUvqe5JghvuKVZ/2zZAZ9xvM0TXMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759601769; c=relaxed/simple;
	bh=xS0ZLsLjnrkZUyx9kpBAKWYOKBfnWtEfRozlsGUWq2g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XXH7mxBp1BHEuCrhA+K3Z0IOyKTG2VvqPkbFGAXbS+vBy23ySfxyZPjz8YCts3mgTo1ouS5M/518hz5ixTtLaHdSYG0trt/vv4Pa/eKc3p7Wg6oJ76sAqKE7PVQ62MObOmwtlo8/C0susAIYc2fQQAZkHjekws4sK6UI4LyhKzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b=Ig/xCD6R; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b="Ig/xCD6R"
Received: by smtp.kernel.org (Postfix)
	id 62BB9C4CEF7; Sat,  4 Oct 2025 18:16:09 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D4D92C4CEF1
	for <tools@kernel.org>; Sat,  4 Oct 2025 18:16:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D4D92C4CEF1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=heusel.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heusel.eu;
	s=s1-ionos; t=1759601758; x=1760206558; i=christian@heusel.eu;
	bh=xS0ZLsLjnrkZUyx9kpBAKWYOKBfnWtEfRozlsGUWq2g=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Ig/xCD6RKCXfh79NJof46A+YsCp20L0cson/5L55fqBzBO3JFylmDB/u/yET+wgE
	 1wRCWWBZL3pTu8lEu7Z+7NY25qGcCLOY7jUM0bKg7vSoDC8Wplq4UUr+xNIKVxfkd
	 TAxXLJePC3+o3N98LmKLaySTPPipJO3sw9buHG2FX9IcgY/ASx9oCA4YyGfZ2UT2N
	 AnB2KN2bZZnLpybgZ8hIZZfui0/d5ooQPut1Gw0dWcEaGP3wmezHzvShQgX2zkk95
	 1NM367N0EmB8ds+Um49V97sHgXm25K9qm3zjYx7BSH6WtDBG83DearM/2qvRf9/VS
	 020q6jTIMTGXxh2BBw==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from localhost ([89.244.90.61]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MsI8Y-1uH8q41w7u-013oiJ; Sat, 04 Oct 2025 20:15:58 +0200
Date: Sat, 4 Oct 2025 20:15:57 +0200
From: Christian Heusel <christian@heusel.eu>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: Re: [b4] Release tarballs missing & test failures
Message-ID: <f4a564c5-d306-40e5-9031-ff0ce1e33a3b@heusel.eu>
References: <32207548-725a-488f-8815-bc208311482f@heusel.eu>
 <20251004-dainty-armored-armadillo-e2a080@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oz77ppejtdcbzro2"
Content-Disposition: inline
In-Reply-To: <20251004-dainty-armored-armadillo-e2a080@lemur>
X-Provags-ID: V03:K1:M7CrXYnS/x8xdexS1xoupW9FlsA/Y/b4rEteVTcQSunQHajO8e7
 RxftQKUWa8lxR9rB2XtJ+fwh6iKZR/qPZelJZiTJz4DuovxDU/wCpHxe/uGrP8KbbsufQgy
 Jdmx6wKqpAdaiwULUUcHRCgDpb8x+BapHRuQ7NrBoXtbUVRZBkMKQN7RFu0mZare6LWYPHy
 RGqVGy5w2f/go+aAeN4aQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:zOWvgwV7rEM=;vu0W5Gf15QuTSHhDQGg+KwvAjdV
 3t0V0nQAnMMEblHVkNP5g9l0XNrIRwvUUsG4IH43YRZTyF8x+piuK/mT0BoEucqGmnPbjiXo3
 4ZNupDNWlIOgC6BqNebl69xlVi5nHDsa6G+f06k02JkBL+DkgYWUs1eIxx6KKUJGGH2UYw2hn
 nh7am5Z+e6qqd7/J61L2uiqxtwD3Z08CV4u05PqRDwniVxItqLWndkK4jc9Sw0DCb6+e7E3gp
 zn73omib1K2T+Em5zwicVE2dDb3NDp9wgBE6W8fJLwp2lnPO3thx5JJQoNsBh6+nea3PJsdCY
 GqWfofxHyN2+AhX5Hh0B/YpEwC70RvIsDX5G1xi+rfBH3vbWsDGIgNEp5f2v6PpYRPcKp/Sev
 +Pho0CZIjN1/f5eTmNMnHl/D6IrEcMW71RzuYej7hLh3S9y1gy7yH//PGIxo4nSRbb41vOhs4
 SactsX0UifIe+dzZuU5xKWBHRDuZG1IdZQQBY65vitTDExGoIu81zV0A+9RHQmt4SQ3XngYAE
 yNPaJGIotUT2EbbOj7ReS0UWI+4h8Le7qlaICOe+pyO5Jx7MS1JaFxSQYBTefAud/qMEbSdox
 /rqbddaV2wz/Pf/2sHzy37XzmRNb6SJieJsAx/bS5FPCBVG84gfIy79WSFII7v3qhiTr/HyJK
 6B19pALMZRcwqAw63+5kiToCVEqCLZGrREx5LH+sZKavxA4TUtdWReg9G4i35x/fPED/1RPXg
 dFBc2VjR2UgczaRo4sYa3Nk6z2Q31eN7EGxddU98Y9MCVk3dMarsMINEFoyAz4yf6vjC2/2yD
 BGbYSAdGyNjrNmikjFHPiPlo6BhXsC19Q3sgw5G/e15BmiwcOtvFNQCAB/tWL1qa4si7S/f13
 JO94vZtHNx3+pJNxjm/ZWwN9jwPMPKjBGI5fbDRmTN/0uufFDXfpG+au5jtX6nGGp2CD2U6GL
 jt3mes2SMNEvn0EfZ3tGteONSXBhLlCRN54iHm62KHX5KkxvsSNMJ8x9vV+BTpdukmWZ9XgJQ
 c2v9OE3dxLNR8SHSJjHUi5vC2gKmH9NuUw/33YsaQD0gaTh6PNZptDjCdFT+/wyAa4FeBnbqw
 mvWuoRO1Ft+5EO4JUm05T+Prj5rhah661gmRsapeYLQanLtOB3tD0RDoGNttLxKVKdu6LAxDt
 B/cYgOnAgUwImCekMYGEabUGaF9TeGPnYwb+RG+S11ax6VKkN1p7zMPeCWwGJmNm6CA1XOg0+
 Q2a4XuWI36VdKoY67/bjvh0TBeB5aYGBnAmkv3CUTRVCLNWj+q0iXO1euIZ/yAKrTM4vVEzbp
 t/UQlrGLZJt8+xbWCl33smKj52NJ81LAN5Kl/AXQtwxKvZf3I+ceLQDInuM5WbqR0MWcTWrCn
 F8SzTTwBnjzHeGjJcp6QfDfGHQ8oXQEe+pvMvMUpe/Uyd67kqET7REtCQp3hgDAiPveDlkzN0
 It1lJEDv9p3+xG09rDFh5BxK+X4z9GWIIFS0Sb0tV8J22JkIlvVWL6ajFmFNKnOM70+cdHAC2
 xauaXhkWTc9ueMTmiTwKFvqHUGBIK/sgelwqUDYU9ahuffUqRcUnmGqLqMh33LGmbQZjQSjDM
 31o7l9C8Oyd8SJsl+k/2wRxJW5MMy54p0zQiHoGONYpsMsDe0RM/EdlrGC05A5pQBuAUJ+Y6i
 emccjz8QJWm9ennn8VPyaeS9/RlVw9dULwvP/Mv02WHWiSZdVgX10QHaRZzmXXLOI=


--oz77ppejtdcbzro2
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [b4] Release tarballs missing & test failures
MIME-Version: 1.0

On 25/10/04 08:41AM, Konstantin Ryabitsev wrote:
> On Sat, Oct 04, 2025 at 02:19:13PM +0200, Christian Heusel wrote:
> > Hello everyone,
> >=20
> > I maintain b4 for the Arch Linux distribution and noticed that for b4
> > version v0.14.3 there have been no tarballs & signatures uploaded to
> > https://mirrors.edge.kernel.org/pub/software/devel/b4/.
> >=20
> > Is this intended or simply an oversight?
>=20
> It was just an oversight. The tarballs should be there now.

Thanks! Did you have a chance to have a look at the test failure?

Just let me know if I should provice more input to debug that :)

--oz77ppejtdcbzro2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEb3ea3iR6a4oPcswTwEfU8yi1JYUFAmjhZF0ACgkQwEfU8yi1
JYXwHA//esvHsHWWSIcm0z4kGEyiCcnzpdx+soK55y45UmjocyNl6s3r0VxB7JmG
HLYi4rQfIPLOnSeXQqjkieQtnDIXvg4l3xXKD84hT0WQpIXcujH5XaIVYviSMbKA
EqQaBMZJcVAim/LwCFyQYuYiuIoeeFwwWmRJ9ogMZAc/24+d5S4UO3cEsfo8Uzog
zqxvpgOjhjI+mB25MDy5cAExwuvtmDdGYTz74d91uweQpC9tsoH+OQdXLFb66zWc
tUvfn7xzkrNqstLjcFu01FDZ3acD6iB122GHNrROEWiRWteihl9YGZpKBTjWUZ7N
Pf6Mgh3PeKSjO9iJWT0pSidxMmDmQBMlLmv31b5dsf+Cci5CGbVptacJSHmfc1CS
T7r3uGrJ3vt6bE3n3OBvkr50fID6H0smIYAmIvdlffXk++OI29xDKqb/+CrM875S
HM4Bqmkc580ExOkOMsuMgrnhWes6NlA1LafUVEVA+9IrOwMpQBzqjPTztnQL2Gzc
iljbSWZq1VRvMIZZuTXPQMeYz2HgBg7F2BYCYIuZ6cHQBjG1OlKKyvcTG1zuEAVH
ftuoaViyiY3lAL+xzsQahi7fy2YnTR50inCoj8phuJYtKquggprXmEvkNlUEcH9X
IYxnH96Bjfu8C9tMLLD/eds4Z3I73nzuJQjuXBX2ufpZXKLA2HY=
=seSa
-----END PGP SIGNATURE-----

--oz77ppejtdcbzro2--
