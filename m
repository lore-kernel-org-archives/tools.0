Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42A3190477
	for <tools@linux.kernel.org>; Wed, 22 Oct 2025 19:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761163123; cv=none; b=HS45RmYMuITUFqmJI+ydPkTCuVcG8/Xxi7g6I/BVTwLVOyZzuF+Z/XhtE3EXcjt+uwEHiAztQrLTM90LDiGMT8UPfGnxO1DxyIdi6mqwGekA5hfR+YX+3oLpdayJAX5ZGZj7zz4xNMOGDd8asnueQ/hH9UxYheE77qd/3RntNnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761163123; c=relaxed/simple;
	bh=VTEdrlSf0dyCEeDEW8ORoR3+X1rRC7JkMUHr9FPG/a8=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JslvPJcr5v8iJqYRJG7vrlg489eF7Nra8+GGxGVAsNBLjA1+/xXNKtHY/JBFRNghm5pmaMEitLaIEENjLxpDbbzz60sIaWkP18gedOyDXlqzmqxrIzh8mqQfSPI3YvO1DIsgYU0AlQsjI9A+fdUrO3o2ViA6vcTAtqgpS4XkWyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Ovd236YC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Ovd236YC"
Received: by smtp.kernel.org (Postfix)
	id A32C5C4CEFD; Wed, 22 Oct 2025 19:58:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71643C4CEE7;
	Wed, 22 Oct 2025 19:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1761163122;
	bh=VTEdrlSf0dyCEeDEW8ORoR3+X1rRC7JkMUHr9FPG/a8=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=Ovd236YCNg2VUSND7uKSSSFtZrTS6q2JeF004iuFv62GZrANVCo/48AoTXJai4zRq
	 Vo3LZX1UIEUTEtTYfkvb/J84ucWP8aIx2BbfzxJpslmjNHpvVuT9jNTh7+WgKlciMm
	 alvvQOG4YrDC+RK/WpO969YVYzSq5WvQd5KBOPTo=
Date: Wed, 22 Oct 2025 15:58:41 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: tools@kernel.org, "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH 0/2] b4: sparse-checkout related fixes
Message-ID: <20251022-elated-expert-zebu-cc36af@lemur>
References: <cover.1760393880.git.mst@redhat.com>
 <176116306333.334203.14010402834008405699.b4-ty@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <176116306333.334203.14010402834008405699.b4-ty@linuxfoundation.org>

On Wed, Oct 22, 2025 at 03:57:43PM -0400, Konstantin Ryabitsev wrote:
> [1/2] test_shazam: clean worktree before git am
>       commit: 72af5e2f16d67610a018c08d264cd9c160cce8bf
> [2/2] ez: cleanup sparse-checkout usage
>       commit: 9e52ea82688a8ca37e6f59a86a723768c6044547

Sometimes you find bugs in your own stuff. :)

Ignore the duplicate, please -- this is because I retrieved this patchset
again while testing fixes for "git am".

-K
