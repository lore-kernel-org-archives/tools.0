Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF05980058
	for <tools@linux.kernel.org>; Thu,  8 Feb 2024 18:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707416728; cv=none; b=Y+cGSZ81sy+uJkUxl+tdIF4aae9vksj8yJfY3ZFxBDE8KnsCUVBb3poba57RKy/2Q8EKW5BcPLRzxe0doeXHZAqPcmrB7NYG1B/BoBVzyOqmcmQGUtNRHuF1CVpfMbBKTrwp3XDYsJCUKr98HRBfuvYXzEmPP0TpXz8amVjUIyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707416728; c=relaxed/simple;
	bh=XbmpDWV4V3CrPv4nbE/u285+CBalh3hyvOCenDpeHX0=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=MWKnzP7lGGNMSwLjUAp8HP8G5OyRBovx4xC9hdF8Cb534dP2uKkJ6pjrGJIbcUmaqQ/9SEJoDREZmn7VdWs40U4e3tGwXmd432v02vEP6Rs+OAqLYLHtOi21fhh737o9TTzpPqWptCby+2rVSogSedsQgKYaXFGWzBTJBSLwPkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fGoX2vCh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fGoX2vCh"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3E7F3C433C7;
	Thu,  8 Feb 2024 18:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707416728;
	bh=XbmpDWV4V3CrPv4nbE/u285+CBalh3hyvOCenDpeHX0=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=fGoX2vCh481DC0eD7xA97YdHhmFxrqKMBvErbwEEFrn51jUHsgfiHIMtxFPJoNPc3
	 yRkwsPX6YUf8xMlHrUVV9ONHb32nI7xUpElwl2Xiv7Pm35HZQZ/gc8K8WX8ido5GzU
	 3niWcaNZR56grnlgUHy5TYorgeqTOeEIvRw0IT5Hcq9lqXt6KzpjG+eJFBVsgBIL2s
	 sJGjqpjRBQDRI4ksUcUuRLLIhEwzdC2kRVsMwEhU2PAjCbMD3Q3dpp+5u5s4RuMJBy
	 r4eRwR7y1Z2hpD7L3th6rE9K4btPjV2ROZ1sI4417rDr6HcOmHdkUZ2o05578pO3++
	 uEJqIWaIvB8qg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2617BE2F2F0;
	Thu,  8 Feb 2024 18:25:28 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: "Kernel.org Bugbot" <bugbot@kernel.org>
To: tools@linux.kernel.org, lucas.demarchi@intel.com, lkp@intel.com, 
 konstantin@linuxfoundation.org
Message-ID: <20240208-b218463c6-a5b7536ffb1a@bugzilla.kernel.org>
In-Reply-To: <20220916161835.mpi5oyeka3b4ellx@ldmartin-desk2.lan>
References: <20220916161835.mpi5oyeka3b4ellx@ldmartin-desk2.lan>
Subject: Re: trailers update and bots
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: peebz 0.1
Date: Thu,  8 Feb 2024 18:25:28 +0000 (UTC)

Konstantin Ryabitsev writes in commit 2578d5b6f45390dce631033b20b698438455cc9f:

am: extend trailers-ignore-from to match From: header as well

When trailers-ignore-from is defined, match not just the address
specified in the trailer itself, but also the From: header of the
message where the trailer comes from. This allows us to blanket-ignore
all trailers from certain addresses, not just person-trailers that
mention that address in the trailer content itself.

Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=218463
Signed-off-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>

(via https://git.kernel.org/pub/scm/utils/b4/b4.git/commit/?id=2578d5b6f453)
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)

