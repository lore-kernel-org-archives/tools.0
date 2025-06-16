Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB0A38FB0
	for <tools@linux.kernel.org>; Mon, 16 Jun 2025 13:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750079949; cv=none; b=Qzy5zO3/b0fqu1ELZW9njlsjlE90NmJajIVdlyZhtVsnI7zV0TSRPvJNGgQXPkqBYyc66Gd6tVj/zCXG62+/rN+v3M2FWRyw12x+4LEJW/jXKV+XuzEhcig2nT/z6yxrHeXHvgJVYFl7KBdWDdmhXxUgpQigoWQNQZtjDmKTHes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750079949; c=relaxed/simple;
	bh=N0nTbYX2hT4t/4BOlI+5hM3oUPRNKaBeV9cFOTr7v50=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BmNcs+eKnhOsIukNyFv+HdPkwHNRboZglcuS4rZ0K2X9r0jdYzQ+FspjJZDD0mNujIDWRmwpKBA/2sInB0GRL3ga9NZZcKVtrh29oQ5obOCPqiZak6CgvCLxjuRIP11TMJewhE0q1Igr4SWE8/CS9q/c0MwHzTKqT30rzdl9iN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=XQ5kipsZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="XQ5kipsZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6076DC4CEEA;
	Mon, 16 Jun 2025 13:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1750079948;
	bh=N0nTbYX2hT4t/4BOlI+5hM3oUPRNKaBeV9cFOTr7v50=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XQ5kipsZVfoNVacGzp0DUGVolpbUcftV2+cx4iTjpuxFaWHHzM3KbzhAPHFIC51YU
	 2F0i8v6faGtYC8sAqx44+mQ9XEunizu7rtGC692G6ZiWWc13XgTddwYMddZCbPFfx/
	 xq/tdgklD7AajLw2ICFIybktiWm7xhsJQBVREdmw=
Date: Mon, 16 Jun 2025 09:19:07 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools <tools@linux.kernel.org>
Subject: Re: Python backtrace running current master
Message-ID: <20250616-rustling-serval-of-brotherhood-85eca6@lemur>
References: <78832c81-9b84-491b-bb1e-5f67ecddd34b@sirena.org.uk>
 <20250616-prompt-bulky-kangaroo-eb07e0@lemur>
 <feecd4f3-ac9f-4bac-95df-bd5e4629055d@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <feecd4f3-ac9f-4bac-95df-bd5e4629055d@sirena.org.uk>

On Mon, Jun 16, 2025 at 02:16:31PM +0100, Mark Brown wrote:
> > > With current master (80e1a7f) on Debian stable I'm getting a backtrace
> > > trying to run b4 with no arguments:
> 
> > Argh, I guess Debian Stable has Python 3.7? It's EOL since 2023. I'll see if
> > there is a workaround...
> 
> The default python3 on my system claims to be 3.11.2 which seems to be
> up to date with what's in the archive, I do have 3.9 installed as well
> somehow but that doesn't seem to be what's running here.

The latest master should have compatibility fixes that I just pushed. You'll
want to "git submodule update" as well.

Let me know if that is better now.

-K
