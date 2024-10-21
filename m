Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6CEE1DFE22
	for <tools@linux.kernel.org>; Mon, 21 Oct 2024 20:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729542036; cv=none; b=h+bdYezJneRkul1ClkM3OBssOpmXxdLZCebi0vOzQe35ANWIKfYBGO32lTQPC8RGDVMeFKIxuK10EcGPRpCMkV8zZMQWoSzrVIhR4iXdv8rrCBQHrrT6uEpFmEwKSHYvG/c5LjZjPUGxl9J+adpm8MovpaQbbuRYvuuikOnHDcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729542036; c=relaxed/simple;
	bh=ay4Uyim3edZPyF8CKF8bCykVtc+x6RXsqpZbfFJzFRo=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=Nj2BeD9rP0k6b5xYK+Ed3tSXgyEhMXPzmk5mrNq/ddJMvl0cf16IEb7IKsMsrZzUNQb8VBy/03Cg+rniJLYc9HhKzS22cvg4TPFXORapyiF62wSbpuwJaZoEG56dbLnhHSjWabxYC9u/BKz6f8Ckbja4bbvTw1AhSN+Mk84nDs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UrhU4fZb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UrhU4fZb"
Received: by smtp.kernel.org (Postfix)
	id D7D1FC4CEE8; Mon, 21 Oct 2024 20:20:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3846C4CEE5;
	Mon, 21 Oct 2024 20:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729542035;
	bh=ay4Uyim3edZPyF8CKF8bCykVtc+x6RXsqpZbfFJzFRo=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=UrhU4fZbP6a4AEeDto9JoU22FrGEUWc/7dyxa7xpyBmWEgueM4WXPMTmV7/yGkKIt
	 iEyxCfZT91KwBdfzDb73hSA6uAmOVfgV/mveB6Bp/RBESCgqvd+78iX0XwYzpXwKBI
	 1xEeTEpBciGXbQKoEUBDQGXA8uDfSEsDfwFmQZ3qf5+bvQxQhzBGYeFxSRzKc5SB0k
	 rh4MN1SGZgYXxIUx+wtlI7vTnBduI3+gkZ+fOgrKLTJcA0kT5q5QghUbE2To16KRF6
	 0zSwzb+ldxstMAE2qGBpV4ctWbPc87I2eGenZJJl73A8JGMtkmCQoO9Zkns+PoBRKI
	 qFLcYQx9P2lvQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB68A3809A8A;
	Mon, 21 Oct 2024 20:20:42 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: Bugspray Bot <bugbot@kernel.org>
To: ziyao@disroot.org, cryolitia@gmail.com, jiaxun.yang@flygoat.com, 
 coelacanthushex@gmail.com, tools@kernel.org
Message-ID: <20241021-b219412-b99f71f863db@bugzilla.kernel.org>
In-Reply-To: <CAANcMPn=CYhCUAOAooGAKXXSYyOpxpj6dEAssUtQ7Zd9PY0BqQ@mail.gmail.com>
References: <CAANcMPn=CYhCUAOAooGAKXXSYyOpxpj6dEAssUtQ7Zd9PY0BqQ@mail.gmail.com>
Subject: Re: Missing `Signed-off-by` line in patch email
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: bugspray 0.1-dev
Date: Mon, 21 Oct 2024 20:20:42 +0000 (UTC)

Hello:

This conversation is now tracked by Kernel.org Bugzilla:
https://bugzilla.kernel.org/show_bug.cgi?id=219412

There is no need to do anything else, just keep talking.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)

