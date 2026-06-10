Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47BB918A92F
	for <tools@linux.kernel.org>; Wed, 10 Jun 2026 02:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781058097; cv=none; b=mOILqYKbrCVKx9whgLLNxnORRgCjyBg5iOZfWsTnGobmKHApzHECa2939K4O3WVAPncRUSSAHZU+rncB8oH+qts7HWYKZ4ZQM95ixLCJj+9iBVd+9r2RkwRa83NAOzVQ7PpmJ5o7JB6db+wJ1QeGdocQ9wOn2kXkSoBoPnP5vs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781058097; c=relaxed/simple;
	bh=AjXTuYxNR6ms0K8njW6RaXl1sscG6ePDnp4MKhbh7R8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bS4u73R97Z6HO/20ccxFJV9tq/Bjr2gEFbPuxzvc6gAkV8vAneCY92MsGVJ7NHE+1t73Py7Doc7KIheDrqxeKPLQsBCydqjcOn4N4L/SzSTvsqzPDrnuW3G3GfqF2U2J3TxAK5P9dnJE9ieGChIxhh6AirBTYn6zuxbzKvQTm2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=hx8gG+WO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="hx8gG+WO"
Received: by smtp.kernel.org (Postfix)
	id F17971F00898; Wed, 10 Jun 2026 02:21:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA1F51F00893;
	Wed, 10 Jun 2026 02:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1781058095;
	bh=fWCCCLktqjo0MMvsShHTHQT93h78S2GdCZw0NzGFNcY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hx8gG+WOV8pieJpbSkQF5GA0KTys6sWcLW55lmXSPvrIGsOOiNkiZ6wc8G1wYRnod
	 +pusuqKYq8hE7ZHKtCVJMcHXgI6hbevbtF6Q60iCCX98yL52KoAYa8Ou5GeG1S9diN
	 E0Cvp+kTJfxPxnHa9tRxNqnntgPbxqrbFj5BNjQM=
Date: Tue, 9 Jun 2026 22:21:34 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Sven Eckelmann <sven@narfation.org>
Cc: "Kernel.org Tools" <tools@kernel.org>, 
	Matthieu Baerts <matttbe@kernel.org>
Subject: Re: [PATCH b4] review: Fix sashiko patchset URL format
Message-ID: <20260609-valiant-oryx-of-typhoon-2a6c4d@meerkat>
References: <20260429-sashiko-patchset-url-v1-1-de8027029bca@narfation.org>
 <3cd8a333-1724-45c0-b288-b82480781471@kernel.org>
 <3409149.aeNJFYEL58@ripper>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3409149.aeNJFYEL58@ripper>

On Wed, Apr 29, 2026 at 01:24:53PM +0200, Sven Eckelmann wrote:
> > https://lore.kernel.org/tools/20260428-sashiko-patchset-api-v1-2-24d4ac34b4ae@kernel.org/T/#u
> 
> Yes, your patch series looks better than my single patch.

That's the one I took.

Much thanks to both of you!

-K
