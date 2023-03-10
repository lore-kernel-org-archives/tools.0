Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40230DAA5
	for <tools@linux.kernel.org>; Fri, 10 Mar 2023 20:11:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAC13C433EF;
	Fri, 10 Mar 2023 20:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1678479082;
	bh=kfIu9qp6emR7Gtcg5nVzQi2cmaUnRV8pdRNzDhrtEvE=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=GafbDVT0j+aknk6xNgHjTsmAg0S9VufdFxGEL5WAHKaNrKJhhVcg+j8tYh0vrKyFb
	 66AWR73uasOdhaVUqwmGK0jUkYpY1aUn+C24CN5kPqgztjdjQQyeh7sVciLPNqBsEH
	 hjedt+N4YNP/XQSdZ3MUFjXYrLt+dqR8nQzZgPkg=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: tools@linux.kernel.org, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20230310055753.1609529-1-mpe@ellerman.id.au>
References: <20230310055753.1609529-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] ty: Fix git-config regexp in get_branch_info()
Message-Id: <167847908263.178358.3973742670339656772.b4-ty@linuxfoundation.org>
Date: Fri, 10 Mar 2023 15:11:22 -0500
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-7450e


On Fri, 10 Mar 2023 16:57:53 +1100, Michael Ellerman wrote:
> The regexp used to get the branch configuration in get_branch_info()
> is subtly wrong. If there are multiple branches starting with the same
> prefix, the configuration for all of them will be returned, which can
> lead to the wrong branch info being used.
> 
> eg. Running b4 -d ty, with extra logging of every line in
> get_config_from_git() shows:
> 
> [...]

Applied, thanks!

[1/1] ty: Fix git-config regexp in get_branch_info()
      commit: 4f90eab09937e78f27e63a01076af72f8d45e3f3

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

