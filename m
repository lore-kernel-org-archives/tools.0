Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793906199;
	b=tO4qq+7UJtosXRB462ooErzPf83O+si1rGzz2Yl0zY/KtjyZGWl2priLGXxR4daJwlkY
	 Suxm8ab8Jx530OvxjkKXDthCQMFCO2gP2NQ1V9q/IcWyC2XZSxjmnAizW7+CKmIuXz7qX
	 O1vS3GvBCzoJ9g22kiRe2K1uu45bghUCez4sKKyoYGUGGdkeUxje4lG4vEV3bOP+XWEh/
	 m/R8+Be4PqUrNuUmts3nDqUporc452YucvAnV7ZKoN533hWBogWX/rNP7kH1G9FNfsR3a
	 QQDoNFaTf5YQoHZvAjMvF7JOuqYkzEeD7yNIMaZdgi+xNRl7vVtSi/0BsbzQh6EYkTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793906199;
	h=Received:Delivered-To:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=u3fyThc+3I+lnyZedXiXSEynrpY1c1eUJC2nibBtq2k=;
	b=tTcv8E/yzuxHSo86qkUJRyRnYmeKbs8JC+kJhmowcxHxvVH2+qsYUW/Bk7gljRZnDdQ+
	 cPSuqyzvHF9ST/glpJ+zRmnV5AcMD0lSLTVA16QTKJGyIRKqdqW1ju4hr0FNQQ97rfN/u
	 RiCxtRkxudah4L5hgSd8Y5Bt5UwPfVBkG4BcrAv/MQ7pulzrP6zqfb6+p75IQAGmG40u0
	 9UUrhl+47Gup6p5rUGOn9iparQ1w2BZGjNLPQg6GbXWWLv0n8Z3OFoLkXF20LZQtUPrBI
	 ARZLwdEbyNHQO0joTIR5Y3O++lN2JzXSoNjTjHhwLp0lOYcFe4nweyAr9QwlNSzmUSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Oq7OsUEN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 73636606A31B
	for <tools@linux.kernel.org>; Thu,  5 Nov 2026 19:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Oq7OsUEN
Received: by smtp.kernel.org (Postfix)
	id 29D991F0093A; Thu,  5 Nov 2026 19:16:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 9400E1F000C1;
	Thu,  5 Nov 2026 19:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793906199;
	bh=u3fyThc+3I+lnyZedXiXSEynrpY1c1eUJC2nibBtq2k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Oq7OsUENIfkaCx7lEQVgj12gQG6H/+F7nGuXU8ZwBikEmIxf48bM0fkkbhmz03H8j
	 2FMlcVD5KkLt3kPRrliJm66zLIdjlp8CX1XsrYA8NhDxVM3RkPPbBXl32whCzNuVTX
	 rVeEg6PPkyTcaQKka3UmSVXZU9gysUTDTZcAEtH2YAvMX+bqFXK1DDCAgNv83ETwDd
	 vVwIa/5HizICKtuD4HlaDOcEWYxWDyeZelccOLiVWRQ+Fx7psOydcVFdRHDz/wdyZ1
	 /+1+sa7rIkum1U4DzkJcSjELFT05oz9Ezj0KHd1t9CPj/vXCU/Sb3Q2T1g7RHU8w7N
	 o4ZBfCVohAo3A==
Date: Thu, 5 Nov 2026 20:16:05 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, tools@kernel.org
Subject: Re: Replying to skipped patches in b4 review
Message-ID: <auzV9fKvazbJoS6y@levanger>
References: <a50f713b-14ed-4ccc-877a-cf2c95111c09@sirena.org.uk>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Post: <mailto:tools@linux.kernel.org>
List-Help: <mailto:tools+help@linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
List-Owner: <mailto:tools+owner@linux.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a50f713b-14ed-4ccc-877a-cf2c95111c09@sirena.org.uk>

On Thu, Nov 05, 2026 at 05:24:13PM +0000, Mark Brown wrote:
> Hi,
> 
> If a patch is marked as skipped in b4 review then email mode will skip
> sending any replies for it, it will only send mails for done patches.
> If the reason you are sending a reply to a particular patch is that you
> have skipped applying it this doesn't work so well - you need to mark
> the patch as done, send the mails, then go back and skip the patch.
> 
> Worse, after sending it is not possible to go back into review mode
> AFAICT which complicates the skipping.

ah thanks!  I was afraid that it was a misuse on my side...

-- 
Nicolas
