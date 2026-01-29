Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E93279DCD
	for <tools@linux.kernel.org>; Thu, 29 Jan 2026 15:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769700362; cv=none; b=AgTauQigCo2iEUdz33PgqSdDgsyPAAqGPf86GmEZ/7s86dNR6YUXNftVtRiHo8H5YSjPvpa4JB2k7brSuve7/DXqVgwgeAmJPFoSYkhj43SvNCx/7ZjJjiNXaelZTd99PSJ9C77a25zbJN+GNiP3wbxl+cm3iQ64iZYRbwkMQjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769700362; c=relaxed/simple;
	bh=kNK0mHh/4yk62pdc0M1XbdyfwAY1gyD5UAr7YBywqlU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pGDakBnyOnNk7vImMt/6fP7MjtyUmsHg/P7FMp6rf9DHX5iAavXH0AQ6VpOhFI+CAqAr2pSOFK45ryiVmMopfc8dtzIJJW/zhBA1ldjZIPxb7D02QBPsCE2P+0jw8IlrRXWu55rBTJqq15t/Y3nuVBEaXIRs22yuyzosHVs30zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=PEhqGRrJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="PEhqGRrJ"
Received: by smtp.kernel.org (Postfix)
	id 71273C116D0; Thu, 29 Jan 2026 15:26:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D150C4CEF7;
	Thu, 29 Jan 2026 15:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769700361;
	bh=kNK0mHh/4yk62pdc0M1XbdyfwAY1gyD5UAr7YBywqlU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PEhqGRrJOa5WYT2yVs/loN04z4uuX/TbpmWSMtlDxpf3wErRIxxDzaGQPXNBVWgEE
	 dBdHYv8xI/Gc6Ik8Ig1bkVCFdVdGaDjCMAkzLIg6qkGE7QzkS5UihYqLyQv1YHi7Tv
	 ymdm8fOpOwxHqraxxa/YYxLLkS/00aAE99/zCLiY=
Date: Thu, 29 Jan 2026 10:26:00 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: tools@kernel.org
Subject: Re: korgalore: Mail directory keeps empty?
Message-ID: <20260129-active-festive-nautilus-e3aeba@lemur>
References: <5fd95298-afc1-4789-8b15-2b24e8886edd@de.bosch.com>
 <20260128-wild-honest-cougar-c002de@lemur>
 <29c56255-2e88-4bf5-abf6-c02aa8f953da@de.bosch.com>
 <20260129-crystal-dingo-of-serenity-659f4b@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260129-crystal-dingo-of-serenity-659f4b@lemur>

On Thu, Jan 29, 2026 at 09:41:10AM -0500, Konstantin Ryabitsev wrote:
> You don't need to change anything -- it should work for you now, but I will
> see how we can make it work after one step, not two.

There is a fix for this now in both master and stable-0.5.y -- the deliveries
will start happening after the second pull, not third.

Best wishes,
-K
