Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4714C7C
	for <tools@linux.kernel.org>; Tue, 18 Oct 2022 15:32:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C01CC433D7;
	Tue, 18 Oct 2022 15:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1666107120;
	bh=727iIgR5co0U7PnAfGKxwcrM2/HtYVIZJLWz4ulatgA=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=kpScpV4ib09AgNoiRwx/cDwq5VseN6jMd/j/fXoLkaBAAZB+uCMkivF1LsIB/nFfY
	 2no/itynNQffZnUGcrFCO/xGI2twe6I0IAve4tTaNvYQWZrpLjejabQ74YFnhI7/8k
	 grBuwlmKgweZ7LnMCkl0xT8AfZYdgVjWSlL76Y4o=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Palmer Dabbelt <palmer@rivosinc.com>, tools@linux.kernel.org
In-Reply-To: <20221013181031.23823-1-palmer@rivosinc.com>
References: <20221013181031.23823-1-palmer@rivosinc.com>
Subject: Re: [PATCH] shazam: Don't use "git merge --edit" when non-interactive
Message-Id: <166610709704.772106.15973782576103319141.b4-ty@linuxfoundation.org>
Date: Tue, 18 Oct 2022 11:31:37 -0400
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.11.0-dev-ce3c3

On Thu, 13 Oct 2022 11:10:31 -0700, Palmer Dabbelt wrote:
> Most text editors are interactive, so call "git merge --no-edit" when in
> b4's non-interactive mode.
> 
> 

Applied, thanks!

[1/1] shazam: Don't use "git merge --edit" when non-interactive
      commit: ce3c3dfae4bae26175a92e1723e63cda0fcc5154

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>
