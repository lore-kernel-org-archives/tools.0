Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E194212566
	for <tools@linux.kernel.org>; Tue, 17 Mar 2026 00:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773706529; cv=none; b=K9JeCTZVQ7bsTorKaNxTO9EwRU15suu1GR1foeWWwa4iUq++X8wbI+KeAYWBNx252V8WOnT9VhDpj87gZysZiAzQ9A8bZpp+qAeapVmgKLdlkeDU5/hGojQUjXY3JCdPvZk3o5PanGFPAs1NBNWCKBgkwx9oWCE5PsE1m+OGIr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773706529; c=relaxed/simple;
	bh=n2Dyail9776y+8mzbvAxirFyRINdZ8AboMPeuoVPTxM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QHeDDtYqzVsfYsIhjIP4O4jrbxJ0ggK5PJvwcF80EMWP51D4BEzh4fJmH6CXRDalEg1/oF8V5FO2DADWdxTs5ng7IaTjCZQ1QKxHVv8jWUwvzNYbHKV0V4uX/A90Rjup+2VeBn4hJsJbHoLR4v5TYXfTSmltR/P+NlhFMiLSyME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sm38aNJz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sm38aNJz"
Received: by smtp.kernel.org (Postfix)
	id 0B596C4AF09; Tue, 17 Mar 2026 00:15:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C72F2C19421;
	Tue, 17 Mar 2026 00:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773706528;
	bh=n2Dyail9776y+8mzbvAxirFyRINdZ8AboMPeuoVPTxM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Sm38aNJzHl4IIsnt2MQ0v3V51P7PbrJSiy6dM4ScHDxU+/kbWML+6ZtTYxh1Z2dhj
	 p/ZaL/uSi5ySBdda6bCb/UmMT4PGLLiWWxJP8QNcxaAzsVKcVPBOlUe9m1NDl+VeRR
	 rlThS8VuhDevNCnNZwzIdKoJ0Yz38cmOTETFEZPQ2kO1nsN6OoZMCjdxbhOccwUooO
	 ED9dpZZGL6WuvNtq6bZGlc+smIa2mpYcSLm5FUYgqCIciJxePGi916U/CUg717+qVC
	 JuhRB8Iqe+HjyhWFGq9LLwYMEjr09cW0kSCLMA+rUpw608H8NK0sJ9es5CWOTlqL2D
	 6I6Rqv1gdkgYw==
Date: Mon, 16 Mar 2026 20:15:27 -0400
From: Konstantin Ryabitsev <mricon@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: users@kernel.org, tools@kernel.org
Subject: Re: b4 review available in master
Message-ID: <20260316-quizzical-raccoon-of-refinement-d88fdb@lemur>
References: <20260227-imported-aromatic-guppy-ad3dca@lemur>
 <87tsuffj7h.fsf@trenco.lwn.net>
 <87h5qffikk.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87h5qffikk.fsf@trenco.lwn.net>

On Mon, Mar 16, 2026 at 05:41:47PM -0600, Jonathan Corbet wrote:
> > Konstantin Ryabitsev <mricon@kernel.org> writes:
> >
> >> Hi, all:
> >>
> >> TLDR: "b4 review" is a terminal UI that hopes to streamline a lot of
> >> maintainer duties. A getting-started guide with screencasts is here:
> >> https://b4.docs.kernel.org/en/latest/reviewer/getting-started.html
> >
> > So I've been playing with this a bit - fun stuff!  A few initial
> > comments.
> 
> One more...  somehow it totally mangled the placement of the comments in
> the first review I did with it.  See
> 
>   https://lore.kernel.org/all/177370220974.1754131.9642805524574261129.b4-review@b4/
> 
> ...and the followup with the intended placement restored.

Failure is always an option! :)

Thanks for both of these. Can you possibly share the review branch so I can
see the tracking commit from there?

-- 
KR
