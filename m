Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794854195;
	b=p4sV3rZAE/3oq07E2gfoP/BCiKROpl90l/l0FsRcIswfTRT0k9ui57X7TjEDsUT5Neze
	 iHQnll3/91qVCWfNV36yI97umVxnUgNM+owu4Z3v89XpmO1h+dPb+OjNh0jrgo461SnqP
	 3ha09GoarcesP91pbp3OFjUrDlvw1MLfolpO2VAazQJnohvdNKIFZgFam15NslujfO394
	 FdwP/K76n0yh/D93s4MzLWGi6Qho8NaDaDUF1wR1TbfAvFl4cfh+Y1jWvyy1bMt0eKEVt
	 ZaRAFoj6+U4yJ5XN8NkFZiCVTkhKWAKz5WN9NlemgKhKZUlfUI6SkIhqBkDG4pkVDvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794854195;
	h=Received:Delivered-To:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=L5v/2geJl6ZEhIfeepEdb51fajb8KTWrJf55kt/YAwQ=;
	b=W5GeaLBZIBCXwkAxlq5jBJlvQkpcIBGwhIA6qCarpiBcclrHyE06eSxlSkqi4eoz3cXn
	 yAzCf9quv7Hj8Fwd7CQLqkDtudUpG5NcP7/yLV+yNYTkM5BtTEH1K31hD4eMVr6axNhKz
	 n8wdF5av/md7U6T4ZiazB5qI4oupWVk2IqXlBCi5brXYu19J3g1jc7COZFHNT2cXAag6L
	 4V2qycY+X7k+U6uStPQcbCqAmCJ4GHVYK3vhBILVBGwLZkw1tHQE110Lq3rwsPsunWdqi
	 k6c5UhoVw83MXv1raKv7PwCxnI/y8uy/t7Unb5O+QXdhzs9H1z3buJ/bvcsJQRnV40g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=mDVhAbTh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE17A606A323
	for <tools@linux.kernel.org>; Mon, 16 Nov 2026 18:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=mDVhAbTh
Received: by smtp.kernel.org (Postfix)
	id 5118A1F000C9; Mon, 16 Nov 2026 18:36:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00A741F000C4;
	Mon, 16 Nov 2026 18:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1794854195;
	bh=L5v/2geJl6ZEhIfeepEdb51fajb8KTWrJf55kt/YAwQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mDVhAbThdmt74ka7QE8KYQmQclDcQ9knO3kpNIWniROzF6TBTRHkXEa/v9byH7MwN
	 XpD2PiVMKGvm8bDuX7twzmbfRjebLHB3mXG9bVf5lQn9w7wlf5yT0pNGun91tGJscW
	 I2ozZkxDoEAZrAHMATSTrfvXPQ9eL0hD+con7vJQ=
Date: Mon, 16 Nov 2026 13:36:33 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@kernel.org
Subject: Re: b4 review hangs on failed patatt signatures
Message-ID: <20261116-flying-hopeful-boar-9eefb8@toolbx>
References: <1a5ecca2-9e58-41de-947c-5600604dcc89@sirena.org.uk>
 <20261112-vivacious-oyster-of-stamina-254a6c@toolbx>
 <4935ff1a-0a6b-48e2-9bbb-5d5c521d1a76@sirena.org.uk>
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
In-Reply-To: <4935ff1a-0a6b-48e2-9bbb-5d5c521d1a76@sirena.org.uk>

On Fri, Nov 13, 2026 at 12:40:53AM +0000, Mark Brown wrote:
> > This sounds like a bug we fixed in patatt 0.8.0. Can you check which patatt
> > version your b4 is actually using?
> 
> >   python3 -c 'import patatt; print(patatt.__version__)'
> 
> __VERSION__
> 
> > (run it with the same python that runs b4). We currently accept 0.7.x as well,
> > since there are no incompatibilities between the two, but that's the version
> > that has the hang.
> 
> > If you have 0.7.x, update your venv to pull in the latest released version.
> 
> > If you're already on 0.8.0 or later, then it's something else.
> 
> Assuming I found the right venv (I'm using uv rather than doing it
> myself) it's 0.8.0.

Managed to replicate it -- will try another go at the fix.

-K
