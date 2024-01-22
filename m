Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D850950A90
	for <tools@linux.kernel.org>; Mon, 22 Jan 2024 17:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705944099; cv=none; b=K8/8zD9y44JpLR6t2RYV9keLL8J9OYFmsjmFS3NxktoEtdRWzWHvfPt9smrnnxz79GN88wHy/qjQusLtqpm/9O3CGHwCl6hh3VeLWrPsZ4yuJokZ7tG51NZ50Ce843J/+OzO0F8uBNV8P7U14iZKHzbXB9JmQLgEW1Nq71eWHPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705944099; c=relaxed/simple;
	bh=RUNW61BUwXXWr1hncIP+om0T+WFmrov7O87zgU+j1iM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ivj8TUCeyPW1Hhf85zcC1nGYTE9o+vRpyq0HprqaAp3antUNr6kUUThHph88QshmbwkJvvG2zqAoy+cbgxWbIk6uOeHVn2+jBboqRjGmy+QOw9l3RgtHKkDf/H5DJrC1n4RFTcfuF5uFY/ggXvy0P5sBAoyv+5dxRoDy/d2GBb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i5ca5L56; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i5ca5L56"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BB90C43601;
	Mon, 22 Jan 2024 17:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705944099;
	bh=RUNW61BUwXXWr1hncIP+om0T+WFmrov7O87zgU+j1iM=;
	h=Date:From:To:Cc:Subject:From;
	b=i5ca5L56iqThhoButj7NYoWprFsqd4ZVQNwr+xqjGQpD1HtaLFPn+3XavYabQgJ8X
	 CIfSdSp4CQ0fxmDrjLZP7wNzjL7rrVYUB3V+y4tTjfxUyBekwcE4H5ataOgDfmNtBE
	 iuGAmMWBNEMeZBxaAUfrRiyL7pAyXoAbUcP8kxLKB8HC+1se9fWq8MpmtLE5YMPFJK
	 klslTsA0EPE5KEsL8DrTbvveCKZllNNsWN59CddiBdODqgndSX4oQbDKV9/UiJyo3N
	 y8wJlkdRiokZxmLIf0hqM2yC+C9FBTC+3eEVt+G3uHMWZbV+uGbwpjclSLQU3pwG2w
	 kVvyp4MXQxruQ==
Date: Mon, 22 Jan 2024 17:21:35 +0000
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: Scripting support for telling if a b4 series is sendable
Message-ID: <47699f5d-4ba3-4438-8a78-ab6c3345840a@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HHzCjXlCnEpixT7v"
Content-Disposition: inline
X-Cookie: Nice guys don't finish nice.


--HHzCjXlCnEpixT7v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

b4 has logic for detecting if there is an unedited cover letter which
would be used in sending.  It would be helpful for scripting around b4
if it were possible to query to see if this check will fail separately
to trying to send a series.

Thanks,
Mark

--HHzCjXlCnEpixT7v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmWupB4ACgkQJNaLcl1U
h9CtxQf/Q+jLXsCKYrUvYEmKrt0ZkSpAYGWJNt6fmLlX14A7KcJLLVSQJo1giXXg
arhIyey6m5+Mvpljnnric8y5G5Ys9r20fAmOPthwyiogfVGfVVeX4MiO1MjiRox4
j4FD6ydu0U+crPdDf7klPRwDUdzN3pHbnbMloT8Pq05S1i1Kq04wt7/BwbcI80Xj
T3R5zGQiBCiJL5Y5JBewH59BCp7caWRssC527ALXSxbq+9sx+OJNuDi5WUxy/aBX
nkuJ+AbvgUfdl6CWcxIi3qXK4S23jMxVVWtjyaKeLJYYeLn+/PHC158vUWl/eM7S
1qB/p5qvLy0PO77B/+hTBMTOZFT1ww==
=0OHb
-----END PGP SIGNATURE-----

--HHzCjXlCnEpixT7v--
