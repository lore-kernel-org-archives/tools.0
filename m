Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5ACD374E45
	for <tools@linux.kernel.org>; Thu,  5 Mar 2026 18:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772733672; cv=none; b=O3UQXF0TdwlEX2BlqgzSxe/p11x4nGjZFJUqQ7jY/ZvBFKc5OhKbUa+Mmmlm8tgbiH0MpfTSofz4YZEdJwTry4y9ikOJ7nsZtSNFULv4S4Ldw3xULy/26R/DVwhONkIB7HXXrGeodbqCN4ORzNDqncvPeww9tPM33wOoz5kqEcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772733672; c=relaxed/simple;
	bh=x3tV6qw/kdL979LhhvxkbjlHXofIlzahndsJBkTktyw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b3KLrPFP9dQ35lf1u4oAeBRVKjqFV5kM1xRUO3dZqS86vF4vmJ1qjK3PhiKQpZaKxbg1YE4HFZeEQvyCOENxBY8Fq9YuFzgDCZw5PKmKpldOxxmWpPZwDdWXHTZ5fz6Q6KeKxNqpczR9oRacMxUZIHRWIhIg8OpDwgbh5lcGLjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i0b+B1P2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i0b+B1P2"
Received: by smtp.kernel.org (Postfix)
	id 48D4EC19425; Thu,  5 Mar 2026 18:01:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19649C116C6;
	Thu,  5 Mar 2026 18:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772733672;
	bh=x3tV6qw/kdL979LhhvxkbjlHXofIlzahndsJBkTktyw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i0b+B1P2nD4re2USSoRJStw9qD/gGZjWYeRI/3GyN+wErIIu9rl3tMnXmMctCik8R
	 Pj+LbCKqz/AAQuaEPrtH2b3XbBdSvB7RInOw5C8JAXdWmZhGWz4ie1gkMyQB9Un2Ss
	 YkZ6Qq2SlNIbrqfBq/H3Fe3qfoF49AXeHPzwerOa8l8Gz+8X6XyjBDPYmBhOyEIYk7
	 GODe9n7p9tiLO1Ro3ODhF+BKWH2bm/1DYk/gLk9it9R0nwo8yhuyQ1F9MhYUxetOgM
	 7QRfkfr1JF6oI8QfPifRC7S4cqqreo66EmueuY2iRI5pv7XhPQRDFTzx9/uhl6yErv
	 02o93boea6A0g==
Date: Thu, 5 Mar 2026 13:01:08 -0500
From: Konstantin Ryabitsev <mricon@kernel.org>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: tools@kernel.org
Subject: Re: CLI kgl --yank default target
Message-ID: <20260305-eager-scarlet-dog-590574@lemur>
References: <2991adad-9271-4e83-82ec-1e23c37cdb2c@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2991adad-9271-4e83-82ec-1e23c37cdb2c@kernel.org>

On Thu, Mar 05, 2026 at 03:55:39PM +0100, Vlastimil Babka (SUSE) wrote:
> as discussed on IRC, please add a way to kgl --yank use a default target if
> there are multiple ones set up.
> Apparently the gnome applet uses the first target defined, so CLI could do
> the same?

Makes sense! The master branch now has the behaviour you're looking for.

Cheers,
-- 
KR
