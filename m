Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D457C1D2708
	for <tools@linux.kernel.org>; Wed,  2 Oct 2024 14:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727878838; cv=none; b=mNDrg/iliWJUjgfTEGJaAZAm3etEF2Q8CXLP/J63Pbrvr6C9KvsRIwp5irHls/qwjoO/TUAuMBUxtQYDIfuNYp3gZsLu8tNaGETZl8OwsArjpeISCIsK8GUV+SCeXhI/G9qZu19446tGUEKm0Gv3QZWduUCS2orSvvzscojqUTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727878838; c=relaxed/simple;
	bh=KPPOxOkMj8yN/1DKqdk0xS0H8sm8dGEb1tVmoCH2b0Q=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=dXBpOg/4c6F2K0Ab5asvSUzv0cA+tru9Ryeub85+mraI8Htr6Qms/vNvj8SlsLYENr2Mf1l/aBALqgSZ/wvAmUageyPtZyhOXHpyonC+ZZZbOBcgFlqe4mBDWfyMHpNi84dw27eCmqlAxy1jJu+vUcODqxAnf48rWwYv7E1gIwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cjh5ue8H; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cjh5ue8H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2BAEC4CEC5;
	Wed,  2 Oct 2024 14:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727878838;
	bh=KPPOxOkMj8yN/1DKqdk0xS0H8sm8dGEb1tVmoCH2b0Q=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=cjh5ue8HJmPvP7QUOEb2O0heob4qOfZUyhz6edllWtuaUWED0056IZmY3Rh/Femi5
	 14rCQxhGth+IeQp/GxBj8CpX+gcUWdPfS4buhDhPh6qPXqFSqealqzf90A9RnceCyX
	 f3OicZyCObQteWHGwMqiPOVEeTLw5O1p0n3tQ7iC39ibGmcHuiJXt6YO7OVneNqeOg
	 l/oiOpGCkn1N+yAxdgPYiYkDR8g5ERg2qschhL7v0R/gRrUAnbVYd0Dz3pK6Neo6Ph
	 3yJXycHqVy4zmirWnUTP2nE4hAcq4cY4N9SMrQt+w1HDp0SXzgcHzWG4xfOar6sVPd
	 kQoWTY5aQ6dsw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EFFE83803262;
	Wed,  2 Oct 2024 14:20:42 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: Bugspray Bot <bugbot@kernel.org>
To: tools@kernel.org, broonie@kernel.org, konstantin@linuxfoundation.org, 
 tools@linux.kernel.org
Message-ID: <20241002-b219342-6c309d701d68@bugzilla.kernel.org>
In-Reply-To: <98450a13-1339-41e1-87b4-3db7387906c7@sirena.org.uk>
References: <98450a13-1339-41e1-87b4-3db7387906c7@sirena.org.uk>
Subject: Re: b4 trailers --update picks up bogus trailers
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: bugspray 0.1-dev
Date: Wed,  2 Oct 2024 14:20:42 +0000 (UTC)

Hello:

This conversation is now tracked by Kernel.org Bugzilla:
https://bugzilla.kernel.org/show_bug.cgi?id=219342

There is no need to do anything else, just keep talking.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)

