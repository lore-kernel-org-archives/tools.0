Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0016D2745C
	for <tools@linux.kernel.org>; Wed, 25 Feb 2026 00:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771978885; cv=none; b=Cxb2fErs2B+ysZprcH01e69hjGPCuuoQTHoMeWWLGjspgd3jXKzdIhnpTWcGZS5awToHqv9Wcyab8wicUkDU9KVfN4suKB2Ed8sk4Hz41929Dj9sI2AzN2RvWqv6bptzaQIPv2PCj3zNjrT2nyPWiN7D0xoyPTfKjPo4QO9TKfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771978885; c=relaxed/simple;
	bh=/+I2LdfaH6nIFrrYKS94wqfNJf7T6FvnM1ZAMn+u+hE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mPXY+asY2RKsfryZfFw96U7wWc4uJg9U/rI+T1W9tf4NIfxC7npC6RWFSkchgwSSQXlYQtnz3cDVzmp1z8Lb1WozHcuiWlq66jTVvdwtI7bpueI8K/04TXYaP4kAuFWkN6K5dlZfQ6xHpNAs5Mhn0Gc6xl6u/SHVBWVTlr5uY8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ffXWG4mK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ffXWG4mK"
Received: by smtp.kernel.org (Postfix)
	id BB6C3C116D0; Wed, 25 Feb 2026 00:21:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DC2D1C19423;
	Wed, 25 Feb 2026 00:21:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DC2D1C19423
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771978884; x=1803514884;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=/+I2LdfaH6nIFrrYKS94wqfNJf7T6FvnM1ZAMn+u+hE=;
  b=ffXWG4mKVY+hqEZ504SEO2zOhAntuuNM3hOh7JqlDpXX0RTBWXWGkE9q
   /UjBQAOmgpNETP6E6DgcbfR32IJiYLzp3+M1lLlp2cNk1kNxbkp6zMR0+
   1RZTrfutH/jKhE73AGgovsHsXU+K0OYLd0O2k5PrzER9GzQA209SUzp7G
   FQ7N8bWHGAnQqocpB8swEtPNNb0NEtIoTT8Zr+Baj9wFcNnCNqASS225F
   /lqF1VG7EIqYg45wTHTqNoaF9KDMit9eGYm8x/UjpXPzKwmHUZQVICe05
   4UoJcxFlDT2fWcVk8JLpe/s1MCyEv11Oi02w9mzdL0bHIdubSsckRcdNH
   Q==;
X-CSE-ConnectionGUID: ueXG7+bZTnKv+GNLiCWvyA==
X-CSE-MsgGUID: 71jSoWdPSLmcZSipiGaH6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="72219515"
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; 
   d="scan'208";a="72219515"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 16:21:22 -0800
X-CSE-ConnectionGUID: 0hfVnTw2T72DdeweGN4yow==
X-CSE-MsgGUID: y393oIZjQTyMRcrJlmO39Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; 
   d="scan'208";a="216206977"
Received: from spandruv-mobl5.amr.corp.intel.com (HELO [10.125.111.56]) ([10.125.111.56])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 16:21:22 -0800
Message-ID: <0133be07-c5b5-4f89-9a87-d4a68cc6be83@intel.com>
Date: Tue, 24 Feb 2026 16:21:20 -0800
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Missing cover letter
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: tools@kernel.org
References: <77c934d2-27f5-4b1a-9465-92d25858e56b@intel.com>
 <20260224-classic-wakeful-elk-2ea358@lemur>
Content-Language: en-US
From: Dave Hansen <dave.hansen@intel.com>
Autocrypt: addr=dave.hansen@intel.com; keydata=
 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
In-Reply-To: <20260224-classic-wakeful-elk-2ea358@lemur>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 2/24/26 16:17, Konstantin Ryabitsev wrote:
> That's because your cover letter has [v3] but none of the patches do:
> 
>     2026-02-13 23:51 [PATCH 0/4] [v3] x86/cpu: Take Intel platform into account for old microcode checks Dave Hansen
>     2026-02-13 23:51 ` [PATCH 1/4] x86/microcode: Refactor platform ID enumeration into a helper Dave Hansen
>     2026-02-13 23:51 ` [PATCH 2/4] x86/cpu: Add platform ID to CPU info structure Dave Hansen
>     2026-02-13 23:51 ` [PATCH 3/4] x86/cpu: Add platform ID to CPU matching structure Dave Hansen
>     2026-02-13 23:51 ` [PATCH 4/4] x86/microcode: Add platform mask to Intel microcode "old" list Dave Hansen
> 
> Pretty much any assumption we try to make here is going to be wrong for some
> other case, so I'm just going to politely ask to please number your patches
> as git/b4/any other tool expects them. 🙂

Ahh, that's fair and very fixable. Thanks for the suggestion!
