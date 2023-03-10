Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 498D78838
	for <tools@linux.kernel.org>; Fri, 10 Mar 2023 20:11:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B780EC4339E;
	Fri, 10 Mar 2023 20:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1678479083;
	bh=5wBYdr9jRRg6w9aDHp6kEQ4jaVPHmoADx37dop12JNU=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=QEyvdt7i5nn5XF+OnD/jj55BRadAbCitnV6e0T13CrNM+vRDcKgMxLgUYTxhWLuqI
	 bp4ZajdgNQFkhdGOmdp/F0bss0emd7pr2XqhsCbNAunpU/77S1KcjscZZMvGu+9nVx
	 H4Gjhy0m1AVXmWrgLrTgKsD29fxNyv1emvNVN5rQ=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: tools@linux.kernel.org, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20230310060552.1611274-1-mpe@ellerman.id.au>
References: <20230310060552.1611274-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] docs: Document thanks-treename
Message-Id: <167847908363.178358.1237439292841572451.b4-ty@linuxfoundation.org>
Date: Fri, 10 Mar 2023 15:11:23 -0500
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-7450e


On Fri, 10 Mar 2023 17:05:52 +1100, Michael Ellerman wrote:
> 


Applied, thanks!

[1/1] docs: Document thanks-treename
      commit: 7450e37af25f2678455905271f91b2d7f1cb4ca3

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

