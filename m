Received: from mx.skole.hr (mx2.hosting.skole.hr [161.53.165.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47DF1871
	for <tools@linux.kernel.org>; Mon, 24 Jul 2023 10:57:47 +0000 (UTC)
Received: from mx2.hosting.skole.hr (localhost.localdomain [127.0.0.1])
	by mx.skole.hr (mx.skole.hr) with ESMTP id B81DA8331B
	for <tools@linux.kernel.org>; Mon, 24 Jul 2023 12:50:19 +0200 (CEST)
From: Duje =?utf-8?B?TWloYW5vdmnEhw==?= <duje.mihanovic@skole.hr>
To: tools@linux.kernel.org
Subject: [BUG b4] Encoding issues with --auto-to-cc
Date: Mon, 24 Jul 2023 12:49:41 +0200
Message-ID: <1940519.PYKUYFuaPT@radijator>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Autocrypt: addr=duje.mihanovic@skole.hr;
 keydata=
 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
Content-Type: multipart/signed; boundary="nextPart21957251.EfDdHjke4D";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart21957251.EfDdHjke4D
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Duje =?utf-8?B?TWloYW5vdmnEhw==?= <duje.mihanovic@skole.hr>
To: tools@linux.kernel.org
Subject: [BUG b4] Encoding issues with --auto-to-cc
Date: Mon, 24 Jul 2023 12:49:41 +0200
Message-ID: <1940519.PYKUYFuaPT@radijator>
MIME-Version: 1.0

I decided to try using b4 to submit a patchset for adding Marvell PXA1908 ARM 
SoC support. Having enrolled an existing branch, I ran `b4 prep -c` and got 
the following error (this is with the -d switch added):

Collecting from: [PATCH v2 06/10] dt-bindings: clock: Add documentation for 
Marvell PXA1908
Running git --no-pager rev-parse --show-toplevel
Changing dir to /home/duje/code/linux
Running /home/duje/code/linux/scripts/get_maintainer.pl --nogit --nogit-
fallback --nogit-chief-penguins --norolestats --nol
Changing back into /home/duje/code/linux/Documentation/process
Traceback (most recent call last):
  File "/usr/bin/b4", line 33, in <module>
    sys.exit(load_entry_point('b4==0.12.3', 'console_scripts', 'b4')())
             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/lib/python3.11/site-packages/b4/command.py", line 360, in cmd
    cmdargs.func(cmdargs)
  File "/usr/lib/python3.11/site-packages/b4/command.py", line 76, in cmd_prep
    b4.ez.cmd_prep(cmdargs)
  File "/usr/lib/python3.11/site-packages/b4/ez.py", line 1994, in cmd_prep
    auto_to_cc()
  File "/usr/lib/python3.11/site-packages/b4/ez.py", line 1896, in auto_to_cc
    for tname, pairs in (('To', get_addresses_from_cmd(tocmd, msgbytes)),
                                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/lib/python3.11/site-packages/b4/ez.py", line 948, in 
get_addresses_from_cmd
    addrs = out.strip().decode()
            ^^^^^^^^^^^^^^^^^^^^
UnicodeDecodeError: 'utf-8' codec can't decode byte 0x87 in position 201: 
invalid start byte

I suspected that using an existing branch instead of creating a new one could 
have caused this problem, so I unzipped a 6.5-rc2 tarball into /tmp, 
initialized a Git repository there and used `git am` to apply initially only 
the patch 06/10 which was causing issues in the other repository and ran `b4 
prep -c` again. This time b4 was able to collect the addresses without issues, 
but then I tried `git am`ing the whole set into the /tmp repository and this 
time `b4 prep -c` failed with the same error on the same patch.

Steps to reproduce:
    - Checkout Linux 6.5-rc2
    - Run `b4 prep -F "<20230721210042.21535-1-duje.mihanovic@skole.hr>" -n 
<any branch name>`
    - Run `b4 prep -c`

--
Regards,
Duje
--nextPart21957251.EfDdHjke4D
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEU9+dTZw/4RD7Ni14mhGesEItluEFAmS+V0UACgkQmhGesEIt
luEh7RAApL6yS39A7bF399es0vBh8vZRV4eOjJTOmTPOZP9ZXiyks9WHS064NRy7
nUc1pzX5+NQPPjFU0vzSJmF8Pr9oHDFAsGpj1Y62e9ooST14AfrMN86WizmEJaOY
MqbCIMVtd75ExZibCddLZycWt4Rnx/cyksj/Jtz3Lm1uWLNBQHbAdZhmyjNMxRLS
xvmuoAaQoqQK5R2N6pvU9Kio7pNnV7Em+AJTXI05Ze0sfM340nToUJguv65JsPY2
jODLWdmzEDpl1TcejPsxKoFkuR3r0R0KJtWFD1q5ap4p10TSluOTeAfyFpNUCIrC
J+5AmRGPPdEm2zxEvvcRWC+xYlx+KhFyF54X6E+EiIo0npi9GXU9r8ybTUMy7tA/
dqNuUItP/n0+RQBHc+QwYX7cbSjWlK1xBksAjXx3XzdKrWP6FHH1HNWZ67rwjRBw
HQgEdTLFuxpiQuc1kefvpc+6gj1Vq1RI/kM9xPixP9zCZ7V3LcDp9OYrkXnYGeem
+zcHlkRwq5gtZrJzAmBWGmhVJDmr5ktOE9LZhykp2C1tfMbHE2e30fBUC/G7oOyy
cFNswyaWfrlc8FOUtKCmlzf/GP8QGTGpKbIC7trQLmBWRMmGgRwG8S/j/FCB5xj1
13xKMGJuneuL9xTb49auVpwDm28zHsL2oVJP3I9w+QzgL0ocm0o=
=E4Oq
-----END PGP SIGNATURE-----

--nextPart21957251.EfDdHjke4D--




