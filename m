Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5BE40DFD6
	for <tools@linux.kernel.org>; Thu, 12 Mar 2026 14:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773327199; cv=none; b=oU0e3txxQdCOAqfXJBwT+89cyhXyOHP0vLagq2OCELldxZn5fsRpeXLeXnltsD1P5ovfiqtd2dzOwEhPehJHG2L/30I5Vrb5GDDYYPt1e1Lg7wmKM8b3Rjt2MlxCqfvguK/yRvCVLVhQymPOOgTHgj/KtX5aQl9mbO35ov6g7NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773327199; c=relaxed/simple;
	bh=KLNrcDiKpi0gGwJ3TkUjPIXcSveyKJYWxYgWbqkL/Ww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HdlFDr38HDBr4vK0dxuHkWyHFRTCsmMGWW5PtoTonk1lLX1tWGf1CN8Aiq1C0gDns5pfZmehDFKiU2+Q4DLmBDgLRKyyljabzqWNftSJ7jbQL+V+Sc+UrPRvhkJZ/BXGYPyd2dUV3bLgih1R1qfrdnbmQszcmmYXhG46Q+zI4Ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MOnVquRL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MOnVquRL"
Received: by smtp.kernel.org (Postfix)
	id 9575BC2BC86; Thu, 12 Mar 2026 14:53:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62066C4CEF7;
	Thu, 12 Mar 2026 14:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773327199;
	bh=KLNrcDiKpi0gGwJ3TkUjPIXcSveyKJYWxYgWbqkL/Ww=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MOnVquRL8+4h2f2HM8NeMmH87g3kvbHC/mHjKuYcQjTKXVT0nfSg9p91j+z4OOAnE
	 Jcy+2oiqjWdrKdGrch+PeHKsVAl0ScKgDGaOjnLesB1aXbenat2WsSKMiXv2w360n0
	 AzrzVohIy6g3j6rrdWkktOSJU29Zu/3lg4DtLMm3cKsZMUsvnnpNXsv1JEHUgqPGxj
	 n9Wr76zQ+JbR2vyZSnaWF/lkafeSrWWP4Ef/WZ2zZN7VYvsZkMX9U5wWF7U1t0JsHc
	 ++wfOLB/t5f0A4wpZpTCyCHKLUHMSa3/t3hnFG85TqYan1BCcDIczbNhNU86uiJB3D
	 rpzXRZr2L86WQ==
Date: Thu, 12 Mar 2026 10:53:18 -0400
From: Konstantin Ryabitsev <mricon@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@kernel.org
Subject: Re: Sorting of new patches
Message-ID: <20260312-curious-jade-grouse-03f7d4@lemur>
References: <121e9897-ee29-4af1-802d-2d2f979ea0fe@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <121e9897-ee29-4af1-802d-2d2f979ea0fe@sirena.org.uk>

On Thu, Mar 12, 2026 at 11:49:37AM +0000, Mark Brown wrote:
> One thing I'm noticing is that patches in the "new" state get sorted
> after patches that have had their reviews started (just above patches
> waiting for new versions), this rather buries them in the UI.  It would
> be good to either sort them first (as they need initial triage) or allow
> limting by state.

Yeah, every sorting approach I've tried doesn't quite do what I want. I'm
going to revamp it again:

- list all series in a workable state at the top, sorted by last-activity:
  new, reviewing, accepted, replied, thanked, etc
- list all other series at the bottom: waiting, snoozed, gone
- add a state filter to the "limit" dialog

Regards,
-- 
KR
