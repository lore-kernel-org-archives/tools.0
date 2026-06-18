Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7052B3F7AAC
	for <tools@linux.kernel.org>; Thu, 18 Jun 2026 18:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781807462; cv=none; b=C9U5FxraeuVvOyhVpPeqf/pLHCgW84sgsU+cT/+lmpZuAe9hA0OLBsLll0n4dnaLV7xlmOTtijYMX0PAS8fgGt6w1snSTZVIfs0+ekycGL353Gi+CxNKbn1y+8kfwpP0lEcmsXSfkGuJYMrPuSnaNKxGaKkDZr+0H/xI0hEI86Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781807462; c=relaxed/simple;
	bh=8K94LZDtfPpO5yYDWBuP/3nzptOoD6KokBOJEvWV1SI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U5ZBu8Uiz1PDtbIvGNG9FjxWoU+a/bn2DiM+zKvxYTGsJ9NczwrtLE0KjZt98nXjOGR6C3dGyj8Ml3la+VkDKwtaIms+H6rlRw3XqmLsC5IyujQcEK6WwtN6sIwUcrKfrbyWp9+ISuFMOdX3q31MuRXB9iWJY5fmfhnndiunm1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d8LVF8N7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d8LVF8N7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53B291F000E9;
	Thu, 18 Jun 2026 18:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781807459;
	bh=jgkgupsd3L0cO9sXxkWo8ko3MWP4rx8lUdt6nHOgfnk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=d8LVF8N7toJYrZ5es2TioKHDlySKw58mJ2So1TBLjNsPHq+3m5PpxSurh+4uRCD3Q
	 tQOqsmMCrtrmMbgh2HWhFuj7hppZTtR0wyGGWoBGdYHBcBIAXcNJCQMQBOuDBd9Sl7
	 anGhGt+hOSc9aBfUk1vqWcyqczEDLSpoGY3OfA41JPpXQ7UUCPd5OezXqbOhn35PVm
	 dhIRxvEzIuCRAn7m4XV49+ns2ABQ4syKPUUXnhXdkDwPtt1lB8BMt/aA2XCBnOE8dp
	 xSl01mT1EA7jNkzE5GNOLZGf/C34A7HZsNcbK/GTiCUr8vXJGWCEVOOFXgU04BJYWJ
	 fOWLf4F+zuH1A==
Date: Thu, 18 Jun 2026 14:30:57 -0400
From: Konstantin Ryabitsev <mricon@kernel.org>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: tools@linux.kernel.org
Subject: Re: possible fuzziness for b4 trailers -u?
Message-ID: <20260618-wooden-dragon-of-devotion-bcece2@meerkat>
References: <b0e433ff-fa15-4715-ae0a-7f23da217d51@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b0e433ff-fa15-4715-ae0a-7f23da217d51@kernel.org>

On Thu, Jun 18, 2026 at 10:50:52AM +0200, Vlastimil Babka (SUSE) wrote:
> I sometimes run b4 trailers -u to collect tags on patches that have been
> meanwhile slightly modified in git since the posting. Sometimes it's on the
> b4/$cover_topic branch as a submitter, sometimes it's already applied (but
> not stable as in no history rewrite) on a maintainer tree branch (I do use
> --since-commit and doublecheck the result of the update closely since some
> past surprises...).
> 
> AFAICS the trailers update relies only patch-id (?) so it will miss the tags
> when patch-id changes due to these local modifications. Could it try some
> fuzzy matching in that case? Some ideas:
> 
> - in b4/$cover_topic branch the metadata allows finding the posting thread
> and matching the patch subject
>   - ok, subject can sometimes change too, but not so often as the code
> 
> - in maintainer tree branch, there's usually a patch.msgid.link Link: that
> can lead to the given patch rather deterministically.

This was actually easier than I'd thought, because we already did the bulk of
this logic for "b4 dig". The latest master has a new --fuzzy flag to `b4
trailers`, which you can also couple with the new --interactive flag, which
should let you review the trailers before you actually apply them.

Try it out and let me know if this is what you were looking for.

Cheers,
-K
