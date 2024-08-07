Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA95F2A1BF
	for <tools@linux.kernel.org>; Wed,  7 Aug 2024 14:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723040522; cv=none; b=mVTlDOC2C+GDrWceTo98NgEgqa95vaXIIrzd5wyItFz3EIoxEjrpylFa4+HlHU1+fqRudEyfYlY6V2Z327O2jq14RUwHAbNCQerPJSoC7T4Sh3VYHZDv2TuBPb51G22Rh5BW1ozl/tTJs2N3cQlzMDGrCOXFAMCV800rSNqiIAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723040522; c=relaxed/simple;
	bh=PUqB2tWTJZbYpVUFXvYClzksgW2SMT3bmQWhd9H34WQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V3l86SYibUjodUcYk7WeMNn1MT1hupVUyfGsAkeLHDHyrtCAGZlA5rVKGzjH0napvzfyhx3f7ax7TK72G+fL8VRNpkY5IlEc+MK04hVs9haQfDD0omHEX6BpGBpIaO8QiisenqDToW3R46YXCYUSqmJRX4K6aceqj3ZwvxcOFQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Vt5Pbf5v; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Vt5Pbf5v"
Received: by smtp.kernel.org (Postfix)
	id 6AD13C4AF0D; Wed,  7 Aug 2024 14:22:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DBA6C32781;
	Wed,  7 Aug 2024 14:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1723040522;
	bh=PUqB2tWTJZbYpVUFXvYClzksgW2SMT3bmQWhd9H34WQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vt5Pbf5vRvMLc9OtJWwWZAc9Ft0xXVqoi+uDzlkSX38c6xUF5oJ7JZ6JOgK1SWnQL
	 i1HpSn1LJuh01pI15bRRAjQIsTzEFSa+vcWF9nGKD3KUD/r0FwvmLiAaNmRfVItu/q
	 gxcUnRGN/KIDdSNvYO9AcKy/zdlbYyHwO7dhB2Jk=
Date: Wed, 7 Aug 2024 10:22:01 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Kevin Hilman <khilman@baylibre.com>
Cc: tools@kernel.org
Subject: Re: b4: message-id from deps added to cc list?
Message-ID: <20240807-voracious-jerboa-of-finesse-d7242f@lemur>
References: <7hh6by34mx.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7hh6by34mx.fsf@baylibre.com>

On Mon, Aug 05, 2024 at 04:56:54PM GMT, Kevin Hilman wrote:
> I'm using b4 from the stable-0.14.y branch, and I noticed one pecuilar
> thing on the series I just sent[1], and that is the message-id I put in
> the deps (using `b4 prep --edit-deps`) correctly showed up as
> prerequisite-message-id, but for some reason, it also ended up in the Cc
> list, leading to bounces for all mails in the thread.

bugbot assign to me
