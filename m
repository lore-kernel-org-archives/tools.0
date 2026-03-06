Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E6E61D130E
	for <tools@linux.kernel.org>; Fri,  6 Mar 2026 00:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772755997; cv=none; b=p5oGsYrb9JyYKV+4fPjggzcne+4Y3L1fQLBEQm/cy01sD8Rov0NwCs3evu8dLVaZg4kp6G0Ma2XokHInWwtNcQuVXXM4u8xZuNpnrUVWqvunnC8rIQbXLeloI9re8aV88/bbZsPkCBHxyjWMdD06eoYiKb//F7vOnSS0GNDwn9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772755997; c=relaxed/simple;
	bh=zGy2JZQkS8qep82JQxOYKEjFxH6s2K7vDR/l+GHoG48=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bbdxIgr8Luh1m8cY0G3wsPLnBecZah/J2QoeLj+RZtVyRcxeA71OxwgabvIrXQjZS/pL19Vk7FJe7IK/PVWQ3u899JQBnIQyMNXDDkiaf2IpfptHVCOf7v3XyDL+o7T08j1xIU/ItOWcMxq6SmBfBUj5R5ncfLbbEfEAwXUgQwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hLZYPjeI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hLZYPjeI"
Received: by smtp.kernel.org (Postfix)
	id 2995FC19423; Fri,  6 Mar 2026 00:13:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D44B5C116C6;
	Fri,  6 Mar 2026 00:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772755997;
	bh=zGy2JZQkS8qep82JQxOYKEjFxH6s2K7vDR/l+GHoG48=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hLZYPjeIQqGTVlm4Rw+g7SqF3iR6q14UEeSXL99pYiDAGjhSCwX0IJ2D8xBjN3IfY
	 cd+7Vgr6NTBlr/wFKZMVLWL9/bLCAaSoX3hz9GyHZjfL2XRTn7PGqtyIjz3T5lP6wW
	 6/IvIc4IvM3SE8bZnq8N/2E0GN+PsxiXxffcyuXD3nMPPA5fRtj9u/POEJJznnfIF5
	 P8VJGvOprEs24XXPZFR8L6dPaRnFBSlXgeWRQ3hHH69jtR8spI2rI1mLRrZd/4Jn0B
	 xBkqNeCbOJ1hywf9VzhmJmVAKOZ+2gEuC92sQluOXMwwO83CGu9iZjqYOjpJzMXl2g
	 vgEVnPnMLs+vw==
Date: Thu, 5 Mar 2026 19:13:15 -0500
From: Konstantin Ryabitsev <mricon@kernel.org>
To: git@n0toose.net
Cc: "tools@kernel.org" <tools@kernel.org>
Subject: Re: b4 sanitizes quotation marks out of my name
Message-ID: <20260305-nondescript-arcane-pigeon-8bb23e@lemur>
References: <997706185.418493.1772314169554@app.mailbox.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <997706185.418493.1772314169554@app.mailbox.org>

On Sat, Feb 28, 2026 at 10:29:29PM +0100, git@n0toose.net wrote:
> I was sent here from #kernelnewbies and told that I should share my problem here. I normally sign my commits with the following name: Panagiotis "Ivory" Vasilopoulos (and it's shown like that in the `git log`)
> 
> It looks like this in my .gitconfig:
> 
> ```
> [user]
> 	email = git@n0toose.net
> 	name = Panagiotis \"Ivory\" Vasilopoulos
> ```
> 
> Although the From: header presents this as shown above, the quotation marks are removed from the `Cc:` and trailers like `Signed-off-by:`. This is not a problem when using `Panagiotis 'Ivory' Vasilopoulos`. Is there a workaround or anything that I can do for this?

bugspray tag b4/email

-- 
KR
