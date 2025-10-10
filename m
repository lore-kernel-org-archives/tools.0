Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241C8258ED1
	for <tools@linux.kernel.org>; Fri, 10 Oct 2025 20:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760129249; cv=none; b=szLLQgNIu+RS7hurqlEi/7B84Q8FFYCh13sUfaGQ3vVjqle8xJRDemOcVxoyzdmIKoSRnzMiZAwOlRc1VONkY8JwbwBWdxxKdhTHpfdUzNKmUEAf3B91yuB0J33oCxiGf/UzB8GZo6Zel3X7JQjObS/49beziSBwKOArZi8CHao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760129249; c=relaxed/simple;
	bh=noPf+echm75hlx37BfOwhVCPUdGvBTbLig0DlCi3Kvc=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ldZ+TPR4aU5zMLKXcqUmbRFAwHr5ZotjEP4IqrADgT0pqp1VMPa6u95aVMeWvhsqDUr/4JeHmcW9z3s6seLBJ0USUFTYBwFdlO5XjBl205QggD3dsy9GpjCuzb0oYj8+7DFG2tjOSW5FeojgxekUwVoadATMzcaG6gIUf3HMNAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=mT4dQEKl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="mT4dQEKl"
Received: by smtp.kernel.org (Postfix)
	id C2B43C4CEF5; Fri, 10 Oct 2025 20:47:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9362FC4CEF1;
	Fri, 10 Oct 2025 20:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1760129248;
	bh=noPf+echm75hlx37BfOwhVCPUdGvBTbLig0DlCi3Kvc=;
	h=Date:From:To:Subject:From;
	b=mT4dQEKlQSjSRP8c7LlbFUUy/0OAf9zzRS+vLfPynBkpJ/weAPIBmAqO3WHFOGK/9
	 4oIuW2RcUR7mQmuuEwNybzS6fg1NFAoOgkAIc1uhTnzDHX0+DPktAixLCG+8qEkiqC
	 jYtbfIDvjaDSAYEK2b/BLYQgKThzv4X8E2MGwm9w=
Date: Fri, 10 Oct 2025 16:47:27 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: users@kernel.org, tools@kernel.org
Subject: [b4] initial "b4 dig" to supplant Link: trailers
Message-ID: <20251010-muscular-camel-of-acumen-00eeaf@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi, all:

I just committed the initial implementation of "b4 dig" that will hopefully
make it easier for maintainers to figure out where a commit came from now that
we're actively trying to phase out Link: trailers. For now, it only does
"b4 dig -c [commitish]", e.g. taking some random commits from today:

Matching the exact patch-id:

	$ b4 dig -c ce740955b238761ec1d8cf0590d7e6802d3a813a
	Digging into commit ce740955b238761ec1d8cf0590d7e6802d3a813a
	Attempting to match by exact patch-id...
	Trying to find matching series by patch-id 469ebf2cf560b32106f206e389752deb5f741b6d
	Grabbing search results from lore.kernel.org
	Found matching series by patch-id
	---
	This patch is present in the following series:
	---
	  v3: [PATCH v3] dt-bindings: bus: renesas-bsc: allow additional properties
		  https://lore.kernel.org/r/20251009183630.5451-2-wsa+renesas@sang-engineering.com

No match looking up by exact patch-id (and trying myers, then histogram, then
patience algorithms with no success):

	$ b4 dig -c a29ad21b988652dc60aa99c6d3b1e3d52dc69c30
	Digging into commit a29ad21b988652dc60aa99c6d3b1e3d52dc69c30
	Attempting to match by exact patch-id...
	Trying to find matching series by patch-id abc964d5d53674450f7e553bbe031edc61ac3308
	Grabbing search results from lore.kernel.org
	Nothing matching that query.
	Trying to find matching series by patch-id adf0918395a1a601a8d54d7d26446aadfb6101c2
	Grabbing search results from lore.kernel.org
	Nothing matching that query.
	Attempting to match by author and subject...
	Grabbing search results from lore.kernel.org
	Found 22 matching messages
	---
	This patch is present in the following series:
	---
	  v3: [PATCH v3] tpm: Prevent local DOS via tpm/tpm0/ppi/*operations
		  https://lore.kernel.org/r/20250829175152.9704-2-daleksan@redhat.com
	  v4: [PATCH v4] tpm: Prevent local DOS via tpm/tpm0/ppi/*operations
		  https://lore.kernel.org/r/20250902142429.14041-2-daleksan@redhat.com
	  v5: [PATCH v5] tpm: Prevent local DOS via tpm/tpm0/ppi/*operations
		  https://lore.kernel.org/r/20250915210829.6661-1-daleksan@redhat.com

There are known annoyances:

1. We don't currently weed out AUTOSEL/stable backports, so older commits may
   end up in lots of false positives for now. I've not yet figured out how to
   avoid this without hardcoding it to be kernel-specific.
2. Patches that were sent as part of one series and then as part of another
   series (by the same author) don't currently do the right thing.

I'll work on getting that fixed, but for now if you're missing the presence of
Link: trailers, please test it out.

-K
