Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0DA61A073F
	for <tools@linux.kernel.org>; Wed, 27 Aug 2025 21:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756330413; cv=none; b=SLhwbO4eQ56qAVOppMkFLwxIjuYdqEnrtoodcPv+dUn79aSU79BN8qun9UKAKqw85NXngARbl0uPzatmHMcAOtuwz2INx2gLTc2Br6rW/ExYM9bMSFtTq5l5Lkgds3ZupxUbreR72vVJhRmaN41ABLZLAxeDwQ/S2piuY15BjAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756330413; c=relaxed/simple;
	bh=lKQBcV2wqkvQU9hWZDI5FTkpDXzP/sFONMhPEn0Ruq4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SsdsNp4+8OV8OM4SP+BhmZeWTXAdBZO3vHpJuAv6NVLy9x4HqF/T970jJP1hXzU2Y6WGKT0HPml4emCXeCMmMTtbqvC6awbOk+BWacc8/CBWzXpYY1MKq1QS2hRmx4Kzqzu+yGRWZQ0LwBxrQ6uwsZTOHc8x6M/s0ExN4RVJqVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JcUNi3Vc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JcUNi3Vc"
Received: by smtp.kernel.org (Postfix)
	id 7DBEAC4CEF4; Wed, 27 Aug 2025 21:33:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEB6FC4CEEB;
	Wed, 27 Aug 2025 21:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756330412;
	bh=lKQBcV2wqkvQU9hWZDI5FTkpDXzP/sFONMhPEn0Ruq4=;
	h=Date:From:To:Cc:Subject:From;
	b=JcUNi3VcNPWLsO32dg6Qhqih3iBKw9VeoC60TZLb9vpYYvrvAin4X/5KgtVAQmH67
	 PSXJ2Zy+YUVNFq9R4PpsU+sCYqTW/PH6slBmr9knmEqikFnmCLYws4z/apW87oaOr0
	 1I5gWDC49dzH4IxcEOjjC0SLayrVF9zZ/ZByb01IXyMpRvZS2xptjMx8yGgkbMRUFp
	 4md0ebKxd0g1Q2BeKpa2m6mJuy9txAcjwA7E6tco2U+2jxlhymd/f/geZKWXgrQk/J
	 4wU3UGOgfAxTmfIZ91DpyPDqDLOPvi4Xh24+J+w4ThQJUZ/e/m68aziNhOyd6QuKe8
	 kuasm7cjEvTKA==
Date: Wed, 27 Aug 2025 14:33:29 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: tools@kernel.org
Cc: Vlastimil Babka <vbabka@suse.cz>
Subject: git-filter-repo "Already Ran" message when performing certain b4
 actions
Message-ID: <20250827213329.GA38537@ax162>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Vlastimil reported on IRC that the following message pops up when
invoking an action that uses git-filter-repo, such as
'b4 prep --edit-cover':

  Invoking git-filter-repo to update the cover letter.
  The previous run is older than a day (.git/filter-repo/already_ran already exists).
  See "Already Ran" section in the manual for more information.
  Treat this run as a continuation of filtering in the previous run (Y/N)?

This appears to come from a change in git-filter-repo 2.47:

https://github.com/newren/git-filter-repo/commit/8a243ae8adb02223f74fcc082c84c76d66853040

Maybe b4 can remove that file at the end of the action so that users are
not prompted about this?

Cheers,
Nathan
