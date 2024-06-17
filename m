Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A2B18F2C3
	for <tools@linux.kernel.org>; Mon, 17 Jun 2024 07:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718610070; cv=none; b=EJtaE/EC0mbk7nr3aelxIwwwZKfQiVz5r6ALNQMOZule45pnKZBnRAVVb415HPw4NFFDpKkBR0PrECPPqVph9fPnl8n/LqD2y13XzfslihF9IqmDtkZR34i9fD+8c6TyuUsF1ecEOe3gexLwsWbDO/liWlbeh85UZcZU5NODDmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718610070; c=relaxed/simple;
	bh=kKrFQ70cawn28j+t02pvh6bx4nrYRBoZ5o7KxtusVLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XuyYeKvjpOxKb3TiO8cMbkRRo9UpDz+8p5sGXqM0+P5XJQwRAMwLdxZBQEIHzaRt9x8cyqfMw40kXg1B0ZQ4uceYKA9M6qVJJn1hXt7D2hrk/WBZMeC0vYus7RSJ0yN/UoTDkDQTogTuGDo6ZWuaj/m6y5HJmTw+7HX+sZORrNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l3eZfP4j; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l3eZfP4j"
Received: by smtp.kernel.org (Postfix)
	id E4C49C4AF49; Mon, 17 Jun 2024 07:41:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B36EFC3277B;
	Mon, 17 Jun 2024 07:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718610069;
	bh=kKrFQ70cawn28j+t02pvh6bx4nrYRBoZ5o7KxtusVLQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l3eZfP4jvsRdX3MXtIY9JkCf0C1A0ykEtqxkuQNZjw3FU4BwEHtLvsawUsQ9MHvPo
	 xa6ke56gw8SYmlWXobsP5Jtv87yAUOB5PEXN1+j4BlSd2S3dKXKB1chT4qHcuwm2Ex
	 xpmlawH9W7TAYM49o+W/uGOt9xYiPPkNUyr6p1WbVhzTsdyn0bkBmeNPGf8KJ5zP7i
	 5kBcIu4BD96WJq0pFT9bpkyTpPvr9WqKQADTukRDhUf/d9/P9GmgTKWtxczretSO4+
	 0beXzq/dsAODigRh56bT/XdomNnVa9kV69mwDforGMCn1fMUZQFXFcLLD42K4iHpZS
	 rnthLFciMICOg==
Date: Mon, 17 Jun 2024 09:41:05 +0200
From: Niklas Cassel <cassel@kernel.org>
To: Jiri Slaby <jirislaby@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, tools@kernel.org,
	users@kernel.org
Subject: Re: b4 0.14.0 available
Message-ID: <Zm_okcZroqs_PXur@ryzen.lan>
References: <20240614-flashy-inquisitive-beaver-ddcfea@lemur>
 <16c45272-8ece-4503-87b0-5fd67d052a74@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <16c45272-8ece-4503-87b0-5fd67d052a74@kernel.org>

Hello Jiri,

On Mon, Jun 17, 2024 at 07:49:58AM +0200, Jiri Slaby wrote:
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
> /usr/lib/python3.11/site-packages/b4/man/b4.5.rst
> 
> 
> and OTOH, man is not installed (path from 0.13):
> /usr/share/man/man5/b4.5.gz
> 
> Any thoughts? I don't speak python...

There is already an issue open for this:
https://github.com/mricon/b4/issues/37

which has some more information on this.


Kind regards,
Niklas
