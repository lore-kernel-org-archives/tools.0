Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13DAB7E8
	for <tools@linux.kernel.org>; Mon,  3 Jun 2024 16:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717432244; cv=none; b=Itt4eKzfPwUdezPDXueTdHHB23rHaN8R5hxwi/DghTyrXs1zHmiIIaoF46GqmjKd1iUTb02/eBz4db8Uo8tTQF2tiNwWhLVwiWn6y48tp/64C6qdlvrOJygLea4sgIEBufMvIovRBDnuISXDRDiMzUAmefrIszGLOL74BJsmtLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717432244; c=relaxed/simple;
	bh=0Nxwuwz6GYqarqg5G1FT2qJLOWYthg38rMW0T82+TcA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FtmJ2tYcIn0Ea7D2wp43w6ClVbyilPbuy6hRK57iuQ4dubA8GNi+vAUHVZ7uXihpTbTyFEHMhA0+nDAGIBGesWcgfEN4uZHqWldOidOBrpN1FVleka1LoW5dvSqP+CN5wtJrdnp57ZsFicPnAcx+gD3XjYuQ6uzyPDDk8y3VqdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=DuZhL5XB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DuZhL5XB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9246EC2BD10;
	Mon,  3 Jun 2024 16:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1717432243;
	bh=0Nxwuwz6GYqarqg5G1FT2qJLOWYthg38rMW0T82+TcA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DuZhL5XBH/l5OHQ2GqbUh5rBreyO2aJLgAb1pMzb+0M+7ENgjukJt6/AFv2rhQD1U
	 KSi1oiMVd7zw3Phj3WfNV5Ub+Lj1a0RrfastaXt7UBtzX2dcMry1vsoSFJJFe1JPnt
	 xjLBLXC86soPLsJZw5akPV907hHMyJjmgjv6SKKs=
Date: Mon, 3 Jun 2024 12:30:42 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools <tools@linux.kernel.org>
Subject: Re: Trailer updates to git commits not working
Message-ID: <20240603-opal-wolverine-of-tempest-7a8939@lemur>
References: <15b55c55-8060-4c46-b545-3a3e774a9875@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <15b55c55-8060-4c46-b545-3a3e774a9875@sirena.org.uk>

On Mon, Jun 03, 2024 at 05:03:37PM GMT, Mark Brown wrote:
> Hi Konstantin,
> 
> At some point b4 trailers appears to have started having issues matching
> my commits, every time I run it it complains it can't find commits:
> 
>    b4 trailers --update --trailers-from 20240603-md-base-regmap-v1-1-ff7a2e5f990f@quicinc.com --since regmap-6.10

I'm curious about "--since regmap-6.10" -- is that known to work with git-log?
I thought it only understood date formats?

-K
