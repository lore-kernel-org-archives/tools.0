Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C083549F122
	for <tools@linux.kernel.org>; Mon, 21 Sep 2026 14:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790000536; cv=none; b=kb1GcsMXZMRH3qD+P8wle1nMx9QCzcfzi1EZaBaXg1vGuB2+pRKvmGApPsb3sXavACJAl8xGovhNOomOGrmvwqnqPWR5BWJwWK7iiKIScpb3rKMaxuXbx+eX67SJxoPRv855GbBDSHmckBYLtVSyJK/89eYyKk8OjmnZjUEnjWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790000536; c=relaxed/simple;
	bh=Jxa6XTDckslQ4uIdYaED9ksu3v+FCYwZs3SgqFvq1Rk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=elRcbaaox1kugH7Hx9051tSqOXEwFxz2FLvgz721jqGXZ9i6y3Q7+nMCAQRKr0/LxNmjGlA03EshGbSKIwqIjG8GYOEtg4Axdd9eHd/o25vmo04/CRnsk1RRa5Ks622F+n0A3NzKXE/rB1LHoD92NrGAUgRwoqnkLn4f7xNkyFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=LnVTuMd0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="LnVTuMd0"
Received: by smtp.kernel.org (Postfix)
	id 6D67D1F00893; Mon, 21 Sep 2026 14:22:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6F1F1F000FF;
	Mon, 21 Sep 2026 14:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790000535;
	bh=Jxa6XTDckslQ4uIdYaED9ksu3v+FCYwZs3SgqFvq1Rk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LnVTuMd0zx7UlCLQ/J8pkZyq0ndUuGY3L2EoU+yq2cB5UHj55StK6t6a0nWUl85TV
	 +Yd6gBj15h9cM4Jl4BSelX6xrvrmB1qv1ZaXIoHduZizZo8roiV2B5ayCG9yfCTwro
	 3Nhpn15nYry+pz1Ka4TaeDq56SSPCBagFyYvTgZQ=
Date: Mon, 21 Sep 2026 10:22:12 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@kernel.org
Subject: Re: Waiting for more email on a series
Message-ID: <20260921-reasonable-happy-axolotl-091f42@lemur>
References: <arEdy7YJkFP0iYHg@sirena.co.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <arEdy7YJkFP0iYHg@sirena.co.uk>

On Mon, Sep 21, 2026 at 02:06:35PM +0200, Mark Brown wrote:
> It would be really nice if it were possible to wake a series with a
> condition like "if there is new email on the thread or <one of the
> existing conditions>", for cases where the thinking is "I'll give it a
> week or two to see if anyone else reviews".

Yes, I was thinking of making the "wait" action more discerning. Currently,
"wait for a new revision" is the only condition, but we can also wait on:

- new revision
- new trailers
- follow-up from a specific person (or bot)
- any new activity
- lack of any new activity

I'm tracking this as bug 207d696

Thanks,
-K
