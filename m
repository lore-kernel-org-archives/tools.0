Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B77A28F2;
	Mon, 12 Sep 2022 12:21:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9261C433C1;
	Mon, 12 Sep 2022 12:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662985311;
	bh=q/9M9uY0fTbaa4yH+9uXtyQLS0JMRBdwA2mPvEKJb3g=;
	h=Date:From:To:Cc:Subject:From;
	b=YP0OUTvfpX0tK3FiVcEixdM5FM4eZBEQj9D3gMMm1UGNI9tx/Ln2lepMSwvvZJ1Al
	 T0J4Lw7AsZercSrGzljR6tEpra54YyhYJTk/wUgUVeeeNBRTRKvZXbHOZ4vViP/q/d
	 r0s2eP1NS3VyXRJ6wTW3DDzXHuKNuVQY5rgD/QE8xxLSZPzD9GU4mXjFXu8MgmHI58
	 +00oI3kvejpkR6VmotURXHfqXrfsCQjk4q6fX+7wq+Z6Y1UNP053L4vpXQ7ihouHLF
	 CET0hg+Lc1v8H4NvvgG/U2uZl1sAZ0gpdH2tHVzRFDVOqOE+YrV2s1UCmIJA2TBOkJ
	 UyO2lBw3hTldA==
Date: Mon, 12 Sep 2022 13:21:48 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Resolver splat from b4 am
Message-ID: <Yx8kXFRXB0chuYkL@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8fxQom/0k8nMx7FU"
Content-Disposition: inline
X-Cookie: One FISHWICH coming up!!


--8fxQom/0k8nMx7FU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Using a current git version of b4 I'm currently seeng a Python
splat which appears to be due to trying to verify a DKIM
signature:

$ b4 am 00ffdd42-2cb6-112e-3bb5-b9ef1105fc4f@linux.intel.com
Analyzing 4 messages in the thread
Checking attestation on all messages, may take a moment...
Traceback (most recent call last):
  File "/home/broonie/git/b4/b4/command.py", line 352, in <module>
    cmd()
  File "/home/broonie/git/b4/b4/command.py", line 335, in cmd
    cmdargs.func(cmdargs)
  File "/home/broonie/git/b4/b4/command.py", line 91, in cmd_am
    b4.mbox.main(cmdargs)
  File "/home/broonie/git/b4/b4/mbox.py", line 764, in main
    make_am(msgs, cmdargs, msgid)
  File "/home/broonie/git/b4/b4/mbox.py", line 104, in make_am
    am_msgs = lser.get_am_ready(noaddtrailers=cmdargs.noaddtrailers,
  File "/home/broonie/git/b4/b4/__init__.py", line 552, in get_am_ready
    checkmark, trailers, attcrit = lmsg.get_attestation_trailers(attpolicy, maxdays)
  File "/home/broonie/git/b4/b4/__init__.py", line 1301, in get_attestation_trailers
    for attestor in self.attestors:
  File "/home/broonie/git/b4/b4/__init__.py", line 1152, in attestors
    self._load_dkim_attestors()
  File "/home/broonie/git/b4/b4/__init__.py", line 1195, in _load_dkim_attestors
    res = dkim.verify(self.msg.as_bytes(), logger=dkimlogger)
  File "/usr/lib/python3/dist-packages/dkim/__init__.py", line 1352, in verify
    return d.verify(dnsfunc=dnsfunc)
  File "/usr/lib/python3/dist-packages/dkim/__init__.py", line 940, in verify
    return self.verify_sig(sig, include_headers, sigheaders[idx], dnsfunc)
  File "/usr/lib/python3/dist-packages/dkim/__init__.py", line 773, in verify_sig
    self.pk, self.keysize, self.ktag, self.seqtlsrpt = load_pk_from_dns(name,
  File "/usr/lib/python3/dist-packages/dkim/__init__.py", line 481, in load_pk_from_dns
    s = dnsfunc(name, timeout=timeout)
  File "/usr/lib/python3/dist-packages/dkim/dnsplug.py", line 88, in get_txt
    txt = _get_txt(unicode_name, timeout)
  File "/usr/lib/python3/dist-packages/dkim/dnsplug.py", line 31, in get_txt_dnspython
    a = dns.resolver.query(name, dns.rdatatype.TXT,raise_on_no_answer=False, lifetime=timeout)
  File "/usr/lib/python3/dist-packages/dns/resolver.py", line 1221, in query
    return resolve(qname, rdtype, rdclass, tcp, source,
  File "/usr/lib/python3/dist-packages/dns/resolver.py", line 1205, in resolve
    return get_default_resolver().resolve(qname, rdtype, rdclass, tcp, source,
  File "/usr/lib/python3/dist-packages/dns/resolver.py", line 1040, in resolve
    (nameserver, port, tcp, backoff) = resolution.next_nameserver()
  File "/usr/lib/python3/dist-packages/dns/resolver.py", line 598, in next_nameserver
    raise NoNameservers(request=self.request, errors=self.errors)
dns.resolver.NoNameservers: All nameservers failed to answer the query 20210112._domainkey.quanta-corp-partner-google-com.20210112.gappssmtp.com. IN TXT: Server 172.16.32.1 UDP port 53 answered ; Server 172.16.32.1 TCP port 53 answered [Errno 111] Connection refused


--8fxQom/0k8nMx7FU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmMfJFsACgkQJNaLcl1U
h9C36wf6AolPFCAiQP7d6vL8bMLENNj9iokEX92MKz7EN/kEFpkSrlHMn3rDVUl8
uC3HEmznE2BaH8OAwnRjW2SSbn+lIq3ZKu4dDRuKS62K3zBLeHJVtplU2V7dMWDx
HQ+C1FSUU0K6Xzwoq8LOYN9bwKvftlC4ygCbtmea8q/d2ATBLbdJ4LNv1VyjCo6P
z/taYDG/X+YwsJI5h8MT0jsWz6QORs2QzvzJNHgpy53tiKLXqE//TqrfUEKnZ49o
HB5hFkMroiDrV/ru39if5mLxe1+FnJFpxmc5DumNQlyaLQ3lZ2/NlSfZoqJ6PNNN
prIY8OC8CjnImeM/okbJHLEagNnwJg==
=0XZt
-----END PGP SIGNATURE-----

--8fxQom/0k8nMx7FU--
