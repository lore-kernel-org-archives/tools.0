Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B3A22F74A
	for <tools@linux.kernel.org>; Fri, 16 Jan 2026 13:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768571446; cv=none; b=ddx/56mK6ockX1AH6M472x8sU9MQ714A2+t+OLYE4UoHETEei1NcXsO7M4XrIh7t4sT3Oczl1v7n5bN1wjKE5Yodc2oToa77b0oMwrPqs5oH4MBxS5FNTc5eMrUKT5p5mFdIu2OAPaQFTgdAogTsbhRSWtULhPkGKieYHLhZXcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768571446; c=relaxed/simple;
	bh=ApUMpuxGaJ7ZiTmJyddb2CzcWuTTWdUdWGZKkH8jeKc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kVB9Iqr3Ich3jXFSfQqWe2m6d+SX4WVyIeugRYlBiT58gCCTqcp2VXrKJPKETNBehiV5tlPEXOfaW7LTS/QoiwoGUuPdVH6Mtlffpmur9JLkMWo7P9i5WIwh6FhnFNBgEQ5DVVx4HXddBopvXMGLd7jJACL5K8tcN7WDf255M48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=E2eiXrCG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="E2eiXrCG"
Received: by smtp.kernel.org (Postfix)
	id 36444C16AAE; Fri, 16 Jan 2026 13:50:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02D5AC116C6;
	Fri, 16 Jan 2026 13:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768571446;
	bh=ApUMpuxGaJ7ZiTmJyddb2CzcWuTTWdUdWGZKkH8jeKc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E2eiXrCGE4BjCygandqulYCZxRa/lOL0i9hSG7+4sar2+DsRwDV7qB2n4sySteyYe
	 C+JgOGVTDhLat6Dx88ZIyqS/crLoniYiE560ct/xzgEZH32TPzRlZRv6wNcfsS6zbj
	 +w+fmXiqaDjMqIfNonCEQTO7cwfVc3hBadSEebcI=
Date: Fri, 16 Jan 2026 08:50:42 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: tools@kernel.org, users@kernel.org
Subject: Re: korgalore: small taskbar app ui
Message-ID: <20260116-enormous-screeching-marmoset-a4baef@lemur>
References: <20260113-valiant-dragon-of-dignity-d98cea@lemur>
 <CAMj1kXHnX9vSPOPtV0XSz9YQZi9ou_FmBfFAoc4zwFzDd09d8Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMj1kXHnX9vSPOPtV0XSz9YQZi9ou_FmBfFAoc4zwFzDd09d8Q@mail.gmail.com>

On Fri, Jan 16, 2026 at 09:53:15AM +0100, Ard Biesheuvel wrote:
> > The goal is not to make this an entirely GUI app -- initial setup is still
> > done in the terminal. However, the idea is that once you have `kgl pull`
> > running smoothly, you can then move the regular sync runs into the taskbar
> > app and receive notifications in your desktop environment when something goes
> > wrong.
> >
> > Please try it out.
> >
> 
> Another awesome feature, thanks a lot for this!
> 
> Some notes from a user:
> 
> - AppIndicator3 is called AyatanaAppIndicator3 on my (debian testing
> based) system
> - when using pipx to install korgalore, the optional GUI dependencies
> need to be installed in the virtual environment too, e.g., I needed to
> so something like

Thanks for the feedback! I know very little about writing gui apps, so I
expect there will be tons of special cases required for all the gnome versions
out there.

From what I read, the recommendation is not to install gtk/gnome dependencies
into the pipx environment, because they are likely to conflict with the system
libraries and cause more problems that way. I'll double-check if this is still
correct today.

Thanks!
-K
