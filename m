Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7AC6C2E3
	for <tools@linux.kernel.org>; Tue,  1 Oct 2024 13:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727789177; cv=none; b=XP5viMhRK5smYvChNfP42eeMpbqe2yK3yoVbR9P5eT8Y4Hv9FpniAu8PtaJvVQcHFBBfyakr0koQjlEh1HUGQGR8Bw/5KDdNvTJBdSHST7V0APurPxxFytDPzqNIyipkMOd3uuK6VPUOcRYcNjuGC4/+ZhKu0MA/H8pWj8V3V7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727789177; c=relaxed/simple;
	bh=MgusM4RYsFRdrt0s31zuvz4JXR4CcVxc5ztsAPE1+Fs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VLWrG+rk1MeMjtrJ+YmjdoIX9jgDQFyXb8SYfgqJq3eL8xnt84kKmbC7QMdWTzKa4YMlUMUavCWiyqM8HdTkKGEMwdXLA2LB56dcoiUzaVKBynxz0mvnRzpK7a/C5slr9DupMqkyuZL6nmhSAk5qHxKnQOu/415QhFveyyuGyIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=R37E5Pyn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="R37E5Pyn"
Received: by smtp.kernel.org (Postfix)
	id 61EE6C4CECE; Tue,  1 Oct 2024 13:26:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AFB5C4CEC6;
	Tue,  1 Oct 2024 13:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1727789177;
	bh=MgusM4RYsFRdrt0s31zuvz4JXR4CcVxc5ztsAPE1+Fs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R37E5Pynm/m8Fbxe5013oDsTiMaIH7ZoMDGM8ILDAkdASqwpXpPyjQX2+ZSnuaBK1
	 +mkzQbRa3G0XORcYS9NCvevXt6dnUvtH5FfovLpahMILiw3nbPCmxNkXBAmWhijKoU
	 dpGdB2wXsK0Jxxkt1G3NRKD+TP0iB3RK5Z4SYd9c=
Date: Tue, 1 Oct 2024 09:26:16 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Daniel Gomez <da.gomez@samsung.com>, 
	I915-ci-infra@lists.freedesktop.org, intel-xe@lists.freedesktop.org, tools@kernel.org, 
	d+samsung@kruces.com
Subject: Re: Incorrect response address when using B4
Message-ID: <20241001-stalwart-mackerel-of-atheism-5eeef2@lemur>
References: <CGME20240930133009eucas1p14b11ee712ae3ab1ca3aafc2833103bcb@eucas1p1.samsung.com>
 <20240930133007.u4vm5qj5urikpmvc@AALNPWDAGOMEZ1.aal.scsc.local>
 <20240930-sapphire-swift-of-reverence-168e2b@lemur>
 <20240930141839.3rjfom4c2tca655n@AALNPWDAGOMEZ1.aal.scsc.local>
 <20240930-rustling-auburn-jaguar-23d200@lemur>
 <20240930143309.pwl7dzv537b2q3wk@AALNPWDAGOMEZ1.aal.scsc.local>
 <87h69xw68b.fsf@intel.com>
 <20240930211519.tquvjw7davr7zlfz@AALNPWDAGOMEZ1.aal.scsc.local>
 <875xqcw7ob.fsf@intel.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <875xqcw7ob.fsf@intel.com>

On Tue, Oct 01, 2024 at 11:26:12AM GMT, Jani Nikula wrote:
> - In all cases, the "From:" field SHOULD NOT contain any mailbox that
>   does not belong to the author(s) of the message. [1]

Well, the author of the message is not the original sender, but the relay
service -- so this is still true.

> I assume b4 is not using your address in From: because it's very likely
> to get the email classified as spam due to From: spoofing. Worse, it
> might get kernel.org on spam sender lists.

It's not just spam classification -- this is literally the only way to make
DMARC work. We can only send messages from domains we control, so to relay
patches coming from origins that we don't control we necessarily rewrite the
From: address (and put it into the body of the message, as git expects).

-K
