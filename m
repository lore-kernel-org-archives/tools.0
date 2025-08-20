Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75AB62D3EC0
	for <tools@linux.kernel.org>; Wed, 20 Aug 2025 20:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755723585; cv=none; b=HWevh81KUUbt0tg3qhbsJIb7dE6qi/hOfvAjmfHnRt9zchJtQVElpaOHwAQfzUjiFiJowv5o9xe0gT6DpIkxK7BxlGb90CMqBsEurOyywTeGmaDKj2sSUK6GM/5RgVhwQlV4GhibtXqDHc3h+hEMadqpuXOGwgxqKTz0JYzE/W0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755723585; c=relaxed/simple;
	bh=RmONbtWi4Ai6JLAdDyiUfbQxj/NHxMCrZ7o8Tgh3ONA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dlXRkjCLwHupDj9+20r2m1n9HfpTQPQZOm7fsry2iRUKhw5ueS+H/BCmFfs0v8s5H7jvlvOjRZBvpOIuo4EBcTBMx15RdlWT7WU2avF4yJy6n3xmSzilHyEt/iJjx/CPcnaOFEkNZGsJyDnibHEIkaWXr3OAPKND8vn7UGmjoas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=CN69XTJQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="CN69XTJQ"
Received: by smtp.kernel.org (Postfix)
	id 17085C113D0; Wed, 20 Aug 2025 20:59:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3BB2C4CEE7;
	Wed, 20 Aug 2025 20:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1755723585;
	bh=RmONbtWi4Ai6JLAdDyiUfbQxj/NHxMCrZ7o8Tgh3ONA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CN69XTJQNSWKELkOFjnpJq4xsOAd8ywYWFErI/HfRa+qmn6/Xy9oIKkNOi+NQKpJq
	 dKRx2EsPQHeCnfZxJMuNUjEHCqJI/qCaI9y0QatVgQeCAelsP7GdmptYXWI1X6Gz5u
	 KX6Xf+1llpxysdmxhHKacVXuqYkOEbT10Qcq/nY0=
Date: Wed, 20 Aug 2025 16:59:43 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: tools@kernel.org
Subject: Re: [PATCH] use username without empty comments from gecos field
Message-ID: <20250820-delightful-locust-of-effort-8ef7e4@lemur>
References: <20250820201515.9606-1-andreas@kemnade.info>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250820201515.9606-1-andreas@kemnade.info>

On Wed, Aug 20, 2025 at 10:15:15PM +0200, Andreas Kemnade wrote:
> avoids trailing ,,, at usernames.

Can you give a slightly longer commit message? It's not clear to someone not
familiar with how gecos fields work why this would be needed.

> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
>  src/b4/__init__.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/src/b4/__init__.py b/src/b4/__init__.py
> index f425fd6..3a7098f 100644
> --- a/src/b4/__init__.py
> +++ b/src/b4/__init__.py
> @@ -3165,7 +3165,7 @@ def _setup_user_config(cmdargs: argparse.Namespace) -> None:
>              USER_CONFIG['name'] = os.environ['GIT_AUTHOR_NAME']
>          else:
>              udata = pwd.getpwuid(os.getuid())
> -            USER_CONFIG['name'] = udata.pw_gecos
> +            USER_CONFIG['name'] = udata.pw_gecos.removesuffix(",,,")

I think it's best to just use strip(",") here. We still have >= 3.8 in the
pyproject.toml and removesuffix() is 3.9+.

Thanks!

-K
