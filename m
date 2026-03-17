Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC902AD37
	for <tools@linux.kernel.org>; Tue, 17 Mar 2026 00:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773706362; cv=none; b=VZyVFQBNv4dPIMyi/qDtAZt5YjFXF4mZGj8dXd7elUzwf0KWBpQ5WadPnzGqBqdXrEGgzZ19ksGxzFuk6AryilapFRITC7idGw8avbwcmvNDz1wshJ9xP2XBkv4Li4AZehveopFWnj/y3WjhAoDoK8EB4i3mLr6mDiKDlX2niCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773706362; c=relaxed/simple;
	bh=LBIHU32lETj0ufPxlJFrmBiYI+tYuw2khTU8eJ5XjwE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=csu3r0ll1T9JxVTHxuYggOzXmXhrPYeGRm2y7dEkXFaFqbl7CnI0GBTZwUWahmqjI7Yf0qv0u2DflQLyyw5KTlVevT4GWaQQJAToNbJLw1uRWXQr3pebtP0uzlqayjkLaSV9M05tWNSbqHUss4cA3cxySCyOJunBFIYIdZpLW28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=od4v0IfD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="od4v0IfD"
Received: by smtp.kernel.org (Postfix)
	id 212E8C19425; Tue, 17 Mar 2026 00:12:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB4DBC19421;
	Tue, 17 Mar 2026 00:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773706362;
	bh=LBIHU32lETj0ufPxlJFrmBiYI+tYuw2khTU8eJ5XjwE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=od4v0IfDiW9ALC0nqEAF+cqaZL3ch+OtmPlD26qHgNzj2JaU5GFnDZxEagxzKNmds
	 qQaSGKQQfEoINVbboRhTHRDVKOoScTYAcuSzSJH9g89HVF5/DW7kYcrqZGu70XPahG
	 3Uit+XpYBU2T7FwvIeFesGGZJe+bDzlNLNm91BoBux1u7nexaz+whgO2ikKQmsaiRS
	 s5JxZzgGzUUdXFm6jDbs350bxXjLCmPGoLVnRuWGxxmiyXgGuNiCltuYbqRl91ZoEo
	 86DWtEkYdnWL8KwFc5q8Wq24ICt4tP1BJH1QnTH+PIB46DItj9Fksth5wEU5/Syo4p
	 SOX9RVRqXZAaw==
Date: Mon, 16 Mar 2026 20:12:40 -0400
From: Konstantin Ryabitsev <mricon@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: users@kernel.org, tools@kernel.org
Subject: Re: b4 review available in master
Message-ID: <20260316-thick-stimulating-skink-af48a4@lemur>
References: <20260227-imported-aromatic-guppy-ad3dca@lemur>
 <87tsuffj7h.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87tsuffj7h.fsf@trenco.lwn.net>

On Mon, Mar 16, 2026 at 05:28:02PM -0600, Jonathan Corbet wrote:
> So I've been playing with this a bit - fun stuff!  A few initial
> comments.
> 
> Let me be the N+1th to complain about the color scheme.

No, you're the 2nd, actually. :)

> Dark mode just isn't my thing...  and whoever designed "textual-light" has drunk
> copious amounts of the low-contrast koolaid. 

You can see a bunch of them if you press ctrl+p to bring up the pallette and
select "Theme". If you find the one you like, you can set that via
"TEXTUAL_THEME" env var.

> I used it to bring in a series and comment on a patch.  Nice
> but... there doesn't seem to be a way to comment on the changelog?

Just pressing "r" to reply should bring up the usual reply with everything
quoted, unless we're actually stripping the basement there. The recommended
workflow is to add your inline comments first and then press "r" -- this
*should* load up the commit message with your inline comments. Or you can jump
to "r" directly and work with it as with any email client.

If there are parts missing in quoted content, please let me know!

> Having descended onto a 30-part Mauro marathon, I can't a way to get
> back to the main screen showing all of the tracked patches...?  "q" just
> drops me out entirely.

This is a gotcha. If you're in a review branch, we just show you the review
branch and skip the tracking app -- since we assume you just want to work on
the branch that you have checked out. There should be a big long-lasting
pop-up that tells you how to get back to the tracking app (switch back to a
non-review branch).

> When can we have it as an Emacs mode? :)

Uh...

> Thanks for all of this,

Thanks for trying it out!

-- 
KR
