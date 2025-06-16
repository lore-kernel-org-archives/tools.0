Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F8E62E427E
	for <tools@linux.kernel.org>; Mon, 16 Jun 2025 13:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750079120; cv=none; b=UrkGCzRDwPP5mW9Af3Lgo/GlEXii2P6BWQSoHVkgvm1JAs8aZBouqaY7+V9eLyy35m03F/koXiGxoO+V/cFXlYnmuk0ZI5SjMAnBV5vL2JoBYwJ2LgK1v/Vus5mboxood69UfucTsk7yg2fhKIQC9JLwnReM6OmhoRzpwxO9b74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750079120; c=relaxed/simple;
	bh=Koxt41mGxBh8kaTEqSLXSxzfjKll1ARvXHhdo24fZDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ONlHcugOeDCG7lIz6OEIEcfh5WlZWqOu2Pl0TqSjRWAcJjIZeisrZMexcTptU4fOJQ4u+Ti5BwA+307Ry/yszrlSqPXQq7CA95XGfjIOfARYn5WPNpB5QkGONnXuSPFIRm7ys6jMQVcAWbTibFj30wEfkvJbJmG0eRATLjalEv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=tHVGy7Ey; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="tHVGy7Ey"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEA05C4CEEA;
	Mon, 16 Jun 2025 13:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1750079120;
	bh=Koxt41mGxBh8kaTEqSLXSxzfjKll1ARvXHhdo24fZDI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tHVGy7EyQZTly/EEWVrjyebLqwcjRGyeVw23YgekKT/zxr2FZlVCmssnFjr+QCAta
	 UEjgco2xwp+rwzmSeKP9ouvgJRLRVX1dgI0y5l3pO4uyFRe3vA9AC1eBwOt1va4/Lz
	 m9cA0QhdpQ9JLk4aPyl8Q/qKx6pHxql2gErsIeE0=
Date: Mon, 16 Jun 2025 09:05:18 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools <tools@linux.kernel.org>
Subject: Re: Python backtrace running current master
Message-ID: <20250616-eggplant-vulture-of-proficiency-7d6efd@lemur>
References: <78832c81-9b84-491b-bb1e-5f67ecddd34b@sirena.org.uk>
 <20250616-prompt-bulky-kangaroo-eb07e0@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250616-prompt-bulky-kangaroo-eb07e0@lemur>

On Mon, Jun 16, 2025 at 08:45:46AM -0400, Konstantin Ryabitsev wrote:
> > Traceback (most recent call last):
> >   File "/home/broonie/git/b4/src/b4/command.py", line 10, in <module>
> >     import b4
> >   File "/home/broonie/git/b4/src/b4/__init__.py", line 41
> >     type ConfigDictT = Dict[str, Union[str, List[str]], None]
> >          ^^^^^^^^^^^
> > SyntaxError: invalid syntax
> 
> Argh, I guess Debian Stable has Python 3.7? It's EOL since 2023. I'll see if
> there is a workaround...

Ah, never mind the actual "type" declaration is new in 3.12, but this is an
easy fix...

-K
