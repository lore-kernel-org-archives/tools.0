Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEBD914012
	for <tools@linux.kernel.org>; Tue,  5 Mar 2024 21:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709674217; cv=none; b=sGX1yj8pgUPoxccUKrSZhltg/ilIfYusoEvc1D4XtAtHnaYcda/iLfNJ8sA7rdPMCRYsXfoxG8z6O9ncjpDVVaTA7vewW9dD5V86d+0RkhxKZilqppIjbCO8mpBExioPHvRUAswW5U3TjAE2TiB5LvraRuc35ScRZf0WfVhqzrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709674217; c=relaxed/simple;
	bh=XCkt00BJWWwUCf9nQgdX0GGOlEJYiqSrmRCqgpI3pt4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K7n66dqCRAps78jlEMo8s3wk2UI96lKKNFYT+hSpv2b14oLoTibmf8kzaLvR6pI6J7VNUcJHrkzEjvsO7b5XsLzk/Dd48q/SAX2C6xgeFNhDcazz6b6ir8iGuQ2nzkMytBJGVRuazsgU2Rvwbeh+w9VF1okiKLCHHI07s05tHG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=i/CqTHAJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="i/CqTHAJ"
Received: by smtp.kernel.org (Postfix)
	id 4FD1DC43390; Tue,  5 Mar 2024 21:30:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17CC3C433C7;
	Tue,  5 Mar 2024 21:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1709674217;
	bh=XCkt00BJWWwUCf9nQgdX0GGOlEJYiqSrmRCqgpI3pt4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i/CqTHAJZagoEdz0SyndVJWcdR+kuUFZJLG72gk9LFG3FaV1+tv4yaU9F/Z1kAHjV
	 51NkDSgXcWVHPXJGBTuZS7owv6jYP5MrW2qX8BrNOobayjCutfFcs+dtPteC5is/yD
	 xLo+Uh6fcuXazi0GJskJbnGPvfAjpPvZ+ElL07G4=
Date: Tue, 5 Mar 2024 16:30:14 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: tools@kernel.org
Subject: Re: b4 failure to apply patch with ANSI escape sequences
Message-ID: <20240305-excellent-loutish-coucal-9309bf@lemur>
References: <0137232a-5380-4869-9a9f-8a8db3506782@citrix.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0137232a-5380-4869-9a9f-8a8db3506782@citrix.com>

On Sat, Feb 24, 2024 at 04:05:13AM +0000, Andrew Cooper wrote:
> Hello,
> 
> I'm using b4 0.12.4 from checkout, and am trying to apply
> https://lore.kernel.org/xen-devel/20240220140733.40980-1-anthony.perard@citrix.com/T/#u
> 
> The git am fails, and to my surprise --show-current-patch=diff gave me
> hunk 3 back with txt_{info,err}= having a coloured closing quote on an
> otherwise uncoloured diff.
> 
> patch complains of the mbx being corrupt, and it looks like something
> interpreted the string into a real ESC before handing it to `git am`.

You're right, this is no good.

bugbot assign to me

-K
