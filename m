Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793636284;
	b=ncZWozpzMjvdFkF37TYwA5QQw8e9FhbIaAY7pIZWth8Tsvq5n0t7DtCPSvs9mLXV9bBy
	 ZxrursuN1XdjlX3U/95oLQoyV3KvM5aph2NrZwGaSYY49TEfvwRbfWl4OyIyLydDWzZOw
	 tjAsGzSuqP4uqopIw7lYjVf7C3yrA6KtTNWmYQMz+OE8r4gG+HwZuzTgCklEjouL9pS0l
	 uyRo+81NQacLsQMQ+NAk6kYf4M5aOotjBQAqE6AYWYMNg2JnDNPdY/z7MkbmHPX5+ZmuG
	 V8lXtz1SuAH9Ikmdw+yj7BWJL7M4HBT/yPEqznRpWDpQe95FFld3jFcbeb2tnNsa1Uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793636284;
	h=Received:Delivered-To:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=M791zsAxe3WkFCBC7r7Fgz+yN9PAAP0z7/Ty05C0yb0=;
	b=isq3pMffUhg5bi3TczLGAGZ0RvLAN2q2TF2r03iKg9z7QF9g1m4mGLG9gT9j96lP4F0k
	 zctuGam1xdqwqzkIEDCiyXH/gy1aIy3avSv4adq2tb3spL2ir7Rx0P8FDG+30kRP8twGI
	 ebo6oanmAGBtzXyRQzCfuAXPGNssRWpCBjXgJYOxTFc+i3sXTBGkT46F2dqrRKbhmwEHt
	 WJVGkwXsEB2d5YqOMco+LS+XiK/wAWIRutaBK4vq97R4v4T3C39B5vaOTbUBkvYzZZtVu
	 4uYpHYRz7ePIbChm0fDbPweTb7Rq23QjyRp8i1KSO4oOX+3l+74AnbvTvveNQ4vMC6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QNCw9uUW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF9D6099979
	for <tools@linux.kernel.org>; Mon,  2 Nov 2026 16:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QNCw9uUW
Received: by smtp.kernel.org (Postfix)
	id 8D0521F00A17; Mon,  2 Nov 2026 16:18:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 294781F00A18;
	Mon,  2 Nov 2026 16:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793636283;
	bh=M791zsAxe3WkFCBC7r7Fgz+yN9PAAP0z7/Ty05C0yb0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QNCw9uUWNmNDTF3ywAcUoAlGWNtIOBcUGIdkBPo1LNHf6iqmwyt9WdEZ6rc9ic/Yx
	 XzkD+OCTcQtxRkVDKIM6dPf57RvIhRTbOHJIInN9X0fB6OVjZtd5t7mexbn6ph9Kxc
	 nJ2QwegkmeqVW0K64alxxDtbFI/THGKQahRSwiU8JHdMOsIuUrZszl5xT8oEwtKNgy
	 OBfF+Xf3g11BPnTGxyYKOwR4EO4P+XjbNdORf0aEEynVmQWDxUBBmzv80WNjMzfOwB
	 80e1GtTXWHlX+IQJQDODN6LMaSCESZRY6RSVU6Ak2p/3CYCi+WQZc0sWY5DlpvB9vm
	 4aSfRGt+eBuKw==
Date: Mon, 2 Nov 2026 11:18:01 -0500
From: Konstantin Ryabitsev <mricon@kernel.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: tools@kernel.org
Subject: Re: [PATCH pgpkeys] Revert "korg-update-pgpkeys: keep SHA-1
 certifications when importing a key"
Message-ID: <20261102-cryptic-green-bullfrog-aabb11@meerkat>
References: <20261102155325.377311-2-u.kleine-koenig@baylibre.com>
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
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261102155325.377311-2-u.kleine-koenig@baylibre.com>

On Mon, Nov 02, 2026 at 04:53:26PM +0100, Uwe Kleine-König wrote:
> Importing with `--allow-weak-key-signatures` doesn't only keep the weak
> signatures that were already present but also imports new weak ones. See
> e.g. commit 4711d3757f97 ("Add E354E6B8E238B9F8 (Janosch Frank)") which
> added two SHA-1 signatures.

Thanks, Uwe -- it's already reverted in the latest master.

-K
