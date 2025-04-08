Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9856713FD86
	for <tools@linux.kernel.org>; Tue,  8 Apr 2025 14:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744124094; cv=none; b=L9C1jYrWx8bNuxoXehRGsqpj+e15o5W5s6w+Lk5AAuz5p/jt0vDEOQPsg734qZ4mbvuO8FmAjNc/X9SgOB1mE2sOA74NEjVzRBm0Z3GWBhTjOX8h/SLhrE1VdFqBioOjXcNdyZMwH3iojAobC0L3ev9zd9WmZq3AyRctpBcnvvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744124094; c=relaxed/simple;
	bh=c8y8gG9WBQWJPpoQabr6kojcyA8PQyuxbWoXCg6VdyU=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=PtJUfgHKYGidE9fMFrRO3nn1rgzgGJ35PM3F2E2F+KgI887eEM/ALwiWCXCFsGPRUcr4GrzQTy0uWzrRW9ufNwZTr/1LfOs7k84Npiev3C2Se7aePgNxQPCKqSp+eWOxu4QGDUKctYAT4YrcNzByb+k8sRcKxiCwGE3m9LWs+y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cqz/b1v1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cqz/b1v1"
Received: by smtp.kernel.org (Postfix)
	id 818E5C4CEEA; Tue,  8 Apr 2025 14:54:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60DD5C4CEE5;
	Tue,  8 Apr 2025 14:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744124094;
	bh=c8y8gG9WBQWJPpoQabr6kojcyA8PQyuxbWoXCg6VdyU=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=cqz/b1v1pnM1WtXm8Zr2JQR7IOuwcYdV5y+H6Gf6Qs7oH3WKIvhQPT5KtFqte9aSO
	 IsAlSYo3ljCrt9Cu9u/sXFUIyj31Z7EUKBXDKLRYVadKZcoDl0/sE7aP1I88a5SAcZ
	 lL1OA3+P8YWatVSbgkK1e2I8fJhwVcObLLx+tbEkQtv8cGHSd8ky0hvhsXwZEbq6Ur
	 nlO55xR+AgpVBLWpJZRl6L5qDqnKuRl1MojjxE80fWf//EfMe4xhqyf3TO0p8pDu1r
	 16fbrIitSanxfbEsj4R0kbavCdPxJ+JmnU+9pmDDzVwqFIjGeIDTdgL2lTSSy6Qbuj
	 +fXdTmjfvOnnw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB37F38111D4;
	Tue,  8 Apr 2025 14:55:32 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: Bugspray Bot <bugbot@kernel.org>
To: andrew.cooper3@citrix.com, anthony.perard@vates.tech, tools@kernel.org, 
 marmarek@invisiblethingslab.com
Message-ID: <20250408-b219993-d3df209dae6d@bugzilla.kernel.org>
In-Reply-To: <b19f33bc-df96-4365-bef4-7f1393fc7ce3@citrix.com>
References: <b19f33bc-df96-4365-bef4-7f1393fc7ce3@citrix.com>
Subject: Re: b4 inserts Reviewed-by tag from unrelated thread/patch
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: bugspray 0.1-dev
Date: Tue,  8 Apr 2025 14:55:32 +0000 (UTC)

Hello:

This conversation is now tracked by Kernel.org Bugzilla:
https://bugzilla.kernel.org/show_bug.cgi?id=219993

There is no need to do anything else, just keep talking.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)

