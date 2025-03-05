Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E566E61FFE
	for <tools@linux.kernel.org>; Wed,  5 Mar 2025 16:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741193099; cv=none; b=V8kRndnMxb4XyLmO0cE7+F22QStoSoJ0o/Mp73cAPlpBLKa7hY0QBrdPz85qFPPLKJVIGvIgH9bdZ+MvPzqMJG97Ueu+xAEavGaazDDHd//6eNVJVndN2tDwKMcQ159ZJvHHUN1g2dWxX3TEdW+YP5yvnxeddm99tHqvaeXUjjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741193099; c=relaxed/simple;
	bh=ltmOobex9uD3cfWH3pUnIoPmq2jLJF3pcHbZthbBiqo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UVnKKQWrvWp9ayTrByKOVIr5wvmum87c121kzlALDNK7TvZupQPw3BFaVUUoBwc0u6MfKLjv1JW7dyET+E4rXXljRaNMhQv+mkXq9M0wfElArswyuJOeE2FMjyR9IcnoTEnqC0lSHPWSYDHN03yCzbtAfXcwaU/2mguBwvp0AlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=UcD7p/K1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="UcD7p/K1"
Received: by smtp.kernel.org (Postfix)
	id 6F923C4CEE0; Wed,  5 Mar 2025 16:44:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 235EEC4CED1;
	Wed,  5 Mar 2025 16:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1741193098;
	bh=ltmOobex9uD3cfWH3pUnIoPmq2jLJF3pcHbZthbBiqo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UcD7p/K1RRomvCYHiEKxjvK5oYXzL2i4bBRXc84vHupi2ZUI3H894iZjLxjkVwMS2
	 XZaAfj5TDuJV3lMUiFma8Kz0DU5BQG8TXZNQfOHQOchS+pcKeb5hF0zE+hVcI5GEeT
	 bHAbxIr5hGVg3j8w3XxQuAmlVRVexhDoeZmE+Mhg=
Date: Wed, 5 Mar 2025 11:44:56 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Tom Rini <trini@konsulko.com>
Cc: tools@kernel.org
Subject: Re: b4 feature request
Message-ID: <20250305-diamond-hummingbird-of-unity-a0d9e1@lemur>
References: <20250305145121.GM2640854@bill-the-cat>
 <20250305-amiable-banana-scallop-167f8a@lemur>
 <20250305152549.GN2640854@bill-the-cat>
 <20250305154059.GO2640854@bill-the-cat>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250305154059.GO2640854@bill-the-cat>

On Wed, Mar 05, 2025 at 09:40:59AM -0600, Tom Rini wrote:
> I found the template, and did a diff, and I don't see why my partial
> replies are different.

It's the commented-out ${summary}.

>  # Check this page for info on convenient URL shorteners:
>  # https://korg.wiki.kernel.org/userdoc/git-url-shorterners
> -#${summary}
> +${summary}

-K
