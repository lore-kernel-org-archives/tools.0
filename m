Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3FD150096E
	for <tools@linux.kernel.org>; Fri,  9 Jan 2026 15:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767973912; cv=none; b=ORfbm2xvxSh4zJIOjORKfNQYv3Pfsse6mw8xQTyc6D5F9xkclurrk3H0YSsbV+VkzKhsdgKKDkQCsR43vPds//Jo8SzXknt+IO9mJTLM9ONi9+immiu96jGsBQ1VfvRnlx/6JDCVaKD3uSQMZla75dFXsYO6moVzGvw2N+qKXNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767973912; c=relaxed/simple;
	bh=nf8lRaqf/ySVuJT3p5T0YerSvXFI0+cv2OFvwtGv01I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OjSTnYEkY2Tn5lYUzxUTt6tyZklND05sn9MosKhF2I2qCTxTpRnXmrZ8jeQsO0KNnFyalI6IgI4ipowUrfcKxtFpRf0qR+xRly5HVieJ2FD/25ZEomqYpRUJvMs35nfAFmzPZsv3OLw/9m+bL+nW2dPmCmm1fppCczoSD1EQRSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=E+B4IL+7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="E+B4IL+7"
Received: by smtp.kernel.org (Postfix)
	id 9D06DC19422; Fri,  9 Jan 2026 15:51:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6464BC4CEF1;
	Fri,  9 Jan 2026 15:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1767973911;
	bh=nf8lRaqf/ySVuJT3p5T0YerSvXFI0+cv2OFvwtGv01I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E+B4IL+7gUFxf2DzRUKugAhqm8oyBfpifgo1DqGnfM7mysEyRPwozZiV9MwjEu8b7
	 t68aAbt449npNGBO24CxqknrbbdWP4LiBN15/UpAsqH84V44I8uAyR1+8FG9EJaZ2V
	 ZPzOngscDT2dvhduKJYH3UfST8RIqN0y+vFGdyDY=
Date: Fri, 9 Jan 2026 10:51:50 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Artur Weber <aweber.kernel@gmail.com>
Cc: tools@kernel.org
Subject: Re: [PATCH] Use pre-Python 3.13 Generator type syntax in conftest.py
Message-ID: <20260109-complex-hoatzin-of-action-0c2059@lemur>
References: <20260108165200.11313-1-aweber.kernel@gmail.com>
 <e0229ecf-5ce4-45b3-af3b-7008afed94fd@gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e0229ecf-5ce4-45b3-af3b-7008afed94fd@gmail.com>

On Thu, Jan 08, 2026 at 07:20:41PM +0100, Artur Weber wrote:
> > Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
> 
> It just occurred to me that I didn't mention what this patch is for anywhere
> in this mail.
> 
> This is a patch for patatt :)

Thank you for the clarification! I would have eventually figured it out, but
it does help. :)

(FTR, if you use b4 to send patatt patches, it does stick patatt into the
prefix line.)

-K
