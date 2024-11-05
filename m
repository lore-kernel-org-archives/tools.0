Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8111D415B
	for <tools@linux.kernel.org>; Tue,  5 Nov 2024 23:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730849142; cv=none; b=oFRePHQdiki+i5FUCs4oBLCuiQYCL0esmuNQsYFcX+BqySlVr6T6SbKyOvwL6LgYi9Jzk7FwlQf6mCd1ybwaYR151slv07j2nIHrw9fK/Rw2UgxP6rnGcloQxQYPK6MInPQKCosKFCOOT0rntdT8L1HctXPtuNiKut/QBozh8pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730849142; c=relaxed/simple;
	bh=BpP5HNWeDzmDUlgDYK7WB4Y0os7+JT/Mgsck8VFlgpQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Op4+J9Wj1qxYeA9XFXeB9IRwbtOl+93xJ8SBNr51rKZtQ3yR3Z0ctcyXPSeOdZNzaxloxk7yuo6bi5R+sqcmOWrZbee+rdaodkrjSPcW/ipdlsz9FfdTm05kzkKckeVmKIdm2IM+cGVSZ2lpMf/Yu5SLFHZhyIS9J++RCjgfAt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Io/Awh8V; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Io/Awh8V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8190C4CECF;
	Tue,  5 Nov 2024 23:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1730849142;
	bh=BpP5HNWeDzmDUlgDYK7WB4Y0os7+JT/Mgsck8VFlgpQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Io/Awh8VyibjXo7neEphdKRZL3cf9jM2nespHDBW9hb+LWmkxN6CAHWazjOlp3G7i
	 Z3H9VzpZ+lEEQJOG4FUOwzKGVamkonwIuPkEQcwAw1ct0XsNn+CYZfzkm5v6X8bc/K
	 AEv87cPcewjs76PiLBIo/teYsGucBNbw6mTQo+fo=
Date: Tue, 5 Nov 2024 18:25:40 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Ricardo Ribalda <ribalda@google.com>
Cc: tools@linux.kernel.org
Subject: Re: Bug? in b4 shazam when reading from local mailbox
Message-ID: <20241105-winged-nautilus-of-current-dbad43@lemur>
References: <CANiDSCthqbGqv88O-cyPA4rioMuXU6jOZZvkUcaGGw5KH6KOaQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCthqbGqv88O-cyPA4rioMuXU6jOZZvkUcaGGw5KH6KOaQ@mail.gmail.com>

On Tue, Nov 05, 2024 at 11:14:34PM +0100, Ricardo Ribalda wrote:
> Hi Konstantin
> 
> I think our CI bot has found another issue.

It's not really surprising, considering you're putting b4 through more abuse
than anyone else. It's good, though -- we're finding all kinds of bugs that
were lurking beneath the surface.

bugspray tag me
