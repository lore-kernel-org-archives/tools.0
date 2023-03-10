Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3856DAAA
	for <tools@linux.kernel.org>; Fri, 10 Mar 2023 20:11:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A33BC4339C;
	Fri, 10 Mar 2023 20:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1678479083;
	bh=7TyGu4mHdleYIKrlybjKQMt1VMh3SI6JgDa31CwVwiw=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=12/ArRa/vk2sa0YEaV2VHm8Z9JeU9Y07wVvkXzxSCdCwyiXZrGJhvrBX04r8KMEn8
	 uT+/0Gpg8JtmHZ5k7DLA+I5oiWQoT9ucsYra4sdgVbkJO19YS97tJZrZQpcaDeU1s0
	 6vpKYLz3+41X/qt//G1nHJVsRJGIalmjqSe6UXTc=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: tools@linux.kernel.org, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20230310060133.1610255-1-mpe@ellerman.id.au>
References: <20230310060133.1610255-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] ty: Allow a custom name/from when sending thanks
Message-Id: <167847908312.178358.7477092233230530762.b4-ty@linuxfoundation.org>
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


On Fri, 10 Mar 2023 17:01:33 +1100, Michael Ellerman wrote:
> Add config options "thanks-from-name" and "thanks-from-email" that
> allow setting a custom name and/or from address when sending thanks.
> 
> 

Applied, thanks!

[1/1] ty: Allow a custom name/from when sending thanks
      commit: 63fb2ff10b04b383cdc0db3f2a568209e2595222

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

