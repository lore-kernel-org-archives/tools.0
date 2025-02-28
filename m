Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 959F81ADC8C
	for <tools@linux.kernel.org>; Fri, 28 Feb 2025 19:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740769282; cv=none; b=VE+tUa3/ulNYlg5PtmP8KisnLiEnRTCw0zrIB20A89SBA/c5/AJSMxXrsQNPp+DA1dHNfnvKHR0d8sHeiRn/9SI3w//AGkGY9lAz8IkcfNXrSWgTEq/JIGWDDMNpn7A9Vo+5kTTck3SkXdAqc9dmoFo3aNOA1HMPRXQSdVujsrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740769282; c=relaxed/simple;
	bh=bRJnn40wmBjcgOU0Yd+CkLtTKGH0zSrBbolMhKY2hwc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=qj5llvrcu+ErtrP/D0AdXjkc2F22G1yTd+DK4rJST9HszU2rDZjb5rKu7YpAL1e3ofN+3OJowvL1BtIKCVHFDbzRDdQYXFE+91NkM5LJQ2cwmGNL8OEmg2cyUOjslttPGGxGqvrnTk77S+e4OVUFXOUctN7NBHEX2j2E96O8vFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=AXwg1G/l; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="AXwg1G/l"
Received: by smtp.kernel.org (Postfix)
	id 1ADACC4CEE5; Fri, 28 Feb 2025 19:01:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAEBAC4CED6;
	Fri, 28 Feb 2025 19:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1740769282;
	bh=bRJnn40wmBjcgOU0Yd+CkLtTKGH0zSrBbolMhKY2hwc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=AXwg1G/lfb8rgYDVPrk8Pv9Uu0thu+A3jTFS7dIjGoDB/jgWPrCLmvWThZ51rkueq
	 hxArzpgVbAWbL9k/TEIDzkcsBakV3vWZFvPpcDM0STvKIeXZuYxRkw0ELu3VWLdKuB
	 k0PUxQgfEanVR56BA/zIARHRcDOVOyzFmdzC1/Vg=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: tools@kernel.org
In-Reply-To: <cover.1740726978.git.u.kleine-koenig@baylibre.com>
References: <cover.1740726978.git.u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH pgpkeys 0/3] A few script updates
Message-Id: <174076928171.1336313.1368824728395564763.b4-ty@linuxfoundation.org>
Date: Fri, 28 Feb 2025 14:01:21 -0500
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-42535


On Fri, 28 Feb 2025 08:21:03 +0100, Uwe Kleine-König wrote:
> these modifications to the scripts in the pgpkeys repo helped me during
> my efforts around the PGP keyring.
> 
> Best regards
> Uwe
> 
> Uwe Kleine-König (3):
>   Make scripts executable
>   korg-{refresh,update}-pgpkeys: Use /usr/bin/gpg as default path for
>     gpg
>   korg-update-pgpkeys: Pass additional arguments of --refresh to gpg
> 
> [...]

Applied, thanks!

[1/3] Make scripts executable
      commit: ab07e31dd78aad215260345c55fd358e2d7a6061
[2/3] korg-{refresh,update}-pgpkeys: Use /usr/bin/gpg as default path for gpg
      commit: 1a02a40c3b9421881af80d894734f8cdc8ed66ce
[3/3] korg-update-pgpkeys: Pass additional arguments of --refresh to gpg
      commit: 5c1fae61a2e9d7c8352e9c7711a8b85e83374266

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

