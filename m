Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF438615E
	for <tools@linux.kernel.org>; Tue,  2 Apr 2024 14:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712067920; cv=none; b=UUq+LjFWXnHTeuyKaVb3PIrHLa25BRBaisbgQrOY/++MAKeHoTSlAs9aKNSqdtDUC2TWe2NF8MpEGBE0aGtqV5RQVd1Wm+obBGHY727YJFB1eMYSLoJaNT201SGcdcV6V6yAi/iTTXPHNZlArgw/eB6PtgOmiuQi2f1LVc6DBko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712067920; c=relaxed/simple;
	bh=XDNI8WiFyBvNv3ct3aAAW0hu3YWzqdetvTb1IdXho5Y=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=knwqgDa8mLB0o+tkJh94KVPSEpB1px9cFDAGk9YK7iz4/Ybtrmb9s1LCyRsyWJtAJOcRSxmNQgrK2XYQV6LmaTW7LuMv1Gqd8AxbxCTXlDNOYGGGQxQSOFtHmgz9Ir4OgIQZHcdH3mTJBOTd+6prSL+Tyefz/LbdOjThU3D1/7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VneVqEvk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VneVqEvk"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6CF9DC433F1;
	Tue,  2 Apr 2024 14:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712067920;
	bh=XDNI8WiFyBvNv3ct3aAAW0hu3YWzqdetvTb1IdXho5Y=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=VneVqEvkziR8Vl3M4d9R6Hd/ZLJ33TG2I9D0CF1x+dBPVQCU80I2OapVAQKPUQzq7
	 Cb/5OJvXCxURIN471lVphO/MKO1QUO2jSAqi1WnDf/mvq9oRtVPmI3Ri7GAYkd/sU/
	 De4E/4Pfgf9tjY62dmOa4zbFc0Jw611yTTeUHzaCJEdM/k8M6MeuIG7DwZmdnW2pcc
	 oW+8vxIKIj7k9jje20VMUS4hOukue7szC9HiWe3O/XS1pIC6L1hCA6W1VobO0fmPdh
	 29mrfMeip4BrAqj+63cb4BuxHb+vNJeZRg4brQW4Kv9qIkE5Pzj2sKfjF+FycPWrVy
	 Mo+QOcCthHhGg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 59F85D9A14F;
	Tue,  2 Apr 2024 14:25:20 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: "Kernel.org Bugbot" <bugbot@kernel.org>
To: j.neuschaefer@gmx.net, tools@linux.kernel.org, tools@kernel.org
Message-ID: <20240402-b218673-d9c08f424ce8@bugzilla.kernel.org>
In-Reply-To: <Zgq-lE2PqA7pdgid@probook>
References: <Zgq-lE2PqA7pdgid@probook>
Subject: Re: "b4 send" does not respect sendemail.smtpserveroption
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: peebz 0.1
Date: Tue,  2 Apr 2024 14:25:20 +0000 (UTC)

Hello:

This conversation is now tracked by Kernel.org Bugzilla:
https://bugzilla.kernel.org/show_bug.cgi?id=218673

There is no need to do anything else, just keep talking.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)

