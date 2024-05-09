Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C9613AA2B
	for <tools@linux.kernel.org>; Thu,  9 May 2024 13:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715262011; cv=none; b=bd1PF2smVdEWeaqbGEbrmz7xr0KIGlMvwQ1n+t0x2LeosR27JeRYv9hjd+Y4e+o85C1+xg7CSkdbPtPTdPpyUr1iKRY2xhv1IzwgBSN9qIeemUWmCMaDw357rY8BMqkfZto7R2AzY1P0U7zDq5JWCG+rK1cmygFVcPYiPB6fQRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715262011; c=relaxed/simple;
	bh=Z00NkcOSPsMANq+LBiXbtZ/u7HK5D60hg4sKoHQwRXU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uMshX+Fh5xkiL1X4fA0aGo6kNmz4GDHHSJCUK/epTfTi6PZ0bIUGSJRRBNvz6PoowY+klKfJipqdC0Y8qsnmRZaLry1ddfW7no6KnTBQyJX9QzKbDf+9uLsUG/LfrYjU7VlrPG8ivQAwEuTW7p9SPLKS6wVYtGxkZmjQ0HJGhIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=1mFfuAJb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="1mFfuAJb"
Received: by smtp.kernel.org (Postfix)
	id C7F77C2BD11; Thu,  9 May 2024 13:40:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90C61C116B1;
	Thu,  9 May 2024 13:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1715262010;
	bh=Z00NkcOSPsMANq+LBiXbtZ/u7HK5D60hg4sKoHQwRXU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=1mFfuAJbbqeF8VSPwPeUuE0qRjTXJ0Ayj8n2xbiMPIayuhL2n38gzCp7sg0CXXcdp
	 j7OGiPofcTS/5cC3ygSVc90+EYfYde5Tw2lsi7CGzLJNjXyNPh3i9ys+yXPRtAum8X
	 hAg2QbW2ga2mhoEZObcEEUB1t1Y5/4dvxRfuCMOY=
Date: Thu, 9 May 2024 09:40:09 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: tools@kernel.org
Subject: Re: b4 shazam not stripping ---
Message-ID: <20240509-victorious-lean-mamba-4e77b7@lemur>
References: <2510008e-23d5-4c15-a16c-be9de549a425@citrix.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2510008e-23d5-4c15-a16c-be9de549a425@citrix.com>

On Thu, May 09, 2024 at 01:05:40AM GMT, Andrew Cooper wrote:
> Hello,
> 
> b4 shazam 33b93fdf-bf16-49b8-aec2-0b2c19f5c471@suse.com
> 
> is leaving the notes under --- in the commit message of the finalised patch.

We aren't doing anything beyond passing everything to "git am", so if 
this is happening, it's not really something b4 is not doing correctly.

I can't test your example above, unfortunately, because I don't know 
against which tree this patch is (I've tried xen tip, but that's not 
it).

Can you let me know what repo I need to fetch to be able to apply that 
patch?

-K
