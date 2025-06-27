Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2357415E8B
	for <tools@linux.kernel.org>; Fri, 27 Jun 2025 18:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751047798; cv=none; b=Z06hV0ASloVGpWzYjUzkgjr3ytQweXsjz5mxB+1lhBV3ALDhUZ8cqlsvN2FQa8//yNWPCj5k1gQWQfMIbNCNioy4AwTZYaBrueTYye1npYCDp2ZZPLHpn+po9igKUEcHcHlnaXIpTkUZ8SzRruR7sHyC6ydkYBiz+uY1vD8z2uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751047798; c=relaxed/simple;
	bh=lpcrpi9Zlevck0VpC7B+mCQ5iAdNTzdmRLBvQF6i+xw=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=UuFm3aMOKzcgnydQW/auOgdxOvZz8dkr6i9BsbDi2FuC5WnnL/akV8Rfjn0zwB6JvJ7KGjTKju0Dw55Wg57UGocuK8s6sBO3c5iLclZh1858rgXXsvAOygg6PexJ++onfsrVyHa255AcURrMeAo7cstajylkUB0D8CoSr0Ow3Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QlP5Sc5v; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QlP5Sc5v"
Received: by smtp.kernel.org (Postfix)
	id AAC7EC4CEEF; Fri, 27 Jun 2025 18:09:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E04BC4CEE3;
	Fri, 27 Jun 2025 18:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751047797;
	bh=lpcrpi9Zlevck0VpC7B+mCQ5iAdNTzdmRLBvQF6i+xw=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=QlP5Sc5vDwRwgyTsMH+i9zfIAN23QAvReFPUEU9uKhgQU/OMafoqOuFRMOlgwua+2
	 8MjHti7NI2KdAmEtbpsl2Bu9yewtBTEbH7858C33S9VTG4SLd8xcsbCWuWkzrQKyiX
	 dxmg5W4rg9DRQnYO1S34coLoiAhy40+S30FpCPMPdoy1rQpOko80uoueBYOh0khKGH
	 yap/NTwbqeZyOkOmX5d8dV/Op2cAeUqEoC18tOdUnWQMFSrlJpjjTB017NNpZ6y1XY
	 SnSkmPCICJ7lgE3co6hnAbpKNE5n098qOebjNmSrFUimllnKzP4N/Muy+Kwrb+Gmk8
	 hUEy/2n/I8boQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B1946380DBEE;
	Fri, 27 Jun 2025 18:10:24 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: Bugspray Bot <bugbot@kernel.org>
To: konstantin@linuxfoundation.org, juri.lelli@gmail.com, tools@kernel.org
Message-ID: <20250627-b220285c2-29e8ccff3223@bugzilla.kernel.org>
In-Reply-To: <CAE-h8tF9rp1B22YhC6PPUFntst9BEZzcCiyy-Mzjq2pQwEnAgg@mail.gmail.com>
References: <CAE-h8tF9rp1B22YhC6PPUFntst9BEZzcCiyy-Mzjq2pQwEnAgg@mail.gmail.com>
Subject: Re: b4: Fail to send series with smtpAuth none
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: bugspray 0.1-dev
Date: Fri, 27 Jun 2025 18:10:24 +0000 (UTC)

Konstantin Ryabitsev writes in commit a9b2aba54be85ea2933c43b8a6d71c1611230b59:

Support smtpauth=none in sendemail configs

We still don't support the entire range of all possible [sendemail]
section configurations, but it's easy to suppor the special
smtpauth=none setting to not require username/password.

Suggested-by: Juri Lelli <juri.lelli@gmail.com>
Closees: https://bugzilla.kernel.org/show_bug.cgi?id=220285
Signed-off-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>

(via https://git.kernel.org/pub/scm/utils/b4/b4.git/commit/?id=a9b2aba54be8)
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)

