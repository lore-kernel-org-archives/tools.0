Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B74939E194
	for <tools@linux.kernel.org>; Mon, 16 Mar 2026 15:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773673891; cv=none; b=Lgkn9fkiZ3HevLfT8LpnBGgrLX3Ufrvui4TMtQb4VkXmnXkYh1SEmljs/E0VWaEkoC5CjefCizwWLDRwuB9XdV/0ke7Rp1HwHJiO7VR7r2P+nu0lM/NVV8mkN2Bq4Ln6GR2wzzqF/HgI/lDb84CvZ8NcLHLMj0lfPrssk3CxNDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773673891; c=relaxed/simple;
	bh=KWKSGZOCtvtymY2IXaAbkkYUpU62NbgN4CXkFY13KZw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ge4gokdOxUbwDbE7VFF0hIZDy7bMxYzf3B41alrPsUzbAJ+2ddhX25lL8cOvw8Vg73vlciruTsl51XIHe05xUs0/QFNgCVvWMBSSnwgUBEQb3JEkUzmowZqGZsKaigKtQ3ghl4jl3R/kvpzmJcHI6mxRYIOEsa+O83VlBTpnK6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=RE9c4Ovy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="RE9c4Ovy"
Received: by smtp.kernel.org (Postfix)
	id 87891C2BC87; Mon, 16 Mar 2026 15:11:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 562F2C19421;
	Mon, 16 Mar 2026 15:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773673891;
	bh=KWKSGZOCtvtymY2IXaAbkkYUpU62NbgN4CXkFY13KZw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RE9c4OvyH8a+ZWDjglbWeL+VlbA62LK6QbblLS7XHNtR/DAm/A0m7TtUnQDyS4nO+
	 Yb1dEPWcA5U6YwyNepN+PHspAZwj0zhvAowBpHRUs+Aza9CwGzEse/6NtEXjDR8wYo
	 D1Rpn2kYt+axrZ2kVtK/k9CKyz0dGmhmSqguF+lE=
Date: Mon, 16 Mar 2026 11:11:30 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Tamir Duberstein <tamird@kernel.org>
Cc: "Kernel.org Tools" <tools@kernel.org>, Codex <noreply@openai.com>
Subject: Re: [PATCH b4] review: suspend before tracking saves
Message-ID: <20260316-peculiar-koala-of-inspiration-c80bfc@lemur>
References: <20260316-followup-tui-bad-v1-1-ebe1beab9804@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260316-followup-tui-bad-v1-1-ebe1beab9804@kernel.org>

On Mon, Mar 16, 2026 at 10:48:39AM -0400, Tamir Duberstein wrote:
> Wrap review TUI tracking saves in self.suspend() so interactive git
> signing and pinentry own the terminal cleanly. This avoids sluggish
> input and swallowed keystrokes when follow-up loading triggers a
> tracking save.

Thank you for sending that in.

> 
> Co-authored-by: Codex <noreply@openai.com>

I've added a stern admonition in CONTRIBUTING.rst to instruct agents to stop
using Co-whatever-by: trailers. It's more than just personal preference -- it
generates junk mail.

Can you please resend with an Assisted-by: trailer (that is also not separated
by the --- as below.

Thanks!

-K

> ---
> Signed-off-by: Tamir Duberstein <tamird@kernel.org>
> ---
>  src/b4/review_tui/_review_app.py | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
