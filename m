Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC9A1E7C27
	for <tools@linux.kernel.org>; Tue,  5 Nov 2024 19:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730834220; cv=none; b=L88YUDQpbrJ4HH/LcRfF60QhRn5lz937imS9uS33h5a6rVP1NSvCZBCDxMEJMvHgrKzPr37+7oxppgJjwRoYduiHyGwsg1S4NVYmnHdT6RqxY9bJ7NIdTopF3A2gm37+e62+fUu52D5vQLB1T2JsmWNuiIhdIELitJk7u49v97k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730834220; c=relaxed/simple;
	bh=tnohxswTPxYrQo0SW0OnDf5+ZIuEi/zMHpby18rwcL4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UStkCTeDBvSL+dEF7w/+HgnTn3Gxr4h1xL13p8THgt0ths9jLFO3qyMVEKh3KenGsnjAyTT7CrVq+wy2kORPDrMezIhPLUlCetsWiMMCZuK9Jm2Vy18ShJ7cQVrD+NJ96Dt7oG/Kodl7q3K6P7G/M8/WzqEbNNDpdzXsyCjR5F4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=uOImE6NO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="uOImE6NO"
Received: by smtp.kernel.org (Postfix)
	id 80079C4CED1; Tue,  5 Nov 2024 19:16:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3494BC4CECF;
	Tue,  5 Nov 2024 19:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1730834219;
	bh=tnohxswTPxYrQo0SW0OnDf5+ZIuEi/zMHpby18rwcL4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uOImE6NOIpEM6uKQ8zdF4traj2Pss45NVshFgHuiqiPfsQ/gEU+j6en7zNe/1Ahia
	 p2/9Fz7LRhvpkJD3Il3yChU2AEGq2hsZfgI8Fz8iyG1N6iDwGLY4hcm5pLPSl365RL
	 r09wbHmj3j1qhtD99Ke6YwlAaZQ9kc88PrEJ+Ra0=
Date: Tue, 5 Nov 2024 14:16:58 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: tools@kernel.org
Subject: Re: lore reply mailto links
Message-ID: <20241105-belligerent-pompous-raven-3e6566@meerkat>
References: <e7b4bcb6-4aaa-4480-94f4-147b5f0adfba@citrix.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e7b4bcb6-4aaa-4480-94f4-147b5f0adfba@citrix.com>

On Tue, Nov 05, 2024 at 12:12:06AM +0000, Andrew Cooper wrote:
> Hello,
> 
> I expect this is a feature request rather than a bug report.
> 
> The reply mailto links are great (less faffing with importing mboxes),
> but could they include a body component like e.g. bugs.debian.org do?
> 
> Right now they produce an empty body which then requires some manual
> effort to turn back into a neat inline reply.

Lore is just public-inbox, so you should reach out to them via
meta@public-inbox.org with this and similar requests.

-K
