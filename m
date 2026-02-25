Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A0BE381AF
	for <tools@linux.kernel.org>; Wed, 25 Feb 2026 00:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771978669; cv=none; b=bTbtApfFePW3kD0rKwVaKtOCW2Fl3SG2EScAzFNjxEvhX5h2G8PNkULO57+vEhsR6bGK6qrd5yaMKk7BWSdCAY7x6lnMSbPdGwh5QnCdcR5UEkyKEhBW3eOWihDthOEh52re3I3p4xtA1T9muw2DElMLGY40aEWrnFsLzB5Ygb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771978669; c=relaxed/simple;
	bh=38eu/Exor+7pVKZ3G3Pr88arEgv+jEN89p6TgsyAuik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HPn12qDvSruv1OjsRAS12gyVFc0OGKjhCXL6EDXZtiQva/28cvbs/47oKogenpYXvQuXpMJhtrC7SsomHqr+DfWgvAii55HpOGcfsJU+WW3OJXSYY92ygiCeqtR6umD/2dmE7duA3oqQL0kVmIfiV7FUyMLKKQ/dMP0yeSrP3no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u2DEAx1c; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u2DEAx1c"
Received: by smtp.kernel.org (Postfix)
	id 0FCCAC19423; Wed, 25 Feb 2026 00:17:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC822C116D0;
	Wed, 25 Feb 2026 00:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771978668;
	bh=38eu/Exor+7pVKZ3G3Pr88arEgv+jEN89p6TgsyAuik=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u2DEAx1cVLNNcb8iVWEIR8LSoN6xOJzRmaRPI0SVf5a+inRTnI6X6KoUbJRZ0/ffO
	 bvPotGQovD4LWXjIEu2Th+mbZB7rP05f6MUgw5x6T0LJg1bn7wpzw3m8CyWA6ry5F/
	 OaniJ/OyA+S9V+ydFviV4PM1rX54QF7MRPEKGDXaRcvbDjz3KetJdjohUwYaYFvYgL
	 Vu9qkuZlOx3Sf/NlfJLjjJrYG+OPF6SDZXlSRGa96F+ndMHRPnmMwBR/1Bdvc2GuhF
	 gOJAet3UwMSwrpUQ0xkl/Rtf8rMnGk5ybqg02Nnic2H1EGWZmRUuZQTV/NSd+lzITs
	 e9OPufkN4JXyQ==
Date: Tue, 24 Feb 2026 19:17:47 -0500
From: Konstantin Ryabitsev <mricon@kernel.org>
To: Dave Hansen <dave.hansen@intel.com>
Cc: tools@kernel.org
Subject: Re: Missing cover letter
Message-ID: <20260224-classic-wakeful-elk-2ea358@lemur>
References: <77c934d2-27f5-4b1a-9465-92d25858e56b@intel.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <77c934d2-27f5-4b1a-9465-92d25858e56b@intel.com>

On Tue, Feb 24, 2026 at 01:22:47PM -0800, Dave Hansen wrote:
> b4 am doesn't seem to like my cover letter:
> 
> https://lore.kernel.org/all/20260213235119.6A9A0F80@davehans-spike.ostc.intel.com/

That's because your cover letter has [v3] but none of the patches do:

    2026-02-13 23:51 [PATCH 0/4] [v3] x86/cpu: Take Intel platform into account for old microcode checks Dave Hansen
    2026-02-13 23:51 ` [PATCH 1/4] x86/microcode: Refactor platform ID enumeration into a helper Dave Hansen
    2026-02-13 23:51 ` [PATCH 2/4] x86/cpu: Add platform ID to CPU info structure Dave Hansen
    2026-02-13 23:51 ` [PATCH 3/4] x86/cpu: Add platform ID to CPU matching structure Dave Hansen
    2026-02-13 23:51 ` [PATCH 4/4] x86/microcode: Add platform mask to Intel microcode "old" list Dave Hansen

Pretty much any assumption we try to make here is going to be wrong for some
other case, so I'm just going to politely ask to please number your patches
as git/b4/any other tool expects them. :)

-- 
KR
