Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B500187562
	for <tools@linux.kernel.org>; Thu, 30 May 2024 15:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717083030; cv=none; b=KvRLZDLae9xFsvLmEQZrfbnBlYBTazqJV/KJW9sBjV0W0By6lZy28SI97qE3eaiA9/Yg9K1oQd6gDEYIUZbRjViJohNIvGTc4jAdBS72RP/ZjX3z2YgS0ymwCzvjdvF0C/wcCTDIJOXYTZ4q1luGGkOEydw39zoBL+JY8+TrNdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717083030; c=relaxed/simple;
	bh=TE1G68WV8mf0wIcOozaDa3zf49S4KFNBrMBPdiA4YB4=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=SfySZwb7MGRs3zEniqyW6+gHWXRvbeOp1KXNv6K8dJzJTfr8vHOgWuw/RFvhagHQufsUDSa4uh+U3J2fC7cAGEj+pdohBqzsrWEWAWKPuwPr/wB9Phmgkx07CGQ1bI4YimedJ0SOw2q2Wd+lZtmLQRGIuMeVS4aLEe3z9GPLulQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n6Orpz8b; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n6Orpz8b"
Received: by smtp.kernel.org (Postfix) with ESMTPS id CE6F0C4AF0A;
	Thu, 30 May 2024 15:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717083029;
	bh=TE1G68WV8mf0wIcOozaDa3zf49S4KFNBrMBPdiA4YB4=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=n6Orpz8baEr0CVG7JyJtSsq1OjaqJ6LQ8cZ1PkPmZviMHFhQws3nNtQbdSWoJYMAp
	 NN8srmXn14CjImHt72FNedh7ARyXT/m9IveV6yp4KCOKQx0cqm8abxpz+QwRnQzkFg
	 BJD9cdawec6RwCuLA3Go2D5V9yPX8V0VjdRbItJea7R1JzamFoaSqwprngyKZcLrM/
	 K9WQ49ujlmRh6hO5a8j1Ly3GLHJ457kwD1GLqbAjJ/nH1swG43FAGpTghnQ7WO962x
	 qguk1Vw+qeaUOrQ7SoczHc7RsCjSczvFwnRvOgiNMNIcjO2VdDRKJ/AMidHZyv1bBb
	 jhsc/ESN8nT+Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id BD747CF21F2;
	Thu, 30 May 2024 15:30:29 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: "Kernel.org Bugbot" <bugbot@kernel.org>
To: konstantin@linuxfoundation.org, tools@linux.kernel.org, 
 matttbe@kernel.org, mkorpershoek@baylibre.com
Message-ID: <20240530-b218877c4-9a9db78e15e3@bugzilla.kernel.org>
In-Reply-To: <87sey8yksi.fsf@baylibre.com>
References: <87sey8yksi.fsf@baylibre.com>
Subject: Re: b4 prep-perpatch-check-cmd conf via .b4-config
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: peebz 0.1
Date: Thu, 30 May 2024 15:30:29 +0000 (UTC)

Konstantin Ryabitsev writes in commit f00a9d14a57e953c6c7e9f0b9c41a0742cf44f7b:

Allow prep-perpatch-check-cmd to be set in .b4-config

Upon further reflection, allow to set prep-perpatch-check-cmd, but not
am-perpatch-check-cmd. This allows projects to define what local checks
they would like contributors to run, but makes it more difficult to
abuse this in a way that would cause the maintainer to run a malicious
command.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=218877
Signed-off-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>

(via https://git.kernel.org/pub/scm/utils/b4/b4.git/commit/?id=f00a9d14a57e)
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)

