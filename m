Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB812165EA
	for <tools@linux.kernel.org>; Fri, 10 Apr 2026 14:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775831938; cv=none; b=k1z5dLbHUPZStQWXiH3TRBbZhfnPGyc6zJEfGFoQp4WephaLdLlen4W4XOeCimamkayNXj0RR3ZgxG5dOwqtQhxy6SV+Y4jSXsWLyoPaoPaPC3/FlXBRQX9vfp5aRLgmUjE45lnTJPSQ4ECq50nUGs1fNZzoKHZmQlkMwOiVmKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775831938; c=relaxed/simple;
	bh=4fqjC0g151Z9RKhc1WvFYKQrAuvNgU1GUcLU0cV9zKg=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ohydHaL+r1ggPqk2rJ0KiyNyQO944ZcFj+M3GWKPTPGscK6KSesLssXd7kBYED2efGThevNJBZ1uuKH7FPHvzR9mKAVjLG6EMT/lEyf3ue1C94nkApbS/GJwisEuyANyhZE9nw4MvpWNRBbK0s7OKi5smT9jZUcHQ2fU+W+d7AQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j7a2mJms; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j7a2mJms"
Received: by smtp.kernel.org (Postfix)
	id E638EC2BC9E; Fri, 10 Apr 2026 14:38:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3FC9C19421;
	Fri, 10 Apr 2026 14:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775831937;
	bh=4fqjC0g151Z9RKhc1WvFYKQrAuvNgU1GUcLU0cV9zKg=;
	h=Date:From:To:Subject:From;
	b=j7a2mJmsdDxljMCl5AzLv+daynVe8cSykbJ9GdSxv6VQ7vQU2sK4x2NjB0NhEfAe7
	 tIfFBjMnzhVoW45TWbA1A/FxpyiFN7ikTIJPlmMNX84xhPRdLg9+nGEvX6nP9J0dvX
	 7cMXTQddUi+q7oE0mXJQDzSL6tbwqXY1qi+4HzUTEiAkS9Lo7WCwyeZbtwBBUtoYhZ
	 UVdLu6yrUAJecbFQqPmBFtm96vYfawVlq4KTkVBJ0g55J8FJVVP2/F7PGPtuOG/Thl
	 QBkf/WsiqKrRCEgcHtvCLhyB5lRlfbzWOHkicIJdLeQW0zke0N84V8bRIp/S+imPAS
	 D2YEHjx+AUxVw==
Date: Fri, 10 Apr 2026 10:38:54 -0400
From: Konstantin Ryabitsev <mricon@kernel.org>
To: tools@kernel.org
Subject: patatt v0.7.1 released
Message-ID: <20260410-dramatic-ginger-boa-bbef09@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi, all:

A small bump release for patatt with a few fixes:

- Fix user.signingkey handling for SSH keys by checking gpg.format to
  determine the key type, instead of always assuming OpenPGP.
- Make install-hook work correctly in git submodules by using
  git rev-parse --git-dir instead of assuming .git
- Fix compatibility with Python versions before 3.13
- Fix typo in package classifier metadata.

Thanks:

- Bingwu Zhang
- Uwe Kleine-König

-- 
KR
