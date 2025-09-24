Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD7C3043CF
	for <tools@linux.kernel.org>; Wed, 24 Sep 2025 13:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758720721; cv=none; b=mZBqQtuhYmcWKAKhjdlpgZOthj9nTXAaBrw/NDGYA5LGO1wwozl7Z6wg/wnm0AgKmn1E/2DGS3lVXxwQkweh/e/ANI5eDXDPGY8xUgSw2XIKwHzdToAt6kMP2/J47tZMehY1eWCPoBpFXEJfh6Qsd30eKu9ae3c6N/sbWXDrhHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758720721; c=relaxed/simple;
	bh=1cA5D0W7clNNoGLVo6eUuwyp7mScRcQ2dxW1T2EYfYM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UA0vDFJ7tSB/PLVwpC+c8D+gBQzp8zWXrbQtEggEb+Ww8K2u28Yfw0UoT3tK8/hGzIv03rsZkBiqHBHicUwlulymHQ3p+dQiIDTfNRsF5NdHvJlm7+1k9Yo9OJBgszsdM7jaQoZIqDW8t7uJrHj2RSuWWeVeqfBBECNL16UuIH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=TvOu7ePb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="TvOu7ePb"
Received: by smtp.kernel.org (Postfix)
	id 150FDC4CEF7; Wed, 24 Sep 2025 13:32:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D232BC116B1;
	Wed, 24 Sep 2025 13:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1758720721;
	bh=1cA5D0W7clNNoGLVo6eUuwyp7mScRcQ2dxW1T2EYfYM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TvOu7ePbm99zZoz4IXgg0oaSm4tAFjWYUbe9B3PJDLZtK6ts0nOQknPFrwnvinafz
	 NKcUAuGnu0SO9jYLM4RTV3WeYSLIcgpe8sr6a4nlVULwPcs09jjEw0V4+PmTsTAomU
	 zCcoX4lfGMHvnduVpQKvF+SRvz6fx6Vd5fJNuxoM=
Date: Wed, 24 Sep 2025 09:31:59 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Vincent Mailhol <mailhol@kernel.org>
Cc: tools@kernel.org
Subject: Re: [PATCH v3 00/20] can: netlink: preparation before introduction
 of CAN XL step 3/3
Message-ID: <20250924-thundering-fluorescent-okapi-84a2ee@lemur>
References: <20250923-canxl-netlink-prep-v3-0-87a7684333f3@kernel.org>
 <13f98eed-b535-4360-a545-0a11dbc8aa12@kernel.org>
 <20250923-rose-shellfish-of-wealth-c8dee7@lemur>
 <715c6b6d-5672-4ba4-99d1-04fcd1dbb81b@kernel.org>
 <20250923-impossible-splendid-rabbit-ba01ba@lemur>
 <765d72bd-395f-462c-9c04-d2dd98244845@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <765d72bd-395f-462c-9c04-d2dd98244845@kernel.org>

On Wed, Sep 24, 2025 at 05:32:35PM +0900, Vincent Mailhol wrote:
> > Dropping others for now, and just adding the tools list.
> > 
> > What is your net-next/main pointing at right now?
> > 
> >     git rev-parse net-next/main
> 
>   $ git rev-parse net-next/main
>   df1526752e0cd8db11b1fd4c1be3bd47409fd3ac

Grumble-grumble... I can't make it happen for me. I only get the expected 4
patch-ids:

      base-commit: df1526752e0cd8db11b1fd4c1be3bd47409fd3ac
      change-id: 20250831-canxl-netlink-prep-9dbf8498fd9d
      prerequisite-change-id: 20250915-can-fix-mtu-050a94b563a0:v2
      prerequisite-patch-id: 64b7803b5453bdd2ada5f2918901ad092e4ea1cf
      prerequisite-patch-id: 6aecc3f1db1cd342e3b204310464179ca66b52ba
      prerequisite-patch-id: 10e3a79796f2966733349c4cfcc1a61a49bc20af
      prerequisite-patch-id: 5ddc3c20a99f60bddb62d58eb192facf0eb25b75

Could you run it with debug:

    b4 -d send --dry-run --no-sign > /tmp/debug 2>&1

Then send me the debug file off-list?

-K
