Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF667E0E4
	for <tools@linux.kernel.org>; Fri,  6 Mar 2026 15:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772811703; cv=none; b=JTfcshuKvgihH11AbfW22WeMTQinoF++UVrvmg+evls+zIf3C0XeV7dYmpEflIRyWwoo+w1vvbQoFtswsg3ai/IOfbOTxYz0TnUTRIRLOZpruETiDjk1LhCf8zb1ulrH70aEegjA6J5UPrqZnZDVWg7NohjtOfnnus4xSGtmBJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772811703; c=relaxed/simple;
	bh=R4XE4ffUrMH26qtf3D6TCJWo8gZzScc6meowypQHX2s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c7B1NY+FxIWrI2oY/Gx5tPDAhveLWLjckyu3WgVeAd3mJ4zBpzABmBZG5xBp+Azsm/GBWxHYAoMJc6CvLI9bgGzIVo/7XM86dmMQmFDDievZwXSqHhQCP0ou0PYaRNw63xhnwMdhLS/GTPDD/0hkiuqtaM90vjExw3r+BBT1ou0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=aQi0tiI7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="aQi0tiI7"
Received: by smtp.kernel.org (Postfix)
	id AB440C2BC86; Fri,  6 Mar 2026 15:41:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4408EC4CEF7;
	Fri,  6 Mar 2026 15:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1772811702;
	bh=R4XE4ffUrMH26qtf3D6TCJWo8gZzScc6meowypQHX2s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aQi0tiI7y6G3FM1EZkIDp9dHbd+kwsHR45cFw9OzlYe+eaIev39sQ15Djmp6TyLTi
	 EVpqxGtadl/O3yLZ9qgIO/GEMvxXYMyp8yqdbU3HuJ0m+JHvvX9JAEpS8WfCqb6cDt
	 B8JejW+2xDrIRt2zFPYMZPOS27miPwiFztF10B54=
Date: Fri, 6 Mar 2026 10:41:38 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Christian Brauner <brauner@kernel.org>
Cc: "Kernel.org Tools" <tools@kernel.org>, 
	Christian Brauner <christian@amutable.com>, "Claude Opus 4.6" <noreply@anthropic.com>
Subject: Re: [PATCH b4] send: add --in-reply-to option for threading cover
 letters
Message-ID: <20260306-grumpy-jade-bulldog-a6f004@lemur>
References: <20260306-b4-send-in-reply-to-v1-1-730b9b47d25f@kernel.org>
 <20260306-cherubic-electric-bullmastiff-bcb0da@lemur>
 <20260306-seepferdchen-ziffer-c69d1d90fc16@brauner>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260306-seepferdchen-ziffer-c69d1d90fc16@brauner>

On Fri, Mar 06, 2026 at 04:26:52PM +0100, Christian Brauner wrote:
> > > Add a --in-reply-to flag to b4 send that sets the In-Reply-To and
> > > References headers on the cover letter (or single patch). This allows
> > > sending a new series version as a reply to the previous version or to
> > > an existing discussion thread, which is a common workflow on mailing
> > > lists that b4 did not directly support until now.
> > 
> > Isn't this already implemented with send-same-thread?
> > https://b4.docs.kernel.org/en/latest/config.html#term-b4.send-same-thread
> 
> I don't think so. At leat not for what I want to use this for.
> Here's an example where I used b4 send --in-reply-to already:
> 
> https://lore.kernel.org/all/20260306-work-kernel-exit-v1-1-8f871f6281cb@kernel.org
> 
> I wanted the bugfix to be a reply to the original bug and I didn't see a
> good way of doing this.

I see the desire to do this, but this is also the kind of pattern that causes
all sorts of grief:

- you have to pass --no-parent if you want to retrieve your patch

- you can no longer retrieve the parent series at all. Try it yourself:
  b4 am 20260120-work-pidfs-rhashtable-v2-1-d593c4d0f576@kernel.org
  You will only be able to retrieve your patch now, not the original patch.

I don't see a way to reconcile what you're trying to do and keeping automation
working reliably, do you?

-- 
KR
