Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40CD9443
	for <tools@linux.kernel.org>; Fri, 17 Jan 2025 16:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737130809; cv=none; b=GW9Mpsyzg2pdeOc5D5wPY4eTx2xQZ2SyCmM/t2LM677T7l3KTsCIw9YCb8b85eGQ3PY/cUKmMMLcSowOSe8Y9BANvCqkKFVGbZvcrdpErXd13Gc64oxwLJKxUjFR/HS/TLWTZakdKwrk2II/kCwO+GnRHs/a6+aPdrsfl+zPSe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737130809; c=relaxed/simple;
	bh=l8uHQEAwMDQSctUA8W3y9S+QYrK9ZNItSQoB0uzXsmo=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=aQtymKZiRqbFDoSXp1pwoZf+L1m+HOhKA+UW104bt7PLTfP21f6EDIO3nuz3xMcmxM4zRqpwoIsUCct2dIxR/JnpILZD011S3/K7E7XO6gAFPJbcCU2Zt9XVVb3lFi6kT2YGz6bIyx1zT4URG5SYCh+BFjsiuPIPfXYIOe8HMbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fMasqH+S; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fMasqH+S"
Received: by smtp.kernel.org (Postfix)
	id 632D1C4CEE2; Fri, 17 Jan 2025 16:20:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 477C8C4CEDD;
	Fri, 17 Jan 2025 16:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737130809;
	bh=l8uHQEAwMDQSctUA8W3y9S+QYrK9ZNItSQoB0uzXsmo=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=fMasqH+SzZBM7S/DykCcEhpq0vSQJjg16UOdy64g9ynjO6juGFHviQmcwM39H8SJ/
	 rn1sNIMxiEfhCDNY32LGd0nEd8E1KX24u9cnAJpSf4nVpwSPH7A87XWgRp01XBMphm
	 YMPF11tEcZhW0NXL7XJ9GzzbT9JhscxEdXdvzQ/+n6TXmttkcLppA7tjH7YQwHkRC6
	 rE+4kgAELb3VsswJrrk++//moTwzx7tJrQz1CnjHK4w4hI4WQk1zapxNyLdvjS0/q+
	 FoZCKJoBi4wS7jXe6ol725u9V879CBhcZhyaAoCxs7e24WpYqUn4NLvXpbFGUrp+0R
	 hfZbjPwuelraQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B2E3C380AA6A;
	Fri, 17 Jan 2025 16:20:33 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: Bugspray Bot <bugbot@kernel.org>
To: quentin.schulz@cherry.de, tools@kernel.org
Message-ID: <20250117-b219705-971ec0084f59@bugzilla.kernel.org>
In-Reply-To: <a8bc0958-6c46-4622-96ef-b1e55c15f30f@cherry.de>
References: <a8bc0958-6c46-4622-96ef-b1e55c15f30f@cherry.de>
Subject: Re: prep-pre-flight-checks doesn't seem to work
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: bugspray 0.1-dev
Date: Fri, 17 Jan 2025 16:20:33 +0000 (UTC)

Hello:

This conversation is now tracked by Kernel.org Bugzilla:
https://bugzilla.kernel.org/show_bug.cgi?id=219705

There is no need to do anything else, just keep talking.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)

