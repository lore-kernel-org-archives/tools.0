Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE56B279917
	for <tools@linux.kernel.org>; Fri, 10 Oct 2025 08:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760083409; cv=none; b=fawUQAZnN/6lAq+ztpNGFnLIWo1KNoN1D2K7slUTHXRxoewWxhHdNLJvaScmNQXvDetuuKZpDzWkRJ0Orud5i7DxA9V3uaMLVmtQ0eYTZUE34cFuMz79Y3jwLFWZ7Udk3p/lnKnmxvKTneCtKijRqWi3h3vvAARukqr3XROyts8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760083409; c=relaxed/simple;
	bh=sbIr5uSQY6QP7FjdgUVwCZMuRcJeHUA394cEtNhxR/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RUjmnoJ0a1b0+HaQ25OORi2dkfNaD47VKE0uIJ+SyaH5ifKUo+kBDw1hxQ4UhgpF+AGawSZbrGjfA4HbpSPLE/lSMBOBKpBfRZCoiZR2vrUbDbEQ6Nruj+zJphX9jcrfqeBBrDdS9oQgp5+ZsJ7YV63bvuDo2/r4uWKTyDTbzCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B2gU5UEA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B2gU5UEA"
Received: by smtp.kernel.org (Postfix)
	id 389CAC4CEF1; Fri, 10 Oct 2025 08:03:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F616C113D0;
	Fri, 10 Oct 2025 08:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760083408;
	bh=sbIr5uSQY6QP7FjdgUVwCZMuRcJeHUA394cEtNhxR/E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B2gU5UEAhXeop+cD5hg1r/hFc8RLmLxIAh9R4iYfgJO/0N+Wz8YMCiyFy8KXceWKI
	 wgEx1/MqrEcWsAGeEorove3XPYgALHQ0eww8WN8NmagMnEK3/1b3oVuL8WLEE5Lyt4
	 6YOeUUWpzIUFNfX7CE3pkcC7woBq1G/Ic3YK1xuBihHgiS79SMCRgrVJ+b6vw4PFhC
	 Q3OCidCdp3dBXvd02IiAz4UGr5tIn1zf1tRbJojyYrwrsVIeKmikkXVDM2mursVkpF
	 M7XAUx1jgDvWPj59iUS+bdxnYvQ9Ec0c92oD0UUNWAzNJgcvFerSt46+gzlJTeHlux
	 IYoiQXSJgAGSQ==
Date: Fri, 10 Oct 2025 09:03:24 +0100
From: Lee Jones <lee@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: Re: b4: ty: User-flow regression
Message-ID: <20251010080324.GC2988639@google.com>
References: <20251009151349.GB2890766@google.com>
 <20251009-remarkable-charming-pogona-fd7a8f@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251009-remarkable-charming-pogona-fd7a8f@lemur>

On Thu, 09 Oct 2025, Konstantin Ryabitsev wrote:

> On Thu, Oct 09, 2025 at 04:13:49PM +0100, Lee Jones wrote:
> > The that I'm highlighting occurs when changes have to be made to the

issue  ^

> > commit message.  My assumption is that the hash no longer matches and we
> > get:
> > 
> >  Auto-thankanating commits in for-mfd-next
> >  Found 5 of your commits since 1.day
> >  Calculating patch hashes, may take a moment...
> >  Nothing to do
> > 
> > Doh!  There should be something to do.
> 
> Curious, have you set your diff.algorithm anywhere in your git config to
> something like "patience" or "histogram"?

Not that I'm aware of:

  $ git config --get diff.algorithm
  <no output>

  $ git config --list | grep diff
  diff.wserrorhighlight=all
  diff.colormoved=zebra
  merge.conflictstyle=diff3

-- 
Lee Jones [李琼斯]
