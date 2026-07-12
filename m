Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0842DC32E
	for <tools@linux.kernel.org>; Sun, 12 Jul 2026 11:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783854418; cv=none; b=Gd9q9FqDtsCHAG4qd/vIhAlbNDdYmGnfkiGXw/oqamx5wGlMRoWIdm3R/ydVrbEVWYJ9pQ8mHKXb8g/ASgiwW0j4JUtyTbSByYzt6S/lW4zNWxi6giXdwEdS3eH5Y9hRuMxrfJrD7lvLbT1pkuia5EsPTNg9D8AqIXDeJVkllu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783854418; c=relaxed/simple;
	bh=T0uJRKY/hffTZuZxixSc0Cj/wiy6Rb8obChU/OpJHYg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SCIgq6K/dr6lq0xQgreG/urU3snuDxxeXkxuSW9aFHRc0CRr5ZWCmUSlDjrchFmT02GxTvysdk1qyex7cBnzlkYuAenV9DwjRKf9Mm9N8lFBACkzvpCH91Fdi/nRqHfpdRMmthEsrN41WgeA+LTxhVrsjDxfmwG0WLK7Hbicvt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PQh5h0qy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PQh5h0qy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D19A51F000E9;
	Sun, 12 Jul 2026 11:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783854416;
	bh=T0uJRKY/hffTZuZxixSc0Cj/wiy6Rb8obChU/OpJHYg=;
	h=Date:From:To:Cc:Subject;
	b=PQh5h0qy6Q8nibEc/ejYLM0+FDp0f6TVt4xOmpPZxaxZyc4Mup+UcuMJWKL4picfs
	 cvOY6Gld7VDJLam3/smIt029VyDNQr3xoxy6EQoYXab1qTvqV4shyjXDGtlYIzsPo6
	 u+NISS1O4n0SUHOzhgwPNLsOrpH1/TkmH5WaJebOjKLrcKv2KEGI0Aqw0iZS9aAD2w
	 464b8lhs7SkcrIns5ZOToyCSRlZLg701f3BaDdeLgPVVOS8S5/tqKY7MGquRQwZ/lk
	 NoUoZRteIszmjKm+iaarhbiSZOuQ9bbW7PayxR82prR2jD6B8jccT3fTyZvpw0Lqxk
	 StlWCYscqz6Og==
Date: Sun, 12 Jul 2026 12:06:45 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: b4 review not picking up v2 with prefix?
Message-ID: <alNzLxOk2V04cNgo@lucifer>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Konstantin,

Thanks for b4 review is a great tool that I'm now integrating into my workflow
(alongside b4 for sending series which I previously... resisted :)

So maybe an edge case here, and sorry for lazy report vs. patching (just so much
to do elsewhere) but for series [0] I set a mm-hotfixes prefix via:

$ b4 prep --set-prefixes 'mm-hotfixes'

Which is a convention in mm used sometimes to highlight that a series/patch
is a hotfix.

I have the v1 tracked ([1]), but when doing an update via 'u' or 'U' in the
review tui it doesn't seem to find the v2.

To make things more complicated, I sent patches separately previously ([2]
and [3]) which I decided to combine into the series sent in [0].

$ b4 --version
0.15.2

Thanks, Lorenzo

(And yes I am using b4 review to track my own series as well as reviews :P
makes it easier for me to keep track of what I've sent also :)

[0]:https://lore.kernel.org/linux-mm/20260712-series-vmap-race-fix-v2-0-ad134cc3a12a@kernel.org/
[1]:https://lore.kernel.org/all/20260710-series-vmap-race-fix-v1-0-5b3794c113fe@kernel.org/
[2]:https://lore.kernel.org/all/20260710-fix-cpa-ptdump-race-v1-1-d898699a7417@kernel.org/
[3]:https://lore.kernel.org/all/20260710-b4-fix-non-init_mm-ptdump-v1-1-2d40982c98ec@kernel.org/
