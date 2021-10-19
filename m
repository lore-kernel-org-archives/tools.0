Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC6BE2C81
	for <tools@linux.kernel.org>; Tue, 19 Oct 2021 21:33:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 76D8D60FDA;
	Tue, 19 Oct 2021 21:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1634679218;
	bh=RXqv+1r24SzCI9mcsJezRqWcCKFJd6SkmLXzT8l7ehw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=mMxQ/aZjUh30CB8vP1ql5EDs/O3I55sDNkfsosw0ARXwhmn9lnwrfOOQVRntdMmze
	 EBTN/C1f/CdnTyN0O+cTCLT08eshl2A+iBsbMaSUxlnfG54W7YGYMmjXW3zNxyIrVF
	 7+t+/HYWR2ZCpoY2jj7O3YULhQdNSH198QD9AJeM=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Rob Herring <robh@kernel.org>
Cc: tools@linux.kernel.org
In-Reply-To: <20211019144600.225058-1-robh@kernel.org>
References: <20211019144600.225058-1-robh@kernel.org>
Subject: Re: [PATCH] Fix shazam for multiple git worktrees
Message-Id: <163467921838.669261.17961147496477025050.b4-ty@linuxfoundation.org>
Date: Tue, 19 Oct 2021 17:33:38 -0400
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 19 Oct 2021 09:46:00 -0500, Rob Herring wrote:
> The shazam command makes assumptions that '.git' is a directory which is
> not the case with multiple worktree. Use 'git rev-parse' instead to
> retrieve the correct paths.
> 
> 

Applied, thanks!

[1/1] Fix shazam for multiple git worktrees
      commit: a57ec40ef6d57b5aea62fbd1c814175d1da3fd23

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>
