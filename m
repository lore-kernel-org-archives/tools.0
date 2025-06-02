Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF21228CB5
	for <tools@linux.kernel.org>; Mon,  2 Jun 2025 18:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748887986; cv=none; b=NGLIzI6iQZnyGODlt3q26FBlA67gWn20gXQrRVesCMWBpRoeiodfJmOJGTw52tEWYrJp8k0tcfAkdKgWAfF1Elm294rTVt22hAigZJAKIBaqUUUOtHoEK1no6ilWQDt179MmBUCFlv6v8HkD9pm9VyjxwGSyEtUQonH4hRn6u+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748887986; c=relaxed/simple;
	bh=LqpIiSsJnO7cnuSUdpzOAuNsgIx5Sc51UmngH1+uGF4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H7KnClKNft87T1EYHAxp224eUQ3koaFx+2SHuGk8ygkrZg4kRVJIKptAY92FafnIm264J4HGvhR7Vv5UOS95Ji9aciP9J00pn9MX5LVuarp5D4fdSTkFPZe6T8WUg64g04/RP51BM9LNB0t28KVMkvHdm8jqlvubYYJdmXkkxhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jsZrQ+V2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jsZrQ+V2"
Received: by smtp.kernel.org (Postfix)
	id 21E3BC4CEF0; Mon,  2 Jun 2025 18:13:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07EDAC4CEEB;
	Mon,  2 Jun 2025 18:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748887986;
	bh=LqpIiSsJnO7cnuSUdpzOAuNsgIx5Sc51UmngH1+uGF4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jsZrQ+V25XNZwVBgGB8PpqeAsid992EaDVwx8oXwwO6Flc2cw+HLq00X/c6uh+HI8
	 9pf5MW2fEZDyObAUHiIBWk5urK2/j2y3MbhY3Igk00q1v87Fch4bVPt+tuFlosvPi2
	 tCuMovwelL4UyhwEHHPVH6E8DMKzvUSaemxjY/JLIvzI53PmD1tNgXH/sZ/E5oUU1Y
	 bF0dXZOAPXshZ+hiJfb+yPftHASLgQ00hmFtJToxVGPBNcN/BsDM98LpLFky8J40oT
	 INI6Ht5hoUH9uxbG2AtAbeuJemxeYhtYhqKj28NGbgUu94P3G/NTlaclM7GMNbSGqe
	 UBzMD08MOjXlA==
Date: Mon, 2 Jun 2025 11:13:03 -0700
From: Kees Cook <kees@kernel.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: "Kernel.org Tools" <tools@kernel.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: Re: [PATCH b4] ez: Remove wrong "f" from msgid
Message-ID: <202506021113.1D0A1E30@keescook>
References: <20250602-fix-import-typo-v1-1-686d23571741@intel.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250602-fix-import-typo-v1-1-686d23571741@intel.com>

On Mon, Jun 02, 2025 at 09:32:39AM -0700, Lucas De Marchi wrote:
> That leading f shouldn't probably be there and makes it harder to
> copy-paste the msgid when editing the cover letter.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Kees Cook <kees@kernel.org>

-- 
Kees Cook
