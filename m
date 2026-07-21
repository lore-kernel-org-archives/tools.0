Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB6513B42EF
	for <tools@linux.kernel.org>; Tue, 21 Jul 2026 20:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784666329; cv=none; b=bZNzOcZ6FTrJdYryxhC+QPNuSNcpRBQnygV6kFr3kRP9nbx1eMtIAejkeFGdAPLe5gs7pFTYGW2vSeJXV0lwUbR0V3ds0IQvRmKfTzXXRCXhU2BzQM+IZDj7OI21s3xWR1PxFQnSrS4eLkwQLYpxrRuilHd2cQ/nQc6eW26dYRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784666329; c=relaxed/simple;
	bh=nXtgFWQd0dkMBpXiFZW5JidN74ArXxMmkNEtguTt7mg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aRxzOLk5pwXyNvOXsTPnfgmNj98Yv/+KBKwPLNjtla1ywvi/vM8yTdQqj6y0L1zD8SBgwRfulI6No3c5uXBMVkMp7SK0/NCB5Mo7AfZhNz/DRADQJAoVWnuwvkhFnB6qqqbjt5M7bAm+u8KMWgoV8QU/NeERIGiMNf/OW+4pZeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=NrB+7H7C; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="NrB+7H7C"
Received: by smtp.kernel.org (Postfix)
	id 926891F00A3E; Tue, 21 Jul 2026 20:38:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21FBF1F00A3A;
	Tue, 21 Jul 2026 20:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1784666327;
	bh=T32T/90GFvzhGDohnN8pRxYjVAVcKz8UiHfyF8lmAtM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NrB+7H7CklAAf3BZgsMdOtQy9V5NXmFjzHTH+vw9kq6lciznP+GRpN6YX9FrSSt85
	 gdzcbkGkCVlLoRMEBTi8sYyq9uRIn6j2x5QhkzDSW/FZgJ4i3KdXICCbAoGxv0O8Ra
	 nh6uRfd36FEKI6vUF2kSDAEWDxIUINEo3amKke2U=
Date: Tue, 21 Jul 2026 16:38:45 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Matthieu Baerts <matttbe@kernel.org>
Cc: =?utf-8?Q?Cl=C3=A9ment?= Le Goffic <clegoffic@baylibre.com>, 
	"Kernel.org Tools" <tools@kernel.org>
Subject: Re: [PATCH b4] config: accept prep-pre-flight-checks from .b4-config
Message-ID: <20260721-capable-beagle-of-experiment-1f2d8c@meerkat>
References: <20260710-b4-config-pre-flight-checks-v1-1-ab16cf14a00c@baylibre.com>
 <a7e019e7-584f-4be4-bf15-c3ac51be8edc@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a7e019e7-584f-4be4-bf15-c3ac51be8edc@kernel.org>

On Fri, Jul 10, 2026 at 05:51:10PM +0200, Matthieu Baerts wrote:
> > Add 'prep-pre-flight-checks' to the wtglobs list so it can be set
> > from .b4-config, allowing projects to disable checks (e.g.
> > needs-checking, needs-auto-to-cc) that are not relevant to their
> > workflow and share that decision via version control.
>
> I don't remember if it was present in this list for security reasons --
> similar to *-check-cmd at some points [1] -- but I do remember a bug
> report with the same patch [2] which has never been applied.
> 
> On my side, I think it would be useful to be able to use
> "disable-needs-auto-to-cc" on some specific dev tree of a
> "sub-subsystem". On these dev branches, no need to add extra reviewers
> from the "parent" subsystem.
> 
> We could then have this config:
> 
>     [b4]
>         send-series-to = <dev ML>
>         prep-pre-flight-checks = disable-needs-auto-to-cc
>         send-prefixes = <specific dev prefix>
> 
> [1] https://git.kernel.org/pub/scm/utils/b4/b4.git/commit/?id=a1360385
> [2] https://bugzilla.kernel.org/show_bug.cgi?id=219705

I think it mostly slipped through the cracks. I did want to work on this some
more as a general feature, but there's no reason to hold back on this small
change, which is clearly useful to projects.

The only concern with these .b4-config flags is the potential for abuse if
they are set to execute commands, but this doesn't fall under that category
and therefore we can easily add it.

Thanks!

-K
