Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE04730E83F
	for <tools@linux.kernel.org>; Fri, 16 Jan 2026 08:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768553606; cv=none; b=rCOThdaHpW6Ix+zM5aAARHcXBxWwhlZuH5/HGcPxqA1fyXsSbrRM+5jtW+24sn3FuSLgTat3cxzspi1zKT7lI3HTUlC0ZRS1K84YEfizASYJhoyUbO2hvAn673gTHqb86NJ1jneaOygOnhWk0dlPKz6+OnGR/QZPZBwdDVIUrqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768553606; c=relaxed/simple;
	bh=tF6vpquZ8PugAPA7Vkl+dGzRfns2Cbo4zWa4Teg35cM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qar81I4a/i4C6PITCRpOSYVaCOowUm7+XzS50+r3H7obVO7piUCkcVsFGw6z/d4X+YI/d+kvdDAl2wPjFfc2lj9hVVIguSv0avBFz1uVp06v+/vqtfCah5z9MvA08roj7u7Rv4UlH/1SQe89PRxzMOCFaXeOKwGsh1sJRrSwdBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LzNhmaPq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LzNhmaPq"
Received: by smtp.kernel.org (Postfix)
	id 780D8C2BC87; Fri, 16 Jan 2026 08:53:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62CEEC19421
	for <tools@kernel.org>; Fri, 16 Jan 2026 08:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768553606;
	bh=tF6vpquZ8PugAPA7Vkl+dGzRfns2Cbo4zWa4Teg35cM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LzNhmaPqq/YlvdukcehxM7T06+4S9ujVAsnLsRXvsRXkK+Z7D5pJJOSRg8u0FrUJ+
	 MFTTLp3rbRChRzz5gynZvEaKjDvDoiOrPXiN4daL4wpn36HGKq5Rp20aX5tY77qOkE
	 8ZeHNuOXSp5K1d7os7kVGzuY0W4YWh+IksXUHeUclS3FK6qsGUs6XhpC/pq54tHhjB
	 RcGtRY+nTZ0EgB+sfq7xP7ZWU9yNSaGCktajk8uKOpo9gEcQBHDwElAexO7vRpyhhD
	 ZwDYUIwvH4OlDa3SFyjqeba4TDZ9KarYJc8Xm665hUKN9UvWGsUtcx6rKqfg5309tl
	 cO+eZYCX4oDmQ==
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-34f0bc64a27so803117a91.1
        for <tools@kernel.org>; Fri, 16 Jan 2026 00:53:26 -0800 (PST)
X-Gm-Message-State: AOJu0YxvItDk7gTaJ0lDqngzwLuAtAf21JCTfhb07uIMNQWisrraOxLk
	edVuACVhEQfai069/eEGJosz7ZbuS6ttJGWz6OsGtysJoBwKgg2rujnDjRo5M/HFUpvYrl89QiJ
	HuB1xxH9UIdfdZfRfGBmZ6JS1QphSubY=
X-Received: by 2002:a17:90b:3c8d:b0:32e:5d87:8abc with SMTP id
 98e67ed59e1d1-3527327e0admr1788194a91.36.1768553606013; Fri, 16 Jan 2026
 00:53:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20260113-valiant-dragon-of-dignity-d98cea@lemur>
In-Reply-To: <20260113-valiant-dragon-of-dignity-d98cea@lemur>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 16 Jan 2026 09:53:15 +0100
X-Gmail-Original-Message-ID: <CAMj1kXHnX9vSPOPtV0XSz9YQZi9ou_FmBfFAoc4zwFzDd09d8Q@mail.gmail.com>
X-Gm-Features: AZwV_Qj8cEELB0W9bcoElaNjBmLhX1PbP4t1LQHxg9FjkmNoMffxMIHvc81OWrM
Message-ID: <CAMj1kXHnX9vSPOPtV0XSz9YQZi9ou_FmBfFAoc4zwFzDd09d8Q@mail.gmail.com>
Subject: Re: korgalore: small taskbar app ui
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org, users@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 13 Jan 2026 at 17:51, Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> Hi:
>
> With the help of opus[*], I added a small taskbar miniapp to run background
> korgalore syncs. It needs a lot of testing, so if you're a korgalore user,
> please try it out. It should, in theory, work in most desktop environments but
> I only tested it under gnome.
>
> Here's what it can do:
>
>   - System tray indicator with status icons (idle/syncing/error)
>   - Automatic background sync at configurable intervals (default: 5 minutes)
>   - Manual "Sync Now" option from the menu
>   - Gmail re-authentication via browser when tokens expire (no terminal needed)
>   - Edit configuration file directly from the menu with automatic TOML validation
>
> It's not yet released, so you'll need to get korgalore master and run from
> checkout.
>
> You can run the taskbar app from terminal as `kgl gui`, or you can install the
> .desktop file in ~/.local/share/applications/ and run it straight from the app
> menu.
>
> The goal is not to make this an entirely GUI app -- initial setup is still
> done in the terminal. However, the idea is that once you have `kgl pull`
> running smoothly, you can then move the regular sync runs into the taskbar
> app and receive notifications in your desktop environment when something goes
> wrong.
>
> Please try it out.
>

Another awesome feature, thanks a lot for this!

Some notes from a user:

- AppIndicator3 is called AyatanaAppIndicator3 on my (debian testing
based) system
- when using pipx to install korgalore, the optional GUI dependencies
need to be installed in the virtual environment too, e.g., I needed to
so something like

~/.local/share/pipx/venvs/korgalore/bin/python3 -m pip install PyGObject

to get the introspection working, even though python3-gi was already
available system-wide.
