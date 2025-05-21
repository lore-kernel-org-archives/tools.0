Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBDED171D2
	for <tools@linux.kernel.org>; Wed, 21 May 2025 00:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747787312; cv=none; b=MJtoocGwQz1CKQTEzqRkFIxRG2wjPUcohxBKOpLSQHgJm9/NdvB3jFyBWqUmX+mLawSycJsSq6NyaTJ//fz7li/Gwwyl375xqVL0z2GgAi1YM0id2Rvz+KM5r07LddLDsoGLQVRii5x5DAK/7P/oIhOWFI6ta1/8SJ7aRI0OpuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747787312; c=relaxed/simple;
	bh=xTs/lE1XK7IFmjQ8muiAjzOa986u/x48OlRnNj84fEk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mp5jEw2ZU/QVoc16fQBUIPhkUEKJmxT+g9XU7wpNSrrELu7iv2ApgrxhnEyd59u+EDVhHJy/o+XmVVPxUXf68zGg7MXVifHwqou1Atgs3pkTa87V8We4Z8jtidwS3FCnDZS7FWAq6ihbuKWnnXyJQNikH1zOSWcqTAC7nFwdiJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=DbFSYxhK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="DbFSYxhK"
Received: by smtp.kernel.org (Postfix)
	id 638C0C4CEEA; Wed, 21 May 2025 00:28:31 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E280CC4CEE9
	for <tools@kernel.org>; Wed, 21 May 2025 00:28:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E280CC4CEE9
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-acbb85ce788so1224931866b.3
        for <tools@kernel.org>; Tue, 20 May 2025 17:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747787307; x=1748392107; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z1A0eQ+L3rXQiqQEXjQugnKeC4BWT4jQpkpYhUCwhJg=;
        b=DbFSYxhKluecgfAA0ZhPPFHxRcKlKqKnKCyJdNhVl4HT2iBeKt3Fky0zOoHb+iVx+/
         hNwx5xHxM9x8vVI9RwBL0od+Owz7Mr79PazUbNJu0iNQ0vK5nX6XZ87rhdgrz+iQWyAF
         ImgZ+D+S9iZtTLuEw+BXhb3ji6E4Is7AHmmLBl8ogwwqOMC0XFf78qOftmxJXRTiMvEx
         Z7LMSjE5UQTyriSO+bfa3Cg55JYJMXZWuTmdgyF4NVeinej+jBlP5sNLKkg98c3jICCF
         X6u7u3hB2nqOi+vub20YKb86i6okPaaSs6gV1LEJu6Tgr1g+NXOaPKwyOm4KUX6VRCsx
         pgMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747787307; x=1748392107;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z1A0eQ+L3rXQiqQEXjQugnKeC4BWT4jQpkpYhUCwhJg=;
        b=Zw/+cEKy6BhbHc6znFjRsYILNKCVfon5ZPZ7HV8QlygiF6yVMu2vhvvUqPwNS3n3Q2
         emXriI1AOBAPBruA8GPpaiUPUH8QtmCKngAFZ8djOBV/ADzdOMC5JRKxdBHWgS14Htht
         Jp//cK3DOs4QZxptgXEL7wYzqJCkp20Ubb5F1cZXboxT3kgayd2D/FwSLqnHAXYMgDP9
         o2nR0uYgIYpEHPodDh+qjbFMAy7eidWWZk76PMrZwZeNVZ5snPHqsv6gZhprtvndEUsM
         P6/d/abbvjHBBPd6/GR9Zw/aQkNG62o0/G7yeYt7BwA5l8Elne+jZSwFRc+CVC3/duiR
         3mjQ==
X-Gm-Message-State: AOJu0YwoN9JsVYPF+kp7ZHlxCit7QFkwdRC4LD+3wRhNicf7zULgvrC1
	d9bjJF7sec0h8v4R7fXCduDrS4dk+5FsUh2tihJt6bmS0krPXfFwakOf1BTEq8We5x4=
X-Gm-Gg: ASbGncve+Q8S1jx54JVrbKxrN+Ymc0oWB2qhfgrVpYQ/zDFjwfWcfbcLMEfoSacu2Xm
	UCg3KdvGmbfbBZleNtDFhXb3AqkT0IXniB0H5mVVkIvzhQC+hvvJ7FJ3NWSlHLzprSulzKdIPCC
	ayHo0NAB9TmWOfjgZalhkedwgsmkUSd0+RuCUoTemIk0I+R3wAnsH3mFBvCdLh5FX76drp4y8yF
	9cUU91UrvOPaBF8FpoY4MYdwGlGAWF+klUguuNn7HhomXXZ/Kn1XlRaJ4AEvA9MbXEItrae1vIT
	VzttBY0hJjF+MB6cHqw7JsteR62Q2yZvDphFCGvYOs+LfiTG1RbC2Aq/
X-Google-Smtp-Source: AGHT+IHqx5SfuJsqzhnZVg8/OZd+BlhIZwg0uX2eg9BYKjmIcPa76/C+RLER4AlJV2ax5ERTsiEXsA==
X-Received: by 2002:a17:907:39c:b0:ad5:3ce3:6efb with SMTP id a640c23a62f3a-ad53ce3e815mr1342006466b.25.1747787306936;
        Tue, 20 May 2025 17:28:26 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ad52d438086sm804201266b.89.2025.05.20.17.28.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 17:28:26 -0700 (PDT)
Date: Wed, 21 May 2025 02:28:24 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: Re: [PATCH wotmate v4 0/6] Cleanup, a fix and txt representation for
 trust path finding
Message-ID: <fekxcrrrgoxu3ugecdyzc5nrlzfoa776dlyzjc6ger2mjmhry7@p3itqnu7tm34>
References: <20250519101429.1558947-8-u.kleine-koenig@baylibre.com>
 <20250520-resourceful-salamander-of-opposition-131c63@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mofv67pbxnpm5wmm"
Content-Disposition: inline
In-Reply-To: <20250520-resourceful-salamander-of-opposition-131c63@lemur>


--mofv67pbxnpm5wmm
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH wotmate v4 0/6] Cleanup, a fix and txt representation for
 trust path finding
MIME-Version: 1.0

Hello Konstantin,

On Tue, May 20, 2025 at 05:03:50PM -0400, Konstantin Ryabitsev wrote:
> On Mon, May 19, 2025 at 12:14:30PM +0200, Uwe Kleine-K=F6nig wrote:
> > This is v4 of the series that I called "Updates to wotmate, partly due
> > to changed behaviour in gpg" before. Now it does some more things, so I
> > renamed. The previous submission is available at
> > https://lore.kernel.org/tools/cover.1747038870.git.u.kleine-koenig@bayl=
ibre.com/
>=20
> Thank you for working on this! I've applied and run it in my test environ=
ment
> as you suggested (against an empty file). However, I see that it creates a
> bunch of zero-length graphs/*.txt files due to a lot of paths no longer
> working when we exclude sha1. That's something to improve, but can be don=
e as
> a revision on top of this series.

What would you wish to have in the txt files for a key that has no more
valid path from Linus? Maybe just don't create it? (Actually I like an
empty file because then each .svg file has a .txt file and it's easy to
determine with keys have no path.)

> For now, I've disabled the sha1 exclusion and rerun this on the keyring.
> Looks good to me, so the changes are in now.

Looking at your change to the pgpkeys repo you still got rid of many
SHA-1 signatures due to commit b088af1f40a5 ("export-keyring: Default to
store \"clean\" public keys") as cleaning implies pruning weak
signatures. The effect is only limited because the linter check prevents
several keys from being updated. So because e.g. Greg's key
(38DBBDC86092693E) uses a SHA-1 protected User ID, it doesn't lose
Linus' signature.

I think if we want to keep the SHA-1 sigs for a while, we should do:

diff --git a/export-keyring.py b/export-keyring.py
index 3d8d400c9334..53e4936fa0eb 100755
--- a/export-keyring.py
+++ b/export-keyring.py
@@ -101,7 +101,7 @@ if __name__ =3D=3D '__main__':
     for (to_rowid, kid, uiddata) in c.fetchall():
         kcount +=3D 1
         # First, export the key
-        args =3D ['-a', '--export', '--export-options', cmdargs.key_export=
_options, kid]
+        args =3D ['-a', '--export', '--allow-weak-digest-algos', '--export=
-options', cmdargs.key_export_options, kid]
         keydata =3D wotmate.gpg_run_command(args, with_colons=3DFalse)
         keyout =3D os.path.join(keydir, '%s.asc' % kid)

and maybe redo 89ce0eaa9633 ("Initial rerun after wotmate changes")[1].
Then Greg also gets a flattering 38DBBDC86092693E.txt and with him 280
others.

> I'll work with the top keyring introducers to strengthen some of the core
> paths before we try disabling sha1 again -- hopefully with less drastic
> results.

We already talked about that via irc, just restating it here for public
awareness:

This doesn't necessarily need a keysigning event. If Linus still
remembers to have signed Greg's key 38DBBDC86092693E after carefully
checking his ID and fingerprint, he can just resign it with more modern
tools and settings.

This might work using:

	gpg --force-sign-key --quick-sign-key 647F28654894E3BD457199BE38DBBDC86092=
693E "Greg Kroah-Hartman (Linux kernel stable release signing key) <greg@kr=
oah.com>";
	gpg --keyserver "hkps://keyserver.ubuntu.com/" --send-key 647F28654894E3BD=
457199BE38DBBDC86092693E;

(Obviously I cannot test exactly that as I don't have access to Linus'
private key. :-)

Best regards
Uwe

[1] e.g. by first debuffing the linter check (that's important!) and
    then with the above change do:
	git checkout a0bc65fb27f5 -- keys
	korg-update-pgpkeys empty

--mofv67pbxnpm5wmm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmgtHiUACgkQj4D7WH0S
/k5NIwgAuS/Ldqap5cbIxLqnkYaGS1coL/O/ZeeM0+r1mYPmVwELs76UiKZgnVFS
vHO5vd72CAwoRu1RuTg0zWci6qPtYXM0/J1bVCc/UiXgN5x/XnNxYmygtZ/c4PVL
A6T7bRkAK2iDNwY/THZfkePosuJk1AEoTD2OA9lPYMIJ1fQwd70U8NLoT5PaGwzr
wZG1WD1pHmTf5jTEAA0cFSPegs00NaNlG3dVBRd3DikGBLsvkfuRA3Shsxjq6SSe
dMSh5EmTiHB1Jg9bQkmFNa7dzK6LJ7a5wqAhg1FD/QhCA9BEiKkJJZQMOQNsusB/
cs9/TuCtG2C7xR/woL0/+yXSdnfKtg==
=qUA+
-----END PGP SIGNATURE-----

--mofv67pbxnpm5wmm--
