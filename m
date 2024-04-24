Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B54144303
	for <tools@linux.kernel.org>; Wed, 24 Apr 2024 20:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713990024; cv=none; b=bqcx8WTp2IpjKKFG42L8HeZ1sBdZevwJ638P628pQLTaZfol4nE+H/T8QyHZl6FHdLh9VOT2ZOmS1ar3J/mDxEwLqy67/lRJCEh/+RnNqwuH0tqKBifoW36k5xdZYbmL6EHM9OTbtZRas6EGln7RvJqnm/3k9E5tvFeJoqUPGfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713990024; c=relaxed/simple;
	bh=jXFuKpyuyR1VTUM85T1YgeeAb66GcBgOUwplraPHgX4=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=XxgoHSPdyQcLSZsSWVmuHrazwdCRsclK5CVWgHhdPi4SrAuNvMT2QH1rUbGak8UNKdnV1AetiEAWCSOsiFuj85rLVE+E6pFUugzlib/MVlYYFPAHIyArOKu4DNVJs/PLSvTRh5vAql9RrjkgQieuyW2KiUMrieED6X/mz1G4rfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lF009UcX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lF009UcX"
Received: by smtp.kernel.org (Postfix) with ESMTPS id F1A09C113CD;
	Wed, 24 Apr 2024 20:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713990024;
	bh=jXFuKpyuyR1VTUM85T1YgeeAb66GcBgOUwplraPHgX4=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=lF009UcXh+L/JpKugaNHGALSb08eENhHvSXFz+N0feB1rfDavy5k1TNxsPwCWz4P7
	 Lsy7hr5AbVxlJX5E3EITehfwZk/T2QykFt+06+Tl1w/9zC+Mx5uxQRg6IYIk3/MJWj
	 Tj87mVnqerXd6t1nhuv8gP0EFKGduiRWazzi+AnTtDP/Io/7IWyRllGxYjDLzHjpK/
	 n5AhAZoDlLflQ1sZ8+A1oEXXYWICE7WRRc6dokcYBYNbPq2G+1Q/jSWMXFsmrNdMNe
	 +j1w33kR24D8WRS89WlZvXGwRQCVqg6X8f1Z0SE8Ubm3SS/L4QTpnNJaoaggTu1n2q
	 I1gS6h6Gd3/DQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D24A7C43614;
	Wed, 24 Apr 2024 20:20:23 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: "Kernel.org Bugbot" <bugbot@kernel.org>
To: tools@linux.kernel.org, tools@kernel.org, liam@hpfr.net
Message-ID: <20240424-b218772-0ab89c4b51d9@bugzilla.kernel.org>
In-Reply-To: <878r16nhm9.fsf@hpfr.net>
References: <878r16nhm9.fsf@hpfr.net>
Subject: Re: b4 sendemail.sendmailCmd support
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: peebz 0.1
Date: Wed, 24 Apr 2024 20:20:23 +0000 (UTC)

Hello:

This conversation is now tracked by Kernel.org Bugzilla:
https://bugzilla.kernel.org/show_bug.cgi?id=218772

There is no need to do anything else, just keep talking.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)

