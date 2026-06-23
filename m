Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A327F30D415
	for <tools@linux.kernel.org>; Tue, 23 Jun 2026 16:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782230487; cv=none; b=VpODdQlyBFTL/4vetrvpln5+zrjwQNprGW/OOB32f/6OF4ZE1SQfkf9PvOxiNxp4PQrQyWkCzZXoWFIKKFgxRG/ekrf1YmRS0VvprgWc5N7fBsoyx1ukqypWOik+9f5xqxBfJ0TwN5ltHoZx0e4l+U6Mlds7EcKV/DdEIKcIQWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782230487; c=relaxed/simple;
	bh=XcoSpDOY4Bbfe/hiy67NIZkTQPsvoazO/vP2oyGR+dI=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sW1rXHFhDrMIWkbQ2ye27ABGItNXQOXn59nUULLRtuhLoV3hwzB0liqjWg3nYt2qBYnCwoR/KFoxiq11u0f5gG0SUoxw2n46bF5sLiPSYo1qHPJq14ItcR7IJNCUJegictxZOXvRqJhHf5x7yEkJfXr92a2w0wq/tYC740zCGg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MOeqCx5G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MOeqCx5G"
Received: by smtp.kernel.org (Postfix)
	id 59D8C1F00A3A; Tue, 23 Jun 2026 16:01:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0808B1F000E9;
	Tue, 23 Jun 2026 16:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782230486;
	bh=vr7KZso5vbwN2VI9bplMN56huBxvOCaAMwHh9PzllFM=;
	h=Date:From:To:Subject;
	b=MOeqCx5GQJgqL/bErlM/N2HZ/b/cVoPHxDn+i6KWrQvR8aYkx8pAF7EKdFQd2dsD2
	 cM2NQ93Cegm7ludbnFqZEdEAh7Y0JPI/bQloM6gUZiZFXHwETHP05bmlbOYo/JSrZO
	 51k4OPc3lcRrWS7do9HCNzPtL6ImEUXEEwI+J4iuSx3dSJ/oYCKT5y1O07BRVX63L3
	 2U4Neleo9LpVi2TXMDnD+7rDbOQMpZkHuVnIwNrlAF7AZpcf6zsOC5ExWlmKMgcpk2
	 38NyMemSODXM4F0hVfNI0nKYepmhPkuXB8A/lKNqiJ3PSETazHqmG8LWSqeotUzKH7
	 /wzvIVxb5MxOg==
Date: Tue, 23 Jun 2026 12:01:24 -0400
From: Konstantin Ryabitsev <mricon@kernel.org>
To: tools@kernel.org
Subject: korgalore v0.6.1 now available
Message-ID: <20260623-ambrosial-platinum-asp-13e363@meerkat>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi, all:

Korgalore v0.6.1 is now available as a bug-fix release addressing four
reliability issues:

- thread tracking no longer stops delivering after a few days:
- Shallow fetch self-heals on stale repos:
- noop retry no longer causes infinite re-delivery:
- bad-object commits in the failed-delivery list no longer crash kgl pull:

Full changelog and documentation:

    https://korgalore.docs.kernel.org/

Source repository:

    https://git.kernel.org/pub/scm/utils/korgalore/korgalore.git

Upgrade via your usual tooling, e.g. with pipx:

    pipx upgrade korgalore

Thanks to the following people for reports and patches addressed in this
release:

- Ard Biesheuvel
- Borislav Petkov
- Catalin Iacob

-K
