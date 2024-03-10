Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8804D1C3E
	for <tools@linux.kernel.org>; Sun, 10 Mar 2024 11:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710069690; cv=none; b=b6UwcRkJVrCpmsrATfWaBHG8lUjlgrSpw5B3eNlY94/RzygAZ/5H5WE3rDxkONQNqzEZ3Bu+MzGN0axIChwl/++bRu/rMnT5ca6BT9w/5nb3pIY3yvPLS1Lop8HUC3/Mfg9QtZmpL6E1XKfp2Tac96vLIBFoBIUpgkrW+VdUYGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710069690; c=relaxed/simple;
	bh=KONZueAbC0pktxbjfgH1/nD9cmjqE6coHvG62kTWL2E=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tDo/+BLGhL2tubhBp/XappoagB1iyytUijSgTon8Ln6Q/0D6G5jbvNBR3IJuqqKeE4Fp8nFg9uicK3jHChX6vDECPcUKLaT4tdp0KE4DAyKYk1UitXVb6RCeKHo3jeXnW00UKId9H3X7vGD77kuCDOYMrkPJzFcf5MIov0nvDfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=z3ntu.xyz header.i=@z3ntu.xyz header.b=t0nHTX6J; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=z3ntu.xyz header.i=@z3ntu.xyz header.b="t0nHTX6J"
Received: by smtp.kernel.org (Postfix)
	id 0E681C433F1; Sun, 10 Mar 2024 11:21:30 +0000 (UTC)
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C1334C433C7
	for <tools@kernel.org>; Sun, 10 Mar 2024 11:21:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C1334C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=z3ntu.xyz
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=z3ntu.xyz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=z3ntu.xyz; s=s1;
	t=1710069681; bh=KONZueAbC0pktxbjfgH1/nD9cmjqE6coHvG62kTWL2E=;
	h=From:To:Subject:Date;
	b=t0nHTX6JSL29+JHe1XW03mPL7Oj7jz6TPgyb/k+0lr/3AL+bd98qyASil3hqyHie1
	 NRkwVrFe+WUMAvdpxxRbynj9CV9VIdDHCAhJTuYLu810uS8YrTzZnlOGWro8XwjXQX
	 GFUwRohTOLxuOjG77jJHOhr89HzwmnqQ2HXIa2jE=
From: Luca Weiss <luca@z3ntu.xyz>
To: tools@kernel.org
Subject: b4 custom git diff options (like -B)
Date: Sun, 10 Mar 2024 12:21:20 +0100
Message-ID: <12393372.O9o76ZdvQC@g550jk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Hi all,

I'm looking for a way to make b4 use the "-B" ("--break-rewrites") option for 
git diff when sending a patch where this option makes the diff way more 
readable than without.

I currently don't see any way to either tell b4 to use this option, or to tell 
git to (temporarily) use this option when generating any diff.

For now I'm hacking up b4 in git_range_to_patches to add "-B" to the git show 
command there, but I think it would make sense that adding custom options for 
a single series was supported with some b4 prep command.

Regards
Luca


