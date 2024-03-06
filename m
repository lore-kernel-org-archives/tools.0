Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C98140E46
	for <tools@linux.kernel.org>; Wed,  6 Mar 2024 20:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709756426; cv=none; b=NSG6JE2EpVDTdPaD59NF4s9ICjgugmLFDwVJ6IDU7momrk71rY/dNCmB8mIot+QtYbLZQIdCGGIWA6a060Ux6mP8ppsAAfUxn/3z/xn+aLqRYAPBUPAfT0v7DDTkR0bWrOwK6ZmMPMP30Q2v5/w2WKtr/GB/49vjS92HNBjq8zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709756426; c=relaxed/simple;
	bh=mnc/zA2NrBzs2JMz4rS8LPLNsCoaxvAcX4FlqqMdBdQ=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=g46LT0nL92ifwP/BeM0zBw+C3pIcKN5x1twaSI6yJsvhzoc6VlD0GUGDXQcmvm1TZd6yiKW2YxSwCfgUk8mk6NgZEdHSjzntcS7aw3E8QncAwI46Ity83aPzfn7uWdQNSlmIGNNSePEStgG6W/M8fmygWoHJTMK6+5Ex4j6rmIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RynElzHa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RynElzHa"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0E5B4C433F1;
	Wed,  6 Mar 2024 20:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709756426;
	bh=mnc/zA2NrBzs2JMz4rS8LPLNsCoaxvAcX4FlqqMdBdQ=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=RynElzHa4rMnyYikj4Mqa1YB/ppa2EIp3xdYnKP4wR2NCQe3jcQChPjSKDKe4ZTTX
	 0To0bL7xzI/aN5XMgAgNIQMxMaJDth4vJVUaqUEpP6e0hn7JDzsIJ+pzJHj9OTlPtl
	 W41glHh+KpfQ2k5lJrHEd1FkK4LNLEjV7RBQTyaxIvaq49T7vu/0ZCAa0DYh7uYuw8
	 9TbINcjmmpprQY/xIAb6M38Tx0/sqJWwf5cAcOKGkgLwyZkbtG6dT58fCkqyVNHI6K
	 Vo2QK7/gtPBLZrlc8PrHpVN/JxLCSnj+l54s2tACBVlvhrzLWqojXoUNrDolB//KhD
	 2uL0Q5VHcJ5pg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E83D4D9A4B5;
	Wed,  6 Mar 2024 20:20:25 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: "Kernel.org Bugbot" <bugbot@kernel.org>
To: tools@kernel.org, konstantin@linuxfoundation.org, 
 tools@linux.kernel.org, andrew.cooper3@citrix.com
Message-ID: <20240306-b218567c2-d19e5ea37547@bugzilla.kernel.org>
In-Reply-To: <16beccd0-db0b-4c9c-a4d1-fcf43f98959c@citrix.com>
References: <16beccd0-db0b-4c9c-a4d1-fcf43f98959c@citrix.com>
Subject: Re: b4 DKIM checks
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: peebz 0.1
Date: Wed,  6 Mar 2024 20:20:25 +0000 (UTC)

Konstantin Ryabitsev writes in commit 1457bc615a8ff06afba252a15480b61dd7cfef60:

main: add ability to specify DNS resolvers for DKIM

Sometimes it is useful to be able to specify alternative resolvers to
use for DKIM lookups, for example when you're on an internal network
that uses split-horizon DNS. You can now override the resolvers to use,
but please check that you're actually able to query them.

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=218567
Signed-off-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>

(via https://git.kernel.org/pub/scm/utils/b4/b4.git/commit/?id=1457bc615a8f)
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)

