Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 376E46AB6
	for <tools@linux.kernel.org>; Fri, 17 Mar 2023 13:58:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB5B5C433A4;
	Fri, 17 Mar 2023 13:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1679061536;
	bh=bvU6N7eDWhYjKZ6HgxZst8TpU7yvT9tSXle4Kl1T4+M=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=ydlAShaVMSua/U7MzcuqYl7ZU5mRT1Lf+Vu8tqI6XOkwcztNUyYw1/jBqTATKOTMe
	 6KliaSVkegYEuLMU20qHYcEgvAVbxeR5hsC0HLtWroOVB6CgrnYIaB2lC0PIAHEpR3
	 TQmCm/C5VKQBxvp8mba57FI/5WMjnKkot7RnLdAY=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: tools@linux.kernel.org, Alyssa Ross <hi@alyssa.is>
In-Reply-To: <20230317102107.17422-1-hi@alyssa.is>
References: <20230317102107.17422-1-hi@alyssa.is>
Subject: Re: [PATCH] Fall back to EMAIL environment email
Message-Id: <167906153658.1546524.12360106881152549237.b4-ty@linuxfoundation.org>
Date: Fri, 17 Mar 2023 09:58:56 -0400
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-20972


On Fri, 17 Mar 2023 10:21:07 +0000, Alyssa Ross wrote:
> This matches git's behavior.  Without this change, b4 shazam would
> catch the KeyError and exit 1 with no error message.  This will still
> happen if EMAIL is also unset.
> 
> 

Applied, thanks!

[1/1] Fall back to EMAIL environment email
      commit: 20972c58601f9a6ff4440e23be8d6261c6bc5b93

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

