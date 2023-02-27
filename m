Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F32128E1
	for <tools@linux.kernel.org>; Mon, 27 Feb 2023 21:35:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84978C433D2;
	Mon, 27 Feb 2023 21:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1677533755;
	bh=eSCDuMHZ4aUKKtSJMc8FbZrLFR4Iruh8sdRdjzrPPx8=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=yhV2A/13NuD98anaN6izF5A3iCyg9GUeYfd/3HA/VlKX8O3IymVFPYnmaQzMD/BOP
	 EOvdD7vUqNYCKRR1/BvZTQPDhYh8k5ePslPSaHzvqyRQMk/skxKCpqe6MQ+WpmHkh7
	 aAGGUCmvAEJwTIb4yS5WTa5k8SynBswBHnbQQ/xM=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Tools" <tools@linux.kernel.org>, 
 Philippe Blain <levraiphilippeblain@gmail.com>
In-Reply-To: <20230219-send-iterations-in-same-thread-v1-0-59b802382eb5@gmail.com>
References: <20230219-send-iterations-in-same-thread-v1-0-59b802382eb5@gmail.com>
Subject: Re: [PATCH b4 0/3] ez: allow sending all versions of a patch
 series in the same thread
Message-Id: <167753375541.1113499.10387934728460538344.b4-ty@linuxfoundation.org>
Date: Mon, 27 Feb 2023 16:35:55 -0500
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-14a61


On Tue, 21 Feb 2023 20:29:16 -0500, Philippe Blain wrote:
> Sending a new iteration of a series in the same thread as the previous
> one is the preferred workflow on some lists, the Git mailing list being
> an example [1].
> 
> This series allows that workflow in b4 by adding a '--same-thread'
> option to 'b4 send', with an associated config option.
> 
> [...]

Applied, thanks!

[1/1] ez: allow sending all versions of a patch series in the same thread
      commit: 14a6165754778b83cdfb0b546f5bf23cecb84744

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

