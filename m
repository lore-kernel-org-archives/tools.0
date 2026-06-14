Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4257C397690
	for <tools@linux.kernel.org>; Sun, 14 Jun 2026 15:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781451642; cv=none; b=YS4Q6GG/EwcU6/l5Q+280NbeoYYuFMw3KyO31hG0bI0NhLfX5x0d6A/q6C8/kNPdtcxWmtfbA6tXHt0HHsRwxA5ZpjTwBVkcRcyOFqWP6VrYX4lj5rBxBnIA7jsLTe3zapRq/W4lmeJWilPxDhJUXULe0/7vvrl4C8SxtXsmYDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781451642; c=relaxed/simple;
	bh=zXxP1jLvVhC9o+JPK8/s2p4UZW+nXOuaskhfy23y7qE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HUIPrCQwnNCojRsfvfPgUYiKqAMlXtzRYiTlgX+AgrI/OMASevrFSTFJYkJRvdVczEwBiziLGS/6ELd+iJ7HkvJ0Nd2lOlvrtGb7dYBochXj8bsVJ1r85NPPjL6niddxtW1MIIfxLuxYUo5xXmbT3K6Rw31uOLlcCUoewXjjDzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=vo7sOdb6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="vo7sOdb6"
Received: by smtp.kernel.org (Postfix)
	id BD7821F00A3A; Sun, 14 Jun 2026 15:40:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7519B1F000E9;
	Sun, 14 Jun 2026 15:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1781451640;
	bh=UAr9TiC5JsH3YfhC9u29qVX8u5M1l5Djoh9ICKEypGQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=vo7sOdb6hPd/pRwEfDxweH1t9nDWfKB74kk/F28PjOCM1jem0cgr1MAq15bCFu5JF
	 pWQSSVSOyzYntKBEt5IMDiOq7GXHWeO+W+vhvZpLNkiAWIhxJsHKL4gtYGhGe8g6g5
	 Z14jdtNXn0eAKGnpkMTWN3xqmDAn9J6xDQpCSGAY=
Date: Sun, 14 Jun 2026 11:40:39 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: =?utf-8?Q?C=C3=A1ssio?= Gabriel <cassiogabrielcontato@gmail.com>
Cc: "Kernel.org Tools" <tools@kernel.org>
Subject: Re: [PATCH b4 v2] ez: avoid duplicate signatures on resend
Message-ID: <20260614-unbiased-favorite-marmoset-194aff@lemur>
References: <20260613-resend-signature-fix-v2-1-ddd560f810bc@gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260613-resend-signature-fix-v2-1-ddd560f810bc@gmail.com>

On Sat, Jun 13, 2026 at 02:30:03AM -0300, Cássio Gabriel wrote:
> 'b4 send --resend' rebuilds messages from the historical sent tag and
> appends the current email signature to the cover text. If the stored
> cover already ends in a canonical signature block, the regenerated
> message carries two footer blocks.
> 
> Strip an existing trailing canonical signature before adding the current
> one. Reuse the helper when preparing sent tags so reroll and resend handle
> the delimiter consistently.
> 
> Link: https://lore.kernel.org/all/20260511-alsa-hda-cs35l41-fw-work-teardown-v1-1-1184e9bc4f25@gmail.com/
> Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
> ---
> Changes in v2:
> - Only recognize the canonical email signature delimiter '-- '.
> - Preserve bare '--' lines in cover letter content.
> - Add a no-signature regression test.
> - Link to v1: https://patch.msgid.link/20260525-resend-signature-fix-v1-1-09fd09faf34f@gmail.com
> ---
> base-commit: 474350a3035537184556061872e9e905b47774ca

This is unrelated to the patch, but I did notice that something went strangely
wrong with this submission. The base-commit line moved up above the basement
into the header, and the bottom is truncated:

https://lore.kernel.org/tools/20260613-resend-signature-fix-v2-1-ddd560f810bc@gmail.com/T/#u

I've never seen this happen, so I'd like to understand what may have caused
this.

-K
