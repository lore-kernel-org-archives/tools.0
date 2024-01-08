Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6751046534
	for <tools@linux.kernel.org>; Mon,  8 Jan 2024 20:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="m8w7pXY7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC576C433C7;
	Mon,  8 Jan 2024 20:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1704746737;
	bh=8cOWjBr4Khf8XH3cqx+u3YIwDY76L6gYN2DsNPXUnC0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m8w7pXY7zzgeWWIAn3swSrlYAw3beiNo7uimE+4kPYYZIogCYqv+GIxumFXAr9zs8
	 eDT+ve+0Ro1E65oe1a06h4iY3nibyQ78/7og6gSCzcBE5O5D6cbgdr+NSGeCU4NEiq
	 02Zg25pdFqDK87FZwpsAcauz0UhefzQB4BUo46Kw=
Date: Mon, 8 Jan 2024 15:45:35 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Paul Moore <paul@paul-moore.com>
Cc: tools@linux.kernel.org
Subject: Re: Problems with patatt and stacked-git's patchset cover letter
Message-ID: <20240108-urban-nice-hyrax-a0ee5f@lemur>
References: <CAHC9VhRCTKD7qwm7u9EvudWkY9nw+CSS1HCOdr5c8OWBU1LCEg@mail.gmail.com>
 <20231222-secret-thoughtful-zebu-fedba6@lemur>
 <CAHC9VhRTQPAfTutfXQt3yk9267EHdDpSGqE-=GnEAyspSvQ-Zw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHC9VhRTQPAfTutfXQt3yk9267EHdDpSGqE-=GnEAyspSvQ-Zw@mail.gmail.com>

On Fri, Dec 22, 2023 at 05:20:47PM -0500, Paul Moore wrote:
> > Can you verify that stgit creates cover letters without the From: header?

Picking this back up after the holiday hiatus.
>   % stg email send --to=selinux -a --compose --dry-run
>   ...
>   error: `git send-email`: >>> HOOK DUMP
>   From Paul Moore <paul@paul-moore.com> # This line is ignored.

It's just like above, "From " instead of "From: "? That seems wrong.

>   Reply-To:
>   Subject: SUBJECT
>   BODY TEXT
>   fatal: /home/.../.git/.gitsendemail.msg.C_MjHr.final: rejected by
>     sendemail-validate hook
>   fatal: command 'git hook run --ignore-missing sendemail-validate --
>     <patch> <header>' died with exit code 1
>   warning: no patches were sent
> 
> However, if I send a patch without a cover letter I see this:
> 
>   % stg email send --to=selinux -a  --dry-run
>   ...
>   error: `git send-email`: >>> HOOK DUMP
>   From 99e622c26aceab38caec40ba173cbf5044adcac6 Mon Sep 17 00:00:00 2001
>   From: Paul Moore <paul@paul-moore.com>

This is the line we need ^^ for things to work.

> I'm happy to provide more debugging/testing help

I'm not familiar with stgit -- how does it keep track of the cover letter? Is
that something that you're creating on your own?

-K
