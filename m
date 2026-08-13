Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB58471437
	for <tools@linux.kernel.org>; Thu, 13 Aug 2026 16:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786640072; cv=none; b=qjHFWJ8v8brKMyELHcpMfILqXVXcN5LG2cSr1gt5My68bWOUjnDuFhYbi9RJ5F/NPOYJBG6E9zhvMAUB4cUHextg9TaR+PjupuJMaQnf8gO5jICidUAuuQJfBGZZ3qKcAujVSsFZHdmvqYQ97oVaM0yCkAEi1fubEZDsZQum9Qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786640072; c=relaxed/simple;
	bh=xUMgZ8jIXXfS7rK/7I9AwTtFwBSnf4lXDexJMp8GoHk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mwsD5GKyFTjQjUT6dOob8p4R4swBpjHFq/2BaSMMWh9iv/z/5jlDKdJaxrypXgzF6LtH/I+VcTpYELsA9Pa5qJqw5WuYp8s1WhJgly1FdODLUpWyStwJB5MvBZqU5rdBflSXdo0UwpIdyAy1V4CsWqfF2KPEfb11r0R49I/u4wU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h669NlZ+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h669NlZ+"
Received: by smtp.kernel.org (Postfix)
	id 9FE1A1F00A3A; Thu, 13 Aug 2026 16:54:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFFF01F000E9;
	Thu, 13 Aug 2026 16:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786640068;
	bh=d/01Shk55VmNSrEsU+hdFCvhTvEUfPfZPpdJqIqLod4=;
	h=Date:From:To:Cc:Subject;
	b=h669NlZ+dNCw0qeer0qS/gVunAZErgVOlwN1y8w0ZyQwlTHT/6erZDN6hg9QYW6pW
	 HDC6D9eWBRlB5y6CvWOK9ISCZUCzcNo6aEGo6TVB+fbwqW6KG5aul1nEncRTs6r4FM
	 1Wm8wZfZ+uMi8O2GOi3i/j2QLMf1a3uKkEDZkVNMwp6eHeWvTN+VRcsrFUABZzJSFs
	 QJtLMWF/Hq+xBDUTpGxldds8jDp4k91Vgh1o2EXlvlYfm4p4MlPWfh9Jx/Yr+wGOJ1
	 6Hb77+7Wp/mt5T+vuPifisQ/HseL5moZO41yRLWQLiZUY7WPU8Qk3hnWBSGZ7hdILR
	 +AH94KjU8x18g==
Date: Thu, 13 Aug 2026 17:54:25 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: b4 review crash
Message-ID: <1bcfac04-3a85-4d8d-a0a1-094abe5dd807@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ehgsjNtwZBPsO8eM"
Content-Disposition: inline
X-Cookie: Immanuel doesn't pun, he Kant.


--ehgsjNtwZBPsO8eM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Konstantin,

When attempting to review:

   https://patch.msgid.link/20260813021450.1897-1-baojun.xu@ti.com

which does not have a branch created yet I get:

Task exception was never retrieved
future: <Task finished name='None' coro=<Worker._run() done, defined at /home/broonie/git/b4/.venv/lib/python3.13/site-packages/textual/worker.py:358> exception=SystemExit(1)>
Traceback (most recent call last):
  File "/home/broonie/git/b4/.venv/bin/b4", line 10, in <module>
    sys.exit(cmd())
             ~~~^^
  File "/home/broonie/git/b4/src/b4/command.py", line 1368, in cmd
    cmdargs.func(cmdargs)
    ~~~~~~~~~~~~^^^^^^^^^
  File "/home/broonie/git/b4/src/b4/command.py", line 234, in cmd_review
    b4.review.main(cmdargs)
    ~~~~~~~~~~~~~~^^^^^^^^^
  File "/home/broonie/git/b4/src/b4/review/_review.py", line 468, in main
    cmd_tui(cmdargs)
    ~~~~~~~^^^^^^^^^
  File "/home/broonie/git/b4/src/b4/review/_review.py", line 3080, in cmd_tui
    run_tracking_tui(
    ~~~~~~~~~~~~~~~~^
        identifier,
        ^^^^^^^^^^^
    ...<2 lines>...
        no_mouse=cmdargs.no_mouse,
        ^^^^^^^^^^^^^^^^^^^^^^^^^^
    )
    ^
  File "/home/broonie/git/b4/src/b4/review_tui/_entry.py", line 145, in run_tracking_tui
    branch_name = app.run(mouse=use_mouse)
  File "/home/broonie/git/b4/.venv/lib/python3.13/site-packages/textual/app.py", line 2350, in run
    return asyncio.run(run_app())
           ~~~~~~~~~~~^^^^^^^^^^^
  File "/usr/lib/python3.13/asyncio/runners.py", line 195, in run
    return runner.run(main)
           ~~~~~~~~~~^^^^^^
  File "/usr/lib/python3.13/asyncio/runners.py", line 118, in run
    return self._loop.run_until_complete(task)
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^
  File "/usr/lib/python3.13/asyncio/base_events.py", line 712, in run_until_complete
    self.run_forever()
    ~~~~~~~~~~~~~~~~^^
  File "/usr/lib/python3.13/asyncio/base_events.py", line 683, in run_forever
    self._run_once()
    ~~~~~~~~~~~~~~^^
  File "/usr/lib/python3.13/asyncio/base_events.py", line 2042, in _run_once
    handle._run()
    ~~~~~~~~~~~^^
  File "/usr/lib/python3.13/asyncio/events.py", line 89, in _run
    self._context.run(self._callback, *self._args)
    ~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/broonie/git/b4/.venv/lib/python3.13/site-packages/textual/worker.py", line 370, in _run
    self._result = await self.run()
                   ^^^^^^^^^^^^^^^^
  File "/home/broonie/git/b4/.venv/lib/python3.13/site-packages/textual/worker.py", line 354, in run
    return await (
           ^^^^^^^
        self._run_threaded() if self._thread_worker else self._run_async()
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    )
    ^
  File "/home/broonie/git/b4/.venv/lib/python3.13/site-packages/textual/worker.py", line 326, in _run_threaded
    return await loop.run_in_executor(None, runner, self._work)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/lib/python3.13/concurrent/futures/thread.py", line 59, in run
    result = self.fn(*self.args, **self.kwargs)
  File "/home/broonie/git/b4/.venv/lib/python3.13/site-packages/textual/worker.py", line 309, in run_callable
    return work()
  File "/home/broonie/git/b4/src/b4/review_tui/_tracking_app.py", line 1752, in _fetch_and_prepare
    am_msgs = lser.get_am_ready(
        noaddtrailers=True,
    ...<5 lines>...
        showchecks=False,
    )
  File "/home/broonie/git/b4/src/b4/__init__.py", line 1179, in get_am_ready
    msg = lmsg.get_am_message(
        add_trailers=add_trailers,
    ...<3 lines>...
        allowbadchars=allowbadchars,
    )
  File "/home/broonie/git/b4/src/b4/__init__.py", line 3306, in get_am_message
    sys.exit(1)
    ~~~~~~~~^^^
SystemExit: 1

Thanks,
Mark

--ehgsjNtwZBPsO8eM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp99sAACgkQJNaLcl1U
h9DgvQf/Yi/0TgwY5IdH5PGiYJFz6E8JxaHnijIKkIEiQT1SIhlFsCZSlehBvbKQ
V83wHkARcOeDozgO9c5InI1lVHqpWNmhoLOMb+4heb0j/nzpZyMx7aq5cvOj546D
EPc9ZM9wgs4k+pWfU7gIntZBIhtozweXRdCCKAJXva8OkgasWXbbxLH7E/4mCQwX
oWN8sfc/9jZb+GJXbLbWqUVB0R6NJcT6suKv/+9aXDv2eVoHnf2l6DxEqloSa8cL
mKn0cI0v+Ri7rceI2LO8v10h23Dw+8+kdvNgDLukC/LTWwbUzi5udsFUbMvTvjWO
XFzj8sMZg/2SnreZHr7tiNwLv4HZGg==
=M9VW
-----END PGP SIGNATURE-----

--ehgsjNtwZBPsO8eM--
