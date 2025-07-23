Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2641E9906;
	Wed, 23 Jul 2025 19:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753300326; cv=none; b=QLWR/r8KIer4v4D9507ZObqXhuU2hvO4sTvsQWZZ+ueSl3DoV80Gh65ItyTgGhy1qeJ3WyZbnREsE10Za0NcZHFkQBPV73z7H+SMgS98eWn/Gj1jAcxqGZeEeb/sKYo/TXb5zp8M93KAxJ27iC+o5i5suQz41RwR7sXOo8X0/JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753300326; c=relaxed/simple;
	bh=yjpASgb9BaeNZa0kUKP5aVZAZfEbBd7g93qv1nXtOGE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CnA8gnA7yg1eeli6B5mrv0MixvJg4wKY9J58fSumYtODeBmZHiDdghUXdkH2Cr6Kqorijbahv1eLLR/381RyG1xpieQORHOB0eihe4flM9MRREGfMdif8zx2Vk5Vccw3jmCT/I4z19H/F78BYU8b+VTlppYRXiSDyVijhiMaOT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=vZm13Mij; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="vZm13Mij"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 457D7C4CEE7;
	Wed, 23 Jul 2025 19:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1753300325;
	bh=yjpASgb9BaeNZa0kUKP5aVZAZfEbBd7g93qv1nXtOGE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vZm13MijtHAlU7YFG+n6m5ATvUmP/ai/vqBk5L4+PKLniuYDigb3wRM43KZEu+b26
	 rh8ct5bKbjE71If9urG2EIf55jO1aFcYyHpyyAWrwWlm69hwx0m+qlH+9cJVsj3x2r
	 pbRIbS7qsaDfSlqzb6QHxUisbapKLx8xfbR1LBws=
Date: Wed, 23 Jul 2025 15:52:04 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: users@linux.kernel.org, tools@linux.kernel.org, pisa@fel.cvut.cz, 
	mailhol.vincent@wanadoo.fr
Subject: Re: b4: feature idea: plausibility check for trailers
Message-ID: <20250723-merciful-mighty-zebu-bb84c7@lemur>
References: <20250722-utopian-thankful-warthog-104007-mkl@pengutronix.de>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250722-utopian-thankful-warthog-104007-mkl@pengutronix.de>

On Tue, Jul 22, 2025 at 12:11:32PM +0200, Marc Kleine-Budde wrote:
> Hello,
> 
> without malicious intent, but due to human error, lack of coffee and/or
> haste, it happened that a reviewer copied/pasted/edited an incorrect
> Reviewed-by trailer into an email [1]. They changed the username and
> domain, but not the display name.
> 
> [1] https://lore.kernel.org/all/202507220837.23333.pisa@fel.cvut.cz
> 
> This error was noticed by another reviewer, but b4 did not notice it. Is
> it possible to check whether the display name of a trailer matches the
> display name of the sender?

That would, unfortunately, result in too much noise, because people's "From"
names and their trailer names are often intentionally different. For example:

     Alex Dev <alexdev@example.com>
     Dev, Alex <alexdev@example.com>
     Alex D. Dev <alexdev@example.com>
     Alex Dev (Megacorp) <alexdev@example.com>
     Al Dev <alexdev@example.com>

I think it's less trouble to just blindly go with "you get the exact trailers
that were offered in the thread" and only warn when emails don't match.

-K
