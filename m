Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBCA31FCC71
	for <tools@linux.kernel.org>; Mon, 21 Oct 2024 20:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729541666; cv=none; b=tYd/su9/thbpFWIMEXf4GA5gkEOlnuDsVxVnxRr95D6CsCE9J9hJRy768H8BY4XNKTmNEgKmo/t0Jj5yr0DYz3zkT3TLBqlxlFzC1iC652r6iOkGiAwl6y5EKc3VDkU9SYZMH5e0WhO3rMwRyaEgaizgRJcT8RciAez01Q9iMY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729541666; c=relaxed/simple;
	bh=yMtogxUbj6LrECsQljIfqxkR+BzflTTWewuZ48w2WMU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aalUNBT/Q8DP0mTeSbA/JUmIQLsR4MLEm1xnABX/y35VL4QQ4qlsbS3SDHGYeWUb3UOqm36w5LBE/GRrxSyG4Tp0bzNMfwvNqFfl7RAiwBEqUbTg4x2npovutLsukZbqAxYLMGMDdBHQYyyIR8lhCOSG6YV2RbDCl8nbq97Pg2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=whLTMYFK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="whLTMYFK"
Received: by smtp.kernel.org (Postfix)
	id DFF13C4CEC7; Mon, 21 Oct 2024 20:14:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8385C4CEC3;
	Mon, 21 Oct 2024 20:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1729541665;
	bh=yMtogxUbj6LrECsQljIfqxkR+BzflTTWewuZ48w2WMU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=whLTMYFKd/G+cKdWxrv7f/Q8lcR0aMIxW7BLELSVkgma1Fb+kKr4twpadp9AV182k
	 Senatmcr4N8cqwSN0jqa/Kcc/gvShxCdLU1ZAyU0MP8DOGvepMpzEXXqqmwlTYc/Uh
	 nPuMGoyCrGyMkQxWBOdwUa1e7IvdZyEVKKBWZZMA=
Date: Mon, 21 Oct 2024 16:14:24 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Cryolitia PukNgae <Cryolitia@gmail.com>
Cc: tools@kernel.org, Celeste Liu <CoelacanthusHex@gmail.com>, 
	Yao Zi <ziyao@disroot.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: Missing `Signed-off-by` line in patch email
Message-ID: <20241021-cream-grasshopper-from-betelgeuse-db60fd@lemur>
References: <CAANcMPn=CYhCUAOAooGAKXXSYyOpxpj6dEAssUtQ7Zd9PY0BqQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAANcMPn=CYhCUAOAooGAKXXSYyOpxpj6dEAssUtQ7Zd9PY0BqQ@mail.gmail.com>

On Sat, Oct 19, 2024 at 01:43:01PM +0800, Cryolitia PukNgae wrote:
> I am a newbie recently using b4 to contribute to kernel.
> 
> Several months ago, I sent a patch with the wrong format.^1
> 
> I forgot to sign off my commit, but when I run `b4 prep --check` , it
> didn't warn me about it.

Interesting. If I run checkpatch without --mailback, it reports the error:

    $ git --no-pager show --format=email --full-index --binary --patch-with-stat \
        --encoding=utf-8 97fee61300b9c3eb200f9d1f180966acaa288f82 \
        | ./scripts/checkpatch.pl --terse --no-summary --strict --showfile
    Documentation/hwmon/oxp-sensors.rst:58: ERROR: Missing Signed-off-by: line(s)

However, if I add --mailback, the error is gone. This doesn't make sense to
me, but I'll raise this with checkpatch maintainers.

> I used `b4 send` to send this patch to maillist, b4 appended the
> "Signed-off-by" line below the wrong divider.
> 
> My origin branch is on Github.^2
> 
> 1. https://lore.kernel.org/lkml/20240726-typo-v1-1-3ca3f07f93e9@gmail.com/
> 2. https://github.com/Cryolitia-Forks/linux/tree/b4/typo

Thank you for the report. I'll see if we can handle this situation more
properly. For my record, this is what is happening:

1. There is only one commit, and it is missing the S-o-b.
2. The cover letter has the standard S-o-b.
3. When we "mix-in" the cover letter under the "---" divider, the S-o-b
   trailer from the cover letter is added under the divider.

My preferred solution would be: when mixing in cover letter content, move all
trailers from the cover letter into the first patch.

-K

bugspray tag me
