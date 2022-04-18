Received: from out0.migadu.com (out0.migadu.com [94.23.1.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64BA12574
	for <tools@linux.kernel.org>; Mon, 18 Apr 2022 22:25:55 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kyleam.com; s=key1;
	t=1650320746;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6dMrXSWQaAP7WD53yJ+xdiE3EQmGTx6Qc9/vnvMY0w4=;
	b=SFvOPD3ifNxeer3mDNzqU8pvrsfA4zT861mkPBNeUw0d+WpZgLlZY4Hal6mgCdg4W3Nf0g
	n2BxB+5UZ/pyEBGDakfCe8q8on1r1/EaAE9qqDULQ5muQxsY0fPYSrBkJTEhM5hYDMtczR
	/HxhSaQNYB8HNJK/lo9PJlbTh3d8buQcTdv3mplFq9wEqMTzfL/dUxAOdMI1fhZXJ+BS9L
	WU/2e/4X8wE9Eta8PbLNH/KrF+fszkN0S8Y1+irvLn4419buEr7QaEP9sTiz9OqI0EM9B7
	kBHLz0CxiQA3pD1S/e4QxxlvtRx7ZY5iq87Jo6Q6NwxZIzt8gtXaVvlVHC6OwA==
From: Kyle Meyer <kyle@kyleam.com>
To: Josh Steadmon <steadmon@google.com>
Cc: tools@linux.kernel.org
Subject: Re: b4 doesn't notice updated base-commit
In-Reply-To: <Yl2gMy2Fgpe0TUZ5@google.com>
References: <Yl2gMy2Fgpe0TUZ5@google.com>
Date: Mon, 18 Apr 2022 18:25:42 -0400
Message-ID: <87tuaq81w9.fsf@kyleam.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: kyleam.com

Josh Steadmon writes:

> Hi, just noticed this minor bug in b4 v0.8.0: when fetching the latest
> version of a series, b4 seems to always advise that the base-commit is
> whatever was advertised in the first cover letter, even if the
> base-commit changes for later versions of the series. An example (from
> the Git list):
>
> ```
> $ b4 am -o - pull.1161.v4.git.1647843442911.gitgitgadget@gmail.com | git am
> Looking up https://lore.kernel.org/r/pull.1161.v4.git.1647843442911.gitgitgadget%40gmail.com
> [...]
>  Base: dab1b7905d0b295f1acef9785bb2b9cbb0fdec84
>        git checkout -b v4_20220228_gitgitgadget_gmail_com dab1b7905d0b295f1acef9785bb2b9cbb0fdec84
> ```

I can trigger the issue on my end too, but I suspect it's more specific
than "always [advising] that the base-commit is whatever was advertised
in the first cover letter".

For example, here's a thread that has a different base commit at v1 and
the latest version (v10), and the correct base is picked up
(b80121027d12 not 5d01301f2b86):

  https://lore.kernel.org/git/pull.1212.git.git.1643915286.gitgitgadget@gmail.com/

Perhaps the problem with the thread you referenced has something to do
with v4 consisting of only one patch and no cover letter while the
previous iterations had multiple patches and a cover letter.

The cover letter written by 'b4 am' suggests it's getting stuck on the
cover letter for the v3:

  $ b4 am pull.1161.v4.git.1647843442911.gitgitgadget@gmail.com
  $ ls -1
  v4_20220228_gitgitgadget_adding_new_branch_autosetupmerge_option_simple.cover
  v4_20220228_gitgitgadget_adding_new_branch_autosetupmerge_option_simple.mbx
  $ grep Subject v4_20220228_gitgitgadget_adding_new_branch_autosetupmerge_option_simple.cover
  Subject: [PATCH v3 0/2] adding new branch.autosetupmerge option "simple"
