Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12A98286E
	for <tools@linux.kernel.org>; Fri,  9 Feb 2024 19:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707507978; cv=none; b=oGCH54GV6ePnjFQxDKBOWp5hKDfLs3Tl8d7VNQ1XrQfg8Y9X+qrh5rgK23TRf482/45yVvHjpXPOU831EfT1XWMaSJsy9t+PSHBfQL3qVUoz7VtF0U118UgWvYXSzlVbz1UNgZxDIJ+nsXmIB/MmvNUAzDThsHRaF58xW8el/Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707507978; c=relaxed/simple;
	bh=hh98ZtbZP5T40/b4RhXbUgKMUQC7Cz1qZJ7sK132hxs=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uxsSWbdppdg8gGXtOWMYuLRS4eo9VzL4geEGw1NGhTi7kaF0CEmiEQB5I/Uz/P/l2Hx3S6uky/YKN8KBQ10pj6+EH/uO35etKpxnOZJKEHdVtGEuROlQCqsF6ghLTkhO+xpTD/6a0h7QAPjcgd6lxLVxVh1EmX88JOW1YcqBkm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=g9boxDTG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="g9boxDTG"
Received: by smtp.kernel.org (Postfix)
	id 49517C433C7; Fri,  9 Feb 2024 19:46:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AB88C433F1;
	Fri,  9 Feb 2024 19:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1707507978;
	bh=hh98ZtbZP5T40/b4RhXbUgKMUQC7Cz1qZJ7sK132hxs=;
	h=Date:From:To:Subject:From;
	b=g9boxDTGGO1+i+A5OJ8cY9Nr7Wn+D3NFzzpR7ET5mVL+cOGxondsYGyG8aYTIKyc1
	 tEDX02FnBzaoVv7XSFTQxYnSZqFbKkYEHz4fg2asTiu9/C8CKQTx7gWrcrpJ6c386/
	 zZGYr/0xxxQPjMbs7u6W3xbHcXoWpC1DDn79oX7U=
Date: Fri, 9 Feb 2024 14:46:14 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: tools@kernel.org
Subject: NB: -t,--apply-cover-trailers option now the default behaviour
Message-ID: <20240209-cerulean-bear-of-enterprise-f6ef5f@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi, all:

As previously advised, I have made the -t,--apply-cover-trailers option the
default behaviour. This means any trailers sent to the cover letter will be
applied to the entire series, which is what makes most sense to do.

If you're using the -t option with am or shazam in your scripts, it will
continue to work for now, but does nothing.

-K
