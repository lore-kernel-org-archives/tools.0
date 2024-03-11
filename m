Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C3A03D970
	for <tools@linux.kernel.org>; Mon, 11 Mar 2024 13:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710165024; cv=none; b=fG0U7j9FH5zIPQglZ8meQ0v/JInCT/kCqOhc8EqcSejsV4HyW2HPjZxtIcYktv0kda9ZBXqDzWgEqr3e/YfO0YEub9D2crX61UkKJXsa0k+vDaTn61ZPEloRWpFVrvxEMiM+FyV+5h65PIfMVWA+gWzkOfR/7ACqJNQfyVEvdm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710165024; c=relaxed/simple;
	bh=OJlr/hL9oMb0t/r6NDQgwJH/mkTo1qMzhzZwik9bi9Q=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=RydM+REA1D5E3+/Y1p1ernKspFaO4LNgPi/FT33XK1b6apEK65YRxUxE/McE50jMEHLrcZXPe5FZjAejM1bWDQ6wNVEOIdBjvKYvePg7ZBFj+NywUUU40g3V55RA9sEUC/mMlnCeMoqARUacw9IsUWVbtHSPizS/13Rs6UkhlgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MKx2lNDm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MKx2lNDm"
Received: by smtp.kernel.org (Postfix)
	id CDCF6C43390; Mon, 11 Mar 2024 13:50:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B0033C433F1;
	Mon, 11 Mar 2024 13:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710165023;
	bh=OJlr/hL9oMb0t/r6NDQgwJH/mkTo1qMzhzZwik9bi9Q=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=MKx2lNDmhd18bdARlhai9kXoVKhug02t54P0wYfOr4mn1VFONTzFWKk2o1ic2YJZb
	 0ApeoVqEkJJ1eDBlUFQyBUN9SPD1uau2eqn5ciSjB1vLp6t7sqhfCtF8m6cubo+EM1
	 5hpjhTQGo1C2hU0QQQR9SVraO2LCOBW95Fr//dCKV1eRrPPD/zv11/yf2vH1f151h/
	 D86Ki1/eoAuWSpI25+Vr1/IrW/Vwnap7to5Ana3ZKj00lU16CyuTjG15x6sZL0BPve
	 wnlm85M4qKGtgS+NsiPuOFP73JxX/f53XaEvAycpfHuB8Fwy4Ih++tLhp4qKHi7nMm
	 MoSClnB0mqmqg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8ECD2D95055;
	Mon, 11 Mar 2024 13:50:23 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: "Kernel.org Bugbot" <bugbot@kernel.org>
To: tools@kernel.org, tools@linux.kernel.org, luca@z3ntu.xyz
Message-ID: <20240311-b218588-b633411003c4@bugzilla.kernel.org>
In-Reply-To: <12393372.O9o76ZdvQC@g550jk>
References: <12393372.O9o76ZdvQC@g550jk>
Subject: Re: b4 custom git diff options (like -B)
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: peebz 0.1
Date: Mon, 11 Mar 2024 13:50:23 +0000 (UTC)

Hello:

This conversation is now tracked by Kernel.org Bugzilla:
https://bugzilla.kernel.org/show_bug.cgi?id=218588

There is no need to do anything else, just keep talking.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)

