Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF8D1FDD
	for <tools@linux.kernel.org>; Tue, 21 May 2024 15:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716304835; cv=none; b=WRqteIx0SgB8QlBKdGDGFEUAnmZ9Q6bA8e/05iaodRW4gtDgByC6beYUmG/9ftdjwjvxnvqJ/vA7qPlWpp8WaxBunmyaq7aJnR4tyQLMPYSvwDHLFarj4+B5Xed0s1jQvVDDK55euGU4zEU4KJbmKMbM+yj+0XR/KN436QZmbyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716304835; c=relaxed/simple;
	bh=W9PyofXk5OX8mcKmsYqiVy2jMYKvhNDpdlg7ct+So5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lNKG/+vGyKX3DGrzEDgPurioOL6BtxAeCggrSnLKuNoX/EcoCNMwOd1xP1Ux1i2UXh1uKZk18CvS57bsCO6U3bttmqBeJogSpNr9CymYbldqjjPsL2KE1rvuRM3ypbHTWrW/+P0WD1btzzCldyl5SC5MwG2S0pNLb+jlQO4Ojcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=GC120NU4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="GC120NU4"
Received: by smtp.kernel.org (Postfix)
	id 4E8E8C32789; Tue, 21 May 2024 15:20:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16689C32786;
	Tue, 21 May 2024 15:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1716304835;
	bh=W9PyofXk5OX8mcKmsYqiVy2jMYKvhNDpdlg7ct+So5Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GC120NU4SADdQV666i/tL62Fx0ghxWdYrEdvzmzbkQ4RuDPhIhzzT3emEcZE8PFkC
	 yMdgcBjB4ZCXuw0PuXD6DgephDF1769FPMVDI2vTzxPaVaXPbxanygrLHxcoPtZZC1
	 JU1LFisEZcgWTLQ7+V2fFVnO8z4QpwyQ8l7APboQ=
Date: Tue, 21 May 2024 11:20:31 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: "Kernel.org Tools" <tools@kernel.org>
Subject: Re: [PATCH b4 2/2] ez: Fix check-deps when strategy is commit
Message-ID: <20240521-amusing-ant-of-correction-7b6ca7@lemur>
References: <20240521-fix-check-deps-v1-0-d149bf40e7ee@bootlin.com>
 <20240521-fix-check-deps-v1-2-d149bf40e7ee@bootlin.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240521-fix-check-deps-v1-2-d149bf40e7ee@bootlin.com>

On Tue, May 21, 2024 at 04:41:38PM GMT, Louis Chauvet wrote:
> When using the commit strategy for the cover letter, the first commit is
> empty. This commit can't be applied properly with git am, so just skip it.

This shouldn't be required, because get_prep_branch_as_patches will 
already omit the cover letter commit:

ez.py: 1408:

    strategy = get_cover_strategy()
    ignore_commits = None
    if strategy in {'commit', 'tip-commit'}:
        cover_commit = find_cover_commit()
        if cover_commit:
            ignore_commits = {cover_commit}

Something else must be going on, maybe?

-K
