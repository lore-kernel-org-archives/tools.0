Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2EF7A70E
	for <tools@linux.kernel.org>; Wed,  7 Feb 2024 17:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707326202; cv=none; b=MpJjV/djW2yH5KjFKJIRKQogu0At3LENUjGH+pDRf7ZrypEOMmwrx+oH+BGfCOnQXRm6y6QXAkDEqRCp1Xqnm0jxLzsxqiGD/tv/dx8qmvRi3MUuKrenxT/OpRWIoshAO0lT3UkNk4pHmujTPwQPjO1tOW7qyf48EuS+XyPstb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707326202; c=relaxed/simple;
	bh=pRPJDF9TpX5sq0ZhzHOukdZvjRwttzfKuJPQkTowP0U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=iKxDkyhToSMscbD1nXnRxExJIx7m/giX0WwgBo/OHGFOzt8RD67uF0u7r+dUO5DX+GZLN31+24I1YYHRUNnMVAlcc3TrmvARCkK4Z6WpjLh8mWUXbUaHYjSZE58whF9gfkKscj35wp2b3aGryRULhNjLXddi1if3KKUyhvKstXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=mApMrpPx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="mApMrpPx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCADDC433C7;
	Wed,  7 Feb 2024 17:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1707326202;
	bh=pRPJDF9TpX5sq0ZhzHOukdZvjRwttzfKuJPQkTowP0U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=mApMrpPxhAap+WK9HBO4ijQ/MZubEh3AhjLr8jwxfYHOYT+5UjDHYconOEjuQ54Ui
	 qErhYlawkKcQ89NkV3EL7Ot2kVymya8wpoNaOcFCegi5qrvMbfLpttenhrZO3cTrn9
	 oB3fdtx3UY94hta6NP3raXCp1/pZHYLP1CCLBLj4=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Tools" <tools@linux.kernel.org>, 
 Nicolas Schier <n.schier@avm.de>
Cc: Nicolas Schier <nicolas@fjasle.eu>
In-Reply-To: <20240207-ty-do-not-consume-commit-decorations-v1-1-995e5ff6666b@avm.de>
References: <20240207-ty-do-not-consume-commit-decorations-v1-1-995e5ff6666b@avm.de>
Subject: Re: [PATCH b4] ty: auto-matching: Do not consume commit
 decorations
Message-Id: <170732620178.263979.1931475152487925135.b4-ty@linuxfoundation.org>
Date: Wed, 07 Feb 2024 12:16:41 -0500
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0fe26


On Wed, 07 Feb 2024 09:25:35 +0100, Nicolas Schier wrote:
> Disable decoration when reading git log output for getting a list of git
> commits.
> 
> Without '--no-decorate', commits that have branches or tags pointing to
> them, will not be recognised by subject as get_all_commits will assume
> that the decoration is part of the commits subject line, e.g.:
> 
> [...]

Applied, thanks!

[1/1] ty: auto-matching: Do not consume commit decorations
      commit: 0fe26a3bbadfeb4a86f92b7b1e32aef203fe59f7

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

