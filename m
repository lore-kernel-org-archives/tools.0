Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794516727;
	b=GoOG2dW7zy2FRAZhFljVnowvcFYd9ydiUTOJM73SFUTxkDVlA7OxF6RcQCuz4TAFnEl+
	 +DJ12mBbwiuXfUpQEUM9Sn1xr8Zj8nYZnlvsFQ+xD9+d78qWqTjWTirWTbyJ5BhTR5fj0
	 WCZG6ljDBVY4HkTgJN3F5ZmC/2LflNfuf7+d4hw28Ngp6SFXgnExpQuGuLnm13wkiLmh2
	 bykczL8f03gzBEn9ljmuE51Tho1wxeMT0COykSLlh6K+LhnZYgZ8KYRSJgsjUkH9xGJg9
	 EtzQ3VJ5ak76GP1tHPCoJbDtMQYtLY5seWPdZzAw0IKIcw83vWkt9tPCqfBJIWJDdKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794516727;
	h=Received:Delivered-To:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=hW5fh8+mI0rUNlCi8X4BLrcY1lmfAqd3Hhs0TyEAzlU=;
	b=Xma8igWoxNBBWqku0R2FOjJ52MKB1KggZMNEzkboTjan6K9yDIKnY1VpXn4V1Nyp7zLg
	 I6m6h5MfytByhoqYGd6eYDcdadzvo6u/fMs7yrvxdlPnH2A987SSnUvOr948Wf9I0W3+v
	 V55BZrY8TNuOx5CNxyjS5G6SLuIjwphgjTsiSHEMbXcBke8zF9uzQvERRD6E1WnCJN+85
	 UBwgpiAv5ONDOTYgFjdRLa0rDX7adXRM5crA/DRqTtrq67GnbxU4LZj5ea7J2nkamdObb
	 exXvnnLDu+2Goa0vKD4DInb2XfWI8ix6qFeYkRvu2acWmgbF1l+kkX8vH/JaQR4YFvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=XxHPCNmj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D1E606A323
	for <tools@linux.kernel.org>; Thu, 12 Nov 2026 20:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=XxHPCNmj
Received: by smtp.kernel.org (Postfix)
	id D1B131F000C5; Thu, 12 Nov 2026 20:52:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 892081F000C4;
	Thu, 12 Nov 2026 20:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1794516726;
	bh=hW5fh8+mI0rUNlCi8X4BLrcY1lmfAqd3Hhs0TyEAzlU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XxHPCNmjn8Jf+QTFV8ifuwFzhfMNhnfiFF5gngSXUecOXcZIDdb0FXRy0S+mDlpC+
	 s3EroOZpdzZNHAx1kX26oF2Joj3pZi15FZ/mZVx6BueZ9S50jmcdLESzGlk/ehmkL/
	 BXQ9Upgj+gAvAsEEx/D1hirzcixBl50K1QmqypdE=
Date: Thu, 12 Nov 2026 15:52:05 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@kernel.org
Subject: Re: b4 review hangs on failed patatt signatures
Message-ID: <20261112-vivacious-oyster-of-stamina-254a6c@toolbx>
References: <1a5ecca2-9e58-41de-947c-5600604dcc89@sirena.org.uk>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Post: <mailto:tools@linux.kernel.org>
List-Help: <mailto:tools+help@linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
List-Owner: <mailto:tools+owner@linux.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1a5ecca2-9e58-41de-947c-5600604dcc89@sirena.org.uk>

On Thu, Nov 05, 2026 at 05:26:38PM +0000, Mark Brown wrote:
> Hi,
> 
> When signing an email it looks like if signing fails (for example,
> because you mistyped your smartcard PIN) the UI hangs - at least, if
> it's timing out it takes an unreasonably long time to do so.

Mark:

This sounds like a bug we fixed in patatt 0.8.0. Can you check which patatt
version your b4 is actually using?

  python3 -c 'import patatt; print(patatt.__version__)'

(run it with the same python that runs b4). We currently accept 0.7.x as well,
since there are no incompatibilities between the two, but that's the version
that has the hang.

If you have 0.7.x, update your venv to pull in the latest released version.

If you're already on 0.8.0 or later, then it's something else.

-K
