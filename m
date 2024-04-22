Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 475091514C5
	for <tools@linux.kernel.org>; Mon, 22 Apr 2024 14:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713796175; cv=none; b=Ca/9qQh/mAPhABRKS4HgKuqmPkpgkVOyFs9sUj5IJKjg14KPWuFqDB/qTMwsUEpWboOTs2wCCrq5bezXyfTWigrhaOPoVyBMMXJf1T+G3jOoyBwEQ+yhnp4+EisXEjhgkVpLSGyG1dhvg08T+srRb80EgU/qaOQGyJbt1zkHePE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713796175; c=relaxed/simple;
	bh=CpOU/32rleO50JpLbBN8sGU6d2I8+3jhd93MzNJDtSg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H51Dg0ZLehfehLuXi7Y/m0TPpy8BVb4h+JDVXnxRjlOcRN7FFSy+gFp8mFx0PX97H68q8nF6eFPdKTWOHRBHufSR29MSMmukFyf7VgwiNJn60YiJ0sVBQUwvdF832hXGfDMpX5qGQ6WhZkFiCdz76NdmxQlP0n+M+Htw7y+ov/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ReBsI+Zk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ReBsI+Zk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4EC5C113CC;
	Mon, 22 Apr 2024 14:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1713796174;
	bh=CpOU/32rleO50JpLbBN8sGU6d2I8+3jhd93MzNJDtSg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ReBsI+ZkGOw8QE3sEwum4ieuC4imcl+qZ0spQkYkhRQptCli9P0JV4zRS2TLblMu6
	 F4wI4wWGGNPGdTC1jm6b45GFVPy625t9adAmWVGlSd1GIcLcbsh2ZV44vBC4ShiJ/R
	 O2sUc8zBe9EOT0Xe+gHuCnwTuOOjvLl/Lx5255ao=
Date: Mon, 22 Apr 2024 10:29:33 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@linux.kernel.org
Subject: Re: Checks for recipients
Message-ID: <20240422-sincere-stallion-from-hyperborea-bffddf@lemur>
References: <ZhQ8DoS1GaT0603l@sirena.org.uk>
 <CAMwyc-Q466R2za0sMTD9Chx77hL7xBBuNROokemLmp7dt=i10w@mail.gmail.com>
 <ZiPBx36go0AYBWO7@finisterre.sirena.org.uk>
 <20240420-arboreal-natural-sambar-ff61bc@lemur>
 <ZiRiK4sB6kKwdH7p@finisterre.sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZiRiK4sB6kKwdH7p@finisterre.sirena.org.uk>

On Sun, Apr 21, 2024 at 09:47:39AM +0900, Mark Brown wrote:
> > Thanks for your feedback. I'll make these two changes next:
> 
> > - add a check/report for "needs-recipients" that will be separate from 
> >   "needs-auto-to-cc"
> > - add a way to turn off pre-flight checks via b4.prep-pre-flight-checks 
> >   = off
> 
> Thanks - that sounds good.  Perhaps for the pre-flight checks list a
> pass/block list mechanism might be good so that people can pick which
> checks work well for them in their workflow?

Ok, the 'needs-recipients' check is in now.

I'll work on adding a way to turn off pre-flight checks via:

  b4.prep-pre-flight-checks: disable-all
  b4.prep-pre-flight-checks: disable-needs-auto-to-cc, disable-needs-checking

This should allow turning off either all checks, or just specific ones.

-K
