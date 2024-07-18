Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A5B13C3E6
	for <tools@linux.kernel.org>; Thu, 18 Jul 2024 16:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721318469; cv=none; b=fqx+BW4F/4iek/PrnqIiX6egAVyZ+MnfrL3Z60yxCeUqMcL83Acd9lAxxHOsl+EGxbBBkBO4iP9ei8gmdzwZUVL3zroB3I0odkBcCZyeahFvTaeULOTseX/Y4YBGwiO8J1T4zZnAODlBcfmIReSEY4kee+81VYCXz0ZFgVo7Rhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721318469; c=relaxed/simple;
	bh=V1ha3DgaF4ScxyVN+TQiM0UmA7JIFoApKMHAyVunk04=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yr2bYiAQRmjKexKo7COkW68Gy6hdAYItfVqG0a/iCRZdm4jzw5T7b5PH7lfCq0RXW9Mf0t93sGi1HgvarWI9lUud/7WSPtIOgBw2V4aXPwLzKofUTNJNLxOCRV2llrgokyOcQXTY8L58gzGXtivd6VcHdCr+qLO0b3z6RF8dlXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=AK4XD5vK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="AK4XD5vK"
Received: by smtp.kernel.org (Postfix)
	id 09BD3C4AF09; Thu, 18 Jul 2024 16:01:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC664C116B1;
	Thu, 18 Jul 2024 16:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1721318468;
	bh=V1ha3DgaF4ScxyVN+TQiM0UmA7JIFoApKMHAyVunk04=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=AK4XD5vKV02QEVzccQexyQ4O9lc9smzaoRZWDIT4pNK3EXN0RUeyHvgUT4l7SCZOk
	 gOB0Ud+3GZNpMZZtf3uReEPxO+mAx8MEwnCuoCspGDXIVo2w7e2mF7QZ9wgvb+RsM6
	 RV2YaqoNlMWxQ53rwB9gZ0k4/1dy5ROiwbCuGP6o=
Date: Thu, 18 Jul 2024 12:01:07 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: tools@kernel.org, Junio C Hamano <gitster@pobox.com>
Subject: Re: [PATCH] Support "valueless truth" in configuration parsing
Message-ID: <20240718-airborne-fearless-buffalo-d2a2fd@meerkat>
References: <xmqq34o6zrmj.fsf@gitster.g>
 <172131838138.573106.13051154380521484210.b4-ty@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <172131838138.573106.13051154380521484210.b4-ty@linuxfoundation.org>

On Thu, Jul 18, 2024 at 11:59:41AM GMT, Konstantin Ryabitsev wrote:
> 
> On Thu, 18 Jul 2024 07:44:52 -0700, Junio C Hamano wrote:
> > With a configuration item somewhere (like ~/.gitconfig) like this:
> > 
> >     [sendemail]
> >         suppressfrom
> > 
> > "b4" barfs while parsing the configuration file.
> > 
> > [...]
> 
> Applied, thanks!
> 
> [1/1] Support "valueless truth" in configuration parsing
>       commit: d04d7f4ec48b083b7d83886b1b7e743111cc16d4

Also backported to stable-0.14.y.

Thanks!

-K
