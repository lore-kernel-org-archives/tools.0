Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 216AA306D40;
	Fri, 28 Nov 2025 09:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764323885; cv=none; b=atWP8KlGvicLZmErbWIyDwpLQD6s7LH9hcn94md9qFLASDV77hAeTvDrdOfWE6Lo2ur2kj+nktuTibyJWa8NAD12Iv+EqbcrJ9nrTYcAHjtvGf7+DEF0AkjPwZBN5LELFEqJhpveD2T/B2/Vq4pkbzXbHBkXqxVtkdhvrDeu5X8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764323885; c=relaxed/simple;
	bh=hU7rMISije7Uc3ctAXJqPTR5L5cB3h7+Ow4C5U6j0rM=;
	h=From:Date:MIME-Version:Content-Type:To:Message-ID:In-Reply-To:
	 References:Subject; b=A4D4z7B1wRJUoHluDsqsFCyJf+y0/Tll39FMx4yZgAO49R60M6JEbhy5vhaL9xkmWuXHO12bNkt0j0RkgQJOzg4/knljTuzkFitg+6Yu/yKow370VjE060KDqIdDN4rC7HIZKlBgfx5QHDSf1Q4sPUjchTqplXd23m9vz3BFi/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ao/EQu1o; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ao/EQu1o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96969C4CEF1;
	Fri, 28 Nov 2025 09:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764323884;
	bh=hU7rMISije7Uc3ctAXJqPTR5L5cB3h7+Ow4C5U6j0rM=;
	h=From:Date:To:In-Reply-To:References:Subject:From;
	b=Ao/EQu1os3nYJYya2TG6D9s+0yZm8TAM3wX/fV42f4ehBYZiYtYagV2BUuda12aHS
	 3ALI5a8z4wLxSonjld5GrjgpXRd3LiSjr5Xf1wVL4O0DyQhEiiZDwVAq0p6Nz4I0ex
	 VTdNJBgey6d/2MX5ulaksxldVrSq0b88rfCnC2L2qrjDDjmji0xfKVhTwWPWTcEAP/
	 lOgf+3QEI34H3mp2CCH53PnuStAxCt3iFL0rcZvkBfuGM+bZbZOfaa0CxhR8NrM7Tb
	 /9laodugLsjCCHdZkjyKm0qXIfUqU++MlWtJhXSwgYLwgfGY/MqNyuI+bIyMLumtOL
	 dEc0wg9Yp7Agg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BA8ED3806924;
	Fri, 28 Nov 2025 09:55:07 +0000 (UTC)
From: Louis Rannou via Bugspray Bot <bugbot@kernel.org>
Date: Fri, 28 Nov 2025 09:55:10 +0000
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: erik.schilling@linaro.org, konstantin@linuxfoundation.org, 
 bugs@lists.linux.dev, tools@linux.kernel.org
Message-ID: <20251128-b217642c7-ac18b021a46c@bugzilla.kernel.org>
In-Reply-To: <CTPW75Q2ISUN.251ELTNP6RB22@fedora>
References: <CTPW75Q2ISUN.251ELTNP6RB22@fedora>
Subject: Re: Allow sending prefixes before [PATCH]
X-Bugzilla-Product: Linux
X-Bugzilla-Component: Kernel
X-Mailer: bugspray 0.1-dev

Louis Rannou writes via Kernel.org Bugzilla:

Please note that the issue won't be fixed unless the server side is updateded.
So far, this raises an error:

Error from endpoint: This service only accepts patches

(tried with lkml.kernel.org/_b4_submit)

View: https://bugzilla.kernel.org/show_bug.cgi?id=217642#c7
You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)

