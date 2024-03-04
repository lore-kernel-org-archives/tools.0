Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4482E7C09E
	for <tools@linux.kernel.org>; Mon,  4 Mar 2024 21:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709587945; cv=none; b=PboVGMvbgjROGtafNMgctbObRJ1Q3TPXDL32SPAUYD57Pv8XuMYJT66dRiNjxk1scJuEMJgnxRXZGSqB+52UywgvuQqV11Xg3gL0b8lzIpoQ/AFhknhiAzwCMHVOMSu2DVLdmzS0CIjTaCaQ0kxTteKOUsUp0yYNn1oQyjPjV64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709587945; c=relaxed/simple;
	bh=HWvZFoH8YfyL+1oh93WQhqlybFth9p201Jp45TYB8l0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=KmwgzBqaSlyxCqyQpNw3EB3HnYzxSUIfPzn8BMf/YUHCebe1oBEpUrkdlXpt3EoJNYIjD2jRvpBbK22UjEGCjbK6HREZ4oJfOe3VmSnguXbDm6t76B6haeEOpXZLuuej5WaKsoVr12IiTRnImNm0qKk+YdoMEdFtMmUuqWny7jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Vs9Nwq0y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Vs9Nwq0y"
Received: by smtp.kernel.org (Postfix)
	id 3BB74C433C7; Mon,  4 Mar 2024 21:32:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C18EEC43390;
	Mon,  4 Mar 2024 21:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1709587945;
	bh=HWvZFoH8YfyL+1oh93WQhqlybFth9p201Jp45TYB8l0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Vs9Nwq0yfQw2wpTHdA3NMAHlepTmjcdui3ZYgqZ+bTTrUoCLl6eLClvfmr7//hwqy
	 0LtjsasPVc/lTVSixL/Rwc8uGoidyiSFQuaptdHVBJ+Vtjdqcmv5HZyOFxgEeFGy/z
	 r1HAEkNuF6hx70WViyHTFiOoUYawghUFRclGegxQ=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: tools@kernel.org, Will Deacon <will@kernel.org>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Nicolin Chen <nicolinc@nvidia.com>
In-Reply-To: <20240304134241.20447-1-will@kernel.org>
References: <20240304134241.20447-1-will@kernel.org>
Subject: Re: [PATCH v2 0/2] b4: ty: Fix incorrect patch/commit association
Message-Id: <170958794467.8875.12454526353405240108.b4-ty@linuxfoundation.org>
Date: Mon, 04 Mar 2024 16:32:24 -0500
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev


On Mon, 04 Mar 2024 13:42:39 +0000, Will Deacon wrote:
> It's me again. This time I fixed my git configuration so that the
> authorship is correct and matches the S-o-B line. That's the only change
> since the v1 I sent on Friday.
> 
> Enjoy!
> 
> Will
> 
> [...]

Applied, thanks!

[1/2] ty: Try subject matching for every commit before using trackers
      commit: 8a3d8bfae18ad1f4c72b91e6a8d37e12f9b5dcb4
[2/2] ty: Remove unused 'matches' variable
      commit: bb6d9075ae89df46ad91e85466a7b01f6aa534d8

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

