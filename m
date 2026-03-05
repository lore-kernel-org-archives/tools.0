Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64131A0BF3
	for <tools@linux.kernel.org>; Thu,  5 Mar 2026 06:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772691436; cv=none; b=UGAz5XNuUm1EAA3su3eGsUza5xBTgpMcYZ1BZJUZwqF81Psf7wx58ljt0ueC5mxH985x3RJbxpl3TASlCXOJDAcWkX5DSOdAfdEsYnpNhcWvUWtiMIc7/Org6sgQgKCjETnUr1Oz3H7rNdC4ufQj4JpH/nu05TxLcmDbCdpE3wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772691436; c=relaxed/simple;
	bh=LbM2tVbcw2CveNOrkjrJOQH8LnKlM2YAq15cPNDAyh8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qEFWUvVI9NZQceFkz81J+GBQ0qPnT/qLFNg1oYV/hWK7J9h8GnB0hJlnYtJmfnebM//d1C9kafB+1JgsUL7NZiNMIOHf0Un2GbejdIMSEGuhBVAJ66hGGRkkg2Rpe7szWqhos3pWV+wvr7r3lvMjtyr1IXHY4SBVC2h9mrcnpR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fkXU+XOn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fkXU+XOn"
Received: by smtp.kernel.org (Postfix)
	id 6A11BC19425; Thu,  5 Mar 2026 06:17:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37782C116C6;
	Thu,  5 Mar 2026 06:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772691436;
	bh=LbM2tVbcw2CveNOrkjrJOQH8LnKlM2YAq15cPNDAyh8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fkXU+XOnKJz8KAB7yXLRzBkpyXk8V8nfhgsZCWNxK4FUNMwqv1dNu3Ho1p0dhtXAc
	 clrnJmP+YcrbkK8Vx17IEMJufXNvdo5nzfUz3fTUUC7M8VNSCv3QOcZeRq7uWJIemI
	 twa7Yu2YXKUvClAogpyP7uMxpmAJtj41RyV/dTJs7SdSfkvaeNtNdidmG8ijnWjX42
	 3V9NmwOv9KWZ8lgB7TikOE6SW1x4SBbBMbeKmmakakdGfe7zroolRsfzvCUfFg6IOC
	 +cionIJlDRFqSx7g1BTGFgRUwEMeDf84KAnadLZpjB+MeICzfqYe8rYNrXCySGNd8D
	 mEfvrtyeh849A==
Date: Thu, 5 Mar 2026 01:17:13 -0500
From: Konstantin Ryabitsev <mricon@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: users@kernel.org, tools@kernel.org
Subject: Re: b4 review available in master
Message-ID: <20260305-friendly-calm-warthog-e7d5a6@lemur>
References: <20260228-pasty-clerical-b87a92aead3c@spud>
 <20260228-ruby-hawk-of-valor-41f0b0@lemur>
 <20260228-aqueduct-nuzzle-c03be63e03af@spud>
 <20260228-arcane-mamba-of-refinement-6dba82@lemur>
 <20260228-poodle-of-wonderful-justice-acfab2@lemur>
 <20260228-gulf-mountain-5f935fdefaea@spud>
 <20260228-charter-keenness-1256807e458d@spud>
 <20260303-tactful-zippy-oxpecker-fbcadd@lemur>
 <20260304-deviancy-overlaid-e7947f09089c@spud>
 <20260304-keen-clever-cockatoo-a8dab6@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260304-keen-clever-cockatoo-a8dab6@lemur>

On Wed, Mar 04, 2026 at 05:40:17PM -0500, Konstantin Ryabitsev wrote:
> > Secondly, if I'm working from a patchwork, it'd be really great if I
> > could reply to patches directly from the patchwork pane. 90% of patches
> > I review (or more) I do not need to apply, so working in mutt is
> > significantly faster than having to track, then open in a different
> > pane. Related to that, being able to display the patchwork pane
> > per-patch as an option would be a wishlist item to make this replace
> > mutt for me.
> 
> OK, noted, I'll think about how we can make this easier -- like a pre-review
> state in both tracking app and patchwork app that lets you view the patches
> and follow-ups and reply, but not do a more in-depth review where you have to
> apply the series locally.

OK, the latest master completely revamps the "view" screen -- it's more like a
mutt experience. You can see the thread with all follow-ups and reply from
within that modal.

It's not quite complete -- we're not setting a "Replied" flag or inject your
reply into the thread until it comes back from the lore, but it's something to
poke at already. Let me know if this is more like what you were looking for.

-K
