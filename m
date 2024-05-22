Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77FDF6AD7
	for <tools@linux.kernel.org>; Wed, 22 May 2024 16:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716395425; cv=none; b=G1uRsEOeFEL032LlXEI0abMhac8pdIUDQegVi6q8FWSoJjIX0toDO+Vnii576AItnChI6vw8KYqx9D+ilp4Ydmzn7Fo1Yvi2hMzYR1YloJ9g4uQymmlAjgTBnlKcQ62HKHm0/86n8qVa04VSm6CUtbfxAi5ug44ESrQaJuXcaN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716395425; c=relaxed/simple;
	bh=kxefEOI07ck/WMRfSlKioDhUo/OIEFMUPfD9Qa82JwA=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=IywXCY7ky8JmRlcpJ+cbLfDXahCl0XtmLrFWA6TpoqmY43o/RtVoUjctYmkfEiFX8TLxCMQEkKE2FxhL6Lv2dxg440bjrc6VcVbQjAHMDF+oobfZztxYHvLgdiTvwPWeN8yWio4kZddMgdMwQm+CeAgqNfatI94kw+EXKt55YnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gFkTiUmt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gFkTiUmt"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4A322C2BBFC;
	Wed, 22 May 2024 16:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716395425;
	bh=kxefEOI07ck/WMRfSlKioDhUo/OIEFMUPfD9Qa82JwA=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=gFkTiUmtruXSOsuWhpBuQpkHSHeyZaw2JCMAL/xiWqSO0XjeqUYQv0cg47HdUIukM
	 NXCjDw7Nhy1b3a0xq944FuJrRwHKUm66h9iQKcaHODFrbWO6V4ERS6oCMZm5UldxKs
	 0AAYhGzCPbpziTH9jUCZE0W09RH/+za3ocEHdXT7L4GkREVsyclDkUUOCX7PlTOjAW
	 Ug2I9I4iYP4fW17JRix+cf/yG2KU0Jg9igtjfCRrHPxUuvQuJrUIoVy543Zk62f6z7
	 lcVRstBcVMrl00pv4Y2PSJOPvNrA8b1Qr+dhex2HfLWiskqsQLC2BAXmVx0Hh58onI
	 N4qqmp3IQtmEg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 30F4CC43619;
	Wed, 22 May 2024 16:30:25 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: "Kernel.org Bugbot" <bugbot@kernel.org>
To: tools@linux.kernel.org, tools@kernel.org, torvalds@linuxfoundation.org, 
 konstantin@linuxfoundation.org
Message-ID: <20240522-b218874-d82b79cd04b4@bugzilla.kernel.org>
In-Reply-To: <CAHk-=wjt8e26xgW190=Ws2hrgDsDN6BhCie2do6uQqrcAzF6JA@mail.gmail.com>
References: <CAHk-=wjt8e26xgW190=Ws2hrgDsDN6BhCie2do6uQqrcAzF6JA@mail.gmail.com>
Subject: Re: b4 patch selection logic
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: peebz 0.1
Date: Wed, 22 May 2024 16:30:25 +0000 (UTC)

Hello:

This conversation is now tracked by Kernel.org Bugzilla:
https://bugzilla.kernel.org/show_bug.cgi?id=218874

There is no need to do anything else, just keep talking.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)

