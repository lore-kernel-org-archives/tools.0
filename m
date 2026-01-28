Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319CD2EA169
	for <tools@linux.kernel.org>; Wed, 28 Jan 2026 21:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769634667; cv=none; b=WblTHBnLbFX771IAp+7FoWmL0zEgA0D4QpK5fbwl6NDk1Nezn+2A6c7NCpQjFF8PETlDxElibRSoQcA1o2LkZ9m5/5JHZfnt9MCkuawl28gMsjp9VWAULq6XvXuslY7kmHJwyjsTQ8IfFpNUF5rnQySHm0uiDKu/BUCgbcM4t/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769634667; c=relaxed/simple;
	bh=v+g8JiKdgM/wsSY52UMAD4MTc56YizOMV0kO3pKKNTg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b1A6htV+lk0792capd6lr0afmjqlRAvm772DBLciIyHkfDJeBzIARP/8CcKBLN6JcKkfoFSoLp4P9Son1ywe3f/7UMBxpeYY90TfOJQsEPN0xFUzx+KYf9bwav0kdSI46rh9aPm9JKz8p4W5VeesiWNBSuqoImssMnm/85+iEFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ic/wKeJB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ic/wKeJB"
Received: by smtp.kernel.org (Postfix)
	id C0FCEC4CEF7; Wed, 28 Jan 2026 21:11:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E687C4CEF1;
	Wed, 28 Jan 2026 21:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769634666;
	bh=v+g8JiKdgM/wsSY52UMAD4MTc56YizOMV0kO3pKKNTg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ic/wKeJBCKQRv28YXlk/qKLRY4wJWn9mvAjAuDJIe8G6X1CAKTbcG2puLvWZp4FrM
	 XakG7D2u/fYFN9mzZaK7Ff9lLhBuWdhUSAi+/2nGuMh+gNNyLW9xg7scq1GErshAG/
	 dsar44/c1DEwGWgYQB918zulqfHWsXlv2ApDnLwV27MbMQ/XTSjQyE9zHVkSXDLnf/
	 4SnXjhDoff/JBCDXHG/mLSLgPB/EdGoCynAwDVV+Pxo5oi/v51egiLd9hLQlL1u8Ap
	 9kmo78+KMNxXcXg+UEjuY58Kr07+VCUz1vlIXVj834xf96HSkl/GwJSCRJgfKdZJiN
	 DOWNQedoAvLXg==
Date: Wed, 28 Jan 2026 16:11:05 -0500
From: Konstantin Ryabitsev <mricon@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@kernel.org
Subject: Re: kgl track-subsystem crash
Message-ID: <20260128-successful-pegasus-of-innovation-4cd273@lemur>
References: <e2416f79-9bfb-4f72-8751-f300e9922223@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e2416f79-9bfb-4f72-8751-f300e9922223@sirena.org.uk>

On Wed, Jan 28, 2026 at 08:54:57PM +0000, Mark Brown wrote:
> Hi,
> 
> With v0.5 I get:

Thanks! Looks like this is an old bug that would have tripped up on all repos
without any commits. There's a fix in master and in stable-0.5.y that should
prevent this from happening. Let me know if my assumption was incorrect.

-K
