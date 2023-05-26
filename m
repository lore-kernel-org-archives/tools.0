Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B853829106
	for <tools@linux.kernel.org>; Fri, 26 May 2023 18:25:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97BF3C4339B;
	Fri, 26 May 2023 18:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1685125556;
	bh=VLLPR9OfoJ1MMhZ334eYQmpWK96MZ85o0J5LE4mcEVU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=qQkfyRxdVcaon5gljWuSTAW1EZCXHeono7g0bMY/uY83E8FH5TGg0sHvJODgDJjXv
	 O3rlg/nlBIulGcnWn4Ui2sma3hSJpnXpuKQaYQwAn3OO6NRnfBfMUHn9S7P9VDBYY7
	 wTMwMu6Vpjds5lA1RuG+soWroxk34dSIdFjzXoJo=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: tools@linux.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Cc: conor@kernel.org, palmer@dabbelt.com, 
 Palmer Dabbelt <palmer@rivosinc.com>
In-Reply-To: <20230330110909.355701-1-conor.dooley@microchip.com>
References: <20230330110909.355701-1-conor.dooley@microchip.com>
Subject: Re: [PATCH] shazam: warn when overriding base-commit with
 --merge-base
Message-Id: <168512555540.61991.10042284962793080066.b4-ty@linuxfoundation.org>
Date: Fri, 26 May 2023 14:25:55 -0400
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-91592


On Thu, 30 Mar 2023 12:09:10 +0100, Conor Dooley wrote:
> If the --merge-base argument is provided, base-commit information that
> was provided by the submitter is ignored. This behaviour is intentional,
> but warning the user that this has happened (and what the intended base
> was) is helpful.
> 
> To be able to do this, base-commit can't be set from mergebase until
> after parsing the submission and attempting to guess it.
> 
> [...]

Applied, thanks!

[1/1] shazam: warn when overriding base-commit with --merge-base
      commit: 91592bf5d05f312225bf4f49d8bcc9508041bee2

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

