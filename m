Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BAED2FB0A5
	for <tools@linux.kernel.org>; Mon, 13 Oct 2025 21:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.9.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760392784; cv=none; b=HpllKtVBscdo94+ejIZoEfOs5Y76MSPmMHRA8gp/epx1mLBq74EUyGV80XUdh59NqEEZTxgNLHMhCc8AMyVvS41vSwxjvIiz4ZuzVv4O+Z5qCgxiQ3diC0XWehYVCMXXe76werhYzQ3Qy8Dx+8uQKfeZ+fz/tk76NefPzYltmw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760392784; c=relaxed/simple;
	bh=QHs/a17wGY7tS1+6DkTlci2x+ag7xf0Ya6sD1MtczXI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rAjBmusvRza996HpxsfsRPRaBVCixt5BIqtcu5jCeH+zMR0j4y9clN5gRZUTra2eqMcjfJnNMUhUIfkJ1DcZoDkhdWp8Rse+k53xsm6ZLT9ysQj2B5OFIonf8ojLTyI+ZYlu4sKDyfSriSPk+vnmx7GzahPVS385vtz82FeINcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu; spf=pass smtp.mailfrom=mit.edu; dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b=SNIuB81+; arc=none smtp.client-ip=18.9.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b="SNIuB81+"
Received: from trampoline.thunk.org (pool-173-48-82-170.bstnma.fios.verizon.net [173.48.82.170])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 59DLxQax009583
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Oct 2025 17:59:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1760392768; bh=IKcsPHCS6jBNgvbfPZd5WVvXSFyOl+9izf54a3Kdjo8=;
	h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
	b=SNIuB81+VNTh8MOpBmFRkLn3C/C/h5CqvwXUa04pOptjzyiN/iypIq2Ftbbh4Qjmi
	 88jAyWdLehJt0R0iFCKtZSGW8/Pb8pCdtJ3gFNlXvSwTx0nIYJt5F+KGmF3rM3CYn9
	 nZmgAl8hPVYBoHYgXy1nkTqZbL0AlFGURRTB500hS/voDzOXbN9tqxqULoVcNEdVCl
	 nhU0LCDbDYrYbtY8QhMKkBdnvTgTbKpLQ1M4SSSmsr0LKL/PI3nptLWK2itbgknHQ4
	 W54paRDDqv2lhXgS9sJHh3DaeIn5O/C3PIRyWQe4aOLhDjdo/zFjHfk3LCypg9/zyy
	 WIpaR0C1upqYA==
Received: by trampoline.thunk.org (Postfix, from userid 15806)
	id 21E4D2E00D9; Mon, 13 Oct 2025 17:59:26 -0400 (EDT)
Date: Mon, 13 Oct 2025 17:59:26 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Linus Torvalds <torvalds@linuxfoundation.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        users@kernel.org, tools@linux.kernel.org
Subject: Re: In defense of Link (was Re: [b4] initial "b4 dig" to supplant
 Link: trailers)
Message-ID: <20251013215926.GK354523@mit.edu>
References: <CABgObfY5agTRsB-bCqCYbA0erFn5cVbujtTNBiCti8g_68nCWg@mail.gmail.com>
 <20251013081536-mutt-send-email-mst@kernel.org>
 <CAHk-=whSShtPG1_+02Cc4yDuEJxVqX=G8tAx0gW7UjA7cuBp-w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=whSShtPG1_+02Cc4yDuEJxVqX=G8tAx0gW7UjA7cuBp-w@mail.gmail.com>

On Mon, Oct 13, 2025 at 10:00:01AM -0700, Linus Torvalds wrote:
> What's the real argument against "b4 dig"?

At the moment:

   https://goomics.net/50

"There are two ways of doing things at Google; the deprecated way
(e.g., Link Tag), and the one which isn't ready yet."   :-)

It's *close*, and it's not yet available to most developers unless
they are running out of b4's git HEAD.  I did try using it on a
selection of patches, and I was pleasantly surprised how often it
worked.  But it's definitely not perfect.  For example:

% /usr/projects/linux/b4/b4.sh dig -c 1d3ad183943b38eec2acf72a0ae98e635dc8456b
Digging into commit 1d3ad183943b38eec2acf72a0ae98e635dc8456b
Attempting to match by exact patch-id...
Trying to find matching series by patch-id 7f91856ff1f9b87a4fcaf69134fc715a706cb86a
Grabbing search results from lore.kernel.org
WARNING: duplicate messages found at index 1
   Subject 1: Forwarded: [PATCH v3] ext4: detect invalid INLINE_DATA + EXTENTS flag combination
   Subject 2: Forwarded: [PATCH v4] ext4: detect invalid INLINE_DATA + EXTENTS flag combination
  2 is not a reply... assume additional patch
WARNING: duplicate messages found at index 1
   Subject 1: Forwarded: [PATCH v2] ext4: detect invalid INLINE_DATA + EXTENTS flag combination
   Subject 2: Forwarded: [PATCH v3] ext4: detect invalid INLINE_DATA + EXTENTS flag combination
  2 is not a reply... assume additional patch
WARNING: duplicate messages found at index 1
   Subject 1: Forwarded: [PATCH] ext4: validate extent entries before caching in ext4_find_extent()
   Subject 2: Forwarded: [PATCH v2] ext4: detect invalid INLINE_DATA + EXTENTS flag combination
  2 is not a reply... assume additional patch
WARNING: duplicate messages found at index 1
   Subject 1: Forwarded: [PATCH] ext4: validate extent entries before caching in ext4_find_extent()
   Subject 2: Forwarded: [PATCH] ext4: validate extent entries before caching in ext4_find_extent()
  2 is not a reply... assume additional patch
WARNING: duplicate messages found at index 1
   Subject 1: Forwarded: [PATCH] ext4: fix BUG_ON in ext4_es_cache_extent due to out-of-order extents
   Subject 2: Forwarded: [PATCH] ext4: validate extent entries before caching in ext4_find_extent()
  2 is not a reply... assume additional patch
WARNING: duplicate messages found at index 1
   Subject 1: Forwarded: [PATCH] ext4: fix BUG_ON in ext4_es_cache_extent due to out-of-order extents
   Subject 2: Forwarded: [PATCH] ext4: fix BUG_ON in ext4_es_cache_extent due to out-of-order extents
  2 is not a reply... assume additional patch
WARNING: duplicate messages found at index 1
   Subject 1: Forwarded: [PATCH] ext4: Fix extent boundary validation in extent tree
   Subject 2: Forwarded: [PATCH] ext4: fix BUG_ON in ext4_es_cache_extent due to out-of-order extents
  2 is not a reply... assume additional patch
Found matching series by patch-id
---
This patch is present in the following series:
---
  v1: Forwarded: [PATCH] ext4: Fix extent boundary validation in extent tree
      https://lore.kernel.org/r/68d8e78f.050a0220.25d7ab.04c8.GAE@google.com
  v4: [PATCH v4] ext4: detect invalid INLINE_DATA + EXTENTS flag combination
      https://lore.kernel.org/r/20250930112810.315095-1-kartikey406@gmail.com

If you look at the first Lore URL, it is absolutely NOT CORRECT.  This
isn't purely b4's fault.  the problem is we have some developers who
are blindly sending random patches bashing at the code to see if they
can make syzbot stop complaining.  But it results in a fairly
confusing patch history.


I can also imagine some UI polish; for excample, a bunch of *how* b4
dig tried to find thigns should probably only show up with a -v
verbose option.

And when displaying thje results, it would be useful if it (a) printed
the date (and how it relates to the commit date), and (b) flag whether
the patch-id is an exact match, or whether it isn't with perhaps some
kind of diference score, so the human being knows whether they need to
take a closer look.

					- Ted

P.S.  "Mindless" is also a way of saying, "decreasing the load on
overloaded maintainers".  Something like a mindless inclusion of a
Message-ID tag would add an extra 60-80 characters of overhead into
the commit trailer; I can understand why Linus might not like it, but
from the perspectve of saving time from maintainers, I'm going to be
selfish enough to want something that saves me time.

If "b4 dig" can be made good enough that 99% of the time, it works
just as well as mnually inserted metadata, great!  It's just that "b4
dig" is still a little rough around the edges, and I suspect many
people haven't tried using it yet.  Hence the interest in other
alternatives...
