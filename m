Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E0472EBBA4;
	Fri,  6 Mar 2026 21:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772831673; cv=none; b=C4twPJyxV/XV2WEiJ9hIxEnfwr5i7MhHiKeT4F02Ytsha2Vwt41APNrg5EjtCzr1Tev220Eozb1aVFAxDkhjv1RG1pW3pGt7AZRFxIiz1OE7oSAOZ8+ckdk0nDs8u2dmBTQK1Lt+2/LV9De3wKbquZDQfQ1aqBvRdLxYYkT3BKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772831673; c=relaxed/simple;
	bh=C7Sc07xoGJzbBQGHBPK/RLJBqM5MuNWedglIV0zqSqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uKgWI7MC4f1w/L7FEqj05qHwFn2PIiiQ/LQ5ffrF01CwVXmkHCpiURFhVPIaBlrYXJ9bIUuDb0CCmTqXid4phR0wojoxXvofTaYGJFfv23X3f2D0EV6STqAE0olQYkJo0tawDG2733XC7gvLNnAhUZTQGF0AdBxHFjghzPCpPNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=j/G1mumd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="j/G1mumd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A70DC4CEF7;
	Fri,  6 Mar 2026 21:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1772831671;
	bh=C7Sc07xoGJzbBQGHBPK/RLJBqM5MuNWedglIV0zqSqI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j/G1mumdOlrAufCuMNjzN2aVn6jervU8O43D4bVKt+KekEheiOJzvF003DrJdyMCG
	 Ro6g/1/NPwbylN6tNOv9jlVqrNEWNvYdkBRxecXcewpDB9/M0bvWQZ4cRoZ8SP57P9
	 ol2PGxD5SmjnHFuoblwqn62nzSV7qiKVAl5Mpetw=
Date: Fri, 6 Mar 2026 16:14:28 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
Cc: tools@linux.kernel.org, users@linux.kernel.org
Subject: Re: b4 feature request: run command before rewriting history
Message-ID: <20260306-mighty-raspberry-zebra-f3ab4b@lemur>
References: <87ttdkrylx.fsf@toke.dk>
 <87ttctc2vk.fsf@toke.dk>
 <20241030-perfect-hot-chipmunk-ffae87@lemur>
 <87ikt8bm6h.fsf@toke.dk>
 <87bjv7p435.fsf@toke.dk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87bjv7p435.fsf@toke.dk>

On Wed, Feb 12, 2025 at 04:36:46PM +0100, Toke Høiland-Jørgensen wrote:
> Toke Høiland-Jørgensen <toke@redhat.com> writes:
> 
> > Konstantin Ryabitsev <konstantin@linuxfoundation.org> writes:
> >
> >> On Wed, Oct 30, 2024 at 11:16:15AM +0100, Toke Høiland-Jørgensen wrote:
> >>> > Do you think this would be feasible to implement?
> >>> 
> >>> Hi Konstantin
> >>> 
> >>> Friendly ping on the above? :)
> >>
> >> Yeah, I hope to be able to look into this in the near future. Unfortunately,
> >> I've been dealing with less-than-pleasant tasks such as ddos attacks and
> >> trolls over the past couple of weeks, but at least it's finally on the wane as
> >> people move on.
> >
> > Right, no worries, just wanted to make sure this didn't get lost
> > entirely. Thanks for looking at it! :)
> 
> Hi Konstantin
> 
> Another friendly ping on this? :)

Only a year later, finally adding this to the tracker. I'm sure you've given
up, but this has been sitting in my inbox for a while, shaming me.

bugspray tag b4/prep

-- 
KR
