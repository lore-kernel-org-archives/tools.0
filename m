Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94AB33D6A
	for <tools@linux.kernel.org>; Thu,  1 May 2025 16:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746116233; cv=none; b=XxygxjNU+htmFJYQeg8J69c+7Osg+THfRauVwwUO+bBycBspGCf34mTdnfo4IG/ibaRvm9i0KRQThBbRhfx5xlt3Z5tURj2GXV9Eh6BtsAwPdAjT0+2dzIS5Uj33WTSfSZe9uYOxlh+WxnFHnGzb33SEYH3s2jQWPZq5arB9ORk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746116233; c=relaxed/simple;
	bh=IS0MpFpfK13gJfI0Fm3e6YEwaX6txDjyGfcqVnW1iPk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sxGauKI06akfQMtBvbM1q95VNjLGS2Fi4m66qHLS9tApUs/jQ1pg17HdY7iPJbyXxTf2JaggoX9xdvXAaVr7ZCKahZhEwM9k3nxumXzb2vFEmsQHDeYmiKQaMr3c0J8F6UleRu5hQOWwUHec3Xl/EqgBkw1LBLU8ig/KGGWzjfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=DeUzLIKR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DeUzLIKR"
Received: by smtp.kernel.org (Postfix)
	id 1513EC4CEED; Thu,  1 May 2025 16:17:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D712EC4CEE3;
	Thu,  1 May 2025 16:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1746116233;
	bh=IS0MpFpfK13gJfI0Fm3e6YEwaX6txDjyGfcqVnW1iPk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DeUzLIKRsTUfgZVZcXsvfg1yodoVhlbZWJL3d5FFES5vmnY0WCzxoPwsN82xY79Qh
	 Z6aKYjr6fWXh12iVqZjB9ntaL4czMrCjlichflGXDuq7MiE9Z3YtFxKzhe4qA4Z9hu
	 32Ug2LQ4nMRcovdNhr0ksbqB9fHYwMTQ+5HPHQZA=
Date: Thu, 1 May 2025 12:17:11 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Lee Jones <lee@kernel.org>
Cc: tools@kernel.org
Subject: Re: [PATCH v2 1/1] ty: Allow users to specify whether thank-yous are
 sent to themselves
Message-ID: <20250501-cooperative-enthusiastic-squirrel-7dfc3c@lemur>
References: <20250501091502.3663038-1-lee@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250501091502.3663038-1-lee@kernel.org>

On Thu, May 01, 2025 at 10:15:02AM +0100, Lee Jones wrote:
> The motivation behind this change was that thanks-yous weren't showing
> up in my inbox.  This is a problem because I use the presence of these
> mails to indicate that particular sets or individual patches have been
> applied or not.
> 
> Provide command line option '--send-to-self' to override the default
> behaviour.  If this is not specified, there are no functional changes.

Can we call it --me-too, to match the --not-me-too option for b4 prep?

-K
