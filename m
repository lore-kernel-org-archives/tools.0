Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E60224237
	for <tools@linux.kernel.org>; Tue,  8 Apr 2025 14:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744123900; cv=none; b=iiBOwGKghOvUCP4g19ZWxrAgHGt37JD8HtTT0eD5VWib/SDtzlQPEGfD5h5mSt0K8ObirWEk+l4yKg1KFqQXh1K9bK3NzHMqFFtWzk86/9RrJVg1ZTYmEuQbT3Gz9FOljMURPIeOCPgjzQyHW/80BEHOc2vuvq0p7VS74iMyrik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744123900; c=relaxed/simple;
	bh=bpUemJwxG6558NssMVxJos5HzUGcuxNbvtg2fuCdb/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dwh4KCZe5DZt3pwSIn4rlQPuB7dEEdBDc0+mXFcoof7n/d/0DwmNujMHSLSWWyX4YLaDDOGYLPng3atxbMzwKjY3LEgJ3qQd7cGpmq5mOHrsLimie1kLFQ10WhgxnjHOiGWCZ4I1jMQpz0K/R741OLxO53E/OmJhgHBO8ORp7kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=0CnMoX9U; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="0CnMoX9U"
Received: by smtp.kernel.org (Postfix)
	id A590FC4CEEA; Tue,  8 Apr 2025 14:51:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F3B6C4CEE5;
	Tue,  8 Apr 2025 14:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744123899;
	bh=bpUemJwxG6558NssMVxJos5HzUGcuxNbvtg2fuCdb/E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0CnMoX9UCKQ5WxI+vcTYo21Efwoxq6JuorQ3d0a/ldzZ5WVp+DYUfkigD6Am9FwT3
	 n+XEI+c2MzDkZscGI8OO6ntHwrg5mqLEvUEfF9ww9wQV4ORk7mLtAgBorsCeFia9+m
	 KFNM7QqBsESPIyCWU5MReo4TwL2vZDG9ZMwr3IBk=
Date: Tue, 8 Apr 2025 10:51:38 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: tools@kernel.org, Anthony PERARD <anthony.perard@vates.tech>, 
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: b4 inserts Reviewed-by tag from unrelated thread/patch
Message-ID: <20250408-wondrous-sturgeon-of-energy-feb3e1@meerkat>
References: <b19f33bc-df96-4365-bef4-7f1393fc7ce3@citrix.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b19f33bc-df96-4365-bef4-7f1393fc7ce3@citrix.com>

On Tue, Apr 08, 2025 at 02:18:42PM +0100, Andrew Cooper wrote:
> Hello,
> 
> This is partly my fault for not double checking well enough, but it
> turns out I've committed a false Reviewed-by tag.  (Anthony does
> typically review patches of this nature, so I thought nothing of it when
> b4 told me that he'd reviewed one of the patches.)
> 
> I've minimised a repro to:
> 
> b4 shazam
> cover.7da1777882774486a13e6f39ff4a2096f6b7901e.1744028549.git-series.marmarek@invisiblethingslab.com
> -P4

Thank you, this is very helpful.

> wherein the analysis somehow decides that "Re: [PATCH 07/12] libxl:
> Allow stubdomain to control interupts of PCI device" is related, and has
> inserted the R-by tag from that thread.

This triggers a bug that I suspect has to do with a "/" in one of the
message-id's. Basically:

- [PATCH 4/12] in your series is [PATCH 1/12] in that other series, which is
  how this other series is getting pulled in.

- Antony sent a reviewed-by to a different patch in that other series (7/12),
  but when b4 walks up the references, it somehow messes up and misattributes
  that reviewed-by as if it was sent to the cover letter, not just to 7/12.
  *This is the bug that I need to fix.*

- When a tag is sent to a cover, we propagate it to all patches in that
  series, which is how your patch 4/12 gets Anthony's reviewed-by.

I'll work on getting this fixed.

-K

bugspray tag me
