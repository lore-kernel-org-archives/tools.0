Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3002331D730
	for <tools@linux.kernel.org>; Fri,  5 Sep 2025 15:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757087821; cv=none; b=S8jWtFqEhCi2PAF459JVrs0KYtQq7ti/VIWm3pcQV6j9eB+uilJiOTqkSyJx8QQUsj6lyWqUBZsXAJieMyQNeG6yoywqe6ijEF+rVNgliXEKxwwqanrKVGxHz/fSuZhh/McDj7kszn3wDoGB2Is2f8ePUBcaAnSYnb8BBEwpNQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757087821; c=relaxed/simple;
	bh=NruAypT2IwUbHmWy76j3dIIQgWFyfmf6sMKyggV+hss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QTWo9NXRlLsGJinLIjrERjbktBpVSmMwTcxVcld1IQ2rT+r5DKILQjiA7gVEJfITzH67Bc0jSIotUNPyE3K1ljAMzkMekwf9LCHK6I+xU6td8XvXWle+Vffn/7xoxy5rv0xnycnzxvdnlDAjCfinXVegLymEjsYSSj5T20lDyfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=1q5KrMmG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="1q5KrMmG"
Received: by smtp.kernel.org (Postfix)
	id D0B9CC4CEF4; Fri,  5 Sep 2025 15:57:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99821C4CEF1;
	Fri,  5 Sep 2025 15:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1757087820;
	bh=NruAypT2IwUbHmWy76j3dIIQgWFyfmf6sMKyggV+hss=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=1q5KrMmGvbcmqu2an8vX2oiZDVM9Orko1gRkKTk4qeRGn9c5D1lgnWEzZTYXr0LO9
	 K7OnwxWnJgS9t7BGYsK3f6oYcHyINnszDRBowWJ6ohxz2KAWqi5+CM7peLtV0rspLd
	 qMWJ66pHcrzXO38IijkqYBVH5CuX+lMAbv71eLCA=
Date: Fri, 5 Sep 2025 11:56:57 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Jonas Rebmann <jre@pengutronix.de>
Cc: "Kernel.org Tools" <tools@kernel.org>, kernel@pengutronix.de
Subject: Re: [PATCH b4] Don't parse nonstandard git version suffix
Message-ID: <20250905-chocolate-jackrabbit-of-youth-ff3d17@lemur>
References: <20250905-versionparse-v1-1-48d926da9c10@pengutronix.de>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250905-versionparse-v1-1-48d926da9c10@pengutronix.de>

On Fri, Sep 05, 2025 at 02:08:15PM +0200, Jonas Rebmann wrote:
> In snapshot builds of git, git-version yields a modified variant of the
> git-describe output, e.g. 2.51.0.178.g2462961280 instead of
> 2.51.0-178-g2462961280 for seemingly historical reasons.

Right, and this may actually break Google's internal git versioning as well.

>  def git_check_minimal_version(min_version: str) -> bool:
>      ecode, out = git_run_command(None, ["version"])
>      current_version = out.split()[2]
> +    # Strip version suffix to work around git-version's non-standard output in checkpoint builds
> +    current_version = re.match(r'^[0-9]+\.[0-9]+(\.[0-9]+)?', current_version).group(0)

I'd rather we simplified this into:

    ecode, out = git_run_command[None, ["version"])
    current_version = re.sub(r"git version (\d+\.\d+)\..*", r"\1", out)

We really only care to know the first two numbers anyway.

-K
