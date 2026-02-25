Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108212135C5
	for <tools@linux.kernel.org>; Wed, 25 Feb 2026 04:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771992427; cv=none; b=rMc+kyR2s894uV8EI4OTJHeipADiFDY4yZCQ2pNkh6ZiEKhJNrehgWTzYh88D6W6LHtDLm5VRDohgl1MKSaKZ8JS4gcg/DXAB/XlRo5vKgekOewk4mXhxD7QwwFz2NDdHgA5Z5qyAhYCmyLAzO31hTPXHJPvBtsDHiLinF53JGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771992427; c=relaxed/simple;
	bh=tS/RcTuBpgj/S5sTLM+6UnBMn6e8SRGZDbybh/7d4uI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mHBkOJ/lGm7PZMxrdQrmUGUPGABqBzoe0FFeo73/CjhItkYmKKDZP1yPK8N/gw1mAST4DULUC6vHEyV13npPP2HdI644NR5Ux/Zi9eLe7ZLTxLB0rvqK3CqtfLbJ+QspuJQou1sZZqzu5eJlkHYMm17VefNE+naRb0qiiUrgBkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=OQfd69aL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="OQfd69aL"
Received: by smtp.kernel.org (Postfix)
	id A6AE9C19422; Wed, 25 Feb 2026 04:07:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C6F2C116D0;
	Wed, 25 Feb 2026 04:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1771992426;
	bh=tS/RcTuBpgj/S5sTLM+6UnBMn6e8SRGZDbybh/7d4uI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OQfd69aL/HR+f/DAVwyh90Hmrm93rvG9dmYaAhTm7g72I3Gp3lWm5LTVpBNXPC5ux
	 jxhyuB+7RwfWIZWV46xyLULpAfeGCJBsz8OKGe201ouySQuieLg5NIxp/E9vuqvvWt
	 jirGpc4frR8aeEU3kL2YJbfhXhmfkkpvZ0ZTjnHA=
Date: Tue, 24 Feb 2026 23:07:05 -0500
From: "konstantin@linuxfoundation.org" <konstantin@linuxfoundation.org>
To: "Verma, Vishal L" <vishal.l.verma@intel.com>
Cc: "tools@kernel.org" <tools@kernel.org>
Subject: Re: [PATCH b4] b4: Add option to b4-send to include git-notes
Message-ID: <20260224-curious-shrewd-vole-4ad49c@lemur>
References: <20260224-add-git-notes-v1-1-9b7d3ab24b61@intel.com>
 <20260224-malachite-mule-from-pluto-cfa9c4@lemur>
 <cc3a0991b7031b8285b947d4fad7482fc06a1eb6.camel@intel.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cc3a0991b7031b8285b947d4fad7482fc06a1eb6.camel@intel.com>

On Wed, Feb 25, 2026 at 03:46:56AM +0000, Verma, Vishal L wrote:
> Ah good point - I should've searched for it.
> 
> I see Yazen posted a follow-up[1] using a workaround from the
> discussion filter-repo issue - I can see if you consider this whole
> thing to be a bit clunky, but it would certainly be nice to have. Or is
> there another preferable way to add these 'basement' notes to patches
> while using a b4 prep/send workflow?

Yes, you can literally just amend/interactive rebase a patch and add a section
under ---. :)

-- 
KR
