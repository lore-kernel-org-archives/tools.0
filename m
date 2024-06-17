Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D103B1991B8
	for <tools@linux.kernel.org>; Mon, 17 Jun 2024 19:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718651417; cv=none; b=bNoQ1EBKRuzxlasb9htJdoN+qApfc9DLqo3Q3n3JSbrrfTRAd2KRhJO+HSevQFzZhHICXAKyeYhSMcIWMbEYdSUkzHGoVOF4EC41tV7r/16nIJKmpZKfmGje2hWLUI6tmvFJvX9vW3zmtr4xIFboV7BZKzHsaEbdrgzrerwKeEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718651417; c=relaxed/simple;
	bh=tOS5fWe0JUVmnWXkqrUhEjlF9ttH50xOR4MtCUrYWq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KNfcCrebUCrNFTos1QzvfbDToKfQO/Sfa52Xi5H7Fy7wKf8VQ+AscrVtKb+HVA6ZHV2S8/mOC9gcug83tLiV/F95ACZffKxKCF645hyUSnKQ0/ECs+b5r80gB9Crb7St5MsPUBgU2zCIiU594op5PNrQtyOJ/G7wSoVBNUN2NlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=TYmgyouS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="TYmgyouS"
Received: by smtp.kernel.org (Postfix)
	id 911A5C2BD10; Mon, 17 Jun 2024 19:10:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 545AEC4AF1A;
	Mon, 17 Jun 2024 19:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1718651417;
	bh=tOS5fWe0JUVmnWXkqrUhEjlF9ttH50xOR4MtCUrYWq8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TYmgyouS/OzX4l8mW4hm/46GRYD1UABTfEdgLzqqVYMAVAMqWZto7UOTK43cRr8GW
	 A/nLgD8Ntac8AiE9KnZWAfLU9mjmXKRIaF9RI8g+O5J5m5EZhA48Y1YD/bBFNKG+c1
	 Xi9MerAkkD/6weD9Q61tS17/uQNbXRIOHSKTMDHM=
Date: Mon, 17 Jun 2024 15:10:15 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Jiri Slaby <jirislaby@kernel.org>
Cc: tools@kernel.org, users@kernel.org
Subject: Re: b4 0.14.0 available
Message-ID: <20240617-ancient-newt-of-art-6d2b27@lemur>
References: <20240614-flashy-inquisitive-beaver-ddcfea@lemur>
 <16c45272-8ece-4503-87b0-5fd67d052a74@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <16c45272-8ece-4503-87b0-5fd67d052a74@kernel.org>

On Mon, Jun 17, 2024 at 07:49:58AM GMT, Jiri Slaby wrote:
> On 14. 06. 24, 21:26, Konstantin Ryabitsev wrote:
> > If you're using b4 via the git checkout, you can either update to latest
> > master, or checkout the new stable-0.14.y branch. You can also download signed
> > tarballs from the usual location:
> 
> Hi,
> 
> with the new toml, strange files are installed:
> /usr/lib/python3.11/site-packages/tests/__init__.py
> /usr/lib/python3.11/site-packages/tests/__pycache__/__init__.cpython-311.opt-1.pyc
> /usr/lib/python3.11/site-packages/tests/__pycache__/__init__.cpython-311.pyc
> /usr/lib/python3.11/site-packages/tests/__pycache__/conftest.cpython-311.opt-1.pyc
> /usr/lib/python3.11/site-packages/tests/__pycache__/conftest.cpython-311.pyc
> /usr/lib/python3.11/site-packages/tests/__pycache__/test___init__.cpython-311.opt-1.pyc
> /usr/lib/python3.11/site-packages/tests/__pycache__/test___init__.cpython-311.pyc
> /usr/lib/python3.11/site-packages/tests/__pycache__/test_ez.cpython-311.opt-1.pyc
> /usr/lib/python3.11/site-packages/tests/__pycache__/test_ez.cpython-311.pyc
> /usr/lib/python3.11/site-packages/tests/__pycache__/test_mbox.cpython-311.opt-1.pyc
> /usr/lib/python3.11/site-packages/tests/__pycache__/test_mbox.cpython-311.pyc
> /usr/lib/python3.11/site-packages/tests/conftest.py
> /usr/lib/python3.11/site-packages/tests/test___init__.py
> /usr/lib/python3.11/site-packages/tests/test_ez.py
> /usr/lib/python3.11/site-packages/tests/test_mbox.py

Sorry about that, I've now excluded the tests subdirectory. I'll publish
0.14.1 in the near future.

> /usr/lib/python3.11/site-packages/b4/man/b4.5.rst
> 
> 
> and OTOH, man is not installed (path from 0.13):
> /usr/share/man/man5/b4.5.gz

I'm annoyed at this a bit, too -- while there are definite upsides to using
pyproject.toml, it makes a lot of things that used to be easy now hard. The
stated reason is cross-platform compatibility.

I'm hoping to figure this out at some later point, or switch to
argparse-manpage.

-K
