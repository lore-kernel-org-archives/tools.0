Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B495C1E5215
	for <tools@linux.kernel.org>; Wed, 28 May 2025 18:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748456836; cv=none; b=WTdscrCAPAwGwT91pwX7sVeNDXgilh3/swDTlSlDBfdiQc4sy1+klIyNHhatT0QANd1z7IZ9JboKyyJf8B5BVbkqmatIT4nUpKToI3H7fvDvBcCJB7Wr9b1eX6QORAVpD0/1uDIKlwdFfirbAai1dDJv3iC2xoyUmu2AHpKYYL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748456836; c=relaxed/simple;
	bh=evhSBDP4fSvkN6NamYbwI+ysjWsHvWEtA1XSgpeScfU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bguuBuzX0o8ZQoqsDkm8R2TijnpLMEwZVqPFNinZkWXGEHco4kQsADkjdwjUVJin+tgaLLAhwZUfR4pwSAgQ5ckOeiNkLQT2dSVFwlp54kPZkusCL4uuLcFcJromQ7w6wpStdj45blRj1Um8M5z5Ad0DLJ8Y6vNFkj1YYOvpQp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=uGj3IPH/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="uGj3IPH/"
Received: by smtp.kernel.org (Postfix)
	id 3A3A7C4CEED; Wed, 28 May 2025 18:27:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0250FC4CEE3;
	Wed, 28 May 2025 18:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1748456836;
	bh=evhSBDP4fSvkN6NamYbwI+ysjWsHvWEtA1XSgpeScfU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uGj3IPH/z+vTlcdDLA38WBSwStBEhjSCns42PqrlV8vzlzOYPywXVtM1po1eHcCA0
	 T65Iqon2XIz+C1uWe2irTTNJ5V9fQubriGwgNH6IkrY54APx4ei2ht+WZEa5K/47Pd
	 d6WnBKgtosYy+ga5+NdTM+7oMz1rpRvR3IcGecnA=
Date: Wed, 28 May 2025 14:27:14 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Tal Zussman <tz2294@columbia.edu>
Cc: tools@kernel.org
Subject: Re: b4 broken with git older than 2.41
Message-ID: <20250528-active-pumpkin-tapir-3e912d@lemur>
References: <CAKha_sri+u=R9x1h9tg7N4cuTFckLmbe22=Sw2P2jpw_fm2Jcg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAKha_sri+u=R9x1h9tg7N4cuTFckLmbe22=Sw2P2jpw_fm2Jcg@mail.gmail.com>

On Wed, May 28, 2025 at 02:15:16AM -0400, Tal Zussman wrote:
> Hi,
> 
> I am using b4 (both master and 0.14.y) on Debian 12 with git 2.39.5
> (the latest available).
> Unfortunately, it is failing with errors such as:
> "CRITICAL: Failed to convert range to patches: Could not get a patch
> out of bfd12f86c8a48927959a7d88c84296823e15a8f9."
> 
> I narrowed this down to the use of the '--default-prefix' option in
> git_range_to_patches(), which seems to have been added in git v2.41.
> Once I commented that out, everything worked fine.
> Is there a minimum supported git version listed somewhere?

Hm... we should make things work with that version of git. I wasn't aware of
this limitation.

Thanks for the report.

bugspray tag me

-K
