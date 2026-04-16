Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D37E334C1F
	for <tools@linux.kernel.org>; Thu, 16 Apr 2026 19:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776367077; cv=none; b=bynGff3czX/KcJpyl8LqTw6vrlNKU18FF3Y83nvabWlOhlN1W/YsbbF2G4iUYGxns9KrOuMtSHAgoLzvTXa6hvOXMQ+G6SSTGvFtwJSDaeHn8x0M4jMrtQ8b2LIZABO+QBnJYJboBiyZnZzemR4IyWB9oIHmW6GkH8hXH2Pi1w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776367077; c=relaxed/simple;
	bh=gXjKfnrZc6W119YCtnvWtQAISX1u8aA1lzTxosBBX68=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e4WMTFD3fvCWQq92JtanobBzBzqbi5HPfSfxszqFFpzVTbDH9H2r0SdfT+2TMnPh4TJgOAppjV3QaBLkI2oAkTa/xsuyLc5/CyvwdmOno5DibWirq/PNkK3vq6CHwOQONDD/nWLE9fnKE0q3eeZkBuVQty1xDYCAyizsARQmUUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AssHtx0o; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AssHtx0o"
Received: by smtp.kernel.org (Postfix)
	id EF36EC2BCB4; Thu, 16 Apr 2026 19:17:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD995C2BCAF;
	Thu, 16 Apr 2026 19:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776367076;
	bh=gXjKfnrZc6W119YCtnvWtQAISX1u8aA1lzTxosBBX68=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AssHtx0oaexiXarKh91ChJCPicRs3fMzvNFg/2Mv24irmNjMYu7BIeoPPxa1dFo9E
	 drrSRumch3ZRp7lLwtTRWDaDbIJXszZHwLgjlBYoZNhlXnBQ3VC4G2nJsIelo+S955
	 2gO6abgF1SKY2VVsGWU462T3FiKxGoycx5Whx+RVLR8Je8DardOcL5BVAyEtMNU/ae
	 ywl2B/2DVBgCW9KdgJmy9F2hVhu6K97CeauLQzkZ8x1bstcv+af85qhA9rKhoH9VaM
	 h93BHvFz2lwHjqP6eXj+N8g1ExUl5tDFbaVJ/NqPhvJMc8X3cQ7O6q/Mj9/4rVszZd
	 w+/q5/aJOKvNQ==
Date: Thu, 16 Apr 2026 12:17:56 -0700
From: Kees Cook <kees@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Dan Rue <danrue@gmail.com>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	tools@kernel.org
Subject: Re: [PATCH] add sashiko URLs
Message-ID: <202604161217.0CB9B11@keescook>
References: <20260416112156.1059032-1-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260416112156.1059032-1-rppt@kernel.org>

On Thu, Apr 16, 2026 at 02:21:56PM +0300, Mike Rapoport wrote:
> sashiko is gaining traction and it's easy to add its URLs along with
> lore ones.
> 
> Signed-off-by: Mike Rapoport <rppt@kernel.org>

Oh yes please. :)

Reviewed-by: Kees Cook <kees@kernel.org>

-- 
Kees Cook
