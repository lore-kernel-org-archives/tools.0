Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256C3EEDE
	for <tools@linux.kernel.org>; Fri, 27 Jun 2025 16:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751043597; cv=none; b=HhIkrl0EUmyu7oRUxZXRfYUanVQ+CD0GuR0OmFAL0m6y5bqJ0xEp4oxyma6xvje9fGg6Q0rFpDr7dXnuDHsZYq3xnFLLaPkZ9ukw94iTHmc4So8R4NTOzdHNjItTKMDT+EOX0n+04CWJCDcyD9fhZb6nDy9tQF1gfzfom9QF90c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751043597; c=relaxed/simple;
	bh=bZ7zoIs/LQM8BrMEfv7vPHI2P3G9ItQeWQLgVNK/xsI=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=UM9IqHPkyAG6yWvFlLpxssR+Wj/jNVbeWYBl0H2N84FMbJIw0P5nefIKA17RFV/jFc6YJN7vYeP0IqGwx0WueRZsx2lv7S69z5VLMR2cQivUR1z6zGxifsJi0zWSwCTAC1WCSvQZXbOAOy1HzHMAMTi72Owdu/KvXpgiXzjRta8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kGfPYJAJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kGfPYJAJ"
Received: by smtp.kernel.org (Postfix)
	id 10D2CC4CEEF; Fri, 27 Jun 2025 16:59:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEBC8C4CEE3;
	Fri, 27 Jun 2025 16:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751043597;
	bh=bZ7zoIs/LQM8BrMEfv7vPHI2P3G9ItQeWQLgVNK/xsI=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=kGfPYJAJE+EAeqOf2MFLjd383MPxLlpbCuNXnJxEoUcdA//ITOhQImI3P6Iiuilho
	 FbbhcdUxznBL5KpKn0KO7F1XpX+k2z0rf31irIFAOJHFWd8EXwyY2zw5nhjn4r3irI
	 LhDfCN6Gd2U180CmhrPoPb4UUbTVoBFm0lTSHjIxz4WSlfyqVxGKWxrz7dMfcE0717
	 7eW6V7dLcYlfK/XgC4fLZVCDYDrqEblp15aRnYQLUp8Ge/7ul4l+EFVNT409G1nF2n
	 NxHKaeCtmhu8YBRiELKWybROXg1DNY283HnNhiv/joG6ootVeypzRgSSPU4DydcILo
	 R3REpbwyBEjGg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 34279380DBEE;
	Fri, 27 Jun 2025 17:00:24 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: Bugspray Bot <bugbot@kernel.org>
To: konstantin@linuxfoundation.org, tools@kernel.org, 
 davemarq@linux.ibm.com
Message-ID: <20250627-b220276c2-d88a27626bd6@bugzilla.kernel.org>
In-Reply-To: <87sejmk0j7.fsf@linux.ibm.com>
References: <87sejmk0j7.fsf@linux.ibm.com>
Subject: Re: b4 send --resend broken by
 8cae1088cf605a12ed3207e7743fadcfa95c252a
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: bugspray 0.1-dev
Date: Fri, 27 Jun 2025 17:00:24 +0000 (UTC)

Konstantin Ryabitsev writes in commit cff911a15f240d09032f90a85a000723e0baadd3:

ez: fix --resend

The tag_msg would only be defined if we're not doing resend, so move the
None check to where it makes sense.

Reported-by: Dave Marquardt <davemarq@linux.ibm.com>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=220276
Signed-off-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>

(via https://git.kernel.org/pub/scm/utils/b4/b4.git/commit/?id=cff911a15f24)
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)

