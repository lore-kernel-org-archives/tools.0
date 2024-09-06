Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F4A1D1F50
	for <tools@linux.kernel.org>; Fri,  6 Sep 2024 14:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725634036; cv=none; b=o+KxC05Soar/gNh/g5NJwI7BS1sNQZIQH0kapqmOghMawNSWgz1Wm0cRh/MvYLInWcHKmQ81PMppn9DggKsHtzXCmup6H+omwiiR8NFb9SmUHqHsZ2D4pM/sR9qi9f/C0RG5SmlfotelGFvly9r5VaCmiS9R4p/Kj0vd0bSSClM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725634036; c=relaxed/simple;
	bh=Xs/GJQYf4yKT97p7BSfCIcy1gA2PQCQABR9Y+5Az3Mw=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Zvi6/VbYTCdPZ8+PWxSjMCTn+yvzcSi41rmUMZr0yct+JCdJGaxAx/CxBcoTLmOpyMwiLvmW0z0E4A1DZe2NGID8+xyOPQ+v9XapEySPpcY0SghA8DVgN6unjUPquxArRNrRT2+UXD8AaJH1Wf47UYGeLpEiuJgcJHs9s0FaODc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=2q5/SbHy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="2q5/SbHy"
Received: by smtp.kernel.org (Postfix)
	id D3B20C4CEC7; Fri,  6 Sep 2024 14:47:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92F05C4CEC8;
	Fri,  6 Sep 2024 14:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1725634035;
	bh=Xs/GJQYf4yKT97p7BSfCIcy1gA2PQCQABR9Y+5Az3Mw=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=2q5/SbHyUMw5j+kGQX0UfYZ5YZP4B3AnP7vk9Vp+enMmVUq6WmWK6HEYL+knqxXTQ
	 9yYmjHNjmLLAn2qaW7J5uidJxUbQLb+DnZFfIwbGJ2xjPlLci0VnwNjDPpH8hfmD+7
	 8kN7NSAifIRv84TrUAHycPG+Ft51/6assZqhZSfo=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Tools" <tools@kernel.org>, 
 Brandon Maier <brandon.maier@collins.com>
In-Reply-To: <20240627-check-cmd-docs-v1-1-e548ff7ede5d@collins.com>
References: <20240627-check-cmd-docs-v1-1-e548ff7ede5d@collins.com>
Subject: Re: [PATCH b4] docs/config: document how *-cmd is run
Message-Id: <172563403549.23316.1868462240580025549.b4-ty@linuxfoundation.org>
Date: Fri, 06 Sep 2024 10:47:15 -0400
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-40f6e


On Thu, 27 Jun 2024 17:42:37 +0000, Brandon Maier wrote:
> For someone not familiar with checkpatch and get_maintainer's flags,
> it's not obvious how the commands are used. Document this to help users
> trying to add custom checkers.
> 
> 

Applied, thanks!

[1/1] docs/config: document how *-cmd is run
      commit: 6dd85d53b3899cf3cb685b16e7152b640dcbde46

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

