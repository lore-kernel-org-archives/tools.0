Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA472D12F5
	for <tools@linux.kernel.org>; Fri,  6 Feb 2026 10:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770373307; cv=none; b=OB2uxWpmosy0RoK5PIDOBg58V9j4/ViQheIMboqJTZgShoiG3ORnp+mrgen9N6nyt2APtwogNHjGzid0SHJvlqtODCkkKcIqnJxL0DRs2Z9f1YwBgMwL5tDwW5oCScapvvTUFaJZwkiw6UxEF/jwWIxIJQUdniRNX3+Knl2Mm6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770373307; c=relaxed/simple;
	bh=IWLhNbGGRX2hG8gpAzoo17lCyBu0C7QBxF/lqUTowog=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hhkc6OaKsJItKDiV38RJdyYcUjXsESkHt6YTjf15HsJjHuLECzIl6yQSBQMu+hTmQMWjknbbHM4sp/xWzXxlvgclMrysUWyOJDW09+xNFsFjGLgy/ENzLC6CFsJozLXg0por+BLRfK/FxX7AhTb62K12sOBw+zsFk+4d2Z5XsSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=gXUOXO4X; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="gXUOXO4X"
Received: by smtp.kernel.org (Postfix)
	id F17EBC19421; Fri,  6 Feb 2026 10:21:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 741BEC116C6;
	Fri,  6 Feb 2026 10:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770373306;
	bh=IWLhNbGGRX2hG8gpAzoo17lCyBu0C7QBxF/lqUTowog=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=gXUOXO4XcgWxKL9yzQ6GhWN/J44LZrcvk7eo4MU+xoid59Sd+E9mk0k0w0amlXX7d
	 9YjiMC38i9L72kr7KuEcwjIWRlD8p4OOzdi1IKvUWqSOgurK3M+3t+ULq7oZBNU7CL
	 DL6nPPz5H3OV48hT8OgctyHU+NnhcM/Gn57ChYV4=
Date: Fri, 6 Feb 2026 11:21:43 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: tools@kernel.org
Subject: odd b4 "Mail:" trailer added for USB patch
Message-ID: <2026020637-cleft-viscosity-c984@gregkh>
References: <20191024205803.qdn6p32iyj5rqvc6@chatter.i7.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191024205803.qdn6p32iyj5rqvc6@chatter.i7.local>

When running the following command that I normally do to apply patches:
	b4 am -S -t -o - | git am -s
from my email client, for the patch with:
	Message-ID: <20260206-wip-jremmet-hd3ss3220_vbus_split-v4-1-ee5b4e402187@phytec.de>

I get:

Looking up https://lore.kernel.org/all/20260206-wip-jremmet-hd3ss3220_vbus_split-v4-1-ee5b4e402187@phytec.de/
Analyzing 1 messages in the thread
Analyzing 11 code-review messages
Checking attestation on all messages, may take a moment...
---
  ✓ [PATCH v4] usb: typec: hd3ss3220: Check if regulator needs to be switched
 be switched") (✓ DKIM/phytec.de)typec: hd3ss3220: Check if regulator needs to
    + Mail: j.remmet@pyhtec.de (✓ DKIM/phytec.de)
  ---
  ✓ Signed: DKIM/phytec.de
---
Total patches: 1
---
 Link: https://patch.msgid.link/20260206-wip-jremmet-hd3ss3220_vbus_split-v4-1-ee5b4e402187@phytec.de
 Base: applies clean to current tree
Applying: usb: typec: hd3ss3220: Check if regulator needs to be switched


It's that odd "Mail:" header being added, which then shows up in the
commit itself:

    Fixes: 27fbc19e52b9 ("usb: typec: hd3ss3220: Enable VBUS based on role state")
    Signed-off-by: Jan Remmet <j.remmet@phytec.de>
    Reviewed-by: Heikki Krogerus <heikki.krogerus@linu.intel.com>
    Fixes: 7e7025811579 ("usb: typec: hd3ss3220: Check if regulator needs to ^M be switched")
    Mail: j.remmet@pyhtec.de
    Link: https://patch.msgid.link/20260206-wip-jremmet-hd3ss3220_vbus_split-v4-1-ee5b4e402187@phytec.de
    Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Along with the extra "^M" in there (actual character) in the Fixes tag?

I'm using the latest git version of b4:

$ b4 --version
0.15-dev-47773

Any ideas?

thanks,

greg k-h
