Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A5F261B92
	for <tools@linux.kernel.org>; Wed, 11 Feb 2026 18:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770835978; cv=none; b=d11qnkh66Z7E0BxnJvYr+Um2e3RGrHWxjlee+te7byZSq8i48EKY34AvWpZePu34OAXvPG/hDVsprsatEZdJ7clABQvmE7k8ctPE9u7QEdK60xrnC8k7btsiSXM45KaZYhUQ6HSlI8MBfPmBSxR5/0bXCWrBiTNHtWHANylmWiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770835978; c=relaxed/simple;
	bh=k1QB9KSJZG3qXVm6K1QN9TVzE0+92IuO2BqG98tdJ4k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CfsNXslj8n7ojxVXmMuAMMWNO3cZe8ejrGdthe0pomfUJrX1R+HcG0Bd7B51itblBAKBjfa8vGNU/76e/CYBXfIASoUZu3YppLFzxqDfSWuHfWO0NSzo3JP5P1RDAeI1dEeoyMjN4HeDz0b/OMh/rlVhuL+s1CXbBhy/w0PWWk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eulPkAy1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eulPkAy1"
Received: by smtp.kernel.org (Postfix)
	id CB5AAC19423; Wed, 11 Feb 2026 18:52:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8473BC4CEF7;
	Wed, 11 Feb 2026 18:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770835977;
	bh=k1QB9KSJZG3qXVm6K1QN9TVzE0+92IuO2BqG98tdJ4k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eulPkAy1PklD4FJNhCJqResxRJyVylTfPuS9MHVUQwhBW+bS59NqoNq5Dw7yZhBTA
	 q76cXKfe/01qYXrXRUOfLxc9AecqQKq+hBf4EeL11o8t5dnF+c5fsTYh+lwx7LNXX5
	 0+pZWlg6Kd39NlxFpfnVZbxto+7RRNORuDGR4sD4YbbwuISAliv4cT8cbHLQ+sTWGn
	 qgbUwPoAAM0K/+dQaHim1XnFXIhUciWzJtrmE/B1C4DzhiDA1PTxoh8VEKzjYna+9/
	 QGBSsJvNMUZPhRSpapfJ8k0t18vZZ1k7TTTujycgCe2AE/w88fIFQBXM6jrZsZhKo/
	 T60q5IlNYa3dA==
Date: Wed, 11 Feb 2026 13:52:56 -0500
From: Konstantin Ryabitsev <mricon@kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: users@kernel.org, tools@kernel.org
Subject: Re: korgalore v0.5.2 now available
Message-ID: <20260211-honest-unicorn-of-advertising-e0fe37@lemur>
References: <20260211-courageous-ringtail-of-judgment-ae8c68@lemur>
 <20260211183509.GEaYzL3U2BhUIsAJ9b@fat_crate.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260211183509.GEaYzL3U2BhUIsAJ9b@fat_crate.local>

On Wed, Feb 11, 2026 at 07:35:09PM +0100, Borislav Petkov wrote:
> Do I need to do something special here?
> 
> $ pipx upgrade korgalore
> korgalore is already at latest version 0.5.dev0 (location: /home/boris/.local/share/pipx/venvs/korgalore)

If you installed a dev version, you'll need:

    pipx upgrade --force korgalore3

to get the latest released version.

-K
