Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0C4304BBC
	for <tools@linux.kernel.org>; Tue, 17 Mar 2026 22:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773787196; cv=none; b=eYKVlGQ49FDuCiSjCv3PUohCUvl6vQN17e3jZfl4txLNfX7Ok7jdi/Aij+ZbtFVLZkHNOVHzoWh78nx4Bs+LgJr7pG2kuFjw1pjFuJyaxLkdUWOeoP37uNUDYtNVTFc1Ce0R6kGuQ6alV4GHyJ3iyAyDg+MwdzGYeUa1WMQnGIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773787196; c=relaxed/simple;
	bh=E3MKj7h0CgshHx2n4ztUc4gcGXPa10J3JcTjkvUQ2QA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sBVco2FwirXv4W1ysRXEwU9rkbSXekClOF8ruAR4BirqgV2kLN+pXpDqK7sHfWB42cHPAq2gfn+vFucyd6Wk8pwJEH77lWwfX4soxoHQ4wfdaMKJYDD920u9BWpRhUi2VI4aCcCJPGFfj3w/7I50zjYR7W8VOzZ23t2jLkilq70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gQjcD10z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gQjcD10z"
Received: by smtp.kernel.org (Postfix)
	id 1EA69C2BCAF; Tue, 17 Mar 2026 22:39:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBAE8C4CEF7;
	Tue, 17 Mar 2026 22:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773787196;
	bh=E3MKj7h0CgshHx2n4ztUc4gcGXPa10J3JcTjkvUQ2QA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gQjcD10zcbijTLU7uWyz61aMSPpb9JAo+UTrduWg+hxsEoqFDvUjgNQe+GnNSwjtJ
	 v8I9AbDGaRToJA41I0awx3OfQ8nnou1ii2DsW3x8rvP5jQP07e6zX+gP3Kwx4KNd+V
	 J3GeJPow+JS7jzI5p3/M6UwCIswHuDa+uvkkRWp/JRs/+dbjqg2jfzjkb6koY70KIO
	 s+7XSKfcGcGh18lzXFt17eDTg2F7ja4QYvRRaAC4ZGWZI3wxcu/6I+Ih+7rpaHkFvY
	 xO3s/hTbCiNQBjoWdwajOf7l5Dc7bqZyK/F7r2jCk7GckF4LXAawBz4JpVP5vmGsM0
	 PH1N2BNrub5kg==
Date: Tue, 17 Mar 2026 18:39:54 -0400
From: Konstantin Ryabitsev <mricon@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: users@kernel.org, tools@kernel.org
Subject: Re: b4 review available in master
Message-ID: <20260317-crazy-belligerent-llama-a14ba6@lemur>
References: <20260227-imported-aromatic-guppy-ad3dca@lemur>
 <87tsuffj7h.fsf@trenco.lwn.net>
 <87h5qffikk.fsf@trenco.lwn.net>
 <20260316-quizzical-raccoon-of-refinement-d88fdb@lemur>
 <87qzpieeb5.fsf@trenco.lwn.net>
 <20260317-starling-of-delightful-exercise-3472ce@lemur>
 <20260317-optimistic-impartial-kudu-deefac@lemur>
 <87o6km86zm.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87o6km86zm.fsf@trenco.lwn.net>

On Tue, Mar 17, 2026 at 03:46:05PM -0600, Jonathan Corbet wrote:
> > Please try it out again. Your old bugs should be gone and replaced by whole
> > new bugs!
> 
> So it's still behaving a bit strangely, at least that's how it seems to
> me.  I tried adding comments to a patch, doing my usual trick of
> trimming out stuff that is being skipped over.

You don't need to do that. Just find the stuff you want commenting on. We'll
take care of the rest! :)

But, I'm able to reproduce what you're seeing -- trimming content doesn't do
the right thing. Let me see if I can make this a lot more relaxed.

(But, for now, just add your comments without trimming anything -- the
resulting email will be trimmed automatically).

Regards,
-- 
KR
