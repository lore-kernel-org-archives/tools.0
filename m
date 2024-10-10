Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E821CB51C
	for <tools@linux.kernel.org>; Thu, 10 Oct 2024 14:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728569316; cv=none; b=DzYG5Y64FL2c886K9kCEv2uAx5rSkJrdVDAwPgWkb+DPs/1YBOWIvj9E5mU4m/A8JwcKyszXHc6Sxsb3cQL3Qqz2EIRot3ufwPDbHklTOwoCOteZOV47mx4LjzssUbkQ+gf8n3aflZEp75fSAl+2ORes06jpxIqGvexpyvJ/Wu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728569316; c=relaxed/simple;
	bh=ItVZFEk+DcQW1g14HjitPGQ7fSdgk2mXr1UQo9909TI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JDIDStrRhVIjQhPRzYyF/OU9yvvocLfLNHdR2QzRXtlxrpwBsy8erbGIZFIh127M5DYwBmbyL+Wz9YurDaEDc8FlrKxFnbO0I1xif3N/lFyP7tGxtwp+ncs/pwszroRz30TxZ+Ah/hhb84Q1jqujMRXQ8iH65JnuPE2QGXGpwo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=zbC452nl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="zbC452nl"
Received: by smtp.kernel.org (Postfix)
	id CB039C4CECE; Thu, 10 Oct 2024 14:08:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94BA0C4CEC5;
	Thu, 10 Oct 2024 14:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1728569315;
	bh=ItVZFEk+DcQW1g14HjitPGQ7fSdgk2mXr1UQo9909TI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=zbC452nl4rIwWZHJjLiG/CuHjv+Jnxv0OB/fGoMS3QV2IUYRYoRAQ9yTARJEE6+PZ
	 JsA0kKrSAdOzBqfhDbOWf4N0pDvLs1If1+Ojx7erPgD+fwNkwvl+kFvfjbOnPK66go
	 NoBF34W6HglUZeXcZg1q7kuguja9mPAPTxnUbDL4=
Date: Thu, 10 Oct 2024 10:08:34 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Christian Heusel <christian@heusel.eu>
Cc: tools@kernel.org
Subject: Re: b4 crashes due to type error when signing with gpg key
Message-ID: <20241010-qualified-airborne-muskox-2cdf05@lemur>
References: <9ebef39e-ec9d-403c-a0f2-9a3176d71c1a@heusel.eu>
 <20241010-refined-important-mole-a56fc5@lemur>
 <52dc54e8-b7a3-4892-aec4-067d8e8c331d@heusel.eu>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <52dc54e8-b7a3-4892-aec4-067d8e8c331d@heusel.eu>

On Thu, Oct 10, 2024 at 03:51:03PM GMT, Christian Heusel wrote:
> Note that I have moved the "-K" forward, since in the order you sent it
> it just printed all the keys.

Woops, -K is just my signature, not a PGP flag. ;)

Can you please rerun with just:

    gpg --with-colons --fingerprint "$(git config --get user.signingkey)"

Regards,
-K
