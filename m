Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE57F46EC71
	for <tools@linux.kernel.org>; Tue, 21 Jul 2026 19:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784660569; cv=none; b=NCxHigeHaRXVKE+iTqpRKV3/KGk79omJp3tDs3Wy8q3nrtDe5v/wxxikl4/U/CuwVT+xawl8I694xhTCWzu3Fwl/RNipF72mI3YIu/WSLOIqDj9fR4KNBJoF0KFMnU9WojAsX4hOQ+mzWIH9tjODuWBq4qmvDIN1K9HoqRDO2tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784660569; c=relaxed/simple;
	bh=8n6rqTg0q++f8h06RKSSUBXNCLONyjLRDL6TvsJ0b8E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PF5/YeunV+ZwctstGhru9wtCGXfTZmVd8XYq2O1aEW7e08d2RJI06ZQJrTEgHt9UWXNge7wvlU75QK9gT7bX47mXzsfrQJErfh22DmO0XyHsVALNHRT83a56YTWzc3SNDretgc3T/velY2SDG87bsBw/6JbE/gD/NBIGKft5eFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=q/4OJTJ+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="q/4OJTJ+"
Received: by smtp.kernel.org (Postfix)
	id CF3B31F00A3D; Tue, 21 Jul 2026 19:02:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C7021F00A3A;
	Tue, 21 Jul 2026 19:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1784660567;
	bh=0u2caySyhh/7P7snoVgxZ5Lh4BoTv84a95SGxskDTiE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=q/4OJTJ+VbTrOdCBgDom+5f2DBpAMOihzn2/nQ3jq35pYslKBSEd7dc/e5MbwalWD
	 G55WjTi55OAi+Z/LG4hDqEQEvgCUSII0epoLQl80iIm6j/KCky7pGFnDiCT+6KYKja
	 HN2B7xbNKciYA5klIKPAYxLjDAV34Vobzyc/V6Po=
Date: Tue, 21 Jul 2026 15:02:45 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Cc: "Kernel.org Tools" <tools@kernel.org>, 
	"Claude Opus 4.6" <noreply@anthropic.com>
Subject: Re: [PATCH liblore] utils: extract message-ID before clean_header to
 fix Gnus In-Reply-To
Message-ID: <20260721-hypersonic-phoenix-of-prosperity-dbe7ab@meerkat>
References: <20260721-fix-gnus-in-reply-to-v1-1-630a4ea4f696@redhat.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260721-fix-gnus-in-reply-to-v1-1-630a4ea4f696@redhat.com>

On Tue, Jul 21, 2026 at 11:41:51AM +0400, Marc-André Lureau wrote:
> When an In-Reply-To header contains both a message-ID and RFC 2047
> encoded words (as produced by Gnus), clean_header() would enter the
> email-address parsing path and destroy the message-ID.  This caused
> get_clean_msgid() to return None for the In-Reply-To header, making
> the follow-up trailer logic fall back to References and pick the
> cover letter as parent, which then broadcast the trailer to all
> patches via add_cover_trailers().
> 
> tests: add test for get_clean_msgid with Gnus-style In-Reply-To

Thanks for this -- I didn't take it directly, because looking closer at the
code I realized that using clean_header() was wrong here in the first place,
so the code could be simplified to only ever use the raw regex. I've pushed
the commit to master and will try to release 0.8.1 soon so other projects pick
this up as well.

Thanks!

-K
