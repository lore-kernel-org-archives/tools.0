Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4AF1917E9
	for <tools@linux.kernel.org>; Mon, 30 Sep 2024 14:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727707544; cv=none; b=fEps2OYIMagqlfvTVMRibFsPjNTx+YsP20Ycu5kd1EwJUHNnxlW0tWneCALYHNUwCx6+b+ud8tHkKAuiEaKp5Rv+OJ0IUT1gphn1m12O3PR1b/5V7PDNASxyneRjLa9ioCQSs27rwSk2ozKW6RVwyR/Rbp0nmqLbiqVEod5aXkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727707544; c=relaxed/simple;
	bh=zCFMfgECvvmLSW2Hn+BaeWoB4Tw3BB5KJHZMvi/9ug8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=bmjsCHHIzjh0K2P5zTQdzL+3+R20MZ1oDQ80DpSkqJx3CZfMsWxARxWPonzuYOMNzypDnqxGsW8qQuTqwXxyeK4iZdyqQxge/K0kdsur9WQfkpL8/d/ggE/3bHa86bBZ1W7p9HnQNZOJmIiqzQkudH3nAqbF59kg1OaB050zzW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YE7QkTLS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YE7QkTLS"
Received: by smtp.kernel.org (Postfix)
	id 97FE4C4CED0; Mon, 30 Sep 2024 14:45:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 03170C4CEC7
	for <tools@kernel.org>; Mon, 30 Sep 2024 14:45:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 03170C4CEC7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727707541; x=1759243541;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=zCFMfgECvvmLSW2Hn+BaeWoB4Tw3BB5KJHZMvi/9ug8=;
  b=YE7QkTLSdK+nsTwlAewNBS1Hs3G50W9MGMQn+iGNF8PhkTNMQuqUGvde
   e2T2UJQgLFTPbb+2aw06J3DEnYYhrCAKYgeBFaMK6qUQI33E8AkBmPgYY
   2I6w/C5kc6ajpVSye5jdn0/0j3ToQ4PjfEEk2RSmBd9CsmBQs7Lk4kS4c
   pEotu4iVdXcScPritsobmzkKQsS8uk9BzHAXWY7HwU7Y8Gm7j80GHXQG/
   kqcx/p8Et/whTCx69UZM9hsaE6qrri5OCYH+6ca4VeJIpMueZ+SEu75Cs
   QW3bwNCJduHwPLN/tSk86tFJOqac7DVKVA7+H7kAzzt6QFBCi4i12DqeT
   g==;
X-CSE-ConnectionGUID: 0m0JLXHtSeKQtCNU0KQTQg==
X-CSE-MsgGUID: JTVnm4VYTy2SN/L7XEfVoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="44261877"
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; 
   d="scan'208";a="44261877"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 07:45:23 -0700
X-CSE-ConnectionGUID: YJOa/q1cQkGXBbMajB95yA==
X-CSE-MsgGUID: Wd6p1uBZSuCGbrrbejYexw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; 
   d="scan'208";a="73454295"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.246.136])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 07:45:21 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Daniel Gomez <da.gomez@samsung.com>, Konstantin Ryabitsev
 <konstantin@linuxfoundation.org>
Cc: I915-ci-infra@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 patchwork@emeril.freedesktop.org, tools@kernel.org, d+samsung@kruces.com
Subject: Re: Incorrect response address when using B4
In-Reply-To: <20240930143309.pwl7dzv537b2q3wk@AALNPWDAGOMEZ1.aal.scsc.local>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <CGME20240930133009eucas1p14b11ee712ae3ab1ca3aafc2833103bcb@eucas1p1.samsung.com>
 <20240930133007.u4vm5qj5urikpmvc@AALNPWDAGOMEZ1.aal.scsc.local>
 <20240930-sapphire-swift-of-reverence-168e2b@lemur>
 <20240930141839.3rjfom4c2tca655n@AALNPWDAGOMEZ1.aal.scsc.local>
 <20240930-rustling-auburn-jaguar-23d200@lemur>
 <20240930143309.pwl7dzv537b2q3wk@AALNPWDAGOMEZ1.aal.scsc.local>
Date: Mon, 30 Sep 2024 17:45:08 +0300
Message-ID: <87h69xw68b.fsf@intel.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, 30 Sep 2024, Daniel Gomez <da.gomez@samsung.com> wrote:
> On Mon, Sep 30, 2024 at 10:20:57AM -0400, Konstantin Ryabitsev wrote:
>> On Mon, Sep 30, 2024 at 04:18:39PM GMT, Daniel Gomez wrote:
>> > > Was it an automated tool that sent you that message? Normally, email clients
>> > > would honour the "Reply-To" field and not use the From: address put in by the
>> > > relay.
>> > 
>> > It was a CI Patchwork tool. Response [1] to my patch was sent from "From:
>> > Patchwork <patchwork@emeril.freedesktop.org>".
>> > 
>> > [1] https://lore.kernel.org/all/172735727458.1107233.1757281470637305143@2413ebb6fbb6/
>> > 
>> > I think that tool is ignoring the "Reply-To" field [2] from the B4 message and
>> > using the From field.
>> > 
>> > 	From: Daniel Gomez via B4 Relay <devnull+da.gomez.samsung.com@kernel.org>
>> > 	Reply-To: da.gomez@samsung.com
>> 
>> It's no big deal as long as you got the email response in the end. We expect
>> this to happen with a lot of automation, which is why any replies to the relay
>> address are auto-discarded.
>
> To clarify, the email response didn't land into my inbox. I realized a response
> was sent after checking at lore.kernel.org.

Yeah, our patchwork instance tries not to spam everyone, and limits the
replies to the submitter + intel-gfx/intel-xe mailing lists, but
apparently uses From instead of Reply-To.


BR,
Jani.

-- 
Jani Nikula, Intel
