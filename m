Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E058F15BD
	for <tools@linux.kernel.org>; Fri, 26 May 2023 18:23:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ABEBC433D2;
	Fri, 26 May 2023 18:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1685125439;
	bh=RE0vPWdGjYkMjIFB1V23St6b/CtCEhzJ3Qw7ZecDfZM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=q8c956PiMpN84ipvUuQizyNNHSBXFjbn96UmH14RL2pn0kBfZ6UnbJgL7kEemM6IM
	 i/J/hl5NE8VCqmWZEiydnpWHyb+KDYCbXsNfMAIzCUsnfopBpuVtjKZt3wb4AVRxxr
	 5jOLFIkpfE1bKIhZvaaC4qJwEotBMH6MfANzoW9s=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Rob Herring <robh@kernel.org>
Cc: tools@linux.kernel.org
In-Reply-To: <20230330201529.2744290-1-robh@kernel.org>
References: <20230330201529.2744290-1-robh@kernel.org>
Subject: Re: [PATCH] ez: Fix 'trailers -F' used on a single commit
Message-Id: <168512543905.61240.18132468635321830176.b4-ty@linuxfoundation.org>
Date: Fri, 26 May 2023 14:23:59 -0400
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-3151f


On Thu, 30 Mar 2023 15:15:29 -0500, Rob Herring wrote:
> Running 'b4 trailers -u -F <msgid>' on a single commit fails:
> 
> CRITICAL: Failed to convert range to patches: Could not run rev-list None~1..409ee53c38a1d9a60e76ffa92088cfad07cea850
> 
> The problem is the loop is exited after 1 iteration and prevcommit is never
> set.
> 
> [...]

Applied, thanks!

[1/1] ez: Fix 'trailers -F' used on a single commit
      commit: 3151f4267ec4c711db47c14c3460e36b8d3d05b3

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

