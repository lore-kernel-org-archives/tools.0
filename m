Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BFE73546E2
	for <tools@linux.kernel.org>; Mon, 22 Jun 2026 10:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782122620; cv=none; b=HUtwdFVkIqgbTjsWhvl7U62Sh5I/gYE/pMyoQzQsn20ZJdCS4E+qR96qyNwT6Usl6cYG7/KZ6vdDmLIunK4HUa1UxpFO1hy0+3ZurDOQzfkqYcAhWI9P6gtjG/fJ/IFBh5ve8CmJpoPfKyPKW9XN8Bk1Dgr9RfF05GD4+UsV60g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782122620; c=relaxed/simple;
	bh=UIrOXKP1Ap6YWiQxLJyK0endSqioCjseIWWIMmpO/S4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OiIdHl7fhUbW7q6toYcLOAocqrnW3WXT/NuovpH2rnrnfLCCLNMY2JN8M03kzsVi2XZy/hwgrkm+FnDvT07n/RbhpVMpSSaM5wC+ajqtL6bNW0sXqN5L+FlM7xet48HSJh5JsVC8JK8vSp0wPkRiJPl7tp5H54g2BJpyqHY2w70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g4yjUs6Q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g4yjUs6Q"
Received: by smtp.kernel.org (Postfix)
	id 51E2A1F00A3A; Mon, 22 Jun 2026 10:03:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 817CF1F000E9;
	Mon, 22 Jun 2026 10:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782122619;
	bh=olNjPiVjQgPHgYZcj7IKfdS2ZCofjgE6atLywotu8e8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=g4yjUs6QZd4FPI2lcRJR8tFegfubCRtkOjZ6zBsW0LyT45JggXNTHa0LPkvU0pPCB
	 iAJEtFLW/LHyzlIJTWOyypGYPqSEIqedG4H4dol1cxK1z8Uxq5n+BgmpFFIgR/0ftZ
	 tK+++kbs4OByRBuYT4PP8x4SJr9leWD0myqw8QepDP+QqXUpi5NcnjAj0f8Lv305ZC
	 BlxlFrNGxlkvpQTKRUDQJVQCfATFLQOUJq918IaH95wEjNvDcWxaZhlH8Eet4gCR/9
	 zRyVeeZQ6CRubF+jZ0NP5GvXbrF3ByYePEEAtJkdRcMRxAVlOjIth0Az2wnx3Zbg1O
	 PPrvhVs/HhqSQ==
Date: Mon, 22 Jun 2026 12:03:36 +0200
From: Christian Brauner <brauner@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: Re: [PATCH b4] review: allow a custom Message-Id command for TUI
 replies
Message-ID: <20260622-chiffrieren-inlandsreise-bares-0c58cabbea4c@brauner>
References: <20260522-review-msgid-cmd-v1-1-facc71f2e084@kernel.org>
 <20260609-loutish-busy-curassow-33ac37@meerkat>
 <20260609-terrestrial-military-honeybee-d6ffcc@meerkat>
 <20260619-desorientiert-altschulden-demonstrieren-2f069e643486@brauner>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260619-desorientiert-altschulden-demonstrieren-2f069e643486@brauner>

On Fri, Jun 19, 2026 at 10:05:36AM +0200, Christian Brauner wrote:
> On Tue, Jun 09, 2026 at 09:47:39PM -0400, Konstantin Ryabitsev wrote:
> > On Tue, Jun 09, 2026 at 09:11:01PM -0400, Konstantin Ryabitsev wrote:
> > > This patch won't quite cover every possible case -- e.g. it will miss the
> > > thank-you notes that are still sent with the same code path as "b4 ty". Let
> > > me think of a more global way to plug this in that won't clash with
> > > message-id's that are generated for series with "b4 prep/send".
> > 
> > Rather than adding a parallel make_msgid_with_cmd() helper, I folded the
> > hook directly into make_msgid() behind an allow_custom_msgid_cmd flag,
> > and flipped that flag on at exactly the reply/notification call sites:
> > review replies, follow-up replies, and ty notes. When the flag is set
> > and b4.custom-msgid-cmd is configured, b4 runs the command and uses its
> > stdout as the Message-Id (angle brackets optional), falling back to the
> > built-in <...@b4> id when the option is unset, produces no output, or
> > fails.
> > 
> > I renamed the option to b4.custom-msgid-cmd (dropping the "review-"
> > prefix) since it now reaches beyond the review TUI.
> > 
> > Try it out and let me know if that's what you were looking for.
> 
> Hm, I tried. But it's not in master afaict and you didn't append a patch
> either. So let me know how to try it. :)

Thanks for pushing it out now! It works perfectly.
