Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B521E19CD0A
	for <tools@linux.kernel.org>; Sun, 26 Apr 2026 12:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777206144; cv=none; b=UCfzROmOVg3xW1p/kt8Z8kp7kfiPhue5nZ+w0XPx2g8r+AwU70qMb0qezcLwDhU+dm2VNoe5N1bv0CUYvZ0+FdBWbQpecN7Hgm4v6tfTOXqXzPfjbBBaefY8Q4Tkx0JGZQoM6WybP5ZrfXyaR/nxfdJ69XQQbIGr+H84o7rb5PY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777206144; c=relaxed/simple;
	bh=lXjwJjq00+8yDIJdqV4BquvUWlHUeZZKAtVjU9+hGOQ=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lFGlsNL3cU+ASMFUzUNGe/czqvQvxyMaDvM3rYQtGJ6bPmj+VSp/OfhEociJbQRBF3IAuIBzneAonbDwHRNhDVgPhEtM/KAE8v1/U2F3Tn8r7Gmo98N9F85HyMZxoklD+uAUEPV6WmIp1VfnklbJMgMqyfk0YckA+LzHrnKjC1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (4096-bit key) header.d=beyermatthias.de header.i=@beyermatthias.de header.b=LVKWtuOv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=beyermatthias.de header.i=@beyermatthias.de header.b="LVKWtuOv"
Received: by smtp.kernel.org (Postfix)
	id 6D885C2BCB3; Sun, 26 Apr 2026 12:22:23 +0000 (UTC)
Received: from mailgate02.uberspace.is (mailgate02.uberspace.is [185.26.156.114])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DF5DDC2BCAF
	for <tools@kernel.org>; Sun, 26 Apr 2026 12:22:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DF5DDC2BCAF
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=beyermatthias.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=beyermatthias.de
Received: from cressida.uberspace.de (cressida.uberspace.de [185.26.156.202])
	by mailgate02.uberspace.is (Postfix) with ESMTPS id E5BD4182364
	for <tools@kernel.org>; Sun, 26 Apr 2026 14:22:18 +0200 (CEST)
Received: (qmail 17968 invoked by uid 989); 26 Apr 2026 12:22:18 -0000
Authentication-Results: cressida.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unkown) (::1)
	by cressida.uberspace.de (Haraka/3.1.1) with ESMTPSA; Sun, 26 Apr 2026 14:22:18 +0200
Date: Sun, 26 Apr 2026 14:22:16 +0200
From: Matthias Beyer <mail@beyermatthias.de>
To: tools@kernel.org
Subject: b4 shazam generate branch to apply patches to?
Message-ID: <2aczixw5erzdkkbnfflkzzyu6pkumodss7uqisvj2lldllsd2x@rd7shjtvz5me>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6kdcqypkdytg5lgq"
Content-Disposition: inline
X-Rspamd-Bar: ---
X-Rspamd-Report: BAYES_HAM(-2.999839) MID_RHS_NOT_FQDN(0.5) SIGNED_PGP(-2) SUBJECT_ENDS_QUESTION(1) MIME_GOOD(-0.2)
X-Rspamd-Score: -3.699839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=beyermatthias.de; s=uberspace;
	h=from:to:subject:date;
	bh=lXjwJjq00+8yDIJdqV4BquvUWlHUeZZKAtVjU9+hGOQ=;
	b=LVKWtuOvT3OJ5YZ9kxgqVmlBwD8FeO9u5ghrjvCJcMKteCtePBwoukoP+SwrN/KDMSPsbzul/p
	ysL9L0TO3ZN7yc5N4BEP/auTEN8x0kACoZ6wWImpdDJyRGlrWPb23tBQACledY8mzJihg3lCGqFW
	1CzpOgS1YlVZ/MBdKkfpD26POliMnZQ3+v5lBMllxDF8hPYZi5NC1h/g8jiJYbC4rlcKZflGvSae
	GlqClmC83jsypweDUVOlwIhXeldeLoYhBXgOKjl/gTj9bAiTUZaGp7I1wv3tM3OQ6zacEK7s8pQU
	NOhgSdzN5Gq0shXoqUwd6ytlWIz1AebDWF61xUz0+0rBKyM23cMAGe8wdd0Ixpdb87SxTlUH8hJX
	4y76yXdO5TV8jiXbDCtwz1Vq/szs+77k4t87esglV/6rmlIigTbY++GGemxmMXfLwilChZTCYVQf
	aMxQgSPoJRQxpA9Mz+WbH/UkV1Ka/AfyI9g8zGbFZWlur5yUcXj9B/gr2v/mnn3vK//cy034cek0
	V9nq8BhAJ6TR0Kcz8MoIRgSzBd1rzSKbN7g8veJrL0OUxYiKwLjKjg4kDu9V7BlI6yTHC41eygBz
	iFxdH46vBR8U+Ii1gAt7+z57ZWZa9ZFe0p/Zuu+nWh1K2PQW6p3/v91ucgYy942/AqRMorEIYEUR
	k=


--6kdcqypkdytg5lgq
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: b4 shazam generate branch to apply patches to?
MIME-Version: 1.0

Hi,

I am currently playing with b4 and found that I have a patch in my inbox
for which

    b4 shazam -m- -s -H

succeeds, but

    b4 shazam -m- -s -M

does not:

    Fetching into FETCH_HEAD
    Will exec: git merge --no-ff -F /home/m/archive/development/contrib/nixpkgs/.git/b4-cover --edit FETCH_HEAD --signoff
    Press Enter to continue or Ctrl-C to abortTraceback (most recent call last):
      File "/nix/store/xm2h3wvmzyqsrp25k8s5ks66ih5b8dab-b4-0.15.2/bin/.b4-wrapped", line 9, in <module>
        sys.exit(cmd())
                 ~~~^^
      File "/nix/store/xm2h3wvmzyqsrp25k8s5ks66ih5b8dab-b4-0.15.2/lib/python3.13/site-packages/b4/command.py", line 512, in cmd
        cmdargs.func(cmdargs)
        ~~~~~~~~~~~~^^^^^^^^^
      File "/nix/store/xm2h3wvmzyqsrp25k8s5ks66ih5b8dab-b4-0.15.2/lib/python3.13/site-packages/b4/command.py", line 105, in cmd_shazam
        b4.mbox.main(cmdargs)
        ~~~~~~~~~~~~^^^^^^^^^
      File "/nix/store/xm2h3wvmzyqsrp25k8s5ks66ih5b8dab-b4-0.15.2/lib/python3.13/site-packages/b4/mbox.py", line 1246, in main
        make_am(msgs, cmdargs, msgid)
        ~~~~~~~^^^^^^^^^^^^^^^^^^^^^^
      File "/nix/store/xm2h3wvmzyqsrp25k8s5ks66ih5b8dab-b4-0.15.2/lib/python3.13/site-packages/b4/mbox.py", line 499, in make_am
        input('Press Enter to continue or Ctrl-C to abort')
        ~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    EOFError: EOF when reading a line

b4 is called from neomutt, by piping a message through a script[0]
(replicated below) that translates the message id to a mbox and then
through the command(s) from above.

The aforementioned script (also in [0]):

    mid=$(cat | grep -m 1 -i "^Message-Id:"  | sed 's,^Message-ID: ,,I; s,^[[:space:]]*<,,; s,>[[:space:]]*$,,')
    notmuch show --entire-thread --format=mbox "id:$mid"


If someone wants to replicate what I am seeing:

* The patchset I try to apply is https://lists.sr.ht/~andir/nixpkgs-dev/patches/69018
    (curl -s https://lists.sr.ht/~andir/nixpkgs-dev/patches/69018/mbox > mbox)
* The repository I try to apply to is https://github.com/nixos/nixpkgs as of e49f399654dd1cd1c456714adaf01d9a69234395
* b4 0.15.2

I am of course happy to provide more information if needed to debug
this.

Best,
Matthias

[0]: https://codeberg.org/matthiasbeyer/notmuch-scripts/src/branch/master/notmuch-mid-to-mbox

--6kdcqypkdytg5lgq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEUJGUus1GMTrRclzcEKWX9Kitz80FAmnuA3gACgkQEKWX9Kit
z81ocw/+MKZtXBxWSNLI2ynnWTgffvzSmclIgk2TG5fHVHlbkpStErUrCdflVBQ+
cqRONUk3HjGmScm6NehsMklCdX4adGPTNP4zqTYzw+QnBDA0owLt08VCc+CtKOgX
10hMRZqLchvUksMMIRHFjZ0vV62HI9YKMYEtkZNqzzUln3bm4HeamvpD4DQ9PCjm
7BsieLFQ1o6xFR2zR5iJSRfLGbbQawnxv3osw5xGAJzgLGbn7WPVhqURqxFECMzI
jzcIsPnMP5yDIIS3i8IfZllV3+eW4P7C+ERJPSm5d8ie7VFfo1fOGOkW0+c6kksm
zZMX9gkc/hHesNfaAg57fiKagrLHQmhCxaay8okU/8HMJyU1t3aiILVLcIw5WUK+
+HjcdiubnAV2t3bC16iP3ewaj/s7Z9sstm0zfMQy2Q5U7ZAU6mUjKKMzpz8uVXUu
a5wsyOwY133C/kzDSlwch4H+YCsOwfznaVSAH8Y5U6A7caItkMh0Q+fF20GAOcT0
hXTzDkhd4zajhgfnz/yNgq9O/YVk/UifZ2Zbt5HmNhLtRqsQb0f+C34z9B4XafAC
qI4Dl7ht+V2fBANiFQTL2e70HVAJgHYXnUBkTMteOCaF+kBqyy/Uf59bgn3jz7/b
ukZL3DQA9G3rxIQIDGYD4WA3BuDi4+ycX2DNYJlRnbDO++KVYko=
=CqPK
-----END PGP SIGNATURE-----

--6kdcqypkdytg5lgq--
