Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E657241CB7
	for <tools@linux.kernel.org>; Fri, 21 Nov 2025 21:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763759032; cv=none; b=kVPcJ0GCabkrQh9+fh0F//EmUQXZHcZRXY8lPC7kIlG9npo5lnziY2uQafaMnyACF9WpW4FyUYwwk4CM4AuBCw/tE/2tEv7Nh1i1FjiNh9rGP3ASAcXxEV98ZnosSDxD/ZNbXErSdABiCtYnAWKLjJOAGl9DVg9fYyl6y8E66X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763759032; c=relaxed/simple;
	bh=FIgnzCoE5JtIGWzqyACHRc3XMX13ZO59v0qtjrkpD1g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=iwUuuoQM5/cecDpqBgc2Yn8b7iOXSAy/CR/W2eEqdVQjy0D+KLuvNEI1YDO50zT/ucYwvahPzDcMgAsOWub9qo0hN6Hcm1fNsltV+qFxyjHPRtJUbUfxzclpRltN8d2hftDy4HxaHt9pgEDfZMRrDCJrIw2ujIwKShvmRGhCvMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fP+UD96R; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fP+UD96R"
Received: by smtp.kernel.org (Postfix)
	id 32090C113D0; Fri, 21 Nov 2025 21:03:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BCC67C4CEF1
	for <tools@kernel.org>; Fri, 21 Nov 2025 21:03:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BCC67C4CEF1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763759029; x=1795295029;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=FIgnzCoE5JtIGWzqyACHRc3XMX13ZO59v0qtjrkpD1g=;
  b=fP+UD96Rru9Vvh1HUiFG1dlV93bGBFm+jMLtgVWW96ntoDQFx9ovECrc
   B0PC/IsCqggDFECWEadoY3X8YQJCGF6nX0nV4is7sPe4tuoPtIPdnWAQb
   VgOCiLlVCcs1xq8gOhGmGToz9NwdtcFy8qn3Y/MKhm2QvF8qPza1iFTNt
   +Nnue/3b3tzM3xWjUiiA1KCwfg9pktGkFCOnRZEupAu0o/YdxvlbVg8OM
   mtLSOvMju1hv4vC0yGtH9HgCnIC7taMXkf2OjcxPWNZlZAXFxCeIIiOM0
   AWkYRVmeyWCzNbvKce7HURqgurC7J7yf9VucJfJ3VrAE0ULbpWO8T98js
   A==;
X-CSE-ConnectionGUID: 7NBGqX4TRJWwmB3lW57vUA==
X-CSE-MsgGUID: ErmJ1m+TSs+yBWwFtZ3quA==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="65051118"
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; 
   d="scan'208";a="65051118"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 13:03:48 -0800
X-CSE-ConnectionGUID: Zg+9es7sT32pXLdFj6tkwg==
X-CSE-MsgGUID: JnwAtQC+SBycahhUJ+W+/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; 
   d="scan'208";a="229089792"
Received: from c02x38vbjhd2mac.jf.intel.com ([10.88.27.157])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 13:03:48 -0800
From: Marc Herbert <marc.herbert@linux.intel.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: Re: Switch b4/README.txt to "pipx install" instead of "pip install"?
In-Reply-To: <20251118-quirky-resolute-aardwolf-f0befa@lemur> (Konstantin
	Ryabitsev's message of "Tue, 18 Nov 2025 18:02:11 -0500")
References: <m2wm44ui4k.fsf@C02X38VBJHD2mac.jf.intel.com>
	<20251118-quirky-resolute-aardwolf-f0befa@lemur>
Date: Fri, 21 Nov 2025 13:03:46 -0800
Message-ID: <m2ms4ft7wt.fsf@C02X38VBJHD2mac.jf.intel.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Konstantin Ryabitsev <konstantin@linuxfoundation.org> writes:

> On Wed, Nov 05, 2025 at 04:20:11PM -0800, Marc Herbert wrote:
>> So, should the README simply switch to "pipx install"?
>
> If you'd like to submit a patch, I'll be happy to apply it.

Sent. If you'd like to fix my English or make some other minor changes,
please just go ahead and do not ask for my permission.

>> Also, I'm not an expert but I think installing from source is probably
>> better done like this:
>> 
>> git clone --recursive b4
>> cd b4
>> pipx install -e .
>> 
>> This allows running any version _and_ from the checkout directory
>> without depending on any "b4.sh" indirection.  The main difference is:
>> dependencies are isolated/protected in the virtualenv. Some users may
>> want this, others not.
>
> This would require having to rerun `pipx install -e .` each time the repo is
> pulled though, no?

Usually not. Possibly yes for upgrading dependencies or some other "big"
change like some packaging re-organization, but not for pure code
changes - that's the whole point. Give it a try?

The only drawback is the same as the advantage: too much virtual env
isolation! It hits you when you try to install and use "on the fly" some
fancy debugger, test plugin, tracing library, Python IDE,... They are
generally "not found". Then you either need to explicity add them to the
manifest, or use some obscure pipx option, or revert to "pip instal
--break-system-packages -e .", or to "b4.sh",...

No silver bullet :-( But for quickly running pure code changes, "pipx
install -e ." is in my experience the best so far.

"uv" is also very useful but much more complex. pipx really makes
simple things easy.
