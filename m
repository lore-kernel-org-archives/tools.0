Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 302B5187553
	for <tools@linux.kernel.org>; Wed, 22 Jan 2025 15:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737560661; cv=none; b=JVHctILl5JP5sjnsHE56OxBKKOOVltmiY5lMwPAYvITUYaAL4TPepMEY8Qhywwbn0Jx9wcE1cCo/hrMPJR3L9KT5Kc8ZpMudYdyD96bPogkFWd/dzkuOhCPziAr0cL9n6oznNxpfL46cV+f0wV9YWwkkwwSis0tArU0lqRJ314M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737560661; c=relaxed/simple;
	bh=8AIEQVG7T06/yU+ZYMPCA8auSDC5DFECLRYcPdD8Z54=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=k4gJ5aQMrLU/B1HBq8/cPhc3HFN65uIibsKH++1RSh6GbfM+ZNz3xgjFFIMwXoDZHBqkRa5U5p5MQfEMsf0hodsXoyqk4+1SPJRNay9cgNPiDjXTbDV65qxof7aOcx/NKNTd7xad/zKKH7rB3aO9cXSSZsqayJ8SqOxnuLrgy6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=XpFASxZa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="XpFASxZa"
Received: by smtp.kernel.org (Postfix)
	id A03B1C4CED6; Wed, 22 Jan 2025 15:44:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 437EAC4CED2;
	Wed, 22 Jan 2025 15:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1737560660;
	bh=8AIEQVG7T06/yU+ZYMPCA8auSDC5DFECLRYcPdD8Z54=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=XpFASxZa3czrGVs7p/7UpllSVyXjn8hHm6cYU4XWPgyN8HzvCDNaraaTzHDCch0qg
	 2OOfEr02SRNGAm21EkwgQa4AC9dEo8HvpKoWPZLdVIvmIgJB1o/W53JNKb7ol8M/dI
	 fGXJnqedFA6qBa/eRthXgcgEYTTAIXZkXU0n/eAI=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Tools" <tools@kernel.org>, 
 Brandon Maier <brandon.maier@collins.com>
Cc: Emil Velikov <emil.l.velikov@gmail.com>
In-Reply-To: <20241009-pypi-completion-v1-1-94f50a157c56@collins.com>
References: <20241009-pypi-completion-v1-1-94f50a157c56@collins.com>
Subject: Re: [PATCH b4] b4: support optional shell completion
Message-Id: <173756066014.465992.8045038696268828801.b4-ty@linuxfoundation.org>
Date: Wed, 22 Jan 2025 10:44:20 -0500
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-32b7b


On Wed, 09 Oct 2024 19:38:58 +0000, Brandon Maier wrote:
> Shell completion support was added in commit 333189c by using a shell
> script to generate the completion files with python-shtab. This script
> can be run by distribution packagers to include shell completion.
> However this does not support the use case of installing b4 with pip
> from PyPi[1], because PyPi doesn't support distributing shell completion
> scripts.
> 
> [...]

Applied, thanks!

[1/1] b4: support optional shell completion
      commit: 13d5dc723d93d783c67932c61e12bbcd56598179

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

