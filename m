Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70DBB2CA1
	for <tools@linux.kernel.org>; Mon, 13 Dec 2021 22:30:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F37BC34600;
	Mon, 13 Dec 2021 22:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1639434605;
	bh=+Zvy2fOm6YjAj1q59vghSkBMtCwTytJLni/VJAAPOiw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=rs3qqFMaqP/L7PB95LnJBtNP8o7/KomTQkTuffZblrgXEW/10akwgVir66R0mUh3D
	 7SHcMXLy49OhPrOZpIDtYxkXIRwd4yXZ7bIlJMpsYtxoix1b8s4Qu6DcsM+gnFyBcq
	 JvXvVl3X5+VA217H4wNFYGJBblnHF+4pFSpmul38=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Kees Cook <keescook@chromium.org>
Cc: tools@linux.kernel.org
In-Reply-To: <20211202233836.2024510-1-keescook@chromium.org>
References: <20211202233836.2024510-1-keescook@chromium.org>
Subject: Re: [PATCH 0/2] patchwork-bot: Ignore empty context lines
Message-Id: <163943460494.66209.9818066449080666174.b4-ty@linuxfoundation.org>
Date: Mon, 13 Dec 2021 17:30:04 -0500
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 2 Dec 2021 15:38:34 -0800, Kees Cook wrote:
> I had several patches that seemed to be eluding the automatic state
> changing even though they appeared in mainline. This appears to have
> been caused by a mismatch in whitespace interpretation between git
> and patchwork.
> 
> -Kees
> 
> [...]

Applied, thanks!

[1/2] patchwork-bot: Ignore empty context lines
      commit: 8998144862b16cfa7a2ec07757d43ca269d59373
[2/2] patchwork-bot: Add --pwhash for debugging
      commit: ffe2576ac7731b7596e4bdb1c10ab9768f93ee09

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>
