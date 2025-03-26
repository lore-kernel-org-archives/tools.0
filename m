Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB73A13C8EA
	for <tools@linux.kernel.org>; Wed, 26 Mar 2025 15:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743002185; cv=none; b=necTfupN8z/j2qqGZxAnFD7819hF9mgLVNRT6hG8eJYQjMoFAhHW02oU26Qr7M8bAChYGSaBuY5mQB6mM86h3BIN6E4sK4PNDtWkYwMPloLa1wh7CugqXoxRUSUUVt3Afs5Gm2cDiKIJ6TLMP5XLpYMpWnE51V8FGY7OzO/hM6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743002185; c=relaxed/simple;
	bh=RGAK8dHHB8PYDFHWn1wPVYXCDU70ILKI+HzV7VrHTnY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dg0cPiVbNImZkb5An1f2f7cs7thM/yuhwPeAzQLRwjvoZJ64DuA+HvYPe/yj6aFN6Q+3Sm/hvfLbs9tWU1VL4EZgqE4IGuoz0m4mUPQB40uMnClA6+U7Uv8e15oyIP0dmxBbeo8qXwE52objsRlSVtX3g4WgpU3p1jgzZORKsKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=G61v3a3c; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="G61v3a3c"
Received: by smtp.kernel.org (Postfix)
	id 4BCAFC4CEE8; Wed, 26 Mar 2025 15:16:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14F58C4CEE2;
	Wed, 26 Mar 2025 15:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1743002185;
	bh=RGAK8dHHB8PYDFHWn1wPVYXCDU70ILKI+HzV7VrHTnY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G61v3a3c/1qwZ+QYxhMjvTvk/uWUT+axRkY3LS7GoPmYvEP3I8IvCJlUi6ZddwaDG
	 pQWgx1C0JaXkRYt4PzF/XiftJUAzi+AyS60J2kgyeLQmPyzEnWe5k1FdLYoOx986di
	 QOPngFEYkguIS1MVz2lM+f3JKAeUvcBGnnjtwhuU=
Date: Wed, 26 Mar 2025 11:16:23 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: tools@kernel.org
Subject: Re: [PATCH wotmate] Put a representation of the trust path in the
 key files
Message-ID: <20250326-ringtail-of-famous-wonder-abc67f@meerkat>
References: <20250325200120.1601271-2-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250325200120.1601271-2-u.kleine-koenig@baylibre.com>

On Tue, Mar 25, 2025 at 09:01:21PM +0100, Uwe Kleine-König wrote:
> Up to now changes to the trust paths are hardly reviewable when looking
> at the git history because they only have an effect on the generated
> .svg. However these also change when the installed graphviz changes and
> the diffs are hardly understandable.

Thanks for working on this. I was still not quite happy with the output, so I
changed it to something like this, which I think is more readable:

	pub   rsa4096 2022-09-23 [SC] [expires: 2027-03-20]
		  8234A35B45C0D26B31C1A2DA570338B018144F28
	uid                      Mattijs Korpershoek <mattijs.korpershoek@gmail.com>
	uid                      Mattijs Korpershoek <mkorpershoek@baylibre.com>
	uid                      Mattijs Korpershoek <mkorpershoek@kernel.org>
	sub   rsa2048 2025-03-20 [S] [expires: 2027-03-20]
		  2EE942A7B61F6ABE5313AD00190D1DB4664E1935
	sub   rsa2048 2025-03-20 [E] [expires: 2027-03-20]
		  F12C50B7B942A1FC14C1AA298A31723BB5DF5B73

	from  Linus Torvalds <torvalds@kernel.org>
	   1  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
	   2  Kevin Hilman <khilman@kernel.org>
	   3  Mattijs Korpershoek <mattijs.korpershoek@gmail.com>

	from  Linus Torvalds <torvalds@kernel.org>
	   1  John Hawley ("Warthog9") <warthog9@eaglescrag.net>
	   2  Ben Hutchings <bwh@kernel.org>
	   3  Uwe Kleine-König <uwe@kleine-koenig.org>
	   4  Mattijs Korpershoek <mattijs.korpershoek@gmail.com>

	-----BEGIN PGP PUBLIC KEY BLOCK-----

	...

I haven't rerun it on the pgpkeys export yet, because I'm wondering if we
can add the logic to only do this for newly changed keys, not for all
existing keys, precisely to avoid the "why did all the keys change" situation.

-K
