Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7309366563
	for <tools@linux.kernel.org>; Wed, 11 Mar 2026 14:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773239726; cv=none; b=scCJoC/yi2/1nv7y7QKUd4uNhpiOMjc0IjojuVU6s4A7I9/j3V9H665UQMvu2H5OAd7ETqs3uUA1PnDH4ZAqZaW/Az74TO5mgeqVEwxKFjW/fqwDFSTTnpvM+0ZnVEOXJ2zWWnbQxRNmraB9MyTEJ49HHAI+EVJrQclLfhHmXX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773239726; c=relaxed/simple;
	bh=5ymqnICkupNgdmAmzSRLB6wGX5tqkdrbdSNZwAaTDfI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uKAWnIRCt87fiSWevsUxg14TugH7+1J23NPulB7L/KSn0njxWoHULf9cgyLBjOIcgW3NRpPg/hsb5+kpeC1ldIL9VOf4vIEbxlSq122J6Isf+2whDUYn7RX50a63TOqME63Xk5c2sbVFnABrGHR6QJdTt+XtpEfIpCZhb+ZG8nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=sD9EulFT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="sD9EulFT"
Received: by smtp.kernel.org (Postfix)
	id CA241C19424; Wed, 11 Mar 2026 14:35:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 981B5C4CEF7;
	Wed, 11 Mar 2026 14:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773239725;
	bh=5ymqnICkupNgdmAmzSRLB6wGX5tqkdrbdSNZwAaTDfI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sD9EulFTdHXsvh64ys/NcFpOrIFXmQ2+D1qSyFZEdhpJMUWh3h8tGE7cQXDA1HEJs
	 4Qxwyg+POvFKRzp6718hb0sGH1pOeQnWRrGFusfciTdjwGTvvOIeJ2ojEKbMPdefn0
	 X0k1GGbmFz3oG8XpfTCeNCRlolBagrk4pitkm8Qw=
Date: Wed, 11 Mar 2026 10:35:24 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@kernel.org
Subject: Re: b4 review looses thread on update
Message-ID: <20260311-warping-cicada-of-potency-f06c5f@lemur>
References: <aTj6C69JzDUJUVP4@sirena.co.uk>
 <20260306-steady-tunneling-asp-7febfd@lemur>
 <0dbd8df1-3c66-4ab0-a64b-1f3ded93a7b6@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0dbd8df1-3c66-4ab0-a64b-1f3ded93a7b6@sirena.org.uk>

On Wed, Mar 11, 2026 at 12:14:09PM +0000, Mark Brown wrote:
> Hi Konstantin,
> 
> I had a review of v1 of:
> 
>    e53aefc63e28caf32bcd553f3d0a8f2a5a25cd8d.1773193726.git.xiaopei01@kylinos.cn
> 
> which showed that v2 was available.  When I did actions->update (mildly
> annoying that that's a captial U BTW) b4 flashed up a screen saying that
> it couldn't work out a base and then returned me to the list, with the
> series gone from the list.  I'd have expected to get to pick a base in
> that case (ideally it'd remember what branch it was previously targeted
> at).

Yes, this code is very lightly tested and has seen a lot of churn. Let me
see what's happening there. Thanks!

bugspray tag b4/review

-- 
KR
