Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A798E12D76D
	for <tools@linux.kernel.org>; Mon,  3 Jun 2024 13:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717421427; cv=none; b=PWYrQRy97Y9lzB2ASM4qVZgsHjtQtX/ZsVb6v0CP4m73pqs8xueM6RaM2te5pEdpgUbNtWXDPZS0oVJ4ptd1Hayqw0ZJFYTWRZ3yJEQOtL1y7F85gonDbYI6PF8rtn5HFbD2LqAo8BD9o/ebwo99kwYfKCpztyA0RqPI4S2Lhcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717421427; c=relaxed/simple;
	bh=QT79UJYYCqKOe5cvnn5DCPRP5iH7inJ4hsn1gI7UykE=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=hrhVuxqLMdoj+S2Gwwpvt1R2jubEGzvcGoSkjBsW/MuvZm6MZ5sCBjfsJW/peNAUcRGnCicutzEfzKTdmajRrAjZj4W7dTU0mns7+c2KPfAngV+de+KVNg8EiR5JepOJYPFdmqRGgPoLmmVvE7DPyhQAXqvzPpkMgIf1JSeQm3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XxrC48wW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XxrC48wW"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 47FEEC32781;
	Mon,  3 Jun 2024 13:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717421426;
	bh=QT79UJYYCqKOe5cvnn5DCPRP5iH7inJ4hsn1gI7UykE=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=XxrC48wWAwJfB5a64D+reo3vX8nYuqFXvIXhWi5l94SN0giHGep24NdnYplTRfQcE
	 D2ZQCg9gkyHWduQsQG4Nh95lLu8vHk0cyrDIC892mu6ZqXTzYjtznszQ6SHDX4liE6
	 M8JRlqc5AkHHPv+BfvPRV4AXZBKzkvUxgEMC5QuWwTPUKrAooFCkpCZHx4M+p2hjLP
	 pR2VPZfzDB7FQob8YEEH/TKKLGJFSbO0qXQOsSoN3GKag19A3hAhyefLWib2hcGpxb
	 Q5c5eSH68zFj8uaQP9l2AlupqYOIZCgu3ycksEqM7Af63QLBpSZX7ZLIzHPIiKZwx7
	 1g9lirkKRz9+w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2F991C32766;
	Mon,  3 Jun 2024 13:30:26 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: "Kernel.org Bugbot" <bugbot@kernel.org>
To: tools@linux.kernel.org, konstantin@linuxfoundation.org, 
 broonie@kernel.org
Message-ID: <20240603-b218933-df8083058a13@bugzilla.kernel.org>
In-Reply-To: <dcbebe7e-5e01-4559-8bf9-37a0749177d2@sirena.org.uk>
References: <dcbebe7e-5e01-4559-8bf9-37a0749177d2@sirena.org.uk>
Subject: Re: Thread breaking behaviour for non-patch messages
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: peebz 0.1
Date: Mon,  3 Jun 2024 13:30:26 +0000 (UTC)

Hello:

This conversation is now tracked by Kernel.org Bugzilla:
https://bugzilla.kernel.org/show_bug.cgi?id=218933

There is no need to do anything else, just keep talking.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)

