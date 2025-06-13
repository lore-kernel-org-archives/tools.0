Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781D52236FB
	for <tools@linux.kernel.org>; Fri, 13 Jun 2025 17:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749836426; cv=none; b=Tja69Y9iSmZpdMEbIfzcIlmiH2puubGUcLLqwB851NFBPnnmXWSXghlh2fKWHFIOyDwDVqbTjDHhmcr2RKDmRB7nmRI81JrBUvZIiOsbNMW24O4FWgEQhOz76gkmUDmoTPJYEY6mfxx96B9ykh52S22wJ/nnWpiv/P+zPWGm1pA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749836426; c=relaxed/simple;
	bh=PQEZ7+xNhR314GCV4kEhN6OL+++qUbnhjGAWogS2pV4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ngbCUvxat/adao7XbV1buTKQdAuKPQMTkwY9xQ+qnVAUcJTfJqCxMUu/QEmVKgJmErlBmixOYrSsi6rBfSe8xUhCZGpA1y+lP4mYNybOANZx/TtuStQs1Yg32nkiZlih4NGkBY9/DKuQSmOvAB/HICCDxXuB+2ljrLH6Mbjo5cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=QBfNCbnx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="QBfNCbnx"
Received: by smtp.kernel.org (Postfix)
	id 3D133C4CEF0; Fri, 13 Jun 2025 17:40:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC3BBC4CEE3;
	Fri, 13 Jun 2025 17:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1749836426;
	bh=PQEZ7+xNhR314GCV4kEhN6OL+++qUbnhjGAWogS2pV4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=QBfNCbnxm75z+BtPvzbgFocXpp+L9a6BBxpvbJpLurhECqj9XWHKvmmbh9K3KrSdR
	 xuQj0fnnTREO7M7MZB2LerHu2UjTuTa8Iseqa8hCOYUMi1vjtVzqfv7cl4azq4srCB
	 xfv92Y2EqHYktbF+02J0zEcrlaMroLTIDHHaaTyY=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: tools@kernel.org
In-Reply-To: <cover.1749831371.git.u.kleine-koenig@baylibre.com>
References: <cover.1749831371.git.u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH wotmate v2 0/4] A random collection of patches to
 export-keyring
Message-Id: <174983642586.50046.16257482662016746109.b4-ty@linuxfoundation.org>
Date: Fri, 13 Jun 2025 13:40:25 -0400
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-220ba


On Fri, 13 Jun 2025 18:18:55 +0200, Uwe Kleine-König wrote:
> the only change since (implicit) v1 (available at
> https://lore.kernel.org/tools/ef678713de0a9aec1c1f07d92faa29e1f5b5e4e5.1749804735.git.u.kleine-koenig@baylibre.com
> ) is that I added an S-o-b line for me (thanks `git rebase --signoff`!)
> now that there is a DCO document for wotmate.
> 
> Best regards
> Uwe
> 
> [...]

Applied, thanks!

[1/4] export-keyring: Skip graph generation if the trust path didn't change
      commit: 30a9c74f47ac20b28fcd0e4e46de64dbdb7e14d8
[2/4] export-keyring: Improve logging
      commit: a2061c22a60fbd6d1721d642c8b48ca3fe0f560f
[3/4] export-keyring: Add cmdline option --verbose
      commit: dc807b9d40be0025eba7370d0fefab635547ce2b
[4/4] export-keyring: Add an option to ignore the linter check
      commit: 449d09274759e22ea0a31bd90015d8551e2dc16f

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

