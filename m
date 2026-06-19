Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B244A8C1F
	for <tools@linux.kernel.org>; Fri, 19 Jun 2026 08:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781856340; cv=none; b=EiF6HWNVDF3x8fPUWOTXVzmmqClr74YY2PxfjbVuKtkziZyvnDCSuMSQbN/3qn4AfkQkQR0mzaLe/4yWS65dgHuAWn5EI/hvTXOWBj9f5SmNEfUVo1RHRC3zhaIgY+jsJAfofWXObaHNArb8AXh9LhOqtMeH8Y7nntAkT9y+udA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781856340; c=relaxed/simple;
	bh=zRf80UsT+8lLxKnwHy3rZIxgD3Kqazb8FlkVegd7u5M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UXzxOzA/Ln0UMZI19agg99GiS6X+NN4l0SAR7KyJHt90wDvteHbJOEfxidDl9cZiHuMtC3wWBz7DwaxK0xLgbHHulwdB/lbGNC8x86fD/PS/1VXOJDyIFJOjiuKOUihE00ZaQlorkzI451m3jm4Pk3YpIkBKG2uX4XHUABcxxCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ebFmTvtX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ebFmTvtX"
Received: by smtp.kernel.org (Postfix)
	id 543D81F00A3A; Fri, 19 Jun 2026 08:05:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 750821F000E9;
	Fri, 19 Jun 2026 08:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781856339;
	bh=bXYzj0rd/IHYLVCkvlWH529xMn+D+Gny21otAtbwQ/M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ebFmTvtXpkfhWWmG6WU13bWeu1939LRFKi/e7LBdYlIOSSJCPoNAxXf+a97Sm9jSG
	 yk4uObnVmTDGfQjmc+gTWYfWcEKkLNPwsWjEOJYzjA5GqKplcqwNR13zlh53V8Supw
	 1JjuWQdHYbizrD7DCNe9qwTgOtJ+LOSM9fwN5h4YxGn29sr3adbeg3gSRzvXucwZe4
	 IT2VMvCBmKlqFRv9xUSlkcf1pG+EJrznwdu2WnKi7/uJ2jDJ451VpupXWE3kPPWL30
	 Um+MpUIWV40kAoknSHO14C5zvwwo98cG14WDpTRiKHd0rB3PzK8JwjpFOmYMfZM+FK
	 VYypVr2Pt+sAQ==
Date: Fri, 19 Jun 2026 10:05:36 +0200
From: Christian Brauner <brauner@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: Re: [PATCH b4] review: allow a custom Message-Id command for TUI
 replies
Message-ID: <20260619-desorientiert-altschulden-demonstrieren-2f069e643486@brauner>
References: <20260522-review-msgid-cmd-v1-1-facc71f2e084@kernel.org>
 <20260609-loutish-busy-curassow-33ac37@meerkat>
 <20260609-terrestrial-military-honeybee-d6ffcc@meerkat>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260609-terrestrial-military-honeybee-d6ffcc@meerkat>

On Tue, Jun 09, 2026 at 09:47:39PM -0400, Konstantin Ryabitsev wrote:
> On Tue, Jun 09, 2026 at 09:11:01PM -0400, Konstantin Ryabitsev wrote:
> > This patch won't quite cover every possible case -- e.g. it will miss the
> > thank-you notes that are still sent with the same code path as "b4 ty". Let
> > me think of a more global way to plug this in that won't clash with
> > message-id's that are generated for series with "b4 prep/send".
> 
> Rather than adding a parallel make_msgid_with_cmd() helper, I folded the
> hook directly into make_msgid() behind an allow_custom_msgid_cmd flag,
> and flipped that flag on at exactly the reply/notification call sites:
> review replies, follow-up replies, and ty notes. When the flag is set
> and b4.custom-msgid-cmd is configured, b4 runs the command and uses its
> stdout as the Message-Id (angle brackets optional), falling back to the
> built-in <...@b4> id when the option is unset, produces no output, or
> fails.
> 
> I renamed the option to b4.custom-msgid-cmd (dropping the "review-"
> prefix) since it now reaches beyond the review TUI.
> 
> Try it out and let me know if that's what you were looking for.

Hm, I tried. But it's not in master afaict and you didn't append a patch
either. So let me know how to try it. :)
