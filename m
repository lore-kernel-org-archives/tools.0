Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D401F20013E
	for <tools@linux.kernel.org>; Wed,  7 Aug 2024 13:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723038481; cv=none; b=XgIGDeZ3VvUV+CONshwXgTepnf4YQzhMxSF1kHzdLrRgrNGxNwvaDU3MS8fdokDb8n6rQEfe30s6fG1L37gYJ7lJmVkpkUNvgUh4Q4QUjXn6ABHYHhkMVKhUef4V+wHYIkkCrnFI8BvviGbfDughMTGDhCg1xxUuqJsk7mAQmF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723038481; c=relaxed/simple;
	bh=FirciVTp/gV9Lkzc9o6mP/9AY2+7GvXcDXPTwlewtag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bueyO+yaiHcS4gPWowjHT8hrADuL3NNfPgva+YnmOFbbiuWIk1JgxJmwXRXfy2yb7GML43oiR2Ysuj1/nSWSjoaflQNXJLBtIhak1bAxLqv3in5taIp/weVA+81tBw/Mvff0R5idIrQc4WwUQaHgiIojHy4CE62E11r3BNn8zTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=HDMAn0t9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="HDMAn0t9"
Received: by smtp.kernel.org (Postfix)
	id 6F383C32782; Wed,  7 Aug 2024 13:48:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38F56C4AF0B;
	Wed,  7 Aug 2024 13:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1723038480;
	bh=FirciVTp/gV9Lkzc9o6mP/9AY2+7GvXcDXPTwlewtag=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HDMAn0t9L4JO8ufzWBDKPYVLXp8l5vMCHD9FPMDa8H1mJz9VwCtEm0AK/XFej0Q/7
	 QBp9WFylY6OayQ3TWCKyilkQI9cMuVIf1q56V/+cu/pSnMJFqavwbgxIfpw90NSUJ+
	 CwZzsAdZC63b9XPgZq5L/AsDV0ynJTcrS4X2/DnA=
Date: Wed, 7 Aug 2024 09:47:56 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Jacob Keller <jacob.e.keller@intel.com>
Cc: tools@kernel.org
Subject: Re: b4 send support for email alias file
Message-ID: <20240807-amorphous-vague-markhor-bb1a1d@lemur>
References: <a6a4755d-85a6-4bc8-83f4-db374c4f3a03@intel.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a6a4755d-85a6-4bc8-83f4-db374c4f3a03@intel.com>

On Tue, Aug 06, 2024 at 02:19:57PM GMT, Jacob Keller wrote:
> I have recently been trying to switch to using b4 as my tool for sending
> patch sets. I previously used git send-email. send-email has support for
> an email alias file which allows specifying shorthand nicknames for
> emails and automatically translating those aliases into the full name
> and email address.

Right, this has come up several times in the past -- the TLDR is that it's not
as straightforward as it seems at first:

https://lore.kernel.org/tools/20231212-illustrious-lion-of-psychology-d85d9d@meerkat/

> Would it be possible to have b4 either handle git's email alias file? Or
> perhaps have its own file/config options?

I have a counter-offer -- suggest on the git list that the --dump-aliases
switch should also have a way to provide destinations, not just aliases
themselves. Then we won't need to support 6 different alias file formats and
can just rely on git doing the translation. :)

-K
