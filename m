Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EEEA195F3A
	for <tools@linux.kernel.org>; Thu, 27 Jun 2024 14:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719500119; cv=none; b=ftBRLHS6gKqPd4h5wrJhWu1xUkovsZBq9gLGK7JbW7ZLkAbvK75W2P2SACSqvA3xSHjbpwlwt+7tXAD2JWBJ1XzZfIN7MlNfIQY/zfnn17deRTT6lm3VdjrbUfH0mZeFwdajs4jgjhpgby85aLAR0zxYpaY2YITwTuLCGmiA1Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719500119; c=relaxed/simple;
	bh=uQ/3hwoVjpaH0NqYO0rrexeQWfZ9vOMZXh/GFNmqEBU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bJ/49Oc/llU58cyY9NWmQclUCCkzjoHxB0Uiio6q+v7YfqCJwpA86J+zvhrKQ006qqxHUZAIB/wRZ9vYf/hMWpaAq4djYZefeVp+ldyusOez96F0o6DOtg5oDrUsVysGg+ChvyD4pRf73w7Zy+iug2/v/Z2ecHC0gkJDorUNI74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=0UBEqk3h; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="0UBEqk3h"
Received: by smtp.kernel.org (Postfix)
	id 054E7C4AF0C; Thu, 27 Jun 2024 14:55:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5F6CC4AF09;
	Thu, 27 Jun 2024 14:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1719500118;
	bh=uQ/3hwoVjpaH0NqYO0rrexeQWfZ9vOMZXh/GFNmqEBU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0UBEqk3h/bNkDVuT8gcXQFEaxrvl3A1mgHRqjvv9Q4ovkXWbBjqsikCTvcHSMHrc6
	 h/3/a9qowZFvZUU5m0/nYPrmgHmYkyqg+5yx5Yae6D+iJaiU66I1Qr+mdtjKxU4HvP
	 OuDdynSN+wU9ptGvFaVLd5mms/u2mF+pwEeA+rN0=
Date: Thu, 27 Jun 2024 10:55:15 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Conor Dooley <conor@kernel.org>
Cc: tools@kernel.org, Arnd Bergmann <arnd@arndb.de>
Subject: Re: patchwork & b4 failing to detect pull request
Message-ID: <20240627-notorious-corgi-from-atlantis-ef7acb@meerkat>
References: <20240627-unrest-rigid-c7bb9ac94bc7@spud>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240627-unrest-rigid-c7bb9ac94bc7@spud>

On Thu, Jun 27, 2024 at 03:23:01PM GMT, Conor Dooley wrote:
> It seems the trailing + in the tag, while accepted by git, could be
> the problem? At least, all other PRs that I have sent do not have a + in
> them and have been processed without a problem.

bugbot assign to me
