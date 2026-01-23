Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF652D0C92
	for <tools@linux.kernel.org>; Fri, 23 Jan 2026 16:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769186826; cv=none; b=iMaofT8vsJK4Z41fNUQNbYP2GCRWCu08xDJ2OlQPebmiaN68fW+PTbhFl6uTzZJStZwPvkE3KK+yJt90Hw61tWVe5T5uSOVbaITDNW7tNH8vOTVHSW+EfdNrIK40hWoTE51ZRPN5Qc/r7ZSc5ZweCSb+u2IxkBeT9eB3+0JB8aU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769186826; c=relaxed/simple;
	bh=GDUO/9BrcU1sCTOes83sRMC9Dei65yiQTGP+Ng8taN0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hwwwd9EvvVCt6pZA4TYzxpmlXHpeKxmtjT5FD5NFHCePevdclPocKBZReeAWBN2qZJ6q8oYFaagOeMol/WStEDppBvECcAREHF7h8P1MySzOGBWe9BqKAtdTuf3oiqduX3nticyKdYKh1Z33uSXUpjHAUKmp0WhSkQhs+hzh7Mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T2fO/wFW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T2fO/wFW"
Received: by smtp.kernel.org (Postfix)
	id 75FA7C19423; Fri, 23 Jan 2026 16:47:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41641C19421;
	Fri, 23 Jan 2026 16:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769186826;
	bh=GDUO/9BrcU1sCTOes83sRMC9Dei65yiQTGP+Ng8taN0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T2fO/wFWBngB89pvgc1TowpaLSWX0/Q9Hy1+pG6WkSyu64gvnaka4tkll1c6oVc8Q
	 BHFjSmCsrp7aNzEERiOCAD6PUlUgo2OJx43XzYEfmS3HUK/H1Jwa3reewsceJ7L+Xl
	 bhBFsH9aB+5Au+ru4WS+CEd1rfSOCmQWMVi76tHtoOMCvr/VuEV21Lud8OtcNgDvaS
	 watFXX786//CI6bwwUTPIURTfCCwwilzhc6U1ILm7UkwafWtUqibRG73nh2AmA5hNb
	 Tz0jCNgIYsW2mL4N3O7Wwz6zPuQ1ajVHJ8DYBzSPbhM7BUTDlpB2j+Uqx+wje0VIhG
	 M3UV9PL4+scxA==
Date: Fri, 23 Jan 2026 11:47:05 -0500
From: Konstantin Ryabitsev <mricon@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@kernel.org
Subject: Re: korgalore v0.4 now available
Message-ID: <20260123-stalwart-pronghorn-of-defiance-5e7cc1@lemur>
References: <473ed792-f970-49ff-8a11-ac9d6a82f83f@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <473ed792-f970-49ff-8a11-ac9d6a82f83f@sirena.org.uk>

On Fri, Jan 23, 2026 at 04:43:46PM +0000, Mark Brown wrote:
> Hi,
> 
> If I run
> 
>    kgl track-subsystem -m MAINTAINERS 'REGISTER MAP'
> 
> then kgl medidtates for a long time then outputs:
> 
> | Found subsystem: REGISTER MAP ABSTRACTION
> | Creating mailinglist query: l:linux-kernel.vger.kernel.org AND d:7.days.ago..

Oh, ouch. Yeah, this is 10,000 messages right there (lei's maximum).

> | Creating patches query: (dfn:Documentation/devicetree/bindings/regmap/ OR dfn:drivers/base/regmap/ OR dfn:include/linux/regmap.h) AND d:7.days.ago..
> | Created 2 lei queries for subsystem "REGISTER MAP ABSTRACTION"
> | Configuration written to: /home/broonie/.config/korgalore/conf.d/register_map_abstraction.toml
> | Target: local, Labels: 
> 
> Given how long it took I'd expected it to have done something to the
> output, and the above is not going to DTRT given that it's pulling in
> linux-kernel.  Probably the program should understand that linux-kernel
> is special here.

Agreed, let me figure something out.

> I'd also have expected MAINTAINERS to be read from the current
> directory if it's available and not otherwise specified.

Yes, plus we can also try to grab it from
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/plain/MAINTAINERS
if all else fails.

Thanks for the feedback.

-K
