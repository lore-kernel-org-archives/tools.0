Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB9678289
	for <tools@linux.kernel.org>; Tue, 21 May 2024 15:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716306135; cv=none; b=kPNtX7PcQEkZjlzlu7X36do8lY6DTmAfKzgwWcJY2aHvcAJJV9j0Y3+P30fc99ld+xVMscknjyH1bDmxnK5KoajGrJRFEAyVQ0qeLfl+mqKenieuOsxtgPnK4ADg63nrXPxEmFsp5ryrwpEY6wep8+J1M+5l7YO+8WizZJcu/IU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716306135; c=relaxed/simple;
	bh=Nw3LkCgL420cuR8nDuWEw8VlPccjudy9D9SEgw6Md5M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PT2zY3Li1mYCk5wDLaal6Q5VcG+p7DxwoZpdB6NnK6KUloE98TGRhosgdqil+10567PVo7Cgi6lEmUP3q/tbGCLluaqB27o5Wl7iRCtVDrgSHz2eaROg2lJEjZNiPArNZozKe/uGw1ZCNyD9Qia7okyzRvl3elbUSMaYz979BaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=V7h9FYsC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="V7h9FYsC"
Received: by smtp.kernel.org (Postfix)
	id A14EAC32786; Tue, 21 May 2024 15:42:15 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BE619C2BD11
	for <tools@kernel.org>; Tue, 21 May 2024 15:42:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BE619C2BD11
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9BBE7C0004;
	Tue, 21 May 2024 15:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1716306131;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cndWgbTfhKdWX67z/lM3XdAVDP81VIHG7F/4eewOA8M=;
	b=V7h9FYsCyfE5H3ePgyLBY8NtyWWvVTcmTDLLlyseBKpWBhaAW0dF1383tQpQkz6v+Iten/
	OFsTx4Hgd8tgz+rlSKslB5HuIzXFzxnaILtGaZ7t6og7Y0cfHVKYkieTjDglcBXaLaxe0V
	Vrpd0DUB9VoFWa7Y002b7fX7eZZCmeI+6UmAjgFuKmkc90frwE+9Op1E2hi+dpNzgzFJ4Q
	YSMdwOI5AbdNQyfrsI6Ib+3J5o78aqyKAhGIN+WyTM67AwYo+FYgbJpeiJ6VO2FI7lUv0k
	yLXF3R1SMrQcZ0gYSuCtF5MZAo13bjdln5PwCxlwY9eBKYohN7iYPA5W/fom3A==
Date: Tue, 21 May 2024 17:42:10 +0200
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "Kernel.org Tools" <tools@kernel.org>
Subject: Re: [PATCH b4 2/2] ez: Fix check-deps when strategy is commit
Message-ID: <ZkzA0rnt8wgc7YB6@localhost.localdomain>
References: <20240521-fix-check-deps-v1-0-d149bf40e7ee@bootlin.com>
 <20240521-fix-check-deps-v1-2-d149bf40e7ee@bootlin.com>
 <20240521-amusing-ant-of-correction-7b6ca7@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240521-amusing-ant-of-correction-7b6ca7@lemur>
X-GND-Sasl: louis.chauvet@bootlin.com

Le 21/05/24 - 11:20, Konstantin Ryabitsev a écrit :
> On Tue, May 21, 2024 at 04:41:38PM GMT, Louis Chauvet wrote:
> > When using the commit strategy for the cover letter, the first commit is
> > empty. This commit can't be applied properly with git am, so just skip it.
> 
> This shouldn't be required, because get_prep_branch_as_patches will 
> already omit the cover letter commit:
> 
> ez.py: 1408:
> 
>     strategy = get_cover_strategy()
>     ignore_commits = None
>     if strategy in {'commit', 'tip-commit'}:
>         cover_commit = find_cover_commit()
>         if cover_commit:
>             ignore_commits = {cover_commit}
> 
> Something else must be going on, maybe?
> 
> -K

Without my patch I have this log:

Checking message-id: <20240516-yuv-v8-0-cf8d6f86430e@bootlin.com>
Breaking thread to remove parents of 20240516-yuv-v8-0-cf8d6f86430e@bootlin.com
Checking message-id: <20240516-b4-new-color-formats-v1-0-74cf9fe07317@bootlin.com>
Breaking thread to remove parents of 20240516-b4-new-color-formats-v1-0-74cf9fe07317@bootlin.com
Checking message-id: <20240516-writeback_line_by_line-v1-0-7b2e3bf9f1c9@bootlin.com>
Breaking thread to remove parents of 20240516-writeback_line_by_line-v1-0-7b2e3bf9f1c9@bootlin.com
Checking base-commit: drm-misc/drm-misc-next
Testing if all patches can be applied to drm-misc/drm-misc-next
  [PATCH v8 1/17] drm/vkms: Code formatting
  [PATCH v8 2/17] drm/vkms: Use drm_frame directly
  [PATCH v8 3/17] drm/vkms: write/update the documentation for pixel conversion and pixel write functions
[...]
  [PATCH 2/3] drm/vkms: Add a macro for write_line functions
  [PATCH 3/3] drm/vkms: Add support for XRGB2101010
  [PATCH 0/3] drm/vkms: Miscelanious clarifications ---- this is the current series
  [PATCH 1/3] drm/vkms: Formatting and typo fix
  [PATCH 2/3] drm/vkms: Rename index to possible_crtc
  [PATCH 3/3] drm/vkms: Add documentation
Magic: Preparing a sparse worktree
Unable to cleanly apply series, see failure log below
---
Application de  drm/vkms: Code formatting
Application de  drm/vkms: Use drm_frame directly
Application de  drm/vkms: write/update the documentation for pixel conversion and pixel write functions
[...]
Application de  drm/vkms: Add support for XRGB2101010
Application de  drm/vkms: Miscelanious clarifications
l'application de la rustine a échoué à 0026 drm/vkms: Miscelanious clarifications
Quand vous avez résolu ce problème, lancez "git am --continue".
Si vous préférez plutôt sauter ce patch, lancez "git am --skip".
Pour restaurer la branche originale et arrêter de patcher, lancez "git am --abort".
erreur : Pas de rustine valide sur l'entrée (permis avec "--allow-empty")
astuce: Utilisez 'git am --show-current-patch=diff' pour visualiser le patch en échec
---
Not fetching into FETCH_HEAD
---
● message-id: <20240516-yuv-v8-0-cf8d6f86430e@bootlin.com>
● message-id: <20240516-b4-new-color-formats-v1-0-74cf9fe07317@bootlin.com>
● message-id: <20240516-writeback_line_by_line-v1-0-7b2e3bf9f1c9@bootlin.com>
● base-commit: drm-misc/drm-misc-next
   - Could not cleanly apply patches


If I understood correctly the code, the cover is removed at line 1408, but 
re-added at 1545 if the series contains multiple patches:

    if len(patches) == 1:
        mixin_cover(cbody, patches)
    else:
        add_cover(csubject, msgid_tpt, patches, cbody, seriests, thread=thread)



-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
