Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7020A17597
	for <tools@linux.kernel.org>; Fri, 10 Oct 2025 14:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760106232; cv=none; b=eQcqP4JpHvXb5Mhs08+ekfYY+UdSqnbJm6/Gmw0hgZe5vWaSFcd09hmvna2vrHCKCNfLHie3+l8OzDM9/xSuReEYi+jjPz9l5vqwffqE/58dfo9scWaGSt7vgphxrJCs9CeunrcOqBO8Hml5d9cNG0a6tdGbRjaZcrSBg5z4pH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760106232; c=relaxed/simple;
	bh=4xAkWfIYEmQjLBK6N6XcwXBdO9PteJOiGvinVduOeCY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EP4JX0c41F9a7n783ctuy/Vl2H3LsoY+YEEJ447TlmJrMjagN3Kugmgo/b1jTLy6+TwS+E6boD8A93ofA+Cflxpi2jgvfB421GlDFhbUOEwviWjhO6tx8NzcBgeABFmENLdFfN7ixr4knD/VwRKQMK2PC1f/QXedtR/WJz3JZzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=wWDPakvf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="wWDPakvf"
Received: by smtp.kernel.org (Postfix)
	id F19BCC4CEF9; Fri, 10 Oct 2025 14:23:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFA21C4CEF1;
	Fri, 10 Oct 2025 14:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1760106231;
	bh=4xAkWfIYEmQjLBK6N6XcwXBdO9PteJOiGvinVduOeCY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wWDPakvfBV/VwBrzRJF3gLNzSULC23D4tvl3tiy8nkAST1YUA4XEFt/sQQqDGti3a
	 WqxOaCtTTYm96GBGiYgL7dej/pW0b2PJusfTbdCoqWvySYy+LQOcbiFh571TR0B5XE
	 broadtnBGYXm73c6UNPCy/MwtxAyeLmLgNFhzLPA=
Date: Fri, 10 Oct 2025 10:23:48 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Lee Jones <lee@kernel.org>
Cc: tools@kernel.org
Subject: Re: b4: ty: User-flow regression
Message-ID: <20251010-mauve-dolphin-of-apotheosis-a1cbdf@lemur>
References: <20251009151349.GB2890766@google.com>
 <20251009-remarkable-charming-pogona-fd7a8f@lemur>
 <20251010080324.GC2988639@google.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251010080324.GC2988639@google.com>

On Fri, Oct 10, 2025 at 09:03:24AM +0100, Lee Jones wrote:
> > >  Auto-thankanating commits in for-mfd-next
> > >  Found 5 of your commits since 1.day
> > >  Calculating patch hashes, may take a moment...
> > >  Nothing to do
> > > 
> > > Doh!  There should be something to do.
> > 
> > Curious, have you set your diff.algorithm anywhere in your git config to
> > something like "patience" or "histogram"?
> 
> Not that I'm aware of:
> 
>   $ git config --get diff.algorithm
>   <no output>
> 
>   $ git config --list | grep diff
>   diff.wserrorhighlight=all
>   diff.colormoved=zebra
>   merge.conflictstyle=diff3

Next question is -- have you recently stopped adding Link: tags to your
commits? :)

-K
