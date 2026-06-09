Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6AE3DDDA7
	for <tools@linux.kernel.org>; Tue,  9 Jun 2026 22:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781045105; cv=none; b=Qo0gktFXOIplPlMCz7bZ7EPUytHsLPJGEASkE7aYmuI4myCQEEIO/uRVpjXdZU0Z9NH/irefzGRFMctUhIXca06vk/46/qD88ZB0cKUPfrNeDoa9p+FmBMz7rCK3EygK1aD6pn4X0bDAMYJvDHr/08ghbBJ7KksW1phLwlK24SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781045105; c=relaxed/simple;
	bh=VRF7N+1w6I9PtiFmJiZm8O296PfJbM+lcqD5kYBzEE0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iwxsDru2CHbVsvsQAkL26e7ECplT/IqvV54zvfyWEpYmzxPkstUdSlx48Kz4Cgf/f4/T2d/mfbKz8SMkf/Z8si5qoQYiNODYI1P9FVrAl4hmsqWkMGHlrMCDOnoXM6w9XZLibJTCS8ylcmettOsHDCEPEbyVdFdelrvrJlOjrSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j7YmwfLZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j7YmwfLZ"
Received: by smtp.kernel.org (Postfix)
	id 36E431F00898; Tue,  9 Jun 2026 22:45:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 995BC1F00893;
	Tue,  9 Jun 2026 22:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781045104;
	bh=VRF7N+1w6I9PtiFmJiZm8O296PfJbM+lcqD5kYBzEE0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=j7YmwfLZeTP8p5xLhCsjcKzrB4nTBWWyq61i/I08jMEZLZahhupm4yH7AHRcuJ6MC
	 5JsOPJiByf/ccni4jlpOBPeEkcIn0jboG/DSXiCtEjqKklbbLZlusz5tzQkK0NN+XS
	 qOpZA7IwPIPcIzWdjBB56rYFzAS1odf+7xU2oFDfGoiuqk26yu1zzUwokykscaVt19
	 jeJYNJ8HZJ4MfS3MQ+/nSOnigdKH6JhykoGsxkaD7fKXuMHMeIJSBR09Hwi9fUlSTz
	 MAa+2EP5uZYJyLqL2sd5Q69yghSeNUNhspN/4SWs/T5L+xvMWWp7J2ABH6Jjhr8wKg
	 6Kdczq7ycmdgw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id ECF4B1AC56BB; Tue, 09 Jun 2026 23:44:50 +0100 (BST)
Date: Tue, 9 Jun 2026 23:44:50 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: Re: b4 review workflow issue with partially accepted serieses
Message-ID: <aiiXYjsLdi9anbmA@sirena.co.uk>
References: <afk5QvNAQDxFCbvT@sirena.co.uk>
 <178104250404.112711.2880594121343252200.b4-reply@b4>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VnRms9gTwl17tiWa"
Content-Disposition: inline
In-Reply-To: <178104250404.112711.2880594121343252200.b4-reply@b4>
X-Cookie: Leave no stone unturned.


--VnRms9gTwl17tiWa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 09, 2026 at 10:01:44PM +0000, Konstantin Ryabitsev wrote:

> You can then review it again to take more patches or do anything else
> with a series that is being reviewed. If you take a subset of patches
> again, the series will go back to the "partial" state. If you take them
> all, it will go to "accepted".

> From the action menu a "partial" series offers everything a "reviewing"
> series does: take remaining patches, rebase, range-diff, upgrade to a
> newer revision, snooze, mark as waiting, abandon, archive, thank, etc.

I think that should mostly work - from the description the only thing I
can think would be an issue is that if I don't send a thanks mail the
submitter might not realise that some of the patches have been applied.
I'll give it a go next time the situation comes up.

> I also added a smaller bonus fix while I was in there: a "thanked"
> series can now be reopened back to "reviewing" via the action menu
> ("Return to reviewing"), in case something was thanked prematurely. The
> review branch is still in-tree for a thanked series so no reconstruction
> is needed.

I could use this for that purpose if it turns out there's an issue.

--VnRms9gTwl17tiWa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmool2IACgkQJNaLcl1U
h9CNJgf/VcK+2z14rkBf+ckiCRLv9TpHfn8Yfc1o36wqDxVmiSuhi13iYQVpoeMT
ickxeoDBXOWt7psJ51l3J6VHNDnZeEth5lg9vz+xUirVqmKQPoZbOERoqWXzwbVL
ssOid+eAiMNWGG05MoJcy7sBOaqen42Q+bS/OcLh2vzTZxKTXujFnvujQwSYh/o8
2UHGWZclHBiSxte5u/sVAIx4Ii0gI7xWOjbKO4Ll8Mrgl4ktYDJffV4SbKR3p2vG
iWpaNnPWjYpAWveQcpWUzbMgMlUg37W47Dvm6N6QvegE53L9sX+CbYH3dMXIYpF0
TQ0bYl4JocjnpJszbRQIs3NZKimKVw==
=AlIT
-----END PGP SIGNATURE-----

--VnRms9gTwl17tiWa--
