Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C673C3F
	for <tools@linux.kernel.org>; Fri,  1 Mar 2024 17:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709314732; cv=none; b=HhzJ4kntLxzjZPLT+Je6RQRLTh8QMc4JpMOiG86p8QhiP/jnHd2w0EHWojjuhpVIDbdcnvAkpXDDp10eum0SZEDsL0KdxrFcKaVKwM5WteenrJ0EbDEjYTE1eLVlgFnOIU/C1Z9J3utkxm4TNqDGl501KDEAgvzxoz6T8lyshW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709314732; c=relaxed/simple;
	bh=NHi8z69IHaYBaifA7eYwaMM84h48yXgg0Mm6Mg1hEQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j9BeWrQuldUsQCwRFCeV6uYuIIC9eRDNkp1VsNzADOGeLt15EV1niExhCa7/n8IQeKwgUtj5z7l1eaEwg0j/VBXq+SW3Ogut+fVnCqacJdqQd37mnJVhuZTOaQ5YII2NsO7D6TNsOGt094wpZJPoGPlereCE3igRwqtUqzqIt6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=cxqtaRkf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="cxqtaRkf"
Received: by smtp.kernel.org (Postfix)
	id 89D51C433F1; Fri,  1 Mar 2024 17:38:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D157C433C7;
	Fri,  1 Mar 2024 17:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1709314731;
	bh=NHi8z69IHaYBaifA7eYwaMM84h48yXgg0Mm6Mg1hEQw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cxqtaRkfsNT4IuvtQt04LnwmUFVKefCeWDwsxLIoJKxzkAsKrZlLPCPkGeU+pugiL
	 igqz80M0C1OprwNvAr0Z7n5t8H6kyv7zqMflOqwb7/g65/i4MupPLxe6MnyuyzKPKD
	 HjERa2U1kxPTNJcosxtOAw2fgwaSZaJQ6MVSLyJY=
Date: Fri, 1 Mar 2024 12:38:47 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: emil.l.velikov@gmail.com
Cc: tools@kernel.org
Subject: Re: [PATCH b4 v2] b4: add shell completion via python-shtab
Message-ID: <20240301-offbeat-hungry-kangaroo-9fabde@meerkat>
References: <20240301-shell-completion-v2-1-741c88669859@gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240301-shell-completion-v2-1-741c88669859@gmail.com>

On Fri, Mar 01, 2024 at 04:59:23PM +0000, Emil Velikov via B4 Relay wrote:
> From: Emil Velikov <emil.l.velikov@gmail.com>
> 
> The python-shtab module allows for static shell completion files,
> whereas others like python-argcomplete, execute the underlying tool for
> ever suggestion.

Thank you for the series! I hope to look at it very soon -- I just need to
wrap my head around the underlying concept.

Cheers,
-K
