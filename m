Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC89E18C002
	for <tools@linux.kernel.org>; Wed, 11 Jun 2025 15:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749654447; cv=none; b=CLczCgjsntWy1mqyXWJvmEO/y2OlMDlqNXDjccZ09hFK+0iHITMevDvvVc+A6XohToDqlQGDq9am6c2xP1+yPW9j3NkyweV2KTzA0DuZE1DuMLSbbiFEHI2OUio+6VJcNJL3tMDA3ZXjbHGleHJts+eWVr9AtBoIs4oKs7x2zjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749654447; c=relaxed/simple;
	bh=4JO6G6GPmMb4b1tasMVcNgm0NKFUye9LE6nYLdGZL2A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R5NL8jE1Gsxg6eO+rUTswL1/Ir6O0u45/boFJ8mLDqr3aaCpmG1UGAZE6zwMu0enGwQdy1m3DBs15J7T3jnevHtUaPpup2JObhSequsdcGYBA5oLSSEWyUMsC1Vc5xNaJd51icUymCIGU7C0VUxp4uYDgR00KQOm5jIs0Z+r8bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=BiGp/C1g; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="BiGp/C1g"
Received: by smtp.kernel.org (Postfix)
	id 69EB7C4CEEA; Wed, 11 Jun 2025 15:07:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 303AEC4CEE3;
	Wed, 11 Jun 2025 15:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1749654447;
	bh=4JO6G6GPmMb4b1tasMVcNgm0NKFUye9LE6nYLdGZL2A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BiGp/C1gOM+RA8w119PSVsQLOUsxNJvs4nOfJt6F28Paihl8EsQ1m5rQF1pthI9Ek
	 u997Lnx+pmg7MftvdvYJOux0B8dEztC4mmYkesddxlp+RaMRn74JKXeZ2IvSeP5wL4
	 Wv84SCYJWNIo+8Z6n69bf97wlDb07VOZzEvUud9g=
Date: Wed, 11 Jun 2025 11:07:25 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: tools@kernel.org
Subject: Re: [b4] CRITICAL: prep-pre-flight-checks must be a list, got str
Message-ID: <20250611-bizarre-granite-mastodon-de6b32@lemur>
References: <20250610194624.GA1933519@ax162>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250610194624.GA1933519@ax162>

On Tue, Jun 10, 2025 at 12:46:24PM -0700, Nathan Chancellor wrote:
> After commit 8cae108 ("Further mypy typing enhancements"), I am seeing
> an error when running 'b4 send':
> 
>   $ b4 send
>   Converted the branch to 1 messages
>   CRITICAL: prep-pre-flight-checks must be a list, got str

Thank you for the report. I didn't take the patch, because the way this was
implemented needed to be redone anyway. Please check the latest master, and
thank you for trying out the bleeding edge!

-K
