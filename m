Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992906139;
	Mon, 19 Sep 2022 16:48:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04E51C433C1;
	Mon, 19 Sep 2022 16:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663606110;
	bh=FjuNxKARBYAFlnkB33i2uD2TebF3KJQbLoShq4BnPqI=;
	h=Date:From:To:Cc:Subject:From;
	b=KBNtKAW2QCNnf+Wo7QAkaMwaT45COp802ZxS8GdHEhIw8crF5g5m2Rsz2DXjE0/OL
	 cQHyPBN3VRjnWNNcaXot12QygrxlJNCdB+a7b6UDJ6MX3DcXjG//kxa76KP0IW8L/j
	 DHgpAjFT1Y7su2QOkqUw0uiHwE1qXhl/AvE263lbPE2H3b3dT5bfoz/Mbz4TDmAheP
	 83lzLgeoC8L5C8MhROw+kYyikltdMkaX0cVDzXHd2/D0sIdgm4EF1ysFd/pdB0otXP
	 yl7vyuTN4EUUMnGCj7ul+uWyaJBVarNrGin/WiYVoeTNHE8HGdgLpQqsS/TjxUjVIT
	 MLVkoQ7lQmDAw==
Date: Mon, 19 Sep 2022 17:47:42 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Handling of DNS failures
Message-ID: <Yyib+KiQnb2mDA9b@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MkHvLEzYgxtETpwl"
Content-Disposition: inline
X-Cookie: One FISHWICH coming up!!


--MkHvLEzYgxtETpwl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Konstantin,

Attempting to fetch with b4 am using the latest git on a shaky
mobile network connection I'm seeing Python tracebacks like the
below:

Grabbing thread from lore.kernel.org/all/CAA%2BD8AN1-ReuEaQFiJbsUnPo-3eXa2p-rUW7B%3DtQHesmUEdtSQ%40mail.gmail.com/t.mbox.gz
Traceback (most recent call last):
  File "/usr/lib/python3/dist-packages/urllib3/connection.py", line 169, in _new_conn
    conn = connection.create_connection(
  File "/usr/lib/python3/dist-packages/urllib3/util/connection.py", line 73, in create_connection
    for res in socket.getaddrinfo(host, port, family, socket.SOCK_STREAM):
  File "/usr/lib/python3.9/socket.py", line 953, in getaddrinfo
    for res in _socket.getaddrinfo(host, port, family, type, proto, flags):
socket.gaierror: [Errno -2] Name or service not known

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/usr/lib/python3/dist-packages/urllib3/connectionpool.py", line 699, in urlopen
    httplib_response = self._make_request(
  File "/usr/lib/python3/dist-packages/urllib3/connectionpool.py", line 382, in _make_request
    self._validate_conn(conn)
  File "/usr/lib/python3/dist-packages/urllib3/connectionpool.py", line 1012, in _validate_conn
    conn.connect()
  File "/usr/lib/python3/dist-packages/urllib3/connection.py", line 353, in connect
    conn = self._new_conn()
  File "/usr/lib/python3/dist-packages/urllib3/connection.py", line 181, in _new_conn
    raise NewConnectionError(
urllib3.exceptions.NewConnectionError: <urllib3.connection.HTTPSConnection object at 0x7f55c2af10a0>: Failed to establish a new connection: [Errno -2] Name or service not known

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/usr/lib/python3/dist-packages/requests/adapters.py", line 439, in send
    resp = conn.urlopen(
  File "/usr/lib/python3/dist-packages/urllib3/connectionpool.py", line 755, in urlopen
    retries = retries.increment(
  File "/usr/lib/python3/dist-packages/urllib3/util/retry.py", line 574, in increment
    raise MaxRetryError(_pool, url, error or ResponseError(cause))
urllib3.exceptions.MaxRetryError: HTTPSConnectionPool(host='lore.kernel.org', port=443): Max retries exceeded with url: /all/CAA%2BD8AN1-ReuEaQFiJbsUnPo-3eXa2p-rUW7B%3DtQHesmUEdtSQ%40mail.gmail.com/t.mbox.gz (Caused by NewConnectionError('<urllib3.connection.HTTPSConnection object at 0x7f55c2af10a0>: Failed to establish a new connection: [Errno -2] Name or service not known'))

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/home/broonie/git/b4/b4/command.py", line 358, in <module>
    cmd()
  File "/home/broonie/git/b4/b4/command.py", line 341, in cmd
    cmdargs.func(cmdargs)
  File "/home/broonie/git/b4/b4/command.py", line 91, in cmd_am
    b4.mbox.main(cmdargs)
  File "/home/broonie/git/b4/b4/mbox.py", line 756, in main
    msgid, msgs = get_msgs(cmdargs)
  File "/home/broonie/git/b4/b4/mbox.py", line 693, in get_msgs
    msgs = b4.get_pi_thread_by_msgid(msgid, useproject=cmdargs.useproject, nocache=cmdargs.nocache,
  File "/home/broonie/git/b4/b4/__init__.py", line 2653, in get_pi_thread_by_msgid
    msgs = get_pi_thread_by_url(t_mbx_url, nocache=nocache)
  File "/home/broonie/git/b4/b4/__init__.py", line 2608, in get_pi_thread_by_url
    resp = session.get(t_mbx_url)
  File "/usr/lib/python3/dist-packages/requests/sessions.py", line 555, in get
    return self.request('GET', url, **kwargs)
  File "/usr/lib/python3/dist-packages/requests/sessions.py", line 542, in request
    resp = self.send(prep, **send_kwargs)
  File "/usr/lib/python3/dist-packages/requests/sessions.py", line 655, in send
    r = adapter.send(request, **kwargs)
  File "/usr/lib/python3/dist-packages/requests/adapters.py", line 516, in send
    raise ConnectionError(e, request=request)
requests.exceptions.ConnectionError: HTTPSConnectionPool(host='lore.kernel.org', port=443): Max retries exceeded with url: /all/CAA%2BD8AN1-ReuEaQFiJbsUnPo-3eXa2p-rUW7B%3DtQHesmUEdtSQ%40mail.gmail.com/t.mbox.gz (Caused by NewConnectionError('<urllib3.connection.HTTPSConnection object at 0x7f55c2af10a0>: Failed to establish a new connection: [Errno -2] Name or service not known'))

Thanks,
Mark

--MkHvLEzYgxtETpwl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmMonS0ACgkQJNaLcl1U
h9AyWQf/YRh2NXXCLEgBrqx4D5ydNKQTv49bg7v6+8P/248zIKZu/fT2MSp4tR3k
aN1SuAPHfilbpPc4ZPSRCoSRVXzZK89zLSR370Tc6RG8bsZSus8KxEpxYijNvLsV
DplZFD8OwV0xfJELV19GO707XeCTAgs8eGm3vJpLoTEGWWC9G73RwtgB+90nhTls
4YwV6SdAuuuawZBeHjW3kFRh4XQH65XBWp38PabzrGB/f1Vlt79xUgf+GGWaRC/r
e7W5Dk2ynU+CbLAq9J1ghcJx5s0m6O3IroxPPGhosqBxHz++co0UiatsILe3wqg8
O8MtZYxxnTIhnoSSqSRmAbg+IsB4QA==
=y+js
-----END PGP SIGNATURE-----

--MkHvLEzYgxtETpwl--
