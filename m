Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA792E1EE0
	for <tools@linux.kernel.org>; Tue, 24 Feb 2026 22:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771971407; cv=none; b=SWyT1vKpEcApyJA/3L2L7Mk5RHUf1FwZlYxzjl20LrOR96DjP2EoX49IJXmg11oUoYwXHkXE3lpg0yJA+8xz1yLXB4s4zEamvhxpByLNF/l9OcAhCBgznOqEv9hqUMlb9jzGlIVSxsmkrDGRE7CZW7+DVgoEtGJCWVyXRLrISE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771971407; c=relaxed/simple;
	bh=rTKXS7MxoJ3vjSJutzS9jSDxm6oy6TGKX8ymdZBd0U8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uhjZbwCgJ3lY6/BzkVCf0LTjy2VKCsBjY10wIBJhXyoAB3QYhzkbBkvZz7axPYXcXQ26D87ZV0+sbHgQBSeJfBnRB40uNafavv18j3BtnvlKHDShJqr21rcvPf3AkFQw0QlpGlLAgTieSh9+9xxinopzr7GU8/E90HBCDWhH/IQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bqyHEH7y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bqyHEH7y"
Received: by smtp.kernel.org (Postfix)
	id 0774AC2BC86; Tue, 24 Feb 2026 22:16:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFAE6C19423;
	Tue, 24 Feb 2026 22:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771971406;
	bh=rTKXS7MxoJ3vjSJutzS9jSDxm6oy6TGKX8ymdZBd0U8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bqyHEH7y/rl6urhjA3gZUwlkATHAWIdKydLEzFw7nZVZqnZDEtVpgTHWHANEdScPx
	 fhKFrMWXd+h2Kwv0gILDithkfXs9XLiWA094avZahkI8E/FJBqqqABudq0lVNy3qO3
	 +6MCLT5uShzlhZncJrVFYVqmwatrhe51scYP5ZRXjAnhMXKHumUPmh0KP9GhXAieGD
	 76LqM7wX7cvVGak25zPMZFibk/sXpwO/sgpYTbidt252mWbQDWupHvpZ6NFVYUDOHU
	 QM7BpsQ/zPvya/mazRBYqfhpNoFjmyuXsUDmvHXXbYRq1ipU6NuFzd9K94bs5T+wus
	 Iim7VEsY8IEnQ==
Date: Tue, 24 Feb 2026 14:16:46 -0800
From: Kees Cook <kees@kernel.org>
To: Dave Hansen <dave.hansen@intel.com>
Cc: tools@kernel.org
Subject: Re: Missing cover letter
Message-ID: <202602241414.3E5B6296E5@keescook>
References: <77c934d2-27f5-4b1a-9465-92d25858e56b@intel.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <77c934d2-27f5-4b1a-9465-92d25858e56b@intel.com>

On Tue, Feb 24, 2026 at 01:22:47PM -0800, Dave Hansen wrote:
> I think it's because I didn't put a diffstat in that cover letter (it didn't get sent with git send-email). I even hacked:

I kinda think cover letters should always have a diffstat ... :P

FWIW, I use: git format-patch --cover-letter -n -o outgoing/ ...

-- 
Kees Cook
