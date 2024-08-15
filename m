Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4174C63C
	for <tools@linux.kernel.org>; Thu, 15 Aug 2024 14:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723732072; cv=none; b=bTIbmR/KTi84DmUFH50o9F7UTde0ajgN8JBvzq0/CK7lddm59+CaDMmUnaxi4pDIkshVOognon+X3ed2jHF8giijQsHOprkkzyyfo/UFaQAhBQ0o4oVU0v/sotkCfeXFDvPXIWao49mmahzd3o2lP4hFJ32Dmzt6thznuQEoLNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723732072; c=relaxed/simple;
	bh=lK7OOSgpFRsJxEuKQtITIhOuyYEAhBo7pgFkzXKwFVI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HiLsDPpHDX5vpSrtPulkFR5lhaL+iylHJF6YlomTHl4CCwQDz97CFH7s1kXOqwcD74PX4G+P5DB5x2Z8D4HsFrnMxjVvSpE5uERzMXfSauXks1FyXytU8M4JTREUJoSgpgTvaUollFYu2zP9kBjJemrenahw5rYd6cUljSI6UD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=PDfu1tYJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="PDfu1tYJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D788C4AF0E;
	Thu, 15 Aug 2024 14:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1723732072;
	bh=lK7OOSgpFRsJxEuKQtITIhOuyYEAhBo7pgFkzXKwFVI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PDfu1tYJhPf7ThQQioc15Z16MBYKDkN2JEk3xQDUgv6xaTV40lP+YQKnxxmobW2Px
	 YDBSGODTZQ8+HQRlgeu4gMU3IMjQgOCN/3SxWJHYupc0Wmle9yTjXGQ8Oc9MFQEO1A
	 AeBjT56O894zhbcuspGYhgOY9yDPgCsDBHe67Gzs=
Date: Thu, 15 Aug 2024 10:27:48 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools <tools@linux.kernel.org>
Subject: Re: b4 failing to pick up cover letter
Message-ID: <20240815-caracal-of-stimulating-abracadabra-acd542@lemur>
References: <0c57ec83-313f-45a5-b0a4-eeb7c9081241@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0c57ec83-313f-45a5-b0a4-eeb7c9081241@sirena.org.uk>

On Wed, Aug 14, 2024 at 06:06:51PM GMT, Mark Brown wrote:
> Hi,
> 
> When I do:
> 
> 	b4 am -S -t -g -3 871q3bll5c.wl-kuninori.morimoto.gx@renesas.com
> 
> with current git b4 fetches the relevant patch series but does not seem
> to fetch the cover letter even though it does find three messages in the
> series and the message ID passed was for the cover letter.

bugbot assign to me
