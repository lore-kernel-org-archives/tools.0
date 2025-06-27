Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFCD22D3EF5
	for <tools@linux.kernel.org>; Fri, 27 Jun 2025 17:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751044196; cv=none; b=VdNtPqaCm/fb9fQMh9xGumfHzahXXz3TQUNH9eow1qW4t8w4H47+p0fjEWoimdWey6nXT2LX1iOwafiUnALToqqsthV0riixhVWlHYBOmm2kzuMCmuDfT2GgpcqO99t+jf97ag1b1RZcBfevqD6w8kuY5kuFKWW3E6dNzHXK5xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751044196; c=relaxed/simple;
	bh=wtLj1LfL+rEzjlCGgsBFFrJCJYqkPxt3c7OA2ac5sx8=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=EPkpjRLzlixQWSgydjAjmRJVFnPwf9on2j+T4sQIazR7djkhGfV8v1AKCPq5cQcymYcAjVG7tGD2TiJWtXC+mVyIHU9wN9G9jM/ePQiIn5lzdF54mGm1g6UI/pAgNums6ga3DHDycbs8F8uu3HCaGnnDVJDFqg1P667bh6XplJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GIl6Oj+J; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GIl6Oj+J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BC86C4CEE3;
	Fri, 27 Jun 2025 17:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751044196;
	bh=wtLj1LfL+rEzjlCGgsBFFrJCJYqkPxt3c7OA2ac5sx8=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=GIl6Oj+JNL9/x4YC54lqXOMAFZr6ysim4AOQFDBFUxOZUKZReBS4SUn5CPdGt6+wE
	 DhSaTT2BwSsiOBbnY+2DarKj8+FNncWzUdjcjO6e86ZGRFsHkxC+WrlnNNsFC4shYE
	 q7WgzYt784ig3KlPebDSciM/chiQy5IcfkRau/E/52toLvpGd6vXMy0N8btC4Q9g5s
	 +vnuXyvVzWRcWLYavT7u5kJmRrBWF7NNtF6iwGWvkD8+lBUr5dlYFnN+uAkryuoLD1
	 uCzwvU/wLR1lBPBeIgGM4JVDpltpbxqzzUIzkm95rtqUuz9n15Saanp7mNnjeVoGML
	 Gffk0OzzmQ98Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7532F380DBEE;
	Fri, 27 Jun 2025 17:10:23 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: Bugspray Bot <bugbot@kernel.org>
To: tools@linux.kernel.org, broonie@kernel.org, 
 konstantin@linuxfoundation.org, tools@kernel.org
Message-ID: <20250627-b220283-410cbe32ed4c@bugzilla.kernel.org>
In-Reply-To: <2491bc09-da6c-43dd-b8ce-e5c137294f68@sirena.org.uk>
References: <2491bc09-da6c-43dd-b8ce-e5c137294f68@sirena.org.uk>
Subject: Re: b4 trailers doesn't work with imported series
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: bugspray 0.1-dev
Date: Fri, 27 Jun 2025 17:10:23 +0000 (UTC)

Hello:

This conversation is now tracked by Kernel.org Bugzilla:
https://bugzilla.kernel.org/show_bug.cgi?id=220283

There is no need to do anything else, just keep talking.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)

