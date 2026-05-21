Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A243D6688
	for <tools@linux.kernel.org>; Thu, 21 May 2026 17:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779383105; cv=none; b=YBWqPpYwpOLNNJ/JmY5+LRTOcWGIi24UiKJPwpSG6RtJDXNRUf/y0C2bWvwyZUXDgfTFPWbN2rTL47abrOxtxv5JKyWfPegRyKAW3s6TtAHYT4v5967bys+pXFouXjs2fu4ZO6qZ7Cxh7qe2LmdAXKtdB60vN8cHBBmgVDNRA10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779383105; c=relaxed/simple;
	bh=qWBMxHRsQF/OsuNXTQ8IzKcJO1KnaxQdIhPLttrhUk8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=neDI3qgE0A0l4iiA1O1MMLyOaF89192PviKZbP/B/wx7hh5dGC8juoYsWPi4+eroOlJXqPIVGnuItS2K939gLxM3m7c86sZQp8unkUafcGZkDnCzMKX/WwrKd2IJckJye2nGSKk4lEqUrxtKcmHV5iajS89H/w1czrc/zrr29bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TtOLBcIH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TtOLBcIH"
Received: by smtp.kernel.org (Postfix)
	id 8138C1F00A3B; Thu, 21 May 2026 17:05:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C5261F000E9;
	Thu, 21 May 2026 17:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779383100;
	bh=qWBMxHRsQF/OsuNXTQ8IzKcJO1KnaxQdIhPLttrhUk8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TtOLBcIHXEYhHqVn3rFGh/ExZMbafOGYEBLfBuPBiJ/0fhYd2YYtzIV6TRTATqPGv
	 U91JEZ60fCT57z1CCHTZkuSvJXN1MMxLgmo3mIMnuYE1p6F07o0pe7J8TwyAxihy+n
	 92+Xt5kfENQWLyRtREdO9Awn2mKnxB0N+DzAp9s7m0g3QPpa+3o3R47t9CemvUsTbJ
	 +ed5y8dLcowsYnZofLAwug1TUgSP/uP8f0tLoxLFqz2+4SIiNW9w1ewcFXKNYbszFY
	 Z1BMqZFlzJs/B+hHoX8sBJX2zF9P19/esyHWW0jL+2Z3z5OCEKhaGNgvmz2eBH3Vpw
	 CKGHMx7oyD+Eg==
Date: Thu, 21 May 2026 13:04:59 -0400
From: Konstantin Ryabitsev <mricon@kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: tools@kernel.org
Subject: Re: kgl and git shallow issue
Message-ID: <20260521-vigorous-otter-of-peace-daed58@meerkat>
References: <20260520203544.GAag4bILhFL9wSQpxY@fat_crate.local>
 <20260520-invaluable-careful-cockatrice-e6ed3d@meerkat>
 <20260520-ancient-thundering-bobcat-2f086c@meerkat>
 <20260521011540.GBag5cvFqefROohMlm@fat_crate.local>
 <20260520-greedy-dalmatian-of-protection-4e28ed@meerkat>
 <20260521020958.GCag5pdn7ojEIRXMrY@fat_crate.local>
 <20260520-determined-emotional-porpoise-1cf7ae@meerkat>
 <20260521035853.GDag6C_Td1WFqMjFro@fat_crate.local>
 <20260521-chirpy-hot-cassowary-5df4ff@meerkat>
 <20260521154232.GAag8n6HItOIrVPd5o@fat_crate.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260521154232.GAag8n6HItOIrVPd5o@fat_crate.local>

On Thu, May 21, 2026 at 08:42:32AM -0700, Borislav Petkov wrote:
> I guess simply warning that you're not finding the expected maildir layoyt
> would help against crazy yahoos like me. But meh, not important. Prolly no one
> else is doing shit like that anyway - only me is sticking a stick in the
> "machine" and saying, uuh, let's see what happens if I do this.

Ah, yes, the famed U.S. approach to foreign policy.

I will, at least, add a better error message than just shrugging and failing.

-K
