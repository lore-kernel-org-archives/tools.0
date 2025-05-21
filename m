Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253B6239E7A
	for <tools@linux.kernel.org>; Wed, 21 May 2025 09:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747818756; cv=none; b=pxNCUAsAHEe3fzxyplMFsYewlgISzf144y4F7KRlUoNfeByfvCnWLmCpNS1Ed7RLlWRCFnkhnIb0MyGCaqEN2p2SUF9gMp3xDLeAz6A5A5vBIbmGFC9cumKKm3rJpufpFh/HIyn9lSw0C/Gz4aJjeyFKaP0UnzKfUeeICmxrojY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747818756; c=relaxed/simple;
	bh=35gBnivHBllI1CEz8qRfBKft13xWUIRrQj/BmqFg8y8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b4nqhvUNVv20GCL8H25WVNDeHAV1MRJfuHCQ7N76X3wia+A2j5ajaIVGY4ibJRR8JpYFoHmYIqS5gO7LjIjzLDlGQZaIW2G3orHSBGJtNbpj+kAaZ6bXUMfMlt65wxwuCNXxyuanaanPhFdMwW4NiBuL4eE1pCWOJU9o3eUP0Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=LAcXaK/i; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="LAcXaK/i"
Received: by smtp.kernel.org (Postfix)
	id A1147C4CEED; Wed, 21 May 2025 09:12:35 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4ABC5C4CEEA
	for <tools@kernel.org>; Wed, 21 May 2025 09:12:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4ABC5C4CEEA
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-443a787bd14so30961825e9.1
        for <tools@kernel.org>; Wed, 21 May 2025 02:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747818751; x=1748423551; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6hT2warjvM9IY08S5QjxrgAQQaH1x+riF6bMJBr28sQ=;
        b=LAcXaK/i4OJ2IG6Rkd7Yu5KZAj6W7/6H0pnTPDpF43dJgvCY84UuWrh/1R7chgGby9
         x1c5eJSddUDO9UazDAq16rcunNvfAOepBAYB0HdM2aVIQ28zrvcEj0Nm/0qEvQd6vQQO
         emyAXZeS5hBn2cQZWmEZGHvQyLvKhIlTdNISKoMUbzYkW7gwOlEx1HYLm9v9p3ycRoxx
         FI+FwfpNs2xSgMcb3bVdhN4ibk1Kt5VLbEwE7H0nHo+uhQfhR253NBQd7fhy430vtcQ4
         OKsYihuYINEGWNQb5kMZFgqWyFBnCr19SpDc3uopZzEosnW8zeJIjIN8Qnqm8WV3EFBv
         s+Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747818751; x=1748423551;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6hT2warjvM9IY08S5QjxrgAQQaH1x+riF6bMJBr28sQ=;
        b=R7lXNiB6jKjfdclaos4ikm0BrjkPB89x3819KEibqrCOUXi+8enEX2SQhmkgYdh1oe
         2w09rikfFjDgsj0dQBuOrdOKWDlEW7ndUnatfVnmBF2Hf89bVOcmnMh0JGlQggmOM9U0
         U2FZtyKGFTPyzG/sbJFGm1NEdCo3NOajnVfhxYZghjDjnrNEwXCdyKytXxuEoC5M/zUJ
         7vCp+UhmT/zVuz9FVSTRnr+DcNmP6xDrcjMibjyBvR8jHHwllIMk8z4islbEm5uAwC+m
         9VbffTPFC3vKxE5c9E+1wpLnQuHXxlMCjbipzbRhkXPj+bEH96UOeo9owPu1z7XcvV3S
         6CaQ==
X-Gm-Message-State: AOJu0YwzBlB6ggWzjb9fKF6H/lu8NzOhC/fQgJYK/tBlbWDH12jMjdxn
	hH6X8kAOE76CTruUeEaQPzryP6iMnx9zm59zUzoDQm8sW51huMAestLFg5EixBosi6E=
X-Gm-Gg: ASbGncuH6voc6frYx6UbSJY8A548JHGNi5GZZMJGcoObLSocMtYKppEkzatrSLv3D1p
	CusRdSxuADuNnQPMg7tBGJ2zhddqed4DsFeLXtMXFkrpU6BEGEotsTa/+lYLy5+gLvnyiZqoiw0
	CwTlKSSwJGE1ZCc/33pZtXGP+18DNlNGPnRaPXViUKcpfhF/UHqVgl/RACuPCMKSZvdyeqwAnpK
	dmDpvOqlTfsr+TYN+fbaQqoGkEMUM/I5/B5d/t7J+kAH3sMnZH4bUnatT0v0MKuHtufNh5vW/iY
	GjFuEMgMOIsyIKdDzEFhRfCiwQB2Ml0smIi0AvnP7AjxBTziw8kgTjUH9vl2JxYjEhf76X2FPrU
	IdrAF6Z1D5bCojYMy4h/HQPV5Jeoi
X-Google-Smtp-Source: AGHT+IHGe2T9o42KTn3H7b2XBbdoqAufoW69Ny91tuDoDo3fmcECJUKgOqad+qI87mFsKRGcP8y5bg==
X-Received: by 2002:a05:6000:1445:b0:3a3:7be3:d0aa with SMTP id ffacd0b85a97d-3a37be3d129mr3997165f8f.18.1747818751311;
        Wed, 21 May 2025 02:12:31 -0700 (PDT)
Received: from localhost (p200300f65f13c80400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f13:c804::1b9])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-447f3814262sm61894545e9.25.2025.05.21.02.12.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 02:12:29 -0700 (PDT)
Date: Wed, 21 May 2025 11:12:28 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: Re: [PATCH wotmate v4 0/6] Cleanup, a fix and txt representation for
 trust path finding
Message-ID: <gnl4wd5opraaqx2iimdss22vwqqraex2jxo4rxxwblifooagjy@bdpwayn336en>
References: <20250519101429.1558947-8-u.kleine-koenig@baylibre.com>
 <20250520-resourceful-salamander-of-opposition-131c63@lemur>
 <fekxcrrrgoxu3ugecdyzc5nrlzfoa776dlyzjc6ger2mjmhry7@p3itqnu7tm34>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7dvkbctzjduiixei"
Content-Disposition: inline
In-Reply-To: <fekxcrrrgoxu3ugecdyzc5nrlzfoa776dlyzjc6ger2mjmhry7@p3itqnu7tm34>


--7dvkbctzjduiixei
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH wotmate v4 0/6] Cleanup, a fix and txt representation for
 trust path finding
MIME-Version: 1.0

Hello again,

On Wed, May 21, 2025 at 02:28:27AM +0200, Uwe Kleine-K=F6nig wrote:
> On Tue, May 20, 2025 at 05:03:50PM -0400, Konstantin Ryabitsev wrote:
> > On Mon, May 19, 2025 at 12:14:30PM +0200, Uwe Kleine-K=F6nig wrote:
> > > This is v4 of the series that I called "Updates to wotmate, partly due
> > > to changed behaviour in gpg" before. Now it does some more things, so=
 I
> > > renamed. The previous submission is available at
> > > https://lore.kernel.org/tools/cover.1747038870.git.u.kleine-koenig@ba=
ylibre.com/
> >=20
> > Thank you for working on this! I've applied and run it in my test envir=
onment
> > as you suggested (against an empty file). However, I see that it create=
s a
> > bunch of zero-length graphs/*.txt files due to a lot of paths no longer
> > working when we exclude sha1. That's something to improve, but can be d=
one as
> > a revision on top of this series.
>=20
> What would you wish to have in the txt files for a key that has no more
> valid path from Linus? Maybe just don't create it? (Actually I like an
> empty file because then each .svg file has a .txt file and it's easy to
> determine with keys have no path.)
>=20
> > For now, I've disabled the sha1 exclusion and rerun this on the keyring.
> > Looks good to me, so the changes are in now.
>=20
> Looking at your change to the pgpkeys repo you still got rid of many
> SHA-1 signatures due to commit b088af1f40a5 ("export-keyring: Default to
> store \"clean\" public keys") as cleaning implies pruning weak
> signatures. The effect is only limited because the linter check prevents
> several keys from being updated. So because e.g. Greg's key
> (38DBBDC86092693E) uses a SHA-1 protected User ID, it doesn't lose
> Linus' signature.

One side effect of how SHA-1 signatures got thrown away is that the
graphs (both svg and txt) were generated with these SHA-1 signatures but
they didn't make it into the updated keys. For example
8972F4DFDC6DC026.txt currently looks as follows:

	from  79BE3E4300411886  Linus Torvalds <torvalds@kernel.org>
	   1  8972F4DFDC6DC026  Kees Cook <kees@outflux.net>

But keys/8972F4DFDC6DC026.asc doesn't have a signature by
79BE3E4300411886 any more. So if you run

	korg-update-pgpkeys empty

once more, this signature isn't available any more and Kees' trust path
degenerates to:

	from  79BE3E4300411886  Linus Torvalds <torvalds@kernel.org>
	   1  17212997986C5765  Benson Leung <bleung@chromium.org>
	   2  8972F4DFDC6DC026  Kees Cook <kees@outflux.net>
=09
	from  79BE3E4300411886  Linus Torvalds <torvalds@kernel.org>
	   1  7C56ACFE947897D8  Anibal Monsalve Salazar <anibal@debian.org>
	   2  8972F4DFDC6DC026  Kees Cook <kees@outflux.net>
=09
	from  79BE3E4300411886  Linus Torvalds <torvalds@kernel.org>
	   1  80A77F6095CDE47E  Stephen Hemminger (Microsoft corporate) <sthemmin@=
microsoft.com>
	   2  8972F4DFDC6DC026  Kees Cook <kees@outflux.net>
=09
	from  79BE3E4300411886  Linus Torvalds <torvalds@kernel.org>
	   1  2EA76B9C2B466D9D  John Hawley ("Warthog9") <warthog9@eaglescrag.net>
	   2  41633B9FE837F581  Mike Frysinger <vapier@gentoo.org>
	   3  8972F4DFDC6DC026  Kees Cook <kees@outflux.net>

Also there is another bug in export-keyring.py that prevented that a
graph for 000E684119568215 (and several others) was generated. These
will also appear if you rerun `korg-update-pgpkeys empty` without the
linter check.

I'll prepare a patch for that later (maybe tomorrow).

> I think if we want to keep the SHA-1 sigs for a while, we should do:
>=20
> diff --git a/export-keyring.py b/export-keyring.py
> index 3d8d400c9334..53e4936fa0eb 100755
> --- a/export-keyring.py
> +++ b/export-keyring.py
> @@ -101,7 +101,7 @@ if __name__ =3D=3D '__main__':
>      for (to_rowid, kid, uiddata) in c.fetchall():
>          kcount +=3D 1
>          # First, export the key
> -        args =3D ['-a', '--export', '--export-options', cmdargs.key_expo=
rt_options, kid]
> +        args =3D ['-a', '--export', '--allow-weak-digest-algos', '--expo=
rt-options', cmdargs.key_export_options, kid]

Maybe we need --allow-weak-key-signatures here instead of (or
additionally to) --allow-weak-digest-algos. That will be part of the
next patch set, too---once I understood the effects completely.

>          keydata =3D wotmate.gpg_run_command(args, with_colons=3DFalse)
>          keyout =3D os.path.join(keydir, '%s.asc' % kid)

Best regards
Uwe

--7dvkbctzjduiixei
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmgtmPkACgkQj4D7WH0S
/k5ivwf/U+cLH+mp192eBOsCvYF/m7SgRvbikKpMJwPFQ4O2eSiOK49cIB68bGNs
t7CsmrIkKSkMVNc9GllyL7chBjTsfezC74xkRUaCo6WY1QtqXZ2VtPqWET4iB3U2
Kzot9yKAph1KoKXD3s0eQYBkLDiBEODMR50A8Fx+7UtyCg4PEOytycw3Z3hAsCvn
qB6sOlINhsYtLp03ii9MO9/wjBjgYT5UE2rNhNYoEY1KCvC34aX77pOVB5dfu4VR
eyVKoeEGba2YQnqLWV2IiR+5nu9pieWqDdK9RMqbSXJZbl+QsgjeQ9JXO8J3F59N
tmqbHrMuKdhLU3jL3G2fX0Tn4AtJZQ==
=K2J0
-----END PGP SIGNATURE-----

--7dvkbctzjduiixei--
