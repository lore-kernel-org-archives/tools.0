Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 261122C15AB
	for <tools@linux.kernel.org>; Fri,  4 Jul 2025 12:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751630954; cv=none; b=Gd7Quw/mQo0t5AKrAt0gv34ZrmWDsIRqXC5mblUl5gT9DLPVjWzdteBy/NFxJ8ucjHPIRm4vvyxIUs3F0AbwL5HAX1rc0ZvPNe4h5faaqSQeYPRhAHTlSZHU3Jli4ja1OXuti69jxZh3Hck+tAoxv65o68LSjW6eupFz6mUXbRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751630954; c=relaxed/simple;
	bh=IcGGQ7gDU+vTAquC/Y6rGG8U5+aLANMPQJ56GZys+dM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TuDU2S3X9bIU1uBuArorONbIfIQdKAbAjHA3gvOpTLz+xE4Deq67p/8DZOStNuvEHfoPdb6Egx7mECt40wbEsa8XpxXsRgz5xeUWHnppdFDwm2zoNNl5V5/gQ9lSwc1wQpFiS0IJtsPwivjNML5nxxH2OQI+FbvUFuKTqw8U7rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pbXisXh8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pbXisXh8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FCE9C4CEE3;
	Fri,  4 Jul 2025 12:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751630953;
	bh=IcGGQ7gDU+vTAquC/Y6rGG8U5+aLANMPQJ56GZys+dM=;
	h=Date:From:To:Cc:Subject:From;
	b=pbXisXh8ydFanGg7UEblzPVszQokyqZGyFp81gdtFXV0+Z5un/tQnbXj5aPrzT4QR
	 0/gDQqZE75uLkhOm1kZUI/DC0BAgRATAcQrELRIv5M9MUJwozjngMsWnKwTjsDjjP1
	 ZftPtgxJJy41n7AYqQ0Z6MLq7dcxXMWs7p3Kp3VSakDiHhMdb+SAmgb9bdwQQIZT3j
	 TBG1dfM6UBzFB9Y86S/xszz5S+KLV0cvkKFae9+e6QQ0hYRIm38RobVlhR0gmGmHEk
	 ErbqDC5hy0C2A05rr8EYkbgIdWVC0pdmvPlzI4fsfCVi4oBcentuf+VLgRW67gwhJS
	 DZstqyX8Iuwbg==
Date: Fri, 4 Jul 2025 13:09:09 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Incorrect cover letter trimming
Message-ID: <e593a858-4d78-4aaf-baea-71d85c08f488@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KDmw3K59E14pvUdR"
Content-Disposition: inline
X-Cookie: VMS must die!


--KDmw3K59E14pvUdR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

When I fetch the series 20250704075225.3212486-1-sakari.ailus@linux.intel.com
with b4 am the cover letter only has the content starting from:

| Sakari Ailus (80):
|   accel/ivpu: Remove redundant pm_runtime_mark_last_busy() calls
|   accel/amdxdna: Remove redundant pm_runtime_mark_last_busy() calls

it looks like the cut lines:

| -----------8<-----------------------------

confused things, I wouldn't expect any attention to be paid to them in a
cover letter.

Thanks,
Mark

--KDmw3K59E14pvUdR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhnxGQACgkQJNaLcl1U
h9CrPgf/QSMmLDneszHi25oBgbLA4MxYYihOUgLEcqJTQngsuunZApzRrFjst8+K
EcHjpsb5So0fjrYTviueRM9KP5Tc76x0raRbwOB3zqF9kfn8TlWqgV/PaqzfIn03
dgqETYxQ3DCcu8mnD258EWB/LTgSC9jK1lL1vVgLxboYtMZiQAW2h947+YGSWdjW
gVbg5i6gNiG+bnm0jEM5Ty45Xyrl5yp1hfZTj9Fo7yFAwQaXk9iDgNaEF/l1zYYv
Uc0yQut/IouuuF3e5uTs+wcW0CBeiFZH3FWYETsKbGo4LcxjKr7k+9L3k1ESBLqm
qtR8aqql9ayAG+kFIypdZxrL/OyAIA==
=5XN3
-----END PGP SIGNATURE-----

--KDmw3K59E14pvUdR--
