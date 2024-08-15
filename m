Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41AB63D5
	for <tools@linux.kernel.org>; Thu, 15 Aug 2024 14:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723732222; cv=none; b=XE8Hs9/3UjUq23c0y8eF14pcDYa4Gz9gDRyQxgqIxa9/7OVmVIx15ns0++v1tBocoiSqtw2N5VKxgtw+e5gvZR1bxUcIJd/Kw4+ly3CGUXQiM5bGSE6MooZI1EyzaZD+g8w7lB8AYvDgv/inwrEQd4AA9jUpd9HMvkA0j6Pa3oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723732222; c=relaxed/simple;
	bh=ZGLmvWsAa43xui0+R38MB4ndkDcO2bF+3VbVrcByWg0=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=seVHjae2XOTRsVdT/Y7oMgy2SaObv3ew3Q61b3D1u9FN2QUNxfB809T7t040GzOVirMTwMvfqpNECUpxNyM3Fx45z2kaeSo0ExXbV4g34cwma8KWMNVDussrghTImcL7YpAMXF/LJw20Vrt1Ot85BrdyjOAwYq78TqjVUpbmdp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ceet7TGY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ceet7TGY"
Received: by smtp.kernel.org (Postfix)
	id B71D8C4AF0D; Thu, 15 Aug 2024 14:30:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A10BCC4AF0E;
	Thu, 15 Aug 2024 14:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723732221;
	bh=ZGLmvWsAa43xui0+R38MB4ndkDcO2bF+3VbVrcByWg0=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=Ceet7TGYxzxbrdOXECAMZSrIKHK5M2KQITvmUTkG8OsXyrVvBzV221EIbEtbdEFXA
	 TXPI7CaKQgbqxz5GlkB/Iaa2qnm9yP5/pcB+aHghXL+5gaMiHGjkliVTcZYGAU/xnt
	 1u4BfqEJxqnJtoHPMPjnTnOubvU7tnMjboEconRFAFaxhXIEXUuAl93gHGG2FfoG7X
	 R+wBlIFHNsTJ7NM9251rH0t/vWAcuCZT3CO7FSen7mOyauW4RVMX15/1ENoDBkbXtr
	 6+9kUJ8BUfaG1gcdDewp+yiL89BJLfyTHDcEsmlS3myrRoT15unjsc+b5UUVjbJxag
	 jS59cKloEJB/A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 01DDB382327A;
	Thu, 15 Aug 2024 14:30:21 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: "Kernel.org Bugbot" <bugbot@kernel.org>
To: khilman@baylibre.com, tools@kernel.org
Message-ID: <20240815-b219163-318cee448d09@bugzilla.kernel.org>
In-Reply-To: <7h4j7y32gk.fsf@baylibre.com>
References: <7h4j7y32gk.fsf@baylibre.com>
Subject: Re: b4: prerequisite patch-ids generated in wrong order
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: bugspray 0.1-dev
Date: Thu, 15 Aug 2024 14:30:21 +0000 (UTC)

Hello:

This conversation is now tracked by Kernel.org Bugzilla:
https://bugzilla.kernel.org/show_bug.cgi?id=219163

There is no need to do anything else, just keep talking.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)

