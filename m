Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5013126A0
	for <tools@linux.kernel.org>; Sat,  7 Mar 2026 04:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772858986; cv=none; b=Q9wV9I9Z0gZbXF5SIUlaCJ1N5co7Jqj768OPkWKHkbxP0HoA6ab7R5F7TfRTq68hmpDwah/yqi64JVOGuonDPI/U7oNZOYFs5y1j3pKvHsbGot6st8xT6DJKW2Fb4RAzfY9x66uA/8mzqzv+tZ08do6zn5L/JEUl1w2VjG8J9e4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772858986; c=relaxed/simple;
	bh=3qmkvElnX1n63ubkwffCfahVzGd7U8jO3PiGbp2RsBA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hX1W7QTdODua/eYGRXaYBiE7Enp6f4V5Kuw2IE4uqPRjOmb1qT5S8Zhrp2MMd80/6CnxkKJ/EK1HL7cZPSNe4cK26rqJ0AhHkIoRmNhmqWJtsm032S17Nprj80iyFkDuKoOIB9CFPiUpR+w/+V0ZX4gFLoq5VQi/vwnGld54Lnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DnOpglt/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DnOpglt/"
Received: by smtp.kernel.org (Postfix)
	id 81B29C2BC86; Sat,  7 Mar 2026 04:49:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44CB0C19422;
	Sat,  7 Mar 2026 04:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772858985;
	bh=3qmkvElnX1n63ubkwffCfahVzGd7U8jO3PiGbp2RsBA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DnOpglt/ptKX9mGjBlbjiZrVEwLVLJko83wuO9XjWnMLzPX0hrvIoF2m9xUcIBB1r
	 jw4VRStzjjTkBt9zMkOjSPsBHD7iqfEjsjep0Lm1kEqyzHZ2LPXxF3FCQWzUA9su6w
	 sygtpuDH9W6Kn9mf44nBs+R51DExEIbSr54Ms3blVRXMNBzzLNmS5N8plDU11ElJDt
	 C0R3+hMiEdWqTyOrxYYjV0BQXZO6qIamzKl+uuLqYxyoegebuGf1lNpo51iWwmpzxc
	 Zs7NdeUQHvAbfxqNO2697HH5gKPSHspGzVA/+dPBA1cGgIPjSqcWqNDeizfJ4OhcVa
	 PnrniTrbgz0nw==
Date: Fri, 6 Mar 2026 23:49:41 -0500
From: Konstantin Ryabitsev <mricon@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: tools@kernel.org
Subject: Re: [PATCH] b4: Implement --bcc and send-series-bcc config option
Message-ID: <20260306-amaranth-wrasse-of-support-b6f8fe@lemur>
References: <20260307012748.1414702-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260307012748.1414702-1-dmitry.torokhov@gmail.com>

On Fri, Mar 06, 2026 at 05:27:45PM -0800, Dmitry Torokhov wrote:
> Allow using blind carbon copy when sending entire series (no per-patch
> Bcc).
> 
> Handling is similar to "To" and "Cc" handling except that it ignores
> "not-me-too" and other exclusion lists as the intent to send to the
> address(es) specified in bcc is explicit.

I think this can be done a lot simpler, tbh. We don't need to bother adding
Bcc: headers just to strip them right away -- we can just handle this directly
in the send_mail() method in __init__.py. Before we hand off the delivery to
the command or smtp agent, we insert the bcc address(es) directly into the
list of destaddrs and don't bother with the cosmetic headers. This way
everything gets this functionality -- not just sending via "b4 send", but also
sending via "b4 review".

That said, I can't take this yet, because without the server-side change in
the web endpoint, this won't do the right thing. Let me sit on this for a
bit until I'm done with the server upgrades, and then I'll revisit this.

Thanks!

-- 
KR
