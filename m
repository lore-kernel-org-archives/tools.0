Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C173BCD31
	for <tools@linux.kernel.org>; Wed, 17 Jun 2026 13:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781702966; cv=pass; b=pSc1KUxaUzXwkDeZvO+WBAxMtwIEl9jelCOhsE8/zLvT0UVYZzukt9gtfWa/7+/bQm8yXNV45LmRz6ZkvMGNxRfPyMItXDPBjppu6Kx4D4/h3HSjq7b8/2S312I5hgH5hY1YsLnYVQT3skmKbKOPrFI0MIXuO6vAP1yLdfEJ3IA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781702966; c=relaxed/simple;
	bh=VvYcSOAAXRb5TKmyBHYiQ4vCBjDY2E5V8abY5hyWkGM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=nsVkngkPAiHgpnxfim3qzLkfxCdVU20FgHAZPFx+9dQTa0/Vddrh3DYm7RaguqRnnKYU73KYV3HCrMHJsf8KLZb7R5CHh6zLRsNPkwT16mMiWIXVHABZWc8ErZT3BjX1TzHXdW0j8rY6t3nHjNp/wJsaxiHarwd26PJgfTjbhf0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IdU9mmRb; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IdU9mmRb"
Received: by smtp.kernel.org (Postfix)
	id EEFE71F00A3A; Wed, 17 Jun 2026 13:29:22 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1781702962;
	b=mqlyLsZsY5E0YQMG8yAytZC7kd2ZTUbLZke3iuFA4gnh8Y226N0KSBK/+pj1c3HFS+Hk
	 RRO4wK8JBItI6PNHdbhlcIB4E3NKRoVuDsNMlfsxkmK1RQGUc/yz8PH/M5TzWLQzloWdv
	 AoK15sWSck4Js1w+NOC2cuo9fsldqSmpyB6IAPx6TOQtY2romCsOz8O2H9F2AUWGS8ZaZ
	 4mU4CX1uuTVIthxTNOwb/UHrZmDqISA6G7PEOxrX/Dho4/9v8PO1OZi30okmDzA9UXzU2
	 yKMvlgfsB5Ig/4lq0LFTZWbExfNjmlnEUrb+RVw46/xSqbg952LMxBN3Fi6phuWrvFQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1781702962;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 In-Reply-To:Organization:References:Date:Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=VvYcSOAAXRb5TKmyBHYiQ4vCBjDY2E5V8abY5hyWkGM=;
	b=QjNb6TTj3KQKfh6Q/Tlw4lK5yBwzw8GyIGJwyjYNgOylWfKhZz1WbI1czFpETWBzMJfE
	 LGNsKi944bX4miORVn4OuK9WxQ7vxC7wwG6iDpDWs5qYz0isVkxw94hOI7US8PMYruR9F
	 VZi6KB0v8P5VwTYOPTEoipNAozxlQdJ6mfulSTLBrBYSWMMxrvxao3ljOV2v6ZBypPZbj
	 6Z+tsLFNwTX6ADa0dSWthr/cwhTyKwbzky83P/RLmOxjJc8kGcAqioDHwAESO+MXvDB8e
	 99b5Shx7JiSDOLIypye2YHhQIKOeb3N/i/BHnWMfH42HiaN1RUOcGekrRHwIVK8yPYg==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IdU9mmRb;
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=intel.com;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E72EE1F000E9
	for <tools@kernel.org>; Wed, 17 Jun 2026 13:29:21 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IdU9mmRb
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org E72EE1F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781702962; x=1813238962;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version:content-transfer-encoding;
  bh=VvYcSOAAXRb5TKmyBHYiQ4vCBjDY2E5V8abY5hyWkGM=;
  b=IdU9mmRbycXA+jq5AZ2W8n7jD/jvsoTJ9T2+S/ESUTiMyvRxoHddBith
   VTubb5djW1zXuYvimAIAzXss5dH8UFSnEQ3H9mCLttvHcCYYjtQ8d7hBX
   fugBCFi5L0n/UvnE4cc2dRKjmKrYmY+HVtVvZquisF13ukvvtfHCy2ALM
   QAbUP4cRvrkC5c/P79seiDe8i59mIARLxN8IJR2ltWlyB4dgrPfRhs8ML
   73/Ys7d2TtuLt54b4BSv3moz5cCtbQKAGMZZJNrmRlIzMjc+b/upS5PWq
   BRHd1p4uouWNjFrh0HzKgEiB5tn5+T30JPBDnPTrhVSRL6JYsvDSvtYi+
   A==;
X-CSE-ConnectionGUID: qyYatjPtQv6NRj4z3n4Epw==
X-CSE-MsgGUID: wb+X5x7LSXi1qh79yd2weA==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="86422488"
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; 
   d="scan'208";a="86422488"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 06:29:21 -0700
X-CSE-ConnectionGUID: EoOBR697RC+oKJMF2lnVTQ==
X-CSE-MsgGUID: PRB1d35kShyCBJ1+btEIDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; 
   d="scan'208";a="248145725"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.158])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 06:29:20 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, tools@kernel.org, Konstantin Ryabitsev
 <konstantin@linuxfoundation.org>
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 01/14] drm/i915/cdclk: Don't bail if pcode post nofify
 fails
In-Reply-To: <511da82834da302ac50a326c082c45f6134b2556@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260610170652.5320-1-ville.syrjala@linux.intel.com>
 <20260610170652.5320-2-ville.syrjala@linux.intel.com>
 <511da82834da302ac50a326c082c45f6134b2556@intel.com>
Date: Wed, 17 Jun 2026 16:29:16 +0300
Message-ID: <8c18eca330bd63182319a18f238e78f1c451ede2@intel.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, 10 Jun 2026, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> On Wed, 10 Jun 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
>> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>>
>> We already changed the actual cdclk frequency by the time we do
>> the pcode post notify. So skipping the subsequent readout is plain
>> wrong.
>
> Fixes: ?

Turns out posing the question about Fixes: trailer like that leads to b4
shazam literally adding that trailer. Please clean them up before
pushing!

Cc: tools@k.o and Konstantin, FYI


BR,
Jani.


--=20
Jani Nikula, Intel
