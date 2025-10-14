Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8CCC2E5427
	for <tools@linux.kernel.org>; Tue, 14 Oct 2025 21:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760478573; cv=none; b=QWMC011JyFBhQDVsK9+GKl1UGzkSvm0HjWg1Ws4Z/BBzy+IxCihU+m2EJXY8+NHObCZK9GVVJY/TWdrD+J+spjfH76Sq77Fqy+QsMB471QOtGFTRCXh0yJZvEqPODXzftDn4mgCH8NMJI4i6Okz/a37Z48BAs72Pnm+dp0UMsbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760478573; c=relaxed/simple;
	bh=rx6ffLV+jv/5eYnOyCFoLAbOWpkWeJCeiqkMogGgqEI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uBh8l+6CeOKX81dOMeM9Vd1bmX3psBpsFvaeksfbTYuJ7esrX0an8x6ik04laWosaa4MRFT9Siq81By2ff7TzsLxtYolOUSvDoaL7ayo7ILJG1KAoJmAsqE/oQwaapWYeqEaA4+6/DshSd2rNuvpl+dsRpqYh/E55uK1JjDDzDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kcepZ+uL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kcepZ+uL"
Received: by smtp.kernel.org (Postfix)
	id 9D126C116C6; Tue, 14 Oct 2025 21:49:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5868BC4CEE7;
	Tue, 14 Oct 2025 21:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760478573;
	bh=rx6ffLV+jv/5eYnOyCFoLAbOWpkWeJCeiqkMogGgqEI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kcepZ+uLzT7vLHKDs+awlECq5BraoHweLhZDdv/MtabjR9ZodsjcKRv1RcR0afWl3
	 V+KwUDcXQtesETh9C/fFBP+0s++CIa1VGLGPdFsHIVA0UOv75rhTMNJnws3s7n0H7U
	 V/ynyTCa+XRSNyBp70fkiw0rDrtzVP2ea6G7PRB5xuoNqEtKMZL7UYnAoYmdUQKAOO
	 kviez0vMqV/2wKTM2yz47/KLQ6/V1EbwkPea6PH2z9jNXimfPwcqxznLVC/5qo2TGK
	 LxOi3Fh6s7ls39oKtEshcK5rRH0bAvTiCBfQ5205+dm96YsDnB7bPuHcrBE9g/fmqR
	 ze13eBHpDFAhw==
Date: Tue, 14 Oct 2025 17:49:31 -0400
From: Sasha Levin <sashal@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@kernel.org, tools@kernel.org
Subject: Re: [b4] initial "b4 dig" to supplant Link: trailers
Message-ID: <aO7FayHzTEKVsWAt@laps>
References: <20251010-muscular-camel-of-acumen-00eeaf@lemur>
 <20251014-gorgeous-cougar-of-endeavor-0c5baa@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20251014-gorgeous-cougar-of-endeavor-0c5baa@lemur>

On Tue, Oct 14, 2025 at 05:17:43PM -0400, Konstantin Ryabitsev wrote:
>On Fri, Oct 10, 2025 at 04:47:27PM -0400, Konstantin Ryabitsev wrote:
>
>Seems working on this right before disappearing for the long weekend due to
>Canadian Thanksgiving was not the best choice. :)
>
>I've carefully read everyone's feedback, and made significant changes to how
>"b4 dig" operates. Specifically:
>
>"b4 dig -c [commitish]" will now output a single link to stdout (all other
>output going to stderr), so that it can be piped to other commands. It should
>be the latest matching patch received by lore prior and including the "author
>date" of the commit. This weeds out all ensuing backports and cherry-picking
>efforts.

Nice!

I've tested it a bit and ended up with a few suggestions :)


1. If the provided commit actually has a Link: trailer, we should just use
that(?).


2. Some maintainers re-send patches they've accepted. An example:

$ ~/b4/b4.sh dig -c 54b91e54b113d4f15ab023a44f508251db6e22e7 
Digging into commit 54b91e54b113d4f15ab023a44f508251db6e22e7
Attempting to match by exact patch-id...
Trying to find matching series by patch-id 340e7baae92a71dd5e62a4e8a52245348ff3a0a1 (myers)
Found matching series by patch-id
Will consider promising messages: 2
---
[for-linus][PATCH v2 2/2] tracing: Stop fortify-string from warning in tracing_mark_raw_write()
https://lore.kernel.org/r/20251011194257.341582199@kernel.org

Which doesn't end up pointing to the actual submission. I'm not really sure
whats the "correct" way of addressing this...


3. Date filtering seems to be broken:

$ ~/b4/b4.sh dig -c 41b1f9fcba62b06195e625bb88c1031102892439
Digging into commit 41b1f9fcba62b06195e625bb88c1031102892439
Attempting to match by exact patch-id...
Trying to find matching series by patch-id 3f5f81f85a73d73ff83e8c0cb9a4fe81d5ba4619 (myers)
Grabbing search results from lore.kernel.org
Nothing matching that query.
Attempting to match by author and subject...
Grabbing search results from lore.kernel.org
Nothing matching that query.
Could not find anything matching commit 41b1f9fcba62b06195e625bb88c1031102892439

It doesn't look like lore takes a range in the form of rt:..{date}. We probably need something like:

--- a/src/b4/dig.py
+++ b/src/b4/dig.py
@@ -138,7 +138,7 @@ def dig_commitish(cmdargs: argparse.Namespace) -> None:
          logger.info('Trying to find matching series by patch-id %s (%s)', patch_id, algo)
          # Limit lookup by date prior to the commit date, to weed out any false-positives from
          # backports or from erroneously resent series
-        extra_query = f'AND rt:..{cdate}'
+        extra_query = f'rt:{cdate}'
          logger.debug('extra_query=%s', extra_query)
          msgs = b4.get_msgs_by_patch_id(patch_id, nocache=cmdargs.nocache, extra_query=extra_query)
          if msgs:

At which point:

$ ~/b4/b4.sh dig -c 41b1f9fcba62b06195e625bb88c1031102892439
Digging into commit 41b1f9fcba62b06195e625bb88c1031102892439
Attempting to match by exact patch-id...
Trying to find matching series by patch-id 3f5f81f85a73d73ff83e8c0cb9a4fe81d5ba4619 (myers)
Grabbing search results from lore.kernel.org
Found matching series by patch-id
Will consider promising messages: 1
Grabbing thread from lore.kernel.org/all/20250901215241.14667-1-mwen@igalia.com/t.mbox.gz
---
[PATCH] drm/amd/display: remove output_tf_change flag
https://lore.kernel.org/r/20250901215241.14667-1-mwen@igalia.com


-- 
Thanks,
Sasha
