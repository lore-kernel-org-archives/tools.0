Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E14D93D3318
	for <tools@linux.kernel.org>; Tue,  9 Jun 2026 22:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781042513; cv=none; b=VVMOrG+EP9zj4lAR0dz5c69Kx3Fm+hpCIuFXYSwNGqVSaS0ozJ3Z7600SAfmtr9SjAlLz1SjoGhlbgmwwTJH7U5r/gNdpYo4AEd0HgmSD7GlknSvh7sxarmImpYCjyTKlbn6BzdRjMSZS38xjJ4aq6T5xe44dCdIpSVcAnSh0PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781042513; c=relaxed/simple;
	bh=HlTMREkg8ioHo2KH8M7qV7uATTiprRWV/sTU3DnPbk0=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=a0/LMpBRYIqGmQXU94yUfBLUImLZdQZCDhZd1XSJI7U4FfXp1vmx5/BOYNvMecz659EbIm4FS8Lfe7MfJ7XwRS7JdFKwEJc1VBHFlGUIFZ+FzDsnBkCx3KXL9Z8Y+JV4WXxmZjmTxYkUrvkCCHrTTzcl0MqacvNn2OD338kwbEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=0OtvztRN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="0OtvztRN"
Received: by smtp.kernel.org (Postfix)
	id 975B31F00898; Tue,  9 Jun 2026 22:01:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F32F1F00893;
	Tue,  9 Jun 2026 22:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1781042512;
	bh=bbLTd0yL4CnydH4/ZuGEag5Nn9BW5V+67va/46loTgk=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=0OtvztRNR5I7tAAY8+7HVswd+wm6gQ6nvODcuCQMcFyiE5YMI64XnaBcsD1bMJKYE
	 KXqbEIhc4/BcjFMyJUvIzNbUFc36227LrUjxwQtQJ+zW5uidefxnHPWYaZEh/3LwOz
	 Tldlo0aGQDELweCrrIzswR440xQTyOs3YcHp4t8g=
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: b4 review workflow issue with partially accepted serieses
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, tools@kernel.org
In-Reply-To: <afk5QvNAQDxFCbvT@sirena.co.uk>
References: <afk5QvNAQDxFCbvT@sirena.co.uk>
Date: Tue, 09 Jun 2026 22:01:44 +0000
Message-Id: <178104250404.112711.2880594121343252200.b4-reply@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2387;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=HlTMREkg8ioHo2KH8M7qV7uATTiprRWV/sTU3DnPbk0=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLI0ev2nGbW0tznUf2iT7Dk/i/dxyeYAWbZtm8xuSt/zL
 f+43XduRykLgxgXg6yYIkvZvthNQYUPPeTSe0xh5rAygQxh4OIUgImc6mL4H/Pe94T44pVPO+7s
 X7jm8vWpNYdWdjzU+/HPMXrBu8WfT1YyMnw80lBezCUgoP216J1yqSjrhhxrhZtJZhzpjaxCp4q
 5mAA=
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E

On Tue, 05 May 2026 09:26:42 +0900, Mark Brown wrote:
> Hi Konstantin,
> 
> b4 review tracks the state of a series at the top level.  This gets
> confused if you partially accept a series (eg, taking fixes at the start
> of a bigger series that needs more work) then the state gets confused.
> The bits that are accepted trigger the applied->thanks->archive flow
> but that means that new versions of the series can't be ingested even
> after the series is archived.  This is a pretty severe workflow problem,
> there should be a way of splitting serieses and/or retrieving them from
> the thanked/archived states to reviewing.

Okay, I tried to figure out a good way to approach this. Splitting
series was taking me down to a very bad rabbit hole, so instead I added
a special "partial" state that will hopefully do what you're looking for
-- but please provide feedback if it's not.

Basically:

When you take a series using cherry-pick and only select a subset of its
patches, b4 now checks coverage across all patches and sets the status
to "partial" (shown as ◐ in the listing) instead of "accepted". The
review branch stays alive and in-tree exactly as it was, and the series
remains in the active working set — so when a v2 arrives, b4 picks it up
and the update_revision action lights up just as it would for a series
you're still reviewing.

You can then review it again to take more patches or do anything else
with a series that is being reviewed. If you take a subset of patches
again, the series will go back to the "partial" state. If you take them
all, it will go to "accepted".

From the action menu a "partial" series offers everything a "reviewing"
series does: take remaining patches, rebase, range-diff, upgrade to a
newer revision, snooze, mark as waiting, abandon, archive, thank, etc.

I also added a smaller bonus fix while I was in there: a "thanked"
series can now be reopened back to "reviewing" via the action menu
("Return to reviewing"), in case something was thanked prematurely. The
review branch is still in-tree for a thanked series so no reconstruction
is needed.

This is *lightly* tested and hopefully won't blow up too many times.
Modeling complex series workflows is a challenge, but hopefully any
explosions will be contained.

Thanks!
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

