Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F71AFC12
	for <tools@linux.kernel.org>; Wed,  5 Mar 2025 20:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741207499; cv=none; b=SJFI2PqWYwMVLRGEidrLVcSsW5d2US0IhqRJU0ShOLnlTaBDOSOw715E++nCM6TXFiwEUv3cbRE1qHV3U1S6eUR2t2s+Pd49e+tJqyR7jvypJQ1wLrnWNt5ILn85EEPGuhyJvG1k4d/B1zO3cDVI7JsPLrCrPqC5+inm5e2kUfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741207499; c=relaxed/simple;
	bh=8czG9DuoP/4vZEepD+1/UFAvf8AuN78+IpnXgeaHKBU=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=WmLa+Qg8WG0UD5Qc2JUeZktFru9PZSB8PRG9NRM5JSNenGhl/lPQwkLILTwd5ySOi25ji+LKsmYSYCA+4jeTTmx2VRTBLPYb96f9NPYzl8LDrrgcd3OJIQX60epBIYm5VYQovY2l8299BIZ1c1tlWWhp3Bkd/Mfh5D7KIIHoPQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XSseIQHf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XSseIQHf"
Received: by smtp.kernel.org (Postfix)
	id D97BAC4CEE7; Wed,  5 Mar 2025 20:44:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6C58C4CED1;
	Wed,  5 Mar 2025 20:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741207498;
	bh=8czG9DuoP/4vZEepD+1/UFAvf8AuN78+IpnXgeaHKBU=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=XSseIQHfBUGOioo5Th4i3AmvXzq3si5dFLWRVwoyuxxI9EGnF4TsxXraOjxJ4ynwz
	 90JTZ+O4ToFB0BqaicPSlxhuOiPIrUGyX5/O0QZscw5zWb9qRWhLEOFuClxW5YfQL9
	 SzwVXmBC3MbxdSOPThVecY5cL4b/RBZmUFqCIYDTu+ZOXlLrCvcyG9p2rIL+x0IDec
	 seUYTJZE2dAoiTg9JuCKJvXQgZZjzABHhTxL4XnKQZpwLoRmX3DkCwWgVOPPQPr7Pb
	 aJB5M37m17jD44Va392ur7dH6+14WEXKNi1SoUoBTAqN7EoofrX+cCqFNdCRRYpCDC
	 zV6SyeTo//4dQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F0FFD380CEDD;
	Wed,  5 Mar 2025 20:45:32 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: Bugspray Bot <bugbot@kernel.org>
To: andriy.shevchenko@intel.com, konstantin@linuxfoundation.org, 
 tools@kernel.org
Message-ID: <20250305-b219844c2-57ec28cc870b@bugzilla.kernel.org>
In-Reply-To: <Z8cMdUMZQhGtVTWx@smile.fi.intel.com>
References: <Z8cMdUMZQhGtVTWx@smile.fi.intel.com>
Subject: Re: b4 to accept https://patch.msgid.link/
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: bugspray 0.1-dev
Date: Wed,  5 Mar 2025 20:45:32 +0000 (UTC)

Konstantin Ryabitsev writes in commit a85d2da55fb70f7aab2eb82849decdf2ff5aff98:

Try a bit harder to find a msgid in a URL that was passed on CLI

We're currently already properly parsing URLs in the format
site/project/msgid, but it also helps to have a fallback when there's a
redirector site like msgid.link.

Reported-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Link: https://msgid.link/Z8cMdUMZQhGtVTWx@smile.fi.intel.com
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=219844
Signed-off-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>

(via https://git.kernel.org/pub/scm/utils/b4/b4.git/commit/?id=a85d2da55fb7)
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)

