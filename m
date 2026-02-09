Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1DD2EC09F
	for <tools@linux.kernel.org>; Mon,  9 Feb 2026 20:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770670239; cv=none; b=t8gonoTYVRGQUC4RBMJHhoNoBL8d8LgQEjxsYHKbwjbg9waIYTVy6B4XMY06LhdcHRmYMdyKJTF6e71dlMsP+rlrsK8GhH5twdvj/Mx8bYO8/XyMtSQx9DAAtwEHQRK5wzY/UOo6YwTGCA8kpDyc4pub2OtEZB9quwduDxmvSQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770670239; c=relaxed/simple;
	bh=7dXWLP5tTz9xPX5MUDRFZFmLZHGm8L57rU45+ynqYD4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PT/45ZHk7MA/kBvCDB4TdNjOGokigrlw9bvMSat9970s7gKheSg1JNFKAVKmqZBxFFkDsZ7O/x5I6JJ3/9UiAyXAnyzUCAq7NuqJf44hJ3gz0jjbky8S3EcwkSTz5NYLgkHqgdfCpBU5G/YeXTmEPGemohF0xx3YskOvLYxdTXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=fjgiP4p8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="fjgiP4p8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BAE1C116C6;
	Mon,  9 Feb 2026 20:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770670239;
	bh=7dXWLP5tTz9xPX5MUDRFZFmLZHGm8L57rU45+ynqYD4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fjgiP4p8CmEEiKt6GS5IUvP31tdNPiTjxLEfMJU2fQQipGFELIDOMQpqmFgC0i+ll
	 BnTgKMDSDkuPnhLtuOs5x8pIM10bkELqLYKJJfhWWhszfCsB1J2TKoQO+OWEbrDRsk
	 wQeRgqpC9rNNxuiWEOxm1XVVlq9KhPfoWURzUD3w=
Date: Mon, 9 Feb 2026 15:50:38 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mario Limonciello <superm1@gmail.com>
Cc: users@kernel.org, tools@linux.kernel.org
Subject: Re: Korgalore Office 365 redux
Message-ID: <20260209-grumpy-debonair-macaque-1ff616@lemur>
References: <CA+EcB1MR6VrwpbXc6eTOzvK5dN6R_n4DBQ7ZEvrPP890syKBww@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CA+EcB1MR6VrwpbXc6eTOzvK5dN6R_n4DBQ7ZEvrPP890syKBww@mail.gmail.com>

On Fri, Feb 06, 2026 at 11:41:57AM -0600, Mario Limonciello wrote:
> But then when I go back to korgalore on the terminal I'm left with a
> sad message:
> 
>   File "/home/supermario/.local/share/pipx/venvs/korgalore/lib/python3.14/site-packages/requests/models.py",
> line 1026, in raise_for_status
>     raise HTTPError(http_error_msg, response=self)
> requests.exceptions.HTTPError: 401 Client Error: Unauthorized for url:
> https://login.microsoftonline.com/<tenant>/oauth2/v2.0/token
> 
> Obviously I swapped out the tenant for <tenant> above.
> 
> Any thoughts here what could be wrong?  I'm using KGL in WSL and
> copy/pasting the auth URL into a browser outside WSL.

Man, I don't envy your work environment. :)

My guess from some poking at it would be that maybe their application is
configured as "Web" only instead of "Mobile and Desktop"? Docs say to try the
following:

    - Go to App registrations -> Authentication -> "Advanced settings"
    - Set "Allow public client flows" to Yes
    - Ensure the platform is "Mobile and desktop applications", not "Web"

Also, check that IMAP.AccessAsUser.All permissions are granted, but this would
throw a different error, probably.

Hopefully, just a bit more prodding is required to get it to work!

-- 
KR
