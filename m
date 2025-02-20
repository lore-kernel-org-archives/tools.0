Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C16D1FFC43;
	Thu, 20 Feb 2025 14:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740062377; cv=none; b=gkfH4uTKts56rVX0v+e0R8swACBBcrt3p6B/7hAar0/7B7UcO1dKVZAtfw381BRInwDCJjQKyO7Krixr6T+YeHcdDnNs6KmftcM3xW6sIqkntpNWD7+opa5monPc4RACxCxfJz4lAtJLcY9pHGHsftnosViCj3JuzVehi7P6qDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740062377; c=relaxed/simple;
	bh=vqpzOJUp2yJxx988TBTjtLen19W0UDb5BB+JcBE3ypk=;
	h=From:Date:MIME-Version:Content-Type:To:Message-ID:In-Reply-To:
	 References:Subject; b=os+M35dnCfgsj++58cYDIpXet/47JEjwRBXVHQTcsx0xVd5G6i1w8U978oZDUX1Ri6msxfI4e84oABF89X2OLBwZRCedKxHjRx7KVkP+U8du4pm6VBw3xXZuWbpwETKFK+vWrf7a1R618ERDKdI/dEgh/NcrE7XrSryopRB6QCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pzwD6LBh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pzwD6LBh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C36BC4CEE2;
	Thu, 20 Feb 2025 14:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740062377;
	bh=vqpzOJUp2yJxx988TBTjtLen19W0UDb5BB+JcBE3ypk=;
	h=From:Date:To:In-Reply-To:References:Subject:From;
	b=pzwD6LBhGPl1zxqqEzH+8gZCC8YvjoPYk7Nkb6e/F2z5RlVpbpNYyu1uO5FvFcuwa
	 6QpL762TMTKhfWweTpetN9tNBs60ex9MIXCJ00s0ZQEIPpWBTNkc+9gceA6S1EkkG8
	 orCMKwUpeGJ3JdMrzirULnrPZsbMVrtKi1IjqO45S38HkEooixOK/lwijp30wwqfhZ
	 KyZqK174Q7Lg5Iyi4Mss7vw5ZatQwcz/JN1DW1TPEFby9tqP67KaBTuFrqc4d5zfGU
	 uxB0cSkZv5rDg+42U5Zigs4uck5cCiNCJIKCtJhB9xB5zohZdWkYa5OMRPQKNcwC1R
	 V98kZMi5RbBrw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02E82380CEE2;
	Thu, 20 Feb 2025 14:40:08 +0000 (UTC)
From: Lee Jones via Bugspray Bot <bugbot@kernel.org>
Date: Thu, 20 Feb 2025 14:40:08 +0000
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: lee@kernel.org, tools@kernel.org, tools@linux.kernel.org, 
 konstantin@linuxfoundation.org, users@linux.kernel.org
Message-ID: <20250220-b217672c3-ec7d08cffb20@bugzilla.kernel.org>
In-Reply-To: <CABVG=qdHsB5pa8rOKCV9s2WtXKZ-Qh1+8q=1VNcorM37P4r1EQ@mail.gmail.com>
References: <CABVG=qdHsB5pa8rOKCV9s2WtXKZ-Qh1+8q=1VNcorM37P4r1EQ@mail.gmail.com>
Subject: Re: b4: ty: Feature request - configuration option to send to
 'myemail'
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: bugspray 0.1-dev

Lee Jones writes via Kernel.org Bugzilla:

v1 patch posted:

https://lore.kernel.org/tools/20250212172838.2765647-1-lee@kernel.org/T/#u

View: https://bugzilla.kernel.org/show_bug.cgi?id=217672#c3
You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)

