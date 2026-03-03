Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B8A18EB0
	for <tools@linux.kernel.org>; Tue,  3 Mar 2026 05:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772514980; cv=none; b=NT3ey1kQBErMWMx2JngX8jobiC/Z+CWT+9f3i/PmeM10yx20B0BxnLSZxtrSZZdZ9tTEDK+ty5Af0ErqeBPsQSg5/v3lIZrDbJklY/Eo+Dk6NyZ7VGH1i87XpBLZQXj90PuXxvUVMEXNkpkN3C+Mr8teHPAq/pj3O0W88vFXx/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772514980; c=relaxed/simple;
	bh=vcsxjmVlVbKquFSxJhWVRJGGynxDKtLxPjm3lNN7/GQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RhacV/JeSR+v4xRGYaXM5R5gq2n9yIucbUpcmQDebTAD2pXIv0WETkqMk2v4WGU8lBS21AideI3UJgaLiOXUnhmEp555nIn1IUw3xn4r+MYCpSaiGJ3Z7HHSbsxJu2v22hAVerZvnRqtMoshCXnLozGze7aHfwh7UCzSdb47nRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g5sfXfvw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g5sfXfvw"
Received: by smtp.kernel.org (Postfix)
	id CE08DC2BCAF; Tue,  3 Mar 2026 05:16:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88AD7C116C6;
	Tue,  3 Mar 2026 05:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772514979;
	bh=vcsxjmVlVbKquFSxJhWVRJGGynxDKtLxPjm3lNN7/GQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g5sfXfvwlMqbqBCx4wdf0YeldVFow0QUzlyu5x+5Kg32iLGhOnpfCGvHbZM4+0U6P
	 94NE5YjXB0leWzCi4ePYRPrqkdZ7nEw75IsIiqnQ9uXR3svyQaYgt6aKcCOCgIl3C8
	 bDZHgV9C/tXgBT6XonHlqMNClJJNA4geanqSMRDigor5PD2goAqVh6TsiKqwY2eI2C
	 Skr/FOtlDlH/RwWiafcSRtvGSMrHxDgRDW9LiagmWCrTJ94TA983BwNa27PXeQdvN3
	 A3EMw2kmSBmmBhLoT6YPSNLT602jovLW7UiJXnowjrInuu0BJlv3cWV3useKgug00r
	 nljbWJ+d5fwtw==
Date: Tue, 3 Mar 2026 00:16:18 -0500
From: Konstantin Ryabitsev <mricon@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: users@kernel.org, tools@kernel.org
Subject: Re: b4 review available in master
Message-ID: <20260303-tactful-zippy-oxpecker-fbcadd@lemur>
References: <20260228-versed-wapiti-of-blizzard-4677aa@lemur>
 <20260228-crested-swimwear-a57a3060b860@spud>
 <20260228-unbiased-mature-beaver-680aba@lemur>
 <20260228-pasty-clerical-b87a92aead3c@spud>
 <20260228-ruby-hawk-of-valor-41f0b0@lemur>
 <20260228-aqueduct-nuzzle-c03be63e03af@spud>
 <20260228-arcane-mamba-of-refinement-6dba82@lemur>
 <20260228-poodle-of-wonderful-justice-acfab2@lemur>
 <20260228-gulf-mountain-5f935fdefaea@spud>
 <20260228-charter-keenness-1256807e458d@spud>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260228-charter-keenness-1256807e458d@spud>

On Sat, Feb 28, 2026 at 10:32:04PM +0000, Conor Dooley wrote:
> I found another issue. I tried to use it to send an email:
> https://lore.kernel.org/all/177231592262.848068.18080490567217057666@spud/
> The tool decided to send it from "Conor Dooley <conor.dooley@microchip.com>"
> by that's not the from field in my gitconfig, but it is what my
> user.email is:
> 
> | $ git config get sendemail.from
> | Conor Dooley <conor@kernel.org>
> | $ git config get user.email
> | conor.dooley@microchip.com
> 
> Obviously this caused a bunch of rejections due to DMARC issues, because
> it used the kernel.org email server setup from my gitconfig with my work
> address.

Thanks, it should be fixed now!

> I feel like I am spamming you with responses here, sorry about that!

Please continue! There's also a hopefully-noticeable notification when you're
running the review tui from a review branch that will tell you how to get back
to the series tracking view. :)

-- 
KR
