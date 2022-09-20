Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2767B6135;
	Tue, 20 Sep 2022 17:10:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FC5DC433D6;
	Tue, 20 Sep 2022 17:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663693804;
	bh=rGAe8Kg3OqzcfYoFWq8p+5VPbN6wJs+msQyjFPvQvKs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YTyz+2tZig2FzTyXnWSTNC7JyQjr0aZJq7h3l0yVtt2snx5DB9jT1xMtKrttEVtc+
	 i15NPLyj3mFsmjC1kLymM3pakuaUENukz7KGT5ZrDJznHsRgDK6qSIl6GBzRITd4iM
	 XVEe2QUc6DweF+iexC95EeJMj8Od/t/imZPUAto/HnQq28xfzPQF8IKTMAGg5s8+/5
	 49aTOpHsuWUsUO3MhqK3efZyzHLNWpqiyyTTWLaRZPzvzUgSn+nrbIEtXfWtNtxvu4
	 UKmx2bgLEpE7wihFwC3MZRlml9uPD+DeuA01id1oHCUKeXAyIc+vuzrrHwLlU2U2zk
	 /hqVApm/ZzfaQ==
Date: Tue, 20 Sep 2022 20:10:00 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: b4 v0.10.0 is available
Message-ID: <Yynz6A51ULumuBVJ@unreal>
References: <20220916181319.okfskienqh6kfeor@meerkat.local>
 <YymDlmJG8fNhvHSY@unreal>
 <20220920144855.bxe4qtmibbu472rh@meerkat.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220920144855.bxe4qtmibbu472rh@meerkat.local>

On Tue, Sep 20, 2022 at 10:48:55AM -0400, Konstantin Ryabitsev wrote:
> On Tue, Sep 20, 2022 at 12:10:46PM +0300, Leon Romanovsky wrote:
> > Hi,
> > 
> > I got the following splat when tried ty functionality:
> 
> Thank you, that's due to the new feature that supports sendmail wrappers,
> which is not something I tested with "ty". There's a fix in the latest
> master/stable-0.10.y

Thanks, it fixed the splat, but I still can't send emails with ty.

➜  kernel git:(wip/leon-for-next) ~/src/b4/b4.sh ty -aS
Auto-thankanating commits in wip/leon-for-next
Found 10 of your commits since 1.week
Calculating patch hashes, may take a moment...
  Located: [PATCH] IB/hfi1: remove rc_only_opcode and uc_only_opcode declarations
---
Generating 1 thank-you letters
  Sending: Re: [PATCH] IB/hfi1: remove rc_only_opcode and uc_only_opcode declarations
---
Sending via "/usr/local/bin/msmtp-enqueue.sh"
  Re: [PATCH] IB/hfi1: remove rc_only_opcode and uc_only_opcode declarations
---
Sent 1 thank-you letters
➜  kernel git:(wip/leon-for-next) msmtp-listqueue.sh
From: Leon Romanovsky <leon@kernel.org>
To: Gaosheng Cui <cuigaosheng1@huawei.com>, mike.marciniszyn@intel.com, jgg@ziepe.ca,
Subject: Re: [PATCH] IB/hfi1: remove rc_only_opcode and uc_only_opcode declarations

➜  kernel git:(wip/leon-for-next) msmtp-runqueue.sh 
*** Sending 2022-09-20-19.58.31.mail to  ...
msmtp: no recipients found
FAILURE

➜  kernel git:(wip/leon-for-next) ls ~/.msmtpqueue
2022-09-20-19.58.31.mail  2022-09-20-19.58.31.msmtp

and 2022-09-20-19.58.31.msmtp is empty.

BTW, git send-email ... works well.

Thanks

> 
> -K
> 
