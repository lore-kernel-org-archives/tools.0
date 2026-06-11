Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A73031326A
	for <tools@linux.kernel.org>; Thu, 11 Jun 2026 21:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781214207; cv=none; b=h/s7omfC1wStjTLhP4rzkL7zU6XCTXxB9gSuOBoEHFiuONH+aeOv80r89nhIOkQvwTyagtu5ZlWY2vY27KhErO1+X93EsI4+UfiNy204abOPuncLwI72eRa6qwDspGbFN29/hcOWmC3hML3ncRw7sVjB5bNug2SwsxFxoD0783g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781214207; c=relaxed/simple;
	bh=c7LCRKcbPGuQxsXCCTNZVUMeTkoPrYwqqYvDvSbd3F0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MPqjRir3tT/zUJSgHaUNYFjfGFmnzNwTKZSTGFvATn3uxu4o/W/O0FlrKBoPKKahCflK8Qbzk3eUMxU7fKnUgyV0i/3dzcE0D7vbHKLDnJSg5Cv2bUPQBpXZwovJJlfWDpYVhl6vBBcm7Iz/rB18gqtzn7kUvo8fMOBshUMZ1PU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=1gnHhr8a; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="1gnHhr8a"
Received: by smtp.kernel.org (Postfix)
	id EDCCA1F00A3D; Thu, 11 Jun 2026 21:43:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DD8C1F000E9;
	Thu, 11 Jun 2026 21:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1781214205;
	bh=jJh5d1uuQvm3qg98rcLd1dxvxTkSiHsxI/Sl60/zE9I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=1gnHhr8awDU/BPLYEE/b287eOcai6DZSdDMGkJOmXvojOqyqs3J+ox98G1tucVlLh
	 QmWcF+dn4ECdFUhAqbC8zJnhoHY6g+ao5RL6wyWszeC6XIHggWKBPjvD6cJDd4uuBy
	 86mzt4RJYt7C45dB+LTf5Z9ECb5SSw0MXK/r3WWw=
Date: Thu, 11 Jun 2026 17:43:23 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@kernel.org
Subject: Re: b4 review update issue with bad connectivity
Message-ID: <20260611-fanatic-grumpy-rook-84a68b@meerkat>
References: <air1edZVrBclly3H@sirena.co.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <air1edZVrBclly3H@sirena.co.uk>

On Thu, Jun 11, 2026 at 06:50:49PM +0100, Mark Brown wrote:
> When operating with poor connectivity I'm finding that b4 review's
> update functionality can just go off into space non-interruptably for
> very extended periods of time.  It should be possible to cancel network
> operations to get back to doing local only operations, at the minute I
> find myself killing b4.

Yes, that's something that was long overdue. I've pushed updates to both
liblore and b4 in master -- note that you'll need to update liblore to 0.8.0+
for it to do the right thing, but the latest master should let you do Esc to
interrupt network lookups.

Try it out and let me know if it's working or not.

-K
