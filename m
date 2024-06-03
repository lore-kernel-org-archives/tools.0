Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0462B3C2D
	for <tools@linux.kernel.org>; Mon,  3 Jun 2024 16:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717430622; cv=none; b=n409PUJ1fKx3JZBOelE7/1bR4Y5m3My+tQIwi0ABBIn6+QIeKa/XLe6Vtenb5Il+gKjv/cTTr1SK2eKWi8y9iqpzMt+t2qM8Zx2kdNsTsHhVweRzRN9jWRRw2shC7ihIf0SKfdnFuKGXzosXnlfhk3ivjCbAf9xWpsQWjCmkGp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717430622; c=relaxed/simple;
	bh=TzTS0hgqdzRIcNgb83r5zE1aPVKBGeqorQsy9sszDTA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JJRu/v78JQQ5BOFvuEzG/zmQkEhHZEhfUrk/J8d+YLEnuNWTDLIDiWw2FR2CuvK07edvW+VnfrbpkT8m64wLBi3r4k33vZA7O5gGKJh/Ra3qAfC80w2jBFpeH2IRo8TMJ/BnvHWwN7OMyPj1fTg/cL0GL7X6DPwilhiZdo5WoJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T+eKOqzm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T+eKOqzm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DCB2C4AF08;
	Mon,  3 Jun 2024 16:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717430621;
	bh=TzTS0hgqdzRIcNgb83r5zE1aPVKBGeqorQsy9sszDTA=;
	h=Date:From:To:Cc:Subject:From;
	b=T+eKOqzmBrU8ftF91UI2gm1cyB2FAODun5GeSbZRxlnQP2pNUrC78hbbpdNQTxAAq
	 fRZaFCCUc0i4EBB/Wt2pP3iQcDybbJZlvY1UK84nsL87BwNXQ+YxIIWi1PiZSdUFQJ
	 ljxVbEVl8m+MXkIMjylQvm3o+pwCA9pKDfoalGVfT7R7o2cNwxowdvqwgMP+DQOnvB
	 f7Lh8xU02S15MqDpf9kfWz3DeKH2Z+oNHg46T6cbw1c74QBd3Yl1niFCJD/UvvhjBT
	 Elb1Gt//7sPpOy/tA0TJDzS6rwiVE1YU9wq/6xtuuXxIRYY4YogSU6/rNDomDzwafR
	 CE6cX0z4HYLtw==
Date: Mon, 3 Jun 2024 17:03:37 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools <tools@linux.kernel.org>
Subject: Trailer updates to git commits not working
Message-ID: <15b55c55-8060-4c46-b545-3a3e774a9875@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RiCL8ewnmk+C6rWq"
Content-Disposition: inline
X-Cookie: Don't let your status become too quo!


--RiCL8ewnmk+C6rWq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Konstantin,

At some point b4 trailers appears to have started having issues matching
my commits, every time I run it it complains it can't find commits:

   b4 trailers --update --trailers-from 20240603-md-base-regmap-v1-1-ff7a2e5f990f@quicinc.com --since regmap-6.10
   CRITICAL: could not find any commits where committer=broonie@kernel.org

but git seems to show that I committed things I expectI did, all the
commits I'm looking at have:

  Commit:     Mark Brown <broonie@kernel.org>

This is with current git, when running the above command on

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git filencCojq

(which is commit 76f19626bd35a1791faeb75264d358256ebc544c in case the
branch goes away, regmap-6.10 is currently at the v6.10-rc2 tag).

Thanks,
Mark

--RiCL8ewnmk+C6rWq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZd6VgACgkQJNaLcl1U
h9CR2Qf/ZgPmJw4SL9rsGa2mpYBfaN4I/qRoIybZGTkjt5FpsAcVntF+dkVfaUAw
HePlgZS+FGgiFayfvlE+Mz++NqgjxQ+vw8M9LPp4UPpifiG8h5Fs3s73th/QrUYu
j9auwKkW9K92cswaV4Auy9/Z5Cezy202SviREXZed+KdnO9YljhmlggSGpc7sSxI
90P8hY+1cydic+z2jTW+ApwPHmEaji86Ek3463oD90/QG+o0l9rCpHPsTDQn6IHp
KhIzE/HRnrLnnlSpfKW1xWaZKRBcNBG1uSu+RygxaVHDHHRg+/9MP31CGsr+kX0J
AYjzIBfK9vsneW+g5EhnlEbRBFJGyw==
=CjsC
-----END PGP SIGNATURE-----

--RiCL8ewnmk+C6rWq--
