Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DBBA360EE8
	for <tools@linux.kernel.org>; Wed, 15 Jul 2026 14:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784125512; cv=none; b=TY+0xRYC+pZ4SBJs0ni0k+fGzRYUDYTxIS4npMj7QM3CHDQEHfznMgnVkbK0RGgMiaxM+MpjpzQkyOtFXUYixKrb9CFKmMxfvPcZ1GGNNueu+TY9YYHOUz43GaFT+wvXPrCntRVixoh0jjA4Kt4bj6W4jE99jPvN9twDxHyDi8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784125512; c=relaxed/simple;
	bh=UTzu1zw6vi9fgp2Gu6TziQHfqFDYaDll351yA+MMlvo=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lScITkMpx4jVTcwa3Hukn4Sx9njDzfx+dDBdOFf1P74cK4t98lgOdt/xvVGfz/mKDZdruA5iwYZDz6BbuNN+Lih8xoqBM6MeN2/w41/e0BAjh2gOV7tsJIojaPx3IFiVd/fFV9D/NK0Yo3ekOMgegnl4rbDtJF3C+K+6286ylSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PQYlp8+z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PQYlp8+z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C67371F000E9
	for <tools@linux.kernel.org>; Wed, 15 Jul 2026 14:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784125510;
	bh=UTzu1zw6vi9fgp2Gu6TziQHfqFDYaDll351yA+MMlvo=;
	h=Date:From:To:Subject;
	b=PQYlp8+zaVxtZxg0lO0bMDSiZhcBsY10EmQOcdjnb06w635x5WxNCMwhk/glUGkgu
	 u3GSzJRUQWoGqpXeGYOHjeOtJdSpiVORCEhqeTebv3kEBpiu4JBfI2/pJppgv1L4ri
	 mvl3DoQkfsZJ5QuqnbG7EirM25hrFAJvlPI6Rpq66BOk41dqbI3jvLDLaAcuPWpMLy
	 rH4YBSxV2iz3/iTSDWFztwrTAuFwQyUjfNhhyljtFu8WLJMHNAD8o1YXng4Wnh0QDv
	 abuHQLcCyDpYXRMzpXCqWweF/im6VLGsA6NmTz0EnTL2asE9ECOqj/TmL4cw+HK2gq
	 IGohpIHxImHyg==
Date: Wed, 15 Jul 2026 15:24:58 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: tools@linux.kernel.org
Subject: b4 review feature request - search :)
Message-ID: <aleXuTEXAJ7if1wt@lucifer>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Konstantin,

It's totally fine to respond to this with 'patches welcome' :) but something
that'd be nice for the b4 review tui mode is being able to fuzzy incremental
search entries, kinda like C-s in emacs.

So maybe default-bind '/' to that and it moves the highlighted entry to one that
contains the searched phrase in submitter or series subject line, or something
simple like that.

Have found myself scanning the list thinking 'hmm I definitely remember b4
review track'ing that but where is it?' :)

Thanks, Lorenzo
