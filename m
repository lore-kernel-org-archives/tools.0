Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9BE36C0CD
	for <tools@linux.kernel.org>; Tue, 18 Nov 2025 19:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763493084; cv=none; b=EFcxXNivgeYuLD1i3F6mIKNRf6klL+Mf0Px6VCv4t9vBW7UnZNYO3C+QL+WblPB70RPRD4PIWyJOj9+YEnQ+mkUaTP1OzOqRyvSNlx0kKmPa0GWZPbr9ErHWGdYhqlXM364I/Obpu40L+5x1NeZsTAIShkWjTrzZ64YbRjZuyx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763493084; c=relaxed/simple;
	bh=MAmdS1yX7ZkNPI/W5h46ifp8WZFpIZ1zKScAKPLIo2w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bclt+N5BTINNHalg3EGpcUV5GpKfKLdpXD/HCti/r0acW3mTSMGMxOu50ss+tG1/p49fj1BzNITmPKKP9EO+95tz7aE26VlJV6jR3vKZLApYPLOcHL4AgI4PAqRU3DmaGFDWnRHaslMPy8HXtUdEr/4qxZuOBxslWG34mv3qJjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=NBXRQNhm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="NBXRQNhm"
Received: by smtp.kernel.org (Postfix)
	id 0C9D7C116D0; Tue, 18 Nov 2025 19:11:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78D33C2BCB2;
	Tue, 18 Nov 2025 19:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1763493083;
	bh=MAmdS1yX7ZkNPI/W5h46ifp8WZFpIZ1zKScAKPLIo2w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NBXRQNhmkOBMNd1V1Gzifio62LrX51/xDi2DFO1U4fKpplwZceZwxUo4Al4ZH7NN8
	 2P0qaiQPGKlTfRKO2vt72lfBIB2TQZWz+7CrOTuhWhTlBnle8fe2eH6+UcWKqUzpa1
	 KIwKA4vAwlEg/WRIRlXbMJHdroGqeOQ98J2ffWek=
Date: Tue, 18 Nov 2025 14:11:21 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Tamir Duberstein <tamird@gmail.com>
Cc: "Kernel.org Tools" <tools@kernel.org>
Subject: Re: [PATCH b4] Update shtab requirement to >=1.8
Message-ID: <20251118-enchanted-daffodil-cormorant-baed67@meerkat>
References: <20251118-bump-shtab-v1-1-4126cf1d1e44@gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251118-bump-shtab-v1-1-4126cf1d1e44@gmail.com>

On Tue, Nov 18, 2025 at 10:23:34AM -0500, Tamir Duberstein wrote:
> This release fixes tab completion in zsh. Bump requires-python to >=3.9
> to avoid warnings caused by shtab requiring >=3.9.

I'm okay with this, since 3.8 is out of support. However, I cannot take a
patch that updates hashes in requirements.txt -- for security considerations.
Can you send just the pyproject.toml patch and I will then regenerate
requirements.txt on my end.

-K

