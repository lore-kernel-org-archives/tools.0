Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBBC82F2A;
	Wed, 31 Aug 2022 17:19:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57781C433C1;
	Wed, 31 Aug 2022 17:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661966353;
	bh=5/uUtcQe75juG+imXYuq7FpOTv0vgTnrBxAyIniMXlA=;
	h=Subject:From:To:Cc:Date:From;
	b=P3/+/kwV/Xp5e+k40KxH7/zZ+5t+iRc10Jub7E+7hG/oXuBo9zAmxqNWDuQrWmvTl
	 Zh1PfgayttZdxVnlwe/bJTGyq6AyQHw5JpJh3MFf/Gw1MvrWttlR4QjHHOsYgkPbek
	 MkjORFY7KYcNIvrdlOPAytXF0T2qAlsnL87ZKWa4DbK+XA4iBxM8wbLrZtPJPhBfqG
	 wf+5S7uHPkJ6l3zwyuEiy5r8P7CYsA2BAtxrm4MlhGzc3WIloM6JJw8feDkgSJQf3b
	 X5/aMTOQ6dCUUtciMVwCeqxn41mxF+14fJ4BbonFrTNualoe5F2Xp3HKDdrwFTN+Nh
	 W3ykn9Q3BcmoA==
Message-ID: <2517d5cdff57048a13e85b9604957b73b69724c3.camel@kernel.org>
Subject: Couple of b4 trailers issues
From: Vishal Verma <vishal@kernel.org>
To: tools@linux.kernel.org
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
	users@linux.kernel.org
Date: Wed, 31 Aug 2022 11:19:12 -0600
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-hs+spTQW8BVlaCMaMKMU"
User-Agent: Evolution 3.44.4 (3.44.4-1.fc36) 
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0


--=-hs+spTQW8BVlaCMaMKMU
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I tried out the b4 trailers command, and found a couple of issues.

1. I get a traceback (attached at the end) if the tree contains
(recent?) merge commits. This patch fixes the splat, but I'm not sure
is the right solution - I didn't spend too much time on understanding
what the parent/commit/end checks were trying to do.

---

diff --git a/b4/ez.py b/b4/ez.py
index 8a1b8ed..27dc090 100644
--- a/b4/ez.py
+++ b/b4/ez.py
@@ -649,7 +649,9 @@ def update_trailers(cmdargs: argparse.Namespace) ->
None:
=20
         prevparent =3D prevcommit =3D end =3D None
         for line in lines:
-            commit, parent =3D line.split()
+            hlist =3D line.split()
+            commit =3D hlist[0]
+            parent =3D hlist[1]
             if end is None:
                 end =3D commit
             if prevparent is None:

---

2. b4 trailers doesn't seem to respect the ordering from git config
b4.trailer-order


Traceback for #1:

$ b4 trailers -u -F 166188306499.3409478.15310054338186313752.stgit@dwillia=
2-xfh.jf.intel.com
Traceback (most recent call last):
  File "/home/vverma7/git/b4/b4/command.py", line 350, in <module>
    cmd()
  File "/home/vverma7/git/b4/b4/command.py", line 333, in cmd
    cmdargs.func(cmdargs)
  File "/home/vverma7/git/b4/b4/command.py", line 81, in cmd_trailers
    b4.ez.cmd_trailers(cmdargs)
  File "/home/vverma7/git/b4/b4/ez.py", line 1386, in cmd_trailers
    update_trailers(cmdargs)
  File "/home/vverma7/git/b4/b4/ez.py", line 652, in update_trailers
    commit, parent =3D line.split()
ValueError: too many values to unpack (expected 2)


--=-hs+spTQW8BVlaCMaMKMU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQT9vPEBxh63bwxRYEEPzq5USduLdgUCYw+YEAAKCRAPzq5USduL
do57AQDHweN3YNwXGwJmwFyaqN61cR8WMQL9VqDc7y5tRWNm+wD8D8rNiIPI8XN7
BW7vUoUPzaalt9beZED7KYB8Hh3eXQA=
=YnSU
-----END PGP SIGNATURE-----

--=-hs+spTQW8BVlaCMaMKMU--
