Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ADC53A6407
	for <tools@linux.kernel.org>; Sun, 12 Jul 2026 11:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783855360; cv=none; b=TZS4WeLrPZ2PQByq1JBI+hF3oLbPXx55BGSUpo9v1TdobUUcEq7gl/Mg2XoNVIwEyagpTlHxjo0F+OksXvW6W5J0z7TpVneVqraoAmJnpbWaPKC/e4OQU4w682rslvZPsyns/ox35WifFZujUYyLaGQkd62GrEMNMyIJACVBDno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783855360; c=relaxed/simple;
	bh=igW/DhRUoBojNA1Q9M1UPpNOwihVx79KMGrqLTh8gsk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=anTiBdGGP1h53VQMfmdUJSDRMXkbOoQX1Tth7BeSVkvucNH1LPn9T681txZiOo2Z7muHQ0LBmTkzUyXRfCt/2CX/TYYGtXwXjuPmoU+2464IC4VB3WKRuQcZnus79CPZ8V+EhZrpifaQav9r630drMcpTulkScf2zhdUnVF0R0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MIKmH7r9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MIKmH7r9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD0D21F000E9;
	Sun, 12 Jul 2026 11:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783855358;
	bh=igW/DhRUoBojNA1Q9M1UPpNOwihVx79KMGrqLTh8gsk=;
	h=Date:From:To:Cc:Subject;
	b=MIKmH7r9RaaNwQpgBoDnRjxEy7ttjPyG7vFP1MgNjo6Mw05UJeG8LsFEKzBU5+Onj
	 WrJZZIUam9oWFcqPPBrKOJNLaqZhqe+cQwLVzlhZbcc7TXupRVJlGr7h1JEIO9lopM
	 VeqXQYesaiI/NMDoytVRyJtkUOJXxhZ0I7gPgLGQVZB7166q7uid+kzeAyxkNnALI/
	 PtIOe5svK+pEdRqibqYHkJwT0O5kyOALcHqdvG0myKAmXZIoyfdiZJIWjdTW1PbP3O
	 1w0Zkxaf/wJF6iQOypwGFFXDgbdt2L/BcZ9jtzVUlmfhE7PfBZTM7A5yQUaQVhx6mc
	 wrabgPM0Rtnnw==
Date: Sun, 12 Jul 2026 12:22:27 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: b4 review silently freezes on patatt fail
Message-ID: <alN2yOZmbl31BfVW@lucifer>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Konstantin,

I noticed a bug in b4 review (as pinged on fedi but better to send the bug
report properly :)

So I had an incorrect configuration locally - my signing key in git (git config
user.signingKey) was set to the wrong one (the old, revoked one, the one
I... err... lost the private key for :P).

And with this in place, I was using b4 review tui --email-dry-run to experiment
with composing a reply.

The replying bit worked fine. But when I hit 'S' to send it froze up. No error
shown, just frozen.

Some strace's later and I identified that gpg (of course) was to blame - it
seems the python code just hangs waiting forever (idle event loop looks like).

And it seems to be when it tried to use patatt to sign my reply to a mail, gpg
failed with exit code 2:

execve("/usr/bin/gpg", ["gpg", "--batch", "--no-auto-key-retrieve",
"--no-auto-check-trustdb", "-s", "-u", "130EC0891A27271B"]) = 0
exit_group(2)

(I can give you a full strace if you need!)

I confirmed this was the signing for sure as passing --no-sign fixed it.

Once I updated my signing key to the correct one, everything worked fine.

$ b4 --version
0.15.2

Cheers, Lorenzo
