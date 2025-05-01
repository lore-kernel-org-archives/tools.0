Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95ED619CD0E
	for <tools@linux.kernel.org>; Thu,  1 May 2025 14:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746109586; cv=none; b=h/ix5HvSRrXoa7yyeD0vVNYlvRQplQJEdCtEjOepAnTWXM74WFAI4Nz9O4pscOd0gRdx9U0ROCj7KAaD1mOxGaw2X2noJz72lpMgl7O7YynvQSF1/YNADsURj3z6n1mXluTCZALZtrdI581UUTefk4WdgcJJhb5XygfZQd49Hls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746109586; c=relaxed/simple;
	bh=HP6HGYs1Ms2G510p1QF68nMc/h8Ut/JJhOeyvhYTInU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eqL9A/4UhPAgahHoFf1pjedjwi323wI4pa3i6SjvbzsaQebsCPToX/Vyvy3qNbeohQJR+L5XU/uYym+ZsZSEZU3SXUxlV2agPlp/kwVk7ihi0PmvA277va+bFKmb5D+Msu/T6DzCbvY3aGc7g0xWIIYfCbhF6lK6yqQKzFSg7Wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=mYqjF/62; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="mYqjF/62"
Received: by smtp.kernel.org (Postfix)
	id 24B62C4CEEE; Thu,  1 May 2025 14:26:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3D52C4CEE3;
	Thu,  1 May 2025 14:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1746109586;
	bh=HP6HGYs1Ms2G510p1QF68nMc/h8Ut/JJhOeyvhYTInU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mYqjF/62/wfSRhq0wGkjAeGgF6+zOi5F9+5AOIOp7Ld/pJXM/ju7o4bYGFDawu31A
	 dD/mgmYAdC2z7uZ1dnq+IO9lXRSB1isufHa0FVSQTT9+vHCVhimfjI+N6jTI8EjI1+
	 odgJtSkbcyfGsvl8Kmz86Vl+5ClyEsMEtAna6IY4=
Date: Thu, 1 May 2025 10:26:24 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Andre Przywara <andre.przywara@arm.com>, 
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>, users <users@linux.kernel.org>, tools@kernel.org
Subject: Re: b4 thank-you letter shows incorrect repo URL
Message-ID: <20250501-wakeful-kiwi-of-poetry-59d4bb@lemur>
References: <20250430095325.477311-1-andre.przywara@arm.com>
 <174610166405.2974716.1586244113913047340.b4-ty@csie.org>
 <20250501132211.0310ae49@donnerap.manchester.arm.com>
 <CAGb2v66UnWo4zL6giQYC+Kmo5SSkNAH1_nODM=r6jyQPoi-JNA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAGb2v66UnWo4zL6giQYC+Kmo5SSkNAH1_nODM=r6jyQPoi-JNA@mail.gmail.com>

On Thu, May 01, 2025 at 10:06:22PM +0800, Chen-Yu Tsai wrote:
> (dropped most people and lists from CC; added Konstantin and kernel.org users)

Note, it should go to tools@kernel.org, not users@kernel.org.

> > > Applied to clk-fixes-for-6.15 in git@github.com:linux-sunxi/linux-sunxi.git, thanks!
> >
> > thanks for that, but the URL here is not correct, is it? Should be the
> > kernel.org repo instead? Saw this already in other "applied" emails.
> 
> That's weird. It is correctly pushed to the kernel.org repo [1].
> Maybe it's because the git-config remote entry for korg repo's  is called
> "sunxi-korg", and the linux-sunxi one on GitHub is called "sunxi", and
> somehow b4 is getting confused?
> 
> Konstantin, have you heard of such reports? FYI my b4 is version 0.14.2.

This is coming from your custom template, not from b4 itself. By default, b4
just says "Applied to ${branch}".

Regards,
-K
