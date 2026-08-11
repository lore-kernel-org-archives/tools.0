Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E6447A867
	for <tools@linux.kernel.org>; Tue, 11 Aug 2026 21:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786482777; cv=none; b=ZfDGwu3FXAlAnJAJ2P+OkIa/pArEQdIuv6mzjuX46S1U6IgNkOz1JOihNcuaDZce0NDWpwUhCgpQQfz0z2Pbi5yphAHcOZN52rjOcjoW6lzGGnJG9VYzJEyZDcEJsgrksvo1huyj0Sg5xTyPv0F0JsbIrbY19eLi8kmQdnuk/4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786482777; c=relaxed/simple;
	bh=wpASaBTiCPNWG0/auQ0DBvBhBDgucloZax0i7CaBYM0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lp/DOyrRin+uyo/duUkdFyqTt0tElb0/6iLE8SzApdXzFCMOJRJOge1kBPm1dJyFvT5QlMcbdAeGnnbF9c6XOePk1zqDPSahe76P8zUjW3oL2a/PpG6u+Fie8dUYdjtNuEehWlb1eYFyLJNan82Z2Hrs+yeaESXhvfiIr+6H04w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=fDaMsiPx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="fDaMsiPx"
Received: by smtp.kernel.org (Postfix)
	id D49EA1F00A3A; Tue, 11 Aug 2026 21:12:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7521B1F000E9;
	Tue, 11 Aug 2026 21:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1786482775;
	bh=Fmso52Bk8+ElI2wCLOiQ8VR8I/43VAHAdrYqWfE/bII=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fDaMsiPxDgLNnJw/LGwvRnU8BKApB8PIM4M90gB5xjlobgrtlIW/3FpwugbAriR7c
	 1QPzNCuMR/YQBl5Jq96LrQMu7u9BT37EujQm300i1U/SJ7nE44Qys8UP68jmTbp2Uf
	 zEUAg7lU1UsjdpcaQlzR+wzXJudon1jtOmiaPN2A=
Date: Tue, 11 Aug 2026 17:12:53 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Cc: tools@kernel.org
Subject: Re: b4 filters out Fixes: lines
Message-ID: <20260811-adaptable-amaranth-salmon-596eba@meerkat>
References: <CAMxuvawkMqDYVP6T85+s6FwDzp5B33eWNHjkjoAoW+C4OnuZYQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMxuvawkMqDYVP6T85+s6FwDzp5B33eWNHjkjoAoW+C4OnuZYQ@mail.gmail.com>

On Mon, Aug 10, 2026 at 11:59:59AM +0400, Marc-André Lureau wrote:
> Since commit dccab10473b5 ("trailers: reject malformed Fixes: trailer
> values"), b4 filters out anything that is not a commit hash-like line.
> But various projects, such as QEMU, use Fixes: lines to reference CVE#
> and sometime report/issue URLs. Can we relax the validation? Should we
> make this configurable?

Right, this was tightened because "Fixes:" is a one-word trailer and we can
legitimately find it on the line followed by arbitrary prose.

I'm not against broadening it to include URLs, but I'm less sure about
arbitrary strings like CVE-NNNN-NNN.

Regarding making it configurable, it would probably be more worthwhile to make
the whole list of follow-up trailers configurable, as a list of regexes, e.g.:

b4.followup-trailers = 
    Fixes: CVE-.*
    Fixes: https?://.*
    Closes: https?://.*

I'd lean in this direction as opposed to just a special-case for the Fixes:
trailer.

-K
