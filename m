Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9938B1632DF;
	Mon, 28 Apr 2025 21:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745875006; cv=none; b=GaQVYNPpwL66yT7qBGrgoY/RzEg/WqP5lnOAAcr2E3ltkDJhzRtHmefNsmBu3cqBzOuNyQ9xXI3zFGd2USSVzWkUIRd9UrqNZ0+ZG3am1nvy3WZbAXw512RI1BKRJrUYUurFOxYAR/zd/fNLzVgc4x7CbPh94ARm/M3IgiRO9p0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745875006; c=relaxed/simple;
	bh=Ypigc4Q9AT8oKAGkgSEekl5KJjYyIHCnN6Y2O6OqYK8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AeyQEcXu6AJu4AlBfbrM/3EUUPDQ6Oesp4MzOLirQAYYPzdCb0gvUmP+zf/8/Yj+CmtC6j7aG2ykJc4q2Cd5cihaWvjRxoTWfKNyYxnobRUTN01OslUWfy9x0ulFArv6VXc/vpfhktDwrzD3IqWmsOSzplWATvMGdBVrhSJFe20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=dAlnlVKd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="dAlnlVKd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E967EC4CEE4;
	Mon, 28 Apr 2025 21:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1745875006;
	bh=Ypigc4Q9AT8oKAGkgSEekl5KJjYyIHCnN6Y2O6OqYK8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dAlnlVKd1pJZA4dhvn5rorEI+iRH/S4E1vCNBC23qLd2pt1jh3bhu9LEfSB1y/l5S
	 pW1CNRa/iR+erEU/TPyvmxKf1x38sqvK6E6DBjsnu2ZOntfjSTRscNBriMu09togpL
	 +HFv+io8VMUXghkoLm3CWankGyfBYSFDnpvbiUPA=
Date: Mon, 28 Apr 2025 17:16:44 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: users <users@linux.kernel.org>, tools@linux.kernel.org
Subject: Re: b4 adding bogus tags
Message-ID: <20250428-vegan-marvellous-bee-4c572d@lemur>
References: <CAMuHMdXSLeOcPxSg2yCeW4K+2dhmoDvmzP9_GdT1aFP0ZBkUZA@mail.gmail.com>
 <20250428-convivial-jaguarundi-of-revolution-7b2cef@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250428-convivial-jaguarundi-of-revolution-7b2cef@lemur>

On Mon, Apr 28, 2025 at 04:25:51PM -0400, Konstantin Ryabitsev wrote:
> Looks like it's the same bug as this:
> https://lore.kernel.org/tools/20250408-b219993-d3df209dae6d@bugzilla.kernel.org/T/#t
> 
> It's the same scenario -- there are shared patches between these two series,
> but somehow one of the replies on the older series gets misapplied to the
> cover letter instead of just the individual patch.
> 
> Having two series to work with really helps -- I should be able to find where
> things are going haywire now.

Fixed it in the latest commit in master, thank you for the report.

Notably:

- this was only a bug in master, previous versions were immune to it
- this only manifested in very specific situations, when a trailer was sent to
  a follow-up of a follow-up in a series that shared patches with another
  series -- so I expect only a very small handful of people tripped it up

-K
