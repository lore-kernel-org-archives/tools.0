Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C60B0375F87
	for <tools@linux.kernel.org>; Mon, 22 Jun 2026 15:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782142153; cv=none; b=GQaqZuT+5X44Qe1RSqZQHP2eC8/Dt761fLM+dLvv4/iGujMlSyK7yVNtz38AsssNhHJ4Q1mA/nh0zyPOMOkoFDCcypjMjlNv9Mmdt9Uc9NQJXseFFDIk52ZCnOVnmeiakeSRK+ujm459Ox8k+1Kx2bIB2yCnIEI+PpBgbUBSfHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782142153; c=relaxed/simple;
	bh=F+sIeuWFXPGbCnRLE/fcrA6klWM+SNFaHVaqUeqjq/4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H38cH8v1g13Zo1hmZAQFhMHvrJcn+0XGHoB6G3P/lSEW+4wzlatuX/8k23YCxiDjk8Cjlf/bHNyVm0PFeIay83EWdVSObWSxtctyM5xzpJwGuGB+gZfwxphNQyseCwSJakPKKA1YKIIsFBGLpqL7ilm80rCSv8AsAuivZLybI8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=s1G+SjIK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="s1G+SjIK"
Received: by smtp.kernel.org (Postfix)
	id 71A0B1F00A3A; Mon, 22 Jun 2026 15:29:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BB021F000E9;
	Mon, 22 Jun 2026 15:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1782142152;
	bh=vGT+MQp3cbyV0OY9+E7WMxoNdCE/He2K9YoTxuP8T60=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=s1G+SjIKjphmHGkehCMudWUi4bMN6Ros6CkbtYjnSoO8SHuADUWofMtsaXgt8ixxf
	 0lk47UeKcm/NA4DsTwHzd01HIzqJBfXAWMFGYQDjNMGqVPXCobjTeUZyIyadAnO4/V
	 Y4hd4cGFr2l3hDnjVlxEUPCRakUhcQ+QcmxXIQBQ=
Date: Mon, 22 Jun 2026 11:29:11 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@kernel.org
Subject: Re: b4 review fails to notice already tracked series
Message-ID: <20260622-quixotic-agama-of-opposition-fc0b2f@meerkat>
References: <01bb36c4-9ef1-45f8-9b05-f3ae33e84229@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <01bb36c4-9ef1-45f8-9b05-f3ae33e84229@sirena.org.uk>

On Mon, Jun 22, 2026 at 12:03:11PM +0100, Mark Brown wrote:
> Hi,
> 
> If I have v2 of:
> 
>    https://lore.kernel.org/r/20260621140001.63829-1-bjuraszewski@gmail.com
> 
> tracked already but try to track the above v3 then b4 will happily
> record this as a new series, it won't identify it as a new version of
> the existing series.  However, if I go to the already tracked v2 in the
> UI the new version will be detected and offered as an upgrade option.  I
> would expect the already tracked series logic to kick in and stop the
> tracking of the new version.

Yes, this was always the intended behaviour, but it turns out it wasn't
properly implemented.

Please try the latest master.

-K
