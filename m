Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD9B2FFDD9
	for <tools@linux.kernel.org>; Fri, 21 Nov 2025 22:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763764400; cv=none; b=Mv1XHTsWY0fT9nRL3ZS1MO60IocJddA1C2YC39IuNYRVt41ym4SriyPF1FHsAeC5JJ19pxl0EZC/ykLIYsQyDoCwLKANKusIOV2uu7Lwk3QxbdOTBU6UCbcS1HHN8udC2K6wFABsPIqGC7Z/eeAHfRgw9MOYGPHxvpOdUL2Vffg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763764400; c=relaxed/simple;
	bh=3/GKWP7yKxHbIm/sXuZx1sklkt2CCa5UjDRa+UxLtJs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Ff7vzlJNSvCS7kqWQxDU5Iz1m3EXKdR687Af+TRtMcYWRhW46ausfKnwPlP1WIhyta7RR4uicVf7MmZ3yn1Lj1sWjWX6F0M0yPwjCyUhCzNJX6wJVNLXKlmtra33odtgIthSjz8PPCfX3WHYOGKsy8SGyPAi4YlQOl7sOSMmefw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KQ7n3Fum; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KQ7n3Fum"
Received: by smtp.kernel.org (Postfix)
	id 911D8C16AAE; Fri, 21 Nov 2025 22:33:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 15A62C4CEF1
	for <tools@kernel.org>; Fri, 21 Nov 2025 22:33:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 15A62C4CEF1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763764398; x=1795300398;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=3/GKWP7yKxHbIm/sXuZx1sklkt2CCa5UjDRa+UxLtJs=;
  b=KQ7n3FumPVeb6eAY578bNhW0W3UDiSRuQhOMycN1D0IShNMUCjByqIvi
   GomF+PavHwg+TZonpg8GZ8tSxv6PJ4rABi2QgwD1K3eyTKrtXOO/DMN3t
   hKCXhGWXn72X8fxE9/RS49cX+YN33hUv51p9kXEqM0KUbiQvffRVGSQtR
   u7vkj9BCgvn9Oau8L4vaRCe6pDHA6ggtGYmUUTUjS97O+jK9fGcop2YXx
   ibXhhq88oMGQUeyZLs1Nng5v+nAR1RyJC33ESYlh0SUznX7sGLrv+vENk
   xa+UssCQphAVfjBYH2wpkRk5P4xmMQoDw2nZDUBYpFuIlO39GGLjeutIN
   Q==;
X-CSE-ConnectionGUID: reutaFldTOeOaMxUtXkCZA==
X-CSE-MsgGUID: xOnQk8TJS62JDV/Lsiuk0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="65815226"
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; 
   d="scan'208";a="65815226"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 14:33:17 -0800
X-CSE-ConnectionGUID: 6Eq6NA7ZT6S8IUPmQYWt3Q==
X-CSE-MsgGUID: dTn9xipKQGKTye73fkhlxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; 
   d="scan'208";a="191838056"
Received: from c02x38vbjhd2mac.jf.intel.com ([10.88.27.157])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 14:33:17 -0800
From: Marc Herbert <marc.herbert@linux.intel.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: Re: Switch b4/README.txt to "pipx install" instead of "pip install"?
In-Reply-To: <20251121-idealistic-satisfied-snail-7d0199@lemur> (Konstantin
	Ryabitsev's message of "Fri, 21 Nov 2025 16:23:03 -0500")
References: <m2wm44ui4k.fsf@C02X38VBJHD2mac.jf.intel.com>
	<20251118-quirky-resolute-aardwolf-f0befa@lemur>
	<m2ms4ft7wt.fsf@C02X38VBJHD2mac.jf.intel.com>
	<20251121-idealistic-satisfied-snail-7d0199@lemur>
Date: Fri, 21 Nov 2025 14:33:10 -0800
Message-ID: <m2y0nzj9sp.fsf@C02X38VBJHD2mac.jf.intel.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Konstantin Ryabitsev <konstantin@linuxfoundation.org> writes:

> On Fri, Nov 21, 2025 at 01:03:46PM -0800, Marc Herbert wrote:
>> > If you'd like to submit a patch, I'll be happy to apply it.
>> 
>> Sent. If you'd like to fix my English or make some other minor changes,
>> please just go ahead and do not ask for my permission.
>
> I followed up already, but if you'd like me to wordsmith the rest myself, I'm
> happy to do that -- writing docs is nobody's favourite job. :)

Please go ahead, otherwise there's a good chance you would spend more
time holding my hand than doing it yourself. Also, don't give me credit
if you make all the changes you requested, that would not reflect
reality.

Making a one-line doc fix is easy, but anything slightly wider requires
a good overview of the whole docs to maintain consistency. You have that
and I don't.

On the other hand, I hope you can eventually work through the backlog
and look at my other, unrelated patch and questions on this list :-)

>> The only drawback is the same as the advantage: too much virtual env
>> isolation! It hits you when you try to install and use "on the fly" some
>> fancy debugger, test plugin, tracing library, Python IDE,... They are
>> generally "not found". Then you either need to explicity add them to the
>> manifest, or use some obscure pipx option, or revert to "pip instal
>> --break-system-packages -e .", or to "b4.sh",...
>
> The biggest drawback of anything pip (or pipx) installed is that everything
> breaks when I upgrade my distro to the next version and suddenly my Python is
> 3.14 and not 3.13. :)

Ah yes, that too! Forgot that other bit of Python fun. I have a special
Trash/ folder for those occasions, too afraid to break something
prematurely...


