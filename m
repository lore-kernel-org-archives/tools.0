Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF7A51B4F1F
	for <tools@linux.kernel.org>; Thu, 21 May 2026 01:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779326222; cv=pass; b=GhRWk9zb5nq92ZYNdx1cbu15r7cODxMJy7Q765iE0ytVJrpiwm9gXcJeJ4ft/xS71qVLR096zVTFP+2nMKvjdVawXR+up1pnqEK11+H/cHNstRciFsrFtde9bcUOiDJbZwBpIx9qIQOVTCQ/PCYVJTmFfQZ1A2etuiHlrdRkD7U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779326222; c=relaxed/simple;
	bh=XUx/ndruAAzOfv+8N/Qg5lXWtdTJmBlN4E0Qz+Zv16o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ha8hqUfIUjX8S5POHx95fgAmOFFhUaPFYkJxzUVAzGI/6eCHU/SZmYYAx0C+ddjIZODPclL+nxtlqOS7BTvt9hESNgblOYGgUw1qbC+lW1q7Nn1IUWhXMlamSQkSaaonro+umcxjMoKWnAxqTYtq9SRKk5a1WkUptUd/5v4ocTs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=ENiiKclw; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="ENiiKclw"
Received: by smtp.kernel.org (Postfix)
	id 83F021F00A3C; Thu, 21 May 2026 01:16:59 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1779326219;
	b=QF4gUHSnib6ZXiAY7JV/iIQE2dpC5LWXDrhSdTRtlp22VQlGDjQXkZtIbp5cE2vdFd8n
	 cA37+MIIjmL1B1FCiFJNHVQrA71MzpNfwdER7D+ewGm22fhIhMoXV32hww4RgsDwoTUKz
	 wiwiQJkuTEWF4Czcof7nH6TqA0kIx9gLUq+e1QweSWWoS/dUiD2YQef/d+l+50GcDQ45B
	 3nlpxko6Kr2izqfPgLB4OmJk8qGPfWEi4PIzCVLTkp3kgOATY1S3IsO8xo8/mFMjOdJtC
	 iW6ZgUEr21uO7KHHM6fpVZbztWK9foqyvNctEQ6lg0z5Tk0QduY8kHOe6FrlsgWveOA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1779326219;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=+MnwH5w3kcHxI+Tf3s5YouXaA9xT40JFnRW2xTjk+R4=;
	b=MXWdO0p2cAavCnxYfUftODGDlNM366l+Mt/xaJJztrWb6twQsgOoOKMT3P9e7Uzy4uur
	 lgcveuqKwUvXThqOQkwc1fZze3t1nxogp2r9y+KUXttu2bWlM4RmT0IX4HNDf2tUwhW3j
	 6ATyhf5dDvn/0Q7Vl4qjoc8XXn1/0KrR3Ky8+N9PHILQXJZ9c+dzjpdL2Kj4MKgOAaDB0
	 mmaGXeL7+vEsroj9Ilv+sCo9Xbnw9Zy8vB0SvtXUNjUmxnDALoWz22XVdF/jMM6BsNsa9
	 Gs219kseN0SY5XsOPbpQz+Sy6MCXBfLUSEysMck/qsrNTYBRH83JC42uVmWNPxeE5aQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=ENiiKclw;
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EFAEC1F000E9;
	Thu, 21 May 2026 01:16:57 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=ENiiKclw
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org EFAEC1F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=alien8.de
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id F13B340E01A1;
	Thu, 21 May 2026 01:16:55 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id S13mTBavM_No; Thu, 21 May 2026 01:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1779326205; bh=+MnwH5w3kcHxI+Tf3s5YouXaA9xT40JFnRW2xTjk+R4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ENiiKclw5lb5SUuBS5gGvB1FOWP7x5h0/bTkjkf43e8/ErZ4bRBOHRZZJmcazK2V5
	 9PmpepoxXIfFbRE5HSkgqE2d2bL/guNTkpqF/DePIVLA3OqhnM3eMR0dF0fMh0iRO9
	 jcbtbm59sIFAzKzbwOmGKB2PPHgRaKESSWMRGi2WZ7fec4LWj08GI8YHONSJ/H+Zmy
	 siWHnLUuvRqO/tN8FH4IvquWhZQu9cK7H9g/GrMQmfwRrq8rqqzKc9g2/FFQ0RAH15
	 Z2YYIXYJWL7W3DLxuY5BphFLA2wnU6/GD0bQxDU1Qx4TGYkm5UNkg9pN6Dsi7TKLT3
	 f6qENFML1xiaayyHfCwJUoI2AmBZps0Nd3bRzK9deLuvMYeFNsUpp+Ila0VLeOZNWj
	 xz0cWeiYkUPc8bfZAE8WgETGhcCzX6FB0zMLCGYTES0vXItcUxyZvkY1peqXLqLoGN
	 K3J1FXVo+qoD7LFxFq7EDen/FESyp+QH7TkI9iVdHzwFkfBX1Nj05bbdz/EMNiNCNQ
	 czRzN0mcCnwWPP2XRuua3U+8IKQ7tSBznGIWUK7hELW1mk6eiyfo38UlG3dwPelkIB
	 AlOYF6YJN5wlGYGP1halLiAOPdK5c8CxumLwg9GFhS+tFk85TsK7RUh2fAnIWbszW4
	 HVpnuKWDU3oxniX6cuVeg1/w=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00:b8a3:f58e:8829:9ca6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 9453340E0140;
	Thu, 21 May 2026 01:16:42 +0000 (UTC)
Date: Wed, 20 May 2026 18:15:40 -0700
From: Borislav Petkov <bp@alien8.de>
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: tools@kernel.org
Subject: Re: kgl and git shallow issue
Message-ID: <20260521011540.GBag5cvFqefROohMlm@fat_crate.local>
References: <20260520203544.GAag4bILhFL9wSQpxY@fat_crate.local>
 <20260520-invaluable-careful-cockatrice-e6ed3d@meerkat>
 <20260520-ancient-thundering-bobcat-2f086c@meerkat>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260520-ancient-thundering-bobcat-2f086c@meerkat>

On Wed, May 20, 2026 at 05:47:33PM -0400, Konstantin Ryabitsev wrote:
> Actually, I just pushed a commit that should fix this. Funny, this is exactly

Pushed where?

$ git pull
Already up to date.

top commit is:

commit 4d6c7c0c7b7b30dbba54c6cf944bb5de1c04e426 (HEAD -> refs/heads/master, refs/remotes/origin/master, refs/remotes/origin/HEAD)
Author: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Date:   Wed Apr 8 22:01:23 2026 -0400

    Use liblore failover and auto-probe for all HTTP operations

on

  Fetch URL: https://git.kernel.org/pub/scm/utils/korgalore/korgalore.git
  Push  URL: https://git.kernel.org/pub/scm/utils/korgalore/korgalore.git
  HEAD branch: master

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
