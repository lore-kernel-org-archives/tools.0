Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79F543D4FD
	for <tools@linux.kernel.org>; Tue,  4 Aug 2026 09:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785835637; cv=pass; b=KND/qgjh7vja28qrM1a9vMv/H0ynGtp2To9XJntotUZu4Rvm5/sBf0ntaSheupYoJOo3LxvN5VXWB/cT9+Hu1zztP9C+j8EUohd428xaKEuHfjsdunJ+pHA+v+7g9PlLtmym0j26yMatAUhVJ33EmladUlffhpbBHLRSLhpVURY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785835637; c=relaxed/simple;
	bh=j3ODnDy3UAMjakNrWSEMSHXB9jiJiLycoYeLc4bxKsA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u/u/dnHlDR/KgdxEyFOFgKNY6Kvxf9uu6EM8yNmBFQrh/0IPgXDwRyQ6UV0QZfFmKrDRSB0eOhia/Oq397YwjusRl9cjlk5aWCb/2QpBfmyHqL2r7WChOKSIMfKh+lqEmJHC7HwxV7R8PMCQCUYjo9/zWAWvWr6zAO+elNaEz7k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=duK8SXqH; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="duK8SXqH"
Received: by smtp.kernel.org (Postfix)
	id 765E31F000E9; Tue,  4 Aug 2026 09:27:12 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=82.195.75.108
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1785835632;
	b=ugJ8N7KpyivVEZkvWY+b0dis3L5g0khH9sVOzpQqJQ4+kMR+4IAtFiH5i+OIbwi9m8f/
	 cUdHebJ26GCRHeKEh7AdnHEQJuzEH4zaEFd9H8XDTGXD3HwAEN3QUbsjgHgZzLJWWclLC
	 eElyun19zyXX5mkCwhwQqNQXANiHH6ntgAIDG/HK5Ph1kJ3JZDZfITX1Xo58nsWhalwhx
	 6ekD3/c2ZpblrHniRuFAXqlueo+A1bfffQz75u3vWSWiXS9ZHmA95vOm9ofwyc8Q7VKwe
	 1Ed1NcW1fAjVvIRra+n6vactE1cRMA3tkj2yL1BDJmiZ/K6/e8rjjy9Y44f8YUw90eQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1785835632;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Debian-User;
	bh=tdUlMbmtN1aZx4tN28M4XuahAF8+2ZuQ+2Ij+XwNOms=;
	b=3cKkdawjdYJRmQlNSXFDcaOJJsZt0/7wXxwa91HhMPPLmCyzwHLQSBAgvXLRzXEwMt4O
	 LgALy/8GdBf2sdGVDV7XOoZfiM8xwBgCfiz1+YnSngoSBru5d9Zj8XBzLqoib7hf6ZPFL
	 h0QdZyB/ooP1m3t32KRYFTcm3rqKtD0WNdUCzZP67TU83Qq5m3FRV455qsYMs+4idZOG7
	 3Ew8pCPJDH1dT7cX3h/KtzAgaKWxTY6jNKutYeKfgJveTqGBTGhIMVS6TZt6d1glvqgqX
	 76JQ34Isxf+2qcWaUOuzbWsrUHrBsjMtXZ0Xewfg0fVTNz4Uz9pEYspzrZSrlYBEEjg==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=duK8SXqH;
	dmarc=pass header.from=debian.org;
	spf=pass smtp.mailfrom=debian.org;
	arc=none smtp.remote-ip=82.195.75.108
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 95B021F00A3D
	for <tools@kernel.org>; Tue,  4 Aug 2026 09:27:06 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=duK8SXqH
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 95B021F00A3D
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=debian.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=tdUlMbmtN1aZx4tN28M4XuahAF8+2ZuQ+2Ij+XwNOms=; b=duK8SXqHGjAX2ZXnylQ1YaMWtU
	bEJvdCyXHdXWlawQyknaq36AARk52n3UTu5pkMsnVsNtaONY7ODmQHmEM9jZYu1kkwyhUIIZXuLjW
	3qGWLa8WnptYxgLfjct9NjgmUxsC5aZbTlJa0mlEsD79N9ZSpSWMDhMSIyAvnvfrq5jlgiMyBPEPx
	9DduFiRb3xVD9jSvT1A1hkqzyWSHtrx9NxzaZSt7QDFrSCAhhUctFkwI+DKuiJ+vpKL5mSqsXLi3E
	9OgvrKbxidqKHj1SEVE+scHeOwb/SNYWvc53hKgqMiMNhbegTemSrL1wlK3VoXZMIYbnOb1biCa39
	uXC1YWpg==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wrBQK-00D2aI-2t;
	Tue, 04 Aug 2026 09:27:01 +0000
Date: Tue, 4 Aug 2026 02:26:56 -0700
From: Breno Leitao <leitao@debian.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "Kernel.org Tools" <tools@kernel.org>, kernel-team@meta.com
Subject: Re: [PATCH b4] prep: add --cleanup-older-than option to clean up
 stale branches
Message-ID: <anGvfnqMfavE6HKk@gmail.com>
References: <20260323-cleanup-v1-1-cbf209f3de43@debian.org>
 <178578404438.357789.17589596756429737801.b4-review@b4>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178578404438.357789.17589596756429737801.b4-review@b4>
X-Debian-User: leitao

On Mon, Aug 03, 2026 at 07:07:24PM +0000, Konstantin Ryabitsev wrote:
> > B4 is so useful that I have too many branches now, create a way to
> > easily remove old branches.
> > 
> > Add a new --cleanup-older-than DAYS option that archives and removes
> > prep-tracked branches whose latest commit is older than the specified
> > number of days. Each matching branch goes through the normal per-branch
> > confirmation prompt.
> 
> Sorry this sat so long -- I missed it initially and just caught up to it
> now going over old series submissions. It needs rebasing, but I don't
> see why not to take it.

No problem, thanks for getting to it. I am using this on my b4, and this
has proved valuable to cleanup old branches. 

I will rebase and resend.

> > diff --git a/src/b4/command.py b/src/b4/command.py
> > index ca7f238..2d263de 100644
> > --- a/src/b4/command.py
> > +++ b/src/b4/command.py
> > @@ -401,6 +401,8 @@ def setup_parser() -> argparse.ArgumentParser:
> >                         help='Show series info in a format that can be passed to other commands.')
> >      spp_g.add_argument('--cleanup', metavar='BRANCHNAME', nargs='*',
> >                         help='Archive and remove prep-tracked branches and all associated sent/ tags')
> > +    sp_prep.add_argument('--cleanup-older-than', metavar='DAYS', type=int, default=None,
> > +                         help='Archive prep-tracked branches older than DAYS days')
> >  
> >      ag_prepn = sp_prep.add_argument_group('Create new branch', 'Create a new branch for working on patch series')
> >      ag_prepn.add_argument('-n', '--new', dest='new_series_name',
> 
> Suggestion: add it to `spp_g` instead of straight to sp_prep
> (`spp_g.add_argument('--cleanup-older-than', ...)`), right next to
> `--cleanup`.


Will do. It turns out not to be purely cosmetic: because the option sits
outside the mutually exclusive group and cmd_prep dispatches it before
--cleanup, argparse accepts

    b4 prep --cleanup b4/foo --cleanup-older-than 30
    b4 prep -n newtopic --cleanup-older-than 30

and silently ignores --cleanup / -n in both cases. Moving it into spp_g
makes argparse reject them outright.

> Minor nit: the help text says "Archive prep-tracked branches older than
> DAYS days", but the operation also removes the branch (like
> `--cleanup`'s help text, which says "Archive and remove..."). Worth
> aligning the wording so it's not surprising that the branch is deleted,
> not just archived.

Agreed, I'll align the wording with --cleanup's "Archive and remove...".

