Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D024239E6F
	for <tools@linux.kernel.org>; Wed,  4 Mar 2026 20:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772657802; cv=none; b=QLbE711kCa3mUfwwXmq+aCuZktb88jaeR04Bfar9QOPwrUchR1k2VNrrCjagcPLJaak+cZ3h8HYabKgdkbZJsyUMQ/MeAN4mA15viboJDMDgvi/NJafJzhY7mdH99ACGfVhkkPFQXYAB2wp6fDlYDF9xDFCR496zWJIM9jIjWzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772657802; c=relaxed/simple;
	bh=XSLZ5nCSmgR89xObsI5geanS7NQNY7P/ZQDrmQSieMM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CTUEEFyhGDci3EOKrVvwk0De48MD51YUDeMz3bHbV53nKfkH0wSzfzR16fTEyAOuRPs7gg8EnSGHlf+namE929XuXEPzEBJFBbuOLMETvKsjJgaT+PeFukGFyBu/yDOWHZhjJEnErP3X399SXuJz31IgKft5h0M8MeFlXTuLcEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 09CDCC2BC86; Wed,  4 Mar 2026 20:56:42 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 351C7C19425
	for <tools@kernel.org>; Wed,  4 Mar 2026 20:56:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 351C7C19425
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1vxtGm-00073F-L6; Wed, 04 Mar 2026 21:56:36 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1vxtGl-003lzg-0J;
	Wed, 04 Mar 2026 21:56:36 +0100
Received: from pengutronix.de (p4ffb2dc6.dip0.t-ipconnect.de [79.251.45.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 23B914F7E2A;
	Wed, 04 Mar 2026 20:56:36 +0000 (UTC)
Date: Wed, 4 Mar 2026 21:56:35 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: users@kernel.org, tools@kernel.org
Subject: range-diff hangs
Message-ID: <20260304-courageous-deft-skylark-a16e39-mkl@pengutronix.de>
X-AI: stop_reason: "refusal"
References: <20260227-imported-aromatic-guppy-ad3dca@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ja6imwf4x2upfb6f"
Content-Disposition: inline
In-Reply-To: <20260227-imported-aromatic-guppy-ad3dca@lemur>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: tools@kernel.org


--ja6imwf4x2upfb6f
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: range-diff hangs
MIME-Version: 1.0

On 27.02.2026 14:53:07, Konstantin Ryabitsev wrote:
> TLDR: "b4 review" is a terminal UI that hopes to streamline a lot of
> maintainer duties. A getting-started guide with screencasts is here:
> https://b4.docs.kernel.org/en/latest/reviewer/getting-started.html

I'm using b4 v0.12.0-419-g18f8fdb27a22 and a range diff "hangs":

| $ b4 review tui
| Fetching v2 from lore...
| Looking up https://lore.kernel.org/all/20260219-bcm_spin_lock_init-v2-1-6=
94352bfca62@hartkopp.net/
| Grabbing thread from lore.kernel.org/all/20260219-bcm_spin_lock_init-v2-1=
-694352bfca62@hartkopp.net/t.mbox.gz
| Checking for newer revisions
|   Added from v3: 4 patches
| Checking for older revisions
| Preparing fake-am range for v2...
| Preparing fake-am for v2: can: bcm: add/fix locking for config updates at=
 runtime
|   range: d9c253b4e17a..88c829c06921
| Running range-diff...

The relevant part of "ps auxwwf"

| python3 local/git/b4/src/b4/command.py review tui
|  \_ /usr/bin/perl local/bin/diff-highlight | less -RFX -x1,9 pengutronix/=
socketcan/linux-can/.b4-pager66hzgdqv/range-diff.txt

The diff-highlight and the less is configured in my "~/.gitconfig"

| $ git config get core.pager
| diff-highlight | less -RFX -x1,9

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--ja6imwf4x2upfb6f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSl+MghEFFAdY3pYJLMOmT6rpmt0gUCaaicgQAKCRDMOmT6rpmt
0qPYAP9qeSqQUcAXZcqcJqqMOBD69aVOl2WkzmbR5sCuEv2OEwEA984Jan+M6gG/
CIyKQGn8H41SUVUXUJcuzBhbARh4CwU=
=IDJh
-----END PGP SIGNATURE-----

--ja6imwf4x2upfb6f--
