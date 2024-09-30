Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7352D18DF83
	for <tools@linux.kernel.org>; Mon, 30 Sep 2024 14:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727705412; cv=none; b=ceHKeDMb2a9dJaJy0V306+pMem+uYeHamVUPAz3LeQYQp5qmIXW384Bx5aRQLf8GvPrzK4zRN0expfuFMpOsFRNfuNxZ+RjZ/8pp2hRcjkwu4UZEiPbI6Fr9TefSv+BBwXd8kQ3VOg1/M+8j0+xIEkgfXqcxauvjndXyKQYdQP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727705412; c=relaxed/simple;
	bh=gxYeSRDBkf05nz2/putIeYkJ1WdIwCNg8wektl65DEc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=d4RYNqzBfjOTOGbOjqjnc2y4TE3ttjXqEpv3rA9N3CjmeTcfQ0WIrwhgicQnAjqEJjlotj+m8WKwVfm3evhJcfpLRRpFx4/i66nqOrxyaFcfycytiIsV8Z2zy70Gis9YEpN6tLP4fQCuyry33rlytF3DxlE9ZCS/gS+5ISlJuxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X+ME375/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X+ME375/"
Received: by smtp.kernel.org (Postfix)
	id 58ABCC4CECF; Mon, 30 Sep 2024 14:10:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C697BC4CEC7
	for <tools@kernel.org>; Mon, 30 Sep 2024 14:10:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C697BC4CEC7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727705411; x=1759241411;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=gxYeSRDBkf05nz2/putIeYkJ1WdIwCNg8wektl65DEc=;
  b=X+ME375/PR8Qiw3UVNnoHj/lcuZXVldYQlkrNGwtZ9BGnXDU7Uhk4kMa
   4OtVjg52iJktPdhTlkBR7qnKGnc/P65YjzCnwZxJjzULpk4GKYILavf0P
   C3BWWwsBE8FZi4VsQ6aDKnhk7expgN+OQ9m7CypCsA5JqItIghaDU7/Gs
   miMwjJXoamMD8pxvDsH4tnWjub8Ezn6niADLaPuIPFwoKWHcsDZd4aAKL
   OPcWaxCvXmMHP0MXEbXLRzucF8NatFKCKyDdGHwKJ1xXXyaJyKheqfIHy
   YCHPGjhIK/6IX1t1l8m6iRu+f9xtj8rMdiTmDIQsq2rRU63LWEzf9Psp2
   g==;
X-CSE-ConnectionGUID: jyBJd9HXQTaC4ByXwuIhAg==
X-CSE-MsgGUID: A4fgdkqOTL+b9dpBKbjnOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="37940005"
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; 
   d="scan'208";a="37940005"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 07:10:09 -0700
X-CSE-ConnectionGUID: Et42Lu/dQGGG3qUlNxp3jw==
X-CSE-MsgGUID: wXov1RQ8RCO5AxZWUtsK8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; 
   d="scan'208";a="78278849"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.246.136])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 07:10:07 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Daniel Gomez <da.gomez@samsung.com>, I915-ci-infra@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, patchwork@emeril.freedesktop.org,
 tools@kernel.org, d+samsung@kruces.com
Subject: Re: Incorrect response address when using B4
In-Reply-To: <20240930133007.u4vm5qj5urikpmvc@AALNPWDAGOMEZ1.aal.scsc.local>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <CGME20240930133009eucas1p14b11ee712ae3ab1ca3aafc2833103bcb@eucas1p1.samsung.com>
 <20240930133007.u4vm5qj5urikpmvc@AALNPWDAGOMEZ1.aal.scsc.local>
Date: Mon, 30 Sep 2024 17:09:54 +0300
Message-ID: <87msjpw7v1.fsf@intel.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, 30 Sep 2024, Daniel Gomez <da.gomez@samsung.com> wrote:
> Hi,
>
> I sent this patch [1] using B4 web endpoint and then I received a
> response email to the wrong address: To: "Daniel Gomez via B4 Relay"
> <devnull+da.gomez.samsung.com@kernel.org> instead of To: "Daniel Gomez"
> <da.gomez@samsung.com>.
>
> [1] https://lore.kernel.org/all/20240925-macos-build-support-v3-1-233dda880e60@samsung.com/

I guess you're saying the replies should be using the Reply-To: header.

Oddly enough, even my MUA doesn't respect the Reply-To: header when the
same address is already in To:/Cc:, as a way to handle mailing list
Reply-To "munging" [1].

BR,
Jani.


[1] http://marc.merlins.org/netrants/reply-to-harmful.html



>
> Is this something that can be fixed on the CI, patchwork side?
>
> Thanks,
> Daniel

-- 
Jani Nikula, Intel
