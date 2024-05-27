Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD9F116F0C1
	for <tools@linux.kernel.org>; Mon, 27 May 2024 15:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716825479; cv=none; b=MWFC5w7RzeIjRVan/CjjWWu12qxucypjcjpdOGQQErPOhzMX7JSfgFjDaeICdLnTD8CUhShcYmIaN1CuJpZx/VMKJIQudi74ONqOJ2zJvLHoZ5gpWa0HDlXexuNzI/RfDu+0rkJohhMkPJjONVZvzkFWOLYKLm31xuFFQnHgwMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716825479; c=relaxed/simple;
	bh=qtQz1ZXKmjXkdZNkThwVUss2ix3FtB+qtjbI7mMI1js=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GEf0cZqQ0tZfVLvRwqpAlIDw/6Oyz/3a2otDFCIiIRy7l7ynRHcUrarp0yiQVcee8Z+Sia2C1IYhHWS0xc8IWeFsV+uhjGDKV46tT9WU1+IADg2s+bG84YDit1Yq/cg3GbLEjBb+U0UengjuYfagvBKxEGeC+M/lsFyxa8l76R0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=GzbU7tY8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="GzbU7tY8"
Received: by smtp.kernel.org (Postfix)
	id B32CEC32789; Mon, 27 May 2024 15:57:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A8FEC2BBFC;
	Mon, 27 May 2024 15:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1716825478;
	bh=qtQz1ZXKmjXkdZNkThwVUss2ix3FtB+qtjbI7mMI1js=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GzbU7tY8ftv7826VDNnuF/gVj9hW9v95pZuvM7tkd3dqxf5bxwoyRAuK/HO0yocxy
	 7zk+DlTGemx4dL/CpUqlhXPQUuLBdQh3R8zzjOAnz76Hh9/1XmyZCsb5dK8S2VUrjo
	 m8qrKdVGd9q5r1ddHqQWUj7lPbkD+oyYilKTYasA=
Date: Mon, 27 May 2024 11:57:49 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: Quentin Schulz <foss+kernel@0leil.net>, 
	"Kernel.org Tools" <tools@kernel.org>
Subject: Re: [PATCH b4] docs: document b4.send-prefixes conf option
Message-ID: <20240527-outstanding-masterful-prawn-556fca@lemur>
References: <20240524-doc-send-prefixes-v1-1-c6465822ad8c@cherry.de>
 <20240524-great-fanatic-whippet-caec89@lemur>
 <20240524-nebulous-ibex-of-finesse-c2ec8b@meerkat>
 <2e1d55cb-6692-4ea3-86b9-06e2af45f739@cherry.de>
 <20240524-radical-silent-seal-8d1cb5@lemur>
 <90b301be-b631-424b-b985-cf8748b560e2@cherry.de>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <90b301be-b631-424b-b985-cf8748b560e2@cherry.de>

On Mon, May 27, 2024 at 10:20:39AM GMT, Quentin Schulz wrote:
> One can identify the cover letter in a rebase, because it has a "#empty" at
> the end of the line in interactive mode. It's just that the --autosquash
> doesn't handle this properly and takes (I assume) the first commit in
> reverse history (older first) title that matches exactly what's after !fixup
> in the fixup commit, trying to fixup the cover letter instead of the actual
> interesting commit.
> 
> Have we agreed on solution 3) then? What exactly is next? Just to know what
> are the expectations from you and me?

For the moment, my plan is:

1. change b4.send-prefixes to be always additive
2. introduce the --add-prefixes command
3. leave the rest as-is right now

I should be able to get this into 0.14.

-K
