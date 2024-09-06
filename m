Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2691B85DB
	for <tools@linux.kernel.org>; Fri,  6 Sep 2024 22:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725660319; cv=none; b=nF9jMUekfY7xNcUmO1p5M1bA4S/D/AnsH3y4kEPaIccgiIXk0hZboCAV34ap9D2yqDGn3fpyehHmusq4R5KXWTBLQtKUSmDkwU0IcgitE+MtCYGRhfaP5lseE3W2x78cbD1+RWfJUIs14byHC4ITdBlmd6FrPAdNH6nNqs3JM6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725660319; c=relaxed/simple;
	bh=Wa1xJxf1QkeCeJo7qLCd/WrBEi0vtPmVjOumn/b199c=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=K07nFVxZmiyTNmfcnFoE+g0Zq5YaljsTLhJ6JsCAF/V99KtNxdZ4lQwp0rtK5sHfOIRYSAgwfNZocDTlhJscEEaIXThf2bLPFUp/rbqK4bNV23s9gq3anNhu7df65BdmkKUxooQZEdGm7yGO8x92Ov4W8duI8eQzU2sIe7jiqUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sRQ+MGW2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sRQ+MGW2"
Received: by smtp.kernel.org (Postfix)
	id D21B1C4AF09; Fri,  6 Sep 2024 22:05:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8B28C4CEC5;
	Fri,  6 Sep 2024 22:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725660318;
	bh=Wa1xJxf1QkeCeJo7qLCd/WrBEi0vtPmVjOumn/b199c=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=sRQ+MGW2oSCuGJWQxw2hiJj2TqzfG/hYAbUK/BT9BwW55ylJHdQZgB5nW2iHv8vvz
	 ihXP1lsV2vSjOJzSNSUhGqXamp3Q/L/WvuvDaYCqegTFb4jxkUhuyQXPBPnkif/fk4
	 H95opN/k80EaGYX1XZmQtD54aXy4atBv4dwCSEknP/ZxcQAqvS9n3RkTtU2m3RXM9n
	 87PD6u+HWqFqZjIOGcpJ1RboPWnx/LDqTWvtzy9HLTJ7mDzXIJtRWlAoTZfN9ydxCO
	 Ef4H9wYmTxckWCgCRax43nRtZByuQvHzGYWk/JYB8GNMAnp32ZjlbEn/h/ArR/h4Kb
	 TKKz+/byie/yg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B170D3806644;
	Fri,  6 Sep 2024 22:05:20 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: "Kernel.org Bugbot" <bugbot@kernel.org>
To: tools@kernel.org, matttbe@kernel.org, tools@linux.kernel.org, 
 konstantin@linuxfoundation.org
Message-ID: <20240906-b219245-8695afbedc1b@bugzilla.kernel.org>
In-Reply-To: <38790e98-d814-4b15-9c1d-0e8bfc5fc654@kernel.org>
References: <38790e98-d814-4b15-9c1d-0e8bfc5fc654@kernel.org>
Subject: Re: b4 send: pre-flight checks: add reminder for "b4 trailers"
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: bugspray 0.1-dev
Date: Fri,  6 Sep 2024 22:05:20 +0000 (UTC)

Hello:

This conversation is now tracked by Kernel.org Bugzilla:
https://bugzilla.kernel.org/show_bug.cgi?id=219245

There is no need to do anything else, just keep talking.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)

