Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F1BB23183B
	for <tools@linux.kernel.org>; Fri, 13 Feb 2026 17:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771004345; cv=none; b=pwhIKqw1aMS5rZAxFQL9O34+7aJGioCaGJRZFxSXxkhgg6J880/AiGFUlCQYXHqdQAKUdh0aSyj3qc9h8d0775cSeCjm+f6NewmXfVKSq9qt1AfuL1Nh4/1Ij5XGW08/R5vyirso1BQCYYgDyD8fGB71Q2/YmM/TKOQ0MgNHqnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771004345; c=relaxed/simple;
	bh=QHyHSyqttkJuG5Fvwkh5wQIRuP704samlEsBZWWsKMg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Gtonk9XvCjeaoUMgeDttYd4iw8Gq/uvcOc+QiFx7CgmoWNLeqRgJUff+qZDc5PHK51ozUr8C5vG/45qWF5pP6r8cIp5mu24Fc4wqi52RM3kNjcin+3aQCO0rybv/ErL54aj0OAG/kyeBSj2mQn02MHLwYmZVKe+shSYJp48ta7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S9885C9A; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S9885C9A"
Received: by smtp.kernel.org (Postfix)
	id D1875C19421; Fri, 13 Feb 2026 17:39:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13C49C116C6;
	Fri, 13 Feb 2026 17:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771004344;
	bh=QHyHSyqttkJuG5Fvwkh5wQIRuP704samlEsBZWWsKMg=;
	h=Date:From:To:Cc:Subject:From;
	b=S9885C9A3xysNj25zsYM8Ei2v83AFhL0Ve24uIi6poNg+IHF5LNtu/bo514v7JCdb
	 WZm0CrIM1V2YIk9+nce41arIc1sUQDpM/NnL4CNyKXUVz++WdJ/ybrKsuCA9Hi4H7O
	 APdSH/hwDZn8B+Yi/L8v/l8P1sn7qO4os9bNvHCSNxRxeu7qPD37ObLKPZZnNKFyI9
	 TDL8VnvhiwxFovh3QaBHFE1fFPvLAEueTfQskpDwKXZkA//KTn5B/rnO7Sksu4LAqW
	 JOUkollfFzlVtfTavxBt+r9fg+lMkDT6aa+TgqIe4WnP1/G6hxjhep0j0EgTed6zFl
	 aL2+wYGEpKXsQ==
Date: Fri, 13 Feb 2026 17:39:01 +0000
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: b4 dig not finding commits that lore search does
Message-ID: <9c31312c-bc95-4c0a-b00f-144f165b23b8@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="D8mm6jmIgGVYvVTK"
Content-Disposition: inline
X-Cookie: I have become me without my consent.


--D8mm6jmIgGVYvVTK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Konstantin,

I'm seeing a lot of commits where b4 dig fails to turn up anything but a
quick search of lore seems to do so.  For example with=20

  e1b49deab6cb3924bd7968f353d0fb35a3f1ff5b smb: smbdirect: let smbdirect.h =
include #include <linux/types.h>

b4 dig -c reports that it can't find anything but a lore search pasting
the subject into the "search all" on the front page turns up

  https://lore.kernel.org/all/20c22b16817340d00cd310e2e09e1d74ba0b488d.1764=
091285.git.metze@samba.org/

which looks very much like the same thing.  Looking at the debug output
I see that the lore queries have date constraints:

  q=3D(s:"smb: smbdirect: introduce smbdirect_socket_wake_up_all()" AND f:"=
metze@samba.org" AND d:..20250903)

where the date is based on the AuthorDate for the commit which is vastly
earlier than the commit date for the commit, the commit date is probably
a more appropriate constraint here.  Changing to use %cs rather than %as
looks like it vastly improves things (I'd send a patch but I need to
jump through some hoops first).

Thanks,
Mark

--D8mm6jmIgGVYvVTK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmPYbQACgkQJNaLcl1U
h9AcnQf/cnVuX+f0cONlM8Rl5K91jIklE1Bd9V47q6zFT0JBdSHgfl6eOkjMJQgu
ul4xe5YVK9S04JkHsE5QoOjsCtzM4Pvuuv9MUHzhGGPcQ5tGVK/nDnshRVAulj9f
kFVgVImSbFD/vFNJfwV1nhhS0rAP0Q8MBr/w8rktUGvVZ9zxgo3H+VXBm5TauwFJ
f5W/ahFTa7llp0JseEGIR9BlUygslsE8j/SaWI0x19nCfUT7YqGfEirKLA+lKQQM
G3RdlntKrJSjavyBMBe7WfsfIzJDi3Whrq50neSy2xFTbxpQrnwKC2S2a51y2lSw
udZmxb52LyC81c8kOULHx7SVaZ8LLw==
=zSdn
-----END PGP SIGNATURE-----

--D8mm6jmIgGVYvVTK--
