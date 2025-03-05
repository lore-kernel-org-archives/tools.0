Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E206A2512D6
	for <tools@linux.kernel.org>; Wed,  5 Mar 2025 17:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741196405; cv=none; b=m69gHQLN5wmdQdpJNPo/N3V58f14FBazS/aAYJuzf3qSYjhkf7uFYiRj12B1QayrN8He346Pof8TmHPIhpNrPxsHGDQ3FaTbq5HlK0w/sf3nujrH+dRBJB+3x3PZZKehcHBlrQbXGhdvzeh+8xJHrgt19bVoHX8spPcNMks0ujE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741196405; c=relaxed/simple;
	bh=4W/3rJ+Kj7MjCRHEruRSt4L1YhdXCZbOdS+kcyHu1/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q2pRl4VTrWit14vkbHtjzvIo5y4HOoADy0wLRiGJrVk2IWQ/PqdbxzcsbXZnzOgn+TQpJyFmmUSLw2f/wFdCs6rKmrdt0frbh9K8oMKkW8kEC3MS/qGd2ThJjvYkT7ReWxKRnCLNSA5KR2gN/dtddJ5gI7By2ppROHgg8DW13Lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=uoqU6xm4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="uoqU6xm4"
Received: by smtp.kernel.org (Postfix)
	id 83F04C4CEEA; Wed,  5 Mar 2025 17:40:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BA40C4CEE9;
	Wed,  5 Mar 2025 17:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1741196404;
	bh=4W/3rJ+Kj7MjCRHEruRSt4L1YhdXCZbOdS+kcyHu1/s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uoqU6xm4eM74hI/l9+87MinLS2sOUivYxIDafUWRViF+uk0RrP9VNv/1CtDQwhzb+
	 3u1YsHgMuRaI8Vkwm8mQlsfMcEFX0RS+wvPxCmxiu9K5EKOuDX6Huo1LzQnJUwU2ox
	 1A1ogy22Xx6dRglIgPjnNAmxvcrACsHc452dOL98=
Date: Wed, 5 Mar 2025 12:40:03 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: tools@kernel.org
Subject: Re: REQ: patchwork adopt b4 behavior for cover letter tags
Message-ID: <20250305-interesting-pig-of-climate-c4e638@lemur>
References: <03d82eb3-c1c1-40c9-8508-b8db63f4bf12@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <03d82eb3-c1c1-40c9-8508-b8db63f4bf12@oss.qualcomm.com>

On Thu, Feb 27, 2025 at 10:59:56AM -0800, Jeff Johnson wrote:
> Currently when someone replies to a cover letter with a valid tag
> (Reviewed-by:, Acked-by:, etc.), 'b4 am' will apply the tag to all patches in
> the series. That is awesome.
> 
> However, patchwork doesn't do the same. That means when I look at my to-do
> list, I can't see that someone has given a R-B or A-B for the series.
> 
> Is there a way to update patchwork to have the same behavior as b4?

I'm sure there is, but you'd have to reach out to patchwork devs to ask. :)
I don't think they are on this list.

    https://lists.ozlabs.org/listinfo/patchwork

-K
