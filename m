Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513613CBE6C
	for <tools@linux.kernel.org>; Wed, 11 Mar 2026 14:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773239951; cv=none; b=VDx1pROJBpK/ZUJ+7DSiKVDoqNefaJ23CDgUclU1e9M47uMi4AYG3gFVB2RbXzXwTa/WBaz53ZveueT/TYsqoFinYLP90UZ3qpcMCYe0H79eXsLsZ0xdmjmur3LXmfKnPpj/Xw7gGdmBeHgOEY9nJBjarQfQbyNO/F1w5cwY3dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773239951; c=relaxed/simple;
	bh=vovt/BNlr/Dvc38kOkzZNIvSopNCQ3NRYGpY2KOn5cU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VHFBNuQqxefn84fRAfVrs98ei+e5Ip6DGOohIxuvt6fFmcUuzXT9B9bNwtV9ieKgs7wPGCslVpGyxv1ro2DW5zzCwIZievFXYnAstBUYuVLHnP+2AjNI3hPzoj6Evl5hkL8dWNJ6s3B8X9GRD/jpMaf23zBxXGs2K++Ocpe+KIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=BspTjv6B; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="BspTjv6B"
Received: by smtp.kernel.org (Postfix)
	id ED7D7C4CEF7; Wed, 11 Mar 2026 14:39:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5B51C19421;
	Wed, 11 Mar 2026 14:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773239950;
	bh=vovt/BNlr/Dvc38kOkzZNIvSopNCQ3NRYGpY2KOn5cU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BspTjv6B7He029W94nnD+tdI+CdfyGS2XYzWdNis6rZkse9ziCkGy7Xc8OXu9nNzk
	 tN271LxfGLoSeAvdYD0EHiR4lVM5yuJe1VdGr6J9DZ8iZE0IlhLWfPQi9rxmQS7UPU
	 5Mvyjj52D8OTrGgL47AXir0nlE4kX18w4lOtda8E=
Date: Wed, 11 Mar 2026 10:39:09 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Brigham Campbell <me@brighamcampbell.com>
Cc: tools@kernel.org
Subject: Re: [PATCH] Fix typo in maintainer docs
Message-ID: <20260311-invaluable-attentive-gopher-dd0a55@lemur>
References: <20260311074014.289088-1-me@brighamcampbell.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260311074014.289088-1-me@brighamcampbell.com>

On Wed, Mar 11, 2026 at 01:40:14AM -0600, Brigham Campbell wrote:
> Fix a minor typo in the documentation for `b4 review`.

It's not actually a typo. ;) Welcome to the Canadian spelling where we
arbitrarily spell some things the US way and others the UK way, and many of
them are correct both ways! Like enroll and enrol, which are both accepted in
Canadian spelling. *sigh*

However, since the command is "b4 enroll" and not "b4 enrol" I will take the
patch.

> Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
> ---
> 
> Unrelated, but thanks for your work on b4, Konstantin. It's been a
> wonderful help to me so far. I expect the new review functionalities to
> be very useful for reviewing many patches from kernel mentees.

Thank you! That's my hope as well.

Cheers,
-K

>  Enrolling a repository
>  ~~~~~~~~~~~~~~~~~~~~~~
> -Before you can track series, you need to enrol the repository::
> +Before you can track series, you need to enroll the repository::
>  
>      b4 review enroll [path] [-i identifier]
>  
> 
> base-commit: cba5b5a9fd6078646a58531643e7365480504d77
> -- 
> 2.52.0
> 

-- 
KR
