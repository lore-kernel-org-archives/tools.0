Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6FC61EB5FA
	for <tools@linux.kernel.org>; Wed, 28 May 2025 18:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748456988; cv=none; b=coWXL6AhfYy5/792swBGhVaGMIEg46ItIIsXNrd1N2LpSX7VQSTCs8xMB0JMT07jm+sW3XqvI5RoC7OiIkwuUmSb/DbleMisAmRkdzFPwy3lYkOnGGQtH9YSMLZ1DEouQSbgOp9lvaNUX3jVyfLwf/AxHm6Wp9mtqaCmmG11B3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748456988; c=relaxed/simple;
	bh=dkqx/ryrSO60aXtQ+/p6DzlGWsu+fstaC17qLyIaKzI=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=mJLMk4kIRl2eeiXVcMZgg8px8pcyxP40K9+lz/QYP5vHxN9aOiik4YTIKhwZh9Ko1NF1xmD2snn2yQBC+y2eU3zDJTwqCnUZr4CilX75tF3Ym8a3s9Iq2vTvcXtzcqVSO30TEypnBvAzYuakw8zKXPvl5XzsHvvB0eS951c1VLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FC7D+Z/q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FC7D+Z/q"
Received: by smtp.kernel.org (Postfix)
	id 45A3BC4CEED; Wed, 28 May 2025 18:29:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2630BC4CEE3;
	Wed, 28 May 2025 18:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748456988;
	bh=dkqx/ryrSO60aXtQ+/p6DzlGWsu+fstaC17qLyIaKzI=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=FC7D+Z/q3oK9CTXwGgwcBxk9/UYWc8GPtGBtoAXaIQiFrSyQp/LhRAhaTx3HSSVnr
	 ivgE9Y759/RX604a+7DFCwuTFBTsHhLw52aDoj3+gjM7+QiYD21553kxMnAIMcwTzI
	 bP9QEnqZ68LQ0hIsfDRDPD3P5Wcje/ZGa+mmZDLwQAUhTYk853EyusweL1tTtdgQo0
	 fymvk3wC4gL8oddcDUKcJ0RloxL6U/96RkBXNXPAJWfSc2mhzf4YNuEUm4sc2UrPl0
	 MtBbOMJ02r/q9ge7WOkLpHLaRa9VD18+vNFzEQgQS8C79Sn+oSb0qGeZGq9gxKtjmO
	 kUAffMSP7sfFA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 390B63822D1A;
	Wed, 28 May 2025 18:30:23 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: Bugspray Bot <bugbot@kernel.org>
To: tz2294@columbia.edu, tools@kernel.org
Message-ID: <20250528-b220171-fb1a8804de22@bugzilla.kernel.org>
In-Reply-To: <CAKha_sri+u=R9x1h9tg7N4cuTFckLmbe22=Sw2P2jpw_fm2Jcg@mail.gmail.com>
References: <CAKha_sri+u=R9x1h9tg7N4cuTFckLmbe22=Sw2P2jpw_fm2Jcg@mail.gmail.com>
Subject: Re: b4 broken with git older than 2.41
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: bugspray 0.1-dev
Date: Wed, 28 May 2025 18:30:23 +0000 (UTC)

Hello:

This conversation is now tracked by Kernel.org Bugzilla:
https://bugzilla.kernel.org/show_bug.cgi?id=220171

There is no need to do anything else, just keep talking.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)

