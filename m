Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F121F38B9BC
	for <tools@linux.kernel.org>; Tue, 13 Jan 2026 17:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768326135; cv=none; b=KLxAaC8z8yjocBiSpSNj3fzqf5EN2Wwszpg3K+SACfVX4zBwzNHvgRGPFBCYrg1xQ24SUeRcUVUMe6lYPdXNLrlLdK4tBk+Z7Ge8SZW9yb8arK0SdT1Tc7/RAi1JItwlmOAW7uAv5gHxAmKUKwPmh4hAv689iet/C/P3JDvq3ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768326135; c=relaxed/simple;
	bh=sUDcS+yvHaHqB9UPJtfR0RCxV3YIZQsXZ58g3bmvdTg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h1FyLSVVu8ELzPw9jOK6kzj5XS5aZsND3z/eqRIkDhV3QCoz0GmsqcUtj2uHP7SwOH83Fz0iXtkvWi1P6puELV1CnicmV4S1aTDHEO2TTvLiMaSfsSW8LjSJItM8VruclBu385Dd5oTD+49/jWyLDkiambaJEScKY3IteqbPzaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=W6PeZrqt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="W6PeZrqt"
Received: by smtp.kernel.org (Postfix)
	id BEFDCC19423; Tue, 13 Jan 2026 17:42:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85A34C116C6;
	Tue, 13 Jan 2026 17:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768326134;
	bh=sUDcS+yvHaHqB9UPJtfR0RCxV3YIZQsXZ58g3bmvdTg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W6PeZrqt/WMY8RyIHA5UxscSYDVoPBFm8kowIliQMhGyki0NXgdRZnU1/6GH1Fj0O
	 cBm6bx9kr5zbw6tqkh7vgBdDrgTXXxFmYJLo4m26kewQr972zrOvCB0mWGMtUJIdmn
	 2MhcKMClRr332C5Q9oMAFpVWHvytygVEbCzUEyj8=
Date: Tue, 13 Jan 2026 12:42:13 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Bugspray Bot <bugbot@kernel.org>
Cc: tools@kernel.org, users@kernel.org, bugs@lists.linux.dev
Subject: Re: korgalore: small taskbar app ui
Message-ID: <20260113-thoughtful-mackerel-from-shambhala-b4d9db@lemur>
References: <20260113-valiant-dragon-of-dignity-d98cea@lemur>
 <20260113-b220974-0422b80f5be2@bugzilla.kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260113-b220974-0422b80f5be2@bugzilla.kernel.org>

On Tue, Jan 13, 2026 at 04:50:19PM +0000, Bugspray Bot wrote:
> Hello:
> 
> This conversation is now tracked by Kernel.org Bugzilla:
> https://bugzilla.kernel.org/show_bug.cgi?id=220974

(Clearly, bugspray bot is on the fritz. I turned it off for the moment until I
figure out what's going on with it -- I'm having a small bot rebellion on my
hands in the past few days.)

-K
