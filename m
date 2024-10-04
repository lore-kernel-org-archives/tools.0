Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECCE83CF74
	for <tools@linux.kernel.org>; Fri,  4 Oct 2024 10:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728036035; cv=none; b=kh3+yV1JKcWGy+7k28BMgOpc8kNVIW4cL3J02mslRP2YDUYKB9JwBmsFxK6qfDe3WsIo9Zos+gMvpL2BjpKKWf3e+p0ah9EmpNZoC7qlY1S4UpjtB0tYuxWgSGwuV2pouV93vyimCqqTiV/1W9sUmgZk7NQY0+Btw+3BKpsecaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728036035; c=relaxed/simple;
	bh=6lazpgH4p0hLNCoalUGcO5Izmsq9hosDEf3qBePje2Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=cip3xbKWE8/brwcWCKT7baYoqH4JKo6vhnw6WF08wM0vDXAmcvb3eptu6tZUJ1InqLBtCPqc4O5hfo4ErSUHBNznMVNClj81PZOxdSCvmjICLvkTQbzp9ZWse4JH5E4PBhQW1dRIfhx7hDKNVHHncazxCHU48Ws2/lbe+l/R/aE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QbGEzS/h; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QbGEzS/h"
Received: by smtp.kernel.org (Postfix)
	id 94723C4CEC6; Fri,  4 Oct 2024 10:00:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1382EC4CECD
	for <tools@kernel.org>; Fri,  4 Oct 2024 10:00:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1382EC4CECD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728036032; x=1759572032;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=6lazpgH4p0hLNCoalUGcO5Izmsq9hosDEf3qBePje2Q=;
  b=QbGEzS/hevXQeES8D5LYp5aef3R+FaCpiyOJGSMGI63WFnkNe7Rnu0W0
   Sk6dTvouBYp7l+cLTXAWHbD3nO9qq9GGn7m+hIa7/wLjIH8X/+ZKGNt4p
   lQNtlTwBdVdMnf5FH6632ZRP9zaV4Ih47Kr5PXb1fJi3WSWz2dXlIRtGl
   ES/mPwK8yvjMw4YkXtckVgHDBaGEdRAMoMSyEcBXWmtr+uuE61cfKkHwk
   RtwLcfHgiZzXMMNxIdl7+saBz6k64vPb8h0aRaNhJFpZtnMbWF4P1Pu4e
   5g7tf1Uc/Ak3wiYhiidd0kt17lLRriMM8x8FrJTrh+u0UY9kDvqrLxaVa
   Q==;
X-CSE-ConnectionGUID: wzJBr4lsRD+IGgTt8xiguQ==
X-CSE-MsgGUID: +frYeEg2SqKVZPsicpXu2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="27424115"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="27424115"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 03:00:30 -0700
X-CSE-ConnectionGUID: PbNmdi4nTh6MEDNXoEffXg==
X-CSE-MsgGUID: SPh/BV3HR2uz8CmWHRGa4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="79498173"
Received: from dneilan-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.89])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 03:00:27 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Daniel Gomez <da.gomez@samsung.com>, Konstantin Ryabitsev
 <konstantin@linuxfoundation.org>
Cc: I915-ci-infra@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 patchwork@emeril.freedesktop.org, tools@kernel.org, d+samsung@kruces.com
Subject: Re: Incorrect response address when using B4
In-Reply-To: <D4MWUZ2F8B75.2LOQZKGUBIBWK@samsung.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <CGME20240930133009eucas1p14b11ee712ae3ab1ca3aafc2833103bcb@eucas1p1.samsung.com>
 <20240930133007.u4vm5qj5urikpmvc@AALNPWDAGOMEZ1.aal.scsc.local>
 <20240930-sapphire-swift-of-reverence-168e2b@lemur>
 <20240930141839.3rjfom4c2tca655n@AALNPWDAGOMEZ1.aal.scsc.local>
 <20240930-rustling-auburn-jaguar-23d200@lemur>
 <D4MWUZ2F8B75.2LOQZKGUBIBWK@samsung.com>
Date: Fri, 04 Oct 2024 13:00:24 +0300
Message-ID: <87bk00rxvr.fsf@intel.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, 04 Oct 2024, Daniel Gomez <da.gomez@samsung.com> wrote:
> On Mon Sep 30, 2024 at 4:20 PM CEST, Konstantin Ryabitsev wrote:
>> On Mon, Sep 30, 2024 at 04:18:39PM GMT, Daniel Gomez wrote:
>>> > Was it an automated tool that sent you that message? Normally, email clients
>>> > would honour the "Reply-To" field and not use the From: address put in by the
>>> > relay.
>>> 
>>> It was a CI Patchwork tool. Response [1] to my patch was sent from "From:
>>> Patchwork <patchwork@emeril.freedesktop.org>".
>>> 
>>> [1] https://lore.kernel.org/all/172735727458.1107233.1757281470637305143@2413ebb6fbb6/
>>> 
>>> I think that tool is ignoring the "Reply-To" field [2] from the B4 message and
>>> using the From field.
>>> 
>>> 	From: Daniel Gomez via B4 Relay <devnull+da.gomez.samsung.com@kernel.org>
>>> 	Reply-To: da.gomez@samsung.com
>>
>> It's no big deal as long as you got the email response in the end. We expect
>> this to happen with a lot of automation, which is why any replies to the relay
>> address are auto-discarded.
>
> Konstantin,
>
> B4 web endpoint works very well for me because of the freedom it gives me for
> sending patches. However, as a user of this feature I'm expecting all replies
> to go into my inbox (regardless of whether it is an automated respose or
> not). Unfortunately, they don't. So, what I'm asking here is if it would be
> possible for these automated responses from Intel 0-day, Intel GFX CI (Patchwork
> Freedesktop) and lore (public inbox), to change their responses to use the
> "Reply-To" field instead of "From". Note that the first 2, completely remove all
> the Cc addresses. IIUC and according to the Jani's answer, this seems to be not
> doable on their end. I'm not sure about lore's side.

I think the request is reasonable, and I sure didn't mean to give the
impression that it's not doable.

But it's still three distinct projects with their own developers that
need to be convinced to make the change. (And if it's not clear I'm not
one of those developers.)

> Is it posible to change the "Reply instructions" section in lore, to use the
> "Reply-To" field? It won't solve the problem completely but at least users of
> that would use the right git-send-email command.
>
> Also, what's the use case of using B4 web endpoint if replies may or may not
> land in the sender's inbox? I think the use of this feature requires proactively
> monitoring the patch and/or mailing list.

In most cases you'd expect people to "reply all", and if you have your
address in Cc:, you're covered. Lore's instructions do that. It's the
cases that limit recipients to reduce what might be consider spam that
have the issue.

BR,
Jani.


-- 
Jani Nikula, Intel
