Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1581514884F
	for <tools@linux.kernel.org>; Fri, 28 Jun 2024 08:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719563414; cv=none; b=SrNl7xsbiarX0eyaCA/Fpxpyx67SIiJKHkgipWOPWeUTnmfN6Qk3TOTMD8q11QVapU8//KrnoAGrh17tC7BF4JdrA9g0sRRhz0jmCovv/tmduX8RDsDxWwFeP3q4D2jVDAV1prYzzcBD9np7ndIv0bruU/N+1WmFzFfN9C0NiYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719563414; c=relaxed/simple;
	bh=aSPSxj3Fyx+r+b4W9cieeJPrAB6jxQDDKlO/eOBKj4o=;
	h=Date:MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject; b=QjdnwT6K/9j4ooc0QsDp8Z0t8uK3fbNw4NOj3l1HOkWqgmHLQooJg4hmZXNZJQDjWhSBQXHmNxSRW9ZBMaHYH5xIsKMggUUuzu2KiiOn645OBqJJs7dBRjH/VRK9ttvo3KqEQPVf39AZfjFrKVgNVCLZGRvQf7FMIcrFlV1Hx5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gZmlsHfF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gZmlsHfF"
Received: by smtp.kernel.org (Postfix)
	id C3D14C32781; Fri, 28 Jun 2024 08:30:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9E404C116B1;
	Fri, 28 Jun 2024 08:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719563413;
	bh=aSPSxj3Fyx+r+b4W9cieeJPrAB6jxQDDKlO/eOBKj4o=;
	h=Date:From:To:In-Reply-To:References:Subject:From;
	b=gZmlsHfFzgoHRf+TxeharT0JuJQ4acIF3CVEn5+FBEGl41na4qi+PFaUzjBiQb3M3
	 BGv1FcuSOkqeNJrZzW2z1dT59KQhVSmXGpFBn7v07co8LN7bnLNTV1MexU3zV3Mtk4
	 A+KgUQE6fDJTRudKFBWMWY789LbV4E5V2wgHgL32FSzGWgWqgQG4bafMWzvzE1DEC/
	 AdV9ZmNQXtFIi3eZ41fNg4OT1ghZVm4jkEkBW/fzPnHA1sdDjfUwaCCml9oyrG8Z62
	 igZ1GWZ6XfiPUJY+/WhKqpCpQGUV2E4l9SIxDuEldK4vCSXx6Um8J7/sdzKRRzMQMF
	 9IWkccBma5/eg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8C899C43335;
	Fri, 28 Jun 2024 08:30:13 +0000 (UTC)
Date: Fri, 28 Jun 2024 08:30:13 +0000
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: "Kernel.org Bugbot" <bugbot@kernel.org>
To: tools@linux.kernel.org, konstantin@linuxfoundation.org, 
 tools@kernel.org, conor@kernel.org, arnd@arndb.de
Message-ID: <20240628-b218995c2-e8b4d683465f@bugzilla.kernel.org>
In-Reply-To: <20240627-unrest-rigid-c7bb9ac94bc7@spud>
References: <20240627-unrest-rigid-c7bb9ac94bc7@spud>
Subject: Re: patchwork & b4 failing to detect pull request
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: peebz 0.1

zhaomzhao writes via Kernel.org Bugzilla:

(In reply to Bugbot from comment #0)
> Conor Dooley <conor@kernel.org> writes:
> 
> Yo,
> 
> Neither of the following two PRs
> https://lore.kernel.org/all/20240419-unnamable-tapering-f05a0af759e3@spud/
> https://lore.kernel.org/all/20240627-wobbly-custody-5df564133088@spud/
> appear in the soc patchwork at
> https://patchwork.kernel.org/project/linux-soc/list/
> ?submitter=206274&state=%2A&archive=both,
> and `b4 pr 20240627-wobbly-custody-5df564133088@spud` fails too.
> 
> It seems the trailing + in the tag, while accepted by git, could be
> the problem? At least, all other PRs that I have sent do not have a + in
> them and have been processed without a problem.
> 
> Thanks,
> Conor.
> 
> (via https://msgid.link/20240627-unrest-rigid-c7bb9ac94bc7@spud)

Hi, the root cause is the + sign, please try modify this file with the following patch: 
vim /usr/local/lib/python3.9/site-packages/b4/pr.py

--- a/src/b4/pr.py
+++ b/src/b4/pr.py
@@ -38,7 +38,8 @@ PULL_BODY_WITH_COMMIT_ID_RE = [
 
 # I don't like these
 PULL_BODY_REMOTE_REF_RE = [
-    re.compile(r'^\s*([\w+-]+(?:://|@)[\w/.@:~-]+)[\s\\]+([\w/._-]+)\s*$', re.M | re.I),
+    # match string like: "https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ riscv-dt-fixes-for-v6.10-rc5+"
+    re.compile(r'^\s*([\w+-]+(?:://|@)[\w/.@:~-]+)[\s\\]+([\w/._+-]+)\s*$', re.M | re.I),
     re.compile(r'^\s*([\w+-]+(?:://|@)[\w/.@~-]+)\s*$', re.M | re.I),
 ]

View: https://bugzilla.kernel.org/show_bug.cgi?id=218995#c2
You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)

