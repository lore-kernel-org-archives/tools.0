Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B767534E74F
	for <tools@linux.kernel.org>; Tue, 13 Jan 2026 16:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768323062; cv=none; b=LkMSMFrCZwsXauWwJ+nnAeGX1cRAtlsnAi8Ll5mqomZN6dH8Zqil9s/5QnzKSHGi4Th6QtPpaRidl+gxSMKAG+EkjP8d1D5PlmJhEuXaGop5fMoh3xtDkmEMwK//TUvnY2cX3YdjML7bNcuXtupMBaoSVxOtBqC+HeUWnyKVpkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768323062; c=relaxed/simple;
	bh=0NOuCIQlyai94jHZSqeIx93iectU8Gt6b2SYEHSOMEg=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=unHUIv2WWhThP6mUc3DGpjwvf7CMr0S0TTrsz+IHIfLTNxP1xL8wYfSwypmWn4cMjJlgKecW2MFrGThZmkTiQPwwUZp1cqUtxTNbM1b4biiORb+IRu4lBJn8JZIJXunpzD03Ew7LprTwuh76s3aNNIXYlcR55b4FoH8B9/TPObs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=qbuPEf5p; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="qbuPEf5p"
Received: by smtp.kernel.org (Postfix)
	id 9D728C19425; Tue, 13 Jan 2026 16:51:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69AA1C116C6;
	Tue, 13 Jan 2026 16:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768323062;
	bh=0NOuCIQlyai94jHZSqeIx93iectU8Gt6b2SYEHSOMEg=;
	h=Date:From:To:Subject:From;
	b=qbuPEf5pcFEjOoRhMUS40YwJ4xDhhcDTntBtyFbeFseXKfCWoJ8X1Va4j68Hrckmm
	 68ajEuwSsjK2VLNWeS99CeXdYg5lpRroS+Jy73ReluwMOqPri7m4SrVw7UhRMAIDSK
	 5LHfE0t86NXJEWNCRhQCfacq++tcoahERSDBWY9g=
Date: Tue, 13 Jan 2026 11:50:58 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: tools@kernel.org, users@kernel.org
Subject: korgalore: small taskbar app ui
Message-ID: <20260113-valiant-dragon-of-dignity-d98cea@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi:

With the help of opus[*], I added a small taskbar miniapp to run background
korgalore syncs. It needs a lot of testing, so if you're a korgalore user,
please try it out. It should, in theory, work in most desktop environments but
I only tested it under gnome.

Here's what it can do:

  - System tray indicator with status icons (idle/syncing/error)
  - Automatic background sync at configurable intervals (default: 5 minutes)
  - Manual "Sync Now" option from the menu
  - Gmail re-authentication via browser when tokens expire (no terminal needed)
  - Edit configuration file directly from the menu with automatic TOML validation

It's not yet released, so you'll need to get korgalore master and run from
checkout.

You can run the taskbar app from terminal as `kgl gui`, or you can install the
.desktop file in ~/.local/share/applications/ and run it straight from the app
menu.

The goal is not to make this an entirely GUI app -- initial setup is still
done in the terminal. However, the idea is that once you have `kgl pull`
running smoothly, you can then move the regular sync runs into the taskbar
app and receive notifications in your desktop environment when something goes
wrong.

Please try it out.

-K

[*] yes, I know, but this feature would have never existed without opus,
    because I can't be arsed to write GUIs most of the time.
