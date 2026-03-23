Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0753B38BF
	for <tools@linux.kernel.org>; Mon, 23 Mar 2026 15:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774280689; cv=none; b=lZR5lP+Xw4iQtfuZALUtL7QaiPxkRADnNpGEq2N50eugpAKCTev7gg+0zORu2yf/9U7RTBYTjH9cL02DYfCD+YmtTz6ChLgd6S6zwgfdlTVH/QX5tXZ6J/VKaYuCgNX45E/QL/ntDFnVeEl6SCUSACO6W/0RQa87j4GOjGgn8Fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774280689; c=relaxed/simple;
	bh=EFxYFMzeF0WIMxXGImyMCxFD1U+heyfg/BjiX301hw4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qHQ4l0NJwr2WOngtnw8SZOyLh1b4IeKW5+brP+/vK6ysc/3zoCczhkzLOfRkTzlILcbthCwFspmWuNOlaeqHxp23YSwWq30OHOamx03Uhe0qeCiUl2/DwtsCTT37/RKtnLHVcZfV+0p076bJ37jAsAt8F7XbWZZfEK9JRO1BstQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ZFCj1Q67; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ZFCj1Q67"
Received: by smtp.kernel.org (Postfix)
	id 3BBAEC2BCB0; Mon, 23 Mar 2026 15:44:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F03B5C4CEF7;
	Mon, 23 Mar 2026 15:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774280689;
	bh=EFxYFMzeF0WIMxXGImyMCxFD1U+heyfg/BjiX301hw4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZFCj1Q67Xz46mluhJlmP1Eg/w9RYFTWCDjIK1Eel/nK4WemLVbfAEzkynKlCS7Xsw
	 BLT07Uogv2Dmn1UWY6R9X4girunUD27gRbe3xGO1AtLN1rM47Ujsha1JHWF6dxA/ID
	 jC+aPRf/juW8sFQ3dut3EOw8QpxJ+92lZzE6GHvM=
Date: Mon, 23 Mar 2026 11:44:45 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@kernel.org
Subject: Re: Stitching together serieses
Message-ID: <20260323-electric-fancy-crow-b7db3b@lemur>
References: <8637ff61-4eca-42ac-96fb-d530498b3f82@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8637ff61-4eca-42ac-96fb-d530498b3f82@sirena.org.uk>

On Mon, Mar 23, 2026 at 02:07:13PM +0000, Mark Brown wrote:
> When users send a patch series in a way that doesn't thread such as:
> 
>   https://lore.kernel.org/r/20260323041505.2088-1-niranjan.hy@ti.com
>   https://lore.kernel.org/r/20260323041545.2101-1-niranjan.hy@ti.com
>   https://lore.kernel.org/r/20260323041624.2120-1-niranjan.hy@ti.com
>   https://lore.kernel.org/r/20260323041641.2133-1-niranjan.hy@ti.com
> 
> it would be useful if b4 review had a way for users to tell it that
> actually this is a series and please treat it as such.

I'll see what I can do, but on the first approach this is proving fragile,
because it's breaking a lot of assumptions we currently have about a series,
such as ability to retrieve it as a single thread to check for updates, etc.

bugspray tag b4/email

-- 
KR
