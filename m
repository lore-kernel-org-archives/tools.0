Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56BD21EA90
	for <tools@linux.kernel.org>; Thu, 31 Oct 2024 18:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730398534; cv=none; b=jRedSfvABSfaWR5oF/H+DgBlE3+DmTPvtvU2IbFgYUchlENUCY3rpnFJG0zgfyiv/vuiBU4YrdneOI/hLtqtHHur/6svWOh5QtPCHDlYff8ZjCdCjwmI7i9qmfL2E7C7uPt6XKRQ/jdKaS5xqFY8DQl8MP7G7zVa7lAvPlcOcrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730398534; c=relaxed/simple;
	bh=acs00ImvG5N3oXJ8MZHSog/Jj8IUrZL995TOq3JHeCc=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=MnN3Eb8wY0rv72oR7uLVmaxDyS42FOKvyLjWvTtpwetjE4/IubDHGzAtUsOzxMQ4DIY96K0/2JLylQASEUGzn5GS7FepKd4mUXuSUP6t+6Py5sEJ4AAymi9SRKzaR6Y0k9ix+mgvo0/TbmOhqvIM+rs0jmtXo8EdQoSj3qAXiTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FEc4mVbT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FEc4mVbT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEEBCC4CEC3;
	Thu, 31 Oct 2024 18:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730398534;
	bh=acs00ImvG5N3oXJ8MZHSog/Jj8IUrZL995TOq3JHeCc=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=FEc4mVbTF+BLypRiwYrj5F2PQMJM3sIUsXbRSxpRWB1Dia75M+E7Txy9cKJd2DJeV
	 qaXoY6hlgJ9YnPeU5eGShUEVk+GTaqSTkwmRY8Y9dcQ5AiCXoI+PCF2zy8rSz14dDy
	 ssQQdraFVWIqcIbEh5ckH0vSXVGtTAqV5tEaHcQjjZC37qiKarTeZoCI6lboP1w2/U
	 MRg8mlummR5TCU3YNaT1I79MXalXbY6lJ7NiLJXyH2UNcAPgV42Cyh2Am7m+6oWpDN
	 WxUMjZGH5RMMTBRjKUBcEkpzigVQo81njWgQcZOgFTtUERS0YG1sY3tiDqSIbAbeDS
	 K85HsZ57H5oGA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F0D59380AC0A;
	Thu, 31 Oct 2024 18:15:41 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: Bugspray Bot <bugbot@kernel.org>
To: tools@linux.kernel.org, hverkuil@xs4all.nl, tools@kernel.org, 
 ribalda@google.com
Message-ID: <20241031-b219449-dfd3ede5fa00@bugzilla.kernel.org>
In-Reply-To: <CANiDSCvSAVkSsdWzfGFHK2YZXy_dOHVeJOA7V0pmyzHzSm6iEw@mail.gmail.com>
References: <CANiDSCvSAVkSsdWzfGFHK2YZXy_dOHVeJOA7V0pmyzHzSm6iEw@mail.gmail.com>
Subject: Re: Bug in b4 shazam?
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: bugspray 0.1-dev
Date: Thu, 31 Oct 2024 18:15:41 +0000 (UTC)

Hello:

This conversation is now tracked by Kernel.org Bugzilla:
https://bugzilla.kernel.org/show_bug.cgi?id=219449

There is no need to do anything else, just keep talking.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)

