Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661251A9B3D
	for <tools@linux.kernel.org>; Fri,  6 Jun 2025 21:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749245978; cv=none; b=ed15cpRtComebKGR+Dnx4RF4uBDFGsYiOxzaopk6kkoSH9GvAeaMfN4SrCDAo/M7Rr67K29spehFQk82wIybIUVHSWKo7YRjJujTFs6kvxLmV77+ezjJzMHa87Rob/9FNWT1cOPd07NnT3qmNsrjakInddxtEPJ8syHNcfAVsKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749245978; c=relaxed/simple;
	bh=mst7f5ejAFGpRpgeyhXxEohCDqCx5WeXVybNOClDijk=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=e99Nzffp2xrS1QfUfTu8qTdLyVvm5plFoxLLSn40PTnidUR+d73QFuKnh5LPxcX37auQEH/2SodwfOuJS9+WQrn6a40hn92xpJPrWjM54rnqnpQwsekY6g8Ist7qc0U/ckoIWl0U1ODHE+WGiCq8lfHGe21JVRGbkYnYLc5rrrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=nKYYl1bc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="nKYYl1bc"
Received: by smtp.kernel.org (Postfix)
	id 0BFF2C4CEEF; Fri,  6 Jun 2025 21:39:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D35EC4CEEB;
	Fri,  6 Jun 2025 21:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1749245977;
	bh=mst7f5ejAFGpRpgeyhXxEohCDqCx5WeXVybNOClDijk=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=nKYYl1bcdkh8AYJuSk4CKD9F1Iq2bOrF0ywjOvAWRW5Lq3TFYbGTHQJl5Ft1MMARC
	 6tfLmaEB/ImJo0GXGAQ6GszwawtNWcPOyShnAt7J7exFj2On7tz0ctc8bj5jk6d3Z9
	 96MRdD3AZVeWKo0wloAX/3L9PRgMJGydRYY99YnI=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Tools" <tools@kernel.org>, 
 Tamir Duberstein <tamird@gmail.com>
In-Reply-To: <20250606-uv-compat-v1-0-c76c1c8d6eeb@gmail.com>
References: <20250606-uv-compat-v1-0-c76c1c8d6eeb@gmail.com>
Subject: Re: [PATCH b4 00/10] uv compatibility, typing improvements
Message-Id: <174924597751.3680961.6763307976769829303.b4-ty@linuxfoundation.org>
Date: Fri, 06 Jun 2025 17:39:37 -0400
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-bf5fc


On Fri, 06 Jun 2025 15:51:11 -0400, Tamir Duberstein wrote:
> uv[0] is an extremely fast Python package and project manager; allowing
> b4 to be developed with it makes life more pleasant for all
> contributors.
> 
> This series makes the b4 project compatible with `uv` and fixes various
> typing problems. Please see also https://github.com/mricon/b4/issues/61
> for the likely cause of many of these typing issues having previously
> gone unnoticed.
> 
> [...]

Applied, thanks!

[01/10] Use PEP-735 dependency groups
        commit: 9a3a30061bb4a2027442d0f1567c157dbbcf63d8
[02/10] Specify optional dependencies in pyproject.toml
        commit: e63bd80b7f866f1da136581f79cfd81c11302575
[03/10] Specify dependencies in pyproject.toml
        commit: f4185d6bc8ea0ac6b8a9ae8df7aaf334b8a983d1
[04/10] Add ruff, remove all noqa comments
        commit: e8ead16ba4ad5f04de4d4b17420bb425f4d38ef9
[05/10] Remove `noinspection` comments
        commit: 0be2cb4e31b36d531287a0e0fd6d81bfd4304d6d
[06/10] Add mypy
        commit: ec65df28096a90b0a3057052b59229d87b4db1b5
[07/10] Add missing LoreTrailer.lmsg annotation
        commit: e4b094a3bfbd040aad4a4018e264916b341406e1
[08/10] Check variables for None rather than exprs
        commit: 8633c7e830a5a75b6e34593cda98d0b6c0b1bb05
[09/10] Make LoreSeries.indexes never None
        commit: ca13d4787e403627f7ca7c70e7339ce399402166
[10/10] Add missing type annotations
        commit: 7027afc6e0f0f2cc67a5e71df65f4025d9a89e3c

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

