Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4794419259F;
	Mon, 28 Apr 2025 20:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745871953; cv=none; b=HqDLjXaPiXBbZilQAnMpdRdnrquJjxjqT24vYf1dZPOtgjt1yy8GrXAyQ4seQNMY171F7p0UCRtcgz8IpyNWQYbBOD7xCPMv5OInJgzpgoISo6s9rjQbcCjLs8HiR1aVL/M7uG+ou6W7WU3oVwriNpTkdYeuaFnTkHLIZkdCLwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745871953; c=relaxed/simple;
	bh=ARhmnErVOPPlzpGjNlL62mG23hD8I+G96AyZ4xhds6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g2ag9nsTPFV3EWQg0lRA2kBoB2aCPaKMQYJEZIWWJXtyH8L2dB22GjRmitRlpVfTABd+xJGSV2Dbx4WrabgqOvXgliySL5HSu7YQo3NHxEQlP/4NRL24djk4lz/smjQKy9m9Lz0dLT96exwmdpbviKQDzyrM7IjJPep2jU9JhW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=S4yzERWE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="S4yzERWE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91DFAC4CEE4;
	Mon, 28 Apr 2025 20:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1745871952;
	bh=ARhmnErVOPPlzpGjNlL62mG23hD8I+G96AyZ4xhds6U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S4yzERWEAbArt+VOEMqLhkPD9zra2LtRXqNvEB+rk6q6QoHLCi6VAUx0DsDlMQu7j
	 K4atxXfW4zKXnrwY6NZ0YWSwM9EvBdKGH57+kQKTZorjVsdJTnsr+Iq2CT3dwKUy5I
	 QeQthaMFYF8V0r8F9Z2XUkNd+CM77BNG/3O0t2Rw=
Date: Mon, 28 Apr 2025 16:25:51 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: users <users@linux.kernel.org>, tools@linux.kernel.org
Subject: Re: b4 adding bogus tags
Message-ID: <20250428-convivial-jaguarundi-of-revolution-7b2cef@lemur>
References: <CAMuHMdXSLeOcPxSg2yCeW4K+2dhmoDvmzP9_GdT1aFP0ZBkUZA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdXSLeOcPxSg2yCeW4K+2dhmoDvmzP9_GdT1aFP0ZBkUZA@mail.gmail.com>

On Thu, Apr 24, 2025 at 11:28:54AM +0200, Geert Uytterhoeven wrote:
> Hi Konstantin,
> 
> B4 sometimes adds tags that were never given ([2/7], [3/7], and [4/7] below),
> or were already present in the posted patch ([6/7] below):

Looks like it's the same bug as this:
https://lore.kernel.org/tools/20250408-b219993-d3df209dae6d@bugzilla.kernel.org/T/#t

It's the same scenario -- there are shared patches between these two series,
but somehow one of the replies on the older series gets misapplied to the
cover letter instead of just the individual patch.

Having two series to work with really helps -- I should be able to find where
things are going haywire now.

-K
