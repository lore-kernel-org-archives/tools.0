Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35DB93271E4
	for <tools@linux.kernel.org>; Fri,  5 Dec 2025 15:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764949593; cv=none; b=M7lbd/XlYRD79sbAuc0lJQYCTOmhpax1ScMhDo8tlEh2eOUqgTKVBNTJfyKQPKrndvTcciCLbcHcwXX5mlhJ3HECXtbRtpJ3Hdpw3mWexy/xAvB6sKf8eJ/X8wImNPqt1d6CKSmBhyGUVF/5A98ATPP4b0x9QAY5gwBcycD4hSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764949593; c=relaxed/simple;
	bh=i7Y3m61lvCE4i0DenPuTfQFL7UcBAoX64zpp92jOqw0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OGPxRsp66BBWbwMksM4388bI10q5EvL81h86UTkUiFgUm4hMcIJftIUrNkxcMnwqeMGUgBd8LFIZewMBT8wHti8+++MbY5BfKIfnmlzwes3RlhqbACe8DpV1C0qdrkbus6I9F6/iMBbqkdVhuEksveWe2tj/DSPnfgx0Pg63/HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=NGRys0nz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="NGRys0nz"
Received: by smtp.kernel.org (Postfix)
	id 6D584C116D0; Fri,  5 Dec 2025 15:46:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30283C116B1;
	Fri,  5 Dec 2025 15:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1764949590;
	bh=i7Y3m61lvCE4i0DenPuTfQFL7UcBAoX64zpp92jOqw0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NGRys0nznHz8SoTuzxFqdFE0PQYelq++/D9HWuoeAsZWxyjnqiv39Ugqc2MZ+XKwP
	 jI7MbXKz4+FKM6G3FMbQFoNdpBVkDPNx5so6pd0BFOBcGoGyuHdBH/dxlBZZzAEp4b
	 BM/KEBH/U+rLdrc6ORuoe8W8sl0LppvoyLvh/2xE=
Date: Fri, 5 Dec 2025 10:46:29 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: "Kernel.org Tools" <tools@kernel.org>
Subject: Re: [b4] b4 diff on multi-patch series does nothing (and fails)
Message-ID: <20251205-natural-chameleon-of-thunder-bcd89a@lemur>
References: <3f1646bd-3802-4bd3-8ecd-2ea6ffb16e4d@cherry.de>
 <20251204-quoll-of-sublime-skill-8a039c@lemur>
 <20251204-prudent-free-partridge-ea14b9@lemur>
 <fb39b81e-3533-42c7-8ddb-84a09a7bf43b@cherry.de>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <fb39b81e-3533-42c7-8ddb-84a09a7bf43b@cherry.de>

On Fri, Dec 05, 2025 at 04:45:22PM +0100, Quentin Schulz wrote:
> > Looks like there may be a bug with search threads download in v2.0. I've
> > reported it upstream:
> > https://public-inbox.org/meta/20251204-modest-jaybird-of-will-9d55dc@lemur/T/#u
> > 
> > Meanwhile, I will repoint lore.kernel.org to the old servers until this is
> > fixed.
> > 
> 
> Thanks for the quick fix, much appreciated!

The fix is in place and I've repointed the servers back to their new location.
Please let me know if you run into any other problems.

-K
