Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79BC14F12C
	for <tools@linux.kernel.org>; Mon, 17 Jun 2024 16:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718642480; cv=none; b=Mz8pQc8TyDZwKvra+QC9aXbbw1ZYAgd1BbElg5VHFXB/4FyGs6z1MyyEfJVaM/6OPn7ePu7MHEeI26qGKIDnaVUiHrZZttKoG6jVE6TAm2l2C61KshzX/k532JTwi/ouNI3UwseurlIInj24lVtYXIFhAYtKPxb1Lstxr7sPFro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718642480; c=relaxed/simple;
	bh=rGb514XmMLhEb7TQKOoqbAdWriniIr/pSCWZxkEIa+U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EP7QYIll1vyvAJVthRCa25UvMgMstgExuuenwryHVJtAhEFDEeR7lz/Fseyq8wK4yWcJ/9ptLviF7Uofw7qy2IWrEBH199hlVb31r8yof3Csimo15iH6ghVSar6O7jmOfUanMUXb9Nl1/bxQJ6uMwi4EQ+/9J5KWy5HLjRX8ENE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dxrtFR5S; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dxrtFR5S"
Received: by smtp.kernel.org (Postfix)
	id CBEB1C3277B; Mon, 17 Jun 2024 16:41:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15EC5C2BD10;
	Mon, 17 Jun 2024 16:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718642480;
	bh=rGb514XmMLhEb7TQKOoqbAdWriniIr/pSCWZxkEIa+U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dxrtFR5SjQCWksLG5HpsGfgxW6fNs9PP7i5zJ7YNtf6QXcpesZYpr5H5ttzgl8tIo
	 fNImQDZW/qelRrQNOlmmplYv8brGyZcWYf9b24JnQyx92s9kq0fM4SeO3UTe4bv/+3
	 yY4qWSyPIB/1Hbnp20pH6QVLEu3q9WRLvd8GiiFUx70FwUQAMbKyW4tJz21WgBCZcD
	 5T2WbOw16e030MP39Vao1HKeyLySdVe10LZAz08WH1sRew8xpROUZkIOZ3THzfnpsl
	 eEGtugETXr3lc0TmJ/MBmxU1IHXl11004n8Y4UXjXClb9LGmAfJRHHhjLPjfAETWl8
	 poA6ZUmUApbKA==
Date: Mon, 17 Jun 2024 18:41:17 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: tools@kernel.org
Subject: Re: SIGN output impossibly large
Message-ID: <4dooty3j6sgjh7jl726nf3wp5szzbvehs5srorom4qtlulwomg@zmllwmdxfx2s>
References: <5yz5chpzv4qhpfpitzvgjfw2o5ctgvedzbsxzohbvl5oxvzqzc@xwzpoipfj73h>
 <20240617-calm-bald-dinosaur-ce8efe@lemur>
 <atk5mrwjkl44ffqvwwg54gzjl7mgst3pkejercb22vjmpoqwre@irmwsq54uuar>
 <6jv5lshvmvoaejoqvv5lbevitgjzpoplkx6eaxuyxsa75wq6am@leuzkhjf4izl>
 <20240617-secret-charcoal-cougar-dcd01a@meerkat>
 <6fers6bgoiyc44h23wcvk4ebkf5vpwxdkxvgaiifvilnb6tcbo@wnzi6tdxn5b5>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="h2aoigndw6oft4w3"
Content-Disposition: inline
In-Reply-To: <6fers6bgoiyc44h23wcvk4ebkf5vpwxdkxvgaiifvilnb6tcbo@wnzi6tdxn5b5>


--h2aoigndw6oft4w3
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: tools@kernel.org
Subject: Re: SIGN output impossibly large
References: <5yz5chpzv4qhpfpitzvgjfw2o5ctgvedzbsxzohbvl5oxvzqzc@xwzpoipfj73h>
 <20240617-calm-bald-dinosaur-ce8efe@lemur>
 <atk5mrwjkl44ffqvwwg54gzjl7mgst3pkejercb22vjmpoqwre@irmwsq54uuar>
 <6jv5lshvmvoaejoqvv5lbevitgjzpoplkx6eaxuyxsa75wq6am@leuzkhjf4izl>
 <20240617-secret-charcoal-cougar-dcd01a@meerkat>
 <6fers6bgoiyc44h23wcvk4ebkf5vpwxdkxvgaiifvilnb6tcbo@wnzi6tdxn5b5>
MIME-Version: 1.0
In-Reply-To: <6fers6bgoiyc44h23wcvk4ebkf5vpwxdkxvgaiifvilnb6tcbo@wnzi6tdxn5b5>

On Mon, Jun 17, 2024 at 06:37:38PM GMT, Alejandro Colomar wrote:
> Hi Konstantin,
>=20
> On Mon, Jun 17, 2024 at 12:17:11PM GMT, Konstantin Ryabitsev wrote:
> > On Mon, Jun 17, 2024 at 06:00:36PM GMT, Alejandro Colomar wrote:
> > > > >     kup put man-pages-6.9.1.tar{.asc,} /pub/linux/docs/man-pages/=
man-pages-6.9.1.tar.gz
> >=20
> > I think your shell is resolving your shorthand in the wrong order, or y=
our
> > local files are swapped, because what we're receiving on our end is the
> > reverse order:
> >=20
> > kup-server(alx)[15972]: Cmd: DATA 833 %
> > kup-server(alx)[15972]: Cmd: SIGN 12390400 %
>=20
> I tried without shorthand, but still same result.  Maybe kup-server(1)
> is mixing them?  Or maybe the kup(1) client?
>=20
> 	$ kup put \
> 		man-pages-6.9.1.tar.asc \
> 		man-pages-6.9.1.tar \
> 		/pub/linux/docs/man-pages/man-pages-6.9.1.tar.gz

Actually, I'm re-reading the kup(1) manual page, and I see

     put local_file signature_file remote_path
            Upload  the file local_file signed with signature_file.  local_=
file
            can be compressed with gzip, bzip2 or xz; this  may  reduce  up=
load
            time.   The  content  will be stored compressed or uncompressed=
 de=E2=80=90
            pending solely on the extension of remote_path.

For some reason, I misread my own instructions for uploading the
tarball, which clearly say the same thing:

            -  Upload the tarball:

                   $ kup put man-pages-$new.tar.{xz,asc} \
                             /pub/linux/docs/man-pages/
                   $ cd ..

I wasn't even passing the .xz tarball to kup(1), but the bare tarball.
Hmmm, not a bug.  Just another error between chair and keyboard.

Sorry for the noise!

Have a lovely day!
Alex

> 	Enter passphrase for key '/home/alx/.ssh/korg-alx':=20
> 	perl: warning: Setting locale failed.
> 	perl: warning: Please check that your locale settings:
> 		LANGUAGE =3D (unset),
> 		LC_ALL =3D (unset),
> 		LANG =3D "C.utf8"
> 	    are supported and installed on your system.
> 	perl: warning: Falling back to the standard locale ("C").
> 	perl: warning: Setting locale failed.
> 	perl: warning: Please check that your locale settings:
> 		LANGUAGE =3D (unset),
> 		LC_ALL =3D (unset),
> 		LANG =3D "C.utf8"
> 	    are supported and installed on your system.
> 	perl: warning: Falling back to the standard locale ("C").
> 	perl: warning: Setting locale failed.
> 	perl: warning: Please check that your locale settings:
> 		LANGUAGE =3D (unset),
> 		LC_ALL =3D (unset),
> 		LANG =3D "C.utf8"
> 	    are supported and installed on your system.
> 	perl: warning: Falling back to the standard locale ("C").
> 	FATAL: SIGN output impossibly large
>=20
> 	$ date
> 	Mon Jun 17 18:28:51 CEST 2024
> 	$ echo $BASH_VERSION
> 	5.2.21(1)-release
> 	$ ls -l man-pages-6.9.1.tar{.asc,}
> 	-rw-rw-r-- 1 alx alx 12390400 Jun 17 13:29 man-pages-6.9.1.tar
> 	-rw-rw-r-- 1 alx alx      833 Jun 17 13:29 man-pages-6.9.1.tar.asc
> 	$ file man-pages-6.9.1.tar
> 	man-pages-6.9.1.tar: POSIX tar archive (GNU)
> 	$ file man-pages-6.9.1.tar.asc
> 	man-pages-6.9.1.tar.asc: PGP signature Signature (old)
> 	$ gpg --verify man-pages-6.9.1.tar.asc man-pages-6.9.1.tar
> 	gpg: Signature made Mon Jun 17 13:29:36 2024 CEST
> 	gpg:                using RSA key EA3A87F0A4EBA030E45DF2409E8C1AFBBEFFDB=
32
> 	gpg: Good signature from "Alejandro Colomar <alx@alejandro-colomar.es>" =
[ultimate]
> 	gpg:                 aka "Alejandro Colomar <alx@kernel.org>" [ultimate]
> 	gpg:                 aka "Alejandro Colomar Andres <alx.manpages@gmail.c=
om>" [ultimate]
> 	$ bash --version
> 	GNU bash, version 5.2.21(1)-release (x86_64-pc-linux-gnu)
> 	Copyright (C) 2022 Free Software Foundation, Inc.
> 	License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.=
html>
>=20
> 	This is free software; you are free to change and redistribute it.
> 	There is NO WARRANTY, to the extent permitted by law.
> 	$ uname -a
> 	Linux debian 6.8.12-amd64 #1 SMP PREEMPT_DYNAMIC Debian 6.8.12-1 (2024-0=
5-31) x86_64 GNU/Linux
> 	$ dpkg -l | grep kup-client | sed 's/   */  /g'
> 	ii  kup-client  0.3.6-4  all  kernel.org upload tool
> 	$ cat /etc/os-release=20
> 	PRETTY_NAME=3D"Debian GNU/Linux trixie/sid"
> 	NAME=3D"Debian GNU/Linux"
> 	VERSION_CODENAME=3Dtrixie
> 	ID=3Ddebian
> 	HOME_URL=3D"https://www.debian.org/"
> 	SUPPORT_URL=3D"https://www.debian.org/support"
> 	BUG_REPORT_URL=3D"https://bugs.debian.org/"
>=20
>=20
> Cheers,
> Alex
>=20
> --=20
> <https://www.alejandro-colomar.es/>



--=20
<https://www.alejandro-colomar.es/>

--h2aoigndw6oft4w3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6jqH8KTroDDkXfJAnowa+77/2zIFAmZwZy0ACgkQnowa+77/
2zJI/A/+NQ5FwvPCyhQSFwLLeZRL37EHZSVnLrPLj+9NfQSoGFVRDWiS6zzPwDqX
n8By59MtpRrm7HJY5eaNQRUCcCO2256XlS5tKF0gAdGSOlusDkqERBzy58U6XdYv
frcmAuOTifMPqdS1JIAjGNn98u8ceerMISOQPQKJ8S4aXsYZ11ucCflcH5pWPLDq
Cjl7Zg0OcQud3XzA/q7rC6//sM3EXh0CZb48iHmXRNjblh6jkXpY16xcsfIhwRTM
yu3vcJ39DSfOY+Uzm6Dav9hK0FXiG74fyLpoZwgqAQfieWjLML6ig0Y7c/qh0/3B
poLyBD8lUB+wAMIv+WVNgdW1b4+/ip4HezvVThnfyM2pPF1NYWa4ApehVCZTPwww
FkH0NKlSdb+Pf5CzzB3Sj9X71dYM3kDKKTMzLduYrBgUTRawZXGS0F/3vEW+ma2m
Tgak8UaQ6aqnttCIk/O11yG5dOGY2PXZXhcS0dGQeZftvMiomh4UicETNkuPcfTy
8rD12VzDgRK6DIALN4yUATLCC02jtpK1eGE+NCxqK81Rb2s4rQfnht1IrsVqN/T3
uOJck/7XBLcZVFr+VpciAG6g/NTr7b/0P/E7o6J3f16mcAIwTFaLGzW9egOpkKeW
rZ3c2VaXBoMXzMH6CmsFTvB0v0lIn3FPmlccrkEL+cG8sDjBzXY=
=Cqz2
-----END PGP SIGNATURE-----

--h2aoigndw6oft4w3--
